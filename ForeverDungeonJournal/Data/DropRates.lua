-- droprates (2.0.11, M 18 Nov 2026: "is it possible to add percentage drop
-- rates to items on hover? as a test do it for UBRS", then "I LIKE it can we
-- push for every dungeon pls"): how often a boss drops an item, in percent,
-- shown in the item's tooltip on the boss's loot page ("Drop chance: 12.5%").
-- FDJ.DROP_RATES[dungeon][boss][itemID] = %.
-- Numbers: Wowhead Forever's loot counts (times dropped / kills recorded),
-- read 18 Nov 2026. A boss with fewer than 25 recorded kills on Wowhead
-- Forever uses Classic Wowhead's counts instead (noted on that boss); an item
-- with no recorded drops shows no chance. Quest items get none either (M 18
-- Nov 2026: "can we remove the drop chance from quest items").
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

FDJ.DROP_RATES = FDJ.DROP_RATES or {}

-- The chance on that boss's page; on a page that isn't one boss's (Recipes &
-- Patterns), the chance of the one boss of the dungeon that drops it.
function FDJ.DropChance(dungeon, boss, itemID)
    local d = dungeon and FDJ.DROP_RATES[dungeon]
    if type(d) ~= "table" or not itemID then return nil end
    local b = boss and d[boss]
    if type(b) == "table" and b[itemID] then return b[itemID] end
    local found
    for _, rates in pairs(d) do
        if type(rates) == "table" and rates[itemID] then
            if found then return nil end
            found = rates[itemID]
        end
    end
    return found
end

function FDJ.DropChanceText(dungeon, boss, itemID)
    -- lootoptions (2.0.11): Options > Loot > Hide drop rates
    if ForeverDungeonJournalDB and ForeverDungeonJournalDB.hideDropRates then return nil end
    local pct = FDJ.DropChance(dungeon, boss, itemID)
    if type(pct) ~= "number" then return nil end
    local text
    if pct >= 10 then
        text = string.format("%d%%", math.floor(pct + 0.5))
    elseif pct >= 0.1 then
        text = (string.format("%.1f", pct):gsub("%.0$", "")) .. "%"
    else
        text = "<0.1%"
    end
    return FDJ.L("ITEM_DROP_CHANCE", text)
end

do
    local strings = {
        enUS = { ITEM_DROP_CHANCE = "Drop chance: %s" },
        deDE = { ITEM_DROP_CHANCE = "Dropchance: %s" },
        frFR = { ITEM_DROP_CHANCE = "Chance de butin : %s" },
        esES = { ITEM_DROP_CHANCE = "Probabilidad de botín: %s" },
        itIT = { ITEM_DROP_CHANCE = "Probabilità di drop: %s" },
        ptBR = { ITEM_DROP_CHANCE = "Chance de saque: %s" },
        ruRU = { ITEM_DROP_CHANCE = "Шанс добычи: %s" },
        koKR = { ITEM_DROP_CHANCE = "획득 확률: %s" },
        zhCN = { ITEM_DROP_CHANCE = "掉落几率：%s" },
        zhTW = { ITEM_DROP_CHANCE = "掉落機率：%s" },
    }
    strings.esMX = strings.esES
    for locale, entries in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            for key, value in pairs(entries) do
                if t[key] == nil then t[key] = value end
            end
        end
    end
end

FDJ.DROP_RATES["Hall of Thanes"] = {
    ["Faldrim Anvilmar"] = { -- NPC 261306, 4577 kills on Wowhead Forever
        [270227] = 33.8, -- Ephemeral Choker (1547/4577)
        [271096] = 32.2, -- Aetherwisp Bracers (1475/4577)
        [271097] = 34, -- Spiritwraith Drape (1555/4577)
    },
    ["Magmatus"] = { -- NPC 261316, 2986 kills on Wowhead Forever
        [270230] = 31.5, -- Kindlegem Girdle (940/2986)
        [270231] = 32.9, -- Flamefist Grips (982/2986)
        [271095] = 35.6, -- Fang of Magmatus (1064/2986)
    },
    ["Plunder"] = { -- NPC 261311, 4224 kills on Wowhead Forever
        [270228] = 34.8, -- Golemheart Stave (1471/4224)
        [271098] = 31.9, -- Golemguard Chest (1348/4224)
        [270229] = 33.3, -- Treads of the Protector Golem (1405/4224)
    },
    ["Durgen Dirgehammer"] = { -- NPC 261319, 3959 kills on Wowhead Forever
        [270256] = 28.7, -- Durgen's Crescent Axe (1138/3959)
        [270260] = 27.3, -- Direhammer Leggings (1079/3959)
        [270261] = 24.7, -- Robes of the Disgraced Thane (976/3959)
    },
}

FDJ.DROP_RATES["Ragefire Chasm"] = {
    ["Oggleflint"] = { -- NPC 11517, 4394 kills on Wowhead Forever
        [272999] = 30.8, -- Barbaric Crossbow (1354/4394)
        [272996] = 31.8, -- Trogg Scepter (1398/4394)
        [272998] = 33.8, -- Bone Knuckles (1486/4394)
    },
    ["Taragaman the Hungerer"] = { -- NPC 11520, 5225 kills on Wowhead Forever
        [14149] = 29.9, -- Subterranean Cape (1563/5225)
        [14148] = 28, -- Crystalline Cuffs (1461/5225)
        [14145] = 29.9, -- Cursed Felblade (1561/5225)
    },
    ["Jergosh the Invoker"] = { -- NPC 11518, 3958 kills on Wowhead Forever
        [14150] = 31.7, -- Robe of Evocation (1255/3958)
        [14147] = 30, -- Cavedweller Bracers (1189/3958)
        [14151] = 32.1, -- Chanting Blade (1269/3958)
        [253906] = 0.33, -- Pattern: Filigreed Flame Gown (13/3958)
    },
    ["Bazzalan"] = { -- NPC 11519, 4623 kills on Wowhead Forever
        [273003] = 33.3, -- Searing Dagger (1538/4623)
        [273007] = 30.4, -- Chasm Walkers (1404/4623)
        [273005] = 32.9, -- Satyrskin Cloak (1523/4623)
        [253908] = 0.58, -- Pattern: Filigreed Shadow Gown (27/4623)
        [253910] = 0.56, -- Pattern: Filigreed Pearly Gown (26/4623)
    },
}

FDJ.DROP_RATES["Ruins of Lordaeron"] = {
    ["The Baron"] = { -- NPC 250660, 6069 kills on Wowhead Forever
        [271204] = 31.2, -- Meathook Slicer (1893/6069)
        [271205] = 29.9, -- Abomination Bones (1814/6069)
        [271206] = 30.7, -- Leftover Abomination Skin (1861/6069)
    },
    ["Witherfang"] = { -- NPC 250483, 4771 kills on Wowhead Forever
        [271201] = 28.4, -- Atrophic Girdle (1354/4771)
        [271202] = 31.7, -- Witherbite Bracers (1514/4771)
        [271203] = 31.9, -- Segmented Spider Leg (1520/4771)
    },
    ["Viktor the Vile"] = { -- NPC 256035, 4971 kills on Wowhead Forever
        [271211] = 32.7, -- Vilewalkers (1625/4971)
        [271212] = 33.1, -- Bloodied Chestwraps (1645/4971)
        [271218] = 34.2, -- Vileblood Scimitar (1701/4971)
    },
    ["The Abandoned"] = { -- NPC 250631, 5128 kills on Wowhead Forever
        [271207] = 32.5, -- Rotmender's Leggings (1666/5128)
        [271208] = 32.8, -- Grip of Fear (1680/5128)
        [271216] = 34.8, -- Scepter of the Abandoned (1782/5128)
    },
    ["Bjork"] = { -- NPC 256097, 5312 kills on Wowhead Forever
        [271209] = 32.7, -- Bonerust Leggings (1739/5312)
        [271210] = 32.1, -- Tuskwrap Belt (1707/5312)
        [271217] = 35.1, -- Corpse Chopper (1865/5312)
    },
    ["Rath'mael"] = { -- NPC 250657, 5426 kills on Wowhead Forever
        [271213] = 34, -- Mirror of Rath'mael (1846/5426)
        [271214] = 32.5, -- Rotmender's Treads (1764/5426)
        [271215] = 32.7, -- Coldspire Staff (1774/5426)
        [273085] = 7, -- Blueprint: Fermenter (379/5426)
    },
    ["Lordaeron Captain"] = { -- NPC 255699, 106 kills on Wowhead Forever
        [6641] = 47.2, -- Haunting Blade (50/106)
        [6642] = 47.2, -- Phantom Armor (50/106)
    },
}

FDJ.DROP_RATES["The Deadmines"] = {
    ["Rhahk'Zor"] = { -- NPC 644, 4508 kills on Wowhead Forever
        [872] = 32.6, -- Rockslicer (1471/4508)
        [5187] = 31.5, -- Rhahk'Zor's Hammer (1418/4508)
        [273289] = 32.2, -- Ogre Loincloth (1453/4508)
        [253906] = 0.38, -- Pattern: Filigreed Flame Gown (17/4508)
    },
    ["Miner Johnson"] = { -- NPC 3586, 662 kills on Wowhead Forever
        [5443] = 45.6, -- Gold-plated Buckler (302/662)
        [5444] = 52.1, -- Miner's Cape (345/662)
    },
    ["Sneed's Shredder"] = { -- NPC 642, 5740 kills on Wowhead Forever
        [1937] = 29.4, -- Buzz Saw (1687/5740)
        [2169] = 29.4, -- Buzzer Blade (1690/5740)
        [285292] = 28.2, -- Dull Sawblade (1621/5740)
    },
    ["Sneed"] = { -- NPC 643, 3436 kills on Wowhead Forever
        [5194] = 30, -- Taskmaster Axe (1031/3436)
        [5195] = 32.2, -- Gold-flecked Gloves (1105/3436)
        [273293] = 30.9, -- Bandsaw Wristbands (1061/3436)
        [273092] = 6.9, -- Blueprint: Repair Bot (238/3436)
        [253902] = 0.84, -- Pattern: Filigreed Pristine Gown (29/3436)
    },
    ["Gilnid"] = { -- NPC 1763, 4682 kills on Wowhead Forever
        [1156] = 31.7, -- Lavishly Jeweled Ring (1486/4682)
        [5199] = 31.9, -- Smelting Pants (1495/4682)
        [273297] = 31.7, -- Goblin Hammer (1486/4682)
        [253904] = 0.56, -- Pattern: Filigreed Silky Gown (26/4682)
        [253906] = 0.41, -- Pattern: Filigreed Flame Gown (19/4682)
        [273086] = 6.8, -- Blueprint: Anvil (319/4682)
        [251340] = 0.41, -- Plans: Veteran's Chain Shirt (19/4682)
        [251341] = 0.62, -- Plans: Guard's Chain Shirt (29/4682)
        [251342] = 0.43, -- Plans: Protector's Chain Shirt (20/4682)
        [251343] = 0.45, -- Plans: Acolyte's Chain Shirt (21/4682)
        [251344] = 0.6, -- Plans: Crusader's Chain Shirt (28/4682)
        [252771] = 0.41, -- Pattern: Brawler's Leather Armor (19/4682)
        [252772] = 0.28, -- Pattern: Trapper's Leather Armor (13/4682)
        [252773] = 0.45, -- Pattern: Defender's Leather Armor (21/4682)
        [252774] = 0.3, -- Pattern: Totemic Leather Armor (14/4682)
        [252775] = 0.56, -- Pattern: Stormrider's Leather Armor (26/4682)
        [252776] = 0.6, -- Pattern: Wisdom's Leather Armor (28/4682)
        [253908] = 0.45, -- Pattern: Filigreed Shadow Gown (21/4682)
    },
    ["Mr. Smite"] = { -- NPC 646, 5422 kills on Wowhead Forever
        [7230] = 24.6, -- Smite's Mighty Hammer (1332/5422)
        [5192] = 24.8, -- Thief's Blade (1347/5422)
        [5196] = 23.6, -- Smite's Reaver (1280/5422)
        [284715] = 23.6, -- First Mate Band (1282/5422)
    },
    ["Captain Greenskin"] = { -- NPC 647, 4539 kills on Wowhead Forever
        [5201] = 30.9, -- Emberstone Staff (1403/4539)
        [10403] = 31, -- Blackened Defias Belt (1406/4539)
        [5200] = 31.9, -- Impaling Harpoon (1447/4539)
    },
    ["Edwin VanCleef"] = { -- NPC 639, 5011 kills on Wowhead Forever
        [5193] = 19.3, -- Cape of the Brotherhood (966/5011)
        [5202] = 18.8, -- Corsair's Overshirt (944/5011)
        [10399] = 20.4, -- Blackened Defias Armor (1023/5011)
        [5191] = 21.2, -- Cruel Barb (1062/5011)
        [253938] = 0.74, -- Pattern: Filigreed Pristine Leggings (37/5011)
        [253948] = 0.46, -- Pattern: Filigreed Shining Leggings (23/5011)
        [251345] = 0.6, -- Plans: Veteran's Chain Leggings (30/5011)
        [251346] = 0.5, -- Plans: Guard's Chain Leggings (25/5011)
        [251347] = 0.46, -- Plans: Protector's Chain Leggings (23/5011)
        [251348] = 0.44, -- Plans: Acolyte's Chain Leggings (22/5011)
        [251349] = 0.66, -- Plans: Crusader's Chain Leggings (33/5011)
        [252792] = 0.32, -- Pattern: Brawler's Leather Pants (16/5011)
        [252793] = 0.34, -- Pattern: Trapper's Leather Pants (17/5011)
        [252794] = 0.38, -- Pattern: Defender's Leather Pants (19/5011)
        [252795] = 0.52, -- Pattern: Totemic Leather Pants (26/5011)
        [252796] = 0.28, -- Pattern: Stormrider's Leather Pants (14/5011)
        [252797] = 0.66, -- Pattern: Wisdom's Leather Pants (33/5011)
        [253940] = 0.58, -- Pattern: Filigreed Silky Leggings (29/5011)
        [253942] = 0.38, -- Pattern: Filigreed Flame Leggings (19/5011)
        [253944] = 0.38, -- Pattern: Filigreed Shadow Leggings (19/5011)
        [253946] = 0.48, -- Pattern: Filigreed Pearly Leggings (24/5011)
    },
    ["Cookie"] = { -- NPC 645, 4220 kills on Wowhead Forever
        [5198] = 29.1, -- Cookie's Stirring Rod (1227/4220)
        [5197] = 30.6, -- Cookie's Tenderizer (1292/4220)
        [273298] = 29.1, -- Lookie's Spyglass (1228/4220)
        [253910] = 0.26, -- Pattern: Filigreed Pearly Gown (11/4220)
        [253912] = 0.43, -- Pattern: Filigreed Shining Gown (18/4220)
        [273102] = 7.1, -- Blueprint: Cookie's Feast (301/4220)
    },
}

FDJ.DROP_RATES["Wailing Caverns"] = {
    ["Lord Cobrahn"] = { -- NPC 3669, 6013 kills on Wowhead Forever
        [6460] = 30.4, -- Cobrahn's Grasp (1828/6013)
        [10410] = 31, -- Leggings of the Fang (1866/6013)
        [6465] = 30.4, -- Robe of the Moccasin (1825/6013)
    },
    ["Lady Anacondra"] = { -- NPC 3671, 5237 kills on Wowhead Forever
        [10412] = 26.7, -- Belt of the Fang (1400/5237)
        [5404] = 26.5, -- Serpent's Shoulders (1388/5237)
        [6446] = 8.9, -- Snakeskin Bag (464/5237)
        [273088] = 26.9, -- Snake Eye Kaleidoscope (1410/5237)
        [273098] = 5.8, -- Blueprint: Field Guide (303/5237)
    },
    ["Kresh"] = { -- NPC 3653, 6835 kills on Wowhead Forever
        [13245] = 40.1, -- Kresh's Back (2740/6835)
        [6447] = 39.3, -- Worn Turtle Shell Shield (2683/6835)
        [273084] = 9.7, -- Cloak of Hermitic Bliss (661/6835)
    },
    ["Lord Pythas"] = { -- NPC 3670, 4836 kills on Wowhead Forever
        [6472] = 29.2, -- Stinging Viper (1412/4836)
        [6473] = 28.4, -- Armor of the Fang (1372/4836)
        [273089] = 28.7, -- Slither Cord (1386/4836)
        [253938] = 0.68, -- Pattern: Filigreed Pristine Leggings (33/4836)
        [253940] = 0.39, -- Pattern: Filigreed Silky Leggings (19/4836)
        [253946] = 0.68, -- Pattern: Filigreed Pearly Leggings (33/4836)
    },
    ["Skum"] = { -- NPC 3674, 4842 kills on Wowhead Forever
        [6449] = 30.3, -- Glowing Lizardscale Cloak (1466/4842)
        [6448] = 28.6, -- Tail Spike (1386/4842)
        [273137] = 30.7, -- Skum's Bucket (1487/4842)
        [253944] = 0.5, -- Pattern: Filigreed Shadow Leggings (24/4842)
    },
    ["Lord Serpentis"] = { -- NPC 3673, 4831 kills on Wowhead Forever
        [6469] = 14.1, -- Venomstrike (683/4831)
        [5970] = 17.3, -- Serpent Gloves (836/4831)
        [10411] = 15.6, -- Footpads of the Fang (755/4831)
        [6459] = 33.7, -- Savage Trodders (1628/4831)
        [273087] = 6.1, -- Blueprint: Journeyman Campfire (297/4831)
        [253942] = 0.35, -- Pattern: Filigreed Flame Leggings (17/4831)
    },
    ["Verdan the Everliving"] = { -- NPC 5775, 5595 kills on Wowhead Forever
        [6630] = 32.2, -- Seedcloud Buckler (1799/5595)
        [6631] = 31.6, -- Living Root (1767/5595)
        [6629] = 32.9, -- Sporid Cape (1839/5595)
        [253948] = 0.41, -- Pattern: Filigreed Shining Leggings (23/5595)
    },
    ["Mutanus the Devourer"] = { -- NPC 3654, 6091 kills on Wowhead Forever
        [6461] = 27.3, -- Slime-encrusted Pads (1665/6091)
        [6627] = 28.8, -- Mutant Scale Breastplate (1754/6091)
        [6463] = 29.1, -- Deep Fathom Ring (1770/6091)
    },
    ["Deviate Faerie Dragon"] = { -- NPC 5912, 545 kills on Wowhead Forever
        [5243] = 39.3, -- Firebelcher (214/545)
        [6632] = 46.1, -- Feyscale Cloak (251/545)
    },
}

FDJ.DROP_RATES["Shadowfang Keep"] = {
    ["Rethilgore"] = { -- NPC 3914, 4482 kills on Wowhead Forever
        [5254] = 28.7, -- Rugged Spaulders (1280/4455)
        [273457] = 30, -- Sorcerer Collar (1338/4455)
        [273456] = 29.2, -- Cell Keeper's Claws (1300/4455)
    },
    ["Fel Steed / Shadow Charger"] = { -- NPC 3864, 3038 kills on Wowhead Forever
        [6341] = 18.6, -- Eerie Stable Lantern (562/3028)
        [932] = 19.2, -- Fel Steed Saddlebags (580/3028)
        [251341] = 1.5, -- Plans: Guard's Chain Shirt (45/3028)
        [253902] = 0.79, -- Pattern: Filigreed Pristine Gown (24/3028)
        [253904] = 1, -- Pattern: Filigreed Silky Gown (31/3028)
        [253906] = 1.2, -- Pattern: Filigreed Flame Gown (37/3028)
        [253908] = 0.92, -- Pattern: Filigreed Shadow Gown (28/3028)
        [253910] = 0.89, -- Pattern: Filigreed Pearly Gown (27/3028)
        [253912] = 1, -- Pattern: Filigreed Shining Gown (31/3028)
        [253946] = 0.03, -- Pattern: Filigreed Pearly Leggings (1/3028)
    },
    ["Razorclaw the Butcher"] = { -- NPC 3886, 4765 kills on Wowhead Forever
        [1292] = 29.6, -- Butcher's Cleaver (1407/4749)
        [6226] = 30.9, -- Bloody Apron (1467/4749)
        [6633] = 30.3, -- Butcher's Slicer (1441/4749)
        [273096] = 7.7, -- Blueprint: Tanning Rack (365/4749)
        [253938] = 0.38, -- Pattern: Filigreed Pristine Leggings (18/4749)
        [253942] = 0.46, -- Pattern: Filigreed Flame Leggings (22/4749)
        [253944] = 0.29, -- Pattern: Filigreed Shadow Leggings (14/4749)
    },
    ["Baron Silverlaine"] = { -- NPC 3887, 4639 kills on Wowhead Forever
        [6321] = 32, -- Silverlaine's Family Seal (1484/4635)
        [6323] = 33.4, -- Baron's Scepter (1546/4635)
        [273637] = 32, -- Blade of Silverlaine (1483/4635)
    },
    ["Commander Springvale"] = { -- NPC 4278, 4548 kills on Wowhead Forever
        [6320] = 30.9, -- Commander's Crest (1404/4548)
        [3191] = 33.3, -- Arced War Axe (1515/4548)
        [273643] = 32.1, -- Worgenbane Talisman (1460/4548)
        [273105] = 7.2, -- Blueprint: Toxin Study (328/4548)
        [6341] = 9.4, -- Eerie Stable Lantern (427/4548)
    },
    ["Odo the Blindwatcher"] = { -- NPC 4279, 4411 kills on Wowhead Forever
        [6318] = 30.5, -- Odo's Ley Staff (1344/4411)
        [6319] = 30.9, -- Girdle of the Blindwatcher (1363/4411)
        [273645] = 32.6, -- Blindwatcher's Sight (1440/4411)
    },
    ["Deathsworn Captain"] = { -- NPC 3872, 828 kills on Wowhead Forever
        [6642] = 44.5, -- Phantom Armor (367/825)
        [6641] = 51.3, -- Haunting Blade (423/825)
    },
    ["Arugal's Voidwalker"] = { -- NPC 4627, 1954 kills on Wowhead Forever
        [5943] = 9.8, -- Rift Bracers (192/1954)
    },
    ["Fenrus the Devourer"] = { -- NPC 4274, 4467 kills on Wowhead Forever
        [6340] = 31.1, -- Fenrus' Hide (1388/4465)
        [3230] = 31, -- Black Wolf Bracers (1382/4465)
        [273646] = 30.4, -- Half-Eaten Boots (1356/4465)
    },
    ["Wolf Master Nandos"] = { -- NPC 3927, 3840 kills on Wowhead Forever
        [3748] = 32.4, -- Feline Mantle (1246/3840)
        [6314] = 30.6, -- Wolfmaster Cape (1176/3840)
        [273647] = 27.8, -- Worgpelt Leggings (1068/3840)
    },
    ["Archmage Arugal"] = { -- NPC 4275, 4786 kills on Wowhead Forever
        [6324] = 29.6, -- Robes of Arugal (1418/4786)
        [6392] = 28, -- Belt of Arugal (1342/4786)
        [6220] = 29.4, -- Meteor Shard (1408/4786)
    },
}

