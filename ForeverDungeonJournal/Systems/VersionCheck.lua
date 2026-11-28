local ADDON_NAME, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS











local PREFIX = "DJournalVer"
local SEND_THROTTLE = 10
local CHAT_TAG = "|cffd8a83cDungeonJournal|r "

local notified = false




local REMEMBER_FOR = 3 * 24 * 60 * 60
local function Now() return (time and time()) or 0 end
local lastSent = {}
local pendingReply = {}
local lastGroupSize = 0

local function L(key, ...)
    if FDJ and FDJ.L then return FDJ.L(key, ...) end
    return key
end

local function MyVersion()
    local version
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version")
    elseif GetAddOnMetadata then
        version = GetAddOnMetadata(ADDON_NAME, "Version")
    end
    return version and tostring(version) or nil
end



local function ParseVersion(text)
    if type(text) ~= "string" or #text > 16 then return nil end
    local a, b, c = text:match("^(%d+)%.(%d+)%.(%d+)$")
    if not a then
        a, b = text:match("^(%d+)%.(%d+)$")
        c = "0"
    end
    if not a then return nil end
    a, b, c = tonumber(a), tonumber(b), tonumber(c)
    if not a or not b or not c or a > 99 or b > 999 or c > 999 then return nil end
    return { a, b, c }
end

local function IsNewer(candidate, current)
    for i = 1, 3 do
        if candidate[i] ~= current[i] then
            return candidate[i] > current[i]
        end
    end
    return false
end

local function Notify(newVersion)
    if notified then return end
    notified = true
    FDJ.ChatLine(CHAT_TAG .. L("UPDATE_AVAILABLE", tostring(newVersion), MyVersion() or "?"))
end

local function Send(channel)
    local version = MyVersion()
    if not version or not ParseVersion(version) then return end

    local now = GetTime and GetTime() or 0
    if lastSent[channel] and now - lastSent[channel] < SEND_THROTTLE then return end
    lastSent[channel] = now

    if C_ChatInfo and C_ChatInfo.SendAddonMessage then
        pcall(C_ChatInfo.SendAddonMessage, PREFIX, version, channel)
    elseif SendAddonMessage then
        pcall(SendAddonMessage, PREFIX, version, channel)
    end
end

local function Broadcast()
    if IsInGuild and IsInGuild() then
        Send("GUILD")
    end

    if not IsInGroup then return end
    local home = LE_PARTY_CATEGORY_HOME
    local instance = LE_PARTY_CATEGORY_INSTANCE
    if instance and IsInGroup(instance) then
        Send("INSTANCE_CHAT")
    end
    if IsInRaid and IsInRaid(home) then
        Send("RAID")
    elseif IsInGroup(home) then
        Send("PARTY")
    end
end




local function ScheduleReply(channel)
    if pendingReply[channel] then return end
    if not (C_Timer and C_Timer.After) then
        Send(channel)
        return
    end
    pendingReply[channel] = true
    C_Timer.After(1 + math.random() * 4, function()
        if pendingReply[channel] then
            pendingReply[channel] = nil
            Send(channel)
        end
    end)
end

local function OnAddonMessage(prefix, text, channel)
    if prefix ~= PREFIX then return end

    local theirs = ParseVersion(text)
    local mine = ParseVersion(MyVersion() or "")
    if not theirs or not mine then return end

    if IsNewer(mine, theirs) then
        if channel == "GUILD" or channel == "PARTY" or channel == "RAID" or channel == "INSTANCE_CHAT" then
            ScheduleReply(channel)
        end
        return
    end


    pendingReply[channel] = nil

    if IsNewer(theirs, mine) then
        local db = ForeverDungeonJournalDB
        if type(db) == "table" then
            local known = ParseVersion(db.newestSeenVersion)
            if not known or IsNewer(theirs, known) then
                db.newestSeenVersion = text
                db.newestSeenAt = Now()
            elseif not IsNewer(known, theirs) then
                db.newestSeenAt = Now()
            end
        end
        Notify(text)
    end
end

local function LoginChecks()

    local db = ForeverDungeonJournalDB
    local mine = ParseVersion(MyVersion() or "")
    if type(db) == "table" and mine then
        local known = ParseVersion(db.newestSeenVersion)
        local heardAt = tonumber(db.newestSeenAt)
        local recent = heardAt and Now() - heardAt < REMEMBER_FOR
        if known and IsNewer(known, mine) and recent then
            Notify(db.newestSeenVersion)
        else
            db.newestSeenVersion = nil
            db.newestSeenAt = nil
        end
    end

    Broadcast()
end

local events = CreateFrame("Frame")
for _, event in ipairs({ "PLAYER_LOGIN", "CHAT_MSG_ADDON", "GROUP_ROSTER_UPDATE" }) do
    pcall(events.RegisterEvent, events, event)
end

events:SetScript("OnEvent", function(_, event, ...)
    if event == "CHAT_MSG_ADDON" then
        OnAddonMessage(...)
        return
    end

    if event == "PLAYER_LOGIN" then
        if C_ChatInfo and C_ChatInfo.RegisterAddonMessagePrefix then
            pcall(C_ChatInfo.RegisterAddonMessagePrefix, PREFIX)
        elseif RegisterAddonMessagePrefix then
            pcall(RegisterAddonMessagePrefix, PREFIX)
        end
        lastGroupSize = GetNumGroupMembers and GetNumGroupMembers() or 0

        if C_Timer and C_Timer.After then
            C_Timer.After(8, LoginChecks)
        else
            LoginChecks()
        end
        return
    end

    if event == "GROUP_ROSTER_UPDATE" then
        local size = GetNumGroupMembers and GetNumGroupMembers() or 0
        if size > lastGroupSize then
            Broadcast()
        end
        lastGroupSize = size
    end
end)
