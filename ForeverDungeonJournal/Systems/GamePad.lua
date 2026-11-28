
































local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local frame
local catcher
local cursor
local hint
local focus
local padActive
local padTest
local registered
local pausedByGame
local handedOff

do
    local strings = {
        enUS = { PAD_OPEN = "Open", PAD_BACK = "Back", PAD_TABS = "Map · Bosses · Quests", PAD_SCROLL = "Scroll", PAD_FAV = "Favourite", PAD_CLOSE = "Close", MAP_PAD_MARKED = "marked %s on the map. Open your map to see it.", MAP_PAD_ELSEWHERE = "marked %s on the map. The map shows the zone you are in: go to that zone on the map to see it." },
        deDE = { PAD_OPEN = "Öffnen", PAD_BACK = "Zurück", PAD_TABS = "Karte · Bosse · Quests", PAD_SCROLL = "Scrollen", PAD_FAV = "Favorit", PAD_CLOSE = "Schließen", MAP_PAD_MARKED = "%s auf der Karte markiert. Öffne deine Karte, um es zu sehen.", MAP_PAD_ELSEWHERE = "%s auf der Karte markiert. Die Karte zeigt die Zone, in der du bist: Wechsle auf der Karte zu dieser Zone, um es zu sehen." },
        frFR = { PAD_OPEN = "Ouvrir", PAD_BACK = "Retour", PAD_TABS = "Carte · Boss · Quêtes", PAD_SCROLL = "Défiler", PAD_FAV = "Favori", PAD_CLOSE = "Fermer", MAP_PAD_MARKED = "%s marqué sur la carte. Ouvrez votre carte pour le voir.", MAP_PAD_ELSEWHERE = "%s marqué sur la carte. La carte montre la zone où vous êtes : allez sur cette zone dans la carte pour le voir." },
        esES = { PAD_OPEN = "Abrir", PAD_BACK = "Atrás", PAD_TABS = "Mapa · Jefes · Misiones", PAD_SCROLL = "Desplazar", PAD_FAV = "Favorito", PAD_CLOSE = "Cerrar", MAP_PAD_MARKED = "%s marcado en el mapa. Abre tu mapa para verlo.", MAP_PAD_ELSEWHERE = "%s marcado en el mapa. El mapa muestra la zona en la que estás: ve a esa zona en el mapa para verlo." },
        itIT = { PAD_OPEN = "Apri", PAD_BACK = "Indietro", PAD_TABS = "Mappa · Boss · Missioni", PAD_SCROLL = "Scorri", PAD_FAV = "Preferito", PAD_CLOSE = "Chiudi", MAP_PAD_MARKED = "%s segnato sulla mappa. Apri la mappa per vederlo.", MAP_PAD_ELSEWHERE = "%s segnato sulla mappa. La mappa mostra la zona in cui ti trovi: passa a quella zona sulla mappa per vederlo." },
        ptBR = { PAD_OPEN = "Abrir", PAD_BACK = "Voltar", PAD_TABS = "Mapa · Chefes · Missões", PAD_SCROLL = "Rolar", PAD_FAV = "Favorito", PAD_CLOSE = "Fechar", MAP_PAD_MARKED = "%s marcado no mapa. Abra o seu mapa para ver.", MAP_PAD_ELSEWHERE = "%s marcado no mapa. O mapa mostra a zona em que você está: vá até essa zona no mapa para ver." },
        ruRU = { PAD_OPEN = "Открыть", PAD_BACK = "Назад", PAD_TABS = "Карта · Боссы · Задания", PAD_SCROLL = "Прокрутка", PAD_FAV = "Избранное", PAD_CLOSE = "Закрыть", MAP_PAD_MARKED = "%s отмечено на карте. Откройте карту, чтобы увидеть.", MAP_PAD_ELSEWHERE = "%s отмечено на карте. Карта показывает зону, где вы находитесь: перейдите на карте к этой зоне, чтобы увидеть." },
        koKR = { PAD_OPEN = "열기", PAD_BACK = "뒤로", PAD_TABS = "지도 · 우두머리 · 퀘스트", PAD_SCROLL = "스크롤", PAD_FAV = "즐겨찾기", PAD_CLOSE = "닫기", MAP_PAD_MARKED = "%s 위치를 지도에 표시했습니다. 지도를 열어 확인하세요.", MAP_PAD_ELSEWHERE = "%s 위치를 지도에 표시했습니다. 지도에는 지금 있는 지역이 나옵니다. 지도에서 그 지역으로 이동하면 볼 수 있습니다." },
        zhCN = { PAD_OPEN = "打开", PAD_BACK = "返回", PAD_TABS = "地图 · 首领 · 任务", PAD_SCROLL = "滚动", PAD_FAV = "收藏", PAD_CLOSE = "关闭", MAP_PAD_MARKED = "已在地图上标记%s。打开地图即可查看。", MAP_PAD_ELSEWHERE = "已在地图上标记%s。地图显示的是你所在的区域：在地图上切换到该区域即可查看。" },
        zhTW = { PAD_OPEN = "開啟", PAD_BACK = "返回", PAD_TABS = "地圖 · 首領 · 任務", PAD_SCROLL = "捲動", PAD_FAV = "收藏", PAD_CLOSE = "關閉", MAP_PAD_MARKED = "已在地圖上標記%s。打開地圖即可查看。", MAP_PAD_ELSEWHERE = "已在地圖上標記%s。地圖顯示的是你所在的區域：在地圖上切換到該區域即可查看。" },
    }
    strings.esMX = strings.esES
    for locale, values in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then for key, value in pairs(values) do if t[key] == nil then t[key] = value end end end
    end