FDJ.DROP_RATES["Blackfathom Deeps"] = {
    ["Ghamoo-ra"] = { -- NPC 4887, 4412 kills on Wowhead Forever
        [6907] = 32.6, -- Tortoise Armor (1437/4412)
        [6908] = 29.3, -- Ghamoo-ra's Bind (1294/4412)
        [273839] = 32.3, -- Spiked Shell Band (1425/4412)
        [253940] = 0.54, -- Pattern: Filigreed Silky Leggings (24/4412)
        [253942] = 0.48, -- Pattern: Filigreed Flame Leggings (21/4412)
        [253938] = 0.45, -- Pattern: Filigreed Pristine Leggings (20/4412)
        [253946] = 0.54, -- Pattern: Filigreed Pearly Leggings (24/4412)
        [253944] = 0.41, -- Pattern: Filigreed Shadow Leggings (18/4412)
        [251345] = 0.34, -- Plans: Veteran's Chain Leggings (15/4412)
        [251346] = 0.43, -- Plans: Guard's Chain Leggings (19/4412)
        [251347] = 0.41, -- Plans: Protector's Chain Leggings (18/4412)
        [251348] = 0.34, -- Plans: Acolyte's Chain Leggings (15/4412)
        [251349] = 0.41, -- Plans: Crusader's Chain Leggings (18/4412)
        [252792] = 0.57, -- Pattern: Brawler's Leather Pants (25/4412)
        [252793] = 0.54, -- Pattern: Trapper's Leather Pants (24/4412)
        [252794] = 0.36, -- Pattern: Defender's Leather Pants (16/4412)
        [252795] = 0.41, -- Pattern: Totemic Leather Pants (18/4412)
        [252796] = 0.36, -- Pattern: Stormrider's Leather Pants (16/4412)
        [252797] = 0.66, -- Pattern: Wisdom's Leather Pants (29/4412)
        [253948] = 0.29, -- Pattern: Filigreed Shining Leggings (13/4412)
    },
    ["Lady Sarevess"] = { -- NPC 4831, 3863 kills on Wowhead Forever
        [888] = 33.3, -- Naga Battle Gloves (1287/3863)
        [3078] = 30.3, -- Naga Heartpiercer (1169/3863)
        [11121] = 32.8, -- Darkwater Talwar (1268/3863)
        [253944] = 0.39, -- Pattern: Filigreed Shadow Leggings (15/3863)
        [253946] = 0.72, -- Pattern: Filigreed Pearly Leggings (28/3863)
        [253948] = 0.6, -- Pattern: Filigreed Shining Leggings (23/3863)
        [253942] = 0.57, -- Pattern: Filigreed Flame Leggings (22/3863)
        [253940] = 0.41, -- Pattern: Filigreed Silky Leggings (16/3863)
        [253938] = 0.52, -- Pattern: Filigreed Pristine Leggings (20/3863)
        [251345] = 0.65, -- Plans: Veteran's Chain Leggings (25/3863)
        [251346] = 0.54, -- Plans: Guard's Chain Leggings (21/3863)
        [251347] = 0.36, -- Plans: Protector's Chain Leggings (14/3863)
        [251348] = 0.72, -- Plans: Acolyte's Chain Leggings (28/3863)
        [251349] = 0.49, -- Plans: Crusader's Chain Leggings (19/3863)
        [252792] = 0.41, -- Pattern: Brawler's Leather Pants (16/3863)
        [252793] = 0.47, -- Pattern: Trapper's Leather Pants (18/3863)
        [252794] = 0.28, -- Pattern: Defender's Leather Pants (11/3863)
        [252795] = 0.65, -- Pattern: Totemic Leather Pants (25/3863)
        [252796] = 0.65, -- Pattern: Stormrider's Leather Pants (25/3863)
        [252797] = 0.57, -- Pattern: Wisdom's Leather Pants (22/3863)
    },
    ["Gelihast"] = { -- NPC 6243, 4330 kills on Wowhead Forever
        [6906] = 31.7, -- Algae Fists (1373/4330)
        [6905] = 31.4, -- Reef Axe (1361/4330)
        [1470] = 4.9, -- Murloc Skin Bag (213/4330)
        [273840] = 31.9, -- Cursed Murloc Eye (1380/4330)
        [253978] = 0.51, -- Pattern: Filigreed Silky Circlet (22/4330)
        [253980] = 0.44, -- Pattern: Filigreed Flame Circlet (19/4330)
        [273141] = 7, -- Blueprint: Fishing Rack (302/4330)
        [253976] = 0.79, -- Pattern: Filigreed Pristine Circlet (34/4330)
        [253982] = 0.3, -- Pattern: Filigreed Shadow Circlet (13/4330)
        [253986] = 0.46, -- Pattern: Filigreed Shining Circlet (20/4330)
        [251350] = 0.67, -- Plans: Veteran's Chain Helm (29/4330)
        [251351] = 0.51, -- Plans: Guard's Chain Helm (22/4330)
        [251352] = 0.69, -- Plans: Protector's Chain Helm (30/4330)
        [251353] = 0.42, -- Plans: Acolyte's Chain Helm (18/4330)
        [251354] = 0.32, -- Plans: Crusader's Chain Helm (14/4330)
        [252814] = 0.42, -- Pattern: Brawler's Leather Helm (18/4330)
        [252815] = 0.3, -- Pattern: Trapper's Leather Helm (13/4330)
        [252816] = 0.48, -- Pattern: Defender's Leather Helm (21/4330)
        [252817] = 0.48, -- Pattern: Totemic Leather Helm (21/4330)
        [252818] = 0.51, -- Pattern: Stormrider's Leather Helm (22/4330)
        [252819] = 0.55, -- Pattern: Wisdom's Leather Helm (24/4330)
        [253984] = 0.55, -- Pattern: Filigreed Pearly Circlet (24/4330)
    },
    ["Lorgus Jett"] = { -- NPC 12902, 3346 kills on Wowhead Forever
        [273843] = 32, -- Fallenroot Longbow (1072/3346)
        [273841] = 34.4, -- Twilight Maul (1151/3346)
        [273842] = 29.8, -- Treacherous Treads (997/3346)
        [253978] = 0.51, -- Pattern: Filigreed Silky Circlet (17/3346)
        [253982] = 0.42, -- Pattern: Filigreed Shadow Circlet (14/3346)
        [251350] = 0.54, -- Plans: Veteran's Chain Helm (18/3346)
        [251351] = 0.45, -- Plans: Guard's Chain Helm (15/3346)
        [251352] = 0.54, -- Plans: Protector's Chain Helm (18/3346)
        [251353] = 0.42, -- Plans: Acolyte's Chain Helm (14/3346)
        [251354] = 0.6, -- Plans: Crusader's Chain Helm (20/3346)
        [252814] = 0.27, -- Pattern: Brawler's Leather Helm (9/3346)
        [252815] = 0.9, -- Pattern: Trapper's Leather Helm (30/3346)
        [252816] = 0.75, -- Pattern: Defender's Leather Helm (25/3346)
        [252817] = 0.51, -- Pattern: Totemic Leather Helm (17/3346)
        [252818] = 0.54, -- Pattern: Stormrider's Leather Helm (18/3346)
        [252819] = 0.63, -- Pattern: Wisdom's Leather Helm (21/3346)
        [253976] = 0.54, -- Pattern: Filigreed Pristine Circlet (18/3346)
        [253980] = 0.69, -- Pattern: Filigreed Flame Circlet (23/3346)
        [253984] = 0.81, -- Pattern: Filigreed Pearly Circlet (27/3346)
        [253986] = 0.42, -- Pattern: Filigreed Shining Circlet (14/3346)
    },
    ["Old Serra'kis"] = { -- NPC 4830, 3749 kills on Wowhead Forever
        [6901] = 31.7, -- Glowing Thresher Cape (1188/3749)
        [6904] = 31.8, -- Bite of Serra'kis (1194/3749)
        [6902] = 31.8, -- Bands of Serra'kis (1192/3749)
        [253978] = 0.48, -- Pattern: Filigreed Silky Circlet (18/3749)
        [253982] = 0.51, -- Pattern: Filigreed Shadow Circlet (19/3749)
        [253986] = 0.75, -- Pattern: Filigreed Shining Circlet (28/3749)
        [253976] = 0.91, -- Pattern: Filigreed Pristine Circlet (34/3749)
        [251350] = 0.53, -- Plans: Veteran's Chain Helm (20/3749)
        [251351] = 0.61, -- Plans: Guard's Chain Helm (23/3749)
        [251352] = 0.43, -- Plans: Protector's Chain Helm (16/3749)
        [251353] = 0.64, -- Plans: Acolyte's Chain Helm (24/3749)
        [251354] = 0.67, -- Plans: Crusader's Chain Helm (25/3749)
        [252814] = 0.8, -- Pattern: Brawler's Leather Helm (30/3749)
        [252815] = 0.56, -- Pattern: Trapper's Leather Helm (21/3749)
        [252816] = 1.3, -- Pattern: Defender's Leather Helm (47/3749)
        [252817] = 0.69, -- Pattern: Totemic Leather Helm (26/3749)
        [252818] = 0.53, -- Pattern: Stormrider's Leather Helm (20/3749)
        [252819] = 0.56, -- Pattern: Wisdom's Leather Helm (21/3749)
        [253980] = 0.35, -- Pattern: Filigreed Flame Circlet (13/3749)
        [253984] = 0.59, -- Pattern: Filigreed Pearly Circlet (22/3749)
    },
    ["Twilight Lord Kelris"] = { -- NPC 4832, 9863 kills on Wowhead Forever
        [1155] = 15.4, -- Rod of the Sleepwalker (1516/9863)
        [6903] = 13.9, -- Gaze Dreamer Pants (1370/9863)
        [273846] = 14.4, -- Twilight Lord Girdle (1422/9863)
        [253982] = 0.27, -- Pattern: Filigreed Shadow Circlet (27/9863)
        [253986] = 0.25, -- Pattern: Filigreed Shining Circlet (25/9863)
        [253980] = 0.22, -- Pattern: Filigreed Flame Circlet (22/9863)
        [253984] = 0.24, -- Pattern: Filigreed Pearly Circlet (24/9863)
        [253976] = 0.24, -- Pattern: Filigreed Pristine Circlet (24/9863)
        [251350] = 0.17, -- Plans: Veteran's Chain Helm (17/9863)
        [251351] = 0.19, -- Plans: Guard's Chain Helm (19/9863)
        [251352] = 0.37, -- Plans: Protector's Chain Helm (36/9863)
        [251353] = 0.24, -- Plans: Acolyte's Chain Helm (24/9863)
        [251354] = 0.29, -- Plans: Crusader's Chain Helm (29/9863)
        [252814] = 0.15, -- Pattern: Brawler's Leather Helm (15/9863)
        [252815] = 0.24, -- Pattern: Trapper's Leather Helm (24/9863)
        [252816] = 0.22, -- Pattern: Defender's Leather Helm (22/9863)
        [252817] = 0.26, -- Pattern: Totemic Leather Helm (26/9863)
        [252818] = 0.28, -- Pattern: Stormrider's Leather Helm (28/9863)
        [252819] = 0.27, -- Pattern: Wisdom's Leather Helm (27/9863)
        [253978] = 0.23, -- Pattern: Filigreed Silky Circlet (23/9863)
    },
    ["Aku'mai"] = { -- NPC 4829, 4440 kills on Wowhead Forever
        [6911] = 29.6, -- Moss Cinch (1316/4440)
        [6910] = 29.5, -- Leech Pants (1309/4440)
        [6909] = 35.2, -- Strike of the Hydra (1562/4440)
        [253980] = 0.65, -- Pattern: Filigreed Flame Circlet (29/4440)
        [253984] = 0.68, -- Pattern: Filigreed Pearly Circlet (30/4440)
        [253982] = 0.45, -- Pattern: Filigreed Shadow Circlet (20/4440)
        [253986] = 0.38, -- Pattern: Filigreed Shining Circlet (17/4440)
        [251350] = 0.7, -- Plans: Veteran's Chain Helm (31/4440)
        [251351] = 0.52, -- Plans: Guard's Chain Helm (23/4440)
        [251352] = 0.59, -- Plans: Protector's Chain Helm (26/4440)
        [251353] = 0.54, -- Plans: Acolyte's Chain Helm (24/4440)
        [251354] = 0.41, -- Plans: Crusader's Chain Helm (18/4440)
        [252814] = 0.29, -- Pattern: Brawler's Leather Helm (13/4440)
        [252815] = 0.36, -- Pattern: Trapper's Leather Helm (16/4440)
        [252816] = 0.54, -- Pattern: Defender's Leather Helm (24/4440)
        [252817] = 0.52, -- Pattern: Totemic Leather Helm (23/4440)
        [252818] = 0.41, -- Pattern: Stormrider's Leather Helm (18/4440)
        [252819] = 0.47, -- Pattern: Wisdom's Leather Helm (21/4440)
        [253976] = 0.61, -- Pattern: Filigreed Pristine Circlet (27/4440)
        [253978] = 0.61, -- Pattern: Filigreed Silky Circlet (27/4440)
    },
}

FDJ.DROP_RATES["Excavation Site: Wetlands"] = {
    ["Saltspine"] = { -- NPC 260322, 3629 kills on Wowhead Forever
        [273024] = 31, -- Glinteye Slippers (1126/3629)
        [273022] = 33.9, -- Supple Bellyskin Leggings (1232/3629)
        [273023] = 29.3, -- Saltscale Girdle (1062/3629)
    },
    ["Shadetooth"] = { -- NPC 260325, 3375 kills on Wowhead Forever
        [273025] = 28.9, -- Raptorclaw Greaves (976/3375)
        [273026] = 30.9, -- Garb of Florid Feathers (1044/3375)
        [273027] = 29.2, -- Raptor's Gaze (984/3375)
        [273106] = 7.1, -- Blueprint: Greenhouse (241/3375)
    },
    ["Relic Guardian"] = { -- NPC 260326, 4613 kills on Wowhead Forever
        [273028] = 30.9, -- Reliquary Mantle (1426/4613)
        [273029] = 31.6, -- Golemsight Long Gun (1456/4613)
        [273030] = 29.3, -- Ring of Power Regulation (1353/4613)
        [273097] = 6.5, -- Blueprint: Rock Garden (302/4613)
    },
}

FDJ.DROP_RATES["The Stockade"] = {
    ["Targorr the Dread"] = { -- NPC 1696, 3502 kills on Wowhead Forever
        [273805] = 30.1, -- Blackrock Harness (1055/3502)
        [273804] = 27.6, -- Executioner Mantle (967/3502)
        [273806] = 30.4, -- Dark Horde Band (1064/3502)
        [253942] = 0.49, -- Pattern: Filigreed Flame Leggings (17/3502)
        [251345] = 0.66, -- Plans: Veteran's Chain Leggings (23/3502)
        [251346] = 0.46, -- Plans: Guard's Chain Leggings (16/3502)
        [251347] = 0.49, -- Plans: Protector's Chain Leggings (17/3502)
        [251348] = 0.49, -- Plans: Acolyte's Chain Leggings (17/3502)
        [251349] = 0.57, -- Plans: Crusader's Chain Leggings (20/3502)
        [252792] = 0.43, -- Pattern: Brawler's Leather Pants (15/3502)
        [252793] = 0.63, -- Pattern: Trapper's Leather Pants (22/3502)
        [252794] = 0.4, -- Pattern: Defender's Leather Pants (14/3502)
        [252795] = 0.69, -- Pattern: Totemic Leather Pants (24/3502)
        [252796] = 0.6, -- Pattern: Stormrider's Leather Pants (21/3502)
        [252797] = 0.51, -- Pattern: Wisdom's Leather Pants (18/3502)
        [253938] = 0.51, -- Pattern: Filigreed Pristine Leggings (18/3502)
        [253940] = 0.4, -- Pattern: Filigreed Silky Leggings (14/3502)
        [253944] = 0.46, -- Pattern: Filigreed Shadow Leggings (16/3502)
        [253946] = 0.54, -- Pattern: Filigreed Pearly Leggings (19/3502)
        [253948] = 0.54, -- Pattern: Filigreed Shining Leggings (19/3502)
    },
    ["Kam Deepfury"] = { -- NPC 1666, 2941 kills on Wowhead Forever
        [2280] = 32.5, -- Kam's Walking Stick (955/2941)
        [273807] = 30.4, -- Demolition Girdle (894/2941)
        [273808] = 27.6, -- Bridgebreaker Bindings (812/2941)
        [252815] = 0.61, -- Pattern: Trapper's Leather Helm (18/2941)
        [251350] = 0.41, -- Plans: Veteran's Chain Helm (12/2941)
        [251351] = 0.54, -- Plans: Guard's Chain Helm (16/2941)
        [251352] = 0.34, -- Plans: Protector's Chain Helm (10/2941)
        [251353] = 0.75, -- Plans: Acolyte's Chain Helm (22/2941)
        [251354] = 0.48, -- Plans: Crusader's Chain Helm (14/2941)
        [252814] = 0.31, -- Pattern: Brawler's Leather Helm (9/2941)
        [252816] = 0.48, -- Pattern: Defender's Leather Helm (14/2941)
        [252817] = 0.82, -- Pattern: Totemic Leather Helm (24/2941)
        [252818] = 0.31, -- Pattern: Stormrider's Leather Helm (9/2941)
        [252819] = 0.51, -- Pattern: Wisdom's Leather Helm (15/2941)
        [253976] = 0.82, -- Pattern: Filigreed Pristine Circlet (24/2941)
        [253978] = 0.68, -- Pattern: Filigreed Silky Circlet (20/2941)
        [253980] = 0.82, -- Pattern: Filigreed Flame Circlet (24/2941)
        [253982] = 0.75, -- Pattern: Filigreed Shadow Circlet (22/2941)
        [253984] = 0.24, -- Pattern: Filigreed Pearly Circlet (7/2941)
        [253986] = 0.48, -- Pattern: Filigreed Shining Circlet (14/2941)
    },
    ["Hamhock"] = { -- NPC 1717, 2076 kills on Wowhead Forever
        [273809] = 34.3, -- Hamhock's Cleaver (713/2076)
        [273810] = 26.7, -- Ogre Grips (554/2076)
        [273811] = 31.5, -- Repurposed Rack (654/2076)
        [251350] = 0.87, -- Plans: Veteran's Chain Helm (18/2076)
        [251351] = 0.53, -- Plans: Guard's Chain Helm (11/2076)
        [251352] = 0.63, -- Plans: Protector's Chain Helm (13/2076)
        [251353] = 0.48, -- Plans: Acolyte's Chain Helm (10/2076)
        [251354] = 0.63, -- Plans: Crusader's Chain Helm (13/2076)
        [252814] = 0.63, -- Pattern: Brawler's Leather Helm (13/2076)
        [252815] = 0.34, -- Pattern: Trapper's Leather Helm (7/2076)
        [252816] = 0.58, -- Pattern: Defender's Leather Helm (12/2076)
        [252817] = 0.72, -- Pattern: Totemic Leather Helm (15/2076)
        [252818] = 0.34, -- Pattern: Stormrider's Leather Helm (7/2076)
        [252819] = 0.24, -- Pattern: Wisdom's Leather Helm (5/2076)
        [253976] = 0.39, -- Pattern: Filigreed Pristine Circlet (8/2076)
        [253978] = 0.43, -- Pattern: Filigreed Silky Circlet (9/2076)
        [253980] = 0.58, -- Pattern: Filigreed Flame Circlet (12/2076)
        [253982] = 0.39, -- Pattern: Filigreed Shadow Circlet (8/2076)
        [253984] = 0.39, -- Pattern: Filigreed Pearly Circlet (8/2076)
        [253986] = 0.87, -- Pattern: Filigreed Shining Circlet (18/2076)
    },
    ["Dextren Ward"] = { -- NPC 1663, 3332 kills on Wowhead Forever
        [273817] = 30.9, -- Graverobber's Shovel (1031/3332)
        [273819] = 28, -- Boneslicer (932/3332)
        [273820] = 28.2, -- Nightskulker Ring (940/3332)
        [251350] = 0.54, -- Plans: Veteran's Chain Helm (18/3332)
        [251351] = 0.54, -- Plans: Guard's Chain Helm (18/3332)
        [251352] = 0.45, -- Plans: Protector's Chain Helm (15/3332)
        [251353] = 0.39, -- Plans: Acolyte's Chain Helm (13/3332)
        [251354] = 0.33, -- Plans: Crusader's Chain Helm (11/3332)
        [252814] = 0.51, -- Pattern: Brawler's Leather Helm (17/3332)
        [252815] = 0.54, -- Pattern: Trapper's Leather Helm (18/3332)
        [252816] = 0.81, -- Pattern: Defender's Leather Helm (27/3332)
        [252817] = 0.36, -- Pattern: Totemic Leather Helm (12/3332)
        [252818] = 0.51, -- Pattern: Stormrider's Leather Helm (17/3332)
        [252819] = 0.48, -- Pattern: Wisdom's Leather Helm (16/3332)
        [253976] = 0.51, -- Pattern: Filigreed Pristine Circlet (17/3332)
        [253978] = 0.84, -- Pattern: Filigreed Silky Circlet (28/3332)
        [253980] = 0.45, -- Pattern: Filigreed Flame Circlet (15/3332)
        [253982] = 0.51, -- Pattern: Filigreed Shadow Circlet (17/3332)
        [253984] = 0.36, -- Pattern: Filigreed Pearly Circlet (12/3332)
        [253986] = 0.45, -- Pattern: Filigreed Shining Circlet (15/3332)
    },
    ["Bazil Thredd"] = { -- NPC 1716, 3139 kills on Wowhead Forever
        [273827] = 24.1, -- Debt Collector (757/3139)
        [273824] = 20.1, -- Defias Jailbreakers (630/3139)
        [273825] = 21.1, -- Red Wool Cloak (663/3139)
        [273829] = 18, -- Concealed Hand Crossbow (564/3139)
        [253976] = 0.32, -- Pattern: Filigreed Pristine Circlet (10/3139)
        [253986] = 0.41, -- Pattern: Filigreed Shining Circlet (13/3139)
        [251350] = 0.25, -- Plans: Veteran's Chain Helm (8/3139)
        [251351] = 0.35, -- Plans: Guard's Chain Helm (11/3139)
        [251352] = 0.35, -- Plans: Protector's Chain Helm (11/3139)
        [251353] = 0.7, -- Plans: Acolyte's Chain Helm (22/3139)
        [251354] = 0.41, -- Plans: Crusader's Chain Helm (13/3139)
        [252814] = 0.61, -- Pattern: Brawler's Leather Helm (19/3139)
        [252815] = 0.48, -- Pattern: Trapper's Leather Helm (15/3139)
        [252816] = 0.57, -- Pattern: Defender's Leather Helm (18/3139)
        [252817] = 0.51, -- Pattern: Totemic Leather Helm (16/3139)
        [252818] = 0.57, -- Pattern: Stormrider's Leather Helm (18/3139)
        [252819] = 0.41, -- Pattern: Wisdom's Leather Helm (13/3139)
        [253978] = 0.38, -- Pattern: Filigreed Silky Circlet (12/3139)
        [253980] = 0.61, -- Pattern: Filigreed Flame Circlet (19/3139)
        [253982] = 0.51, -- Pattern: Filigreed Shadow Circlet (16/3139)
        [253984] = 0.76, -- Pattern: Filigreed Pearly Circlet (24/3139)
    },
    ["Bruegal Ironknuckle"] = { -- NPC 1720, 236 kills on Wowhead Forever
        [3228] = 29.2, -- Jimmied Handcuffs (69/236)
        [2941] = 30.5, -- Prison Shank (72/236)
        [2942] = 35.6, -- Iron Knuckles (84/236)
        [251350] = 0.42, -- Plans: Veteran's Chain Helm (1/236)
        [251351] = 0.42, -- Plans: Guard's Chain Helm (1/236)
        [251352] = 0.42, -- Plans: Protector's Chain Helm (1/236)
        [251354] = 0.42, -- Plans: Crusader's Chain Helm (1/236)
        [252814] = 0.85, -- Pattern: Brawler's Leather Helm (2/236)
        [252816] = 0.85, -- Pattern: Defender's Leather Helm (2/236)
        [252817] = 1.3, -- Pattern: Totemic Leather Helm (3/236)
        [252818] = 0.42, -- Pattern: Stormrider's Leather Helm (1/236)
        [252819] = 0.85, -- Pattern: Wisdom's Leather Helm (2/236)
        [253978] = 0.85, -- Pattern: Filigreed Silky Circlet (2/236)
        [253980] = 0.42, -- Pattern: Filigreed Flame Circlet (1/236)
        [253986] = 0.85, -- Pattern: Filigreed Shining Circlet (2/236)
    },
}

FDJ.DROP_RATES["City of Dalaran"] = {
    ["Atrexis the Grave Knight"] = { -- NPC 247126, 3591 kills on Wowhead Forever
        [273032] = 35, -- Bonebinder's Signet (1258/3591)
        [273036] = 35.3, -- Graveweave Bindings (1268/3591)
        [273033] = 29.7, -- Gravespike Repeater (1065/3591)
    },
    ["Arcane Anomaly"] = { -- NPC 245999, 4391 kills on Wowhead Forever
        [273034] = 33.3, -- Ephemeral Grips (1463/4391)
        [273031] = 33.2, -- Runemender's Seal (1458/4391)
        [273035] = 33.5, -- Mana-Warped Chain Shirt (1470/4391)
    },
    ["Fel Ancient"] = { -- NPC 246003, 4458 kills on Wowhead Forever
        [273037] = 34.7, -- Felbough Arm (1549/4458)
        [273039] = 30.9, -- Blightleaf Rope (1379/4458)
        [273038] = 34.3, -- Garb of Fallen Felbark (1528/4458)
    },
    ["Unstable Sentinel"] = { -- NPC 246017, 4167 kills on Wowhead Forever
        [273046] = 34.8, -- Guardian's Dualblade (1452/4167)
        [273047] = 33, -- Unstable Crystalline Shoulderpads (1374/4167)
        [273048] = 30.7, -- Refractory Scaleguards (1280/4167)
        [273099] = 6.8, -- Blueprint: Spinning Wheel (285/4167)
    },
    ["Mana Devourer"] = { -- NPC 246008, 4352 kills on Wowhead Forever
        [273041] = 32.5, -- Slitherwrap Girdle (1415/4352)
        [273040] = 33.8, -- Spine of the Devourer (1473/4352)
        [273042] = 33.6, -- Manascale Treads (1464/4352)
    },
    ["Arcanic Enigma"] = { -- NPC 246016, 3761 kills on Wowhead Forever
        [273045] = 35.6, -- Drape of Shifting Energy (1338/3761)
        [273044] = 33.8, -- Violet Sorcerer's Robes (1272/3761)
        [273043] = 30.6, -- Wand of Mana Concentration (1151/3761)
    },
    ["Lyn the Ignored"] = { -- NPC 247032, 2175 kills on Wowhead Forever
        [273055] = 30.6, -- Bonepile Gaze (666/2175)
        [273054] = 32.4, -- Cartilage Shapers (704/2175)
        [273053] = 37, -- Tendonscraper Dagger (805/2175)
    },
    ["Shade of the Archmage"] = { -- NPC 246020, 4730 kills on Wowhead Forever
        [273052] = 31.5, -- Ponderous Orb (1491/4730)
        [273049] = 34.3, -- Archmagister's Faceted Pendant (1624/4730)
        [273051] = 30, -- Violet Sorcerer's Mantle (1419/4730)
        [273103] = 7, -- Blueprint: Arcane Salvager (331/4730)
    },
}

