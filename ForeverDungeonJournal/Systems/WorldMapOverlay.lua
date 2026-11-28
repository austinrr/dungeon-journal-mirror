



local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local function L(key, ...)
    if FDJ.L then return FDJ.L(key, ...) end
    return key
end

local attached = false
local PlaceToggle
local saved
local wantWorld = false
local toggle, backdrop
local RaiseOverlay








local LEVEL_FLOOR, LEVEL_CAP = 9300, 9600


local keepWithJournal = false









local DM_WINGS = { "Dire Maul: East", "Dire Maul: West", "Dire Maul: North" }
local dmView
local dmGuess = false
local wingHint
do
    local strings = {
        enUS = "Pick your wing", deDE = "Wähle deinen Flügel", frFR = "Choisissez votre aile",
        esES = "Elige tu ala", esMX = "Elige tu ala", itIT = "Scegli la tua ala", ptBR = "Escolha sua ala",
        ruRU = "Выберите своё крыло", koKR = "현재 구역을 선택하세요", zhCN = "选择你所在的区域", zhTW = "選擇你所在的區域",
    }
    for locale, text in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.WM_PICK_WING == nil then t.WM_PICK_WING = text end
    end
end
local function InDireMaul()
    if type(IsInInstance) == "function" then
        local ok, inside = pcall(IsInInstance)
        if ok and not inside then return false end
    end
    if type(GetInstanceInfo) ~= "function" then return false end
    local ok, id = pcall(function() return select(8, GetInstanceInfo()) end)
    return ok and tonumber(id) == 429
end
local function IsDireMaulWing(name)
    for _, w in ipairs(DM_WINGS) do if w == name then return true end end
    return false
end

local function Enabled()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    return ForeverDungeonJournalDB.worldMapOverlay ~= false
end

local function Journal() return _G.ForeverDungeonJournalFrame end

local function Detach()
    if not attached then return end
    attached = false
    local journal = Journal()
    local panel = journal and journal.dungeonMapPanel
    if panel and saved then
        panel:Hide()
        panel:SetParent(saved.parent)
        panel:ClearAllPoints()
        for _, p in ipairs(saved.points) do panel:SetPoint(p[1], p[2], p[3], p[4], p[5]) end
        if saved.strata then panel:SetFrameStrata(saved.strata) end
        if saved.level then panel:SetFrameLevel(saved.level) end
    end
    saved = nil
    if backdrop then backdrop:Hide() end
end

