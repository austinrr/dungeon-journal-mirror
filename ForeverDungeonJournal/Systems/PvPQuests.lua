
















local FDJ = _G.ForeverDungeonJournal_NS
if not (FDJ and FDJ.DB and FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_DETAILS
    and FDJ.PVP_QUESTS and FDJ.PVP_QUEST_INFO and FDJ.PVP_QUEST_NPCS) then return end
local C, D = FDJ.QUEST_PREREQ_CHAINS, FDJ.QUEST_PREREQ_DETAILS
local INFO, NAMES_EN, NPCS = FDJ.PVP_QUEST_INFO, FDJ.PVP_QUESTS, FDJ.PVP_QUEST_NPCS

local PAGE = "Alterac Valley Quests"
FDJ.PVP_AV_PAGE = PAGE
FDJ.PVP_QUEST_PAGES = FDJ.PVP_QUEST_PAGES or {}
FDJ.PVP_QUEST_PAGES.AV = PAGE


local LIST = {
    Alliance = { 7172, 8271, 7081, 7102, 7121, 7122, 7223, 7282, 7301, 7367, 8375 },
    Horde = { 7167, 8272, 7082, 7101, 7123, 7124, 7224, 7281, 7302, 7368, 8369 },
}
local CHAINS = {
    [7172] = { 7162, 7168, 7169, 7170, 7171 },
    [7167] = { 7161, 7163, 7164, 7165, 7166 },
    [8271] = { 7141 },
    [8272] = { 7142 },
}
local SIDE_FACTION = { Alliance = 730, Horde = 729 }
local LANGS = { "deDE", "frFR", "esES", "itIT", "ptBR", "ruRU", "koKR", "zhCN", "zhTW" }

local HONOR = { deDE = "Ehre", frFR = "Honneur", esES = "Honor", itIT = "Onore", ptBR = "Honra",
    ruRU = "Честь", koKR = "명예", zhCN = "荣誉", zhTW = "榮譽" }

local function Str(lang, key)
    local all = FDJ.Locales or {}
    local t = all[lang]
    local v = t and t[key]
    if v == nil and all.enUS then v = all.enUS[key] end
    return v
end
local function NPCName(key, lang)
    local n = NPCS[key]
    if not n then return nil end
    if lang == "enUS" then return n[1] end
    local names = FDJ.PVP_QUEST_NPC_NAMES and FDJ.PVP_QUEST_NPC_NAMES[key]
    return (type(names) == "table" and names[lang]) or n[1]
end

local function At(key, lang)
    local n = NPCS[key]
    if not n then return nil end
    local name = NPCName(key, lang)
    local zone = n[2] and Str(lang, "PVP_ZONE_" .. tostring(n[2]))
    return (type(zone) == "string" and zone ~= "") and (name .. ", " .. zone) or name
end

local function Spot(key)
    local n = NPCS[key]
    if not (n and n[2] and n[3] and n[4]) then return nil end
    return { mapID = n[2], x = n[3], y = n[4], label = At(key, "enUS"), targetName = n[1] }
end
local function ItemName(id, lang)
    local own = lang ~= "enUS" and FDJ.PVP_INSIGNIA_NAMES and FDJ.PVP_INSIGNIA_NAMES[id]
    return (type(own) == "table" and own[lang]) or (FDJ.PVP_ITEM_NAMES and FDJ.PVP_ITEM_NAMES[id]) or ("item " .. tostring(id))
end

local function Objective(id, lang)
    local info = INFO[id] or {}
    if info.kind == "insignia" and info.need and info.finish then
        local f = Str(lang, "PVP_Q_INSIGNIA")
        if type(f) == "string" then return f:format(ItemName(info.need, lang), NPCName(info.finish, lang)) end
    elseif info.kind == "hero" and info.finish then
        local f = Str(lang, "PVP_Q_HERO")
        if type(f) == "string" then return f:format(NPCName(info.finish, lang)) end
    end
    local t = FDJ.PVP_QUEST_TEXT and FDJ.PVP_QUEST_TEXT[id]
    return type(t) == "table" and t[lang] or nil