FDJ.DROP_RATES["Gnomeregan"] = {
    ["Grubbis"] = { -- NPC 7361, 2501 kills on Wowhead Forever
        [9445] = 31.8, -- Grubbis Paws (795/2501)
        [274043] = 34, -- Irradiated Shield (851/2501)
        [274042] = 33, -- Skullduggery Belt (825/2501)
        [251350] = 0.52, -- Plans: Veteran's Chain Helm (13/2501)
        [251351] = 0.68, -- Plans: Guard's Chain Helm (17/2501)
        [251352] = 0.6, -- Plans: Protector's Chain Helm (15/2501)
        [251353] = 0.68, -- Plans: Acolyte's Chain Helm (17/2501)
        [251354] = 0.68, -- Plans: Crusader's Chain Helm (17/2501)
        [252814] = 0.52, -- Pattern: Brawler's Leather Helm (13/2501)
        [252815] = 0.4, -- Pattern: Trapper's Leather Helm (10/2501)
        [252816] = 0.36, -- Pattern: Defender's Leather Helm (9/2501)
        [252817] = 0.64, -- Pattern: Totemic Leather Helm (16/2501)
        [252818] = 0.44, -- Pattern: Stormrider's Leather Helm (11/2501)
        [252819] = 0.52, -- Pattern: Wisdom's Leather Helm (13/2501)
        [253976] = 0.56, -- Pattern: Filigreed Pristine Circlet (14/2501)
        [253978] = 0.44, -- Pattern: Filigreed Silky Circlet (11/2501)
        [253980] = 0.72, -- Pattern: Filigreed Flame Circlet (18/2501)
        [253982] = 0.56, -- Pattern: Filigreed Shadow Circlet (14/2501)
        [253984] = 0.28, -- Pattern: Filigreed Pearly Circlet (7/2501)
        [253986] = 0.56, -- Pattern: Filigreed Shining Circlet (14/2501)
    },
    ["Viscous Fallout"] = { -- NPC 7079, 2318 kills on Wowhead Forever
        [9452] = 32.3, -- Hydrocane (748/2318)
        [9453] = 33.7, -- Toxic Revenger (782/2318)
        [9454] = 31.4, -- Acidic Walkers (727/2318)
        [7091] = 1.1, -- Pattern: Truefaith Gloves (25/2318)
        [251350] = 0.43, -- Plans: Veteran's Chain Helm (10/2318)
        [251351] = 1, -- Plans: Guard's Chain Helm (24/2318)
        [251352] = 0.47, -- Plans: Protector's Chain Helm (11/2318)
        [251353] = 0.3, -- Plans: Acolyte's Chain Helm (7/2318)
        [251354] = 0.52, -- Plans: Crusader's Chain Helm (12/2318)
        [252814] = 0.65, -- Pattern: Brawler's Leather Helm (15/2318)
        [252815] = 0.69, -- Pattern: Trapper's Leather Helm (16/2318)
        [252816] = 0.35, -- Pattern: Defender's Leather Helm (8/2318)
        [252817] = 0.26, -- Pattern: Totemic Leather Helm (6/2318)
        [252818] = 0.56, -- Pattern: Stormrider's Leather Helm (13/2318)
        [252819] = 0.65, -- Pattern: Wisdom's Leather Helm (15/2318)
        [253976] = 0.69, -- Pattern: Filigreed Pristine Circlet (16/2318)
        [253978] = 0.39, -- Pattern: Filigreed Silky Circlet (9/2318)
        [253980] = 0.3, -- Pattern: Filigreed Flame Circlet (7/2318)
        [253982] = 0.47, -- Pattern: Filigreed Shadow Circlet (11/2318)
        [253984] = 0.56, -- Pattern: Filigreed Pearly Circlet (13/2318)
        [253986] = 0.22, -- Pattern: Filigreed Shining Circlet (5/2318)
    },
    ["Electrocutioner 6000"] = { -- NPC 6235, 2819 kills on Wowhead Forever
        [9446] = 31.5, -- Electrocutioner Leg (887/2819)
        [9447] = 30.2, -- Electrocutioner Lagnut (852/2819)
        [9448] = 29.9, -- Spidertank Oilrag (842/2819)
        [251350] = 0.43, -- Plans: Veteran's Chain Helm (12/2819)
        [251351] = 0.32, -- Plans: Guard's Chain Helm (9/2819)
        [251352] = 0.57, -- Plans: Protector's Chain Helm (16/2819)
        [251353] = 0.5, -- Plans: Acolyte's Chain Helm (14/2819)
        [251354] = 0.18, -- Plans: Crusader's Chain Helm (5/2819)
        [252814] = 0.67, -- Pattern: Brawler's Leather Helm (19/2819)
        [252815] = 0.35, -- Pattern: Trapper's Leather Helm (10/2819)
        [252816] = 0.35, -- Pattern: Defender's Leather Helm (10/2819)
        [252817] = 0.46, -- Pattern: Totemic Leather Helm (13/2819)
        [252818] = 0.43, -- Pattern: Stormrider's Leather Helm (12/2819)
        [252819] = 0.82, -- Pattern: Wisdom's Leather Helm (23/2819)
        [253976] = 0.74, -- Pattern: Filigreed Pristine Circlet (21/2819)
        [253978] = 0.39, -- Pattern: Filigreed Silky Circlet (11/2819)
        [253980] = 0.57, -- Pattern: Filigreed Flame Circlet (16/2819)
        [253982] = 0.67, -- Pattern: Filigreed Shadow Circlet (19/2819)
        [253984] = 0.57, -- Pattern: Filigreed Pearly Circlet (16/2819)
        [253986] = 0.46, -- Pattern: Filigreed Shining Circlet (13/2819)
    },
    ["Crowd Pummeler 9-60"] = { -- NPC 6229, 2230 kills on Wowhead Forever
        [9449] = 32.4, -- Manual Crowd Pummeler (723/2230)
        [9450] = 31.6, -- Gnomebot Operating Boots (705/2230)
        [274068] = 32.7, -- Thermaplugg Medal of Honor (729/2230)
        [274049] = 24.5, -- Schematic: 9-60 Battery Pack (546/2230)
        [251350] = 0.54, -- Plans: Veteran's Chain Helm (12/2230)
        [251351] = 0.76, -- Plans: Guard's Chain Helm (17/2230)
        [251352] = 0.27, -- Plans: Protector's Chain Helm (6/2230)
        [251353] = 0.36, -- Plans: Acolyte's Chain Helm (8/2230)
        [251354] = 0.54, -- Plans: Crusader's Chain Helm (12/2230)
        [252814] = 0.58, -- Pattern: Brawler's Leather Helm (13/2230)
        [252815] = 0.63, -- Pattern: Trapper's Leather Helm (14/2230)
        [252816] = 0.54, -- Pattern: Defender's Leather Helm (12/2230)
        [252817] = 0.54, -- Pattern: Totemic Leather Helm (12/2230)
        [252818] = 0.36, -- Pattern: Stormrider's Leather Helm (8/2230)
        [252819] = 0.81, -- Pattern: Wisdom's Leather Helm (18/2230)
        [253976] = 0.58, -- Pattern: Filigreed Pristine Circlet (13/2230)
        [253978] = 0.67, -- Pattern: Filigreed Silky Circlet (15/2230)
        [253980] = 0.36, -- Pattern: Filigreed Flame Circlet (8/2230)
        [253982] = 0.63, -- Pattern: Filigreed Shadow Circlet (14/2230)
        [253984] = 0.81, -- Pattern: Filigreed Pearly Circlet (18/2230)
        [253986] = 0.72, -- Pattern: Filigreed Shining Circlet (16/2230)
    },
    ["Mekgineer Thermaplugg"] = { -- NPC 7800, 2762 kills on Wowhead Forever
        [9458] = 23.5, -- Thermaplugg's Central Core (649/2762)
        [9459] = 23.6, -- Thermaplugg's Left Arm (653/2762)
        [9461] = 24.6, -- Charged Gear (679/2762)
        [9492] = 21.9, -- Electromagnetic Gigaflux Reactivator (605/2762)
        [4408] = 0.58, -- Schematic: Mechanical Squirrel (16/2762)
        [4409] = 0.33, -- Schematic: Small Seaforium Charge (9/2762)
        [4410] = 0.69, -- Schematic: Shadow Goggles (19/2762)
        [4411] = 0.47, -- Schematic: Flame Deflector (13/2762)
        [4412] = 0.65, -- Schematic: Moonsight Rifle (18/2762)
        [4413] = 0.8, -- Schematic: Discombobulator Ray (22/2762)
        [4414] = 0.47, -- Schematic: Portable Bronze Mortar (13/2762)
        [4415] = 0.76, -- Schematic: Craftsman's Monocle (21/2762)
        [4416] = 0.29, -- Schematic: Goblin Land Mine (8/2762)
        [4417] = 0.72, -- Schematic: Large Seaforium Charge (20/2762)
        [6672] = 0.43, -- Schematic: Flash Bomb (12/2762)
        [6716] = 0.83, -- Schematic: EZ-Thro Dynamite (23/2762)
        [7192] = 0.47, -- Schematic: Goblin Rocket Boots (13/2762)
        [7560] = 0.11, -- Schematic: Gnomish Universal Remote (3/2762)
        [251350] = 0.47, -- Plans: Veteran's Chain Helm (13/2762)
        [251351] = 0.43, -- Plans: Guard's Chain Helm (12/2762)
        [251352] = 0.14, -- Plans: Protector's Chain Helm (4/2762)
        [251353] = 0.65, -- Plans: Acolyte's Chain Helm (18/2762)
        [251354] = 0.54, -- Plans: Crusader's Chain Helm (15/2762)
        [252814] = 0.51, -- Pattern: Brawler's Leather Helm (14/2762)
        [252815] = 0.4, -- Pattern: Trapper's Leather Helm (11/2762)
        [252816] = 0.54, -- Pattern: Defender's Leather Helm (15/2762)
        [252817] = 0.4, -- Pattern: Totemic Leather Helm (11/2762)
        [252818] = 0.33, -- Pattern: Stormrider's Leather Helm (9/2762)
        [252819] = 0.29, -- Pattern: Wisdom's Leather Helm (8/2762)
        [253976] = 0.58, -- Pattern: Filigreed Pristine Circlet (16/2762)
        [253978] = 0.33, -- Pattern: Filigreed Silky Circlet (9/2762)
        [253980] = 0.4, -- Pattern: Filigreed Flame Circlet (11/2762)
        [253982] = 0.47, -- Pattern: Filigreed Shadow Circlet (13/2762)
        [253984] = 0.62, -- Pattern: Filigreed Pearly Circlet (17/2762)
        [253986] = 0.69, -- Pattern: Filigreed Shining Circlet (19/2762)
    },
    ["Dark Iron Ambassador"] = { -- NPC 6228, 236 kills on Wowhead Forever
        [9455] = 36.4, -- Emissary Cuffs (86/236)
        [9456] = 33.5, -- Glass Shooter (79/236)
        [9457] = 25.4, -- Royal Diplomatic Scepter (60/236)
        [251350] = 0.42, -- Plans: Veteran's Chain Helm (1/236)
        [251351] = 0.42, -- Plans: Guard's Chain Helm (1/236)
        [251352] = 0.42, -- Plans: Protector's Chain Helm (1/236)
        [251353] = 0.42, -- Plans: Acolyte's Chain Helm (1/236)
        [252814] = 1.3, -- Pattern: Brawler's Leather Helm (3/236)
        [252816] = 1.3, -- Pattern: Defender's Leather Helm (3/236)
        [253976] = 0.42, -- Pattern: Filigreed Pristine Circlet (1/236)
        [253978] = 0.85, -- Pattern: Filigreed Silky Circlet (2/236)
        [253980] = 0.42, -- Pattern: Filigreed Flame Circlet (1/236)
        [253984] = 0.42, -- Pattern: Filigreed Pearly Circlet (1/236)
    },
}

FDJ.DROP_RATES["Razorfen Kraul"] = {
    ["Roogug"] = { -- NPC 6168, 1918 kills on Wowhead Forever
        [274155] = 31.3, -- Geomancer Headdress (601/1918)
        [274149] = 27.7, -- Thornweaver Drape (532/1918)
        [274152] = 36, -- Roogug's Severed Head (690/1918)
        [251350] = 0.52, -- Plans: Veteran's Chain Helm (10/1918)
        [251351] = 0.57, -- Plans: Guard's Chain Helm (11/1918)
        [251352] = 0.47, -- Plans: Protector's Chain Helm (9/1918)
        [251353] = 0.16, -- Plans: Acolyte's Chain Helm (3/1918)
        [251354] = 0.31, -- Plans: Crusader's Chain Helm (6/1918)
        [252814] = 0.57, -- Pattern: Brawler's Leather Helm (11/1918)
        [252815] = 0.47, -- Pattern: Trapper's Leather Helm (9/1918)
        [252816] = 0.57, -- Pattern: Defender's Leather Helm (11/1918)
        [252817] = 0.57, -- Pattern: Totemic Leather Helm (11/1918)
        [252818] = 0.73, -- Pattern: Stormrider's Leather Helm (14/1918)
        [252819] = 0.63, -- Pattern: Wisdom's Leather Helm (12/1918)
        [253976] = 0.47, -- Pattern: Filigreed Pristine Circlet (9/1918)
        [253978] = 0.73, -- Pattern: Filigreed Silky Circlet (14/1918)
        [253980] = 0.57, -- Pattern: Filigreed Flame Circlet (11/1918)
        [253982] = 0.31, -- Pattern: Filigreed Shadow Circlet (6/1918)
        [253984] = 0.63, -- Pattern: Filigreed Pearly Circlet (12/1918)
        [253986] = 0.42, -- Pattern: Filigreed Shining Circlet (8/1918)
    },
    ["Aggem Thorncurse"] = { -- NPC 4424, 2779 kills on Wowhead Forever
        [6681] = 32.9, -- Thornspike (915/2779)
        [274158] = 32, -- Death Prophet Spine (890/2779)
        [274159] = 33.8, -- Thorncursed Grips (938/2779)
        [251350] = 0.76, -- Plans: Veteran's Chain Helm (21/2779)
        [251351] = 0.43, -- Plans: Guard's Chain Helm (12/2779)
        [251352] = 0.72, -- Plans: Protector's Chain Helm (20/2779)
        [251353] = 0.54, -- Plans: Acolyte's Chain Helm (15/2779)
        [251354] = 0.68, -- Plans: Crusader's Chain Helm (19/2779)
        [252814] = 0.61, -- Pattern: Brawler's Leather Helm (17/2779)
        [252815] = 0.43, -- Pattern: Trapper's Leather Helm (12/2779)
        [252816] = 0.47, -- Pattern: Defender's Leather Helm (13/2779)
        [252817] = 0.32, -- Pattern: Totemic Leather Helm (9/2779)
        [252818] = 0.61, -- Pattern: Stormrider's Leather Helm (17/2779)
        [252819] = 0.65, -- Pattern: Wisdom's Leather Helm (18/2779)
        [253976] = 0.47, -- Pattern: Filigreed Pristine Circlet (13/2779)
        [253978] = 0.58, -- Pattern: Filigreed Silky Circlet (16/2779)
        [253980] = 0.4, -- Pattern: Filigreed Flame Circlet (11/2779)
        [253982] = 0.5, -- Pattern: Filigreed Shadow Circlet (14/2779)
        [253984] = 0.43, -- Pattern: Filigreed Pearly Circlet (12/2779)
        [253986] = 0.25, -- Pattern: Filigreed Shining Circlet (7/2779)
    },
    ["Death Speaker Jargba"] = { -- NPC 4428, 2462 kills on Wowhead Forever
        [2816] = 34, -- Death Speaker Scepter (837/2462)
        [6685] = 30.6, -- Death Speaker Mantle (754/2462)
        [6682] = 33.3, -- Death Speaker Robes (820/2462)
        [251350] = 0.65, -- Plans: Veteran's Chain Helm (16/2462)
        [251351] = 0.57, -- Plans: Guard's Chain Helm (14/2462)
        [251352] = 0.65, -- Plans: Protector's Chain Helm (16/2462)
        [251353] = 0.49, -- Plans: Acolyte's Chain Helm (12/2462)
        [251354] = 0.45, -- Plans: Crusader's Chain Helm (11/2462)
        [252814] = 0.41, -- Pattern: Brawler's Leather Helm (10/2462)
        [252815] = 0.41, -- Pattern: Trapper's Leather Helm (10/2462)
        [252816] = 0.45, -- Pattern: Defender's Leather Helm (11/2462)
        [252817] = 0.41, -- Pattern: Totemic Leather Helm (10/2462)
        [252818] = 0.61, -- Pattern: Stormrider's Leather Helm (15/2462)
        [252819] = 0.32, -- Pattern: Wisdom's Leather Helm (8/2462)
        [253976] = 0.32, -- Pattern: Filigreed Pristine Circlet (8/2462)
        [253978] = 0.61, -- Pattern: Filigreed Silky Circlet (15/2462)
        [253980] = 0.45, -- Pattern: Filigreed Flame Circlet (11/2462)
        [253982] = 0.57, -- Pattern: Filigreed Shadow Circlet (14/2462)
        [253984] = 0.57, -- Pattern: Filigreed Pearly Circlet (14/2462)
        [253986] = 0.57, -- Pattern: Filigreed Shining Circlet (14/2462)
    },
    ["Overlord Ramtusk"] = { -- NPC 4420, 2605 kills on Wowhead Forever
        [6687] = 33.6, -- Corpsemaker (876/2605)
        [6686] = 29.6, -- Tusken Helm (771/2605)
        [274161] = 33.6, -- Quillord Mail Leggings (874/2605)
        [251350] = 0.54, -- Plans: Veteran's Chain Helm (14/2605)
        [251351] = 0.61, -- Plans: Guard's Chain Helm (16/2605)
        [251352] = 0.42, -- Plans: Protector's Chain Helm (11/2605)
        [251353] = 0.65, -- Plans: Acolyte's Chain Helm (17/2605)
        [251354] = 0.42, -- Plans: Crusader's Chain Helm (11/2605)
        [252814] = 0.5, -- Pattern: Brawler's Leather Helm (13/2605)
        [252815] = 0.5, -- Pattern: Trapper's Leather Helm (13/2605)
        [252816] = 0.54, -- Pattern: Defender's Leather Helm (14/2605)
        [252817] = 0.58, -- Pattern: Totemic Leather Helm (15/2605)
        [252818] = 0.42, -- Pattern: Stormrider's Leather Helm (11/2605)
        [252819] = 0.96, -- Pattern: Wisdom's Leather Helm (25/2605)
        [253976] = 0.35, -- Pattern: Filigreed Pristine Circlet (9/2605)
        [253978] = 0.46, -- Pattern: Filigreed Silky Circlet (12/2605)
        [253980] = 0.42, -- Pattern: Filigreed Flame Circlet (11/2605)
        [253982] = 0.54, -- Pattern: Filigreed Shadow Circlet (14/2605)
        [253984] = 0.61, -- Pattern: Filigreed Pearly Circlet (16/2605)
        [253986] = 0.42, -- Pattern: Filigreed Shining Circlet (11/2605)
    },
    ["Agathelos the Raging"] = { -- NPC 4422, 3178 kills on Wowhead Forever
        [6691] = 35.8, -- Swinetusk Shank (1138/3178)
        [6690] = 30.4, -- Ferine Leggings (967/3178)
        [274160] = 30.9, -- Quilrager Throwing Axe (982/3178)
        [251350] = 0.47, -- Plans: Veteran's Chain Helm (15/3178)
        [251351] = 0.38, -- Plans: Guard's Chain Helm (12/3178)
        [251352] = 0.6, -- Plans: Protector's Chain Helm (19/3178)
        [251353] = 0.35, -- Plans: Acolyte's Chain Helm (11/3178)
        [251354] = 0.35, -- Plans: Crusader's Chain Helm (11/3178)
        [252814] = 0.44, -- Pattern: Brawler's Leather Helm (14/3178)
        [252815] = 0.72, -- Pattern: Trapper's Leather Helm (23/3178)
        [252816] = 0.25, -- Pattern: Defender's Leather Helm (8/3178)
        [252817] = 0.72, -- Pattern: Totemic Leather Helm (23/3178)
        [252818] = 0.5, -- Pattern: Stormrider's Leather Helm (16/3178)
        [252819] = 0.41, -- Pattern: Wisdom's Leather Helm (13/3178)
        [253976] = 0.35, -- Pattern: Filigreed Pristine Circlet (11/3178)
        [253978] = 0.47, -- Pattern: Filigreed Silky Circlet (15/3178)
        [253980] = 0.6, -- Pattern: Filigreed Flame Circlet (19/3178)
        [253982] = 0.53, -- Pattern: Filigreed Shadow Circlet (17/3178)
        [253984] = 0.38, -- Pattern: Filigreed Pearly Circlet (12/3178)
        [253986] = 0.6, -- Pattern: Filigreed Shining Circlet (19/3178)
    },
    ["Charlga Razorflank"] = { -- NPC 4421, 3173 kills on Wowhead Forever
        [6693] = 30.8, -- Agamaggan's Clutch (978/3173)
        [6694] = 29.4, -- Heart of Agamaggan (932/3173)
        [6692] = 31.6, -- Pronged Reaver (1004/3173)
        [273103] = 6.1, -- Blueprint: Arcane Salvager (192/3173)
        [251350] = 0.72, -- Plans: Veteran's Chain Helm (23/3173)
        [251351] = 0.57, -- Plans: Guard's Chain Helm (18/3173)
        [251352] = 0.5, -- Plans: Protector's Chain Helm (16/3173)
        [251353] = 0.66, -- Plans: Acolyte's Chain Helm (21/3173)
        [251354] = 0.5, -- Plans: Crusader's Chain Helm (16/3173)
        [252814] = 0.6, -- Pattern: Brawler's Leather Helm (19/3173)
        [252815] = 0.5, -- Pattern: Trapper's Leather Helm (16/3173)
        [252816] = 0.57, -- Pattern: Defender's Leather Helm (18/3173)
        [252817] = 0.69, -- Pattern: Totemic Leather Helm (22/3173)
        [252818] = 0.6, -- Pattern: Stormrider's Leather Helm (19/3173)
        [252819] = 0.5, -- Pattern: Wisdom's Leather Helm (16/3173)
        [253976] = 0.22, -- Pattern: Filigreed Pristine Circlet (7/3173)
        [253978] = 0.47, -- Pattern: Filigreed Silky Circlet (15/3173)
        [253980] = 0.88, -- Pattern: Filigreed Flame Circlet (28/3173)
        [253982] = 0.47, -- Pattern: Filigreed Shadow Circlet (15/3173)
        [253984] = 0.35, -- Pattern: Filigreed Pearly Circlet (11/3173)
        [253986] = 0.25, -- Pattern: Filigreed Shining Circlet (8/3173)
    },
    ["Blind Hunter"] = { -- NPC 4425, 477 kills on Wowhead Forever
        [6695] = 32.9, -- Stygian Bone Amulet (157/477)
        [6697] = 32.1, -- Batwing Mantle (153/477)
        [6696] = 27.7, -- Nightstalker Bow (132/477)
        [251351] = 0.63, -- Plans: Guard's Chain Helm (3/477)
        [251352] = 0.63, -- Plans: Protector's Chain Helm (3/477)
        [251353] = 0.84, -- Plans: Acolyte's Chain Helm (4/477)
        [252814] = 0.42, -- Pattern: Brawler's Leather Helm (2/477)
        [252815] = 0.42, -- Pattern: Trapper's Leather Helm (2/477)
        [252816] = 1.5, -- Pattern: Defender's Leather Helm (7/477)
        [252817] = 0.42, -- Pattern: Totemic Leather Helm (2/477)
        [252818] = 0.21, -- Pattern: Stormrider's Leather Helm (1/477)
        [252819] = 0.84, -- Pattern: Wisdom's Leather Helm (4/477)
        [253976] = 0.42, -- Pattern: Filigreed Pristine Circlet (2/477)
        [253978] = 0.63, -- Pattern: Filigreed Silky Circlet (3/477)
        [253980] = 0.63, -- Pattern: Filigreed Flame Circlet (3/477)
        [253982] = 0.84, -- Pattern: Filigreed Shadow Circlet (4/477)
        [253984] = 1, -- Pattern: Filigreed Pearly Circlet (5/477)
    },
    ["Earthcaller Halmgar"] = { -- NPC 4842, 380 kills on Wowhead Forever
        [6689] = 43.9, -- Wind Spirit Staff (167/380)
        [6688] = 51.3, -- Whisperwind Headdress (195/380)
        [251351] = 0.53, -- Plans: Guard's Chain Helm (2/380)
        [251352] = 0.53, -- Plans: Protector's Chain Helm (2/380)
        [251353] = 0.26, -- Plans: Acolyte's Chain Helm (1/380)
        [252815] = 0.79, -- Pattern: Trapper's Leather Helm (3/380)
        [252818] = 0.53, -- Pattern: Stormrider's Leather Helm (2/380)
        [252819] = 0.26, -- Pattern: Wisdom's Leather Helm (1/380)
        [253976] = 0.79, -- Pattern: Filigreed Pristine Circlet (3/380)
        [253980] = 0.79, -- Pattern: Filigreed Flame Circlet (3/380)
        [253984] = 1.1, -- Pattern: Filigreed Pearly Circlet (4/380)
    },
}

