-- TBC Anniversary Jewelcrafting designs from verified dungeon sources.
-- All additions are real design items, not the crafted rings/figurines.
-- Specific sources: Wowhead TBC Jewelcrafting 1-300 and 300-375 recipe guides.
local _, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY then return end

local function AddBossDesign(dungeonName, bossName, itemID, designName, rarity)
    local dungeon = FDJ.DB and FDJ.DB[dungeonName]
    if not dungeon then return end
    for _, boss in ipairs(dungeon.bosses or {}) do
        if boss.name == bossName then
            boss.loot = boss.loot or {}
            for _, item in ipairs(boss.loot) do
                if tonumber(item[1]) == itemID then
                    item[3] = "Recipe, Jewelcrafting"
                    return
                end
            end
            boss.loot[#boss.loot + 1] = {itemID, designName, "Recipe, Jewelcrafting", rarity or 2}
            return
        end
    end
end

-- Jewelcrafting exists in TBC even in Classic-era dungeons.
AddBossDesign("Blackrock Depths", "Golem Lord Argelmach", 21956, "Design: Dark Iron Scorpid", 2)
AddBossDesign("Lower Blackrock Spire", "Quartermaster Zigris", 21955, "Design: Black Diamond Crab", 2)

-- Existing boss-design drops: ensure they are typed as recipes (not equipment).
AddBossDesign("Old Hillsbrad Foothills", "Epoch Hunter", 24173, "Design: Circlet of Arcane Might", 2)
AddBossDesign("Sethekk Halls", "Darkweaver Syth", 24160, "Design: Khorium Inferno Band", 2)
AddBossDesign("Magisters' Terrace", "Kael'thas Sunstrider", 35304, "Design: Solid Star of Elune", 2)

-- These two designs drop from *trash mobs*, not instance bosses.
-- Do not create misleading boss encounters or put them on a random boss.
local function AddTrashDesign(dungeonName, itemID, designName, sourceNPC)
    local dungeon = FDJ.DB and FDJ.DB[dungeonName]
    if not dungeon then return end
    dungeon.fdjRecipeSources = dungeon.fdjRecipeSources or {}
    for _, entry in ipairs(dungeon.fdjRecipeSources) do
        if tonumber(entry.item[1]) == itemID then return end
    end
    dungeon.fdjRecipeSources[#dungeon.fdjRecipeSources + 1] = {
        item = {itemID, designName, "Recipe, Jewelcrafting", 2},
        source = sourceNPC,
        trash = true,
    }
end
AddTrashDesign("The Steamvault", 24159, "Design: Khorium Band of Frost", "Coilfang Sorceress")
AddTrashDesign("The Botanica", 24172, "Design: Coronet of Verdant Flame", "Sunseeker Botanist")

-- The three existing designs are also present in heroic loot tables.
-- Label those entries so recipe searching works in either difficulty.
for _, heroic in pairs(FDJ.HEROIC or {}) do
    for _, loot in pairs(heroic.loot or {}) do
        for _, item in ipairs(loot) do
            if type(item[2]) == "string" and item[2]:match("^[Dd]esign:") then
                item[3] = "Recipe, Jewelcrafting"
            end
        end
    end
    for _, boss in ipairs(heroic.extraBosses or {}) do
        for _, item in ipairs(boss.loot or {}) do
            if type(item[2]) == "string" and item[2]:match("^[Dd]esign:") then
                item[3] = "Recipe, Jewelcrafting"
            end
        end
    end
end
