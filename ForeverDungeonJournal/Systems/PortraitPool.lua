


































local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

FDJ.PORTRAIT_LOAD_SECONDS = 3
FDJ.PORTRAIT_LIVE_MAX = 48
FDJ.PORTRAIT_IDLE_KEEP = 16
FDJ.PORTRAIT_SPARE_ROOM = 24

local pool = {}
local free = {}
local live = 0
local staging

local starved = setmetatable({}, { __mode = "k" })
local ticker = CreateFrame("Frame")
ticker:Hide()
local tickSince = 0

local function Wake()
    if next(starved) == nil then return end
    if tickSince < 0.4 then tickSince = 0.4 end
    ticker:Show()
end

local function Staging()
    if not staging then
        staging = CreateFrame("Frame", nil, UIParent)
        staging:SetSize(64, 64)






        staging:SetPoint("TOPLEFT", UIParent, "TOPRIGHT", 10000, 0)
        staging:Show()
    end
    return staging
end

local function Park(tex)
    tex:SetParent(Staging())
    tex:ClearAllPoints()
    tex:SetAllPoints(staging)
    tex:SetTexCoord(0, 1, 0, 1)
    tex:Show()
end

local function Now() return GetTime and GetTime() or 0 end


local useCount = 0
local function Used(tex) useCount = useCount + 1 tex.fdjUsedAt = useCount end


local function Visible(region)
    if not region or not region.IsVisible then return false end
    local ok, shown = pcall(region.IsVisible, region)
    return (ok and shown) and true or false
end


local function Starve(host)
    if not host or host.fdjWant == nil then return end
    starved[host] = true

    local parent = host.GetParent and host:GetParent()
    if parent and not parent.fdjPortraitWake and parent.HookScript then
        if pcall(parent.HookScript, parent, "OnShow", Wake) then parent.fdjPortraitWake = true end
    end
    ticker:Show()
end



local function Detach(tex)
    local host = tex.fdjHost
    if not host then return end
    tex.fdjHost = nil
    if host.fdjPooled == tex then
        host.fdjPooled = nil
        Starve(host)
    end
end