FDJ.DROP_RATES["Scarlet Monastery: Graveyard"] = {
    ["Interrogator Vishas"] = { -- NPC 3983, 2185 kills on Wowhead Forever
        [7682] = 32.1, -- Torturing Poker (702/2184)
        [7683] = 30.1, -- Bloody Brass Knuckles (658/2184)
        [274290] = 32.2, -- Painwalker Buckler (704/2184)
        [251350] = 0.32, -- Plans: Veteran's Chain Helm (7/2184)
        [251351] = 0.46, -- Plans: Guard's Chain Helm (10/2184)
        [251352] = 0.18, -- Plans: Protector's Chain Helm (4/2184)
        [251353] = 0.32, -- Plans: Acolyte's Chain Helm (7/2184)
        [251354] = 0.73, -- Plans: Crusader's Chain Helm (16/2184)
        [252814] = 0.46, -- Pattern: Brawler's Leather Helm (10/2184)
        [252815] = 0.82, -- Pattern: Trapper's Leather Helm (18/2184)
        [252816] = 0.46, -- Pattern: Defender's Leather Helm (10/2184)
        [252817] = 0.69, -- Pattern: Totemic Leather Helm (15/2184)
        [252818] = 0.55, -- Pattern: Stormrider's Leather Helm (12/2184)
        [252819] = 0.78, -- Pattern: Wisdom's Leather Helm (17/2184)
        [253976] = 0.32, -- Pattern: Filigreed Pristine Circlet (7/2184)
        [253978] = 0.27, -- Pattern: Filigreed Silky Circlet (6/2184)
        [253980] = 0.6, -- Pattern: Filigreed Flame Circlet (13/2184)
        [253982] = 0.78, -- Pattern: Filigreed Shadow Circlet (17/2184)
        [253984] = 0.37, -- Pattern: Filigreed Pearly Circlet (8/2184)
        [253986] = 0.78, -- Pattern: Filigreed Shining Circlet (17/2184)
    },
    ["Azshir the Sleepless"] = { -- NPC 6490, 212 kills on Wowhead Forever
        [7709] = 28.4, -- Blighted Leggings (60/211)
        [7708] = 30.8, -- Necrotic Wand (65/211)
        [7731] = 34.1, -- Ghostshard Talisman (72/211)
        [251350] = 0.95, -- Plans: Veteran's Chain Helm (2/211)
        [251351] = 0.47, -- Plans: Guard's Chain Helm (1/211)
        [251352] = 1.4, -- Plans: Protector's Chain Helm (3/211)
        [251353] = 0.47, -- Plans: Acolyte's Chain Helm (1/211)
        [251354] = 0.95, -- Plans: Crusader's Chain Helm (2/211)
        [252814] = 0.47, -- Pattern: Brawler's Leather Helm (1/211)
        [252815] = 0.47, -- Pattern: Trapper's Leather Helm (1/211)
        [252816] = 0.47, -- Pattern: Defender's Leather Helm (1/211)
        [252817] = 0.95, -- Pattern: Totemic Leather Helm (2/211)
        [252819] = 0.95, -- Pattern: Wisdom's Leather Helm (2/211)
        [253980] = 0.47, -- Pattern: Filigreed Flame Circlet (1/211)
        [253982] = 0.95, -- Pattern: Filigreed Shadow Circlet (2/211)
        [253984] = 0.95, -- Pattern: Filigreed Pearly Circlet (2/211)
        [253986] = 0.95, -- Pattern: Filigreed Shining Circlet (2/211)
    },
    ["Fallen Champion"] = { -- NPC 6488, 222 kills on Wowhead Forever
        [7691] = 27.9, -- Embalmed Shroud (62/222)
        [7690] = 34.2, -- Ebon Vise (76/222)
        [7689] = 33.8, -- Morbid Dawn (75/222)
        [251350] = 0.9, -- Plans: Veteran's Chain Helm (2/222)
        [251352] = 1.8, -- Plans: Protector's Chain Helm (4/222)
        [251353] = 1.8, -- Plans: Acolyte's Chain Helm (4/222)
        [252818] = 1.4, -- Pattern: Stormrider's Leather Helm (3/222)
        [252819] = 1.8, -- Pattern: Wisdom's Leather Helm (4/222)
        [253976] = 0.9, -- Pattern: Filigreed Pristine Circlet (2/222)
        [253982] = 0.45, -- Pattern: Filigreed Shadow Circlet (1/222)
        [253986] = 2.3, -- Pattern: Filigreed Shining Circlet (5/222)
    },
    ["Ironspine"] = { -- NPC 6489, 247 kills on Wowhead Forever
        [7688] = 36.6, -- Ironspine's Ribcage (90/246)
        [7687] = 29.7, -- Ironspine's Fist (73/246)
        [7686] = 31.3, -- Ironspine's Eye (77/246)
        [251350] = 0.81, -- Plans: Veteran's Chain Helm (2/246)
        [251351] = 1.6, -- Plans: Guard's Chain Helm (4/246)
        [251352] = 0.81, -- Plans: Protector's Chain Helm (2/246)
        [251353] = 1.2, -- Plans: Acolyte's Chain Helm (3/246)
        [252814] = 0.41, -- Pattern: Brawler's Leather Helm (1/246)
        [252815] = 2, -- Pattern: Trapper's Leather Helm (5/246)
        [252816] = 0.41, -- Pattern: Defender's Leather Helm (1/246)
        [252817] = 0.41, -- Pattern: Totemic Leather Helm (1/246)
        [252818] = 0.81, -- Pattern: Stormrider's Leather Helm (2/246)
        [253976] = 1.2, -- Pattern: Filigreed Pristine Circlet (3/246)
        [253978] = 0.41, -- Pattern: Filigreed Silky Circlet (1/246)
        [253984] = 0.41, -- Pattern: Filigreed Pearly Circlet (1/246)
        [253986] = 1.2, -- Pattern: Filigreed Shining Circlet (3/246)
    },
    ["Bloodmage Thalnos"] = { -- NPC 4543, 2908 kills on Wowhead Forever
        [7685] = 30.8, -- Orb of the Forgotten Seer (897/2908)
        [7684] = 33.6, -- Bloodmage Mantle (977/2908)
        [274291] = 33.8, -- Polished Skullcap (984/2908)
        [251350] = 0.45, -- Plans: Veteran's Chain Helm (13/2908)
        [251351] = 0.45, -- Plans: Guard's Chain Helm (13/2908)
        [251352] = 0.55, -- Plans: Protector's Chain Helm (16/2908)
        [251353] = 0.55, -- Plans: Acolyte's Chain Helm (16/2908)
        [251354] = 0.72, -- Plans: Crusader's Chain Helm (21/2908)
        [252814] = 0.38, -- Pattern: Brawler's Leather Helm (11/2908)
        [252815] = 0.38, -- Pattern: Trapper's Leather Helm (11/2908)
        [252816] = 0.41, -- Pattern: Defender's Leather Helm (12/2908)
        [252817] = 0.72, -- Pattern: Totemic Leather Helm (21/2908)
        [252818] = 0.48, -- Pattern: Stormrider's Leather Helm (14/2908)
        [252819] = 0.45, -- Pattern: Wisdom's Leather Helm (13/2908)
        [253976] = 0.58, -- Pattern: Filigreed Pristine Circlet (17/2908)
        [253978] = 0.62, -- Pattern: Filigreed Silky Circlet (18/2908)
        [253980] = 0.58, -- Pattern: Filigreed Flame Circlet (17/2908)
        [253982] = 0.34, -- Pattern: Filigreed Shadow Circlet (10/2908)
        [253984] = 0.62, -- Pattern: Filigreed Pearly Circlet (18/2908)
        [253986] = 0.41, -- Pattern: Filigreed Shining Circlet (12/2908)
    },
}

FDJ.DROP_RATES["Scarlet Monastery: Library"] = {
    ["Houndmaster Loksey"] = { -- NPC 3974, 2872 kills on Wowhead Forever
        [7756] = 30.6, -- Dog Training Gloves (878/2872)
        [3456] = 25, -- Dog Whistle (718/2872)
        [7710] = 34.5, -- Loksey's Training Stick (992/2872)
        [274292] = 28.8, -- Houndmaster Boomerang (826/2872)
        [273109] = 3.8, -- Blueprint: Trapper's Workbench (109/2872)
        [251350] = 0.35, -- Plans: Veteran's Chain Helm (10/2872)
        [251351] = 0.77, -- Plans: Guard's Chain Helm (22/2872)
        [251352] = 0.56, -- Plans: Protector's Chain Helm (16/2872)
        [251353] = 0.38, -- Plans: Acolyte's Chain Helm (11/2872)
        [251354] = 0.38, -- Plans: Crusader's Chain Helm (11/2872)
        [252814] = 0.59, -- Pattern: Brawler's Leather Helm (17/2872)
        [252815] = 0.38, -- Pattern: Trapper's Leather Helm (11/2872)
        [252816] = 0.49, -- Pattern: Defender's Leather Helm (14/2872)
        [252817] = 0.31, -- Pattern: Totemic Leather Helm (9/2872)
        [252818] = 0.42, -- Pattern: Stormrider's Leather Helm (12/2872)
        [252819] = 0.49, -- Pattern: Wisdom's Leather Helm (14/2872)
        [253976] = 0.73, -- Pattern: Filigreed Pristine Circlet (21/2872)
        [253978] = 0.38, -- Pattern: Filigreed Silky Circlet (11/2872)
        [253980] = 0.56, -- Pattern: Filigreed Flame Circlet (16/2872)
        [253982] = 0.73, -- Pattern: Filigreed Shadow Circlet (21/2872)
        [253984] = 0.49, -- Pattern: Filigreed Pearly Circlet (14/2872)
        [253986] = 0.49, -- Pattern: Filigreed Shining Circlet (14/2872)
    },
    ["Arcanist Doan"] = { -- NPC 6487, 3247 kills on Wowhead Forever
        [7714] = 31, -- Hypnotic Blade (1007/3247)
        [7713] = 30.5, -- Illusionary Rod (990/3247)
        [274293] = 29.6, -- Spellsever Crossbow (961/3247)
        [7712] = 30.7, -- Mantle of Doan (998/3247)
        [7711] = 32.6, -- Robe of Doan (1058/3247)
        [274294] = 29.2, -- Library Walkers (948/3247)
        [251398] = 0.4, -- Plans: Officer's Boots (13/3247)
        [251399] = 0.22, -- Plans: Sentinel's Boots (7/3247)
        [251400] = 0.46, -- Plans: Warder's Boots (15/3247)
        [251401] = 0.37, -- Plans: Prefect's Boots (12/3247)
        [251402] = 0.25, -- Plans: Justicar's Boots (8/3247)
        [252843] = 0.31, -- Pattern: Prowler's Leather Shoes (10/3247)
        [252844] = 0.4, -- Pattern: Skulker's Leather Shoes (13/3247)
        [252845] = 0.46, -- Pattern: Warden's Leather Shoes (15/3247)
        [252846] = 0.46, -- Pattern: Skycaller's Leather Shoes (15/3247)
        [252847] = 0.31, -- Pattern: Mender's Leather Shoes (10/3247)
        [252896] = 0.59, -- Pattern: Stalker's Mail Boots (19/3247)
        [252897] = 0.55, -- Pattern: Skycaller's Mail Boots (18/3247)
        [252898] = 0.34, -- Pattern: Skirmisher's Mail Boots (11/3247)
        [252899] = 0.52, -- Pattern: Mender's Mail Boots (17/3247)
        [254038] = 0.28, -- Pattern: Gilded Cord (9/3247)
        [254040] = 0.52, -- Pattern: Frothing Cord (17/3247)
        [254042] = 0.34, -- Pattern: Fiery Cord (11/3247)
        [254044] = 0.49, -- Pattern: Black Cord (16/3247)
        [254046] = 0.43, -- Pattern: Golden Cord (14/3247)
        [254048] = 0.43, -- Pattern: Radiant Cord (14/3247)
    },
}

FDJ.DROP_RATES["The Drowned City"] = {
    ["Zul'Alai"] = { -- NPC 258905, 3034 kills on Wowhead Forever
        [274599] = 34.2, -- Oathbound Bracers (1039/3034)
        [274598] = 32.1, -- Bloodslash Axe (973/3034)
        [274600] = 33.7, -- Berserker Shackles (1022/3034)
    },
    ["Var'Taka"] = { -- NPC 258924, 1886 kills on Wowhead Forever
        [274602] = 32.6, -- Brinebelly Leggings (614/1886)
        [274601] = 34.2, -- Harpoon of Command (645/1886)
        [274613] = 33.1, -- Priestess Cloak (624/1886)
    },
    ["Captain Dreadrise"] = { -- NPC 260042, 2553 kills on Wowhead Forever
        [274604] = 33.1, -- Frosty Blunderbuss (846/2553)
        [274605] = 33.5, -- Briny Sash (854/2553)
        [274603] = 33.4, -- Dreadfrost Saber (852/2553)
    },
    ["Deathless Marrow"] = { -- NPC 260202, 2033 kills on Wowhead Forever
        [274606] = 28.2, -- Bloodspine Staff (573/2033)
        [274614] = 33.1, -- Knucklebone Ring (672/2033)
        [274607] = 27.9, -- Viscera Spaulders (567/2033)
    },
    ["Primeval Elemental"] = { -- NPC 263886, 1338 kills on Wowhead Forever
        [274612] = 32.4, -- Waterlogged Burial Shroud (434/1338)
        [274611] = 31.4, -- Robe of the Drowned (420/1338)
        [274615] = 36.2, -- Heart of the Primeval (484/1338)
    },
    ["Gill"] = { -- NPC 264177, 161 kills on Wowhead Forever
        [286646] = 51.6, -- Gill's Gills (83/161)
        [286649] = 48.4, -- Tidebound Dagger (78/161)
    },
    ["Umbra"] = { -- NPC 264172, 161 kills on Wowhead Forever
        [286662] = 49.7, -- Deep-Dweller's Grips (80/161)
        [286658] = 50.3, -- Umbral Scaled Belt (81/161)
    },
    ["\"Pyromancer\" Braxton"] = { -- NPC 260468, 98 kills on Wowhead Forever
        [286650] = 44.9, -- Pyromancer's Baton (44/98)
        [286651] = 55.1, -- Flamestarter's Signet (54/98)
    },
    ["Min'loth the Serpent"] = { -- NPC 260243, 2093 kills on Wowhead Forever
        [274610] = 33.3, -- Ritual-Binder's Gloves (698/2093)
        [274608] = 31.7, -- Maw of Min'loth (663/2093)
        [274609] = 34.9, -- Serpentbane Crown (731/2093)
    },
}

FDJ.DROP_RATES["Scarlet Monastery: Armory"] = {
    ["Herod"] = { -- NPC 3975, 2715 kills on Wowhead Forever
        [7718] = 24.1, -- Herod's Shoulder (653/2715)
        [7719] = 23.9, -- Raging Berserker's Helm (649/2715)
        [7717] = 25.2, -- Ravager (685/2715)
        [10330] = 11.8, -- Scarlet Leggings (320/2715)
        [274295] = 25, -- Band of Crimson Light (680/2715)
        [251398] = 0.77, -- Plans: Officer's Boots (21/2715)
        [251399] = 0.52, -- Plans: Sentinel's Boots (14/2715)
        [251400] = 0.37, -- Plans: Warder's Boots (10/2715)
        [251401] = 0.37, -- Plans: Prefect's Boots (10/2715)
        [251402] = 0.33, -- Plans: Justicar's Boots (9/2715)
        [252843] = 0.22, -- Pattern: Prowler's Leather Shoes (6/2715)
        [252844] = 0.55, -- Pattern: Skulker's Leather Shoes (15/2715)
        [252845] = 0.48, -- Pattern: Warden's Leather Shoes (13/2715)
        [252846] = 0.63, -- Pattern: Skycaller's Leather Shoes (17/2715)
        [252847] = 0.33, -- Pattern: Mender's Leather Shoes (9/2715)
        [252896] = 0.37, -- Pattern: Stalker's Mail Boots (10/2715)
        [252897] = 0.29, -- Pattern: Skycaller's Mail Boots (8/2715)
        [252898] = 0.26, -- Pattern: Skirmisher's Mail Boots (7/2715)
        [252899] = 0.41, -- Pattern: Mender's Mail Boots (11/2715)
        [254038] = 0.11, -- Pattern: Gilded Cord (3/2715)
        [254040] = 0.33, -- Pattern: Frothing Cord (9/2715)
        [254042] = 0.26, -- Pattern: Fiery Cord (7/2715)
        [254044] = 0.99, -- Pattern: Black Cord (27/2715)
        [254046] = 0.44, -- Pattern: Golden Cord (12/2715)
        [254048] = 0.37, -- Pattern: Radiant Cord (10/2715)
    },
}

FDJ.DROP_RATES["Scarlet Monastery: Cathedral"] = {
    ["High Inquisitor Fairbanks"] = { -- NPC 4542, 2762 kills on Wowhead Forever
        [19507] = 30.4, -- Inquisitor's Shawl (841/2762)
        [19508] = 33.3, -- Branded Leather Bracers (921/2762)
        [19509] = 35.6, -- Dusty Mail Boots (982/2762)
        [251398] = 0.29, -- Plans: Officer's Boots (8/2762)
        [251399] = 0.43, -- Plans: Sentinel's Boots (12/2762)
        [251400] = 0.72, -- Plans: Warder's Boots (20/2762)
        [251401] = 0.36, -- Plans: Prefect's Boots (10/2762)
        [251402] = 0.62, -- Plans: Justicar's Boots (17/2762)
        [252843] = 0.33, -- Pattern: Prowler's Leather Shoes (9/2762)
        [252844] = 0.65, -- Pattern: Skulker's Leather Shoes (18/2762)
        [252845] = 0.62, -- Pattern: Warden's Leather Shoes (17/2762)
        [252846] = 0.43, -- Pattern: Skycaller's Leather Shoes (12/2762)
        [252847] = 0.62, -- Pattern: Mender's Leather Shoes (17/2762)
        [252896] = 0.54, -- Pattern: Stalker's Mail Boots (15/2762)
        [252897] = 0.36, -- Pattern: Skycaller's Mail Boots (10/2762)
        [252898] = 0.58, -- Pattern: Skirmisher's Mail Boots (16/2762)
        [252899] = 0.72, -- Pattern: Mender's Mail Boots (20/2762)
        [254038] = 0.43, -- Pattern: Gilded Cord (12/2762)
        [254040] = 0.43, -- Pattern: Frothing Cord (12/2762)
        [254042] = 0.43, -- Pattern: Fiery Cord (12/2762)
        [254046] = 0.4, -- Pattern: Golden Cord (11/2762)
        [254048] = 0.33, -- Pattern: Radiant Cord (9/2762)
    },
    ["Scarlet Commander Mograine"] = { -- NPC 3976, 2699 kills on Wowhead Forever
        [7726] = 24.4, -- Aegis of the Scarlet Commander (658/2699)
        [7724] = 25.1, -- Gauntlets of Divinity (677/2699)
        [7723] = 26.2, -- Mograine's Might (707/2699)
        [10330] = 23, -- Scarlet Leggings (621/2699)
        [251398] = 0.56, -- Plans: Officer's Boots (15/2699)
        [251399] = 0.33, -- Plans: Sentinel's Boots (9/2699)
        [251400] = 0.52, -- Plans: Warder's Boots (14/2699)
        [251401] = 0.44, -- Plans: Prefect's Boots (12/2699)
        [251402] = 0.44, -- Plans: Justicar's Boots (12/2699)
        [252843] = 0.3, -- Pattern: Prowler's Leather Shoes (8/2699)
        [252844] = 0.52, -- Pattern: Skulker's Leather Shoes (14/2699)
        [252845] = 0.48, -- Pattern: Warden's Leather Shoes (13/2699)
        [252846] = 0.56, -- Pattern: Skycaller's Leather Shoes (15/2699)
        [252847] = 0.74, -- Pattern: Mender's Leather Shoes (20/2699)
        [252896] = 0.7, -- Pattern: Stalker's Mail Boots (19/2699)
        [252897] = 0.44, -- Pattern: Skycaller's Mail Boots (12/2699)
        [252898] = 0.48, -- Pattern: Skirmisher's Mail Boots (13/2699)
        [252899] = 0.26, -- Pattern: Mender's Mail Boots (7/2699)
        [254038] = 0.41, -- Pattern: Gilded Cord (11/2699)
        [254040] = 0.3, -- Pattern: Frothing Cord (8/2699)
        [254042] = 0.52, -- Pattern: Fiery Cord (14/2699)
        [254044] = 0.33, -- Pattern: Black Cord (9/2699)
        [254046] = 0.7, -- Pattern: Golden Cord (19/2699)
        [254048] = 0.41, -- Pattern: Radiant Cord (11/2699)
    },
    ["High Inquisitor Whitemane"] = { -- NPC 3977, 2415 kills on Wowhead Forever
        [7722] = 33.3, -- Triune Amulet (805/2415)
        [7720] = 32.6, -- Whitemane's Chapeau (787/2415)
        [7721] = 31.8, -- Hand of Righteousness (769/2415)
        [251398] = 0.41, -- Plans: Officer's Boots (10/2415)
        [251399] = 0.5, -- Plans: Sentinel's Boots (12/2415)
        [251400] = 0.7, -- Plans: Warder's Boots (17/2415)
        [251401] = 0.46, -- Plans: Prefect's Boots (11/2415)
        [251402] = 0.41, -- Plans: Justicar's Boots (10/2415)
        [252843] = 0.66, -- Pattern: Prowler's Leather Shoes (16/2415)
        [252844] = 0.33, -- Pattern: Skulker's Leather Shoes (8/2415)
        [252845] = 0.41, -- Pattern: Warden's Leather Shoes (10/2415)
        [252846] = 0.54, -- Pattern: Skycaller's Leather Shoes (13/2415)
        [252847] = 0.7, -- Pattern: Mender's Leather Shoes (17/2415)
        [252896] = 0.62, -- Pattern: Stalker's Mail Boots (15/2415)
        [252898] = 0.58, -- Pattern: Skirmisher's Mail Boots (14/2415)
        [252899] = 0.41, -- Pattern: Mender's Mail Boots (10/2415)
        [254040] = 0.21, -- Pattern: Frothing Cord (5/2415)
        [254042] = 0.54, -- Pattern: Fiery Cord (13/2415)
        [254044] = 0.25, -- Pattern: Black Cord (6/2415)
        [254046] = 0.33, -- Pattern: Golden Cord (8/2415)
        [254048] = 0.7, -- Pattern: Radiant Cord (17/2415)
    },
}

FDJ.DROP_RATES["Razorfen Downs"] = {
    ["Tuten'kash"] = { -- NPC 7355, 1666 kills on Wowhead Forever
        [10776] = 33.8, -- Silky Spider Cape (563/1666)
        [10775] = 32.7, -- Carapace of Tuten'kash (545/1666)
        [10777] = 32, -- Arachnid Gloves (533/1666)
        [251398] = 0.3, -- Plans: Officer's Boots (5/1666)
        [254042] = 0.9, -- Pattern: Fiery Cord (15/1666)
        [254040] = 0.24, -- Pattern: Frothing Cord (4/1666)
        [251402] = 0.72, -- Plans: Justicar's Boots (12/1666)
        [254038] = 0.54, -- Pattern: Gilded Cord (9/1666)
        [254046] = 0.36, -- Pattern: Golden Cord (6/1666)
        [252844] = 0.42, -- Pattern: Skulker's Leather Shoes (7/1666)
        [252846] = 0.36, -- Pattern: Skycaller's Leather Shoes (6/1666)
        [251401] = 0.48, -- Plans: Prefect's Boots (8/1666)
        [252896] = 0.42, -- Pattern: Stalker's Mail Boots (7/1666)
        [252847] = 0.3, -- Pattern: Mender's Leather Shoes (5/1666)
        [252843] = 0.78, -- Pattern: Prowler's Leather Shoes (13/1666)
        [254048] = 0.6, -- Pattern: Radiant Cord (10/1666)
        [252845] = 0.42, -- Pattern: Warden's Leather Shoes (7/1666)
        [251399] = 0.42, -- Plans: Sentinel's Boots (7/1666)
        [251400] = 0.42, -- Plans: Warder's Boots (7/1666)
    },
    ["Plaguemaw the Rotting"] = { -- NPC 7356, 1426 kills on Wowhead Forever
        [10760] = 33.4, -- Swine Fists (476/1426)
        [10766] = 30.5, -- Plaguerot Sprig (435/1426)
        [274380] = 34.2, -- Decaying Flesh Bands (488/1426)
        [254042] = 0.56, -- Pattern: Fiery Cord (8/1426)
        [254038] = 0.14, -- Pattern: Gilded Cord (2/1426)
        [252845] = 0.28, -- Pattern: Warden's Leather Shoes (4/1426)
        [254044] = 0.7, -- Pattern: Black Cord (10/1426)
        [254040] = 0.35, -- Pattern: Frothing Cord (5/1426)
        [251398] = 0.49, -- Plans: Officer's Boots (7/1426)
        [251401] = 0.49, -- Plans: Prefect's Boots (7/1426)
        [252844] = 0.42, -- Pattern: Skulker's Leather Shoes (6/1426)
        [252897] = 1.2, -- Pattern: Skycaller's Mail Boots (17/1426)
        [252896] = 0.56, -- Pattern: Stalker's Mail Boots (8/1426)
        [252847] = 0.63, -- Pattern: Mender's Leather Shoes (9/1426)
        [252899] = 0.7, -- Pattern: Mender's Mail Boots (10/1426)
        [252843] = 0.28, -- Pattern: Prowler's Leather Shoes (4/1426)
        [252898] = 0.21, -- Pattern: Skirmisher's Mail Boots (3/1426)
        [252846] = 0.49, -- Pattern: Skycaller's Leather Shoes (7/1426)
        [251399] = 0.42, -- Plans: Sentinel's Boots (6/1426)
        [251400] = 0.42, -- Plans: Warder's Boots (6/1426)
    },
    ["Mordresh Fire Eye"] = { -- NPC 7357, 1386 kills on Wowhead Forever
        [10770] = 34.1, -- Mordresh's Lifeless Skull (473/1386)
        [10769] = 31.6, -- Glowing Eye of Mordresh (438/1386)
        [10771] = 33, -- Deathmage Sash (457/1386)
        [254044] = 0.65, -- Pattern: Black Cord (9/1386)
        [254042] = 0.36, -- Pattern: Fiery Cord (5/1386)
        [252843] = 0.58, -- Pattern: Prowler's Leather Shoes (8/1386)
        [251402] = 0.07, -- Plans: Justicar's Boots (1/1386)
        [254040] = 0.51, -- Pattern: Frothing Cord (7/1386)
        [252847] = 0.72, -- Pattern: Mender's Leather Shoes (10/1386)
        [254048] = 1, -- Pattern: Radiant Cord (14/1386)
        [252898] = 0.65, -- Pattern: Skirmisher's Mail Boots (9/1386)
        [252896] = 0.65, -- Pattern: Stalker's Mail Boots (9/1386)
        [254046] = 0.65, -- Pattern: Golden Cord (9/1386)
        [252897] = 0.72, -- Pattern: Skycaller's Mail Boots (10/1386)
        [252845] = 0.43, -- Pattern: Warden's Leather Shoes (6/1386)
        [251398] = 0.51, -- Plans: Officer's Boots (7/1386)
        [251401] = 0.29, -- Plans: Prefect's Boots (4/1386)
        [251399] = 0.51, -- Plans: Sentinel's Boots (7/1386)
        [254038] = 0.36, -- Pattern: Gilded Cord (5/1386)
        [252846] = 0.43, -- Pattern: Skycaller's Leather Shoes (6/1386)
        [251400] = 0.43, -- Plans: Warder's Boots (6/1386)
    },
    ["Glutton"] = { -- NPC 8567, 1333 kills on Wowhead Forever
        [10772] = 33.2, -- Glutton's Cleaver (442/1333)
        [10774] = 32.3, -- Fleshhide Shoulders (431/1333)
        [274385] = 32.7, -- Abomination Chain (436/1333)
        [251402] = 0.15, -- Plans: Justicar's Boots (2/1333)
        [252846] = 0.53, -- Pattern: Skycaller's Leather Shoes (7/1333)
        [254038] = 0.45, -- Pattern: Gilded Cord (6/1333)
        [252843] = 0.3, -- Pattern: Prowler's Leather Shoes (4/1333)
        [252897] = 0.45, -- Pattern: Skycaller's Mail Boots (6/1333)
        [252896] = 0.38, -- Pattern: Stalker's Mail Boots (5/1333)
        [252845] = 0.75, -- Pattern: Warden's Leather Shoes (10/1333)
        [254044] = 0.53, -- Pattern: Black Cord (7/1333)
        [252847] = 0.68, -- Pattern: Mender's Leather Shoes (9/1333)
        [254048] = 0.6, -- Pattern: Radiant Cord (8/1333)
        [252844] = 0.83, -- Pattern: Skulker's Leather Shoes (11/1333)
        [254042] = 0.3, -- Pattern: Fiery Cord (4/1333)
        [254046] = 0.53, -- Pattern: Golden Cord (7/1333)
        [252899] = 0.38, -- Pattern: Mender's Mail Boots (5/1333)
        [251398] = 0.45, -- Plans: Officer's Boots (6/1333)
        [251401] = 0.15, -- Plans: Prefect's Boots (2/1333)
        [251400] = 0.6, -- Plans: Warder's Boots (8/1333)
    },
    ["Ragglesnout"] = { -- NPC 7354, 237 kills on Wowhead Forever
        [10758] = 38.4, -- X'caliboar (91/237)
        [10767] = 28.7, -- Savage Boar's Guard (68/237)
        [10768] = 31.6, -- Boar Champion's Belt (75/237)
        [251399] = 0.42, -- Plans: Sentinel's Boots (1/237)
        [254038] = 0.42, -- Pattern: Gilded Cord (1/237)
        [252843] = 0.42, -- Pattern: Prowler's Leather Shoes (1/237)
        [252898] = 1.7, -- Pattern: Skirmisher's Mail Boots (4/237)
        [252845] = 0.42, -- Pattern: Warden's Leather Shoes (1/237)
    },
    ["Amnennar the Coldbringer"] = { -- NPC 7358, 1648 kills on Wowhead Forever
        [10762] = 29.7, -- Robes of the Lich (490/1648)
        [10763] = 28.2, -- Icemetal Barbute (465/1648)
        [10764] = 28.8, -- Deathchill Armor (475/1648)
        [10765] = 25.8, -- Bonefingers (426/1648)
        [10761] = 33.8, -- Coldrage Dagger (557/1648)
        [274381] = 27.8, -- Coldbringer Spine (458/1648)
        [252899] = 0.3, -- Pattern: Mender's Mail Boots (5/1648)
        [252896] = 0.61, -- Pattern: Stalker's Mail Boots (10/1648)
        [251402] = 0.36, -- Plans: Justicar's Boots (6/1648)
        [254044] = 0.49, -- Pattern: Black Cord (8/1648)
        [254042] = 0.61, -- Pattern: Fiery Cord (10/1648)
        [252847] = 0.42, -- Pattern: Mender's Leather Shoes (7/1648)
        [252843] = 0.36, -- Pattern: Prowler's Leather Shoes (6/1648)
        [252845] = 0.49, -- Pattern: Warden's Leather Shoes (8/1648)
        [251401] = 0.42, -- Plans: Prefect's Boots (7/1648)
        [251400] = 0.24, -- Plans: Warder's Boots (4/1648)
        [254040] = 0.3, -- Pattern: Frothing Cord (5/1648)
        [252898] = 0.3, -- Pattern: Skirmisher's Mail Boots (5/1648)
        [252846] = 0.24, -- Pattern: Skycaller's Leather Shoes (4/1648)
        [252897] = 0.24, -- Pattern: Skycaller's Mail Boots (4/1648)
        [251398] = 0.18, -- Plans: Officer's Boots (3/1648)
    },
}