end
local function Money(copper)
    copper = math.floor(tonumber(copper) or 0)
    if copper <= 0 then return nil end
    local g, s, c = math.floor(copper / 10000), math.floor((copper % 10000) / 100), copper % 100
    local parts = {}
    if g > 0 then parts[#parts + 1] = g .. "g" end
    if s > 0 then parts[#parts + 1] = s .. "s" end
    if c > 0 then parts[#parts + 1] = c .. "c" end
    return table.concat(parts, " ")
end
local function FactionName(id) return FDJ.PVP_QUEST_FACTIONS and FDJ.PVP_QUEST_FACTIONS[id] or tostring(id) end

local function Reps(info)
    local list = {}
    local r = info.rep or {}
    for i = 1, #r - 1, 2 do list[#list + 1] = { FactionName(r[i]), r[i + 1] } end
    if tonumber(info.honor) then list[#list + 1] = { "Honor", info.honor } end
    return list
end
local function Items(info)
    local list = {}
    for _, id in ipairs(info.choice or info.items or {}) do


        local quality = info.choice and 4 or ((id == 19483 or id == 19484) and 1) or 3
        list[#list + 1] = { id, ItemName(id, "enUS"), quality }
    end
    return list, info.choice ~= nil
end
local function Needs(info, side)
    if not info.needRep then return nil end
    local faction = SIDE_FACTION[side]
    return { { faction = faction, name = FactionName(faction), standing = info.needRep, value = info.needValue } }
end
local function Required(info)
    if not info.need then return nil end
    return { { info.need, ItemName(info.need, "enUS"), 3 } }
end


local XP = FDJ.FOREVER_QUEST_XP_FALLBACK
local ITEMS = FDJ.PREREQ_REWARD_ITEMS_FALLBACK
local MONEY = FDJ.PREREQ_REWARD_MONEY_FALLBACK
local all = {}
for side, list in pairs(LIST) do
    for _, id in ipairs(list) do
        all[id] = side
        for _, step in ipairs(CHAINS[id] or {}) do all[step] = side end
    end
end
for main, steps in pairs(CHAINS) do
    local side = all[main]
    local chain = {}
    for _, id in ipairs(steps) do
        local info, d = INFO[id] or {}, NAMES_EN[id] or { "?", 60, 51 }
        chain[#chain + 1] = { id = id, name = d[1] }
        if D[id] == nil then
            D[id] = {
                level = d[2] or 60, requires = d[3],
                objective = Objective(id, "enUS"),
                pickup = At(info.start, "enUS"), turnin = At(info.finish, "enUS"),
                map = Spot(info.start), turninMap = Spot(info.finish),
                objectiveInDungeon = false, dungeonStep = false,
                requiredItems = Required(info),
                showRequiredIcons = info.need and true or nil,
                repNeeds = Needs(info, side),
                repRewards = Reps(info),
            }
        end
        local items, choice = Items(info)
        if ITEMS and #items > 0 and ITEMS[id] == nil then ITEMS[id] = { items = items, choice = choice or nil } end
        if MONEY and tonumber(info.money) and MONEY[id] == nil then MONEY[id] = info.money end
        if XP and tonumber(info.xp) and XP[id] == nil then XP[id] = info.xp end
    end
    if C[main] == nil then C[main] = chain end
end


local quests = {}
for _, side in ipairs({ "Alliance", "Horde" }) do
    for _, id in ipairs(LIST[side]) do
        local info, d = INFO[id] or {}, NAMES_EN[id] or { "?", 60, 51 }
        local items, choice = Items(info)
        local summary = {}
        local money = Money(info.money)
        if money then summary[#summary + 1] = money end
        for _, rep in ipairs(Reps(info)) do summary[#summary + 1] = rep[1] .. " +" .. rep[2] end
        quests[#quests + 1] = {
            id = id, name = d[1], faction = side,
            level = d[2] or 60, requires = d[3],
            objective = Objective(id, "enUS"),
            pickup = At(info.start, "enUS"), turnin = At(info.finish, "enUS"),
            startMap = Spot(info.start), turninMap = Spot(info.finish),
            objectiveInDungeon = false,
            requiredItems = Required(info),
            repNeeds = Needs(info, side),
            rewardItems = items, rewardChoice = choice or nil,
            rewardSummary = table.concat(summary, "  \226\128\162  "),
            liveXPFallback = info.xp,
        }
    end
end
FDJ.DB[PAGE] = {
    questChainPage = true,
    bothFactions = true,
    noArrow = true,
    level = "51-60",
    location = "",
    description = "",
    bosses = {},
    quests = quests,
}


local baseName = FDJ.LocalizeDungeonName
FDJ.LocalizeDungeonName = function(name, ...)
    if name == PAGE then
        local bg = FDJ.PvPBattlegroundName and FDJ.PvPBattlegroundName("AV")
        if type(bg) == "string" and bg ~= "" and bg ~= "AV" then return bg end
        return (FDJ.L and FDJ.L("PVP_ZONE_1459")) or "Alterac Valley"
    end
    if baseName then return baseName(name, ...) end
    return name
end





for _, lang in ipairs(LANGS) do
    local content = FDJ.ContentLocales and FDJ.ContentLocales[lang]
    if type(content) == "table" then
        content.quests = content.quests or {}
        for id in pairs(all) do
            if content.quests[id] == nil then
                local info = INFO[id] or {}
                local entry = {}
                local own = FDJ.PVP_QUEST_NAMES and FDJ.PVP_QUEST_NAMES[id]
                if type(own) == "table" and own[lang] then entry.name = own[lang] end
                entry.objective = Objective(id, lang)
                entry.pickup = At(info.start, lang)
                entry.turnin = At(info.finish, lang)
                content.quests[id] = entry
            end
        end
        content.places = content.places or {}
        local places = content.places
        local function Put(en, loc)
            if type(en) == "string" and type(loc) == "string" and loc ~= "" and loc ~= en and places[en] == nil then places[en] = loc end
        end
        for key, n in pairs(NPCS) do Put(n[1], NPCName(key, lang)) end
        for _, mapID in ipairs({ 1416, 1459, 1453 }) do
            Put(FDJ.Locales and FDJ.Locales.enUS and FDJ.Locales.enUS["PVP_ZONE_" .. mapID], Str(lang, "PVP_ZONE_" .. mapID))
        end
        for id, names in pairs(FDJ.PVP_FACTION_NAMES or {}) do Put(FactionName(id), names[lang]) end
        Put("Honor", HONOR[lang])
    end
end


local function Plain(v)
    if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
    return v
end




local GIVES
function FDJ.PvPQuestForItem(key, side, itemID)
    if key ~= "AV" or not (side and itemID) then return nil end
    if not GIVES then
        GIVES = { Alliance = {}, Horde = {} }
        for s, list in pairs(LIST) do
            for _, main in ipairs(list) do
                local ids = { main }
                for _, step in ipairs(CHAINS[main] or {}) do ids[#ids + 1] = step end
                for _, id in ipairs(ids) do
                    local info = INFO[id] or {}
                    for _, item in ipairs(info.items or {}) do GIVES[s][item] = GIVES[s][item] or { id, main } end
                    for _, item in ipairs(info.choice or {}) do GIVES[s][item] = GIVES[s][item] or { id, main } end
                end
            end
        end
    end
    local found = GIVES[side] and GIVES[side][tonumber(itemID) or 0]
    if not found then return nil end
    return found[1], found[2]
end




function FDJ.OpenPvPQuests(key, side, questID)
    local page = FDJ.PVP_QUEST_PAGES[key]
    if not (page and FDJ.DB[page] and FDJ.OpenQuestPage) then return false end
    if side ~= "Alliance" and side ~= "Horde" then side = FDJ.PlayerFaction and FDJ.PlayerFaction() or "Alliance" end

    if FDJ.FactionHiddenFor and FDJ.FactionHiddenFor(page, side) then
        side = FDJ.PlayerFaction() or side
        questID = nil
    end
    local first
    for _, quest in ipairs(FDJ.DB[page].quests) do
        if quest.faction == side then
            first = first or quest.id
            if not (FDJ.QuestTurnedIn and Plain(FDJ.QuestTurnedIn(quest.id))) then first = quest.id break end
        end
    end

    local main, step
    if questID then
        for _, id in ipairs(LIST[side] or {}) do
            if id == questID then main = id end
            for _, s in ipairs(CHAINS[id] or {}) do
                if s == questID then main, step = id, s end
            end
        end
    end
    local function open()
        if main and step and FDJ.OpenQuestChain then
            FDJ.OpenQuestChain(page, main, step)
        else
            FDJ.OpenQuestPage(page, main or first)
        end
    end
    local back = {
        text = function() return FDJ.L and FDJ.L("PVP_BACK_REWARDS") or "Back to the rewards" end,
        open = function()
            if FDJ.OpenPvPPage then FDJ.OpenPvPPage() end
            if FDJ.OpenPvPRewards then FDJ.OpenPvPRewards(key, side) end
        end,
    }
    if FDJ.OpenFromPage then FDJ.OpenFromPage(page, open, back) else open() end
    return true
end


local arrowsBefore = FDJ.UpdateDungeonArrows
FDJ.UpdateDungeonArrows = function(...)
    if arrowsBefore then arrowsBefore(...) end
    local f = _G.ForeverDungeonJournalFrame
    local page = FDJ.GetSelectedDungeon and FDJ.GetSelectedDungeon()
    if f and page == PAGE then
        if f.prevDungeonButton then f.prevDungeonButton:Hide() end
        if f.nextDungeonButton then f.nextDungeonButton:Hide() end
    end
end