local function Attach(dungeonName)
    local journal = Journal()
    local panel = journal and journal.dungeonMapPanel
    local mapData = FDJ.DUNGEON_MAPS and FDJ.DUNGEON_MAPS[dungeonName]
    if not panel or not mapData or not WorldMapFrame then return false end
    if journal:IsShown() and not keepWithJournal then return false end

    if FDJ.SetMapDungeon then FDJ.SetMapDungeon(dungeonName) end

    local host = WorldMapFrame.ScrollContainer or WorldMapFrame
    if not attached then
        saved = { parent = panel:GetParent(), points = {}, strata = panel:GetFrameStrata(), level = panel:GetFrameLevel() }
        for i = 1, panel:GetNumPoints() do
            local a, rel, b, x, y = panel:GetPoint(i)
            saved.points[#saved.points + 1] = { a, rel, b, x, y }
        end
    end
    attached = true

    if not backdrop then
        backdrop = CreateFrame("Frame", nil, WorldMapFrame)
        local tex = backdrop:CreateTexture(nil, "BACKGROUND")
        tex:SetAllPoints()
        tex:SetColorTexture(0.03, 0.025, 0.02, 1)
        backdrop:EnableMouse(true)
    end
    backdrop:ClearAllPoints()
    backdrop:SetAllPoints(host)
    backdrop:SetFrameStrata(WorldMapFrame:GetFrameStrata())


    local top = host.GetFrameLevel and host:GetFrameLevel() or 1
    local function Scan(f, depth)
        if not f or depth > 4 or not f.GetChildren then return end
        for _, child in ipairs({ f:GetChildren() }) do
            if child ~= backdrop and child.GetFrameLevel then
                local ok, lvl = pcall(child.GetFrameLevel, child)
                if ok and type(lvl) == "number" and lvl > top then top = lvl end
                Scan(child, depth + 1)
            end
        end
    end
    pcall(Scan, host, 1)
    backdrop:SetFrameLevel(math.max(LEVEL_FLOOR, math.min(top + 20, LEVEL_CAP)))
    backdrop:Show()

    panel:SetParent(backdrop)


    if not panel.fdjWorldMapHideHook then
        panel.fdjWorldMapHideHook = true
        panel:HookScript("OnHide", function(self)
            if not attached then return end
            if C_Timer and C_Timer.After then
                C_Timer.After(0, function() if attached and self:GetParent() == backdrop then self:Show() end end)
            end
        end)
    end
    panel:ClearAllPoints()
    panel:SetAllPoints(backdrop)
    panel:SetFrameLevel(backdrop:GetFrameLevel() + 1)
    panel:Show()


    if RaiseOverlay then
        pcall(RaiseOverlay)
        if C_Timer and C_Timer.After then
            for _, wait in ipairs({ 0.1, 0.5, 1.5 }) do
                C_Timer.After(wait, function() if attached then pcall(RaiseOverlay) end end)
            end
        end
    end



    if not FDJ.worldMapRightClickHooked then
        FDJ.worldMapRightClickHooked = true
        local function OnRightClick(_, button)
            if button ~= "RightButton" or not attached then return end
            wantWorld = true
            if not pcall(FDJ.RefreshWorldMapOverlay) then pcall(Detach) end
        end
        for _, target in ipairs({ backdrop, panel, journal.dungeonMapCanvas, journal.dungeonMapArtHolder }) do
            if target and target.HookScript then
                pcall(target.HookScript, target, "OnMouseUp", OnRightClick)
            end
        end
    end
    if FDJ.SetupDungeonMapZoom then FDJ.SetupDungeonMapZoom() end
    if FDJ.ResetDungeonMapView then FDJ.ResetDungeonMapView() end
    local floor = FDJ.SavedMapFloor and FDJ.SavedMapFloor(dungeonName, mapData)
        or (mapData.entrance and mapData.entrance.floor) or 1
    FDJ.RenderCustomDungeonMap(mapData, floor)
    return true
end










local wingButtons = {}
local PlaceWingButtons
local function UpdateWingButtons(dungeonName)
    local inScarlet = false
    if FDJ.InScarletMonastery then
        local ok, value = pcall(FDJ.InScarletMonastery)
        inScarlet = ok and value or false
    end
    local inDM = not inScarlet and InDireMaul()
    local journal = Journal()
    local panel = journal and journal.dungeonMapPanel
    local show = (inScarlet or inDM) and dungeonName and Enabled() and not wantWorld and attached and panel
    local shown = {}
    local wings = inDM and DM_WINGS or FDJ.SCARLET_WINGS or {}
    for i = #wings + 1, #wingButtons do wingButtons[i]:Hide() end
    for i, wing in ipairs(wings) do
        local button = wingButtons[i]
        if show and not button then
            button = CreateFrame("Button", nil, WorldMapFrame, "UIPanelButtonTemplate")
            FDJ.OwnFonts(button)
            button:SetSize(110, 22)
            button:SetFrameStrata("HIGH")
            button:SetScript("OnClick", function(self)
                if IsDireMaulWing(self.fdjWing) then
                    dmView = self.fdjWing
                    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
                    ForeverDungeonJournalDB.dmMapWing = self.fdjWing
                    pcall(FDJ.RefreshWorldMapOverlay)
                elseif FDJ.PickScarletMapWing then FDJ.PickScarletMapWing(self.fdjWing)
                elseif FDJ.SetScarletWing then FDJ.SetScarletWing(self.fdjWing) end
            end)
            wingButtons[i] = button
        end
        if button then
            if show then
                local label = FDJ.LocalizeDungeonName and FDJ.LocalizeDungeonName(wing) or wing

                label = type(label) == "string" and (label:match("[:：]%s*(.+)$")
                    or label:match("%s%-%s+(.+)$") or label:match("%s\226\128\147%s+(.+)$") or label) or wing
                button.fdjWing = wing
                button:SetText(label)
                local fs = button.GetFontString and button:GetFontString()
                button:SetSize(math.max(90, math.ceil(((fs and fs:GetStringWidth()) or 70) + 24)), 22)
                if backdrop then button:SetFrameStrata(backdrop:GetFrameStrata()) end
                button:SetFrameLevel(panel:GetFrameLevel() + 40)
                if button.SetEnabled then button:SetEnabled(wing ~= dungeonName) end
                button:Show()
                shown[#shown + 1] = button
            else
                button:Hide()
            end
        end
    end
    if #shown > 0 and PlaceWingButtons then
        PlaceWingButtons(shown, panel)

        if C_Timer and C_Timer.After then C_Timer.After(0.2, function() pcall(PlaceWingButtons, shown, panel) end) end
    end

    if inDM and dmGuess and show and shown[1] then
        if not wingHint then
            wingHint = WorldMapFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            wingHint:SetShadowOffset(1, -1)
        end
        local holder = shown[1]
        wingHint:SetParent(holder)
        wingHint:SetDrawLayer("OVERLAY")
        wingHint:ClearAllPoints()
        wingHint:SetPoint("LEFT", holder, "RIGHT", 8, 0)
        wingHint:SetText(L("WM_PICK_WING"))
        wingHint:Show()
    elseif wingHint then
        wingHint:Hide()
    end
end




local function ScreenRect(f)
    if not f or not f.GetRect then return nil end
    local l, b, w, h = f:GetRect()
    if not l or not w or w <= 0 or h <= 0 then return nil end
    local s = f:GetEffectiveScale() or 1
    return l * s, b * s, (l + w) * s, (b + h) * s
end

local function IsOurs(f)
    if f == toggle or f == backdrop then return true end
    local journal = Journal()
    for _, b in ipairs((journal and journal.dungeonMapFloorButtons) or {}) do if f == b then return true end end
    for _, b in ipairs(wingButtons) do if f == b then return true end end
    return false
end











local STRATA = { "BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG" }
local STRATA_RANK = {}
for i, s in ipairs(STRATA) do STRATA_RANK[s] = i end
local function ButtonStrata()
    local s = backdrop and backdrop:GetFrameStrata()
    if s and (STRATA_RANK[s] or 0) > STRATA_RANK.HIGH then return s end
    return "HIGH"
end
RaiseOverlay = function()
    if not (attached and backdrop and WorldMapFrame) then return end
    local journal = Journal()
    local panel = journal and journal.dungeonMapPanel
    local host = WorldMapFrame.ScrollContainer or WorldMapFrame
    local rank = STRATA_RANK[WorldMapFrame:GetFrameStrata()] or STRATA_RANK.HIGH
    local top = host.GetFrameLevel and host:GetFrameLevel() or 1
    local hl, hb, hr, ht = ScreenRect(host)
    local area = hl and (hr - hl) * (ht - hb) or 0
    local function Look(f)
        if not f or f == backdrop or f == panel or IsOurs(f) then return false end
        local ok, shown = pcall(f.IsShown, f)
        if not (ok and shown) then return false end
        local okL, lvl = pcall(f.GetFrameLevel, f)
        if okL and type(lvl) == "number" and lvl > top then top = lvl end

        local okS, s = pcall(f.GetFrameStrata, f)
        local r = okS and STRATA_RANK[s]
        if r and r > rank and area > 0 then
            local l, b, rr, t = ScreenRect(f)
            if l and (math.min(rr, hr) - math.max(l, hl)) * (math.min(t, ht) - math.max(b, hb)) >= area * 0.5 then
                rank = r
            end
        end
        return true
    end
    local function Scan(f, depth)
        if not f or depth > 4 or not f.GetChildren then return end
        for _, child in ipairs({ f:GetChildren() }) do
            if Look(child) then Scan(child, depth + 1) end
        end
    end
    pcall(Scan, host, 1)
    if host ~= WorldMapFrame and WorldMapFrame.GetChildren then
        for _, child in ipairs({ WorldMapFrame:GetChildren() }) do
            if child ~= host and child ~= WorldMapFrame.BorderFrame then pcall(Look, child) end
        end
    end
    local strata = STRATA[rank] or WorldMapFrame:GetFrameStrata()
    backdrop:SetFrameStrata(strata)
    backdrop:SetFrameLevel(math.max(LEVEL_FLOOR, math.min(top + 20, LEVEL_CAP)))
    if panel and panel:GetParent() == backdrop then
        panel:SetFrameStrata(strata)
        panel:SetFrameLevel(backdrop:GetFrameLevel() + 1)
    end
    if toggle then
        toggle:SetFrameStrata(ButtonStrata())
        toggle:SetFrameLevel(backdrop:GetFrameLevel() + 50)
    end
    for _, b in ipairs(wingButtons) do
        b:SetFrameStrata(strata)
        if panel then b:SetFrameLevel(panel:GetFrameLevel() + 40) end
    end
end

local function BlockingFrame()
    local tl, tb, tr, tt = ScreenRect(toggle)
    if not tl then return nil end
    local parents = { WorldMapFrame, WorldMapFrame.ScrollContainer, WorldMapFrame.BorderFrame }
    local best, bestRight
    for _, parent in ipairs(parents) do
        if parent and parent.GetChildren then
            for _, child in ipairs({ parent:GetChildren() }) do
                if not IsOurs(child) and child.IsVisible and child:IsVisible() then
                    local l, b, r, top = ScreenRect(child)

                    if l and (r - l) <= 220 and (top - b) <= 80
                        and l < tr and r > tl and b < tt and top > tb then
                        if not bestRight or r > bestRight then best, bestRight = child, r end
                    end
                end
            end
        end
    end
    return best, bestRight
end

PlaceToggle = function()
    if not toggle or not WorldMapFrame then return end
    local host = WorldMapFrame.ScrollContainer or WorldMapFrame
    local offset = -8
    toggle:ClearAllPoints()
    toggle:SetPoint("TOPRIGHT", host, "TOPRIGHT", offset, -8)
    for _ = 1, 6 do
        local blocker = BlockingFrame()
        if not blocker then break end
        local _, _, tr = ScreenRect(toggle)
        local bl = ScreenRect(blocker)
        if not tr or not bl then break end
        local scale = toggle:GetEffectiveScale() or 1
        offset = offset - ((tr - bl) / scale) - 4
        toggle:ClearAllPoints()
        toggle:SetPoint("TOPRIGHT", host, "TOPRIGHT", offset, -8)
    end
end






local function FloorBlocker(buttons)
    local parents = { WorldMapFrame, WorldMapFrame.ScrollContainer, WorldMapFrame.BorderFrame }
    local best, bestRight
    for _, btn in ipairs(buttons) do
        local bl, bb, br, bt = ScreenRect(btn)
        if bl then
            for _, parent in ipairs(parents) do
                if parent and parent.GetChildren then
                    for _, child in ipairs({ parent:GetChildren() }) do
                        if not IsOurs(child) and child.IsVisible and child:IsVisible() then
                            local l, b, r, top = ScreenRect(child)
                            if l and (r - l) <= 220 and (top - b) <= 80
                                and l < br and r > bl and b < bt and top > bb then
                                if not bestRight or r > bestRight then best, bestRight = child, r end
                            end
                        end
                    end
                end
            end
        end
    end
    return best, bestRight
end

function FDJ.PlaceMapFloorButtons()
    local journal = Journal()
    local panel = journal and journal.dungeonMapPanel
    local all = journal and journal.dungeonMapFloorButtons
    if not (attached and panel and all and WorldMapFrame) then return end
    local buttons = {}
    for _, btn in ipairs(all) do if btn:IsShown() then buttons[#buttons + 1] = btn end end
    if #buttons == 0 then return end
    local x = 10
    local function Put()
        for i, btn in ipairs(buttons) do
            btn:ClearAllPoints()
            btn:SetPoint("TOPLEFT", panel, "TOPLEFT", x, -10 - (i - 1) * 24)
        end
    end
    Put()
    for _ = 1, 6 do
        local _, right = FloorBlocker(buttons)
        if not right then break end
        local bl = ScreenRect(buttons[1])
        if not bl then break end
        local scale = buttons[1]:GetEffectiveScale() or 1
        x = x + (right - bl) / scale + 4
        Put()
    end
end



local function WingBlockers(buttons, panel)
    local list = {}
    for _, parent in ipairs({ WorldMapFrame, WorldMapFrame.ScrollContainer, WorldMapFrame.BorderFrame }) do
        if parent and parent.GetChildren then
            for _, child in ipairs({ parent:GetChildren() }) do list[#list + 1] = child end
        end
    end
    local journal = Journal()
    for _, m in ipairs((journal and journal.dungeonMapBossMarkers) or {}) do list[#list + 1] = m end
    for _, b in ipairs((journal and journal.dungeonMapFloorButtons) or {}) do list[#list + 1] = b end
    if panel then
        list[#list + 1] = panel.fdjBossSizer
        list[#list + 1] = panel.fdjQuestToggle
    end
    local lowest, lowestBottom
    for _, btn in ipairs(buttons) do
        local bl, bb, br, bt = ScreenRect(btn)
        if bl then
            for _, child in ipairs(list) do
                local mine = false
                for _, w in ipairs(wingButtons) do if child == w then mine = true end end
                if child and not mine and child ~= toggle and child ~= backdrop and child.IsVisible and child:IsVisible() then
                    local l, b, r, top = ScreenRect(child)
                    if l and (r - l) <= 220 and (top - b) <= 120
                        and l < br and r > bl and b < bt and top > bb then
                        if not lowestBottom or b < lowestBottom then lowest, lowestBottom = child, b end
                    end
                end
            end
        end
    end
    return lowest, lowestBottom
end

PlaceWingButtons = function(buttons, panel)
    if not (panel and buttons[1]) then return end
    local x, y = 10, -10

    local journal = Journal()
    local floors = 0
    for _, b in ipairs((journal and journal.dungeonMapFloorButtons) or {}) do
        if b:IsShown() then floors = floors + 1 end
    end
    if floors > 0 then y = -10 - floors * 24 - 8 end
    local function Put()
        for i, b in ipairs(buttons) do
            b:ClearAllPoints()
            b:SetPoint("TOPLEFT", panel, "TOPLEFT", x, y - (i - 1) * 24)
        end
    end
    Put()
    local panelBottom = select(2, ScreenRect(panel))
    for _ = 1, 10 do
        local blocker, bottom = WingBlockers(buttons, panel)
        if not blocker then break end
        local _, _, _, top = ScreenRect(buttons[1])
        if not top then break end
        local scale = buttons[1]:GetEffectiveScale() or 1
        local nextY = y - ((top - bottom) / scale) - 4

        local _, lastBottom = ScreenRect(buttons[#buttons])
        if panelBottom and lastBottom and lastBottom - (top - bottom) - 4 * scale < panelBottom then break end
        y = nextY
        Put()
    end
end

local function UpdateToggle(dungeonName)
    if not WorldMapFrame then return end
    if not toggle then
        toggle = CreateFrame("Button", "ForeverDungeonJournalWorldMapToggle", WorldMapFrame, "UIPanelButtonTemplate")
        FDJ.OwnFonts(toggle)
        toggle:SetSize(130, 22)
        toggle:SetPoint("TOPRIGHT", WorldMapFrame.ScrollContainer or WorldMapFrame, "TOPRIGHT", -8, -8)
        toggle:SetFrameStrata("HIGH")
        toggle:SetScript("OnClick", function()
            wantWorld = not wantWorld
            local ok = pcall(FDJ.RefreshWorldMapOverlay)
            if not ok then Detach() end
        end)
    end
    if dungeonName and Enabled() then
        toggle:SetText(wantWorld and L("WM_DUNGEON_MAP") or L("WM_WORLD_MAP"))
        PlaceToggle()


        if C_Timer and C_Timer.After then C_Timer.After(0.2, function() pcall(PlaceToggle) end) end
        toggle:SetFrameStrata(ButtonStrata())
        toggle:SetFrameLevel(((backdrop and backdrop:GetFrameLevel()) or 1) + 50)
        toggle:Show()
    else
        toggle:Hide()
    end
    pcall(UpdateWingButtons, dungeonName)
end

function FDJ.RefreshWorldMapOverlay()
    if not WorldMapFrame or not WorldMapFrame:IsShown() then Detach() return end
    local dungeonName = FDJ.CurrentDungeon and FDJ.CurrentDungeon()

    do
        local view = FDJ.ScarletMapView and FDJ.ScarletMapView()
        if view and FDJ.DUNGEON_MAPS and FDJ.DUNGEON_MAPS[view] then dungeonName = view end
    end

    dmGuess = false
    if InDireMaul() then
        if dmView then
            dmGuess = not IsDireMaulWing(dungeonName)
            dungeonName = dmView
        elseif not IsDireMaulWing(dungeonName) then
            local kept = ForeverDungeonJournalDB and ForeverDungeonJournalDB.dmMapWing
            dungeonName = IsDireMaulWing(kept) and kept or DM_WINGS[1]
            dmGuess = true
        end
    end

    if not dungeonName or not (FDJ.DUNGEON_MAPS and FDJ.DUNGEON_MAPS[dungeonName]) or not Enabled()
        or (FDJ.IsDungeonMapLocked and FDJ.IsDungeonMapLocked(dungeonName)) then
        Detach()
        UpdateToggle(nil)
        return
    end
    if wantWorld then
        Detach()
    elseif not Attach(dungeonName) then
        Detach()
    end
    UpdateToggle(dungeonName)
end

local reportedError = false
local function Safe()
    local ok, err = pcall(FDJ.RefreshWorldMapOverlay)
    if not ok then
        pcall(Detach)

        if not reportedError then
            reportedError = true
            FDJ.ChatLine("|cffffd100Dungeon Journal|r map error: " .. tostring(err))
        end
    end
end

local watcher = CreateFrame("Frame")
watcher:RegisterEvent("PLAYER_LOGIN")
watcher:RegisterEvent("PLAYER_ENTERING_WORLD")
watcher:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_ENTERING_WORLD" then
        wantWorld = false
        dmView = nil
        if WorldMapFrame and WorldMapFrame:IsShown() then Safe() end
        return
    end
    if WorldMapFrame and WorldMapFrame.HookScript and not FDJ.worldMapHooked then
        FDJ.worldMapHooked = true
        WorldMapFrame:HookScript("OnShow", Safe)
        WorldMapFrame:HookScript("OnHide", function() keepWithJournal = false; pcall(Detach) end)
    end
    local journal = Journal()
    if journal and journal.HookScript and not FDJ.worldMapJournalHooked then
        FDJ.worldMapJournalHooked = true

        journal:HookScript("OnShow", function()
            if keepWithJournal then return end
            pcall(Detach)
            if toggle and WorldMapFrame and WorldMapFrame:IsShown() then pcall(UpdateToggle, nil) end
        end)
        journal:HookScript("OnHide", function()
            keepWithJournal = false
            if WorldMapFrame and WorldMapFrame:IsShown() then Safe() end
        end)
    end
end)



function FDJ.IsWorldMapOverlayAttached() return attached end
function FDJ.OpenBossFromWorldMap(dungeonName, bossIndex)
    if not dungeonName or not bossIndex then return end
    keepWithJournal = true
    local journal = Journal()
    if journal and not journal:IsShown() then journal:Show() end
    local function open()
        if FDJ.OpenBossPage then pcall(FDJ.OpenBossPage, dungeonName, bossIndex) end

        if WorldMapFrame and WorldMapFrame:IsShown() then pcall(FDJ.RefreshWorldMapOverlay) end
    end
    open()

    if C_Timer and C_Timer.After then C_Timer.After(0.05, open) end
end



function FDJ.OpenQuestFromWorldMap(dungeonName, questID, stepID)
    if not dungeonName or not questID then return end
    keepWithJournal = true
    local journal = Journal()
    if journal and not journal:IsShown() then journal:Show() end
    local function open()
        if stepID and FDJ.OpenQuestChainStep then
            pcall(FDJ.OpenQuestChainStep, dungeonName, questID, stepID)
        elseif FDJ.OpenQuestPage then
            pcall(FDJ.OpenQuestPage, dungeonName, questID)
        end
        if WorldMapFrame and WorldMapFrame:IsShown() then pcall(FDJ.RefreshWorldMapOverlay) end
    end
    open()
    if C_Timer and C_Timer.After then C_Timer.After(0.05, open) end
end


function FDJ.DetachWorldMapOverlay()
    keepWithJournal = false
    Detach()
end


function FDJ.ToggleWorldMapOverlay()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    ForeverDungeonJournalDB.worldMapOverlay = not Enabled()
    Safe()
    return Enabled()
end