local function Evict(tex)
    Detach(tex)
    local list = tex.fdjDisplayID and pool[tex.fdjDisplayID]
    if list then
        for i = #list, 1, -1 do
            if list[i] == tex then table.remove(list, i) break end
        end
        if #list == 0 then pool[tex.fdjDisplayID] = nil end
    end
    pcall(tex.SetTexture, tex, nil)
    if tex.SetDesaturated then pcall(tex.SetDesaturated, tex, false) end
    tex:Hide()
    tex.fdjDisplayID, tex.fdjReadyAt, tex.fdjHost, tex.fdjUsedAt = nil, nil, nil, nil
    live = math.max(0, live - 1)
    free[#free + 1] = tex
end


local function OldestIdle()
    local oldest, count
    count = 0
    for _, list in pairs(pool) do
        for _, tex in ipairs(list) do
            if not tex.fdjHost then
                count = count + 1
                if not oldest or (tex.fdjUsedAt or 0) < (oldest.fdjUsedAt or 0) then oldest = tex end
            end
        end
    end
    return oldest, count
end


local function OldestHidden()
    local oldest
    for _, list in pairs(pool) do
        for _, tex in ipairs(list) do
            local host = tex.fdjHost
            if host and (not oldest or (tex.fdjUsedAt or 0) < (oldest.fdjUsedAt or 0)) and not Visible(host) then
                oldest = tex
            end
        end
    end
    return oldest
end


local function TrimIdle(keep)
    for _ = 1, 200 do
        local oldest, count = OldestIdle()
        if not oldest or count <= keep then return end
        Evict(oldest)
    end
end
FDJ.TrimPortraits = function(keep) TrimIdle(math.max(0, tonumber(keep) or 0)) end



local function MakeRoom()
    local max = FDJ.PORTRAIT_LIVE_MAX or 48
    if live < max then return true end
    local victim = (OldestIdle()) or OldestHidden()
    if victim then Evict(victim) end
    return live < max
end


local function Place(host)
    local tex = host.fdjPooled
    if not tex then return end
    if Now() < (tex.fdjReadyAt or 0) then return end
    local parent = host:GetParent()
    if not parent then return end
    tex:SetParent(parent)
    tex:ClearAllPoints()
    tex:SetAllPoints(host)
    local layer, sub = host:GetDrawLayer()
    if layer then tex:SetDrawLayer(layer, sub or 0) end
    tex:SetTexCoord(host:GetTexCoord())
    tex:SetAlpha(1)

    if tex.SetDesaturated and host.IsDesaturated then
        local ok, grey = pcall(host.IsDesaturated, host)
        pcall(tex.SetDesaturated, tex, (ok and grey) and true or false)
    end
    tex:SetShown(host:IsShown())
end





local function CreatePooled(displayID, list)
    if not MakeRoom() then return nil, "full" end
    local tex = table.remove(free) or Staging():CreateTexture(nil, "ARTWORK")
    Park(tex)

    FDJ.portraitRenders = (FDJ.portraitRenders or 0) + 1
    local ok = pcall(SetPortraitTextureFromCreatureDisplayID, tex, displayID)
    local shown = ok and tex:GetTexture() or nil
    if shown == nil or shown == 0 or shown == "" then
        pcall(tex.SetTexture, tex, nil)
        tex:Hide()
        free[#free + 1] = tex
        return nil, "none"
    end
    live = live + 1
    tex.fdjDisplayID = displayID
    tex.fdjReadyAt = Now() + (FDJ.PORTRAIT_LOAD_SECONDS or 0)
    Used(tex)
    list[#list + 1] = tex
    return tex
end





local function EnsureSpare(displayID, list)


    if FDJ.portraitNoSpare then return end
    if live >= (FDJ.PORTRAIT_SPARE_ROOM or 24) then return end
    for _, candidate in ipairs(list) do
        if not candidate.fdjHost then return end
    end
    CreatePooled(displayID, list)
end

function FDJ.ReleasePortrait(host)
    if not host then return end
    host.fdjWant, host.fdjWantAt = nil, nil
    starved[host] = nil
    local tex = host.fdjPooled
    if not tex then return end
    host.fdjPooled = nil
    tex.fdjHost = nil
    Used(tex)
    Park(tex)
    TrimIdle(FDJ.PORTRAIT_IDLE_KEEP or 16)
    Wake()
end







FDJ.ReleaseHiddenPortraits = function(root, keep)
    if not root then return end
    local drop = {}
    for _, list in pairs(pool) do
        for _, tex in ipairs(list) do
            local host = tex.fdjHost
            if host and not Visible(host) then
                local p, inside = host, false
                for _ = 1, 25 do
                    p = p.GetParent and p:GetParent() or nil
                    if not p then break end
                    if p == root then inside = true break end
                end
                if inside then drop[#drop + 1] = tex end
            end
        end
    end
    for _, tex in ipairs(drop) do
        Detach(tex)
        Used(tex)
        Park(tex)
    end
    TrimIdle(math.max(0, tonumber(keep) or 0))
end




FDJ.PortraitsLive = function() return live end
FDJ.PortraitStats = function()
    local _, idle = OldestIdle()
    local hidden, waiting = 0, 0
    for _, list in pairs(pool) do
        for _, tex in ipairs(list) do
            if tex.fdjHost and not Visible(tex.fdjHost) then hidden = hidden + 1 end
        end
    end
    for host in pairs(starved) do
        if host.fdjWant ~= nil and not host.fdjPooled then waiting = waiting + 1 end
    end
    return live, idle, hidden, waiting, (ticker:IsShown() and true or false)
end





local function Acquire(host, displayID)
    if type(displayID) ~= "number" or displayID <= 0 then return false end
    if type(SetPortraitTextureFromCreatureDisplayID) ~= "function" then return false end

    local current = host.fdjPooled
    if current and current.fdjDisplayID == displayID then
        host.fdjWant, host.fdjWantAt = displayID, Now()
        starved[host] = nil
        Used(current)
        Place(host)
        return true
    end

    if current then
        host.fdjPooled = nil
        current.fdjHost = nil
        Used(current)
        Park(current)
    end

    local list = pool[displayID]
    if not list then list = {} pool[displayID] = list end
    local tex
    for _, candidate in ipairs(list) do
        if not candidate.fdjHost then tex = candidate break end
    end
    if not tex then


        for _, candidate in ipairs(list) do
            local other = candidate.fdjHost
            if other and other ~= host and not Visible(other) then
                Detach(candidate)
                tex = candidate
                break
            end
        end
    end
    local why
    if not tex then tex, why = CreatePooled(displayID, list) end
    if not tex then
        if #list == 0 then pool[displayID] = nil end
        local now = Now()
        if why == "full" then




            if host.fdjWant == nil or host.fdjWantAt ~= now then host.fdjWant = displayID end
            host.fdjWantAt = now
            Starve(host)
        elseif host.fdjWantAt ~= now then


            host.fdjWant, host.fdjWantAt = nil, nil
            starved[host] = nil
        end
        if current then TrimIdle(FDJ.PORTRAIT_IDLE_KEEP or 16) end
        return false
    end

    host.fdjWant, host.fdjWantAt = displayID, Now()
    starved[host] = nil
    tex.fdjHost = host
    Used(tex)
    host.fdjPooled = tex
    host:SetTexture(nil)
    EnsureSpare(displayID, list)
    if current then TrimIdle(FDJ.PORTRAIT_IDLE_KEEP or 16) end

    local wait = (tex.fdjReadyAt or 0) - Now()
    if wait > 0 and C_Timer and C_Timer.After then
        C_Timer.After(wait + 0.05, function()
            if host.fdjPooled == tex then pcall(Place, host) end
        end)
    else
        tex.fdjReadyAt = 0
        Place(host)
    end
    return true
end
FDJ.AcquirePortrait = function(host, displayID)
    local shown = Acquire(host, displayID)
    Wake()
    return shown
end




do
    local waiting = {}
    ticker:SetScript("OnUpdate", function(self, elapsed)
        tickSince = tickSince + (elapsed or 0)
        if tickSince < 0.5 then return end
        tickSince = 0
        local count = 0
        for host in pairs(starved) do
            count = count + 1
            waiting[count] = host
        end
        local onScreen = 0
        for i = 1, count do
            local host = waiting[i]
            waiting[i] = nil
            local want = host.fdjWant
            if want == nil or host.fdjPooled then
                starved[host] = nil
            elseif Visible(host) then
                local ok, got = pcall(Acquire, host, want)
                if not ok then
                    starved[host] = nil
                elseif not got and starved[host] then
                    onScreen = onScreen + 1
                end
            end
        end
        if onScreen == 0 then self:Hide() end
    end)
end



do
    local watch = CreateFrame("Frame")
    watch:RegisterEvent("PLAYER_LEAVING_WORLD")
    watch:SetScript("OnEvent", function()
        local hidden = {}
        for _, list in pairs(pool) do
            for _, tex in ipairs(list) do
                if tex.fdjHost and not Visible(tex.fdjHost) then hidden[#hidden + 1] = tex end
            end
        end
        for _, tex in ipairs(hidden) do
            Detach(tex)
            Used(tex)
            Park(tex)
        end
        pcall(TrimIdle, 0)
    end)
end