end
local function PL(key) return (FDJ.L and FDJ.L(key)) or key end
local function HintText()
    return "|cffffd100A|r " .. PL("PAD_OPEN") .. "    |cffffd100B|r " .. PL("PAD_BACK") .. "    |cffffd100LB / RB|r " .. PL("PAD_TABS")
        .. "    |cffffd100LT / RT|r " .. PL("PAD_SCROLL") .. "    |cffffd100Y|r " .. PL("PAD_FAV")
end

local function Print(msg) print("|cffd8a83cDungeonJournal|r " .. msg) end

local NAMES = {
    PAD1 = "A", PAD2 = "B", PAD3 = "X", PAD4 = "Y",
    PADDUP = "D-pad up", PADDDOWN = "D-pad down", PADDLEFT = "D-pad left", PADDRIGHT = "D-pad right",
    PADLSHOULDER = "LB", PADRSHOULDER = "RB", PADLTRIGGER = "LT", PADRTRIGGER = "RT",
    PADFORWARD = "Start", PADBACK = "Back", PADLSTICK = "L3", PADRSTICK = "R3",
}
local DIRS = { PADDUP = "up", PADDDOWN = "down", PADDLEFT = "left", PADDRIGHT = "right" }


local function View()
    if not frame or not frame:IsShown() then return nil end
    if frame.homePanel and frame.homePanel:IsVisible() then return "home" end
    if frame.dungeonMapPanel and frame.dungeonMapPanel:IsVisible() then return "map" end
    if frame.questListScroll and frame.questListScroll:IsVisible() then return "quests" end
    return "bosses"
end

local function Usable(w)
    if not (w and w.IsVisible and w:IsVisible()) then return false end
    if w.IsEnabled and w:IsEnabled() == false then return false end
    local width, height = w:GetSize()
    return (width or 0) > 8 and (height or 0) > 8
end

local function Pickable(w)
    return w.IsObjectType and (w:IsObjectType("Button") or w:IsObjectType("EditBox")) and Usable(w)
        and w ~= frame.resizeGrip
end