FDJ.DROP_RATES["Krol'dok Stronghold"] = {
    ["Slavecrusher Grox"] = { -- NPC 258966, 861 kills on Wowhead Forever
        [274996] = 31.5, -- Resistance Breaker Spaulder (271/861)
        [274997] = 34, -- Chain of Binding (293/861)
        [274995] = 33.8, -- Slavecrusher Scepter (291/861)
        [273101] = 4.4, -- Blueprint: Expert Campfire (38/861)
    },
    ["Twilight Commander Zarmok"] = { -- NPC 258972, 1254 kills on Wowhead Forever
        [275000] = 32.3, -- Zarmok's Plated Signet (405/1254)
        [274998] = 32.2, -- Shadowlight Athame (404/1254)
        [274999] = 33.7, -- Shadecaster's Leggings (422/1254)
    },
    ["War Handler Ashka"] = { -- NPC 259281, 1022 kills on Wowhead Forever
        [275001] = 37.2, -- Bloodied Gutslicer (380/1022)
        [275002] = 33.9, -- War Handler's Gaze (346/1022)
        [275003] = 29, -- Worgbinder's Treads (296/1022)
    },
    ["Nar'gurk"] = { -- NPC 258964, 1130 kills on Wowhead Forever
        [275004] = 36.1, -- Chain of the Corruptor (408/1130)
        [275005] = 25.4, -- Krol'dok Warplate Chest (287/1130)
        [275006] = 29.6, -- Krol'dok Warplate Helmet (334/1130)
    },
    ["Bossman Toof"] = { -- NPC 264773, 964 kills on Wowhead Forever
        [286430] = 37.1, -- Toofbreaker (358/964)
        [286429] = 31.5, -- Big-Belly Belt (304/964)
        [286428] = 31.3, -- Band of Bossman (302/964)
    },
    ["Kroog"] = { -- NPC 262716, 64 kills on Wowhead Forever
        [279863] = 59.4, -- Black Horn Necklace (38/64)
        [279857] = 40.6, -- Kroog's Backscratcher (26/64)
    },
    ["Overlord Mugg"] = { -- NPC 258968, 1257 kills on Wowhead Forever
        [275009] = 21.1, -- Emblem of Slamming (265/1257)
        [275007] = 24.7, -- Mugg's Jabber (311/1257)
        [275008] = 21.2, -- Mugg's Crosser (267/1257)
        [275010] = 25.3, -- Strongly Scented Hood (318/1257)
    },
}

FDJ.DROP_RATES["Uldaman"] = {
    ["Revelosh"] = { -- NPC 6910, 797 kills on Wowhead Forever
        [9389] = 22.5, -- Revelosh's Spaulders (179/797)
        [9388] = 24.5, -- Revelosh's Armguards (195/797)
        [9387] = 24.8, -- Revelosh's Boots (198/797)
        [9390] = 20.6, -- Revelosh's Gloves (164/797)
    },
    ["The Lost Dwarves"] = { -- NPC 6906, 342 kills on Wowhead Forever
        [9400] = 41.5, -- Baelog's Shortbow (142/342)
        [9401] = 49.4, -- Nordic Longshank (169/342)
        [9399] = 81, -- Precision Arrow (277/342)
        [251400] = 0.29, -- Plans: Warder's Boots (1/342)
    },
    ["Ironaya"] = { -- NPC 7228, 1076 kills on Wowhead Forever
        [9407] = 29, -- Stoneweaver Leggings (312/1076)
        [9409] = 28.4, -- Ironaya's Bracers (306/1076)
        [9408] = 29.9, -- Ironshod Bludgeon (322/1076)
        [274484] = 11.4, -- Axe of Inevitable Ruin (123/1076)
    },
    ["Obsidian Sentinel"] = { -- NPC 7023, 1033 kills on Wowhead Forever
        [274430] = 28.8, -- Rock Sentinel Slicer (298/1033)
        [274428] = 26.4, -- Dark Golem Breastplate (273/1033)
        [274425] = 27.3, -- White Obsidian Wand (282/1033)
        [274485] = 11.3, -- Axe of Lingering Dread (117/1033)
        [251400] = 0.58, -- Plans: Warder's Boots (6/1033)
    },
    ["Ancient Stone Keeper"] = { -- NPC 7206, 885 kills on Wowhead Forever
        [9410] = 30.2, -- Cragfists (267/885)
        [9411] = 32.4, -- Rockshard Pauldrons (287/885)
        [274431] = 32.9, -- Sandstorm Staff (291/885)
    },
    ["Galgann Firehammer"] = { -- NPC 7291, 900 kills on Wowhead Forever
        [11311] = 26.7, -- Emberscale Cape (240/900)
        [11310] = 23.3, -- Flameseer Mantle (210/900)
        [9419] = 23.9, -- Galgann's Firehammer (215/900)
        [9412] = 24.1, -- Galgann's Fireblaster (217/900)
        [251402] = 0.44, -- Plans: Justicar's Boots (4/900)
    },
    ["Grimlok"] = { -- NPC 4854, 994 kills on Wowhead Forever
        [9415] = 32.3, -- Grimlok's Tribal Vestments (321/994)
        [9414] = 31.2, -- Oilskin Leggings (310/994)
        [9416] = 32.6, -- Grimlok's Charge (324/994)
    },
    ["Archaedas"] = { -- NPC 2748, 1188 kills on Wowhead Forever
        [11118] = 94.7, -- Archaedic Stone (1125/1188)
        [9413] = 28.7, -- The Rockpounder (341/1188)
        [9418] = 33.2, -- Stoneslayer (394/1188)
        [274432] = 32.2, -- Stone Keeper Spire (383/1188)
        [252868] = 0.34, -- Pattern: Skulker's Leather Gauntlets (4/1188)
        [254100] = 0.67, -- Pattern: Fiery Gloves (8/1188)
        [252871] = 0.17, -- Pattern: Mender's Leather Gauntlets (2/1188)
        [254096] = 0.67, -- Pattern: Gilded Gloves (8/1188)
        [254106] = 0.59, -- Pattern: Radiant Gloves (7/1188)
        [252870] = 0.67, -- Pattern: Skycaller's Leather Gauntlets (8/1188)
        [252919] = 0.25, -- Pattern: Skycaller's Mail Gauntlets (3/1188)
        [251404] = 0.51, -- Plans: Sentinel's Gloves (6/1188)
        [251405] = 0.25, -- Plans: Warder's Gloves (3/1188)
    },
}

FDJ.DROP_RATES["Zul'Farrak"] = {
    ["Theka the Martyr"] = { -- NPC 7272, 1584 kills on Wowhead Forever
        [274641] = 34.8, -- Theka's Last Breath (551/1584)
        [274639] = 28.9, -- Sacrificial Chain Vest (457/1584)
        [274638] = 30, -- Sandfury Pauldrons (475/1584)
        [254096] = 0.19, -- Pattern: Gilded Gloves (3/1584)
        [251403] = 0.13, -- Plans: Officer's Gloves (2/1584)
    },
    ["Antu'sul"] = { -- NPC 8127, 893 kills on Wowhead Forever
        [9640] = 24.3, -- Vice Grips (217/893)
        [9639] = 30.1, -- The Hand of Antu'sul (269/893)
        [9641] = 25.8, -- Lifeblood Amulet (230/893)
        [9379] = 11.3, -- Sang'thraze the Deflector (101/893)
        [9484] = 0.11, -- Spellshock Leggings (1/893)
        [251407] = 1.1, -- Plans: Justicar's Gloves (10/893)
        [252920] = 0.22, -- Pattern: Skirmisher's Mail Gauntlets (2/893)
        [252869] = 0.34, -- Pattern: Warden's Leather Gauntlets (3/893)
        [252868] = 0.34, -- Pattern: Skulker's Leather Gauntlets (3/893)
        [252870] = 0.56, -- Pattern: Skycaller's Leather Gauntlets (5/893)
        [251403] = 0.34, -- Plans: Officer's Gloves (3/893)
    },
    ["Witch Doctor Zum'rah"] = { -- NPC 7271, 1105 kills on Wowhead Forever
        [18082] = 31.8, -- Zum'rah's Vexing Cane (351/1105)
        [18083] = 28.3, -- Jumanza Grips (313/1105)
        [274642] = 25.6, -- Blood Ritual Ring (283/1105)
        [252868] = 0.54, -- Pattern: Skulker's Leather Gauntlets (6/1105)
        [252918] = 0.36, -- Pattern: Stalker's Mail Gauntlets (4/1105)
        [252869] = 0.45, -- Pattern: Warden's Leather Gauntlets (5/1105)
        [251403] = 0.27, -- Plans: Officer's Gloves (3/1105)
        [254106] = 0.36, -- Pattern: Radiant Gloves (4/1105)
        [252870] = 0.63, -- Pattern: Skycaller's Leather Gauntlets (7/1105)
        [251404] = 0.36, -- Plans: Sentinel's Gloves (4/1105)
    },
    ["Nekrum Gutchewer"] = { -- NPC 7796, 1184 kills on Wowhead Forever
        [274644] = 32.8, -- Undying Headdress (388/1184)
        [274645] = 26.4, -- Desert Ziggurat Drape (313/1184)
        [274643] = 30.9, -- Gutcutter Hatchet (366/1184)
        [252871] = 0.34, -- Pattern: Mender's Leather Gauntlets (4/1184)
        [252868] = 0.34, -- Pattern: Skulker's Leather Gauntlets (4/1184)
        [251400] = 0.34, -- Plans: Warder's Boots (4/1184)
    },
    ["Shadowpriest Sezz'ziz"] = { -- NPC 7275, 1110 kills on Wowhead Forever
        [9470] = 21.6, -- Bad Mojo Mask (240/1110)
        [9473] = 24.4, -- Jinxed Hoodoo Skin (271/1110)
        [9474] = 24.1, -- Jinxed Hoodoo Kilt (268/1110)
        [9475] = 23.9, -- Diabolic Skiver (265/1110)
        [254102] = 0.27, -- Pattern: Black Gloves (3/1110)
        [251404] = 0.27, -- Plans: Sentinel's Gloves (3/1110)
        [254098] = 0.27, -- Pattern: Frothing Gloves (3/1110)
        [252919] = 0.72, -- Pattern: Skycaller's Mail Gauntlets (8/1110)
        [252918] = 1.2, -- Pattern: Stalker's Mail Gauntlets (13/1110)
        [251407] = 0.99, -- Plans: Justicar's Gloves (11/1110)
    },
    ["Sergeant Bly"] = { -- NPC 7604, 1550 kills on Wowhead Forever
        [274646] = 32, -- Arch of the Covenant (496/1550)
        [274647] = 30.7, -- Farraki Kris (476/1550)
        [274648] = 32.5, -- The Desert Rose (504/1550)
        [252896] = 0.26, -- Pattern: Stalker's Mail Boots (4/1550)
        [251399] = 0.39, -- Plans: Sentinel's Boots (6/1550)
        [251400] = 0.39, -- Plans: Warder's Boots (6/1550)
        [251402] = 0.13, -- Plans: Justicar's Boots (2/1550)
    },
    ["Hydromancer Velratha"] = { -- NPC 7795, 1362 kills on Wowhead Forever
        [274653] = 28.7, -- Deep Ritual Girdle (391/1362)
        [274651] = 29.2, -- Zealot Plate (398/1362)
        [274652] = 29.9, -- Wall of Water (407/1362)
    },
    ["Gahz'rilla"] = { -- NPC 7273, 1051 kills on Wowhead Forever
        [9467] = 31.2, -- Gahz'rilla Fang (328/1051)
        [9469] = 33.5, -- Gahz'rilla Scale Armor (352/1051)
        [274657] = 29.7, -- Hydra Leather Legs (312/1051)
        [254096] = 0.29, -- Pattern: Gilded Gloves (3/1051)
        [252871] = 0.86, -- Pattern: Mender's Leather Gauntlets (9/1051)
        [254106] = 0.29, -- Pattern: Radiant Gloves (3/1051)
        [254098] = 0.76, -- Pattern: Frothing Gloves (8/1051)
        [252867] = 0.57, -- Pattern: Prowler's Leather Gauntlets (6/1051)
        [252868] = 0.48, -- Pattern: Skulker's Leather Gauntlets (5/1051)
    },
    ["Zerillis"] = { -- NPC 10082, 332 kills on Wowhead Forever
        [274658] = 50.9, -- Dune Hacker (169/332)
        [12470] = 42.5, -- Sandstalker Ankleguards (141/332)
        [251400] = 0.3, -- Plans: Warder's Boots (1/332)
    },
    ["Sandarr Dunereaver"] = { -- NPC 10080, 128 kills on Wowhead Forever
        [274660] = 43.8, -- Sandarr's Shoulders (56/128)
        [274659] = 51.6, -- Bloodsand Belt (66/128)
    },
    ["Dustwraith"] = { -- NPC 10081, 149 kills on Wowhead Forever
        [12471] = 37.6, -- Desertwalker Cane (56/149)
        [12469] = 53, -- Mutilator (79/149)
    },
    ["Ruuzlu"] = { -- NPC 7797, 1205 kills on Wowhead Forever
        [274654] = 36.3, -- Sandfury Guillotine (437/1205)
        [274655] = 28.3, -- Peacekeeper Wand (341/1205)
        [252919] = 0.33, -- Pattern: Skycaller's Mail Gauntlets (4/1205)
        [254100] = 0.5, -- Pattern: Fiery Gloves (6/1205)
        [252869] = 0.41, -- Pattern: Warden's Leather Gauntlets (5/1205)
        [254102] = 0.58, -- Pattern: Black Gloves (7/1205)
        [254096] = 0.41, -- Pattern: Gilded Gloves (5/1205)
        [252870] = 0.25, -- Pattern: Skycaller's Leather Gauntlets (3/1205)
        [252918] = 0.75, -- Pattern: Stalker's Mail Gauntlets (9/1205)
        [251407] = 0.33, -- Plans: Justicar's Gloves (4/1205)
        [251405] = 0.58, -- Plans: Warder's Gloves (7/1205)
    },
    ["Chief Ukorz Sandscalp"] = { -- NPC 7267, 1162 kills on Wowhead Forever
        [9476] = 24.5, -- Big Bad Pauldrons (285/1162)
        [9477] = 29.6, -- The Chief's Enforcer (344/1162)
        [9478] = 29.9, -- Ripsaw (348/1162)
        [9479] = 10.1, -- Embrace of the Lycan (117/1162)
        [11086] = 11.8, -- Jang'thraze the Protector (137/1162)
        [254100] = 0.52, -- Pattern: Fiery Gloves (6/1162)
        [254096] = 0.34, -- Pattern: Gilded Gloves (4/1162)
        [254102] = 0.34, -- Pattern: Black Gloves (4/1162)
        [252871] = 0.6, -- Pattern: Mender's Leather Gauntlets (7/1162)
        [252867] = 0.26, -- Pattern: Prowler's Leather Gauntlets (3/1162)
        [254106] = 0.43, -- Pattern: Radiant Gloves (5/1162)
        [251404] = 0.77, -- Plans: Sentinel's Gloves (9/1162)
        [251405] = 0.26, -- Plans: Warder's Gloves (3/1162)
    },
}

FDJ.DROP_RATES["Maraudon"] = {
    ["Noxxion"] = { -- NPC 13282, 744 kills on Wowhead Forever
        [17744] = 32, -- Heart of Noxxion (238/744)
        [17746] = 29.4, -- Noxxion's Shackles (219/744)
        [17745] = 30.8, -- Noxious Shooter (229/744)
        [254100] = 0.54, -- Pattern: Fiery Gloves (4/744)
        [254096] = 1.5, -- Pattern: Gilded Gloves (11/744)
        [252918] = 0.27, -- Pattern: Stalker's Mail Gauntlets (2/744)
        [251405] = 0.67, -- Plans: Warder's Gloves (5/744)
    },
    ["Razorlash"] = { -- NPC 12258, 712 kills on Wowhead Forever
        [17748] = 25.1, -- Vinerot Sandals (179/712)
        [17749] = 24.2, -- Phytoskin Spaulders (172/712)
        [17750] = 23.9, -- Chloromesh Girdle (170/712)
        [17751] = 24.9, -- Brusslehide Leggings (177/712)
        [252869] = 0.42, -- Pattern: Warden's Leather Gauntlets (3/712)
        [254100] = 0.56, -- Pattern: Fiery Gloves (4/712)
        [254096] = 0.42, -- Pattern: Gilded Gloves (3/712)
        [252871] = 0.42, -- Pattern: Mender's Leather Gauntlets (3/712)
        [251407] = 0.28, -- Plans: Justicar's Gloves (2/712)
    },
    ["Lord Vyletongue"] = { -- NPC 12236, 677 kills on Wowhead Forever
        [17752] = 25, -- Satyr's Lash (169/677)
        [17754] = 24.1, -- Infernal Trickster Leggings (163/677)
        [17755] = 22, -- Satyrmane Sash (149/677)
        [275864] = 21.3, -- Putridus Wall (144/677)
    },
    ["Meshlok the Harvester"] = { -- NPC 12237, 134 kills on Wowhead Forever
        [17767] = 26.9, -- Bloomsprout Headpiece (36/134)
        [17741] = 38.8, -- Nature's Embrace (52/134)
        [17742] = 31.3, -- Fungus Shroud Armor (42/134)
        [251407] = 0.75, -- Plans: Justicar's Gloves (1/134)
    },
    ["Celebras the Cursed"] = { -- NPC 12225, 596 kills on Wowhead Forever
        [17738] = 34.4, -- Claw of Celebras (205/596)
        [17739] = 28.9, -- Grovekeeper's Drape (172/596)
        [17740] = 35.1, -- Soothsayer's Headdress (209/596)
        [251405] = 0.17, -- Plans: Warder's Gloves (1/596)
        [254098] = 0.17, -- Pattern: Frothing Gloves (1/596)
        [252920] = 0.34, -- Pattern: Skirmisher's Mail Gauntlets (2/596)
        [252868] = 0.34, -- Pattern: Skulker's Leather Gauntlets (2/596)
    },
    ["Landslide"] = { -- NPC 12203, 750 kills on Wowhead Forever
        [17943] = 23.2, -- Fist of Stone (174/750)
        [17736] = 21.9, -- Rockgrip Gauntlets (164/750)
        [17737] = 25.5, -- Cloud Stone (191/750)
        [17734] = 25.9, -- Helm of the Mountain (194/750)
        [252868] = 0.4, -- Pattern: Skulker's Leather Gauntlets (3/750)
        [252918] = 0.4, -- Pattern: Stalker's Mail Gauntlets (3/750)
        [254098] = 0.4, -- Pattern: Frothing Gloves (3/750)
        [252867] = 0.13, -- Pattern: Prowler's Leather Gauntlets (1/750)
        [254106] = 0.53, -- Pattern: Radiant Gloves (4/750)
        [252920] = 0.4, -- Pattern: Skirmisher's Mail Gauntlets (3/750)
        [252919] = 0.4, -- Pattern: Skycaller's Mail Gauntlets (3/750)
        [251404] = 0.53, -- Plans: Sentinel's Gloves (4/750)
    },
    ["Tinkerer Gizlock"] = { -- NPC 13601, 501 kills on Wowhead Forever
        [17717] = 29.3, -- Megashot Rifle (147/501)
        [17718] = 29.9, -- Gizlock's Hypertech Buckler (150/501)
        [17719] = 37.9, -- Inventor's Focal Sword (190/501)
        [254098] = 0.2, -- Pattern: Frothing Gloves (1/501)
        [252867] = 0.4, -- Pattern: Prowler's Leather Gauntlets (2/501)
        [254106] = 0.8, -- Pattern: Radiant Gloves (4/501)
        [252920] = 0.4, -- Pattern: Skirmisher's Mail Gauntlets (2/501)
        [252868] = 0.4, -- Pattern: Skulker's Leather Gauntlets (2/501)
        [251404] = 0.2, -- Plans: Sentinel's Gloves (1/501)
    },
    ["Rotgrip"] = { -- NPC 13596, 669 kills on Wowhead Forever
        [17732] = 30.8, -- Rotgrip Mantle (206/669)
        [17728] = 31.2, -- Albino Crocscale Boots (209/669)
        [17730] = 34.1, -- Gatorbite Axe (228/669)
        [254102] = 0.3, -- Pattern: Black Gloves (2/669)
        [254100] = 0.75, -- Pattern: Fiery Gloves (5/669)
        [252919] = 1, -- Pattern: Skycaller's Mail Gauntlets (7/669)
    },
    ["Princess Theradras"] = { -- NPC 12201, 868 kills on Wowhead Forever
        [17713] = 46.8, -- Blackstone Ring (406/868)
        [17714] = 46, -- Bracers of the Stone Princess (399/868)
        [17707] = 20.9, -- Gemshard Heart (181/868)
        [17715] = 20.3, -- Eye of Theradras (176/868)
        [17766] = 17.1, -- Princess Theradras' Scepter (148/868)
        [17710] = 17.3, -- Charstone Dirk (150/868)
        [17711] = 19.4, -- Elemental Rockridge Leggings (168/868)
        [17780] = 0.12, -- Blade of Eternal Darkness (1/868)
        [254100] = 0.92, -- Pattern: Fiery Gloves (8/868)
        [252868] = 0.69, -- Pattern: Skulker's Leather Gauntlets (6/868)
        [252869] = 0.69, -- Pattern: Warden's Leather Gauntlets (6/868)
        [251407] = 0.46, -- Plans: Justicar's Gloves (4/868)
        [251403] = 0.46, -- Plans: Officer's Gloves (4/868)
    },
}

FDJ.DROP_RATES["Alcaz Prison"] = {
    ["Overseer Wrex"] = { -- NPC 255391, 811 kills on Wowhead Forever
        [276733] = 31.8, -- Grips of Control (258/811)
        [276734] = 32.9, -- Wrex's Pinky Ring (267/811)
        [276732] = 33.7, -- Alcaz Willcrusher (273/811)
    },
    ["The Questioner"] = { -- NPC 256236, 1066 kills on Wowhead Forever
        [276742] = 30.5, -- Girdle of Extracted Answers (325/1066)
        [276743] = 36.1, -- Fingerbreaker Stamp (385/1066)
        [276741] = 31.9, -- Defias Enforcer's Shoulderpads (340/1066)
    },
    ["Tidemistress Ca'zass"] = { -- NPC 255997, 896 kills on Wowhead Forever
        [276735] = 30.5, -- Tidesong Wand (273/896)
        [276736] = 31.8, -- Seascale Bracers (285/896)
        [276737] = 31.6, -- Cloak of the Tidemistress (283/896)
    },
    ["Katerina the Cleaner"] = { -- NPC 257016, 828 kills on Wowhead Forever
        [276739] = 30.7, -- Cutthroat Chestguard (254/828)
        [276738] = 33.5, -- Katerina's Shanker (277/828)
        [276740] = 35.3, -- Sentimental Locket (292/828)
    },
    ["Blazeroar"] = { -- NPC 255702, 955 kills on Wowhead Forever
        [276744] = 35.1, -- Zarla's Snack Pouch (335/955)
        [276745] = 28.6, -- Beastbond Robe (273/955)
        [276746] = 33.8, -- Defias Enforcer's Legguards (323/955)
    },
}

