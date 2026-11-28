






local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local NAME_TOKEN = "\001N"

local function Secret(v) return type(issecretvalue) == "function" and issecretvalue(v) end
local function Str(v) return type(v) == "string" and not Secret(v) and v ~= "" and v or nil end






function FDJ.ObjectiveLineOverride(questID, text, finished)
    local o = questID and FDJ.OBJECTIVE_LINE_OVERRIDES and FDJ.OBJECTIVE_LINE_OVERRIDES[questID]
    if type(o) ~= "table" or type(text) ~= "string" then return text, finished end
    if not string.lower(text):find(o.match, 1, true) then return text, finished end
    local done = finished == true or (FDJ.IsQuestFinished and FDJ.IsQuestFinished(questID)) or false
    return (done and "1/1 " or "0/1 ") .. o.text, done
end

function FDJ.ObjectiveLineMissing(questID)
    local o = questID and FDJ.OBJECTIVE_LINE_OVERRIDES and FDJ.OBJECTIVE_LINE_OVERRIDES[questID]
    if type(o) ~= "table" then return nil end
    return FDJ.ObjectiveLineOverride(questID, o.match, false)
end

local function Locale() return (GetLocale and GetLocale()) or "enUS" end

local function Store()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    local all = ForeverDungeonJournalDB.questText
    if type(all) ~= "table" then all = {}; ForeverDungeonJournalDB.questText = all end
    local loc = Locale()
    all[loc] = all[loc] or {}
    return all[loc]
end

local function PlayerName()
    local ok, name = pcall(UnitName, "player")
    return ok and Str(name) or nil
end

local function Tokenize(text)
    local name = PlayerName()
    if not text or not name then return text end
    return (text:gsub(name:gsub("(%W)", "%%%1"), NAME_TOKEN))
end

local function Detokenize(text)
    if not text then return nil end
    local name = PlayerName() or ""
    return (text:gsub(NAME_TOKEN, (name:gsub("%%", "%%%%"))))
end

local function Save(questID, objective, description)
    questID = tonumber(questID)
    if not questID or questID <= 0 then return end
    objective, description = Str(objective), Str(description)
    if not objective and not description then return end
    local entry = Store()[questID] or {}
    if objective then entry.o = Tokenize(objective) end
    if description then entry.d = Tokenize(description) end
    Store()[questID] = entry
end


local function ScanLog()
    if not (C_QuestLog and C_QuestLog.GetNumQuestLogEntries and C_QuestLog.GetInfo) then return end
    if type(GetQuestLogQuestText) ~= "function" then return end
    local okN, n = pcall(C_QuestLog.GetNumQuestLogEntries)
    if not okN or type(n) ~= "number" then return end
    for i = 1, n do
        local ok, info = pcall(C_QuestLog.GetInfo, i)
        if ok and type(info) == "table" and not info.isHeader and type(info.questID) == "number" and info.questID > 0 then
            local ok2, desc, obj = pcall(GetQuestLogQuestText, i)
            if ok2 then Save(info.questID, obj, desc) end
            if FDJ.LearnQuestID then pcall(FDJ.LearnQuestID, info.questID, info.title) end
        end
    end
end

local pending = false
local function ScanSoon()
    if pending then return end
    pending = true
    local function run() pending = false; pcall(ScanLog) end
    if C_Timer and C_Timer.After then C_Timer.After(1, run) else run() end
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:RegisterEvent("QUEST_DETAIL")
events:RegisterEvent("QUEST_ACCEPTED")
events:RegisterEvent("QUEST_LOG_UPDATE")
events:SetScript("OnEvent", function(_, event)
    if event == "QUEST_DETAIL" then
        pcall(function()
            local id = GetQuestID and GetQuestID()
            Save(id, GetObjectiveText and GetObjectiveText(), GetQuestText and GetQuestText())
            if FDJ.LearnQuestID then FDJ.LearnQuestID(id, GetTitleText and GetTitleText()) end
        end)
    else
        ScanSoon()
    end
end)


local function Learned(questID)
    if not questID then return nil end


    if FDJ.CanUseClientLocalizedText and not FDJ.CanUseClientLocalizedText() then return nil end
    local entry = Store()[tonumber(questID)]
    if not entry then return nil end
    return Detokenize(entry.o), Detokenize(entry.d)
end
FDJ.LearnedQuestText = Learned







function FDJ.ObjectiveDone(questID, i, objective)
    if type(objective) == "table" and objective.finished == true then return true end
    if not (questID and i and C_QuestLog and C_QuestLog.GetLogIndexForQuestID) then return false end
    if type(GetQuestLogLeaderBoard) ~= "function" then return false end
    local okI, index = pcall(C_QuestLog.GetLogIndexForQuestID, questID)
    if not okI or type(index) ~= "number" or index <= 0 then return false end
    local ok, _, _, finished = pcall(GetQuestLogLeaderBoard, i, index)
    return ok and (finished == true or finished == 1)
end
function FDJ.ObjectiveDoneText(text, done)
    if not done or type(text) ~= "string" or text:find("%d+%s*/%s*%d+") then return text end
    local word = type(COMPLETE) == "string" and COMPLETE or "Complete"
    if text:find(word, 1, true) then return text end
    return text .. " (" .. word .. ")"
end

