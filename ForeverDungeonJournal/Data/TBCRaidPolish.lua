-- Dungeon Journal: TBC Anniversary raid polish (v1.6.14.6).
-- Runs after TBCRaids.lua / TBCRaidLoot.lua.
local _, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY or not FDJ.DB then return end

local function Boss(dungeon, name)
    local d = FDJ.DB[dungeon]
    for _, b in ipairs(d and d.bosses or {}) do
        if b.name == name then return b end
    end
end

-- Real creature portraits instead of spell icons (display IDs as in AtlasLoot).
local reliquary = Boss("Black Temple", "Reliquary of Souls")
if reliquary then
    reliquary.customIcon = nil
    reliquary.npcID = reliquary.npcID or 22856
    reliquary.displayID = 21146
end
local council = Boss("Black Temple", "Illidari Council")
if council then
    council.customIcon = nil
    council.npcID = council.npcID or 22949
    council.displayID = 21416
end

-- Opera Event: loot shown in one section per play, plus the shared drops.
local opera = Boss("Karazhan", "Opera Event")
if opera then
    opera.lootSections = {
        { title = "The Wizard of Oz", ids = { 28586, 28585, 28587, 28588 } },
        { title = "The Big Bad Wolf (Red Riding Hood)", ids = { 28582, 28583, 28584, 28581 } },
        { title = "Romulo and Julianne", ids = { 28578, 28579, 28572, 28573 } },
        { title = "All Opera Events", ids = { 28594, 28591, 28589, 28593, 28590, 28592 } },
    }
end

-- Karazhan card: crop below the TBC logo at the top of the loading screen.
if FDJ.DUNGEON_HOME_TEXCOORD then FDJ.DUNGEON_HOME_TEXCOORD["Karazhan"] = { 0.02, 0.98, 0.33, 0.89 } end

-- Karazhan event portraits (bundled art).
local media = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\"
if opera then opera.customIcon = media .. "KaraOperaIcon" end
local chess = Boss("Karazhan", "Chess Event")
if chess then chess.customIcon = media .. "KaraChessIcon" end

-- Karazhan trash: no Soul Essence (quest item) and no white junk items.
local kara = FDJ.DB["Karazhan"]
local dropIDs = { [21882] = true, [23857] = true, [23864] = true, [23862] = true, [23865] = true }
for _, b in ipairs(kara and kara.bosses or {}) do
    if b.trash and b.loot then
        for i = #b.loot, 1, -1 do
            if dropIDs[b.loot[i][1]] then table.remove(b.loot, i) end
        end
    end
end

-- Raid bosses show the "??" skull level, including the Black Temple events.
FDJ.BOSS_LEVELS = FDJ.BOSS_LEVELS or {}
FDJ.BOSS_LEVELS["Black Temple"] = FDJ.BOSS_LEVELS["Black Temple"] or {}
FDJ.BOSS_LEVELS["Black Temple"]["Reliquary of Souls"] = "??"
FDJ.BOSS_LEVELS["Black Temple"]["Illidari Council"] = "??"

-- Reliquary of Souls: bundled portrait of the Reliquary's head (no background).
if reliquary then reliquary.customIcon = media .. "ReliquaryIcon" end

-- Uldaman: the Lost Vikings are Explorers' League dwarves - friendly to the
-- Alliance, so only the Horde can fight them.
for _, name in ipairs({ 'Eric "The Swift"', "Baelog", "Olaf" }) do
    local b = Boss("Uldaman", name)
    if b then b.factionOnly = "Horde" end
end

-- Items that drop with a random "of the ..." enchant (shown as "+ Random Enchant").
FDJ.RANDOM_ENCHANT_ITEMS = FDJ.RANDOM_ENCHANT_ITEMS or {}
for _, id in ipairs({
    11118,                          -- Archaedic Stone (Archaedas, Uldaman)
    30684, 30685, 30686, 30687,     -- Rokad the Ravager (Karazhan)
    30680, 30681, 30682, 30683,     -- Shadikith the Glider (Karazhan)
    30675, 30676, 30677, 30678,     -- Hyakiss the Lurker (Karazhan)
}) do FDJ.RANDOM_ENCHANT_ITEMS[id] = true end

-- "+Random Enchant" on the item tooltip: the journal's built-in hint (item[6]),
-- inserted in green above "Requires Level" and translated for every locale.
for _, d in pairs(FDJ.DB) do
    for _, b in ipairs(d.bosses or {}) do
        for _, item in ipairs(b.loot or {}) do
            if type(item) == "table" and FDJ.RANDOM_ENCHANT_ITEMS[item[1]] then
                item[5] = item[5] or ""
                item[6] = "RANDOM_ENCHANT"
            end
        end
    end
end

-- Zul'Aman timed chest: loot split by the chest it comes from (as in AtlasLoot).
local zaChest = Boss("Zul'Aman", "Timed Reward Chest")
if zaChest then
    zaChest.chestLabel = "Timed event | one chest per rescued prisoner"
    zaChest.lootSections = {
        { title = "Timed Reward Chest 1", ids = { 33590, 33591, 33489, 33480, 33483, 33971, 33805, 33481 } },
        { title = "Timed Reward Chest 2", ids = { 33495, 33493, 33492, 33490, 33494, 33491 } },
        { title = "Timed Reward Chest 3", ids = { 33497, 33500, 33496, 33499, 33498 } },
        { title = "Timed Reward Chest 4", ids = { 33809 } },
    }
end