FDJ.DROP_RATES["Sunken Temple"] = {
    ["Altar Bosses"] = { -- NPCs 5713, 5715, 5714, 5717, 5712, 5716, 1052 kills on Wowhead Forever
        [10783] = 5.1, -- Atal'ai Spaulders (54/1052)
        [10784] = 4.1, -- Atal'ai Breastplate (43/1052)
        [10787] = 9.7, -- Atal'ai Gloves (102/1052)
        [10785] = 7.1, -- Atal'ai Leggings (75/1052)
        [10786] = 11.6, -- Atal'ai Boots (122/1052)
        [10788] = 13.1, -- Atal'ai Girdle (138/1052)
    },
    ["Gasher"] = { -- NPC 5713, 189 kills on Wowhead Forever
        [10783] = 5.8, -- Atal'ai Spaulders (11/189)
        [10784] = 5.3, -- Atal'ai Breastplate (10/189)
        [10787] = 7.4, -- Atal'ai Gloves (14/189)
        [10785] = 7.4, -- Atal'ai Leggings (14/189)
        [10786] = 9.5, -- Atal'ai Boots (18/189)
        [10788] = 14.3, -- Atal'ai Girdle (27/189)
    },
    ["Hukku"] = { -- NPC 5715, 146 kills on Wowhead Forever
        [10783] = 3.4, -- Atal'ai Spaulders (5/146)
        [10784] = 4.8, -- Atal'ai Breastplate (7/146)
        [10787] = 11.6, -- Atal'ai Gloves (17/146)
        [10785] = 5.5, -- Atal'ai Leggings (8/146)
        [10786] = 8.9, -- Atal'ai Boots (13/146)
        [10788] = 7.5, -- Atal'ai Girdle (11/146)
    },
    ["Loro"] = { -- NPC 5714, 186 kills on Wowhead Forever
        [10783] = 3.2, -- Atal'ai Spaulders (6/186)
        [10784] = 3.8, -- Atal'ai Breastplate (7/186)
        [10787] = 10.2, -- Atal'ai Gloves (19/186)
        [10785] = 8.1, -- Atal'ai Leggings (15/186)
        [10786] = 10.2, -- Atal'ai Boots (19/186)
        [10788] = 14, -- Atal'ai Girdle (26/186)
    },
    ["Mijan"] = { -- NPC 5717, 210 kills on Wowhead Forever
        [10783] = 4.8, -- Atal'ai Spaulders (10/210)
        [10784] = 5.2, -- Atal'ai Breastplate (11/210)
        [10787] = 9.5, -- Atal'ai Gloves (20/210)
        [10785] = 7.6, -- Atal'ai Leggings (16/210)
        [10786] = 12.4, -- Atal'ai Boots (26/210)
        [10788] = 14.3, -- Atal'ai Girdle (30/210)
    },
    ["Zolo"] = { -- NPC 5712, 125 kills on Wowhead Forever
        [10783] = 6.4, -- Atal'ai Spaulders (8/125)
        [10784] = 2.4, -- Atal'ai Breastplate (3/125)
        [10787] = 13.6, -- Atal'ai Gloves (17/125)
        [10785] = 4.8, -- Atal'ai Leggings (6/125)
        [10786] = 17.6, -- Atal'ai Boots (22/125)
        [10788] = 12.8, -- Atal'ai Girdle (16/125)
    },
    ["Zul'Lor"] = { -- NPC 5716, 196 kills on Wowhead Forever
        [10783] = 7.1, -- Atal'ai Spaulders (14/196)
        [10784] = 2.6, -- Atal'ai Breastplate (5/196)
        [10787] = 7.7, -- Atal'ai Gloves (15/196)
        [10785] = 8.2, -- Atal'ai Leggings (16/196)
        [10786] = 12.2, -- Atal'ai Boots (24/196)
        [10788] = 14.3, -- Atal'ai Girdle (28/196)
    },
    ["Atal'alarion"] = { -- NPC 8580, 485 kills on Wowhead Forever
        [10800] = 32.8, -- Darkwater Bracers (159/485)
        [10798] = 29.9, -- Atal'alarion's Tusk Ring (145/485)
        [10799] = 31.8, -- Headspike (154/485)
    },
    ["Morphaz & Hazzas"] = { -- NPC 5719, 383 kills on Wowhead Forever
        [10795] = 5, -- Drakeclaw Band (19/383)
        [10796] = 5.2, -- Drakestone (20/383)
        [10797] = 3.7, -- Firebreather (14/383)
        [12243] = 4.4, -- Smoldering Claw (17/383)
        [12463] = 4.7, -- Drakefang Butcher (18/383)
        [12464] = 4.7, -- Bloodfire Talons (18/383)
        [12465] = 4.2, -- Nightfall Drape (16/383)
        [12466] = 8.6, -- Dawnspire Cord (33/383)
    },
    ["Jammal'an the Prophet"] = { -- NPC 5710, 525 kills on Wowhead Forever
        [10806] = 29.1, -- Vestments of the Atal'ai Prophet (153/525)
        [10807] = 33.7, -- Kilt of the Atal'ai Prophet (177/525)
        [10808] = 30.7, -- Gloves of the Atal'ai Prophet (161/525)
        [254102] = 0.19, -- Pattern: Black Gloves (1/525)
        [252919] = 0.57, -- Pattern: Skycaller's Mail Gauntlets (3/525)
        [252918] = 0.19, -- Pattern: Stalker's Mail Gauntlets (1/525)
        [252869] = 0.19, -- Pattern: Warden's Leather Gauntlets (1/525)
        [251405] = 0.19, -- Plans: Warder's Gloves (1/525)
        [273119] = 2.7, -- Blueprint: Fishing Hut (14/525)
    },
    ["Ogom the Wretched"] = { -- NPC 5711, 448 kills on Wowhead Forever
        [10804] = 31.7, -- Fist of the Damned (142/448)
        [10803] = 34.4, -- Blade of the Wretched (154/448)
        [10805] = 32.8, -- Eater of the Dead (147/448)
    },
    ["Dreamscythe & Weaver"] = { -- NPC 5721, 336 kills on Wowhead Forever
        [10795] = 4.5, -- Drakeclaw Band (15/336)
        [10796] = 4.5, -- Drakestone (15/336)
        [10797] = 4.2, -- Firebreather (14/336)
        [12243] = 7.7, -- Smoldering Claw (26/336)
        [12463] = 2.7, -- Drakefang Butcher (9/336)
        [12464] = 5.4, -- Bloodfire Talons (18/336)
        [12465] = 5.4, -- Nightfall Drape (18/336)
        [12466] = 4.2, -- Dawnspire Cord (14/336)
    },
    ["Shade of Eranikus"] = { -- NPC 5709, 511 kills on Wowhead Forever
        [10829] = 26, -- Dragon's Eye (133/511)
        [10833] = 30.7, -- Horns of Eranikus (157/511)
        [10835] = 25.2, -- Crest of Supremacy (129/511)
        [10836] = 26.8, -- Rod of Corrosion (137/511)
        [10828] = 31.3, -- Dire Nail (160/511)
        [10837] = 26.4, -- Tooth of Eranikus (135/511)
        [10847] = 2, -- Dragon's Call (10/511)
        [254106] = 0.98, -- Pattern: Radiant Gloves (5/511)
        [252919] = 0.78, -- Pattern: Skycaller's Mail Gauntlets (4/511)
        [251403] = 0.59, -- Plans: Officer's Gloves (3/511)
    },
    ["Avatar of Hakkar"] = { -- Wowhead counts this loot on Shade of Hakkar (NPC 8440), 529 kills on Wowhead Forever
        [12462] = 1.7, -- Embrace of the Wind Serpent (9/529)
        [10838] = 30.8, -- Might of Hakkar (163/529)
        [10842] = 34.2, -- Windscale Sarong (181/529)
        [10843] = 27.6, -- Featherskin Cape (146/529)
        [10844] = 29.9, -- Spire of Hakkar (158/529)
        [10845] = 28.4, -- Warrior's Embrace (150/529)
        [10846] = 30.2, -- Bloodshot Greaves (160/529)
    },
}

FDJ.DROP_RATES["Blackrock Depths"] = {
    ["High Interrogator Gerstahn"] = { -- NPC 9018, 358 kills on Wowhead Forever
        [11624] = 23.5, -- Kentic Amice (84/358)
        [11625] = 26, -- Enthralled Sphere (93/358)
        [11626] = 22.9, -- Blackveil Cape (82/358)
        [22240] = 22.9, -- Greaves of Withering Despair (82/358)
    },
    ["Lord Roccor"] = { -- NPC 9025, 355 kills on Wowhead Forever
        [11632] = 21.7, -- Earthslag Shoulders (77/355)
        [11631] = 26.2, -- Stoneshell Guard (93/355)
        [22234] = 21.1, -- Mantle of Lost Hope (75/355)
        [22397] = 21.4, -- Idol of Ferocity (76/355)
        [11630] = 88.5, -- Rockshard Pellets (314/355)
        [11813] = 17.2, -- Formula: Smoking Heart of the Mountain (61/355)
    },
    ["Houndmaster Grebmar"] = { -- NPC 9319, 292 kills on Wowhead Forever
        [11627] = 21.6, -- Fleetfoot Greaves (63/292)
        [11623] = 25.3, -- Spritecaster Cape (74/292)
        [11628] = 25.7, -- Houndmaster's Bow (75/292)
        [11629] = 24.7, -- Houndmaster's Rifle (72/292)
    },
    ["Gorosh the Dervish"] = { -- NPC 9027, 58 kills on Wowhead Forever
        [11726] = 10.3, -- Savage Gladiator Chain (6/58)
        [22257] = 34.5, -- Bloodclot Band (20/58)
        [22266] = 32.8, -- Flarethorn (19/58)
        [22271] = 20.7, -- Leggings of Frenzied Magic (12/58)
    },
    ["Grizzle"] = { -- NPC 9028, 126 kills on Wowhead Forever
        [11702] = 18.3, -- Grizzle's Skinner (23/126)
        [11703] = 19, -- Stonewall Girdle (24/126)
        [11722] = 23, -- Dregmetal Spaulders (29/126)
        [22270] = 17.5, -- Entrenching Boots (22/126)
        [277117] = 19, -- Savage Gladiator Shoulders (24/126)
        [11610] = 96, -- Plans: Dark Iron Pulverizer (121/126)
    },
    ["Eviscerator"] = { -- NPC 9029, 105 kills on Wowhead Forever
        [11679] = 28.6, -- Rubicund Armguards (30/105)
        [11685] = 25.7, -- Splinthide Shoulders (27/105)
        [11686] = 21.9, -- Girdle of Beastial Fury (23/105)
        [11730] = 22.9, -- Savage Gladiator Grips (24/105)
    },
    ["Ok'thor the Breaker"] = { -- NPC 9030, 107 kills on Wowhead Forever
        [11662] = 27.1, -- Ban'thok Sash (29/107)
        [11665] = 20.6, -- Ogreseer Fists (22/107)
        [11824] = 28, -- Cyclopean Band (30/107)
        [11728] = 24.3, -- Savage Gladiator Leggings (26/107)
    },
    ["Anub'shiah"] = { -- NPC 9031, 88 kills on Wowhead Forever
        [11675] = 22.7, -- Shadefiend Boots (20/88)
        [11677] = 15.9, -- Graverot Cape (14/88)
        [11678] = 26.1, -- Carapace of Anub'shiah (23/88)
        [11731] = 35.2, -- Savage Gladiator Greaves (31/88)
    },
    ["Hedrum the Creeper"] = { -- NPC 9032, 102 kills on Wowhead Forever
        [11633] = 29.4, -- Spiderfang Carapace (30/102)
        [11634] = 24.5, -- Silkweb Gloves (25/102)
        [11635] = 18.6, -- Hookfang Shanker (19/102)
        [11729] = 27.5, -- Savage Gladiator Helm (28/102)
    },
    ["Theldren"] = { -- Arena Spoils (object 181074), opened 172 times on Wowhead Forever
        [22330] = 25.6, -- Shroud of Arcane Mastery (44/172)
        [22305] = 31.4, -- Ironweave Mantle (54/172)
        [22317] = 19.8, -- Lefty's Brass Knuckle (34/172)
        [22318] = 23.3, -- Malgen's Long Bow (40/172)
    },
    ["Pyromancer Loregrain"] = { -- NPC 9024, 337 kills on Wowhead Forever
        [11747] = 22, -- Flamestrider Robes (74/337)
        [11748] = 23.1, -- Pyric Caduceus (78/337)
        [11749] = 24.3, -- Searingscale Leggings (82/337)
        [11750] = 24.6, -- Kindling Stave (83/337)
        [11207] = 19, -- Formula: Enchant Weapon - Fiery Weapon (64/337)
    },
    ["Fineous Darkvire"] = { -- NPC 9056, 356 kills on Wowhead Forever
        [11841] = 25.8, -- Senior Designer's Pantaloons (92/356)
        [11842] = 22.8, -- Lead Surveyor's Mantle (81/356)
        [11839] = 21.1, -- Chief Architect's Monocle (75/356)
        [22223] = 22.8, -- Foreman's Head Protector (81/356)
    },
    ["Warder Stilgiss"] = { -- NPC 9041, 261 kills on Wowhead Forever
        [11782] = 23.4, -- Boreal Mantle (61/261)
        [11783] = 24.5, -- Chillsteel Girdle (64/261)
        [11784] = 21.1, -- Arbiter's Blade (55/261)
        [22241] = 25.7, -- Dark Warder's Pauldrons (67/261)
    },
    ["Lord Incendius"] = { -- NPC 9017, 421 kills on Wowhead Forever
        [11764] = 25.2, -- Cinderhide Armsplints (106/421)
        [11765] = 23.8, -- Pyremail Wristguards (100/421)
        [11766] = 21.4, -- Flameweave Cuffs (90/421)
        [11767] = 24.2, -- Emberplate Armguards (102/421)
    },
    ["Bael'Gar"] = { -- NPC 9016, 294 kills on Wowhead Forever
        [11802] = 22.8, -- Lavacrest Leggings (67/294)
        [11803] = 21.4, -- Force of Magma (63/294)
        [11805] = 23.8, -- Rubidium Hammer (70/294)
        [11807] = 22.8, -- Sash of the Burning Heart (67/294)
    },
    ["General Angerforge"] = { -- NPC 9033, 316 kills on Wowhead Forever
        [11816] = 22.2, -- Angerforge's Battle Axe (70/316)
        [11820] = 18, -- Royal Decorated Armor (57/316)
        [11821] = 13, -- Warstrife Leggings (41/316)
        [11817] = 16.8, -- Lord General's Sword (53/316)
        [11810] = 13, -- Force of Will (41/316)
    },
    ["Golem Lord Argelmach"] = { -- NPC 8983, 434 kills on Wowhead Forever
        [11822] = 21.2, -- Omnicast Boots (92/434)
        [11823] = 23.7, -- Luminary Kilt (103/434)
        [11669] = 20.5, -- Naglering (89/434)
        [11819] = 24.2, -- Second Wind (105/434)
        [273113] = 6.2, -- Blueprint: Master Forge (27/434)
    },
    ["Hurley Blackbreath"] = { -- NPC 9537, 372 kills on Wowhead Forever
        [18044] = 24.5, -- Hurley's Tankard (91/372)
        [18043] = 22.3, -- Coal Miner Boots (83/372)
        [22275] = 20.2, -- Firemoss Boots (75/372)
        [11735] = 23.4, -- Ragefury Eyepatch (87/372)
    },
    ["Phalanx"] = { -- NPC 9502, 353 kills on Wowhead Forever
        [11745] = 20.7, -- Fists of Phalanx (73/353)
        [11744] = 24.1, -- Bloodfist (85/353)
        [22212] = 26.6, -- Golem Fitted Pauldrons (94/353)
        [276879] = 23.5, -- Backroom Bulwark (83/353)
    },
    ["Ribbly Screwspigot"] = { -- NPC 9543, 315 kills on Wowhead Forever
        [11742] = 20.6, -- Wayfarer's Knapsack (65/315)
        [2662] = 17.5, -- Ribbly's Quiver (55/315)
        [2663] = 21, -- Ribbly's Bandolier (66/315)
        [11612] = 23.5, -- Plans: Dark Iron Plate (74/315)
    },
    ["Plugger Spazzring"] = { -- NPC 9499, 135 kills on Wowhead Forever
        [12793] = 22.2, -- Mixologist's Tunic (30/135)
        [12791] = 31.9, -- Barman Shanker (43/135)
        [276877] = 19.3, -- Brewmancer Nightcap (26/135)
        [18653] = 25.2, -- Schematic: Goblin Jumper Cables XL (34/135)
    },
    ["Ambassador Flamelash"] = { -- NPC 9156, 387 kills on Wowhead Forever
        [11812] = 25.6, -- Cape of the Fire Salamander (99/387)
        [11814] = 22.7, -- Molten Fists (88/387)
        [11809] = 19.9, -- Flame Wrath (77/387)
        [11832] = 26.9, -- Burst of Knowledge (104/387)
        [11808] = 0.52, -- Circle of Flame (2/387)
        [273122] = 3.9, -- Blueprint: Molten Foundry (15/387)
    },
    ["Panzor the Invincible"] = { -- NPC 8923, 59 kills on Wowhead Forever
        [11787] = 22, -- Shalehusk Boots (13/59)
        [11786] = 20.3, -- Stone of the Earth (12/59)
        [11785] = 22, -- Rock Golem Bulwark (13/59)
        [22245] = 32.2, -- Soot Encrusted Footwear (19/59)
    },
    ["The Seven"] = { -- Chest of The Seven (object 169243), opened 167 times on Wowhead Forever
        [11920] = 23.4, -- Wraith Scythe (39/167)
        [11921] = 27.5, -- Impervious Giant (46/167)
        [11922] = 19.2, -- Blood-etched Blade (32/167)
        [11926] = 24.6, -- Deathdealer Breastplate (41/167)
        [11927] = 28.1, -- Legplates of the Eternal Guardian (47/167)
        [11923] = 24.6, -- The Hammer of Grace (41/167)
        [11925] = 19.2, -- Ghostshroud (32/167)
        [11929] = 22.2, -- Haunting Specter Leggings (37/167)
    },
    ["Magmus"] = { -- NPC 9938, 386 kills on Wowhead Forever
        [11935] = 18.1, -- Magmus Stone (70/386)
        [22208] = 20.2, -- Lavastone Hammer (78/386)
        [22395] = 20.2, -- Totem of Rage (78/386)
        [22400] = 14.5, -- Libram of Truth (56/386)
        [11746] = 18.9, -- Golem Skull Helm (73/386)
    },
    ["Princess Moira Bronzebeard"] = { -- NPC 8929, 27 kills on Wowhead Forever
        [12553] = 22.2, -- Swiftwalker Boots (6/27)
        [12554] = 14.8, -- Hands of the Exalted Herald (4/27)
        [12556] = 14.8, -- High Priestess Boots (4/27)
        [12557] = 22.2, -- Ebonsteel Spaulders (6/27)
    },
    ["Emperor Dagran Thaurissan"] = { -- NPC 9019, 422 kills on Wowhead Forever
        [11684] = 1.2, -- Ironfoe (5/422)
        [11815] = 19.2, -- Hand of Justice (81/422)
        [11924] = 19, -- Robes of the Royal Crown (80/422)
        [11928] = 23, -- Thaurissan's Royal Scepter (97/422)
        [11930] = 19.7, -- The Emperor's New Cape (83/422)
        [11931] = 17.3, -- Dreadforge Retaliator (73/422)
        [11932] = 14.7, -- Guiding Stave of Wisdom (62/422)
        [11933] = 20.6, -- Imperial Jewel (87/422)
        [11934] = 19.2, -- Emperor's Seal (81/422)
        [22204] = 16.6, -- Wristguards of Renown (70/422)
        [22207] = 18.2, -- Sash of the Grand Hunt (77/422)
    },
}

FDJ.DROP_RATES["Lower Blackrock Spire"] = {
    ["Spirestone Butcher"] = { -- NPC 9219, 89 kills on Wowhead Forever
        [12608] = 47.2, -- Butcher's Apron (42/89)
        [13286] = 49.4, -- Rivenspike (44/89)
    },
    ["Spirestone Battle Lord"] = { -- NPC 9218, 56 kills on Wowhead Forever
        [13284] = 44.6, -- Swiftdart Battleboots (25/56)
        [13285] = 51.8, -- The Blackrock Slicer (29/56)
    },
    ["Spirestone Lord Magus"] = { -- NPC 9217, 28 kills on Wowhead Forever
        [13283] = 39.3, -- Magus Ring (11/28)
        [13282] = 39.3, -- Ogreseer Tower Boots (11/28)
        [13261] = 21.4, -- Globe of D'sak (6/28)
    },
    ["Highlord Omokk"] = { -- NPC 9196, 401 kills on Wowhead Forever
        [13166] = 11, -- Slamshot Shoulders (44/401)
        [13167] = 15.2, -- Fist of Omokk (61/401)
        [13168] = 14.5, -- Plate of the Shaman King (58/401)
        [13169] = 19.2, -- Tressermane Leggings (77/401)
        [13170] = 15.7, -- Skyshroud Leggings (63/401)
        [16670] = 17.5, -- Boots of Elements (70/401)
    },
    ["Shadow Hunter Vosh'gajin"] = { -- NPC 9236, 321 kills on Wowhead Forever
        [13255] = 12.5, -- Trueaim Gauntlets (40/321)
        [12626] = 14.3, -- Funeral Cuffs (46/321)
        [16712] = 20.2, -- Shadowcraft Gloves (65/321)
        [13257] = 14, -- Demonic Runed Spaulders (45/321)
        [12651] = 11.5, -- Blackcrow (37/321)
        [12653] = 14.6, -- Riphook (47/321)
        [12654] = 86.9, -- Doomshot (279/321)
    },
    ["War Master Voone"] = { -- NPC 9237, 382 kills on Wowhead Forever
        [13177] = 16.8, -- Talisman of Evasion (64/382)
        [13179] = 17, -- Brazecore Armguards (65/382)
        [16676] = 15.2, -- Beaststalker's Gloves (58/382)
        [12582] = 14.1, -- Keris of Zul'Serak (54/382)
        [22231] = 15.4, -- Kayser's Boots of Precision (59/382)
        [13173] = 19.4, -- Flightblade Throwing Axe (74/382)
    },
    ["Mor Grayhoof"] = { -- NPC 16080, only 1 kills on Wowhead Forever: Classic Wowhead's numbers (1785 kills)
        [22306] = 21.8, -- Ironweave Belt (178/817)
        [22319] = 20.9, -- Tome of Divine Right (171/817)
        [22322] = 21.1, -- The Jaw Breaker (172/817)
        [22325] = 18.4, -- Belt of the Trickster (150/817)
        [22398] = 17.4, -- Idol of Rejuvenation (142/817)
    },
    ["Mother Smolderweb"] = { -- NPC 10596, 246 kills on Wowhead Forever
        [13244] = 18.3, -- Gilded Gauntlets (45/246)
        [16715] = 15.4, -- Wildheart Boots (38/246)
        [13213] = 29.7, -- Smolderweb's Eye (73/246)
        [13183] = 23.6, -- Venomspitter (58/246)
        [249521] = 15.4, -- Formula: Dormant Heart of the Mountain (38/246)
    },
    ["Crystal Fang"] = { -- NPC 10376, 40 kills on Wowhead Forever
        [13185] = 35, -- Sunderseer Mantle (14/40)
        [13184] = 30, -- Fallbrush Handgrips (12/40)
        [13218] = 32.5, -- Fang of the Crystal Spider (13/40)
    },
    ["Urok Doomhowl"] = { -- NPC 10584, 192 kills on Wowhead Forever
        [13258] = 15.6, -- Slaghide Gauntlets (30/192)
        [13259] = 20.3, -- Ribsteel Footguards (39/192)
        [22232] = 28.1, -- Marksman's Girdle (54/192)
        [13178] = 24.5, -- Rosewine Circle (47/192)
    },
    ["Bannok Grimaxe"] = { -- NPC 9596, 42 kills on Wowhead Forever
        [12634] = 50, -- Chiselbrand Girdle (21/42)
        [12637] = 19, -- Backusarian Gauntlets (8/42)
        [12621] = 28.6, -- Demonfork (12/42)
        [12838] = 7.1, -- Plans: Arcanite Reaper (3/42)
    },
    ["Burning Felguard"] = { -- NPC 10263, only 21 kills on Wowhead Forever: Classic Wowhead's numbers (1110 kills)
        [13181] = 30.3, -- Demonskin Gloves (275/908)
        [13182] = 30.1, -- Phase Blade (273/908)
    },
    ["Quartermaster Zigris"] = { -- NPC 9736, 325 kills on Wowhead Forever
        [13252] = 10.5, -- Cloudrunner Girdle (34/325)
        [13253] = 6.5, -- Hands of Power (21/325)
        [16673] = 6.2, -- Cord of Elements (20/325)
        [16680] = 10.5, -- Beaststalker's Belt (34/325)
        [16683] = 7.7, -- Magister's Bindings (25/325)
        [16696] = 9.5, -- Devout Belt (31/325)
        [16703] = 13.8, -- Dreadmist Bracers (45/325)
        [16713] = 7.1, -- Shadowcraft Belt (23/325)
        [16735] = 12.9, -- Bracers of Valor (42/325)
        [16716] = 10.5, -- Wildheart Belt (34/325)
        [12835] = 10.8, -- Plans: Annihilator (35/325)
        [273115] = 3.1, -- Blueprint: Iron Oven (10/325)
    },
    ["Halycon"] = { -- NPC 10220, 255 kills on Wowhead Forever
        [13212] = 21.2, -- Halycon's Spiked Collar (54/255)
        [13211] = 24.3, -- Slashclaw Bracers (62/255)
        [13210] = 22.4, -- Pads of the Dread Wolf (57/255)
        [22313] = 22, -- Ironweave Bracers (56/255)
    },
    ["Gizrul the Slavener"] = { -- NPC 10268, 323 kills on Wowhead Forever
        [13206] = 26.3, -- Wolfshear Leggings (85/323)
        [13205] = 23.8, -- Rhombeard Protector (77/323)
        [13208] = 25.4, -- Bleak Howler Armguards (82/323)
        [16718] = 16.4, -- Wildheart Spaulders (53/323)
    },
    ["Ghok Bashguud"] = { -- NPC 9718, 48 kills on Wowhead Forever
        [13203] = 31.2, -- Armswake Cloak (15/48)
        [13204] = 37.5, -- Bashguuder (18/48)
        [13198] = 29.2, -- Hurd Smasher (14/48)
    },
    ["Overlord Wyrmthalak"] = { -- NPC 9568, 265 kills on Wowhead Forever
        [13161] = 16.2, -- Trindlehaven Staff (43/265)
        [13162] = 12.8, -- Reiver Claws (34/265)
        [13163] = 18.1, -- Relentless Scythe (48/265)
        [13164] = 5.7, -- Heart of the Scale (15/265)
        [16679] = 13.6, -- Beaststalker's Mantle (36/265)
        [22321] = 15.5, -- Heart of Wyrmthalak (41/265)
        [13143] = 1.5, -- Mark of the Dragon Lord (4/265)
    },
}