local function AddButtons(list, parent)
    if not parent then return end
    for _, child in ipairs({ parent:GetChildren() }) do
        if Pickable(child) then list[#list + 1] = child end
    end
end


local function AddAll(list, parent, depth)
    if not parent or depth > 10 or #list > 400 then return end
    for _, child in ipairs({ parent:GetChildren() }) do
        if child:IsVisible() then
            if Pickable(child) then list[#list + 1] = child end
            AddAll(list, child, depth + 1)
        end
    end
end


local POPUP_NAMES = {
    "ForeverDungeonJournalLootFilter", "ForeverDungeonJournalLootFilterResults",
    "ForeverDungeonJournalFavourites", "ForeverDungeonJournalFavouriteContextMenu",
    "ForeverDungeonJournalRunLog", "ForeverDungeonJournalRunLogMenu",
    "ForeverDungeonJournalSettings", "ForeverDungeonJournalOnyxiaMenu",
    "ForeverDungeonJournalSleepingBagMenu", "ForeverDungeonJournalLFGMenu",
    "ForeverDungeonJournalModeChooser", "ForeverDungeonJournalRPGConfirm", "ForeverDungeonJournalRPGDone",
    "ForeverDungeonJournalTierMenu", "ForeverDungeonJournalPvPMenu",
    "ForeverDungeonJournalViewMenu", "ForeverDungeonJournalOrderMenu", "ForeverDungeonJournalResetUIAsk",
}
local function Popups()
    local list = {}
    local function Add(f) if f and f.IsVisible and f:IsVisible() then list[#list + 1] = f end end
    Add(frame.languageMenu)
    Add(frame.bugReportWindow)
    Add(frame.searchResultsFrame)
    for _, name in ipairs(POPUP_NAMES) do Add(_G[name]) end
    return list
end


local STRATA = { BACKGROUND = 1, LOW = 2, MEDIUM = 3, HIGH = 4, DIALOG = 5, FULLSCREEN = 6, FULLSCREEN_DIALOG = 7, TOOLTIP = 8 }
local function TopLayer(list)
    local top = 0
    for _, w in ipairs(list) do
        local r = STRATA[w:GetFrameStrata()] or 0
        if r > top then top = r end
    end
    local out = {}
    for _, w in ipairs(list) do
        if (STRATA[w:GetFrameStrata()] or 0) == top then out[#out + 1] = w end
    end
    return out
end




local function Candidates()
    local view = View()
    local popups = Popups()
    if #popups > 0 then
        local list = {}
        for _, p in ipairs(popups) do AddAll(list, p, 1) end
        if #list > 0 then return TopLayer(list), "popup" end
    end
    local list = {}
    if view == "home" then


        local tier, pvp = _G.ForeverDungeonJournalTierPanel, _G.ForeverDungeonJournalPvPPanel
        if tier and tier:IsVisible() then
            AddAll(list, tier, 1)
        elseif pvp and pvp:IsVisible() then
            AddAll(list, pvp, 1)
        else
            AddButtons(list, frame.homeCardsContent)
            if Usable(frame.homeShowAllButton) then list[#list + 1] = frame.homeShowAllButton end
        end
    elseif view == "bosses" then
        AddButtons(list, frame.bossContent)
        AddButtons(list, frame.lootContent)
    elseif view == "quests" then


        for _, child in ipairs({ frame.questContent:GetChildren() }) do
            if Pickable(child) then list[#list + 1] = child end
            if child.chainPanel and child.chainPanel:IsVisible() then AddButtons(list, child.chainPanel) end
        end
        AddButtons(list, frame.questDetailContent)
        AddButtons(list, frame.questTextInset)
    elseif view == "map" then
        AddButtons(list, frame.dungeonMapPanel)
    end
    local pageCount = #list
    if view == "bosses" and Usable(frame.bossCompactButton) then list[#list + 1] = frame.bossCompactButton end
    AddButtons(list, frame)
    AddButtons(list, frame.backButton)
    if view == "home" then AddButtons(list, frame.homePanel) else AddButtons(list, frame.headerPanel) end



    if view ~= "home" and frame.fdjTabBar and frame.fdjTabBar:IsVisible() then AddButtons(list, frame.fdjTabBar) end
    return list, view, pageCount
end

local function Has(list, w)
    for _, x in ipairs(list) do if x == w then return true end end
    return false
end

local function Center(w)
    local x, y = w:GetCenter()
    local s = w:GetEffectiveScale() or 1
    return (x or 0) * s, (y or 0) * s
end

local function ScrollFrameOf(w)
    local p = w and w:GetParent()
    while p do
        if p.IsObjectType and p:IsObjectType("ScrollFrame") then return p end
        p = p:GetParent()
    end
end


local function ScrollIntoView(w)
    local sf = ScrollFrameOf(w)
    if not sf then return end
    local top, bottom, sTop, sBottom = w:GetTop(), w:GetBottom(), sf:GetTop(), sf:GetBottom()
    if not (top and bottom and sTop and sBottom) then return end
    local cur, max = sf:GetVerticalScroll() or 0, sf:GetVerticalScrollRange() or 0
    local delta = 0
    if top > sTop then
        delta = -(top - sTop) - 6
    elseif bottom < sBottom then
        delta = (sBottom - bottom) + 6
    end
    if delta ~= 0 then sf:SetVerticalScroll(math.max(0, math.min(max, cur + delta))) end
end

local function InView(w)
    local sf = ScrollFrameOf(w)
    if not sf then return true end
    local top, bottom, sTop, sBottom = w:GetTop(), w:GetBottom(), sf:GetTop(), sf:GetBottom()
    return top and bottom and sTop and sBottom and top <= sTop + 2 and bottom >= sBottom - 2
end



local function First(list, pageCount)
    if pageCount and pageCount > 0 and pageCount < #list then
        local page = {}
        for i = 1, pageCount do page[i] = list[i] end
        list = page
    end
    local best, bx, by
    for pass = 1, 2 do
        for _, w in ipairs(list) do
            if pass == 2 or InView(w) then
                local x, y = Center(w)
                if not best or y > by + 4 or (math.abs(y - by) <= 4 and x < bx) then best, bx, by = w, x, y end
            end
        end
        if best then return best end
    end
end


local function MakeCursor()
    cursor = CreateFrame("Frame", nil, frame, "BackdropTemplate")
    cursor:SetBackdrop({ edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 14,
        bgFile = "Interface\\Buttons\\WHITE8X8", insets = { left = 3, right = 3, top = 3, bottom = 3 } })
    cursor:SetBackdropColor(1.00, 0.82, 0.20, 0.08)
    cursor:SetBackdropBorderColor(1.00, 0.82, 0.10, 1)
    cursor:EnableMouse(false)
    local pulse = cursor:CreateAnimationGroup()
    pulse:SetLooping("BOUNCE")
    local fade = pulse:CreateAnimation("Alpha")
    fade:SetFromAlpha(1)
    fade:SetToAlpha(0.55)
    fade:SetDuration(0.7)
    cursor.pulse = pulse
    cursor:Hide()
end

local function Leave(w)
    if not w then return end
    local leave = w.GetScript and w:GetScript("OnLeave")
    if leave then pcall(leave, w) end
    if GameTooltip and GameTooltip:GetOwner() == w then GameTooltip:Hide() end
end

local function SetFocus(w)
    if focus and focus ~= w then Leave(focus) end
    focus = w
    if not w then
        if cursor then cursor:Hide() end
        return
    end
    ScrollIntoView(w)
    if not cursor then MakeCursor() end
    cursor:SetParent(w)


    if w.GetFrameStrata then cursor:SetFrameStrata(w:GetFrameStrata()) end
    cursor:ClearAllPoints()
    cursor:SetPoint("TOPLEFT", w, "TOPLEFT", -3, 3)
    cursor:SetPoint("BOTTOMRIGHT", w, "BOTTOMRIGHT", 3, -3)
    cursor:SetFrameLevel((w:GetFrameLevel() or 1) + 15)
    cursor:Show()
    cursor.pulse:Play()
    local enter = w:GetScript("OnEnter")
    if enter then pcall(enter, w) end

    if registered and not InCombatLockdown() and SmartNavigation and SmartNavigation.SetTargetButtonForFrame then
        pcall(SmartNavigation.SetTargetButtonForFrame, SmartNavigation, frame, w)
    end
end


local function Refresh()
    local list, _, pageCount = Candidates()
    if not Has(list, focus) then SetFocus(First(list, pageCount)) end
end
local function RefreshSoon()
    if C_Timer and C_Timer.After then C_Timer.After(0.1, Refresh) else Refresh() end
end



local function Nearest(list, dir)
    local fx, fy = Center(focus)
    local best, bestScore
    for _, w in ipairs(list) do
        if w ~= focus then
            local x, y = Center(w)
            local dx, dy = x - fx, y - fy
            local main, side
            if dir == "up" then main, side = dy, dx
            elseif dir == "down" then main, side = -dy, dx
            elseif dir == "right" then main, side = dx, dy
            else main, side = -dx, dy end
            if main > 4 then
                local score = main + math.abs(side) * 2.5
                if not bestScore or score < bestScore then best, bestScore = w, score end
            end
        end
    end
    return best
end






local function ReadingOrder(page)
    local sorted = {}
    for i, w in ipairs(page) do sorted[i] = w end
    table.sort(sorted, function(a, b)
        local ax, ay = Center(a)
        local bx, by = Center(b)
        if math.abs(ay - by) > 10 then return ay > by end
        return ax < bx
    end)
    return sorted
end

local function Move(dir)
    local list, view, pageCount = Candidates()
    if #list == 0 then SetFocus(nil) return end
    if not Has(list, focus) then SetFocus(First(list, pageCount)) return end
    local at
    for i, w in ipairs(list) do if w == focus then at = i end end
    if pageCount and pageCount > 0 and at and at <= pageCount then
        local page, rest = {}, {}
        for i, w in ipairs(list) do
            if i <= pageCount then page[#page + 1] = w else rest[#rest + 1] = w end
        end
        if (dir == "left" or dir == "right") and view == "home" then
            local order = ReadingOrder(page)
            for i, w in ipairs(order) do
                if w == focus then
                    local nextOne = order[i + (dir == "right" and 1 or -1)]
                    if nextOne then SetFocus(nextOne) end
                    return
                end
            end
            return
        end
        local best = Nearest(page, dir)
        if best then SetFocus(best) return end
        if dir ~= "up" then return end
        best = Nearest(rest, dir)
        if best then SetFocus(best) end
        return
    end
    local best = Nearest(list, dir)
    if best then SetFocus(best) end
end

local function Activate(mouseButton)
    local list, _, pageCount = Candidates()
    if not Has(list, focus) then SetFocus(First(list, pageCount)) return end
    local w = focus
    if w:IsObjectType("EditBox") then
        if mouseButton ~= "RightButton" then w:SetFocus() end
        return
    end
    if mouseButton == "RightButton" and not w.item then return end
    if w.Click then pcall(w.Click, w, mouseButton or "LeftButton") end
    RefreshSoon()
end



local function LayerRoot(w)
    local p = w
    while p and p.GetParent do
        local parent = p:GetParent()
        if not parent or parent == UIParent then return p end
        if parent.GetFrameStrata and parent:GetFrameStrata() ~= p:GetFrameStrata() then return p end
        p = parent
    end
    return p
end
local function ClosePopup(root)
    local close = root.CloseButton or root.closeButton or root.close or root.Close
    if type(close) == "table" and close.Click and close:IsShown() then
        close:Click()
    else
        root:Hide()
    end
end

local function Back()
    local view = View()
    if not view then return end

    local list, kind = Candidates()
    if kind == "popup" then
        local root = (focus and Has(list, focus)) and LayerRoot(focus) or nil
        if not root or root == frame then
            local open = Popups()
            root = open[#open]
        end
        SetFocus(nil)
        if root and root ~= frame then ClosePopup(root) end
        RefreshSoon()
        return
    end
    SetFocus(nil)
    if view ~= "home" and frame.backButton and frame.backButton:IsShown() then
        frame.backButton:Click()
        RefreshSoon()
    elseif registered and InCombatLockdown() then


        handedOff = true
        catcher:Hide()
        if hint then hint:SetText("|cffffd100B|r " .. PL("PAD_CLOSE")) hint:Show() end
    else

        frame:Hide()
    end
end


local function TakeBack()
    if not handedOff then return end
    handedOff = false
    if catcher then catcher:Show() end
    if hint then hint:SetText(HintText()) end
end


local function Tab(step)
    local view = View()
    if view == "home" or not view then return end
    if select(2, Candidates()) == "popup" then return end
    local tabs = {}
    if frame.mapTab and frame.mapTab:IsShown() then tabs[#tabs + 1] = { frame.mapTab, "map" } end
    if frame.bossesTab and frame.bossesTab:IsShown() then tabs[#tabs + 1] = { frame.bossesTab, "bosses" } end
    if frame.questsTab and frame.questsTab:IsShown() then tabs[#tabs + 1] = { frame.questsTab, "quests" } end
    if #tabs == 0 then return end
    local index = 1
    for i, t in ipairs(tabs) do if t[2] == view then index = i end end
    local nextTab = tabs[(index - 1 + step) % #tabs + 1]
    if padTest then Print("tab: " .. nextTab[2] .. " (of " .. #tabs .. ")") end
    SetFocus(nil)
    local onClick = nextTab[1]:GetScript("OnClick")
    if onClick then pcall(onClick, nextTab[1], "LeftButton") else nextTab[1]:Click() end
    RefreshSoon()
end

local function ScrollTarget()
    local view = View()
    if not view then return nil end
    if view == "quests" then return frame.questDetailScroll end
    local tier = _G.ForeverDungeonJournalTierPanel
    if view == "home" and tier and tier:IsVisible() and tier.scroll then return (focus and ScrollFrameOf(focus)) or tier.scroll end
    return (focus and ScrollFrameOf(focus)) or (view == "home" and frame.homeScroll) or frame.lootScroll
end

local function Scroll(amount)
    local sf = ScrollTarget()
    if not sf then return end
    local cur, max = sf:GetVerticalScroll() or 0, sf:GetVerticalScrollRange() or 0
    sf:SetVerticalScroll(math.max(0, math.min(max, cur + amount)))
end

local function ShowHint(on)
    if not hint then return end
    hint:SetShown(on and true or false)
end


local function Press(button)
    FDJ.padMapWanted = nil
    if padTest then Print("controller: " .. (NAMES[button] or tostring(button))) end
    if not View() then return false end
    padActive = true
    if hint and not handedOff then hint:SetText(HintText()) end
    ShowHint(true)
    if DIRS[button] then
        Move(DIRS[button])
    elseif button == "PAD1" then
        Activate("LeftButton")
    elseif button == "PAD2" then
        Back()
    elseif button == "PAD4" then
        Activate("RightButton")
    elseif button == "PADLSHOULDER" then
        Tab(-1)
    elseif button == "PADRSHOULDER" then
        Tab(1)
    elseif button == "PADLTRIGGER" then
        Scroll(-120)
    elseif button == "PADRTRIGGER" then
        Scroll(120)
    else
        return false
    end
    return true
end
FDJ.GamePadPress = Press



FDJ.GamePadMode = function()
    if padActive and frame and frame:IsShown() then return true end
    return InputUtil and InputUtil.IsGamepadUIEnabled and InputUtil.IsGamepadUIEnabled() and true or false
end




local scrollTickWait = 0
local function ScrollTargetTick(_, elapsed)
    scrollTickWait = scrollTickWait - (elapsed or 0)
    if scrollTickWait > 0 then return end
    scrollTickWait = 0.2
    if not registered or InCombatLockdown() or not (SmartNavigation and SmartNavigation.SetScrollFrameForFrame) then return end
    local sf = ScrollTarget()
    local ok, info = pcall(SmartNavigation.GetPanelInfo, SmartNavigation, frame, true)
    if ok and info and info.currentScrollFrame ~= sf then
        pcall(SmartNavigation.SetScrollFrameForFrame, SmartNavigation, frame, sf)
    end
end


local FAKE = {
    UP = "PADDUP", DOWN = "PADDDOWN", LEFT = "PADDLEFT", RIGHT = "PADDRIGHT",
    ENTER = "PAD1", BACKSPACE = "PAD2", HOME = "PAD4",
    PAGEUP = "PADLSHOULDER", PAGEDOWN = "PADRSHOULDER",
    INSERT = "PADLTRIGGER", DELETE = "PADRTRIGGER",
}











local mapKeyArmed
local function ReleaseMapKey()
    if not mapKeyArmed or not catcher or InCombatLockdown() then return end
    mapKeyArmed = nil
    pcall(ClearOverrideBindings, catcher)
    pcall(catcher.SetPropagateKeyboardInput, catcher, false)
end
local function PassPressToMap(key)
    local wanted = FDJ.padMapWanted
    FDJ.padMapWanted = nil
    if not (wanted and key and catcher) or InCombatLockdown() then return end
    if WorldMapFrame and WorldMapFrame:IsShown() then return end
    if not (SetOverrideBinding and ClearOverrideBindings and catcher.SetPropagateKeyboardInput) then return end
    if not pcall(SetOverrideBinding, catcher, true, key, "TOGGLEWORLDMAP") then return end
    mapKeyArmed = true
    if not pcall(catcher.SetPropagateKeyboardInput, catcher, true) then
        ReleaseMapKey()
        return
    end
    if padTest then Print("map: " .. tostring(key) .. " goes on to the game's Toggle World Map key") end
    if C_Timer and C_Timer.After then C_Timer.After(0, ReleaseMapKey) end
end

local function Capture(on)
    if not catcher then return end
    local padOn = on and (not GetCVarBool or GetCVarBool("GamePadEnable"))
    if catcher.EnableGamePadButton then pcall(catcher.EnableGamePadButton, catcher, padOn and true or false) end
    local keys = on and FDJ.fakePad and not (InCombatLockdown and InCombatLockdown())
    pcall(catcher.EnableKeyboard, catcher, keys and true or false)
end


local function RegisterWithGame()
    if registered or InCombatLockdown() then return end
    if not (InputUtil and InputUtil.IsGamepadUIEnabled and InputUtil.IsGamepadUIEnabled()) then return end
    local fcm = GamepadMode and GamepadMode.FrameControlsManager
    if not (fcm and fcm.FrameShown) then return end
    registered = pcall(fcm.FrameShown, fcm, frame)
end

local function UnregisterWithGame()
    if not registered or InCombatLockdown() then return end
    registered = false
    local fcm = GamepadMode and GamepadMode.FrameControlsManager
    if fcm and fcm.FrameHidden then pcall(fcm.FrameHidden, fcm, frame) end
end

local function Setup()
    frame = _G.ForeverDungeonJournalFrame
    if not frame or catcher then return end
    catcher = CreateFrame("Frame", nil, frame)
    catcher:SetAllPoints(frame)
    catcher:EnableMouse(false)
    catcher:SetScript("OnGamePadButtonDown", function(_, button) Press(button) PassPressToMap(button) end)
    catcher:SetScript("OnKeyDown", function(self, key)
        local pad = FDJ.fakePad and FAKE[key]
        if pad and not (IsModifierKeyDown and IsModifierKeyDown()) then
            pcall(self.SetPropagateKeyboardInput, self, false)
            Press(pad)
            PassPressToMap(key)
        else
            pcall(self.SetPropagateKeyboardInput, self, true)
        end
    end)
    catcher:SetScript("OnUpdate", ScrollTargetTick)

    hint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    hint:SetPoint("TOP", frame, "BOTTOM", 0, -4)
    hint:SetText(HintText())
    hint:Hide()


    frame.FocusGamepad = function()
        pausedByGame = false
        if frame:IsShown() then Capture(true) end
    end
    frame.UnfocusGamepad = function()
        pausedByGame = true
        SetFocus(nil)
        ShowHint(false)
        Capture(false)
    end

    frame.SmartNavigationOnSelect = function(_, w)
        if padActive and w and w ~= focus and frame:IsShown() and not pausedByGame then SetFocus(w) end
    end

    frame:HookScript("OnShow", function()
        pausedByGame = false
        Capture(true)
        RegisterWithGame()
    end)
    frame:HookScript("OnHide", function()
        ReleaseMapKey()
        SetFocus(nil)
        padActive = false
        ShowHint(false)
        TakeBack()
        Capture(false)
        UnregisterWithGame()
    end)
    if frame:IsShown() then Capture(true) RegisterWithGame() end
end

local watcher = CreateFrame("Frame")
watcher:RegisterEvent("PLAYER_LOGIN")
watcher:RegisterEvent("PLAYER_REGEN_DISABLED")
watcher:RegisterEvent("PLAYER_REGEN_ENABLED")
watcher:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_DISABLED" then ReleaseMapKey() end
    if event == "PLAYER_LOGIN" then
        pcall(Setup)
        return
    end
    if not frame then return end
    if event == "PLAYER_REGEN_ENABLED" then
        TakeBack()
        if frame:IsShown() then RegisterWithGame() else UnregisterWithGame() end
    end
    if frame:IsShown() and not pausedByGame then

        Capture(true)
    end
end)