local function ProgressLines(questID)
    if not (questID and C_QuestLog and C_QuestLog.GetLogIndexForQuestID and C_QuestLog.GetQuestObjectives) then return nil end
    local okI, index = pcall(C_QuestLog.GetLogIndexForQuestID, questID)
    if not okI or type(index) ~= "number" or index <= 0 then return nil end
    local ok, objectives = pcall(C_QuestLog.GetQuestObjectives, questID)
    if ok and type(objectives) == "table" and #objectives == 0 then

        local text, done = FDJ.ObjectiveLineMissing(questID)
        if text then return done and ("|cff6e5c40" .. text .. "|r") or text end
    end
    if not ok or type(objectives) ~= "table" or #objectives == 0 then return nil end

    local own = FDJ.LocalizeObjectives and FDJ.LocalizeObjectives(questID, objectives, nil, true)
    if own then
        local translated = {}
        for _, line in ipairs(own) do
            translated[#translated + 1] = line[2] and ("|cff6e5c40" .. line[1] .. "|r") or line[1]
        end
        return #translated > 0 and table.concat(translated, "\n") or nil
    end
    local lines = {}
    for i, o in ipairs(objectives) do
        local text = type(o) == "table" and Str(o.text)
        if text then
            local finished = FDJ.ObjectiveDone(questID, i, o)
            text, finished = FDJ.ObjectiveLineOverride(questID, text, finished)
            text = FDJ.ObjectiveDoneText(text, finished)

            lines[#lines + 1] = finished and ("|cff6e5c40" .. text .. "|r") or text
        end
    end
    return #lines > 0 and table.concat(lines, "\n") or nil
end



function FDJ.QuestPageText(questID, fallbackObjective)
    local obj, desc = Learned(questID)
    local text = obj or fallbackObjective or ""
    local progress = ProgressLines(questID)
    if progress then text = (text ~= "" and (text .. "\n\n") or "") .. progress end
    return text, desc
end


function FDJ.PlaceQuestDescription(frame, desc, y, placeHeader)
    local header, body = frame.questDescHeader, frame.questDescText
    if not header or not body then return y end


    if true or not desc or desc == "" then
        header:Hide(); body:Hide()
        return y
    end
    y = placeHeader(header, y)
    body:ClearAllPoints()
    body:SetPoint("TOPLEFT", frame.questDetailContent, "TOPLEFT", 0, -y)
    body:SetWidth(frame.questDetailText:GetWidth() or 360)
    body:SetText(desc)
    body:SetTextColor(0.10, 0.065, 0.025)
    body:Show()
    return y + (body:GetStringHeight() or 30) + 13
end

function FDJ.HideQuestDescription(frame)
    if frame and frame.questDescHeader then frame.questDescHeader:Hide() end
    if frame and frame.questDescText then frame.questDescText:Hide() end
end









do
    local column = {}
    for i, loc in ipairs(FDJ.OBJECTIVE_NAME_LOCALES or {}) do column[loc] = i end


    local SLAIN = { enUS = "%s slain", deDE = "%s getötet", koKR = "%s 처치", ruRU = "%s – убито", zhCN = "消灭%s", zhTW = "殺死%s" }



    local patterns = {}
    local function Pattern(key)
        if patterns[key] ~= nil then return patterns[key] or nil end
        local fmt = _G[key]
        if type(fmt) ~= "string" or Secret(fmt) then patterns[key] = false return nil end
        fmt = fmt:gsub("|4[^;]*;", "\001")
        local out, order, auto, i = { "^" }, {}, 0, 1
        while i <= #fmt do
            local c = fmt:sub(i, i)
            if c == "%" then
                local pos, kind, len = fmt:match("^%%(%d)%$([sd])()", i)
                if not pos then
                    kind = fmt:match("^%%([sd])", i)
                    if kind then auto, pos, len = auto + 1, auto + 1, i + 2 end
                else
                    pos = tonumber(pos)
                end
                if kind then
                    out[#out + 1] = kind == "s" and "(.-)" or "(%d+)"
                    order[#order + 1] = pos
                    i = len
                else
                    out[#out + 1] = "%%"
                    i = i + 1
                end
            elseif c == "\001" then
                out[#out + 1] = ".-"
                i = i + 1
            else
                out[#out + 1] = c:find("[%^%$%(%)%%%.%[%]%*%+%-%?]") and ("%" .. c) or c
                i = i + 1
            end
        end
        out[#out + 1] = "$"
        local p = { table.concat(out), order }
        patterns[key] = p
        return p
    end
    local KEYS = { monster = "QUEST_MONSTERS_KILLED", item = "QUEST_ITEMS_NEEDED", object = "QUEST_OBJECTS_FOUND" }

    local function Split(text, kind)
        local order = { KEYS[kind], "QUEST_MONSTERS_KILLED", "QUEST_ITEMS_NEEDED", "QUEST_OBJECTS_FOUND" }
        for _, key in ipairs(order) do
            local p = key and Pattern(key)
            if p then
                local got = { text:match(p[1]) }
                if #got == #p[2] and #got > 0 then
                    local args = {}
                    for n, pos in ipairs(p[2]) do args[pos] = got[n] end
                    if args[1] and tonumber(args[2]) and tonumber(args[3]) then
                        return args[1], tonumber(args[2]), tonumber(args[3]), key == "QUEST_MONSTERS_KILLED"
                    end
                end
            end
        end
        local done, needed, name = text:match("^(%d+)%s*/%s*(%d+)%s+(.+)$")
        if name then return name, tonumber(done), tonumber(needed), false end
        name, done, needed = text:match("^(.-)%s*[:：]%s*(%d+)%s*/%s*(%d+)$")
        if name and name ~= "" then return name, tonumber(done), tonumber(needed), false end
        return nil
    end


    local reverse = {}
    local function English(name, client)
        if client == "enUS" then return FDJ.OBJECTIVE_NAMES and FDJ.OBJECTIVE_NAMES[name] and name or nil end
        local col = column[client]
        if not col or not FDJ.OBJECTIVE_NAMES then return nil end
        local index = reverse[client]
        if not index then
            index = {}
            for english, row in pairs(FDJ.OBJECTIVE_NAMES) do
                if row[col] then index[row[col]] = english end
            end
            reverse[client] = index
        end

        return index[name] or (FDJ.OBJECTIVE_NAMES[name] and name) or nil
    end


    local function Unslain(name, client)
        local before, after = (SLAIN[client] or ""):match("^(.-)%%s(.*)$")
        if not before then return nil end
        local function Esc(s) return (s:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0")) end
        local bare = name:match("^" .. Esc(before) .. "%s*(.-)%s*" .. Esc(after) .. "$")
        return bare and bare ~= "" and bare ~= name and bare or nil
    end
    local function Localized(english, target)
        if target == "enUS" then return english end
        local row = FDJ.OBJECTIVE_NAMES and FDJ.OBJECTIVE_NAMES[english]
        local col = column[target]
        if not row or not col then return nil end

        return row[col] or english
    end






    function FDJ.LocalizeObjectives(questID, objectives, goal, onPage)
        if not FDJ.CanUseClientLocalizedText or FDJ.CanUseClientLocalizedText() then return nil end
        if type(objectives) ~= "table" then return nil end
        local target = (FDJ.GetLanguage and FDJ.GetLanguage()) or "enUS"
        local client = (FDJ.GetClientLanguage and FDJ.GetClientLanguage()) or "enUS"
        local out, worded, wordedDone = {}, false, true
        for _, o in ipairs(objectives) do
            local text = type(o) == "table" and Str(o.text) or nil
            if text then
                local finished = o.finished == true
                local name, done, needed, slain = Split(text, o.type)
                if name then
                    local english = English(name, client)
                    if not english then
                        local bare = Unslain(name, client)
                        english = bare and English(bare, client)
                        slain = slain or english ~= nil
                    end
                    local localized = english and Localized(english, target)
                    if localized then
                        done = (type(o.numFulfilled) == "number" and not Secret(o.numFulfilled)) and o.numFulfilled or done
                        needed = (type(o.numRequired) == "number" and not Secret(o.numRequired)) and o.numRequired or needed
                        if o.type == "monster" or slain then localized = (SLAIN[target] or "%s"):format(localized) end
                        text = done .. "/" .. needed .. " " .. localized
                    end
                    out[#out + 1] = { text, finished }
                else
                    worded = true
                    wordedDone = wordedDone and finished
                    out[#out + 1] = { text, finished, worded = true }
                end
            end
        end
        if not worded then return out end
        local translated
        if target == "enUS" then
            translated = goal
        elseif FDJ.LocalizeQuestField then
            translated = FDJ.LocalizeQuestField(questID, "objective", nil)
        end
        if type(translated) ~= "string" or translated == "" then return out end
        local kept, placed = {}, false
        for _, line in ipairs(out) do
            if not line.worded then
                kept[#kept + 1] = line
            elseif not placed and not onPage then
                placed = true
                kept[#kept + 1] = { translated, wordedDone }
            end
        end
        return kept
    end
end










do
    local PAGE = FDJ.SLEEPING_BAG_PAGE
    local ITEM = FDJ.SLEEPING_BAG_ITEM or 211527
    local QUEST = 79976
    local ICON = "Interface\\Icons\\INV_Misc_Bag_BigBagofEnchantments"
    local MASK = "Interface\\CharacterFrame\\TempPortraitAlphaMask"
    local GLOW = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\TickGlow"
    if PAGE and FDJ.DB and FDJ.DB[PAGE] then
        local strings = {
            enUS = { SLEEPING_BAG = "Sleeping Bag", SLEEPING_BAG_TITLE = "Cozy Sleeping Bag",
                SLEEPING_BAG_HOW = "How to get Sleeping Bag", SLEEPING_BAG_HIDE_TIP = "Right-click to hide", SLEEPING_BAG_HIDE = "Hide" },
            deDE = { SLEEPING_BAG = "Schlafsack", SLEEPING_BAG_TITLE = "Gemütlicher Schlafsack",
                SLEEPING_BAG_HOW = "So bekommst du den Schlafsack", SLEEPING_BAG_HIDE_TIP = "Rechtsklick zum Ausblenden", SLEEPING_BAG_HIDE = "Ausblenden" },
            frFR = { SLEEPING_BAG = "Sac de couchage", SLEEPING_BAG_TITLE = "Sac de couchage douillet",
                SLEEPING_BAG_HOW = "Comment obtenir le sac de couchage", SLEEPING_BAG_HIDE_TIP = "Clic droit pour masquer", SLEEPING_BAG_HIDE = "Masquer" },
            esES = { SLEEPING_BAG = "Saco de dormir", SLEEPING_BAG_TITLE = "Saco de dormir acogedor",
                SLEEPING_BAG_HOW = "Cómo conseguir el saco de dormir", SLEEPING_BAG_HIDE_TIP = "Clic derecho para ocultar", SLEEPING_BAG_HIDE = "Ocultar" },
            itIT = { SLEEPING_BAG = "Sacco a pelo", SLEEPING_BAG_TITLE = "Sacco a pelo accogliente",
                SLEEPING_BAG_HOW = "Come ottenere il sacco a pelo", SLEEPING_BAG_HIDE_TIP = "Clic destro per nascondere", SLEEPING_BAG_HIDE = "Nascondi" },
            ptBR = { SLEEPING_BAG = "Saco de dormir", SLEEPING_BAG_TITLE = "Saco de dormir aconchegante",
                SLEEPING_BAG_HOW = "Como conseguir o saco de dormir", SLEEPING_BAG_HIDE_TIP = "Clique com o botão direito para ocultar", SLEEPING_BAG_HIDE = "Ocultar" },
            ruRU = { SLEEPING_BAG = "Спальный мешок", SLEEPING_BAG_TITLE = "Уютный спальный мешок",
                SLEEPING_BAG_HOW = "Как получить спальный мешок", SLEEPING_BAG_HIDE_TIP = "Правый клик — скрыть", SLEEPING_BAG_HIDE = "Скрыть" },
            koKR = { SLEEPING_BAG = "침낭", SLEEPING_BAG_TITLE = "아늑한 침낭",
                SLEEPING_BAG_HOW = "침낭 얻는 방법", SLEEPING_BAG_HIDE_TIP = "우클릭하여 숨기기", SLEEPING_BAG_HIDE = "숨기기" },
            zhCN = { SLEEPING_BAG = "睡袋", SLEEPING_BAG_TITLE = "舒适的睡袋",
                SLEEPING_BAG_HOW = "如何获得睡袋", SLEEPING_BAG_HIDE_TIP = "右键点击隐藏", SLEEPING_BAG_HIDE = "隐藏" },
            zhTW = { SLEEPING_BAG = "睡袋", SLEEPING_BAG_TITLE = "舒適的睡袋",
                SLEEPING_BAG_HOW = "如何獲得睡袋", SLEEPING_BAG_HIDE_TIP = "右鍵點擊隱藏", SLEEPING_BAG_HIDE = "隱藏" },
        }
        for locale, entries in pairs(strings) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t then
                for key, value in pairs(entries) do
                    if t[key] == nil then t[key] = value end
                end
            end
        end

        local function L(key)
            return FDJ.L and FDJ.L(key) or key
        end
        local function Plain(v)
            if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
            return v
        end



        local function Title()
            if FDJ.CanUseClientLocalizedText and FDJ.CanUseClientLocalizedText() then
                local get = (C_Item and C_Item.GetItemNameByID) or GetItemInfo
                if type(get) == "function" then
                    local ok, name = pcall(get, ITEM)
                    name = ok and Plain(name) or nil
                    if type(name) == "string" and name ~= "" then return name end
                end
            end
            return L("SLEEPING_BAG_TITLE")
        end
        local baseName = FDJ.LocalizeDungeonName
        FDJ.LocalizeDungeonName = function(name, ...)
            if name == PAGE then return Title() end
            if baseName then return baseName(name, ...) end
            return name
        end


        local function Resolve()
            if not FDJ.SetSleepingBagFaction or type(UnitFactionGroup) ~= "function" then return end
            local ok, faction = pcall(UnitFactionGroup, "player")
            faction = ok and Plain(faction) or nil
            if faction == "Horde" or faction == "Alliance" then FDJ.SetSleepingBagFaction(faction) end
        end
        Resolve()
        local events = CreateFrame("Frame")
        events:RegisterEvent("PLAYER_LOGIN")
        events:SetScript("OnEvent", function()
            Resolve()
            if C_Item and C_Item.RequestLoadItemDataByID then pcall(C_Item.RequestLoadItemDataByID, ITEM) end
        end)



        function FDJ.OpenSleepingBagChain()
            if not FDJ.OpenQuestChain then return end
            local stepID
            for _, step in ipairs((FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[QUEST]) or {}) do
                if type(step) == "table" and type(step.id) == "number"
                    and not (FDJ.QuestTurnedIn and FDJ.QuestTurnedIn(step.id)) then
                    stepID = step.id
                    break
                end
            end
            FDJ.OpenQuestChain(PAGE, QUEST, stepID)
        end



        local function HasBag()
            if FDJ.QuestTurnedIn and FDJ.QuestTurnedIn(QUEST) then return true end
            local count
            if C_Item and C_Item.GetItemCount then
                local ok, n = pcall(C_Item.GetItemCount, ITEM, true)
                if ok then count = Plain(n) end
            end
            if count == nil and GetItemCount then
                local ok, n = pcall(GetItemCount, ITEM, true)
                if ok then count = Plain(n) end
            end
            return type(count) == "number" and count > 0
        end
        FDJ.HasSleepingBag = HasBag








        function FDJ.IsSleepingBagHidden()
            local v = ForeverDungeonJournalDB and ForeverDungeonJournalDB.hideSleepingBag
            if v == true then return true end
            if v == false then return false end
            return HasBag() and true or false
        end

        local function Wanted(b)
            return b and b.fdjPlaced == true and not FDJ.IsSleepingBagHidden()
        end

        local menu
        local lastHidden

        local function RefreshOptions()
            lastHidden = FDJ.IsSleepingBagHidden()
            local settings = _G.ForeverDungeonJournalSettings
            if settings and settings:IsShown() then
                local onShow = settings:GetScript("OnShow")
                if onShow then pcall(onShow, settings) end
            end
        end
        function FDJ.SetSleepingBagHidden(hidden)
            ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}

            if hidden then
                ForeverDungeonJournalDB.hideSleepingBag = true
            elseif HasBag() then
                ForeverDungeonJournalDB.hideSleepingBag = false
            else
                ForeverDungeonJournalDB.hideSleepingBag = nil
            end
            local frame = _G.ForeverDungeonJournalFrame
            local b = frame and frame.sleepingBagButton
            if b then b:SetShown(Wanted(b)) end
            if menu then menu:Hide() end
            RefreshOptions()
        end



        local function Same(a, spot)
            return type(a) == "table" and a.mapID == spot.mapID
                and math.abs((tonumber(a.x) or -1) - spot.x) < 0.0005
                and math.abs((tonumber(a.y) or -1) - spot.y) < 0.0005
        end
        local function OnPage(loc, spot)
            return Same(loc.map, spot) or Same(loc.startMap, spot) or Same(loc.turninMap, spot)
        end
        function FDJ.IsSleepingBagSpot(spot)
            if type(spot) ~= "table" or not spot.mapID then return false end
            local x, y = tonumber(spot.x), tonumber(spot.y)
            if not x or not y then return false end
            spot = { mapID = spot.mapID, x = x, y = y }
            for _, quest in ipairs((FDJ.DB[PAGE] and FDJ.DB[PAGE].quests) or {}) do
                if type(quest) == "table" and OnPage(quest, spot) then return true end
            end
            local details = FDJ.QUEST_PREREQ_DETAILS or {}
            local ids = { 79007, 79008 }
            for _, step in ipairs((FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[QUEST]) or {}) do
                if type(step) == "table" then ids[#ids + 1] = step.id end
            end
            for _, id in ipairs(ids) do
                if type(details[id]) == "table" and OnPage(details[id], spot) then return true end
            end
            return false
        end


        local function ShowMenu(anchor)
            if not menu then
                menu = CreateFrame("Frame", "ForeverDungeonJournalSleepingBagMenu", UIParent, "BackdropTemplate")
                menu:SetFrameStrata("FULLSCREEN_DIALOG")
                menu:EnableMouse(true)
                menu:SetBackdrop({
                    bgFile = "Interface\\Buttons\\WHITE8X8",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    edgeSize = 12,
                    insets = { left = 3, right = 3, top = 3, bottom = 3 },
                })
                menu:SetBackdropColor(0.055, 0.05, 0.043, 0.98)
                menu:SetBackdropBorderColor(0.57, 0.43, 0.20, 1)
                local item = CreateFrame("Button", nil, menu)
                item:SetPoint("TOPLEFT", 5, -5)
                item:SetPoint("RIGHT", -5, 0)
                item:SetHeight(20)
                item:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
                item.text = item:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
                item.text:SetPoint("LEFT", 6, 0)
                item:SetScript("OnClick", function()
                    menu:Hide()


                    if FDJ.OpenSettingsAt then FDJ.OpenSettingsAt("OPT_SHOW_SLEEPING_BAG") else FDJ.SetSleepingBagHidden(true) end
                end)
                menu.hide = item

                menu:SetScript("OnUpdate", function(self, elapsed)
                    if self:IsMouseOver() or (self.fdjAnchor and self.fdjAnchor:IsMouseOver()) then
                        self.fdjAway = 0
                    else
                        self.fdjAway = (self.fdjAway or 0) + elapsed
                        if self.fdjAway > 0.6 then self:Hide() end
                    end
                end)
            end
            menu.hide.text:SetText(L("SLEEPING_BAG_HIDE"))
            menu:SetSize(math.max(110, (menu.hide.text:GetStringWidth() or 0) + 24), 30)
            menu.fdjAnchor = anchor
            menu.fdjAway = 0
            menu:ClearAllPoints()
            menu:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 4, -2)
            menu:Show()
            if GameTooltip then GameTooltip:Hide() end
        end


        local function BagIcon()
            local icon
            if C_Item and C_Item.GetItemIconByID then
                local ok, v = pcall(C_Item.GetItemIconByID, ITEM)
                if ok then icon = Plain(v) end
            end
            if not icon and GetItemIcon then
                local ok, v = pcall(GetItemIcon, ITEM)
                if ok then icon = Plain(v) end
            end
            return icon or ICON
        end

        local function Build(frame)
            local home = frame.homePanel
            local b = CreateFrame("Button", nil, home)
            frame.sleepingBagButton = b
            b:SetSize(40, 40)
            b:SetFrameLevel(home:GetFrameLevel() + 5)
            b:RegisterForClicks("LeftButtonUp", "RightButtonUp")


            b.halo = b:CreateTexture(nil, "BACKGROUND", nil, -1)
            b.halo:SetTexture(GLOW)
            b.halo:SetBlendMode("ADD")
            b.halo:SetVertexColor(1, 0.82, 0.35)
            b.halo:SetAlpha(0.75)
            b.halo:SetPoint("CENTER")
            b.icon = b:CreateTexture(nil, "ARTWORK")
            b.icon:SetPoint("CENTER")
            b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
            if b.CreateMaskTexture then
                local mask = b:CreateMaskTexture()
                mask:SetTexture(MASK, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
                mask:SetAllPoints(b.icon)
                b.icon:AddMaskTexture(mask)
                b.mask = mask
            end
            b.hl = b:CreateTexture(nil, "HIGHLIGHT")
            b.hl:SetTexture(MASK)
            b.hl:SetBlendMode("ADD")
            b.hl:SetAlpha(0.25)
            b.hl:SetPoint("CENTER")
            b:SetScript("OnMouseDown", function(self, button)
                if button ~= "LeftButton" then return end
                self.icon:ClearAllPoints()
                self.icon:SetPoint("CENTER", 1, -1)
            end)
            b:SetScript("OnMouseUp", function(self)
                self.icon:ClearAllPoints()
                self.icon:SetPoint("CENTER")
            end)
            b:SetScript("OnClick", function(self, button)
                if button == "RightButton" then
                    ShowMenu(self)
                    return
                end
                if GameTooltip then GameTooltip:Hide() end
                if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_ABILITY_PAGE_TURN) or 836) end
                FDJ.OpenSleepingBagChain()
            end)
            b:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L("SLEEPING_BAG_HOW"), 1, 0.82, 0)
                GameTooltip:AddLine(L("SLEEPING_BAG_HIDE_TIP"), 0.6, 0.6, 0.6)
                GameTooltip:Show()
            end)
            b:SetScript("OnLeave", function() GameTooltip:Hide() end)
            return b
        end

        function FDJ.PlaceSleepingBagButton(frame, anchor, size)
            if not frame or not frame.homePanel or not anchor then return end
            local b = frame.sleepingBagButton or Build(frame)
            size = size or 40

            local inner = math.floor(size * 0.9 + 0.5)
            b:SetSize(inner, inner)
            b.icon:SetTexture(BagIcon())
            b.icon:SetSize(inner, inner)
            b.hl:SetSize(inner, inner)
            local glow = math.floor(inner * 1.92 + 0.5)
            b.halo:SetSize(glow, glow)
            b:ClearAllPoints()
            b:SetPoint("LEFT", anchor, "RIGHT", size >= 40 and 12 or (size >= 30 and 10 or 8), 0)
            b.fdjPlaced = true
            b:SetShown(Wanted(b))
        end


        local watch = CreateFrame("Frame")
        watch:RegisterEvent("BAG_UPDATE_DELAYED")
        watch:RegisterEvent("QUEST_TURNED_IN")
        watch:SetScript("OnEvent", function()
            local frame = _G.ForeverDungeonJournalFrame
            local b = frame and frame.sleepingBagButton
            if b then b:SetShown(Wanted(b)) end
            if FDJ.IsSleepingBagHidden() ~= lastHidden then RefreshOptions() end
        end)
    end
end




















do
    local WIDTH = 250
    local TITLE_H = 22
    local SIDE = 12
    local ROWS_TOP = 31
    local BOTTOM_PAD = 14
    local COLLAPSED_H = 34
    local FOLDED_H = 24
    local ROW_GAP = 7
    local ICON_SIZE = 20
    local ICON_X = 8
    local TEXT_X = 23



    local DOOR_SIZE = 26
    local DOOR_X = 23
    local DOOR_TEXT_X = 34


    local ITEM_SIZE = 22



    local CHAIN_SIZE = 16
    local ICON_STEP = 18
    local STEP_ICON = 14
    local STEP_TEXT_X = 17
    local WINDOW_GAP = 6
    local MIN_SCALE, MAX_SCALE = 0.6, 1.6
    local WHITE = "Interface\\Buttons\\WHITE8X8"
    local BOOK = "Interface\\Icons\\INV_Misc_Book_09"
    local CHAIN = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\QuestChain"
    local GLOW = "Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight"
    local ICON_TODO = "Interface\\GossipFrame\\AvailableQuestIcon"
    local ICON_LOG = "Interface\\GossipFrame\\ActiveQuestIcon"
    local ICON_DONE = "Interface\\RaidFrame\\ReadyCheck-Ready"




    local POI_SIZE = 30
    local POI_RING = "UI-QuestPoi-QuestNumber"
    local POI_RING_DOWN = "UI-QuestPoi-QuestNumber-Pressed"
    local POI_LIT = "UI-QuestPoi-InnerGlow"
    local POI_TURN_IN = "UI-QuestIcon-TurnIn-Normal"


    local TURN_IN_ART = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\TurnInMark"

    local GOLD = { 1.00, 0.82, 0.00 }
    local GREEN = { 0.30, 1.00, 0.36 }
    local DONE = { 0.45, 0.78, 0.47 }
    local TODO = { 0.86, 0.82, 0.72 }
    local GREY = { 0.55, 0.55, 0.55 }

    local windows = {}
    local dragEndedAt = 0

    local function T(key, ...)
        if FDJ.L then return FDJ.L(key, ...) end
        return key
    end

    local function Plain(v)
        if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
        return v
    end



    local hasQuestButton
    local function HasQuestButton()
        if hasQuestButton == nil then
            local get = C_Texture and C_Texture.GetAtlasInfo
            hasQuestButton = type(get) == "function"
            for _, atlas in ipairs({ POI_RING, POI_RING_DOWN, POI_LIT, POI_TURN_IN }) do
                if hasQuestButton then
                    local ok, info = pcall(get, atlas)
                    hasQuestButton = ok and info ~= nil
                end
            end
        end
        return hasQuestButton
    end

    local function Hex(c)
        return string.format("|cff%02x%02x%02x", math.floor(c[1] * 255 + 0.5),
            math.floor(c[2] * 255 + 0.5), math.floor(c[3] * 255 + 0.5))
    end

    local function CharDB()
        if type(ForeverDungeonJournalCharacterDB) ~= "table" then ForeverDungeonJournalCharacterDB = {} end
        return ForeverDungeonJournalCharacterDB
    end



    local function Saved()
        if type(ForeverDungeonJournalDB) ~= "table" then ForeverDungeonJournalDB = {} end
        local saved = ForeverDungeonJournalDB.questTracker
        if type(saved) ~= "table" then
            saved = {}
            ForeverDungeonJournalDB.questTracker = saved
        end
        if type(saved.slots) ~= "table" then
            saved.slots = {}

            if type(saved.left) == "number" and type(saved.top) == "number" then
                saved.slots[1] = { left = saved.left, top = saved.top, scale = saved.scale }
            end
            saved.left, saved.top, saved.scale, saved.collapsed = nil, nil, nil, nil
        end
        return saved
    end

    local function Slot(index)
        local slots = Saved().slots
        if type(slots[index]) ~= "table" then slots[index] = {} end
        return slots[index]
    end


    local function TrackedList()
        local db = CharDB()
        local list = db.trackedDungeons
        if type(list) ~= "table" then
            list = {}
            db.trackedDungeons = list
        end

        if type(db.trackedDungeon) == "string" then
            local old = db.trackedDungeon
            db.trackedDungeon = nil
            local have = false
            for _, name in ipairs(list) do if name == old then have = true end end
            if not have then table.insert(list, old) end
        end
        for i = #list, 1, -1 do
            if type(list[i]) ~= "string" or not (FDJ.DB and FDJ.DB[list[i]]) then table.remove(list, i) end
        end
        return list
    end






    local function Trackable(name)
        local d = name and FDJ.DB and FDJ.DB[name]
        if not d then return false end
        return true
    end

    local function IsTracked(name)
        if not Trackable(name) then return false end
        for _, tracked in ipairs(TrackedList()) do
            if tracked == name then return true end
        end
        return false
    end


    local function ShownTracked()
        local list = {}
        for _, name in ipairs(TrackedList()) do
            if Trackable(name) then list[#list + 1] = name end
        end
        return list
    end


    local function Folded()
        local db = CharDB()
        if type(db.trackerFolded) ~= "table" then db.trackerFolded = {} end
        return db.trackerFolded
    end


    local function WindowSlots()
        local db = CharDB()
        if type(db.trackerSlots) ~= "table" then db.trackerSlots = {} end
        return db.trackerSlots
    end

    local function Faction()
        local ok, faction = pcall(UnitFactionGroup, "player")
        faction = ok and Plain(faction) or nil
        if faction == "Alliance" or faction == "Horde" then return faction end
        local saved = ForeverDungeonJournalDB and ForeverDungeonJournalDB.questFaction
        return saved == "Horde" and "Horde" or "Alliance"
    end

    local function Matches(quest, faction)
        if FDJ.QuestMatchesFaction then return FDJ.QuestMatchesFaction(quest, faction) end
        return quest.faction == "Both" or quest.faction == "Neutral" or quest.faction == faction
    end



    local function QuestsOf(name)
        local list = {}
        local dungeon = name and FDJ.DB and FDJ.DB[name]
        if type(dungeon) ~= "table" or dungeon.previewOnly then return list end
        local faction = Faction()
        for _, quest in ipairs(dungeon.quests or {}) do
            if type(quest) == "table" and type(quest.id) == "number" and quest.name
                and not quest.repeatable and not quest.hideFromMainList and Matches(quest, faction)
                and (not FDJ.QuestCountsForCharacter or FDJ.QuestCountsForCharacter(quest))
                and not (FDJ.IsQuestUnavailable and FDJ.IsQuestUnavailable(quest))
                and not (FDJ.RPGQuestHidden and FDJ.RPGQuestHidden(name, quest)) then
                list[#list + 1] = quest
            end
        end
        return list
    end

    local function Locked(name)
        if not FDJ.IsDungeonLocked then return false end
        local ok, locked = pcall(FDJ.IsDungeonLocked, name)
        return ok and locked == true
    end

    local function Field(id, field, fallback)
        if FDJ.LocalizeQuestField then
            local value = FDJ.LocalizeQuestField(id, field, fallback)
            if type(value) == "string" and value ~= "" then return value end
        end
        return fallback
    end


    local function TurnedIn(id)
        if FDJ.QuestTurnedIn then return FDJ.QuestTurnedIn(id) == true end
        local check = (C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted) or IsQuestFlaggedCompleted
        if type(check) ~= "function" then return false end
        local ok, value = pcall(check, id)
        return ok and value == true
    end

    local function LogIndex(id)
        if C_QuestLog and type(C_QuestLog.GetLogIndexForQuestID) == "function" then
            local ok, index = pcall(C_QuestLog.GetLogIndexForQuestID, id)
            if ok and type(index) == "number" and index > 0 then return index end
        end
        if type(GetQuestLogIndexByID) == "function" then
            local ok, index = pcall(GetQuestLogIndexByID, id)
            if ok and type(index) == "number" and index > 0 then return index end
        end
        return nil
    end

    local function InLog(id)
        if FDJ.IsQuestInLog then return FDJ.IsQuestInLog(id) == true end
        return LogIndex(id) ~= nil
    end



    local function State(id)
        if TurnedIn(id) then return "done" end
        if InLog(id) then
            if FDJ.IsQuestFinished and FDJ.IsQuestFinished(id) then return "ready" end
            return "log"
        end
        return "todo"
    end


    local function CountFirst(text)
        local what, count = text:match("^(.-)%s*:%s*(%d+%s*/%s*%d+)%s*$")
        if what and what ~= "" then return count .. " " .. what end
        return text
    end

    local function Objectives(id, goal)
        local lines = {}
        if C_QuestLog and type(C_QuestLog.GetQuestObjectives) == "function" then
            local ok, list = pcall(C_QuestLog.GetQuestObjectives, id)
            if ok and type(list) == "table" then

                local own = FDJ.LocalizeObjectives and FDJ.LocalizeObjectives(id, list, goal)
                if own then
                    for _, line in ipairs(own) do lines[#lines + 1] = { CountFirst(line[1]), line[2] } end
                    return lines
                end
                for i, objective in ipairs(list) do
                    local text = type(objective) == "table" and Plain(objective.text) or nil
                    if type(text) == "string" and text ~= "" then
                        local named, done = FDJ.ObjectiveLineOverride(id, text, FDJ.ObjectiveDone(id, i, objective))
                        lines[#lines + 1] = { FDJ.ObjectiveDoneText(named ~= text and named or CountFirst(text), done), done }
                    end
                end
                if #lines == 0 and #list == 0 and LogIndex(id) then
                    local named, done = FDJ.ObjectiveLineMissing(id)
                    if named then lines[1] = { named, done } end
                end
                return lines
            end
        end
        local index = LogIndex(id)
        if index and type(GetNumQuestLeaderBoards) == "function" and type(GetQuestLogLeaderBoard) == "function" then
            local okCount, count = pcall(GetNumQuestLeaderBoards, index)
            for i = 1, (okCount and type(count) == "number") and count or 0 do
                local ok, text, _, finished = pcall(GetQuestLogLeaderBoard, i, index)
                text = ok and Plain(text) or nil
                if type(text) == "string" and text ~= "" then
                    local named, done = FDJ.ObjectiveLineOverride(id, text, finished == true or finished == 1)
                    lines[#lines + 1] = { named ~= text and named or CountFirst(text), done }
                end
            end
        end
        return lines
    end




    local function ObjectiveText(id, indent, goal)
        local parts = {}
        local twin = FDJ.QUEST_TWINS and FDJ.QUEST_TWINS[id]
        if twin and FDJ.IsQuestInLog and FDJ.IsQuestInLog(twin) then id = twin end
        for _, line in ipairs(Objectives(id, goal)) do
            local text, finished = line[1], line[2]
            local color = "|cffe8e8e8"
            if finished then
                color = text:find("%d+%s*/%s*%d+") and Hex(GREY) or "|cffffffff"
            end
            parts[#parts + 1] = (indent or "") .. color .. text .. "|r"
        end
        return parts
    end




    local function StartsInDungeon(quest, dungeonName)
        if quest.startsInDungeon then return true end


        local fromChain = FDJ.ChainStartsInside and FDJ.ChainStartsInside(quest, dungeonName, true)
        if fromChain ~= nil then return fromChain == true end
        if FDJ.StartsInsideDungeon ~= nil and FDJ.StartsInsideDungeon(quest.pickup) == true then return true end

        return FDJ.StartItemDropsIn ~= nil and FDJ.StartItemDropsIn(quest, dungeonName) == true
    end


    local function ChainsOpen()
        local db = CharDB()
        if type(db.trackerChains) ~= "table" then db.trackerChains = {} end
        return db.trackerChains
    end



    local canUseItems
    local function CanUseItems()
        if canUseItems == nil then
            local ok, b = pcall(CreateFrame, "Button", nil, nil, "InsecureActionButtonTemplate")
            canUseItems = ok and b ~= nil
            if ok and b then b:Hide() end
        end
        return canUseItems
    end


    local function StartItemInBags(quest)
        if not CanUseItems() then return nil end
        local item = quest.startItem
        local id = type(item) == "table" and tonumber(item[1]) or nil
        if not id or id <= 0 then return nil end
        local count = (C_Item and C_Item.GetItemCount) or GetItemCount
        if type(count) ~= "function" then return nil end
        local ok, n = pcall(count, id)
        n = ok and Plain(n) or nil
        if type(n) == "number" and n > 0 then return id end
        return nil
    end


    local function ChainStep(quest)
        local chain = FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[quest.id]
        if type(chain) ~= "table" then return nil end
        for _, step in ipairs(chain) do
            if type(step) == "table" and type(step.id) == "number" and InLog(step.id) and not TurnedIn(step.id) then
                return step
            end
        end
        return nil
    end





    local npcSpots, dungeonNpcs
    local function NpcOf(loc)
        if type(loc) ~= "table" or not loc.mapID then return nil end
        local name = loc.targetName
        if type(name) ~= "string" or name == "" then
            local label = loc.label
            if type(label) ~= "string" then return nil end
            name = label:match("^(.-)%s+\226\128\148") or label:match("^([^,]+)") or label
        end
        name = name:gsub("^%s+", ""):gsub("%s+$", "")
        return name ~= "" and name:lower() or nil
    end

    local function NpcName(text)
        if type(text) ~= "string" then return nil end
        local name = text:match("^([^,(]+)")
        name = name and name:gsub("^%s+", ""):gsub("%s+$", ""):lower()
        if not name or name == "" then return nil end
        return name
    end
    local function NpcSpot(name)
        if not npcSpots then
            npcSpots = {}
            local function Add(loc)
                local npc = NpcOf(loc)
                if npc and not npcSpots[npc] then npcSpots[npc] = loc end
            end
            for _, loc in ipairs(FDJ.TURNIN_SPOTS or {}) do Add(loc) end
            for _, loc in pairs(FDJ.QUEST_START_MAPS or {}) do Add(loc) end
            for _, details in pairs(FDJ.QUEST_PREREQ_DETAILS or {}) do
                if type(details) == "table" then Add(details.map); Add(details.turninMap) end
            end
        end
        if npcSpots[name] or type(name) ~= "string" then return npcSpots[name] end



        npcSpots.titled = npcSpots.titled or {}
        local known = npcSpots.titled[name]
        if known ~= nil then return known or nil end
        local hit, count = nil, 0
        for key, loc in pairs(npcSpots) do
            if key ~= "titled" and ((#key > #name and key:sub(-(#name + 1)) == " " .. name)
                or (#name > #key and name:sub(-(#key + 1)) == " " .. key)) then
                hit, count = loc, count + 1
            end
        end
        hit = count == 1 and hit or nil
        npcSpots.titled[name] = hit or false
        return hit
    end


    local function DungeonNpc(name)
        if not dungeonNpcs then
            dungeonNpcs = {}
            for dungeon, data in pairs(FDJ.DUNGEON_MAPS or {}) do
                for _, spot in ipairs(type(data) == "table" and data.turnins or {}) do
                    if type(spot) == "table" and type(spot.npc) == "string" then
                        dungeonNpcs[spot.npc:lower()] = { dungeon = dungeon, spot = spot }
                    end
                end
            end


            for dungeon, data in pairs(FDJ.DUNGEON_MAPS or {}) do
                for _, boss in ipairs(type(data) == "table" and data.bosses or {}) do
                    local key = type(boss) == "table" and type(boss.name) == "string" and boss.name:lower()
                    if key and boss.x and boss.y and not dungeonNpcs[key] then
                        dungeonNpcs[key] = { dungeon = dungeon, spot = { floor = boss.floor or 1, x = boss.x, y = boss.y, npc = boss.name } }
                    end
                end
            end
        end
        return dungeonNpcs[name]
    end

    local questDungeons
    local function QuestDungeon(id)
        if not questDungeons then
            questDungeons = {}
            for dungeon, data in pairs(FDJ.DB or {}) do
                for _, listed in ipairs(type(data) == "table" and data.quests or {}) do
                    if type(listed) == "table" and listed.id and not questDungeons[listed.id] then questDungeons[listed.id] = dungeon end
                end
            end
            for mainID, chain in pairs(FDJ.QUEST_PREREQ_CHAINS or {}) do
                local dungeon = questDungeons[mainID]
                for _, step in ipairs((dungeon and type(chain) == "table") and chain or {}) do
                    if type(step) == "table" and step.id and not questDungeons[step.id] then questDungeons[step.id] = dungeon end
                end
            end
        end
        return id and questDungeons[id] or nil
    end




    local dungeonNames
    local function NamedDungeon(quest)
        local where = type(quest) == "table" and quest.turnin
        if type(where) ~= "string" then return nil end
        local last = where:gsub("%b()", ""):match("([^,]*)$") or ""
        last = last:lower():gsub("^%s+", ""):gsub("%s+$", "")
        last = last:gsub("^just ", ""):gsub("^inside ", "")
        if last == "" then return nil end
        if not dungeonNames then
            dungeonNames = {}
            local function Add(key, dungeon)
                dungeonNames[key] = dungeonNames[key] or {}
                table.insert(dungeonNames[key], dungeon)
            end
            for dungeon in pairs(FDJ.DB or {}) do
                local full = dungeon:lower()
                Add(full, dungeon)
                local base = full:match("^(.-):")
                if base and base ~= "" then Add(base, dungeon) end
            end
            for _, list in pairs(dungeonNames) do table.sort(list) end
        end
        local list = dungeonNames[last]
        if not list then return nil end
        local own = QuestDungeon(quest.id)
        for _, dungeon in ipairs(list) do
            if dungeon == own then return dungeon end
        end
        for _, dungeon in ipairs(list) do
            if FDJ.DUNGEON_MAPS and FDJ.DUNGEON_MAPS[dungeon] then return dungeon end
        end
        return list[1]
    end


    local function InsideDungeon(quest)
        local maps = FDJ.DUNGEON_MAPS or {}
        local named = NamedDungeon(quest)
        if named then return maps[named] and named or nil end
        local where = type(quest) == "table" and quest.turnin
        if type(where) ~= "string" or not where:lower():find("inside", 1, true) then return nil end
        local dungeon = QuestDungeon(quest.id)
        return dungeon and maps[dungeon] and dungeon or nil
    end



    local questPins
    local function QuestPin(quest)
        local id = type(quest) == "table" and quest.id
        if not id then return nil end
        if not questPins then
            questPins = {}
            for dungeon, pins in pairs(FDJ.MAP_QUEST_PINS or {}) do
                for _, pin in ipairs(type(pins) == "table" and pins or {}) do
                    for _, spot in ipairs(type(pin) == "table" and pin.spots or {}) do
                        for _, q in ipairs(type(spot) == "table" and spot.quests or {}) do
                            local ends = false
                            for _, act in ipairs(type(q) == "table" and q.acts or {}) do
                                if act == "end" then ends = true end
                            end
                            if ends and q.id and pin.x and pin.y then
                                local list = questPins[q.id] or {}
                                questPins[q.id] = list
                                list[#list + 1] = { dungeon = dungeon, spot = { floor = pin.floor or 1, x = pin.x, y = pin.y, npc = spot.name } }
                            end
                        end
                    end
                end
            end
        end
        local list = questPins[id]
        if not list then return nil end
        local name = NpcName(quest.turnin)
        for _, hit in ipairs(list) do
            if name and type(hit.spot.npc) == "string" and hit.spot.npc:lower() == name then return hit end
        end
        return list[1]
    end


    local function DungeonTurnIn(quest)
        local pinned = QuestPin(quest)
        if pinned then return pinned end
        local name = NpcName(quest.turnin)
        local known = name and DungeonNpc(name)
        if known then return known end
        local dungeon = InsideDungeon(quest)
        return dungeon and { dungeon = dungeon, spot = {} } or nil
    end


    local function EntranceSpot(quest)
        local dungeon = NamedDungeon(quest)
        if not dungeon and type(quest.turnin) == "string" and quest.turnin:lower():find("inside", 1, true) then
            dungeon = QuestDungeon(quest.id)
        end
        local data = dungeon and FDJ.DB and FDJ.DB[dungeon]
        local entrance = type(data) == "table" and data.entrance
        if type(entrance) ~= "table" or not entrance.mapID or not entrance.x or not entrance.y then return nil end
        return { mapID = entrance.mapID, x = entrance.x, y = entrance.y, label = entrance.label, detail = entrance.detail }
    end
    local function TurnInSpot(quest)


        local given = quest.turninMap
        if type(given) == "table" and given.mapID then return given end



        if QuestPin(quest) then return nil end
        local name = NpcName(quest.turnin)
        if not name then return nil end
        local own = FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[quest.id]
        if own and NpcOf(own) == name then return own end
        local spot = NpcSpot(name)
        if spot then return spot end
        if DungeonTurnIn(quest) then return nil end
        return EntranceSpot(quest)
    end


    local function StartSpot(quest)
        if quest.startItem then return nil end
        local loc = quest.startMap or (FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[quest.id])
        if type(loc) == "table" and loc.mapID then return loc end
        local name = NpcName(quest.pickup)
        return name and NpcSpot(name) or nil
    end

    local function DungeonStart(quest)
        if quest.startItem then return nil end
        local name = NpcName(quest.pickup)
        return name and DungeonNpc(name) or nil
    end

    local function PlayerLevel()
        if type(UnitLevel) ~= "function" then return nil end
        local ok, level = pcall(UnitLevel, "player")
        level = ok and Plain(level) or nil
        return type(level) == "number" and level or nil
    end



    local function RowInfo(quest, level)
        local id = quest.id
        local info = { quest = quest, state = State(id), name = Field(id, "name", quest.name) }
        if info.state == "done" then
            info.icon, info.grey, info.color = ICON_DONE, false, DONE
        elseif info.state == "ready" then
            info.icon, info.grey, info.color = ICON_LOG, false, GOLD
            info.sub = Hex(GREEN) .. T("TRACK_READY") .. "|r"
            info.turnin = TurnInSpot(quest)
            if not info.turnin then info.dungeonTurnin = DungeonTurnIn(quest) end
        elseif info.state == "log" then
            info.icon, info.grey, info.color = ICON_LOG, true, GOLD




            local goTo = quest.objectiveMap
            if type(goTo) == "table" and goTo.mapID then
                info.turnin, info.goTo = goTo, true
            else
                info.turnin = TurnInSpot(quest)
            end
            if not info.turnin then info.dungeonTurnin = DungeonTurnIn(quest) end
            local parts = ObjectiveText(id, nil, quest.objective)
            if #parts == 0 then

                local goal = Field(id, "objective", quest.objective)
                if type(goal) == "string" and goal ~= "" then
                    parts[1] = "|cffcfcfcf" .. goal .. "|r"
                    info.short = true
                end
            end
            info.sub = #parts > 0 and table.concat(parts, "\n") or nil




            if quest.logNoteKey then
                local dungeon = quest.logNoteDungeon and FDJ.LocalizeDungeonName and FDJ.LocalizeDungeonName(quest.logNoteDungeon) or quest.logNoteDungeon or ""
                local note = "|cffff8040" .. T(quest.logNoteKey, dungeon) .. "|r"
                info.sub = info.sub and (info.sub .. "\n" .. note) or note
            end
        else
            info.low = type(quest.requires) == "number" and level ~= nil and level < quest.requires
            info.icon, info.grey, info.color = ICON_TODO, info.low, info.low and GREY or TODO


            info.start = StartSpot(quest)
            local chain = FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[quest.id]
            if type(chain) == "table" and not ChainStep(quest) then
                for _, s in ipairs(chain) do
                    if type(s) == "table" and type(s.id) == "number" and not s.itemStep and not TurnedIn(s.id) then
                        local d = (FDJ.QUEST_PREREQ_DETAILS and FDJ.QUEST_PREREQ_DETAILS[s.id]) or {}
                        info.start = StartSpot({ id = s.id, pickup = d.pickup, startMap = d.map, startItem = d.startItem }) or info.start
                        break
                    end
                end
            end
            if not info.start then info.dungeonStart = DungeonStart(quest) end
            local step = ChainStep(quest)
            if step then
                info.step = step
                info.stepName = Field(step.id, "name", step.name or "")


                local stepIndex
                for i, s in ipairs(FDJ.QUEST_PREREQ_CHAINS[quest.id] or {}) do
                    if s == step then stepIndex = i break end
                end

                if stepIndex and FDJ.ChainStepNumber then stepIndex = FDJ.ChainStepNumber(FDJ.QUEST_PREREQ_CHAINS[quest.id], stepIndex) end
                info.stepLabel = stepIndex and (stepIndex .. ". " .. info.stepName) or info.stepName

                local parts = { Hex(GOLD) .. info.stepLabel .. "|r" }
                local stepDetails = FDJ.QUEST_PREREQ_DETAILS and FDJ.QUEST_PREREQ_DETAILS[step.id]
                for _, line in ipairs(ObjectiveText(step.id, "   ", stepDetails and stepDetails.objective)) do parts[#parts + 1] = line end
                info.stepText = table.concat(parts, "\n")

                if FDJ.IsQuestFinished and FDJ.IsQuestFinished(step.id) then
                    info.stepTurnIn = { id = step.id, turnin = stepDetails and stepDetails.turnin, turninMap = stepDetails and stepDetails.turninMap }
                end
            end
            local chain = FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[quest.id]
            if type(chain) == "table" and #chain > 0 then
                info.chain = chain
                info.chainOpen = ChainsOpen()[quest.id] == true
            end
        end
        return info
    end



    local function ChainSteps(info)
        local out, current = {}, false
        local chain = info.chain or {}
        local index = 1
        while index <= #chain do
            local step = chain[index]




            local last, combined = index, nil
            if type(step) == "table" and step.choice ~= nil and FDJ.ChainChoiceEnd then
                last = FDJ.ChainChoiceEnd(chain, index)
                if last > index then
                    local pick
                    for k = index, last do
                        local s = chain[k]
                        if type(s) == "table" and type(s.id) == "number" and InLog(s.id) and not TurnedIn(s.id) then pick = s break end
                    end
                    if pick then
                        step = pick
                    else
                        local names = {}
                        for k = index, last do
                            local s = chain[k]
                            if type(s) == "table" then names[#names + 1] = Field(s.id, "name", s.name or "") end
                        end
                        combined = names
                    end
                end
            end
            if type(step) == "table" then
                local id = step.id
                local details = (id and FDJ.QUEST_PREREQ_DETAILS and FDJ.QUEST_PREREQ_DETAILS[id]) or {}
                local entry = { step = step, index = index, details = details, name = combined and T("CHAIN_PICK_ONE") or Field(id, "name", step.name or ""), combined = combined ~= nil }
                if combined then entry.arrowName = combined[1] end
                entry.label = ((FDJ.ChainStepNumber and FDJ.ChainStepNumber(chain, index)) or index) .. ". "
                if step.itemStep or type(id) ~= "number" then
                    entry.state = "item"
                elseif TurnedIn(id) then
                    entry.state = "done"
                elseif InLog(id) then
                    current = true
                    entry.parts = ObjectiveText(id, "   ", details.objective)
                    entry.turnin = TurnInSpot({ id = id, turnin = details.turnin, turninMap = details.turninMap })
                    if FDJ.IsQuestFinished and FDJ.IsQuestFinished(id) then
                        entry.state = "ready"
                    else
                        entry.state = "log"





                        local goTo = details.objectiveMap
                        if type(goTo) == "table" and goTo.mapID then entry.turnin, entry.goTo = goTo, true end
                    end



                    if not entry.turnin and type(details.arrowAt) == "table" and details.arrowAt.mapID then
                        entry.turnin, entry.goTo = details.arrowAt, true
                    end
                elseif not current then
                    current = true
                    entry.state = "next"
                    entry.start = StartSpot({ id = id, pickup = details.pickup, startMap = details.map, startItem = details.startItem })


                    if not entry.start and type(details.arrowAt) == "table" and details.arrowAt.mapID then
                        entry.start, entry.goTo = details.arrowAt, true
                    end
                else
                    entry.state = "later"
                end

                if combined and entry.state ~= "done" then
                    entry.parts = {}
                    for _, name in ipairs(combined) do entry.parts[#entry.parts + 1] = "   " .. Hex(entry.state == "next" and TODO or GREY) .. "- " .. name .. "|r" end
                end
                out[#out + 1] = entry
            end
            index = last + 1
        end
        return out
    end



    local function RouteOn() return false end
    local function Routes() return {} end
    local function RouteSkips() return {} end
    local function OptedOut() return false end





    local NINE = { "TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner",
        "TopEdge", "BottomEdge", "LeftEdge", "RightEdge" }
    local TOP_CORNERS = { "TopLeftCorner", "TopRightCorner" }
    local BOTTOM_CORNERS = { "BottomLeftCorner", "BottomRightCorner" }

    local function GameArt(f)
        local nine = _G.SettingsPanel and _G.SettingsPanel.NineSlice
        if not nine or not nine.TopLeftCorner or not nine.BottomLeftCorner then return false end



        local clip = CreateFrame("Frame", nil, f)
        clip:SetFrameLevel(f:GetFrameLevel() + 1)
        local holder = CreateFrame("Frame", nil, clip)
        holder:SetAllPoints(f)
        holder:SetFrameLevel(f:GetFrameLevel() + 1)
        local made, keyOf = {}, {}
        for _, key in ipairs(NINE) do
            if nine[key] then keyOf[nine[key]] = key end
        end
        for _, key in ipairs(NINE) do
            local src = nine[key]
            local atlas = src and src.GetAtlas and src:GetAtlas()
            if atlas then
                local layer, sub = src:GetDrawLayer()
                local t = holder:CreateTexture(nil, layer or "BORDER", nil, sub or 0)
                t:SetAtlas(atlas, false)
                if src.GetHorizTile and t.SetHorizTile then t:SetHorizTile(src:GetHorizTile()) end
                if src.GetVertTile and t.SetVertTile then t:SetVertTile(src:GetVertTile()) end
                if src.GetVertexColor then t:SetVertexColor(src:GetVertexColor()) end
                t:SetSize(src:GetWidth(), src:GetHeight())
                made[key] = t
            end
        end
        for _, key in ipairs(NINE) do
            if not made[key] then clip:Hide() return false end
        end
        for key, t in pairs(made) do
            local src = nine[key]
            for i = 1, src:GetNumPoints() do
                local point, rel, relPoint, x, y = src:GetPoint(i)
                local target = holder
                if rel and keyOf[rel] and made[keyOf[rel]] then target = made[keyOf[rel]] end
                t:SetPoint(point, target, relPoint, x, y)
            end
        end
        local reach = {}
        for _, key in ipairs({ "TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner" }) do
            local t, src = made[key], nine[key]
            local _, _, _, x, y = src:GetPoint(1)
            t.fdjFullH = src:GetHeight()
            t.fdjOffsetY = y or 0
            t.fdjCoords = { t:GetTexCoord() }
            reach[key] = { x or 0, y or 0 }
            if not (t.fdjFullH and t.fdjFullH > 0 and #t.fdjCoords >= 8) then clip:Hide() return false end
        end
        local clipRight = math.max(0, reach.TopRightCorner[1], reach.BottomRightCorner[1])
        local clipBottom = math.min(0, reach.BottomLeftCorner[2], reach.BottomRightCorner[2])
        clip:SetPoint("TOPLEFT", f, "TOPLEFT", math.min(0, reach.TopLeftCorner[1], reach.BottomLeftCorner[1]),
            math.max(0, reach.TopLeftCorner[2], reach.TopRightCorner[2]))
        clip:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", clipRight, clipBottom)
        if clip.SetClipsChildren then clip:SetClipsChildren(true) end
        f.art = made
        f.artHolder = holder
        f.artClip = clip
        f.artClipRight, f.artClipBottom = clipRight, clipBottom
        return true
    end





    local UNDER_TITLE = { "BottomLeftCorner", "BottomRightCorner", "BottomEdge", "LeftEdge", "RightEdge" }

    local function FitArt(f, height, folded)
        local art = f.art
        if not art then return end
        local tl, bl = art.TopLeftCorner, art.BottomLeftCorner
        local above, below = math.max(0, tl.fdjOffsetY), math.max(0, -bl.fdjOffsetY)
        local function Crop(t, keep, fromTop)
            local c = t.fdjCoords
            local left, top, bottom, right = c[1], c[2], c[4], c[5]
            local part = (bottom - top) * keep / t.fdjFullH
            if fromTop then
                t:SetTexCoord(left, right, top, top + part)
            else
                t:SetTexCoord(left, right, bottom - part, bottom)
            end
            t:SetHeight(keep)
        end
        if folded then
            local keep = math.max(1, math.min(tl.fdjFullH, above + height))
            for _, key in ipairs(TOP_CORNERS) do Crop(art[key], keep, true) end
            for _, key in ipairs(UNDER_TITLE) do art[key]:Hide() end
            f.artClip:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", f.artClipRight, 0)
            return
        end
        f.artClip:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", f.artClipRight, f.artClipBottom)
        art.BottomLeftCorner:Show()
        art.BottomRightCorner:Show()
        art.BottomEdge:Show()
        local space = height + above + below
        local keepTop, keepBottom = tl.fdjFullH, bl.fdjFullH
        if keepTop + keepBottom > space then
            local minBottom = math.min(bl.fdjFullH, below + 10)
            keepTop = math.max(math.min(tl.fdjFullH, above + TITLE_H + 2), math.min(tl.fdjFullH, space - minBottom))
            keepBottom = math.max(1, math.min(bl.fdjFullH, space - keepTop))
        end
        for _, key in ipairs(TOP_CORNERS) do Crop(art[key], keepTop, true) end
        for _, key in ipairs(BOTTOM_CORNERS) do Crop(art[key], keepBottom, false) end
        local gap = space - keepTop - keepBottom
        art.LeftEdge:SetShown(gap > 0.5)
        art.RightEdge:SetShown(gap > 0.5)
    end



    local WINDOW_EDGE = {
        { 51, 31, 14 }, { 182, 150, 104 }, { 177, 150, 109 }, { 49, 31, 16 },
        { 112, 76, 38 }, { 59, 41, 25 }, { 10, 7, 6 },
    }
    local TITLE_RULE = { { 26, 17, 12 }, { 58, 39, 18 }, { 107, 74, 34 }, { 93, 67, 37 }, { 40, 16, 4 } }
    local function LinedArt(f)
        for i, c in ipairs(WINDOW_EDGE) do
            local d = i - 1
            local function Line()
                local t = f:CreateTexture(nil, "BORDER")
                t:SetTexture(WHITE)
                t:SetVertexColor(c[1] / 255, c[2] / 255, c[3] / 255, 1)
                return t
            end
            local top = Line(); top:SetPoint("TOPLEFT", d, -d); top:SetPoint("TOPRIGHT", -d, -d); top:SetHeight(1)
            local left = Line(); left:SetPoint("TOPLEFT", d, -d); left:SetPoint("BOTTOMLEFT", d, d); left:SetWidth(1)
            local right = Line(); right:SetPoint("TOPRIGHT", -d, -d); right:SetPoint("BOTTOMRIGHT", -d, d); right:SetWidth(1)
            local bottom = Line(); bottom:SetPoint("BOTTOMLEFT", d, d); bottom:SetPoint("BOTTOMRIGHT", -d, d); bottom:SetHeight(1)
        end
        local bar = f:CreateTexture(nil, "BACKGROUND", nil, 2)
        bar:SetPoint("TOPLEFT", 7, -7)
        bar:SetPoint("TOPRIGHT", -7, -7)
        bar:SetHeight(TITLE_H - 10)
        bar:SetTexture(WHITE)
        bar:SetVertexColor(0.15, 0.095, 0.06, 1)
        for i, c in ipairs(TITLE_RULE) do
            local t = f:CreateTexture(nil, "BORDER")
            t:SetTexture(WHITE)
            t:SetVertexColor(c[1] / 255, c[2] / 255, c[3] / 255, 1)
            t:SetPoint("TOPLEFT", bar, "BOTTOMLEFT", 0, -(i - 1))
            t:SetPoint("TOPRIGHT", bar, "BOTTOMRIGHT", 0, -(i - 1))
            t:SetHeight(1)
        end
        for _, p in ipairs({ "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT" }) do
            local glint = f:CreateTexture(nil, "ARTWORK")
            glint:SetTexture(WHITE)
            glint:SetVertexColor(0.85, 0.77, 0.62, 1)
            glint:SetSize(3, 3)
            glint:SetPoint(p, (p:find("LEFT") and 1 or -1), (p:find("TOP") and -1 or 1))
        end
    end




    local function OnScreen(f, left, top)
        local s = f:GetEffectiveScale() or 1
        local u = ((UIParent and UIParent:GetEffectiveScale()) or 1) / s
        local sw = ((UIParent and UIParent:GetWidth()) or 0) * u
        local sh = ((UIParent and UIParent:GetHeight()) or 0) * u
        local w, h = f:GetWidth() or 0, f:GetHeight() or 0
        if sw > w then left = math.max(0, math.min(left, sw - w)) end
        if sh > h then top = math.max(h, math.min(top, sh)) end
        return left, top
    end

    local function SavePosition(f)
        local left, top = f:GetLeft(), f:GetTop()
        if not left or not top then return end
        left, top = OnScreen(f, left, top)
        local slot = Slot(f.slot)
        slot.left, slot.top = math.floor(left + 0.5), math.floor(top + 0.5)
        f:ClearAllPoints()
        f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", slot.left, slot.top)
    end



    local function Place(f)
        local slot = Slot(f.slot)
        f:ClearAllPoints()
        if type(slot.left) == "number" and type(slot.top) == "number" then
            f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", slot.left, slot.top)
            return
        end
        local prev = windows[f.slot - 1]
        local left, bottom = prev and prev:IsShown() and prev:GetLeft(), prev and prev:IsShown() and prev:GetBottom()
        if left and bottom then
            local ratio = (prev:GetEffectiveScale() or 1) / (f:GetEffectiveScale() or 1)
            f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left * ratio, bottom * ratio - WINDOW_GAP)
            SavePosition(f)
        else
            f:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -330, -230)
        end
    end

    local function WindowOf(region)
        while region and not region.fdjTracker do region = region:GetParent() end
        return region
    end





    local mover = CreateFrame("Frame")
    mover:Hide()
    local function MoveTo(f)
        local x, y = GetCursorPosition()
        local s = f:GetEffectiveScale() or 1
        local left, top = OnScreen(f, mover.left + (x - mover.x) / s, mover.top + (y - mover.y) / s)
        f:ClearAllPoints()
        f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top)
    end
    local function MoveEnd()
        local f = mover.window
        mover.window = nil
        mover:Hide()
        if not f then return end
        dragEndedAt = (GetTime and GetTime()) or 0
        SavePosition(f)
    end
    mover:SetScript("OnUpdate", function(self)
        local f = self.window
        if not f or not f:IsShown() then
            MoveEnd()
            return
        end
        MoveTo(f)
        if IsMouseButtonDown and not IsMouseButtonDown("LeftButton") then MoveEnd() end
    end)

    local function MoveStart(self)
        local f = WindowOf(self)
        if not f then return end
        local left, top = f:GetLeft(), f:GetTop()
        if not left or not top then return end
        mover.window, mover.left, mover.top = f, left, top
        mover.x, mover.y = GetCursorPosition()
        mover:Show()
    end

    local function MoveStop(self)
        local f = mover.window
        if not f or f ~= WindowOf(self) then return end
        MoveTo(f)
        MoveEnd()
    end


    local function JustDragged()
        return GetTime and (GetTime() - dragEndedAt) < 0.25
    end


    local function ScaleTo(f, scale)
        scale = math.max(MIN_SCALE, math.min(MAX_SCALE, scale))
        local eff = f:GetEffectiveScale()
        local left, top = f:GetLeft(), f:GetTop()
        f:SetScale(scale)
        if left and top then
            local now = f:GetEffectiveScale()
            f:ClearAllPoints()
            f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left * eff / now, top * eff / now)
        end
    end

    local function ShowJournal()
        local journal = _G.ForeverDungeonJournalFrame
        if not journal then return nil end
        if not journal:IsShown() then journal:Show() end
        return journal
    end

    local function OpenInJournal(name, questID)
        if not name or not FDJ.OpenQuestPage or not ShowJournal() then return end
        FDJ.OpenQuestPage(name, questID)
    end

    local function OpenChainStep(name, questID, stepID)
        if not name or not ShowJournal() then return end
        if FDJ.OpenQuestChainStep then
            FDJ.OpenQuestChainStep(name, questID, stepID)
        elseif FDJ.OpenQuestPage then
            FDJ.OpenQuestPage(name, questID)
        end
    end


    local function TooltipBeside(owner, gap)
        GameTooltip:SetOwner(owner, "ANCHOR_NONE")
        GameTooltip:ClearAllPoints()
        local f = WindowOf(owner)
        local x = f and f:GetCenter()
        local onRight = false
        if x and UIParent then
            local ratio = (f:GetEffectiveScale() or 1) / (UIParent:GetEffectiveScale() or 1)
            onRight = x * ratio > (UIParent:GetWidth() or 0) / 2
        end
        if onRight then
            GameTooltip:SetPoint("TOPRIGHT", owner, "TOPLEFT", -gap, 4)
        else
            GameTooltip:SetPoint("TOPLEFT", owner, "TOPRIGHT", gap, 4)
        end
    end

    local function ShowRowTooltip(row)
        local info = row.info
        if not info then return end
        local quest = info.quest
        TooltipBeside(row, SIDE + 6)
        GameTooltip:SetText(info.name or "", 1, 0.82, 0, 1, true)
        if info.state == "done" then
            GameTooltip:AddLine(T("TRACK_DONE"), GREEN[1], GREEN[2], GREEN[3])
        elseif info.state == "ready" then
            GameTooltip:AddLine(T("TRACK_READY"), GREEN[1], GREEN[2], GREEN[3])
        elseif info.state == "log" then
            GameTooltip:AddLine(T("TRACK_IN_LOG"), 1.00, 0.82, 0.10)
        elseif quest.requires then
            if info.low then
                GameTooltip:AddLine(T("AVAILABLE_FROM_LEVEL", quest.requires), 1.00, 0.30, 0.30)
            else
                GameTooltip:AddLine(T("AVAILABLE_FROM_LEVEL", quest.requires), 0.80, 0.80, 0.80)
            end
        end
        local goal = Field(quest.id, "objective", quest.objective)
        if type(goal) == "string" and goal ~= "" and info.state ~= "done" then
            GameTooltip:AddLine(goal, 1, 1, 1, true)
        end
        if info.state == "todo" and quest.pickup then
            GameTooltip:AddLine(Hex(GOLD) .. T("STARTS_AT") .. ":|r " .. (Field(quest.id, "pickup", quest.pickup) or ""), 0.90, 0.90, 0.90, true)
        elseif (info.state == "log" or info.state == "ready") and quest.turnin then
            GameTooltip:AddLine(Hex(GOLD) .. T("TURN_IN") .. ":|r " .. (Field(quest.id, "turnin", quest.turnin) or ""), 0.90, 0.90, 0.90, true)
        end
        GameTooltip:AddLine(T("TRACK_CLICK"), 0.55, 0.55, 0.55)
        GameTooltip:Show()
    end


    local function ShowStepTooltip(button)
        local row = button:GetParent()
        local info = row and row.info
        local step = info and info.step
        if not step then return end
        local details = FDJ.QUEST_PREREQ_DETAILS and FDJ.QUEST_PREREQ_DETAILS[step.id] or {}
        TooltipBeside(button, SIDE + TEXT_X + 6)
        GameTooltip:SetText(info.stepName or "", 1, 0.82, 0, 1, true)
        GameTooltip:AddLine(T("TRACK_IN_LOG"), 1.00, 0.82, 0.10)
        local goal = Field(step.id, "objective", details.objective)
        if type(goal) == "string" and goal ~= "" then GameTooltip:AddLine(goal, 1, 1, 1, true) end
        local turnin = Field(step.id, "turnin", details.turnin)
        if type(turnin) == "string" and turnin ~= "" then
            GameTooltip:AddLine(Hex(GOLD) .. T("TURN_IN") .. ":|r " .. turnin, 0.90, 0.90, 0.90, true)
        end
        GameTooltip:AddLine(T("TRACK_CLICK"), 0.55, 0.55, 0.55)
        GameTooltip:Show()
    end


    local function Highlight(button, x1, y1, x2, y2)
        local highlight = button:CreateTexture(nil, "HIGHLIGHT")
        highlight:SetPoint("TOPLEFT", button, "TOPLEFT", x1, y1)
        highlight:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", x2, y2)
        highlight:SetColorTexture(1, 0.82, 0.25, 0.08)
        return highlight
    end




    local function ShowChainLineTooltip(line)
        local entry = line.entry
        if not entry then return end
        local id, details = entry.step.id, entry.details
        TooltipBeside(line, SIDE + TEXT_X + 6)
        GameTooltip:SetText(entry.name or "", 1, 0.82, 0, 1, true)
        if entry.state == "done" then
            GameTooltip:AddLine(T("TRACK_DONE"), GREEN[1], GREEN[2], GREEN[3])
        elseif entry.state == "ready" then
            GameTooltip:AddLine(T("TRACK_READY"), GREEN[1], GREEN[2], GREEN[3])
        elseif entry.state == "log" then
            GameTooltip:AddLine(T("TRACK_IN_LOG"), 1.00, 0.82, 0.10)
        end

        local goal = (not entry.combined) and Field(id, "objective", details.objective) or nil
        if type(goal) == "string" and goal ~= "" and entry.state ~= "done" then GameTooltip:AddLine(goal, 1, 1, 1, true) end
        local turnin = Field(id, "turnin", details.turnin)
        if type(turnin) == "string" and turnin ~= "" and entry.state ~= "done" then
            GameTooltip:AddLine(Hex(GOLD) .. T("TURN_IN") .. ":|r " .. turnin, 0.90, 0.90, 0.90, true)
        end
        GameTooltip:AddLine(T("TRACK_CLICK"), 0.55, 0.55, 0.55)
        GameTooltip:Show()
    end

    local function MakeChainLine(row)
        local line = CreateFrame("Button", nil, row)
        line:RegisterForClicks("LeftButtonUp")
        line:RegisterForDrag("LeftButton")
        line.text = line:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
        line.text:SetPoint("TOPLEFT", line, "TOPLEFT", STEP_TEXT_X, 0)
        line.text:SetJustifyH("LEFT")
        line.text:SetWordWrap(true)
        if line.text.SetSpacing then line.text:SetSpacing(2) end
        Highlight(line, -3, 2, 3, -2):SetColorTexture(1, 0.82, 0.25, 0.14)
        local mark = CreateFrame("Button", nil, line)
        line.mark = mark
        mark:SetSize(STEP_ICON, STEP_ICON)
        mark:SetPoint("CENTER", line, "TOPLEFT", STEP_ICON / 2, -6)
        mark:SetFrameLevel(line:GetFrameLevel() + 2)
        mark:RegisterForClicks("LeftButtonUp")
        mark:RegisterForDrag("LeftButton")
        mark.icon = mark:CreateTexture(nil, "ARTWORK")
        mark.icon:SetAllPoints()
        mark.glow = mark:CreateTexture(nil, "HIGHLIGHT")
        mark.glow:SetAllPoints()
        mark.glow:SetBlendMode("ADD")
        mark:SetScript("OnClick", function(self)
            local entry = self:GetParent().entry
            if JustDragged() or not entry then return end
            local spot, turnIn = entry.start, nil
            if entry.state == "ready" or entry.state == "log" then spot, turnIn = entry.turnin, not entry.goTo end
            local show = FDJ.MapMarkers and FDJ.MapMarkers.ShowRecordedLocationOnMap
            if not spot or not show then return end
            spot = (FDJ.LocalizeMapLocation and FDJ.LocalizeMapLocation(spot)) or spot
            FDJ.pendingMarkerQuestTitle = (entry.arrowName or entry.name)
            FDJ.pendingMarkerTurnIn = turnIn
            FDJ.pendingMarkerQuestID = entry.step and entry.step.id
            FDJ.pendingMarkerObjective = entry.goTo and true or nil
            show(spot, spot.label)
        end)
        mark:SetScript("OnEnter", function(self)
            local entry = self:GetParent().entry
            if not entry then return end
            local id, details = entry.step.id, entry.details
            TooltipBeside(self, SIDE + 4)
            local where
            if entry.goTo and entry.state == "log" then
                GameTooltip:SetText(T("SHOW_ON_MAP"), 1, 0.82, 0)
                where = FDJ.LocalizeFreeText and FDJ.LocalizeFreeText(entry.turnin.label) or entry.turnin.label
            elseif entry.state == "ready" or entry.state == "log" then
                GameTooltip:SetText(T("SHOW_TURN_IN"), 1, 0.82, 0)
                where = Field(id, "turnin", details.turnin)
            else
                GameTooltip:SetText(T("SHOW_GIVER_ON_MAP"), 1, 0.82, 0)
                where = Field(id, "pickup", details.pickup)
            end
            if type(where) == "string" and where ~= "" then GameTooltip:AddLine(where, 1, 1, 1, true) end
            GameTooltip:Show()
        end)
        mark:SetScript("OnLeave", function() GameTooltip:Hide() end)
        mark:SetScript("OnDragStart", MoveStart)
        mark:SetScript("OnDragStop", MoveStop)
        line:SetScript("OnClick", function(self)
            local entry = self.entry
            local info = self:GetParent().info
            if JustDragged() or not entry or not info then return end
            if entry.step.id and FDJ.TryLinkQuest and FDJ.TryLinkQuest(entry.step.id, entry.name, nil) then return end
            local f = WindowOf(self)
            OpenChainStep(f and f.dungeon, info.quest.id, entry.step.id)
        end)
        line:SetScript("OnDragStart", MoveStart)
        line:SetScript("OnDragStop", MoveStop)
        line:SetScript("OnEnter", ShowChainLineTooltip)
        line:SetScript("OnLeave", function() GameTooltip:Hide() end)
        line:Hide()
        return line
    end


    local function SetChainLine(line, entry, width)
        line.entry = entry
        local mark, state = line.mark, entry.state
        local icon, grey, clickable
        if state == "done" then
            icon = ICON_DONE
        elseif state == "ready" then
            icon, clickable = ICON_LOG, entry.turnin ~= nil
        elseif state == "log" then
            icon, grey, clickable = ICON_LOG, true, entry.turnin ~= nil
        elseif state == "next" then
            icon, clickable = ICON_TODO, entry.start ~= nil
        end



        local roundMark = state == "ready" and entry.turnin ~= nil and FDJ.CreateTurnInButton ~= nil
        if roundMark then icon = nil end
        mark.icon:SetTexture(icon)
        mark.icon:SetDesaturated(grey == true)
        mark.icon:SetAlpha(grey and 0.75 or 1)
        mark.glow:SetTexture(icon)
        mark.glow:SetShown(clickable == true)
        mark:EnableMouse(clickable == true)
        mark:SetShown(icon ~= nil)
        local color = (state == "done" and DONE) or ((state == "ready" or state == "log") and GOLD)
            or (state == "next" and TODO) or GREY
        local label = (entry.label or (entry.index .. ". ")) .. (entry.name or "")
        local parts = { Hex(color) .. label .. "|r" }
        for _, text in ipairs(entry.parts or {}) do parts[#parts + 1] = text end
        local textW = math.max(40, width - STEP_TEXT_X)
        line.text:SetWidth(textW)
        line.text:SetText(table.concat(parts, "\n"))
        local height = math.max(12, line.text:GetStringHeight() or 12)
        line:SetSize(width, height)
        if roundMark then
            if not line.turnInMark then
                line.turnInMark = FDJ.CreateTurnInButton(line, 16)
                line.turnInMark:SetFrameLevel(line:GetFrameLevel() + 3)
                line.measure = line:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
                line.measure:Hide()
            end
            line.measure:SetText(label)
            local nameW = line.measure:GetStringWidth() or 0
            local size = FDJ.StepMarkSize()
            FDJ.ResizeTurnInButton(line.turnInMark, size)
            line.turnInMark:ClearAllPoints()
            line.turnInMark:SetPoint("LEFT", line, "TOPLEFT", STEP_TEXT_X + math.min(nameW + 4, math.max(0, textW - size)), -6)
            local details = entry.details or {}
            FDJ.SetTurnInButton(line.turnInMark,
                { id = entry.step and entry.step.id, turnin = details.turnin, turninMap = details.turninMap }, entry.name)
        elseif line.turnInMark then
            FDJ.SetTurnInButton(line.turnInMark, nil)
        end
        line:Show()
        return height
    end



    local function PressMark(mark, down)
        local button = mark.button
        if not button then return end
        button.ring:SetAtlas(down and POI_RING_DOWN or POI_RING)
        button.display:ClearAllPoints()
        button.display:SetPoint("CENTER", button, "CENTER", down and 1 or 0, down and -1 or 0)
        if mark.sharp then
            local shade = down and 0.8 or 1
            mark.sharp:SetVertexColor(shade, shade, shade)
            mark.sharp:ClearAllPoints()
            mark.sharp:SetPoint("CENTER", button, "CENTER", down and 1 or 0, down and -1 or 0)
        end
    end

    local function MakeRow(parent)
        local row = CreateFrame("Button", nil, parent)
        row:RegisterForClicks("LeftButtonUp")
        row:RegisterForDrag("LeftButton")






        local okMark, made = pcall(CreateFrame, "Button", nil, row, "InsecureActionButtonTemplate")
        local mark = okMark and made or CreateFrame("Button", nil, row)
        mark._fdjCanTarget = (okMark and made) and true or false
        if mark._fdjCanTarget then mark:SetAttribute("useOnKeyDown", false) end
        row.mark = mark
        mark:SetSize(ICON_SIZE, ICON_SIZE)
        mark:SetPoint("CENTER", row, "TOPLEFT", ICON_X, -7)
        mark:RegisterForClicks("LeftButtonUp")
        mark:RegisterForDrag("LeftButton")
        row.icon = mark:CreateTexture(nil, "ARTWORK")
        row.icon:SetSize(ICON_SIZE, ICON_SIZE)
        row.icon:SetPoint("CENTER", mark, "CENTER", 0, 0)
        if HasQuestButton() then


            local button = CreateFrame("Frame", nil, mark)
            mark.button = button
            button:SetSize(POI_SIZE, POI_SIZE)
            button:SetPoint("CENTER", mark, "CENTER", 0, 0)
            button.ring = button:CreateTexture(nil, "ARTWORK")
            button.ring:SetAtlas(POI_RING)
            button.ring:SetSize(POI_SIZE, POI_SIZE)
            button.ring:SetPoint("CENTER")
            button.lit = button:CreateTexture(nil, "OVERLAY")
            button.lit:SetAtlas(POI_LIT)
            button.lit:SetBlendMode("ADD")
            button.lit:SetSize(POI_SIZE, POI_SIZE)
            button.lit:SetPoint("CENTER")
            button.lit:Hide()
            button.display = CreateFrame("Frame", nil, button)
            button.display:SetSize(POI_SIZE, POI_SIZE)
            button.display:SetFrameLevel(button:GetFrameLevel() + 1)
            button.icon = button.display:CreateTexture(nil, "ARTWORK")
            button.icon:SetAtlas(POI_TURN_IN)
            button.icon:SetSize(POI_SIZE, POI_SIZE)
            button.icon:SetPoint("CENTER")
            PressMark(mark, false)
            button:Hide()
        else
            mark.halo = mark:CreateTexture(nil, "BACKGROUND")
            mark.halo:SetSize(ICON_SIZE + 10, ICON_SIZE + 10)
            mark.halo:SetPoint("CENTER")
            mark.halo:SetTexture(GLOW)
            mark.halo:SetBlendMode("ADD")
            mark.halo:SetAlpha(0.55)
        end


        mark.glow = mark:CreateTexture(nil, "HIGHLIGHT")
        mark.glow:SetAllPoints(row.icon)
        mark.glow:SetTexture(ICON_LOG)
        mark.glow:SetBlendMode("ADD")

        mark:SetScript(mark._fdjCanTarget and "PostClick" or "OnClick", function(self)
            local info = self:GetParent().info
            if JustDragged() or not info then return end
            if info.state == "todo" then


                if info.start then
                    local spot = (FDJ.LocalizeMapLocation and FDJ.LocalizeMapLocation(info.start)) or info.start
                    local show = FDJ.MapMarkers and FDJ.MapMarkers.ShowRecordedLocationOnMap
                    if not show then return end
                    FDJ.pendingMarkerQuestTitle = info.name
                    FDJ.pendingMarkerQuestID = info.quest and info.quest.id
                    show(spot, spot.label or info.quest.pickup)
                elseif info.dungeonStart and FDJ.ShowTurnInOnDungeonMap and ShowJournal() then
                    FDJ.ShowTurnInOnDungeonMap(info.dungeonStart.dungeon, info.dungeonStart.spot, info.name, info.quest.id, true)
                end
                return
            end
            local inside = info.dungeonTurnin
            if inside then

                if FDJ.ShowTurnInOnDungeonMap and ShowJournal() then
                    FDJ.ShowTurnInOnDungeonMap(inside.dungeon, inside.spot, info.name, info.quest.id)
                end
                return
            end
            if not info.turnin then return end
            local spot = (FDJ.LocalizeMapLocation and FDJ.LocalizeMapLocation(info.turnin)) or info.turnin
            local show = FDJ.MapMarkers and FDJ.MapMarkers.ShowRecordedLocationOnMap
            if not show then return end
            FDJ.pendingMarkerQuestTitle = info.name
            FDJ.pendingMarkerTurnIn = not info.goTo
            FDJ.pendingMarkerQuestID = info.quest and info.quest.id
            FDJ.pendingMarkerObjective = info.goTo and true or nil
            show(spot, spot.label)
        end)
        mark:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then PressMark(self, true) end
        end)
        mark:SetScript("OnMouseUp", function(self)
            PressMark(self, false)
        end)
        mark:SetScript("OnEnter", function(self)
            local info = self:GetParent().info
            if not info then return end

            local configure = FDJ.MapMarkers and FDJ.MapMarkers.ConfigureTargetAndMarkAction
            if configure then configure(self, (info.state == "todo" and info.start) or info.turnin or nil, true) end
            if info.state == "todo" then
                if not (info.start or info.dungeonStart) then return end
                TooltipBeside(self, SIDE + 4)
                GameTooltip:SetText(T("SHOW_GIVER_ON_MAP"), 1, 0.82, 0)
                local where = Field(info.quest.id, "pickup", info.quest.pickup)
                if type(where) == "string" and where ~= "" then GameTooltip:AddLine(where, 1, 1, 1, true) end
                GameTooltip:Show()
                return
            end
            if not (info.turnin or info.dungeonTurnin) then return end
            if self.button then self.button.lit:Show() end
            if self.halo then self.halo:SetAlpha(1) end
            TooltipBeside(self, SIDE + 4)
            local where
            if info.goTo then
                GameTooltip:SetText(T("SHOW_ON_MAP"), 1, 0.82, 0)
                where = info.quest.objectiveWhere
            else
                GameTooltip:SetText(T("SHOW_TURN_IN"), 1, 0.82, 0)
                where = Field(info.quest.id, "turnin", info.quest.turnin)
            end
            if type(where) == "string" and where ~= "" then GameTooltip:AddLine(where, 1, 1, 1, true) end
            GameTooltip:Show()
        end)
        mark:SetScript("OnLeave", function(self)
            if self.button then self.button.lit:Hide() end
            if self.halo then self.halo:SetAlpha(0.55) end
            GameTooltip:Hide()
        end)
        mark:SetScript("OnDragStart", function(self)
            PressMark(self, false)
            MoveStart(self)
        end)
        mark:SetScript("OnDragStop", function(self)
            PressMark(self, false)
            MoveStop(self)
        end)
        mark:EnableMouse(false)



        local door = CreateFrame("Frame", nil, row)
        row.door = door
        door:SetSize(DOOR_SIZE, DOOR_SIZE)
        door:SetPoint("CENTER", row, "TOPLEFT", DOOR_X, -7)
        local inset = math.floor(DOOR_SIZE / 5)
        door:SetHitRectInsets(inset, inset, inset, inset)
        door.tex = door:CreateTexture(nil, "ARTWORK")
        door.tex:SetAllPoints()
        local atlas = C_Texture and type(C_Texture.GetAtlasInfo) == "function" and C_Texture.GetAtlasInfo("Dungeon")
        if atlas and door.tex.SetAtlas then
            door.tex:SetAtlas("Dungeon")
        else

            door.tex:ClearAllPoints()
            door.tex:SetPoint("CENTER")
            door.tex:SetSize(DOOR_SIZE * 0.66, DOOR_SIZE * 0.66)
            door.tex:SetTexture("Interface\\Icons\\INV_Misc_Rune_01")
            door.tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        end
        if door.SetMouseClickEnabled and door.SetMouseMotionEnabled then
            door:SetMouseMotionEnabled(true)
            door:SetMouseClickEnabled(false)
        else
            door:EnableMouse(true)
        end
        door:SetScript("OnEnter", function(self)
            TooltipBeside(self, SIDE + 4)
            GameTooltip:SetText(T("IN_DUNGEON"), 1, 0.82, 0)
            GameTooltip:Show()
        end)
        door:SetScript("OnLeave", function() GameTooltip:Hide() end)
        door:Hide()



        local chainIcon = CreateFrame("Button", nil, row)
        row.chainIcon = chainIcon
        chainIcon:SetSize(CHAIN_SIZE, CHAIN_SIZE)
        chainIcon:RegisterForClicks("LeftButtonUp")
        chainIcon:RegisterForDrag("LeftButton")
        chainIcon.tex = chainIcon:CreateTexture(nil, "ARTWORK")
        chainIcon.tex:SetAllPoints()
        chainIcon.tex:SetTexture(CHAIN)
        local chainLit = chainIcon:CreateTexture(nil, "HIGHLIGHT")
        chainLit:SetAllPoints()
        chainLit:SetTexture(CHAIN)
        chainLit:SetBlendMode("ADD")
        chainIcon:SetScript("OnClick", function(self)
            local info = self:GetParent().info
            if JustDragged() or not info or not info.chain then return end
            local open = ChainsOpen()
            open[info.quest.id] = not open[info.quest.id] or nil
            if FDJ.RefreshQuestTracker then FDJ.RefreshQuestTracker() end
        end)
        chainIcon:SetScript("OnEnter", function(self)
            TooltipBeside(self, SIDE + 4)
            GameTooltip:SetText(T("REQUIRED_QUESTS"), 1, 0.82, 0.25)
            GameTooltip:AddLine(T("SHOW_WHOLE_CHAIN"), 0.85, 0.85, 0.85)
            GameTooltip:Show()
        end)
        chainIcon:SetScript("OnLeave", function() GameTooltip:Hide() end)
        chainIcon:SetScript("OnDragStart", MoveStart)
        chainIcon:SetScript("OnDragStop", MoveStop)
        chainIcon:Hide()
        row.chainLines = {}


        local okBox, box = pcall(CreateFrame, "CheckButton", nil, row, "UICheckButtonTemplate")
        if okBox and box then
            row.routeBox = box
            box:SetSize(20, 20)
            box:SetPoint("TOPRIGHT", row, "TOPRIGHT", 4, 3)
            box:SetScript("OnClick", function(self)
                local owner = self:GetParent()
                local info, window = owner.info, owner:GetParent()
                local name = window and window.dungeon
                if not (info and info.quest and info.quest.id and name) then return end


                local value = nil
                if not self:GetChecked() then value = true elseif info.quest.routeOptIn then value = false end
                RouteSkips(name)[info.quest.id] = value
                if PlaySound and SOUNDKIT then
                    local sound = self:GetChecked() and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
                    if sound then pcall(PlaySound, sound) end
                end
                if FDJ.RefreshQuestTracker then FDJ.RefreshQuestTracker() end
            end)
            box:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(T(self:GetChecked() and "ROUTE_BOX_ON" or "ROUTE_BOX_OFF"), 1, 1, 1, 1, true)
                GameTooltip:Show()
            end)
            box:SetScript("OnLeave", function() GameTooltip:Hide() end)
            box:Hide()
        end




        local ok, use = pcall(CreateFrame, "Button", nil, row, "InsecureActionButtonTemplate")
        if not ok or not use then use = nil end
        if use then
            row.use = use
            use:SetSize(ITEM_SIZE, ITEM_SIZE)
            use:SetPoint("CENTER", row, "TOPLEFT", ICON_X, -7)
            use:SetFrameLevel(mark:GetFrameLevel() + 2)
            use:RegisterForClicks("LeftButtonUp")
            use:SetAttribute("useOnKeyDown", false)
            use:SetAttribute("type", "item")
            use.icon = use:CreateTexture(nil, "ARTWORK")
            use.icon:SetAllPoints()
            use.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            local lit = use:CreateTexture(nil, "HIGHLIGHT")
            lit:SetAllPoints()
            lit:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
            lit:SetBlendMode("ADD")
            use:SetScript("PreClick", function(self)
                local info = self:GetParent().info
                if InCombatLockdown and InCombatLockdown() then
                    if UIErrorsFrame and ERR_NOT_IN_COMBAT then UIErrorsFrame:AddMessage(ERR_NOT_IN_COMBAT, 1, 0.1, 0.1) end
                    return
                end
                if info and info.quest then
                    FDJ.trackerAcceptQuest = { id = info.quest.id, at = GetTime and GetTime() or 0 }
                end
            end)
            use:SetScript("OnEnter", function(self)
                TooltipBeside(self, SIDE + 4)
                if self.itemID and GameTooltip.SetItemByID then
                    GameTooltip:SetItemByID(self.itemID)
                else
                    local info = self:GetParent().info
                    GameTooltip:SetText(info and info.name or "", 1, 0.82, 0)
                end
                GameTooltip:AddLine(T("TRACK_ACCEPT"), GREEN[1], GREEN[2], GREEN[3])
                GameTooltip:Show()
            end)
            use:SetScript("OnLeave", function() GameTooltip:Hide() end)
            use:Hide()
        end

        row.title = row:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
        row.title:SetPoint("TOPLEFT", row, "TOPLEFT", TEXT_X, 0)
        row.title:SetJustifyH("LEFT")
        row.title:SetWordWrap(true)

        row.sub = row:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
        row.sub:SetPoint("TOPLEFT", row.title, "BOTTOMLEFT", 0, -3)
        row.sub:SetJustifyH("LEFT")
        row.sub:SetWordWrap(true)
        if row.sub.SetSpacing then row.sub:SetSpacing(2) end

        Highlight(row, -5, 3, 5, -3)


        local step = CreateFrame("Button", nil, row)
        row.step = step
        step:RegisterForClicks("LeftButtonUp")
        step:RegisterForDrag("LeftButton")
        step.text = step:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
        step.text:SetPoint("TOPLEFT", step, "TOPLEFT", 0, 0)
        step.text:SetJustifyH("LEFT")
        step.text:SetWordWrap(true)
        if step.text.SetSpacing then step.text:SetSpacing(2) end
        Highlight(step, -3, 2, 3, -2):SetColorTexture(1, 0.82, 0.25, 0.14)
        step:SetScript("OnClick", function(self)
            local info = self:GetParent().info
            if JustDragged() or not info or not info.step then return end
            if FDJ.TryLinkQuest and FDJ.TryLinkQuest(info.step.id, info.stepName, nil) then return end
            local f = WindowOf(self)
            OpenChainStep(f and f.dungeon, info.quest.id, info.step.id)
        end)
        step:SetScript("OnDragStart", MoveStart)
        step:SetScript("OnDragStop", MoveStop)
        step:SetScript("OnEnter", ShowStepTooltip)
        step:SetScript("OnLeave", function() GameTooltip:Hide() end)
        step:Hide()

        row:SetScript("OnClick", function(self)
            if JustDragged() or not self.info then return end
            local quest = self.info.quest
            if FDJ.TryLinkQuest and FDJ.TryLinkQuest(quest.id, self.info.name, quest.level) then return end
            local f = WindowOf(self)
            OpenInJournal(f and f.dungeon, quest.id)
        end)
        row:SetScript("OnDragStart", MoveStart)
        row:SetScript("OnDragStop", MoveStop)
        row:SetScript("OnEnter", ShowRowTooltip)
        row:SetScript("OnLeave", function() GameTooltip:Hide() end)
        return row
    end

    local Refresh, Layout


    local function Build(index)
        if windows[index] then return windows[index] end
        local name = "ForeverDungeonJournalQuestTracker" .. (index > 1 and index or "")
        local f = CreateFrame("Frame", name, UIParent, "BackdropTemplate")
        windows[index] = f
        f.fdjTracker = true
        f.slot = index
        f:SetSize(WIDTH, COLLAPSED_H)



        f:SetFrameStrata("MEDIUM")
        f:SetFrameLevel(20)
        f:SetClampedToScreen(true)
        f:SetMovable(true)
        f:EnableMouse(true)
        f:RegisterForDrag("LeftButton")
        if f.SetDontSavePosition then pcall(f.SetDontSavePosition, f, true) end
        f:SetScript("OnDragStart", MoveStart)
        f:SetScript("OnDragStop", MoveStop)

        f:SetBackdrop({ bgFile = WHITE, insets = { left = 6, right = 6, top = 6, bottom = 6 } })
        f:SetBackdropColor(0.176, 0.13, 0.15, 0.90)
        local ok, copied = pcall(GameArt, f)
        if not (ok and copied) then
            f.art = nil
            LinedArt(f)
        end



        local over = CreateFrame("Button", nil, f)
        f.header = over
        over:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
        over:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, 0)
        over:SetHeight(TITLE_H + 2)
        over:SetFrameLevel(f:GetFrameLevel() + 4)
        over:RegisterForClicks("LeftButtonUp")
        over:RegisterForDrag("LeftButton")
        over:SetScript("OnDragStart", MoveStart)
        over:SetScript("OnDragStop", MoveStop)
        over:SetScript("OnClick", function()
            if JustDragged() then return end
            OpenInJournal(f.dungeon, nil)
        end)

        over.count = over:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontDisableSmall")
        over.count:SetPoint("LEFT", f, "TOPLEFT", 12, -12)

        local close = CreateFrame("Button", nil, over, "UIPanelCloseButton")
        f.close = close
        close:SetPoint("CENTER", f, "TOPRIGHT", -13, -13)
        close:SetFrameLevel(over:GetFrameLevel() + 2)
        close:SetScript("OnClick", function()
            if f.dungeon and FDJ.ToggleQuestTracking then FDJ.ToggleQuestTracking(f.dungeon) end
        end)
        close:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText(T("TRACK_STOP"), 1, 1, 1)
            GameTooltip:Show()
        end)
        close:SetScript("OnLeave", function() GameTooltip:Hide() end)

        local fold = CreateFrame("Button", nil, over)
        f.fold = fold
        fold:SetSize(14, 14)


        fold:SetPoint("LEFT", f, "TOPLEFT", 46, -12)
        fold:SetFrameLevel(over:GetFrameLevel() + 2)
        fold:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
        fold:SetScript("OnClick", function()
            if not f.dungeon then return end
            local folded = Folded()
            folded[f.dungeon] = not folded[f.dungeon] or nil
            if PlaySound and SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON then
                pcall(PlaySound, SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
            end
            Layout(f)
        end)

        over.icon = over:CreateTexture(nil, "OVERLAY")
        over.icon:SetSize(15, 15)
        over.icon:SetTexture(BOOK)
        over.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        over.title = over:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalSmall")
        over.title:SetPoint("LEFT", over.icon, "RIGHT", 4, 0)
        over.title:SetJustifyH("LEFT")
        over.title:SetWordWrap(false)



        local grip = CreateFrame("Button", nil, f)
        f.grip = grip
        grip:SetSize(14, 14)
        grip:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -3, 3)
        grip:SetFrameLevel(f:GetFrameLevel() + 20)
        grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
        grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
        grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
        grip:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        local function FinishScaling(self)
            self.dragging = false
            Slot(f.slot).scale = f:GetScale()
            SavePosition(f)
        end
        grip:SetScript("OnMouseDown", function(self, button)
            if button ~= "LeftButton" then return end
            self.startX = GetCursorPosition()
            self.startScale = f:GetScale() or 1
            self.unit = WIDTH * ((UIParent and UIParent:GetEffectiveScale()) or 1)
            self.dragging = true
        end)
        grip:SetScript("OnMouseUp", function(self, button)
            if button == "RightButton" then
                ScaleTo(f, 1)
                FinishScaling(self)
            elseif self.dragging then
                FinishScaling(self)
            end
        end)
        grip:SetScript("OnUpdate", function(self)
            if not self.dragging then return end
            if IsMouseButtonDown and not IsMouseButtonDown("LeftButton") then
                FinishScaling(self)
                return
            end


            local x = GetCursorPosition()
            local scale = self.startScale + (x - self.startX) / self.unit
            if math.abs(scale - (f:GetScale() or 1)) > 0.004 then ScaleTo(f, scale) end
        end)
        grip:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
            GameTooltip:SetText(T("RESIZE_TIP_TITLE"), 1, 0.82, 0.27)
            GameTooltip:AddLine(T("RESIZE_TIP"), 1, 1, 1, true)
            GameTooltip:Show()
        end)
        grip:SetScript("OnLeave", function() GameTooltip:Hide() end)






        close:SetAlpha(0)
        grip:SetAlpha(0)
        f:HookScript("OnUpdate", function(self)
            local over = (self:IsMouseOver(4, -4, -4, 4) or grip.dragging) and true or false
            if over ~= self.fdjHoverBits then
                self.fdjHoverBits = over
                close:SetAlpha(over and 1 or 0)
                grip:SetAlpha(over and 1 or 0)
            end
        end)

        f.rows = {}
        f:SetScale(math.max(MIN_SCALE, math.min(MAX_SCALE, tonumber(Slot(index).scale) or 1)))
        f:Hide()
        return f
    end

    Layout = function(f)
        local name = f and f.dungeon
        if not name then return end
        local quests = QuestsOf(name)
        local over = f.header



        local title = over.title
        title:SetWidth(0)
        title:SetText(FDJ.LocalizeDungeonName and FDJ.LocalizeDungeonName(name) or name)
        local full = (title.GetUnboundedStringWidth and title:GetUnboundedStringWidth()) or title:GetStringWidth() or 0



        local textWidth = math.min(full, WIDTH - 46 - 29 - 18 - 19)
        title:SetWidth(math.ceil(textWidth))
        local blockWidth = 18 + 19 + textWidth
        local left = math.max(46, math.min(math.floor((WIDTH - blockWidth) / 2), WIDTH - 29 - blockWidth))
        f.fold:ClearAllPoints()
        f.fold:SetPoint("LEFT", f, "TOPLEFT", left, -12)
        over.icon:ClearAllPoints()
        over.icon:SetPoint("LEFT", f, "TOPLEFT", left + 18, -12)

        local collapsed = Folded()[name] == true
        f.fold:SetNormalTexture(collapsed and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up")
        f.fold:SetPushedTexture(collapsed and "Interface\\Buttons\\UI-PlusButton-Down" or "Interface\\Buttons\\UI-MinusButton-Down")

        local level = PlayerLevel()
        local rowWidth = WIDTH - SIDE * 2



        local infos, extra = {}, 0
        for i, quest in ipairs(quests) do
            local info = RowInfo(quest, level)

            if info.state == "todo" and not info.step then info.startItem = StartItemInBags(quest) end
            info.inside = info.state == "todo" and not info.step and not info.startItem and StartsInDungeon(quest, name)

            local icons = (info.chain and 1 or 0) + (info.inside and 1 or 0)
            if icons > extra then extra = icons end
            infos[i] = info
        end


        local function Rank(info)
            if info.state == "ready" then return 1 end
            if info.state == "log" then return 2 end
            if info.state == "done" then return 7 end
            if info.low then return 6 end
            if info.startItem then return 3 end
            if info.step then return 4 end
            return 5
        end
        local order = {}
        for i = 1, #quests do order[i] = i end
        table.sort(order, function(a, b)
            local ra, rb = Rank(infos[a]), Rank(infos[b])
            if ra ~= rb then return ra < rb end
            return a < b
        end)
        local textX = (extra == 0 and TEXT_X) or DOOR_TEXT_X + (extra - 1) * ICON_STEP
        local routed = RouteOn(name)
        local routeSkip = routed and RouteSkips(name) or nil
        local textW = rowWidth - textX - (routed and 18 or 0)
        local y = ROWS_TOP
        local done = 0
        for n, i in ipairs(order) do
            local info = infos[i]

            if info.state == "done" or info.state == "ready" then done = done + 1 end
            local row = f.rows[n]
            if not row then
                row = MakeRow(f)
                f.rows[n] = row
            end
            row.info = info
            row:SetWidth(rowWidth)


            local mark = row.mark
            local clickable = info.turnin ~= nil or info.dungeonTurnin ~= nil
                or info.start ~= nil or info.dungeonStart ~= nil
            local questButton = mark.button ~= nil and info.state == "ready"



            mark:ClearAllPoints()
            mark:SetPoint("CENTER", row, "TOPLEFT",
                info.state == "ready" and math.max(ICON_X, (textX - 3) / 2) or ICON_X, -7)
            local item = row.use ~= nil and info.startItem or nil
            if row.use then
                if item then
                    row.use.itemID = item
                    row.use:SetAttribute("item", "item:" .. item)
                    local icon = (C_Item and C_Item.GetItemIconByID and C_Item.GetItemIconByID(item))
                        or (GetItemIcon and GetItemIcon(item)) or "Interface\\Icons\\INV_Misc_QuestionMark"
                    row.use.icon:SetTexture(icon)
                    row.use.icon:SetDesaturated(info.low == true)
                end
                row.use:SetShown(item ~= nil)
            end
            row.icon:SetShown(not questButton and not item)
            row.icon:SetTexture(info.icon)
            row.icon:SetDesaturated(info.grey == true)
            row.icon:SetAlpha(info.grey and 0.75 or 1)
            local iconX = DOOR_X
            row.chainIcon:ClearAllPoints()
            row.chainIcon:SetPoint("CENTER", row, "TOPLEFT", iconX, -7)
            row.chainIcon:SetShown(info.chain ~= nil)
            if info.chain then
                row.chainIcon.tex:SetDesaturated(info.low == true)
                row.chainIcon.tex:SetAlpha(info.low and 0.75 or 1)
                iconX = iconX + ICON_STEP
            end
            row.door:ClearAllPoints()
            row.door:SetPoint("CENTER", row, "TOPLEFT", iconX, -7)
            row.door:SetShown(info.inside)
            if info.inside then
                row.door.tex:SetDesaturated(info.low == true)
                row.door.tex:SetAlpha(info.low and 0.75 or 1)
            end
            mark:EnableMouse(clickable and not item)
            if mark.button then
                mark.button:SetShown(questButton)
                PressMark(mark, false)
                if not clickable then mark.button.lit:Hide() end
            else
                mark.halo:SetShown(clickable and info.state == "ready")
            end
            mark.glow:SetTexture(info.icon)
            mark.glow:SetShown(clickable and not questButton and not item)
            if row.routeBox then
                local boxed = routed and info.state ~= "done" and info.quest and info.quest.id ~= nil
                row.routeBox:SetShown(boxed and true or false)
                if boxed then row.routeBox:SetChecked(not routeSkip[info.quest.id] and not OptedOut(info.quest, routeSkip)) end
            end
            row.title:ClearAllPoints()
            row.title:SetPoint("TOPLEFT", row, "TOPLEFT", textX, 0)
            row.title:SetWidth(textW)
            row.title:SetText(info.name or "")
            row.title:SetTextColor(info.color[1], info.color[2], info.color[3])
            local height = math.max(14, row.title:GetStringHeight() or 14)
            row.sub:SetWidth(textW)
            if row.sub.SetMaxLines then row.sub:SetMaxLines(info.short and 2 or 0) end
            if info.sub then
                row.sub:SetText(info.sub)
                row.sub:Show()
                height = height + 3 + math.max(10, row.sub:GetStringHeight() or 10)
            else
                row.sub:SetText("")
                row.sub:Hide()
            end
            local lines = 0
            if info.chain and info.chainOpen then


                row.step:Hide()
                for _, entry in ipairs(ChainSteps(info)) do
                    lines = lines + 1
                    local line = row.chainLines[lines]
                    if not line then
                        line = MakeChainLine(row)
                        row.chainLines[lines] = line
                    end
                    line:ClearAllPoints()
                    line:SetPoint("TOPLEFT", row, "TOPLEFT", textX, -(height + 3))
                    height = height + 3 + SetChainLine(line, entry, textW)
                end
            elseif info.stepText then
                local step = row.step
                step.text:SetWidth(textW)
                step.text:SetText(info.stepText)
                local stepHeight = math.max(12, step.text:GetStringHeight() or 12)
                step:ClearAllPoints()
                step:SetPoint("TOPLEFT", row, "TOPLEFT", textX, -(height + 3))
                step:SetSize(textW, stepHeight)
                step:Show()
                height = height + 3 + stepHeight


                if info.stepTurnIn and FDJ.CreateTurnInButton then
                    if not step.mark then
                        step.mark = FDJ.CreateTurnInButton(step, 16)
                        step.mark:SetFrameLevel(step:GetFrameLevel() + 3)
                        step.measure = step:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
                        step.measure:Hide()
                    end
                    step.measure:SetText(info.stepLabel or info.stepName or "")
                    local nameW = step.measure:GetStringWidth() or 0
                    local size = FDJ.StepMarkSize()
                    FDJ.ResizeTurnInButton(step.mark, size)
                    step.mark:ClearAllPoints()
                    step.mark:SetPoint("LEFT", step, "TOPLEFT", math.min(nameW + 4, math.max(0, textW - size)), -6)
                    FDJ.SetTurnInButton(step.mark, info.stepTurnIn, info.stepName)
                elseif step.mark then
                    FDJ.SetTurnInButton(step.mark, nil)
                end
            else
                row.step:Hide()
            end
            for k = lines + 1, #row.chainLines do
                row.chainLines[k].entry = nil
                row.chainLines[k]:Hide()
            end
            row:SetHeight(height)
            row:ClearAllPoints()
            row:SetPoint("TOPLEFT", f, "TOPLEFT", SIDE, -y)
            row:SetShown(not collapsed)
            y = y + height + ROW_GAP
        end
        for i = #quests + 1, #f.rows do
            f.rows[i].info = nil
            f.rows[i]:Hide()
        end

        over.count:SetText(done .. "/" .. #quests)


        local height
        if not collapsed then
            height = math.max(COLLAPSED_H, y - ROW_GAP + BOTTOM_PAD)
        elseif f.art then
            height = FOLDED_H
        else
            height = COLLAPSED_H
        end
        f:SetHeight(height)
        f.grip:SetShown(not collapsed)
        FitArt(f, height, collapsed)
    end






    local followed = {}
    local function ArrowChains()
        local db = CharDB()
        if type(db.arrowChains) ~= "table" then db.arrowChains = {} end
        return db.arrowChains
    end
    local function FollowChains()
        if not FDJ.FollowWaypoint then return end
        local level = PlayerLevel()
        local now = {}
        local names = {}
        for _, name in ipairs(ShownTracked()) do names[#names + 1] = name end
        for name, on in pairs(ArrowChains()) do
            if on and FDJ.DB and FDJ.DB[name] and not IsTracked(name) then names[#names + 1] = name end
        end
        for _, name in ipairs(names) do
            local dungeon = FDJ.DB[name]


            local noArrow = dungeon and (dungeon.noArrow == true or (type(dungeon.noArrow) == "table" and dungeon.noArrow[Faction()] == true))
            if dungeon and dungeon.questChainPage and not noArrow and not Locked(name) then
                now[name] = true


                local spot, title, turnIn, goTo
                for _, quest in ipairs(QuestsOf(name)) do
                    local info = RowInfo(quest, level)
                    if info.state == "ready" or info.state == "log" then
                        spot, title, turnIn, goTo = info.turnin, info.name, not info.goTo, info.goTo
                    elseif info.state == "todo" then
                        local pending = false
                        for _, entry in ipairs(ChainSteps(info)) do
                            if entry.state == "next" then
                                pending, spot, title, goTo = true, entry.start, (entry.arrowName or entry.name), entry.goTo
                                break
                            elseif entry.state == "log" or entry.state == "ready" then
                                pending, spot, title, turnIn, goTo = true, entry.turnin, (entry.arrowName or entry.name), not entry.goTo, entry.goTo
                                break
                            end
                        end
                        if not pending then spot, title = info.start, info.name end
                    end
                    if spot then break end
                end
                FDJ.FollowWaypoint(name, spot, title, turnIn, nil, goTo and true or nil)
            end
        end
        for name in pairs(followed) do
            if not now[name] then FDJ.FollowWaypoint(name, nil) end
        end
        followed = now
    end
    FDJ.FollowRoutes = FollowChains

    function FDJ.FollowChainArrow(name)
        local dungeon = name and FDJ.DB and FDJ.DB[name]
        if not (dungeon and dungeon.questChainPage) then return end
        ArrowChains()[name] = true
        FollowChains()
    end


    function FDJ.StopChainArrow(name)
        if name == nil then return false end
        ArrowChains()[name] = nil
        return not IsTracked(name)
    end

    Refresh = function()
        local shown = {}
        for _, name in ipairs(ShownTracked()) do
            if not Locked(name) and #QuestsOf(name) > 0 then shown[#shown + 1] = name end
        end


        local slots, used, slotFor = WindowSlots(), {}, {}
        for name in pairs(slots) do
            if not IsTracked(name) then slots[name] = nil end
        end
        for _, name in ipairs(shown) do
            local index = slots[name]
            if type(index) == "number" and index >= 1 and not used[index] then
                used[index], slotFor[name] = true, index
            end
        end
        for _, name in ipairs(shown) do
            if not slotFor[name] then
                local index = 1
                while used[index] do index = index + 1 end
                used[index], slotFor[name], slots[name] = true, index, index
            end
        end
        for _, name in ipairs(shown) do
            local f = Build(slotFor[name])
            local fresh = not f:IsShown() or f.dungeon ~= name
            f.dungeon = name
            Layout(f)
            if fresh then Place(f) end
            f:Show()
        end
        for index, f in pairs(windows) do
            if not used[index] then
                f.dungeon = nil
                f:Hide()
            end
        end
        FollowChains()
    end
    FDJ.RefreshQuestTracker = Refresh


    local worker = CreateFrame("Frame")
    worker:Hide()
    worker:SetScript("OnUpdate", function(self)
        self:Hide()
        Refresh()
    end)
    local function Schedule()
        worker:Show()
    end




    local TRACK_MAX = 112


    local function SizeTrackButton(b)
        local text = b.text
        text:SetScale(1)
        local check = b.check:IsShown() and 17 or 0
        local width = (text:GetStringWidth() or 40) + 28 + check
        local scale = 1
        if width > TRACK_MAX then
            scale = math.max(0.8, (TRACK_MAX - 28 - check) / math.max(1, text:GetStringWidth() or 1))
            text:SetScale(scale)
            width = TRACK_MAX
        end
        b:SetWidth(math.max(78, math.ceil(width)))
        text:ClearAllPoints()
        text:SetPoint("CENTER", b, "CENTER", -check / 2 / scale, 0)
        b.check:ClearAllPoints()
        b.check:SetPoint("LEFT", text, "RIGHT", 3, 0)
    end

    function FDJ.UpdateQuestTrackButton(name)
        local journal = _G.ForeverDungeonJournalFrame
        local b = journal and journal.questTrackButton
        if not b then return end
        if FDJ.UpdateRouteButton then FDJ.UpdateRouteButton(name) end
        if not name or #QuestsOf(name) == 0 or not Trackable(name) then
            b.dungeon = nil
            b:Hide()
            Schedule()
            return
        end
        b.dungeon = name

        b:ClearAllPoints()
        local route = journal.questRouteButton
        if route and route:IsShown() then
            b:SetPoint("LEFT", route, "RIGHT", 4, 0)
        else
            b:SetPoint("TOPLEFT", journal.questLeftPanel or b:GetParent(), "TOPLEFT", 10, -30)
        end
        local on = IsTracked(name)
        b:SetText(T(on and "TRACKING" or "TRACK"))
        b.text = b:GetFontString() or b.text
        if b.text then b.text:SetTextColor(1.00, 0.82, 0.27) end
        b.check:SetShown(on)
        if on then b:LockHighlight() else b:UnlockHighlight() end
        SizeTrackButton(b)
        b:Show()
        if b:IsMouseOver() and GameTooltip:IsOwned(b) and b:GetScript("OnEnter") then
            b:GetScript("OnEnter")(b)
        end
        Schedule()
    end




    local function PopOutBeside(f, journal)
        if not f or not journal or not journal:IsShown() then return end
        local js, ts = journal:GetEffectiveScale() or 1, f:GetEffectiveScale() or 1
        local left, right, top = journal:GetLeft(), journal:GetRight(), journal:GetTop()
        if not left or not right or not top or ts == 0 then return end
        left, right, top = left * js / ts, right * js / ts, top * js / ts
        local screen = (UIParent:GetWidth() or 0) * (UIParent:GetEffectiveScale() or 1) / ts
        local x
        if right + 4 + WIDTH <= screen then
            x = right + 4
        elseif left - 4 - WIDTH >= 0 then
            x = left - 4 - WIDTH
        else


            x = screen - WIDTH - 4
        end
        f:ClearAllPoints()
        f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, top - 84 * js / ts)
        SavePosition(f)
    end


    function FDJ.ToggleQuestTracking(name)
        if not name or not (FDJ.DB and FDJ.DB[name]) then return end
        if not Trackable(name) then return end
        local list = TrackedList()
        local on = not IsTracked(name)
        if on then
            list[#list + 1] = name


            if FDJ.DB[name].questChainPage then
                for _, quest in ipairs(QuestsOf(name)) do
                    if FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[quest.id] then ChainsOpen()[quest.id] = true end
                end
            end
        else
            for i = #list, 1, -1 do
                if list[i] == name then table.remove(list, i) end
            end
            WindowSlots()[name] = nil

            ArrowChains()[name] = nil
            Routes()[name] = nil
        end
        Folded()[name] = nil
        if PlaySound and SOUNDKIT then
            local sound = on and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
            if sound then pcall(PlaySound, sound) end
        end
        Refresh()

        local index = on and #ShownTracked() == 1 and WindowSlots()[name]
        if index and windows[index] and type(Slot(index).left) ~= "number" then
            PopOutBeside(windows[index], _G.ForeverDungeonJournalFrame)
        end
        local journal = _G.ForeverDungeonJournalFrame
        local b = journal and journal.questTrackButton
        if b and b.dungeon then FDJ.UpdateQuestTrackButton(b.dungeon) end
    end




    function FDJ.CreateQuestTrackButton(journal, questLeft)
        if not journal or not questLeft or journal.questTrackButton then return end
        local b = CreateFrame("Button", nil, questLeft, "UIPanelButtonTemplate")
        FDJ.OwnFonts(b)
        journal.questTrackButton = b


        b:SetSize(80, 22)
        b:SetText(T("TRACK"))

        if b.SetNormalFontObject then b:SetNormalFontObject("ForeverDJ_GameFontNormal") end
        if b.SetHighlightFontObject then b:SetHighlightFontObject("ForeverDJ_GameFontNormal") end
        if b.SetDisabledFontObject then b:SetDisabledFontObject("ForeverDJ_GameFontNormal") end
        b.text = b:GetFontString()
        if b.text then b.text:SetTextColor(1.00, 0.82, 0.27) end
        b.check = b:CreateTexture(nil, "OVERLAY")
        b.check:SetSize(14, 14)
        b.check:SetTexture(ICON_DONE)
        b.check:Hide()
        b:SetPoint("TOPLEFT", questLeft, "TOPLEFT", 10, -30)
        b:SetScript("OnClick", function(self)
            if self.dungeon then FDJ.ToggleQuestTracking(self.dungeon) end
        end)
        b:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            if self.dungeon and IsTracked(self.dungeon) then
                GameTooltip:SetText(T("TRACK_STOP"), 1, 1, 1)
            else
                GameTooltip:SetText(T("TRACK"), 1, 0.82, 0)
                GameTooltip:AddLine(T("TRACK_TIP"), 1, 1, 1, true)
            end
            GameTooltip:Show()
        end)
        b:SetScript("OnLeave", function() GameTooltip:Hide() end)
        b:Hide()
    end





    local function ShowTurnIn(quest, title)
        local spot = TurnInSpot(quest)
        if spot then
            local show = FDJ.MapMarkers and FDJ.MapMarkers.ShowRecordedLocationOnMap
            if not show then return end
            spot = (FDJ.LocalizeMapLocation and FDJ.LocalizeMapLocation(spot)) or spot
            FDJ.pendingMarkerQuestTitle = title
            FDJ.pendingMarkerTurnIn = true
            FDJ.pendingMarkerQuestID = type(quest) == "table" and quest.id or nil
            show(spot, spot.label)
            return
        end
        local inside = DungeonTurnIn(quest)
        if inside and FDJ.ShowTurnInOnDungeonMap and ShowJournal() then
            FDJ.ShowTurnInOnDungeonMap(inside.dungeon, inside.spot, title, quest.id)
        end
    end

    function FDJ.CreateTurnInButton(parent, size)


        local okB, made = pcall(CreateFrame, "Button", nil, parent, "InsecureActionButtonTemplate")
        local b = okB and made or CreateFrame("Button", nil, parent)
        b._fdjCanTarget = (okB and made) and true or false
        if b._fdjCanTarget then b:SetAttribute("useOnKeyDown", false) end
        b:SetSize(size, size)
        b:RegisterForClicks("LeftButtonUp")
        if HasQuestButton() then
            local button = CreateFrame("Frame", nil, b)
            b.button = button
            button:SetSize(size, size)
            button:SetPoint("CENTER", b, "CENTER", 0, 0)
            button.ring = button:CreateTexture(nil, "ARTWORK")
            button.ring:SetAtlas(POI_RING)
            button.ring:SetSize(size, size)
            button.ring:SetPoint("CENTER")
            button.lit = button:CreateTexture(nil, "OVERLAY")
            button.lit:SetAtlas(POI_LIT)
            button.lit:SetBlendMode("ADD")
            button.lit:SetSize(size, size)
            button.lit:SetPoint("CENTER")
            button.lit:Hide()
            button.display = CreateFrame("Frame", nil, button)
            button.display:SetSize(size, size)
            button.display:SetFrameLevel(button:GetFrameLevel() + 1)
            button.icon = button.display:CreateTexture(nil, "ARTWORK")
            button.icon:SetAtlas(POI_TURN_IN)
            button.icon:SetSize(size, size)
            button.icon:SetPoint("CENTER")



            local sharp = button:CreateTexture(nil, "ARTWORK", nil, 1)
            if sharp:SetTexture(TURN_IN_ART, nil, nil, "TRILINEAR") ~= false then
                sharp:SetSize(size, size)
                b.sharp = sharp
                button.ring:Hide()
                button.icon:Hide()
            else
                sharp:Hide()
            end
            PressMark(b, false)
        else
            b.icon = b:CreateTexture(nil, "ARTWORK")
            b.icon:SetAllPoints()
            b.icon:SetTexture(ICON_LOG)
            local glow = b:CreateTexture(nil, "HIGHLIGHT")
            glow:SetAllPoints()
            glow:SetTexture(ICON_LOG)
            glow:SetBlendMode("ADD")
        end
        b:SetScript("OnMouseDown", function(self, mouse)
            if mouse == "LeftButton" then PressMark(self, true) end
        end)
        b:SetScript("OnMouseUp", function(self) PressMark(self, false) end)
        b:SetScript("OnEnter", function(self)
            if not self.quest then return end
            local configure = FDJ.MapMarkers and FDJ.MapMarkers.ConfigureTargetAndMarkAction
            if configure then configure(self, TurnInSpot(self.quest), true) end
            if self.button then self.button.lit:Show() end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(T("SHOW_TURN_IN"), 1, 0.82, 0)
            local where = Field(self.quest.id, "turnin", self.quest.turnin)
            if type(where) == "string" and where ~= "" then GameTooltip:AddLine(where, 1, 1, 1, true) end
            GameTooltip:Show()
        end)
        b:SetScript("OnLeave", function(self)
            if self.button then self.button.lit:Hide() end
            GameTooltip:Hide()
        end)

        b.fdjClick = function(self)
            if self.quest then ShowTurnIn(self.quest, self.title) end
        end
        b:SetScript(b._fdjCanTarget and "PostClick" or "OnClick", b.fdjClick)
        b:Hide()
        return b
    end








    function FDJ.CreatePickUpButton(parent, size)
        local b = FDJ.CreateTurnInButton(parent, size)
        local art = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\PickUpMark"
        if b.sharp then
            if b.sharp:SetTexture(art, nil, nil, "TRILINEAR") == false then
                b.sharp:SetTexture(ICON_TODO)
                b.sharp:SetSize(size * 0.62, size * 0.62)
                if b.button and b.button.ring then b.button.ring:Show() end
                b.fdjSmallMark = true
            end
        elseif b.button and b.button.icon then
            local t = b.button.icon
            if t:SetTexture(art, nil, nil, "TRILINEAR") == false then t:SetTexture(ICON_TODO) end
        elseif b.icon then
            b.icon:SetTexture(ICON_TODO)
        end
        b:SetScript("OnEnter", function(self)
            if not self.quest then return end
            if self.button then self.button.lit:Show() end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")


            local onMap = FDJ.PickUpOnMapSpot and FDJ.PickUpOnMapSpot(self.quest)
            local step = FDJ.NextChainStep and FDJ.NextChainStep(self.quest)

            GameTooltip:SetText(T(step and "SHOW_QUEST_CHAIN" or (onMap and "PICKUP_ON_MAP" or "PICKUP_HOW")), 1, 0.82, 0)
            if onMap then
                local where = Field(self.quest.id, "pickup", self.quest.pickup)
                if type(where) == "string" and where ~= "" then GameTooltip:AddLine(where, 1, 1, 1, true) end
                if step then
                    GameTooltip:AddLine(T("PICKUP_CHAIN_FIRST", Field(step.id, "name", step.name) or "?"), 1, 1, 1, true)
                end
            elseif step then
                GameTooltip:AddLine(T("PICKUP_CHAIN_FIRST", Field(step.id, "name", step.name) or "?"), 1, 1, 1, true)
            else
                local where = Field(self.quest.id, "pickup", self.quest.pickup)
                if type(where) == "string" and where ~= "" then GameTooltip:AddLine(where, 1, 1, 1, true) end
            end
            GameTooltip:Show()
        end)
        b.fdjClick = function(self)
            if self.quest and FDJ.ShowHowToPickUp then FDJ.ShowHowToPickUp(self.quest, self.dungeon) end
        end
        b:SetScript(b._fdjCanTarget and "PostClick" or "OnClick", b.fdjClick)
        return b
    end

    function FDJ.SetPickUpButton(b, quest, title, dungeon)
        if not b then return end
        b.quest, b.title, b.dungeon = quest or nil, title, dungeon
        if not quest then
            b:Hide()
            return
        end
        b:EnableMouse(true)
        if b.button then
            PressMark(b, false)
            b.button.lit:Hide()
        end
        if b.fdjSmallMark and b.sharp then b.sharp:SetSize(b:GetWidth() * 0.62, b:GetHeight() * 0.62) end
        b:Show()
    end



    function FDJ.StepMarkSize()
        return 24
    end
    function FDJ.ResizeTurnInButton(b, size)
        if not b or not size then return end
        b:SetSize(size, size)
        local button = b.button
        if button then
            button:SetSize(size, size)
            if button.ring then button.ring:SetSize(size, size) end
            if button.lit then button.lit:SetSize(size, size) end
            if button.display then button.display:SetSize(size, size) end
            if button.icon then button.icon:SetSize(size, size) end
        end
        if b.sharp then b.sharp:SetSize(size, size) end
    end




    function FDJ.TurnInSpotFor(quest)
        if type(quest) ~= "table" then return nil end
        return TurnInSpot(quest)
    end



    function FDJ.SetTurnInButton(b, quest, title)
        if not b then return end
        b.quest, b.title = quest or nil, title
        if not quest then
            b:Hide()
            return
        end
        b:EnableMouse(TurnInSpot(quest) ~= nil or DungeonTurnIn(quest) ~= nil)
        if b.button then
            PressMark(b, false)
            b.button.lit:Hide()
        end
        b:Show()
    end


    local events = CreateFrame("Frame")
    for _, event in ipairs({ "PLAYER_LOGIN", "PLAYER_ENTERING_WORLD", "QUEST_LOG_UPDATE",
        "QUEST_ACCEPTED", "QUEST_REMOVED", "QUEST_TURNED_IN", "UNIT_QUEST_LOG_CHANGED",
        "PLAYER_LEVEL_UP", "QUEST_DATA_LOAD_RESULT", "BAG_UPDATE_DELAYED", "QUEST_DETAIL", "UNIT_AURA" }) do
        pcall(events.RegisterEvent, events, event)
    end
    events:SetScript("OnEvent", function(_, event, unit)
        if event == "UNIT_QUEST_LOG_CHANGED" and unit ~= "player" then return end

        if event == "UNIT_AURA" and (unit ~= "player" or not (FDJ.AuraReadyChanged and FDJ.AuraReadyChanged())) then return end
        if event == "QUEST_DETAIL" then

            local want = FDJ.trackerAcceptQuest
            FDJ.trackerAcceptQuest = nil
            if want and GetTime and GetTime() - want.at < 5 and type(GetQuestID) == "function"
                and GetQuestID() == want.id and type(AcceptQuest) == "function" then
                AcceptQuest()
            end
            return
        end
        Schedule()
    end)


    for _, key in ipairs({ "SetLanguage", "SetJournalMode" }) do
        local original = FDJ[key]
        if type(original) == "function" then
            FDJ[key] = function(...)
                local a, b, c = original(...)
                Schedule()
                return a, b, c
            end
        end
    end
end




do
    local PAGE = FDJ.MALLET_PAGE
    if PAGE and FDJ.DB and FDJ.DB[PAGE] then
        local baseName = FDJ.LocalizeDungeonName
        FDJ.LocalizeDungeonName = function(name, ...)
            if name == PAGE and FDJ.CanUseClientLocalizedText and FDJ.CanUseClientLocalizedText() then
                local get = (C_Item and C_Item.GetItemNameByID) or GetItemInfo
                if type(get) == "function" then
                    local ok, itemName = pcall(get, 9240)
                    if ok and type(itemName) == "string" and itemName ~= ""
                        and not (type(issecretvalue) == "function" and issecretvalue(itemName)) then
                        return itemName
                    end
                end
            end
            if baseName then return baseName(name, ...) end
            return name
        end
    end
end










;(function()
    do
        local strings = {
            enUS = "Requires %s", deDE = "Benötigt %s", frFR = "Requiert %s", esES = "Requiere %s",
            itIT = "Richiede %s", ptBR = "Requer %s", ruRU = "Требуется отношение «%s»",
            koKR = "평판 필요: %s", zhCN = "需要声望：%s", zhTW = "需要聲望：%s",
        }
        strings.esMX = strings.esES
        for locale, text in pairs(strings) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t and t.REP_REQUIRES_ONLY == nil then t.REP_REQUIRES_ONLY = text end
        end
    end
    local STANDING_EN = { "Hated", "Hostile", "Unfriendly", "Neutral", "Friendly", "Honored", "Revered", "Exalted" }
    local COLORS = {
        { 0.80, 0.30, 0.22 }, { 0.80, 0.30, 0.22 }, { 0.75, 0.27, 0.00 }, { 0.90, 0.70, 0.00 },
        { 0.00, 0.60, 0.10 }, { 0.00, 0.60, 0.10 }, { 0.00, 0.60, 0.10 }, { 0.00, 0.60, 0.10 },
    }
    local function Secret(v) return type(issecretvalue) == "function" and issecretvalue(v) end
    local function Label(n)
        local sex = 2
        if type(UnitSex) == "function" then local ok, v = pcall(UnitSex, "player") if ok and tonumber(v) then sex = v end end
        if type(GetText) == "function" then
            local ok, text = pcall(GetText, "FACTION_STANDING_LABEL" .. n, sex)
            if ok and type(text) == "string" and text ~= "" and not text:find("^FACTION_STANDING") then return text end
        end
        local g = _G["FACTION_STANDING_LABEL" .. n]
        return (type(g) == "string" and g ~= "") and g or STANDING_EN[n] or "?"
    end
    local function Color(n)
        local c = type(FACTION_BAR_COLORS) == "table" and FACTION_BAR_COLORS[n]
        if type(c) == "table" and tonumber(c.r) then return c.r, c.g, c.b end
        c = COLORS[n] or COLORS[4]
        return c[1], c[2], c[3]
    end


    local function Standing(factionID)
        if C_Reputation and type(C_Reputation.GetFactionDataByID) == "function" then
            local ok, d = pcall(C_Reputation.GetFactionDataByID, factionID)
            if ok and type(d) == "table" and tonumber(d.reaction) and not Secret(d.reaction) then
                local low, high, cur = tonumber(d.currentReactionThreshold) or 0, tonumber(d.nextReactionThreshold) or 0, tonumber(d.currentStanding) or 0
                return d.name, d.reaction, cur - low, high - low
            end
        end
        if type(GetFactionInfoByID) == "function" then
            local ok, name, _, standing, low, high, value = pcall(GetFactionInfoByID, factionID)
            if ok and tonumber(standing) and not Secret(standing) then
                return name, standing, (tonumber(value) or 0) - (tonumber(low) or 0), (tonumber(high) or 0) - (tonumber(low) or 0)
            end
        end
        return nil
    end
    local function Row(journal, i)
        journal.fdjRepRows = journal.fdjRepRows or {}
        local row = journal.fdjRepRows[i]
        if row then return row end
        local parent = journal.questDetailContent
        row = {}
        row.text = parent:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
        row.text:SetJustifyH("LEFT")
        local bar = CreateFrame("StatusBar", nil, parent)
        bar:SetSize(230, 16)
        bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        bar:SetMinMaxValues(0, 1)
        bar.bg = bar:CreateTexture(nil, "BACKGROUND")
        bar.bg:SetAllPoints()
        bar.bg:SetColorTexture(0, 0, 0, 0.55)

        for _, side in ipairs({ { "TOPLEFT", "TOPRIGHT", 0, 1 }, { "BOTTOMLEFT", "BOTTOMRIGHT", 0, -1 } }) do
            local line = bar:CreateTexture(nil, "BORDER")
            line:SetColorTexture(0.12, 0.08, 0.03, 1)
            line:SetPoint(side[1], bar, side[1], -1, side[4])
            line:SetPoint(side[2], bar, side[2], 1, side[4])
            line:SetHeight(1)
        end
        for _, side in ipairs({ { "TOPLEFT", "BOTTOMLEFT", -1 }, { "TOPRIGHT", "BOTTOMRIGHT", 1 } }) do
            local line = bar:CreateTexture(nil, "BORDER")
            line:SetColorTexture(0.12, 0.08, 0.03, 1)
            line:SetPoint(side[1], bar, side[1], side[3], 1)
            line:SetPoint(side[2], bar, side[2], side[3], -1)
            line:SetWidth(1)
        end
        bar.label = bar:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
        bar.label:SetPoint("CENTER", bar, "CENTER", 0, 0)
        row.bar = bar
        journal.fdjRepRows[i] = row
        return row
    end
    function FDJ.PlaceRepNeeds(quest, cursorY)
        local journal = _G.ForeverDungeonJournalFrame
        if not (journal and journal.questDetailContent) then return cursorY end
        local needs = type(quest) == "table" and type(quest.repNeeds) == "table" and quest.repNeeds or {}
        local shown = 0
        for i, need in ipairs(needs) do
            local factionID, want = tonumber(need.faction), tonumber(need.standing) or 4
            if factionID then
                shown = i
                local row = Row(journal, i)
                local name, have, value, size = Standing(factionID)
                if type(name) ~= "string" or name == "" or Secret(name) then name = need.name or "?" end

                local into = tonumber(need.value)
                local met = have and (have > want or (have == want and (not into or (tonumber(value) or 0) >= into)))
                local wanted = Label(want)
                if into then wanted = wanted .. " " .. into .. " / " .. ((want >= 8) and 1000 or math.max(into, tonumber(size) or into)) end
                row.text:ClearAllPoints()
                row.text:SetPoint("TOPLEFT", journal.questDetailContent, "TOPLEFT", 0, -cursorY)



                if into then
                    row.text:SetText(FDJ.L("REP_REQUIRES_ONLY", wanted))
                else
                    row.text:SetText(FDJ.L("REP_REQUIRES", wanted, name))
                end

                if met then
                    row.text:SetFontObject("ForeverDJ_GameFontNormal")
                    row.text:SetTextColor(0.05, 0.42, 0.05)
                else
                    if FDJ.WarningFont then FDJ.WarningFont(row.text) else row.text:SetTextColor(0.62, 0.10, 0.05) end
                end
                row.text:Show()
                cursorY = cursorY + (row.text:GetStringHeight() or 14) + 4
                local bar = row.bar
                bar:ClearAllPoints()
                bar:SetPoint("TOPLEFT", journal.questDetailContent, "TOPLEFT", 1, -cursorY)
                if have then
                    bar:SetStatusBarColor(Color(have))
                    if size and size > 0 then



                        local frac = math.max(0, math.min(1, value / size))
                        if frac * (tonumber(bar:GetWidth()) or 230) < 4 then frac = 0 end
                        bar:SetValue(frac)
                        bar.label:SetText(Label(have) .. "  " .. math.floor(value) .. " / " .. math.floor(size))
                    else
                        bar:SetValue(1)
                        bar.label:SetText(Label(have))
                    end
                else
                    bar:SetStatusBarColor(0.4, 0.4, 0.4)
                    bar:SetValue(0)
                    bar.label:SetText(type(UNKNOWN) == "string" and UNKNOWN or "Unknown")
                end
                bar:Show()
                cursorY = cursorY + 16 + 10
            end
        end
        for i, row in ipairs(journal.fdjRepRows or {}) do
            if i > shown then row.text:Hide() row.bar:Hide() end
        end
        return cursorY
    end






    do
        local strings = {
            enUS = "You first need %s with %s",
            deDE = "Du brauchst zuerst %s bei %s",
            frFR = "Il vous faut d'abord être %s auprès de %s",
            esES = "Primero necesitas %s con %s",
            itIT = "Prima ti serve %s con %s",
            ptBR = "Primeiro você precisa de %s com %s",
            ruRU = "Сначала нужно отношение «%s» с фракцией «%s»",
            koKR = "먼저 %s 평판이 필요합니다: %s",
            zhCN = "你首先需要%s声望：%s",
            zhTW = "你首先需要%s聲望：%s",
        }
        strings.esMX = strings.esES
        for locale, text in pairs(strings) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t and t.ARROW_REP_FIRST == nil then t.ARROW_REP_FIRST = text end
        end
    end
    function FDJ.RepNeedLines(needs)
        if type(needs) ~= "table" then return nil end
        local out = {}
        for _, need in ipairs(needs) do
            local factionID, want = tonumber(need.faction), tonumber(need.standing) or 4
            if factionID then
                local name, have, value, size = Standing(factionID)
                if type(name) ~= "string" or name == "" or Secret(name) then name = need.name or "?" end
                local into = tonumber(need.value)
                local met = have and (have > want or (have == want and (not into or (tonumber(value) or 0) >= into)))
                if not met then
                    out[#out + 1] = "|cffff8040" .. FDJ.L("ARROW_REP_FIRST", Label(want), name) .. "|r"
                    if have then
                        local r, g, bl = Color(have)
                        out[#out + 1] = string.format("|cff%02x%02x%02x", math.floor(r * 255), math.floor(g * 255), math.floor(bl * 255))
                            .. Label(have) .. "|r" .. ((size and size > 0) and ("  |cffffffff" .. math.floor(value) .. " / " .. math.floor(size) .. "|r") or "")
                    end
                end
            end
        end
        return #out > 0 and table.concat(out, "\n") or nil
    end
end)()