FDJ.DROP_RATES["Upper Blackrock Spire"] = {
    ["Pyroguard Emberseer"] = { -- NPC 9816, 301 kills on Wowhead Forever
        [12905] = 20.6, -- Wildfire Cape (62/301)
        [12926] = 17.9, -- Flaming Band (54/301)
        [12927] = 15.6, -- Truestrike Shoulders (47/301)
        [12929] = 21.9, -- Emberfury Talisman (66/301)
        [16672] = 21.9, -- Gauntlets of Elements (66/301)
        [249520] = 14.3, -- Formula: Molten Heart of the Mountain (43/301)
    },
    ["Solakar Flamewreath"] = { -- NPC 10264, 82 kills on Wowhead Forever
        [12589] = 26.8, -- Dustfeather Sash (22/82)
        [12603] = 18.3, -- Nightbrace Tunic (15/82)
        [12606] = 17.1, -- Crystallized Girdle (14/82)
        [12609] = 14.6, -- Polychromatic Visionwrap (12/82)
        [16695] = 14.6, -- Devout Mantle (12/82)
        [18657] = 7.3, -- Schematic: Hyper-Radiant Flame Reflector (6/82)
    },
    ["Jed Runewatcher"] = { -- NPC 10509, 82 kills on Wowhead Forever
        [12604] = 32.9, -- Starfire Tiara (27/82)
        [12605] = 35.4, -- Serpentine Skuller (29/82)
        [12930] = 29.3, -- Briarwood Reed (24/82)
    },
    ["Goraluk Anvilcrack"] = { -- NPC 10899, 170 kills on Wowhead Forever
        [18048] = 18.2, -- Mastersmith's Hammer (31/170)
        [13498] = 29.4, -- Handcrafted Mastersmith Leggings (50/170)
        [18047] = 17.1, -- Flame Walkers (29/170)
        [13502] = 22.9, -- Handcrafted Mastersmith Girdle (39/170)
        [12834] = 4.1, -- Plans: Arcanite Champion (7/170)
        [12837] = 4.1, -- Plans: Masterwork Stormhammer (7/170)
        [12728] = 1.2, -- Pattern: Invulnerable Mail (2/170)
    },
    ["Gyth"] = { -- NPC 10339, 278 kills on Wowhead Forever
        [12952] = 15.8, -- Gyth's Skull (44/278)
        [12953] = 20.1, -- Dragoneye Coif (56/278)
        [12960] = 19.8, -- Tribal War Feathers (55/278)
        [16669] = 21.6, -- Pauldrons of Elements (60/278)
        [22225] = 19.4, -- Dragonskin Cowl (54/278)
        [12871] = 3.2, -- Chromatic Carapace (9/278)
        [13522] = 4.7, -- Recipe: Flask of Chromatic Resistance (13/278)
    },
    ["Warchief Rend Blackhand"] = { -- NPC 10429, 285 kills on Wowhead Forever
        [12583] = 18.2, -- Blackhand Doomsaw (52/285)
        [12587] = 15.1, -- Eye of Rend (43/285)
        [12590] = 1.4, -- Felstriker (4/285)
        [12935] = 16.1, -- Warmaster Legguards (46/285)
        [12936] = 18.2, -- Battleborn Armbraces (52/285)
        [12939] = 20, -- Dal'Rend's Tribal Guardian (57/285)
        [12940] = 11.6, -- Dal'Rend's Sacred Charge (33/285)
        [16733] = 19.6, -- Spaulders of Valor (56/285)
        [18102] = 18.6, -- Dragonrider Boots (53/285)
        [18103] = 16.1, -- Band of Rumination (46/285)
        [18104] = 21.1, -- Feralsurge Girdle (60/285)
        [22247] = 14.4, -- Faith Healer's Boots (41/285)
    },
    ["The Beast"] = { -- NPC 10430, 220 kills on Wowhead Forever
        [12709] = 21.4, -- Pip's Skinner (47/220)
        [12963] = 13.2, -- Blademaster Leggings (29/220)
        [12964] = 22.7, -- Tristam Legguards (50/220)
        [12965] = 19.1, -- Spiritshroud Leggings (42/220)
        [12966] = 25.5, -- Blackmist Armguards (56/220)
        [12967] = 16.4, -- Bloodmoon Cloak (36/220)
        [12968] = 16.4, -- Frostweaver Cape (36/220)
        [12969] = 20, -- Seeping Willow (44/220)
        [16729] = 18.2, -- Lightforge Spaulders (40/220)
        [22311] = 25, -- Ironweave Boots (55/220)
        [273109] = 7.3, -- Blueprint: Trapper's Workbench (16/220)
    },
    ["Lord Valthalak"] = { -- NPC 16042, no kills on Wowhead Forever yet: Classic Wowhead's numbers
        [22335] = 26.4, -- Lord Valthalak's Staff of Command (130/492)
        [22336] = 24, -- Draconian Aegis of the Legion (118/492)
        [22337] = 26.6, -- Shroud of Domination (131/492)
        [22339] = 25.8, -- Rune Band of Wizardry (127/492)
        [22340] = 23.2, -- Pendant of Celerity (114/492)
        [22342] = 22.2, -- Leggings of Torment (109/492)
        [22343] = 22.6, -- Handguards of Savagery (111/492)
        [22302] = 22.8, -- Ironweave Cowl (112/492)
    },
    ["General Drakkisath"] = { -- NPC 10363, 299 kills on Wowhead Forever
        [13141] = 28.4, -- Tooth of Gnarr (85/299)
        [13098] = 21.1, -- Painweaver Band (63/299)
        [13142] = 23.1, -- Brigam Girdle (69/299)
        [12602] = 21.4, -- Draconian Deflector (64/299)
        [22253] = 20.1, -- Tome of the Lost (60/299)
        [22267] = 18.1, -- Spellweaver's Turban (54/299)
        [22269] = 24.4, -- Shadow Prowler's Cloak (73/299)
        [22268] = 23.7, -- Draconic Infused Emblem (71/299)
        [16730] = 10.4, -- Breastplate of Valor (31/299)
        [16726] = 9.7, -- Lightforge Breastplate (29/299)
        [16674] = 9.4, -- Beaststalker's Tunic (28/299)
        [16666] = 9.4, -- Vest of Elements (28/299)
        [16706] = 9.4, -- Wildheart Vest (28/299)
        [16721] = 11.7, -- Shadowcraft Tunic (35/299)
        [16688] = 10.4, -- Magister's Robes (31/299)
        [16690] = 10, -- Devout Robe (30/299)
        [16700] = 9, -- Dreadmist Robe (27/299)
        [12592] = 1, -- Blackblade of Shahram (3/299)
        [15730] = 6, -- Pattern: Red Dragonscale Breastplate (18/299)
        [13519] = 5.7, -- Recipe: Flask of the Titans (17/299)
    },
}

FDJ.DROP_RATES["Dire Maul: East"] = {
    ["Pusillin"] = { -- NPC 14354, 217 kills on Wowhead Forever
        [18316] = 24.4, -- Obsidian Bauble (53/217)
        [18267] = 88, -- Recipe: Runn Tum Tuber Surprise (191/217)
    },
    ["Zevrim Thornhoof"] = { -- NPC 11490, 255 kills on Wowhead Forever
        [18313] = 22, -- Helm of Awareness (56/255)
        [18323] = 14.5, -- Satyr's Bow (37/255)
        [18319] = 23.5, -- Fervent Helm (60/255)
    },
    ["Hydrospawn"] = { -- NPC 13280, 248 kills on Wowhead Forever
        [18322] = 22.6, -- Waterspout Boots (56/248)
        [18317] = 12.9, -- Tempest Talisman (32/248)
        [18324] = 21, -- Waveslicer (52/248)
        [18305] = 17.7, -- Breakwater Legguards (44/248)
        [18307] = 19.8, -- Riptide Shoes (49/248)
        [7091] = 2.4, -- Pattern: Truefaith Gloves (6/248)
    },
    ["Lethtendris"] = { -- NPC 14327, 232 kills on Wowhead Forever
        [18325] = 22.8, -- Felhide Cap (53/232)
        [18311] = 21.6, -- Quel'dorai Channeling Rod (50/232)
        [18302] = 24.1, -- Band of Vigor (56/232)
    },
    ["Alzzin the Wildshaper"] = { -- NPC 11492, 254 kills on Wowhead Forever
        [18309] = 20.1, -- Gloves of Restoration (51/254)
        [18310] = 21.3, -- Fiendish Machete (54/254)
        [18312] = 15.7, -- Energized Chestplate (40/254)
        [18314] = 14.2, -- Ring of Demonic Guile (36/254)
        [18315] = 17.3, -- Ring of Demonic Potency (44/254)
        [18318] = 17.3, -- Merciful Greaves (44/254)
        [18321] = 18.1, -- Energetic Rod (46/254)
        [18326] = 20.5, -- Razor Gauntlets (52/254)
        [18327] = 16.1, -- Whipvine Cord (41/254)
        [18328] = 19.3, -- Shadewood Cloak (49/254)
    },
}

FDJ.DROP_RATES["Dire Maul: West"] = {
    ["Tendris Warpwood"] = { -- NPC 11489, 207 kills on Wowhead Forever
        [18390] = 21.7, -- Tanglemoss Leggings (45/207)
        [18393] = 25.1, -- Warpwood Binding (52/207)
        [18352] = 23.2, -- Petrified Bark Shield (48/207)
        [18353] = 26.1, -- Stoneflower Staff (54/207)
        [273120] = 9.2, -- Blueprint: Seed Hybridizer (19/207)
    },
    ["Tsu'zee"] = { -- NPC 11467, only 24 kills on Wowhead Forever: Classic Wowhead's numbers (928 kills)
        [18387] = 30.2, -- Brightspark Gloves (246/814)
        [18345] = 32.8, -- Murmuring Ring (267/814)
        [18346] = 29, -- Threadbare Trousers (236/814)
    },
    ["Magister Kalendris"] = { -- NPC 11487, 159 kills on Wowhead Forever
        [18374] = 21.4, -- Flamescarred Shoulders (34/159)
        [18397] = 25.8, -- Elder Magus Pendant (41/159)
        [18371] = 15.1, -- Mindtap Talisman (24/159)
        [18350] = 14.5, -- Amplifying Cloak (23/159)
        [18351] = 18.2, -- Magically Sealed Bracers (29/159)
        [22309] = 22.6, -- Pattern: Big Bag of Enchantment (36/159)
    },
    ["Illyanna Ravenoak"] = { -- NPC 11488, 138 kills on Wowhead Forever
        [18383] = 28.3, -- Force Imbued Gauntlets (39/138)
        [18386] = 14.5, -- Padre's Trousers (20/138)
        [18347] = 23.9, -- Well Balanced Axe (33/138)
        [18349] = 21.7, -- Gauntlets of Accuracy (30/138)
    },
    ["Immol'thar"] = { -- NPC 11496, 122 kills on Wowhead Forever
        [18377] = 18, -- Quickdraw Gloves (22/122)
        [18379] = 13.1, -- Odious Greaves (16/122)
        [18381] = 24.6, -- Evil Eye Pendant (30/122)
        [18391] = 17.2, -- Eyestalk Cord (21/122)
        [18385] = 21.3, -- Robe of Everlasting Night (26/122)
        [18384] = 19.7, -- Bile-etched Spaulders (24/122)
        [18389] = 13.1, -- Cloak of the Cosmos (16/122)
        [18394] = 24.6, -- Demon Howl Wristguards (30/122)
        [18372] = 17.2, -- Blade of the New Moon (21/122)
        [18370] = 18.9, -- Vigilance Charm (23/122)
    },
    ["Lord Hel'nurath"] = { -- NPC 14506, only 3 kills on Wowhead Forever: Classic Wowhead's numbers (1049 kills)
        [18755] = 25.5, -- Xorothian Firestick (200/783)
        [18756] = 24.1, -- Dreadguard's Protector (189/783)
        [18754] = 23.5, -- Fel Hardened Bracers (184/783)
        [18757] = 22.7, -- Diabolic Mantle (178/783)
    },
    ["Prince Tortheldrin"] = { -- NPC 11486, 208 kills on Wowhead Forever
        [18382] = 19.7, -- Fluctuating Cloak (41/208)
        [18395] = 18.3, -- Emerald Flame Ring (38/208)
        [18380] = 17.8, -- Eldritch Reinforced Legplates (37/208)
        [18378] = 21.6, -- Silvermoon Leggings (45/208)
        [18396] = 23.1, -- Mind Carver (48/208)
        [18392] = 23.6, -- Distracting Dagger (49/208)
        [18376] = 14.9, -- Timeworn Mace (31/208)
        [18375] = 20.2, -- Bracers of the Eclipse (42/208)
        [18388] = 14.9, -- Stoneshatter (31/208)
        [18373] = 18.8, -- Chestplate of Tranquility (39/208)
    },
}

FDJ.DROP_RATES["Dire Maul: North"] = {
    ["Guard Mol'dar"] = { -- NPC 14326, 145 kills on Wowhead Forever
        [18494] = 7.6, -- Denwatcher's Shoulders (11/145)
        [18493] = 8.3, -- Bulky Iron Spaulders (12/145)
        [18496] = 6.2, -- Heliotrope Cloak (9/145)
        [18497] = 4.8, -- Sublime Wristguards (7/145)
        [18498] = 6.2, -- Hedgecutter (9/145)
        [18450] = 6.9, -- Robe of Combustion (10/145)
        [18451] = 9, -- Hyena Hide Belt (13/145)
        [18458] = 13.8, -- Modest Armguards (20/145)
        [18459] = 7.6, -- Gallant's Wristguards (11/145)
        [18460] = 7.6, -- Unsophisticated Hand Cannon (11/145)
        [18462] = 6.2, -- Jagged Bone Fist (9/145)
        [18463] = 9, -- Ogre Pocket Knife (13/145)
        [18464] = 4.1, -- Gordok Nose Ring (6/145)
    },
    ["Stomper Kreeg"] = { -- NPC 14322, only 24 kills on Wowhead Forever: Classic Wowhead's numbers (1257 kills)
        [18425] = 56.2, -- Kreeg's Mug (577/1027)
    },
    ["Guard Fengus"] = { -- NPC 14321, 109 kills on Wowhead Forever
        [18450] = 11.9, -- Robe of Combustion (13/109)
        [18451] = 12.8, -- Hyena Hide Belt (14/109)
        [18458] = 13.8, -- Modest Armguards (15/109)
        [18459] = 3.7, -- Gallant's Wristguards (4/109)
        [18460] = 12.8, -- Unsophisticated Hand Cannon (14/109)
        [18462] = 11.9, -- Jagged Bone Fist (13/109)
        [18463] = 16.5, -- Ogre Pocket Knife (18/109)
        [18464] = 15.6, -- Gordok Nose Ring (17/109)
    },
    ["Guard Slip'kik"] = { -- NPC 14323, 122 kills on Wowhead Forever
        [18494] = 4.1, -- Denwatcher's Shoulders (5/122)
        [18493] = 5.7, -- Bulky Iron Spaulders (7/122)
        [18496] = 9, -- Heliotrope Cloak (11/122)
        [18497] = 4.9, -- Sublime Wristguards (6/122)
        [18498] = 7.4, -- Hedgecutter (9/122)
        [18450] = 9, -- Robe of Combustion (11/122)
        [18451] = 5.7, -- Hyena Hide Belt (7/122)
        [18458] = 6.6, -- Modest Armguards (8/122)
        [18459] = 12.3, -- Gallant's Wristguards (15/122)
        [18460] = 4.1, -- Unsophisticated Hand Cannon (5/122)
        [18462] = 16.4, -- Jagged Bone Fist (20/122)
        [18463] = 9.8, -- Ogre Pocket Knife (12/122)
        [18464] = 4.9, -- Gordok Nose Ring (6/122)
    },
    ["Captain Kromcrush"] = { -- NPC 14325, 65 kills on Wowhead Forever
        [18503] = 9.2, -- Kromcrush's Chestplate (6/65)
        [18507] = 24.6, -- Boots of the Full Moon (16/65)
        [18502] = 21.5, -- Monstrous Glaive (14/65)
        [18505] = 35.4, -- Mugger's Belt (23/65)
    },
    ["Cho'Rush the Observer"] = { -- NPC 14324, 66 kills on Wowhead Forever
        [18483] = 42.4, -- Mana Channeling Wand (28/66)
        [18484] = 36.4, -- Cho'Rush's Blade (24/66)
        [18485] = 51.5, -- Observer's Shield (34/66)
        [18490] = 40.9, -- Insightful Hood (27/66)
    },
    ["King Gordok"] = { -- NPC 11501, 182 kills on Wowhead Forever
        [18526] = 22, -- Crown of the Ogre King (40/182)
        [18525] = 20.9, -- Bracers of Prosperity (38/182)
        [18527] = 20.9, -- Harmonious Gauntlets (38/182)
        [18524] = 25.3, -- Leggings of Destruction (46/182)
        [18521] = 22, -- Grimy Metal Boots (40/182)
        [18520] = 20.3, -- Barbarous Blade (37/182)
        [18522] = 22, -- Band of the Ogre King (40/182)
        [18523] = 26.9, -- Brightly Glowing Stone (49/182)
    },
}

FDJ.DROP_RATES["Blackmaw Hold"] = {
    ["Impaan the Imprisoner"] = { -- NPC 247206, 251 kills on Wowhead Forever
        [280057] = 31.5, -- Robes of Dark Summons (79/251)
        [280056] = 34.7, -- Flameslash Crescent (87/251)
        [280058] = 29.1, -- Impish Chain Hood (73/251)
    },
    ["Bonesnout the Unbroken"] = { -- NPC 247198, 221 kills on Wowhead Forever
        [280059] = 35.3, -- Tuskblade Halberd (78/221)
        [280060] = 34.8, -- Lucky Shovelnose Tuft (77/221)
        [280061] = 27.1, -- Spike Crested Bracers (60/221)
    },
    ["Moontouched Wanderer"] = { -- NPC 269104, 68 kills on Wowhead Forever
        [280080] = 61.8, -- Claymore of Two Moons (42/68)
        [280079] = 36.8, -- Lunarlight Robe (25/68)
    },
    ["Tunnelweb Matriarch"] = { -- NPC 250034, 35 kills on Wowhead Forever
        [280085] = 42.9, -- Tunnelweb Pincer (15/35)
        [280086] = 54.3, -- Octofinger Gauntlets (19/35)
    },
    ["Withermaw"] = { -- NPC 247195, 198 kills on Wowhead Forever
        [280063] = 27.8, -- Bloodfur Bulwark (55/198)
        [280062] = 30.8, -- Cloak of the Fleshborer (61/198)
        [280064] = 32.8, -- Withering Grips (65/198)
    },
    ["Elder Shaman Bloodmane"] = { -- NPC 247209, 142 kills on Wowhead Forever
        [280070] = 23.9, -- Veilpiercer Girdle (34/142)
        [280069] = 20.4, -- Shamanic Wristguards (29/142)
        [280068] = 37.3, -- Bloody Claws of Attack (53/142)
    },
    ["Blackmaw Behemoth"] = { -- NPC 247207, 235 kills on Wowhead Forever
        [280065] = 34.9, -- Behemoth Bones (82/235)
        [280066] = 36.6, -- Trousers of the Ebon Giant (86/235)
        [280067] = 25.5, -- Blackmaw Chain Belt (60/235)
    },
    ["Unbound Spirit"] = { -- NPC 247231, 202 kills on Wowhead Forever
        [280072] = 28.2, -- Cowl of Dark Ambition (57/202)
        [280073] = 36.1, -- Burnished Pridescales (73/202)
        [280071] = 32.7, -- Flamebreak Talisman (66/202)
    },
    ["Varrox Bleakhoof"] = { -- NPC 247234, 236 kills on Wowhead Forever
        [280076] = 31.4, -- Horns of Varrox (74/236)
        [280075] = 29.2, -- Bleak Eye Shoulderplates (69/236)
        [280074] = 35.2, -- Scalding Flamehoof (83/236)
    },
}

FDJ.DROP_RATES["Stratholme: Living"] = {
    ["Skul"] = { -- NPC 10393, 28 kills on Wowhead Forever
        [13394] = 17.9, -- Skul's Cold Embrace (5/28)
        [13396] = 32.1, -- Skul's Ghastly Touch (9/28)
        [13395] = 50, -- Skul's Fingerbone Claws (14/28)
    },
    ["Hearthsinger Forresten"] = { -- NPC 10558, 172 kills on Wowhead Forever
        [13378] = 19.2, -- Songbird Blouse (33/172)
        [13379] = 24.4, -- Piccolo of the Flaming Fire (42/172)
        [13384] = 15.7, -- Rainbow Girdle (27/172)
        [13383] = 14, -- Woollies of the Prancing Minstrel (24/172)
        [16682] = 18, -- Magister's Boots (31/172)
    },
    ["The Unforgiven"] = { -- NPC 10516, 245 kills on Wowhead Forever
        [13405] = 19.2, -- Wailing Nightbane Pauldrons (47/245)
        [13404] = 18.8, -- Mask of the Unforgiven (46/245)
        [13408] = 16.3, -- Soul Breaker (40/245)
        [13409] = 20.8, -- Tearfall Bracers (51/245)
        [16717] = 14.7, -- Wildheart Gloves (36/245)
    },
    ["Timmy the Cruel"] = { -- NPC 10808, 183 kills on Wowhead Forever
        [13400] = 16.9, -- Vambraces of the Sadist (31/183)
        [13402] = 18, -- Timmy's Galoshes (33/183)
        [13401] = 22.4, -- The Cruel Hand of Timmy (41/183)
        [13403] = 20.2, -- Grimgore Noose (37/183)
        [16724] = 14.2, -- Lightforge Gauntlets (26/183)
    },
    ["Malor the Zealous"] = { -- NPC 11032, 248 kills on Wowhead Forever
        [276398] = 29.8, -- Scarlet Malice (74/248)
        [276399] = 28.6, -- Plate of the Scarlet Bastion (71/248)
        [276397] = 37.5, -- Hand of the Zealous (93/248)
    },
    ["Postmaster Malown"] = { -- NPC 11143, 61 kills on Wowhead Forever
        [13392] = 18, -- The Postmaster's Seal (11/61)
        [13388] = 29.5, -- The Postmaster's Tunic (18/61)
        [13389] = 23, -- The Postmaster's Trousers (14/61)
        [13391] = 9.8, -- The Postmaster's Treads (6/61)
        [13393] = 9.8, -- Malown's Slam (6/61)
        [13390] = 1.6, -- The Postmaster's Band (1/61)
    },
    ["Ezra Grimm"] = { -- NPC 11058, 163 kills on Wowhead Forever
        [276396] = 30.1, -- Ezra's Seal of Authenticity (49/163)
        [276395] = 30.1, -- Grimm's Packing Gloves (49/163)
        [276394] = 28.2, -- Luxurious Smoking Jacket (46/163)
        [273129] = 91.4, -- Essence of Anarchy (149/163)
        [273117] = 6.1, -- Blueprint: Anarchist's Workbench (10/163)
    },
    ["Cannon Master Willey"] = { -- NPC 10997, 155 kills on Wowhead Forever
        [22403] = 18.1, -- Nacreous Shell Necklace (28/155)
        [13380] = 18.1, -- Willey's Portable Howitzer (28/155)
        [13382] = 16.8, -- Cannonball Runner (26/155)
        [18721] = 18.7, -- Barrage Girdle (29/155)
        [13377] = 83.9, -- Miniature Cannon Balls (130/155)
        [22407] = 12.9, -- Helm of the New Moon (20/155)
        [16708] = 21.9, -- Shadowcraft Spaulders (34/155)
        [13381] = 16.8, -- Master Cannoneer Boots (26/155)
        [22405] = 17.4, -- Mantle of the Scarlet Crusade (27/155)
        [22404] = 23.2, -- Willey's Back Scratcher (36/155)
        [22406] = 17.4, -- Redemption (27/155)
        [12839] = 1.3, -- Plans: Heartseeker (2/155)
    },
    ["Archivist Galford"] = { -- NPC 10811, 245 kills on Wowhead Forever
        [13387] = 18, -- Foresight Girdle (44/245)
        [13386] = 19.6, -- Archivist Cape (48/245)
        [18716] = 13.1, -- Ash Covered Boots (32/245)
        [16692] = 18, -- Devout Gloves (44/245)
        [13385] = 22.9, -- Tome of Knowledge (56/245)
    },
    ["Balnazzar"] = { -- Wowhead counts this loot on Grand Crusader Dathrohan (NPC 10812), 268 kills on Wowhead Forever
        [13353] = 0.75, -- Book of the Dead (2/268)
        [13348] = 19, -- Demonshear (51/268)
        [13358] = 14.9, -- Wyrmtongue Shoulders (40/268)
        [13359] = 16, -- Crown of Tyranny (43/268)
        [18718] = 20.5, -- Grand Crusader's Helm (55/268)
        [18720] = 17.5, -- Shroud of the Nathrezim (47/268)
        [13360] = 19.8, -- Gift of the Elven Magi (53/268)
        [12103] = 17.5, -- Star of Mystaria (47/268)
        [18717] = 21.6, -- Hammer of the Grand Crusader (58/268)
        [13369] = 21.3, -- Fire Striders (57/268)
        [16725] = 16, -- Lightforge Boots (43/268)
        [14512] = 9.7, -- Pattern: Truefaith Vestments (26/268)
        [13520] = 4.9, -- Recipe: Flask of Distilled Wisdom (13/268)
    },
}

FDJ.DROP_RATES["Stratholme: Undead"] = {
    ["Stonespine"] = { -- NPC 10809, 49 kills on Wowhead Forever
        [13399] = 30.6, -- Gargoyle Shredder Talons (15/49)
        [13397] = 38.8, -- Stoneskin Gargoyle Cape (19/49)
        [13954] = 26.5, -- Verdant Footpads (13/49)
    },
    ["Nerub'enkan"] = { -- NPC 10437, 244 kills on Wowhead Forever
        [13529] = 20.1, -- Husk of Nerub'enkan (49/244)
        [13508] = 9.8, -- Eye of Arachnida (24/244)
        [16675] = 18.4, -- Beaststalker's Boots (45/244)
        [18738] = 19.7, -- Carapace Spine Crossbow (48/244)
        [18739] = 15.6, -- Chitinous Plate Legguards (38/244)
        [18740] = 17.6, -- Thuzadin Sash (43/244)
        [13530] = 11.1, -- Fangdrip Runners (27/244)
        [13531] = 9, -- Crypt Stalker Leggings (22/244)
        [13532] = 8.6, -- Darkspinner Claws (21/244)
        [13533] = 13.5, -- Acid-etched Pauldrons (33/244)
    },
    ["Baroness Anastari"] = { -- NPC 10436, 258 kills on Wowhead Forever
        [16704] = 15.1, -- Dreadmist Sandals (39/258)
        [13534] = 22.1, -- Banshee Finger (57/258)
        [18728] = 15.1, -- Anastari Heirloom (39/258)
        [18730] = 20.9, -- Shadowy Laced Handwraps (54/258)
        [18729] = 14, -- Screeching Bow (36/258)
        [13514] = 6.2, -- Wail of the Banshee (16/258)
        [13535] = 11.2, -- Coldtouch Phantom Wraps (29/258)
        [13537] = 10.9, -- Chillhide Bracers (28/258)
        [13538] = 8.1, -- Windshrieker Pauldrons (21/258)
        [13539] = 9.3, -- Banshee's Touch (24/258)
        [273124] = 8.1, -- Blueprint: Loom (21/258)
    },
    ["Maleki the Pallid"] = { -- NPC 10438, 247 kills on Wowhead Forever
        [18737] = 22.7, -- Bone Slicing Hatchet (56/247)
        [16691] = 18.6, -- Devout Sandals (46/247)
        [13524] = 15, -- Skull of Burning Shadows (37/247)
        [18734] = 15, -- Pale Moon Cloak (37/247)
        [18735] = 18.6, -- Maleki's Footwraps (46/247)
        [13525] = 13.4, -- Darkbind Fingers (33/247)
        [13526] = 9.3, -- Flamescarred Girdle (23/247)
        [13527] = 10.1, -- Lavawalker Greaves (25/247)
        [13528] = 8.1, -- Twilight Void Bracers (20/247)
        [12833] = 8.5, -- Plans: Hammer of the Titans (21/247)
    },
    ["Magistrate Barthilas"] = { -- NPC 10435, 302 kills on Wowhead Forever
        [18722] = 14.6, -- Death Grips (44/302)
        [13376] = 18.9, -- Royal Tribunal Cloak (57/302)
        [18725] = 14.2, -- Peacemaker (43/302)
        [18727] = 13.6, -- Crimson Felt Hat (41/302)
        [18726] = 13.2, -- Magistrate's Cuffs (40/302)
        [23198] = 17.9, -- Idol of Brutality (54/302)
    },
    ["Ramstein the Gorger"] = { -- NPC 10439, 230 kills on Wowhead Forever
        [16737] = 13.9, -- Gauntlets of Valor (32/230)
        [13372] = 13.9, -- Slavedriver's Cane (32/230)
        [13373] = 10.9, -- Band of Flesh (25/230)
        [13374] = 9.1, -- Soulstealer Mantle (21/230)
        [13375] = 9.1, -- Crest of Retribution (21/230)
        [13515] = 13.5, -- Ramstein's Lightning Bolts (31/230)
        [18723] = 15.2, -- Animated Chain Necklace (35/230)
    },
    ["Baron Rivendare"] = { -- NPC 10440, 266 kills on Wowhead Forever
        [13340] = 11.7, -- Cape of the Black Baron (31/266)
        [22408] = 15.8, -- Ritssyn's Wand of Bad Mojo (42/266)
        [22409] = 14.7, -- Tunic of the Crescent Moon (39/266)
        [13346] = 15.8, -- Robes of the Exalted (42/266)
        [22412] = 21.4, -- Thuzadin Mantle (57/266)
        [13344] = 14.3, -- Dracorian Gauntlets (38/266)
        [13349] = 13.5, -- Scepter of the Unholy (36/266)
        [13361] = 10.5, -- Skullforge Reaver (28/266)
        [13368] = 11.3, -- Bonescraper (30/266)
        [22410] = 16.2, -- Gauntlets of Deftness (43/266)
        [22411] = 20.7, -- Helm of the Executioner (55/266)
        [13345] = 12.8, -- Seal of Rivendare (34/266)
        [16678] = 9, -- Beaststalker's Pants (24/266)
        [16687] = 8.6, -- Magister's Leggings (23/266)
        [16694] = 7.9, -- Devout Skirt (21/266)
        [16709] = 8.3, -- Shadowcraft Pants (22/266)
        [16668] = 13.2, -- Kilt of Elements (35/266)
        [16699] = 11.3, -- Dreadmist Leggings (30/266)
        [16719] = 10.9, -- Wildheart Kilt (29/266)
        [16728] = 9.4, -- Lightforge Legplates (25/266)
        [16732] = 8.6, -- Legplates of Valor (23/266)
        [13505] = 0.1, -- Runeblade of Baron Rivendare (9/8730)
    },
}

FDJ.DROP_RATES["Scholomance"] = {
    ["Kirtonos the Herald"] = { -- NPC 10506, 250 kills on Wowhead Forever
        [13960] = 23.2, -- Heart of the Fiend (58/250)
        [13967] = 18.4, -- Windreaver Greaves (46/250)
        [13969] = 18.4, -- Loomguard Armbraces (46/250)
        [14024] = 26.8, -- Frightalon (67/250)
        [13957] = 16.4, -- Gargoyle Slashers (41/250)
        [16734] = 20, -- Boots of Valor (50/250)
        [13955] = 24, -- Stoneform Shoulders (60/250)
        [13956] = 19.6, -- Clutch of Andros (49/250)
        [13983] = 23.2, -- Gravestone War Axe (58/250)
    },
    ["Jandice Barov"] = { -- NPC 10503, 200 kills on Wowhead Forever
        [16701] = 20, -- Dreadmist Mantle (40/200)
        [14545] = 12.5, -- Ghostloom Leggings (25/200)
        [14541] = 12, -- Barovian Family Sword (24/200)
        [14548] = 9.5, -- Royal Cap Spaulders (19/200)
        [18690] = 10, -- Wraithplate Leggings (20/200)
        [18689] = 11.5, -- Phantasmal Cloak (23/200)
        [22394] = 14, -- Staff of Metanoia (28/200)
    },
    ["Rattlegore"] = { -- NPC 11622, 254 kills on Wowhead Forever
        [16711] = 16.1, -- Shadowcraft Boots (41/254)
        [14528] = 11, -- Rattlecage Buckler (28/254)
        [14531] = 13.8, -- Frightskull Shaft (35/254)
        [14537] = 12.6, -- Corpselight Greaves (32/254)
        [14538] = 16.5, -- Deadwalker Mantle (42/254)
        [14539] = 11, -- Bone Ring Helm (28/254)
        [18686] = 13.4, -- Bone Golem Shoulders (34/254)
    },
    ["Marduk Blackpool"] = { -- NPC 10433, 90 kills on Wowhead Forever
        [14576] = 7.8, -- Ebon Hilt of Marduk (7/90)
        [18692] = 4.4, -- Death Knight Sabatons (4/90)
    },
    ["Vectus"] = { -- NPC 10432, 93 kills on Wowhead Forever
        [14577] = 5.4, -- Skullsmoke Pants (5/93)
        [18691] = 4.3, -- Dark Advisor's Pendant (4/93)
        [273121] = 5.4, -- Blueprint: Sewing Machine (5/93)
    },
    ["Ras Frostwhisper"] = { -- NPC 10508, 285 kills on Wowhead Forever
        [16689] = 19.3, -- Magister's Mantle (55/285)
        [14487] = 18.9, -- Bonechill Hammer (54/285)
        [14502] = 14, -- Frostbite Girdle (40/285)
        [18694] = 12.3, -- Shadowy Mail Greaves (35/285)
        [18696] = 16.8, -- Intricately Runed Shield (48/285)
        [13952] = 15.8, -- Iceblade Hacker (45/285)
        [14340] = 13.3, -- Freezing Lich Robes (38/285)
        [14522] = 13.3, -- Maelstrom Leggings (38/285)
        [14525] = 13.3, -- Boneclenched Gauntlets (38/285)
        [18693] = 15.8, -- Shivery Handwraps (45/285)
        [13314] = 4.2, -- Alanna's Embrace (12/285)
        [14503] = 16.5, -- Death's Clutch (47/285)
        [18695] = 17.9, -- Spellbound Tome (51/285)
        [13521] = 4.6, -- Recipe: Flask of Supreme Power (13/285)
        [273112] = 2.5, -- Blueprint: Alchemy Laboratory (7/285)
    },
    ["Instructor Malicia"] = { -- NPC 10505, 253 kills on Wowhead Forever
        [16710] = 4, -- Shadowcraft Bracers (10/253)
        [23201] = 1.2, -- Libram of Divinity (3/253)
        [23200] = 3.2, -- Totem of Sustaining (8/253)
        [18680] = 0.4, -- Ancient Bone Bow (1/253)
        [14614] = 1.2, -- Bloodmail Belt (3/253)
        [14616] = 0.79, -- Bloodmail Boots (2/253)
        [14615] = 0.79, -- Bloodmail Gauntlets (2/253)
        [14611] = 1.6, -- Bloodmail Hauberk (4/253)
        [14612] = 0.4, -- Bloodmail Legguards (1/253)
        [18681] = 1.6, -- Burial Shawl (4/253)
        [14637] = 0.79, -- Cadaverous Armor (2/253)
        [14636] = 1.2, -- Cadaverous Belt (3/253)
        [14640] = 0.4, -- Cadaverous Gloves (1/253)
        [14638] = 0.4, -- Cadaverous Leggings (1/253)
        [14641] = 1.2, -- Cadaverous Walkers (3/253)
        [14624] = 0.79, -- Deathbone Chestplate (2/253)
        [14622] = 0.79, -- Deathbone Gauntlets (2/253)
        [14620] = 0.79, -- Deathbone Girdle (2/253)
        [14623] = 0.79, -- Deathbone Legguards (2/253)
        [14621] = 0.4, -- Deathbone Sabatons (1/253)
        [18684] = 0.4, -- Dimly Opalescent Ring (1/253)
        [18682] = 1.2, -- Ghoul Skin Leggings (3/253)
        [18683] = 0.4, -- Hammer of the Vesper (1/253)
        [14631] = 0.79, -- Necropile Boots (2/253)
        [14629] = 2.8, -- Necropile Cuffs (7/253)
        [14632] = 1.6, -- Necropile Leggings (4/253)
        [14633] = 0.4, -- Necropile Mantle (1/253)
        [14626] = 1.2, -- Necropile Robe (3/253)
    },
    ["Doctor Theolen Krastinov"] = { -- NPC 11261, 279 kills on Wowhead Forever
        [16684] = 17.9, -- Magister's Gloves (50/279)
        [14617] = 1.4, -- Sawbones Shirt (4/279)
        [23201] = 10.4, -- Libram of Divinity (29/279)
        [23200] = 6.5, -- Totem of Sustaining (18/279)
        [18680] = 2.2, -- Ancient Bone Bow (6/279)
        [14614] = 1.8, -- Bloodmail Belt (5/279)
        [14616] = 3.9, -- Bloodmail Boots (11/279)
        [14615] = 3.6, -- Bloodmail Gauntlets (10/279)
        [14611] = 2.5, -- Bloodmail Hauberk (7/279)
        [14612] = 2.5, -- Bloodmail Legguards (7/279)
        [18681] = 1.8, -- Burial Shawl (5/279)
        [14637] = 2.2, -- Cadaverous Armor (6/279)
        [14636] = 1.4, -- Cadaverous Belt (4/279)
        [14640] = 3.2, -- Cadaverous Gloves (9/279)
        [14638] = 3.9, -- Cadaverous Leggings (11/279)
        [14641] = 3.2, -- Cadaverous Walkers (9/279)
        [14624] = 1.4, -- Deathbone Chestplate (4/279)
        [14622] = 1.8, -- Deathbone Gauntlets (5/279)
        [14620] = 1.1, -- Deathbone Girdle (3/279)
        [14623] = 2.2, -- Deathbone Legguards (6/279)
        [14621] = 2.2, -- Deathbone Sabatons (6/279)
        [18684] = 2.5, -- Dimly Opalescent Ring (7/279)
        [18682] = 0.36, -- Ghoul Skin Leggings (1/279)
        [18683] = 1.4, -- Hammer of the Vesper (4/279)
        [14631] = 3.6, -- Necropile Boots (10/279)
        [14629] = 3.2, -- Necropile Cuffs (9/279)
        [14632] = 2.5, -- Necropile Leggings (7/279)
        [14633] = 3.2, -- Necropile Mantle (9/279)
        [14626] = 1.8, -- Necropile Robe (5/279)
        [273118] = 2.5, -- Blueprint: Plague Doctor's Laboratory (7/279)
    },
    ["Lorekeeper Polkelt"] = { -- NPC 10901, 228 kills on Wowhead Forever
        [16705] = 21.1, -- Dreadmist Wraps (48/228)
        [23201] = 0.41, -- Libram of Divinity (100/24333)
        [23200] = 0.88, -- Totem of Sustaining (2/228)
        [18680] = 0.88, -- Ancient Bone Bow (2/228)
        [14614] = 0.44, -- Bloodmail Belt (1/228)
        [14616] = 1.3, -- Bloodmail Boots (3/228)
        [14615] = 2.2, -- Bloodmail Gauntlets (5/228)
        [14611] = 1.1, -- Bloodmail Hauberk (264/24333)
        [14612] = 2.2, -- Bloodmail Legguards (5/228)
        [18681] = 1.2, -- Burial Shawl (296/24333)
        [14637] = 1.2, -- Cadaverous Armor (298/24333)
        [14636] = 0.44, -- Cadaverous Belt (1/228)
        [14640] = 0.88, -- Cadaverous Gloves (2/228)
        [14638] = 2.2, -- Cadaverous Leggings (5/228)
        [14641] = 0.44, -- Cadaverous Walkers (1/228)
        [14624] = 1.3, -- Deathbone Chestplate (306/24333)
        [14622] = 2.2, -- Deathbone Gauntlets (5/228)
        [14620] = 1.8, -- Deathbone Girdle (4/228)
        [14623] = 2.2, -- Deathbone Legguards (5/228)
        [14621] = 2.2, -- Deathbone Sabatons (5/228)
        [18684] = 1.2, -- Dimly Opalescent Ring (297/24333)
        [18682] = 1.2, -- Ghoul Skin Leggings (295/24333)
        [18683] = 0.88, -- Hammer of the Vesper (2/228)
        [14631] = 0.44, -- Necropile Boots (1/228)
        [14629] = 0.44, -- Necropile Cuffs (1/228)
        [14632] = 2.2, -- Necropile Leggings (5/228)
        [14633] = 2.2, -- Necropile Mantle (5/228)
        [14626] = 0.88, -- Necropile Robe (2/228)
    },
    ["The Ravenian"] = { -- NPC 10507, 268 kills on Wowhead Forever
        [16716] = 3.4, -- Wildheart Belt (9/268)
        [23201] = 0.75, -- Libram of Divinity (2/268)
        [23200] = 2.6, -- Totem of Sustaining (7/268)
        [18680] = 1.1, -- Ancient Bone Bow (3/268)
        [14614] = 1.1, -- Bloodmail Belt (3/268)
        [14616] = 1.1, -- Bloodmail Boots (3/268)
        [14615] = 1.1, -- Bloodmail Gauntlets (3/268)
        [14611] = 0.37, -- Bloodmail Hauberk (1/268)
        [14612] = 0.37, -- Bloodmail Legguards (1/268)
        [18681] = 0.75, -- Burial Shawl (2/268)
        [14637] = 1.5, -- Cadaverous Armor (4/268)
        [14636] = 2.2, -- Cadaverous Belt (6/268)
        [14640] = 0.37, -- Cadaverous Gloves (1/268)
        [14638] = 1.1, -- Cadaverous Leggings (3/268)
        [14641] = 0.75, -- Cadaverous Walkers (2/268)
        [14624] = 1.1, -- Deathbone Chestplate (3/268)
        [14622] = 1.9, -- Deathbone Gauntlets (5/268)
        [14620] = 0.75, -- Deathbone Girdle (2/268)
        [14623] = 1.5, -- Deathbone Legguards (4/268)
        [14621] = 0.75, -- Deathbone Sabatons (2/268)
        [18684] = 0.37, -- Dimly Opalescent Ring (1/268)
        [18682] = 0.75, -- Ghoul Skin Leggings (2/268)
        [18683] = 1.9, -- Hammer of the Vesper (5/268)
        [14631] = 0.37, -- Necropile Boots (1/268)
        [14629] = 0.37, -- Necropile Cuffs (1/268)
        [14632] = 0.37, -- Necropile Leggings (1/268)
        [14633] = 0.37, -- Necropile Mantle (1/268)
        [14626] = 0.75, -- Necropile Robe (2/268)
    },
    ["Lord Alexei Barov"] = { -- NPC 10504, 218 kills on Wowhead Forever
        [16722] = 2.3, -- Lightforge Bracers (5/218)
        [23201] = 11, -- Libram of Divinity (24/218)
        [23200] = 13.3, -- Totem of Sustaining (29/218)
        [18680] = 2.3, -- Ancient Bone Bow (5/218)
        [14614] = 2.8, -- Bloodmail Belt (6/218)
        [14616] = 2.3, -- Bloodmail Boots (5/218)
        [14615] = 2.3, -- Bloodmail Gauntlets (5/218)
        [14611] = 3.2, -- Bloodmail Hauberk (7/218)
        [14612] = 2.8, -- Bloodmail Legguards (6/218)
        [18681] = 0.46, -- Burial Shawl (1/218)
        [14637] = 3.2, -- Cadaverous Armor (7/218)
        [14636] = 3.7, -- Cadaverous Belt (8/218)
        [14640] = 2.3, -- Cadaverous Gloves (5/218)
        [14638] = 1.8, -- Cadaverous Leggings (4/218)
        [14641] = 4.1, -- Cadaverous Walkers (9/218)
        [14624] = 1.8, -- Deathbone Chestplate (4/218)
        [14622] = 0.92, -- Deathbone Gauntlets (2/218)
        [14620] = 0.92, -- Deathbone Girdle (2/218)
        [14623] = 5.5, -- Deathbone Legguards (12/218)
        [14621] = 1.8, -- Deathbone Sabatons (4/218)
        [18684] = 3.7, -- Dimly Opalescent Ring (8/218)
        [18682] = 2.8, -- Ghoul Skin Leggings (6/218)
        [18683] = 3.7, -- Hammer of the Vesper (8/218)
        [14631] = 2.3, -- Necropile Boots (5/218)
        [14629] = 2.3, -- Necropile Cuffs (5/218)
        [14632] = 2.3, -- Necropile Leggings (5/218)
        [14633] = 3.2, -- Necropile Mantle (7/218)
        [14626] = 1.4, -- Necropile Robe (3/218)
    },
    ["Lady Illucia Barov"] = { -- NPC 10502, 247 kills on Wowhead Forever
        [23201] = 3.2, -- Libram of Divinity (8/247)
        [23200] = 4.9, -- Totem of Sustaining (12/247)
        [18680] = 1.2, -- Ancient Bone Bow (3/247)
        [14614] = 0.4, -- Bloodmail Belt (1/247)
        [14616] = 0.4, -- Bloodmail Boots (1/247)
        [14615] = 0.4, -- Bloodmail Gauntlets (1/247)
        [14612] = 2.4, -- Bloodmail Legguards (6/247)
        [14637] = 0.4, -- Cadaverous Armor (1/247)
        [14636] = 1.2, -- Cadaverous Belt (3/247)
        [14640] = 0.4, -- Cadaverous Gloves (1/247)
        [14638] = 0.81, -- Cadaverous Leggings (2/247)
        [14641] = 0.81, -- Cadaverous Walkers (2/247)
        [14624] = 0.81, -- Deathbone Chestplate (2/247)
        [14622] = 0.81, -- Deathbone Gauntlets (2/247)
        [14620] = 0.4, -- Deathbone Girdle (1/247)
        [14623] = 0.4, -- Deathbone Legguards (1/247)
        [14621] = 0.4, -- Deathbone Sabatons (1/247)
        [18684] = 0.4, -- Dimly Opalescent Ring (1/247)
        [18682] = 0.81, -- Ghoul Skin Leggings (2/247)
        [14631] = 0.4, -- Necropile Boots (1/247)
        [14629] = 0.4, -- Necropile Cuffs (1/247)
        [14632] = 0.4, -- Necropile Leggings (1/247)
        [14633] = 1.2, -- Necropile Mantle (3/247)
        [14626] = 0.4, -- Necropile Robe (1/247)
    },
    ["Darkmaster Gandling"] = { -- NPC 1853, 271 kills on Wowhead Forever
        [16677] = 11.1, -- Beaststalker's Cap (30/271)
        [16686] = 7, -- Magister's Crown (19/271)
        [16731] = 12.5, -- Helm of Valor (34/271)
        [16698] = 10, -- Dreadmist Mask (27/271)
        [16693] = 7.4, -- Devout Crown (20/271)
        [16720] = 7.7, -- Wildheart Cowl (21/271)
        [16707] = 9.2, -- Shadowcraft Cap (25/271)
        [13951] = 12.2, -- Vigorsteel Vambraces (33/271)
        [13398] = 11.8, -- Boots of the Shrieker (32/271)
        [13938] = 14, -- Bonecreeper Stylus (38/271)
        [13944] = 13.3, -- Tombstone Breastplate (36/271)
        [13953] = 11.8, -- Silent Fang (32/271)
        [13964] = 14.8, -- Witchblade (40/271)
        [22433] = 12.2, -- Don Mauricio's Band of Domination (33/271)
        [13937] = 2.6, -- Headmaster's Charge (7/271)
        [16667] = 12.2, -- Coif of Elements (33/271)
        [16727] = 11.8, -- Lightforge Helm (32/271)
        [14514] = 11.1, -- Pattern: Robe of the Void (30/271)
        [13501] = 9.6, -- Recipe: Major Mana Potion (26/271)
    },
    ["Death Knight Darkreaver"] = { -- NPC 14516, 35 kills on Wowhead Forever
        [18758] = 25.7, -- Specter's Blade (9/35)
        [18759] = 20, -- Malicious Axe (7/35)
        [18760] = 14.3, -- Necromantic Band (5/35)
        [18761] = 37.1, -- Oblivion's Touch (13/35)
    },
    ["Kormok"] = { -- NPC 16118, no kills on Wowhead Forever yet: Classic Wowhead's numbers
        [22332] = 14.6, -- Blade of Necromancy (30/205)
        [22303] = 15.6, -- Ironweave Pants (32/205)
        [22326] = 12.2, -- Amalgam's Band (25/205)
        [22331] = 12.7, -- Band of the Steadfast Hero (26/205)
        [22333] = 32.2, -- Hammer of Divine Might (66/205)
    },
}

FDJ.DROP_RATES["Shaper's Terrace"] = {
    ["Titanosaur"] = { -- NPC 253201, 53 kills on Wowhead Forever
        [280009] = 62.3, -- Titanosaur Scale Pendant (33/53)
        [280011] = 45.3, -- Deeproar Cord (24/53)
        [280010] = 50.9, -- Gargantuan Wristguards (27/53)
    },
    ["Venomridge"] = { -- NPC 261813, 136 kills on Wowhead Forever
        [280015] = 33.1, -- Venomvessel Ring (45/136)
        [280017] = 29.4, -- Octoclaw Chain Boots (40/136)
        [280016] = 33.1, -- Spiderchitin Wrap (45/136)
    },
    ["Thunderhoof"] = { -- NPC 261812, 116 kills on Wowhead Forever
        [280018] = 25.9, -- Hammer of Thundering Hooves (30/116)
        [280020] = 35.3, -- Deep Jungle Rifle (41/116)
        [280019] = 32.8, -- Dinofrill Casque (38/116)
    },
    ["Direhorn Matriarch"] = { -- NPC 262127, 128 kills on Wowhead Forever
        [280045] = 27.3, -- Regal Direhorn Drape (35/128)
        [280022] = 39.1, -- Scaleguard Scimitar (50/128)
        [280021] = 33.6, -- Tooth of the Matriarch (43/128)
    },
    ["Cinder"] = { -- NPC 261974, 135 kills on Wowhead Forever
        [280029] = 40.7, -- Cinderedge Crescent (55/135)
        [280028] = 57.8, -- Heartflame Gauntlets (78/135)
    },
    ["Bolt"] = { -- NPC 262081, 126 kills on Wowhead Forever
        [280031] = 49.2, -- Sparklance Wand (62/126)
        [280032] = 50, -- Bolt's Charged Eyeball (63/126)
    },
    ["Snowtalon"] = { -- NPC 262297, 112 kills on Wowhead Forever
        [280026] = 46.4, -- Albinofur Grips (52/112)
        [280027] = 53.6, -- Crownroar Chestplate (60/112)
    },
    ["Vitrix"] = { -- NPC 272561, 100 kills on Wowhead Forever
        [280031] = 16, -- Sparklance Wand (16/100)
        [280028] = 13, -- Heartflame Gauntlets (13/100)
        [280032] = 24, -- Bolt's Charged Eyeball (24/100)
    },
    ["Izha'Rel and Tor'Rel"] = { -- Wowhead counts this loot on Tor'Rel (NPC 261811), 120 kills on Wowhead Forever
        [280014] = 37.5, -- Raptorscale Bulwark (45/120)
        [280013] = 25, -- Frostfang Mail Vest (30/120)
        [280012] = 30, -- Talon of Tor'Rel (36/120)
    },
    ["Nanaya"] = { -- NPC 261809, 130 kills on Wowhead Forever
        [280023] = 37.7, -- Nanaya's Control Spire (49/130)
        [280025] = 29.2, -- Leggings of Curation (38/130)
        [273128] = 94.6, -- Maker's Spark (123/130)
        [280024] = 26.9, -- Legplates of Reinforced Crystal (35/130)
        [273116] = 5.4, -- Blueprint: Arcane Forge (7/130)
    },
}
