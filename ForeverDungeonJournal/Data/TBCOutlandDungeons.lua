-- Dungeon Journal: Burning Crusade Classic/Anniversary normal-difficulty 5-man dungeons.
-- Boss/item IDs follow AtlasLootClassic TBC normal-mode datasets; quest IDs follow Wowhead TBC.
-- Heroic-only bosses, heroic-only loot, seasonal encounters, and quest-only boss entries omitted.
local _, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY then return end
FDJ.DB = FDJ.DB or {}
FDJ.ORDER = FDJ.ORDER or {}

FDJ.DB["Hellfire Ramparts"] = {
    level = "60-62",
    location = "Hellfire Peninsula",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Hellfire Citadel; take the southern rampart bridge toward the instance.",
    icon = "Interface\\Icons\\INV_Sword_27",
    quests = {
        { id = 9575, name = "Weaken the Ramparts", objective = "Slay Watchkeeper Gargolmar, Omor the Unscarred, and Vazruden in Hellfire Ramparts.", pickup = "Lieutenant Chadwick", turnin = "Lieutenant Chadwick", faction = "Alliance", level = 59, requires = 59, note = "Finish the first Honor Hold quest sequence before this becomes available.", startMap = { mapID = 1944, x = 0.5660, y = 0.6640, label = "Lieutenant Chadwick - Honor Hold", markerType = "quest" } },
        { id = 9572, name = "Weaken the Ramparts", objective = "Slay Watchkeeper Gargolmar, Omor the Unscarred, and Vazruden in Hellfire Ramparts.", pickup = "Stone Guard Stok'ton", turnin = "Stone Guard Stok'ton", faction = "Horde", level = 59, requires = 59, note = "Finish the initial Thrallmar quests before this becomes available.", startMap = { mapID = 1944, x = 0.5520, y = 0.3600, label = "Stone Guard Stok'ton - Thrallmar", markerType = "quest" } },
        { id = 9587, name = "Dark Tidings", objective = "Bring the Ominous Letter dropped by Vazruden to Danath Trollbane in Honor Hold.", pickup = "Ominous Letter (Vazruden drop), Hellfire Ramparts", turnin = "Danath Trollbane", faction = "Alliance", level = 59, requires = 59 },
        { id = 9588, name = "Dark Tidings", objective = "Bring the Ominous Letter dropped by Vazruden to Nazgrel in Thrallmar.", pickup = "Ominous Letter (Vazruden drop), Hellfire Ramparts", turnin = "Nazgrel", faction = "Horde", level = 59, requires = 59 },
    },
    bosses = {
        { name = "Watchkeeper Gargolmar", npcID = 17306, displayID = 18236, loot = {
            {24024, "Pauldrons of Arcane Rage", "Item", 3},
            {24023, "Bracers of Finesse", "Item", 3},
            {24022, "Scale Leggings of the Skirmisher", "Item", 3},
            {24021, "Light-Touched Breastplate", "Item", 3},
            {24020, "Shadowrend Longblade", "Item", 3},
        } },
        { name = "Omor the Unscarred", npcID = 17308, displayID = 18237, loot = {
            {24090, "Bloodstained Ravager Gauntlets", "Item", 3},
            {24091, "Tenacious Defender", "Item", 3},
            {24073, "Garrote-String Necklace", "Item", 3},
            {24096, "Heartblood Prayer Beads", "Item", 3},
            {24094, "Heart Fire Warhammer", "Item", 3},
            {24069, "Crystalfire Staff", "Item", 3},
        } },
        { name = "Vazruden and Nazan", npcID = 17537, displayID = 18812, loot = {
            {24150, "Mok'Nathal Wildercloak", "Item", 3},
            {24083, "Lifegiver Britches", "Item", 3},
            {24063, "Shifting Sash of Midnight", "Item", 3},
            {24046, "Kilt of Rolling Thunders", "Item", 3},
            {24064, "Ironsole Clompers", "Item", 3},
            {24045, "Band of Renewal", "Item", 3},
            {24154, "Witching Band", "Item", 3},
            {24151, "Mok'Nathal Clan Ring", "Item", 3},
            {24044, "Hellreaver", "Item", 3},
            {24155, "Ursol's Claw", "Item", 3},
        } },
    },
    entrance = { mapID = 1944, x = 0.4770, y = 0.5360, label = "Hellfire Ramparts Entrance", detail = "Hellfire Citadel; take the southern rampart bridge toward the instance.", markerType = "dungeon" },
}

FDJ.DB["The Blood Furnace"] = {
    level = "61-63",
    location = "Hellfire Peninsula",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Hellfire Citadel; ascend the southern siege tower to the elevated Blood Furnace entrance.",
    icon = "Interface\\Icons\\INV_Chest_Chain_13",
    quests = {
        { id = 9607, name = "Heart of Rage", objective = "Enter the Blood Furnace, discover the source of the Legion's unnatural fel orc creation, and report back to Gunny.", pickup = "Gunny", turnin = "Gunny", faction = "Alliance", level = 59, requires = 59, note = "Requires completion of Weaken the Ramparts.", startMap = { mapID = 1944, x = 0.5640, y = 0.6660, label = "Gunny - Honor Hold", markerType = "quest" } },
        { id = 9608, name = "Heart of Rage", objective = "Enter the Blood Furnace, discover the source of the Legion's unnatural fel orc creation, and report back to Caza'rez.", pickup = "Caza'rez", turnin = "Caza'rez", faction = "Horde", level = 59, requires = 59, note = "Requires completion of Weaken the Ramparts.", startMap = { mapID = 1944, x = 0.5500, y = 0.3600, label = "Caza'rez - Thrallmar", markerType = "quest" } },
        { id = 9589, name = "The Blood is Life", objective = "Gather 10 Fel Orc Blood Vials from the fel orcs inside the Blood Furnace.", pickup = "Gunny", turnin = "Gunny", faction = "Alliance", level = 59, requires = 59, note = "Requires Dark Tidings.", startMap = { mapID = 1944, x = 0.5640, y = 0.6660, label = "Gunny - Honor Hold", markerType = "quest" } },
        { id = 9590, name = "The Blood is Life", objective = "Gather 10 Fel Orc Blood Vials from the fel orcs inside the Blood Furnace.", pickup = "Caza'rez", turnin = "Caza'rez", faction = "Horde", level = 59, requires = 59, note = "Requires Dark Tidings.", startMap = { mapID = 1944, x = 0.5500, y = 0.3600, label = "Caza'rez - Thrallmar", markerType = "quest" } },
    },
    bosses = {
        { name = "The Maker", npcID = 17381, displayID = 18369, loot = {
            {24388, "Girdle of the Gale Storm", "Item", 3},
            {24387, "Ironblade Gauntlets", "Item", 3},
            {24385, "Pendant of Battle-Lust", "Item", 3},
            {24386, "Libram of Saints Departed", "Item", 3},
            {24384, "Diamond-Core Sledgemace", "Item", 3},
        } },
        { name = "Broggok", npcID = 17380, displayID = 19372, loot = {
            {24392, "Arcing Bracers", "Item", 3},
            {24393, "Bloody Surgeon's Mitts", "Item", 3},
            {24391, "Kilt of the Night Strider", "Item", 3},
            {24390, "Auslese's Light Channeler", "Item", 3},
            {24389, "Legion Blunderbuss", "Item", 3},
        } },
        { name = "Keli'dan the Breaker", npcID = 17377, displayID = 17153, loot = {
            {24397, "Raiments of Divine Authority", "Item", 3},
            {24395, "Mindfire Waistband", "Item", 3},
            {24398, "Mantle of the Dusk-Dweller", "Item", 3},
            {24396, "Vest of Vengeance", "Item", 3},
            {24394, "Warsong Howling Axe", "Item", 3},
        } },
    },
    entrance = { mapID = 1944, x = 0.4600, y = 0.5180, label = "The Blood Furnace Entrance", detail = "Hellfire Citadel; ascend the southern siege tower to the elevated Blood Furnace entrance.", markerType = "dungeon" },
}

FDJ.DB["The Slave Pens"] = {
    level = "62-64",
    location = "Zangarmarsh",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Coilfang Reservoir; swim down the central tube below Serpent Lake, then take the Slave Pens wing.",
    icon = "Interface\\Icons\\INV_Misc_Fish_14",
    quests = {
        { id = 9738, name = "Lost in Action", objective = "Find the missing Cenarion Expedition expedition members in the Slave Pens and Underbog.", pickup = "Watcher Jhang", turnin = "Watcher Jhang", faction = "Both", level = 62, requires = 62, note = "Two survivors are in the Slave Pens and the others in the Underbog; both instances are required.", startMap = { mapID = 1946, x = 0.5220, y = 0.3600, label = "Watcher Jhang - Coilfang Reservoir", markerType = "quest" } },
    },
    bosses = {
        { name = "Mennu the Betrayer", npcID = 17941, displayID = 17728, loot = {
            {24359, "Princely Reign Leggings", "Item", 3},
            {24357, "Vest of Living Lightning", "Item", 3},
            {24360, "Tracker's Belt", "Item", 3},
            {24356, "Wastewalker Shiv", "Item", 3},
            {24361, "Spellfire Longsword", "Item", 3},
            {29674, "Pattern: Nature Armor Kit", "Item", 2},
        } },
        { name = "Rokmar the Crackler", npcID = 17991, displayID = 17729, loot = {
            {24379, "Bogstrok Scale Cloak", "Item", 3},
            {24376, "Runed Fungalcap", "Item", 3},
            {24378, "Coilfang Hammer of Renewal", "Item", 3},
            {24380, "Calming Spore Reed", "Item", 3},
            {24381, "Coilfang Needler", "Item", 3},
        } },
        { name = "Quagmirran", npcID = 17942, displayID = 18224, loot = {
            {24362, "Spore-Soaked Vaneer", "Item", 3},
            {24365, "Deft Handguards", "Item", 3},
            {24366, "Scorpid-Sting Mantle", "Item", 3},
            {24363, "Unscarred Breastplate", "Item", 3},
            {24364, "Azureplate Greaves", "Item", 3},
        } },
    },
    entrance = { mapID = 1946, x = 0.5020, y = 0.4070, label = "The Slave Pens Entrance", detail = "Coilfang Reservoir; swim down the central tube below Serpent Lake, then take the Slave Pens wing.", markerType = "dungeon" },
}

FDJ.DB["The Underbog"] = {
    level = "63-65",
    location = "Zangarmarsh",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Coilfang Reservoir; swim beneath Serpent Lake and take the upper-right Underbog entrance.",
    icon = "Interface\\Icons\\INV_Misc_Herb_08",
    quests = {
        { id = 9738, name = "Lost in Action", objective = "Locate the missing Cenarion Expedition survivors across Underbog and the Slave Pens.", pickup = "Watcher Jhang", turnin = "Watcher Jhang", faction = "Both", level = 62, requires = 62, note = "Requires visiting both Coilfang dungeon wings.", startMap = { mapID = 1946, x = 0.5220, y = 0.3600, label = "Watcher Jhang - Coilfang Reservoir", markerType = "quest" } },
        { id = 9715, name = "Bring Me A Shrubbery!", objective = "Gather Sanguine Hibiscus flowers in the Underbog for Gzhun'tt in Sporeggar.", pickup = "Gzhun'tt", turnin = "Gzhun'tt", faction = "Both", level = 63, requires = 63, startMap = { mapID = 1946, x = 0.1940, y = 0.5000, label = "Gzhun'tt - Sporeggar", markerType = "quest" } },
        { id = 9717, name = "Oh, It's On!", objective = "Collect one Underspore Frond from the enormous Underspore plant behind Hungarfen and return it to T'shu.", pickup = "T'shu", turnin = "T'shu", faction = "Both", level = 63, requires = 63, startMap = { mapID = 1946, x = 0.1920, y = 0.4980, label = "T'shu - Sporeggar", markerType = "quest" } },
        { id = 9719, name = "Stalk the Stalker", objective = "Defeat the Black Stalker inside the Underbog and return proof of the kill.", pickup = "Khn'nix", turnin = "Khn'nix", faction = "Both", level = 63, requires = 63, startMap = { mapID = 1946, x = 0.1960, y = 0.4980, label = "Khn'nix - Sporeggar", markerType = "quest" } },
    },
    bosses = {
        { name = "Hungarfen", npcID = 17770, displayID = 17228, loot = {
            {24450, "Manaspark Gloves", "Item", 3},
            {24452, "Starlight Gauntlets", "Item", 3},
            {24451, "Lykul Bloodbands", "Item", 3},
            {24413, "Totem of the Thunderhead", "Item", 3},
            {27631, "Needle Shrike", "Item", 3},
        } },
        { name = "Ghaz'an", npcID = 18105, displayID = 17528, loot = {
            {24459, "Cloak of Healing Rays", "Item", 3},
            {24458, "Studded Girdle of Virtue", "Item", 3},
            {24460, "Talisman of Tenacity", "Item", 3},
            {24462, "Luminous Pearls of Insight", "Item", 3},
            {24461, "Hatebringer", "Item", 3},
        } },
        { name = "Swamplord Musel'ek", npcID = 17826, displayID = 18570, loot = {
            {24454, "Cloak of Enduring Swiftness", "Item", 3},
            {24455, "Tunic of the Nightwatcher", "Item", 3},
            {24457, "Truth Bearer Shoulderguards", "Item", 3},
            {24456, "Greaves of the Iron Guardian", "Item", 3},
            {24453, "Zangartooth Shortblade", "Item", 3},
        } },
        { name = "The Black Stalker", npcID = 17882, displayID = 18194, loot = {
            {24481, "Robes of the Augurer", "Item", 3},
            {24466, "Skulldugger's Leggings", "Item", 3},
            {24465, "Shamblehide Chestguard", "Item", 3},
            {24463, "Pauldrons of Brute Force", "Item", 3},
            {24464, "The Stalker's Fangs", "Item", 3},
        } },
    },
    entrance = { mapID = 1946, x = 0.5020, y = 0.4070, label = "The Underbog Entrance", detail = "Coilfang Reservoir; swim beneath Serpent Lake and take the upper-right Underbog entrance.", markerType = "dungeon" },
}

FDJ.DB["Mana-Tombs"] = {
    level = "64-66",
    location = "Terokkar Forest",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Auchindoun, northern crypt entrance; follow the Ring of Observance to the ethereal wing.",
    icon = "Interface\\Icons\\INV_Misc_Gem_02",
    quests = {
        { id = 10216, name = "Safety Is Job One", objective = "Kill 10 Ethereal Crypt Raiders, 5 Ethereal Sorcerers, 5 Nexus Stalkers and 5 Ethereal Spellbinders. Activate the Ethereal Transporter Control Panel before Shaffar.", pickup = "Artificer Morphalius", turnin = "Ethereal Transporter Control Panel (inside Mana-Tombs)", faction = "Both", level = 63, requires = 63, startMap = { mapID = 1952, x = 0.3940, y = 0.5860, label = "Artificer Morphalius - Auchindoun", markerType = "quest" } },
        { id = 10218, name = "Someone Else's Hard Work Pays Off", objective = "Escort Cryo-Engineer Sha'heen through Mana-Tombs and protect him while he retrieves valuable cargo.", pickup = "Cryo-Engineer Sha'heen (inside Mana-Tombs)", turnin = "Cryo-Engineer Sha'heen (inside Mana-Tombs)", faction = "Both", level = 64, requires = 64, note = "Begin the escort after clearing the route." },
        { id = 10165, name = "Undercutting the Competition", objective = "Kill Nexus-Prince Shaffar and recover the target items for the Consortium.", pickup = "Nexus-Prince Haramad", turnin = "Nexus-Prince Haramad", faction = "Both", level = 64, requires = 64, startMap = { mapID = 1952, x = 0.3940, y = 0.5860, label = "Nexus-Prince Haramad - Auchindoun", markerType = "quest" } },
    },
    bosses = {
        { name = "Pandemonius", npcID = 18341, displayID = 19338, loot = {
            {25941, "Boots of the Outlander", "Item", 3},
            {25942, "Faith Bearer's Gauntlets", "Item", 3},
            {25940, "Idol of the Claw", "Item", 3},
            {25943, "Creepjacker", "Item", 3},
            {28166, "Shield of the Void", "Item", 3},
            {25939, "Voidfire Wand", "Item", 3},
        } },
        { name = "Tavarok", npcID = 18343, displayID = 19332, loot = {
            {25945, "Cloak of Revival", "Item", 3},
            {25946, "Nethershade Boots", "Item", 3},
            {25947, "Lightning-Rod Pauldrons", "Item", 3},
            {25952, "Scimitar of the Nexus-Stalkers", "Item", 3},
            {25944, "Shaarde the Greater", "Item", 3},
            {25950, "Staff of Polarities", "Item", 3},
        } },
        { name = "Nexus-Prince Shaffar", npcID = 18344, displayID = 19780, loot = {
            {25957, "Ethereal Boots of the Skystrider", "Item", 3},
            {25955, "Mask of the Howling Storm", "Item", 3},
            {25956, "Nexus-Bracers of Vigor", "Item", 3},
            {25954, "Sigil of Shaffar", "Item", 3},
            {25962, "Longstrider's Loop", "Item", 3},
            {25953, "Ethereal Warp-Bow", "Item", 3},
            {22921, "Recipe: Major Frost Protection Potion", "Item", 2},
        } },
    },
    entrance = { mapID = 1952, x = 0.3960, y = 0.5860, label = "Mana-Tombs Entrance", detail = "Auchindoun, northern crypt entrance; follow the Ring of Observance to the ethereal wing.", markerType = "dungeon" },
}

FDJ.DB["Auchenai Crypts"] = {
    level = "65-67",
    location = "Terokkar Forest",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Auchindoun; descend to the Auchenai Crypts entrance on the western side of the circular ruin.",
    icon = "Interface\\Icons\\INV_Misc_Bone_03",
    quests = {
        { id = 10164, name = "Everything Will Be Alright", objective = "Defeat Exarch Maladaar and end the torment in the Auchenai Crypts.", pickup = "Greatfather Aldrimus", turnin = "Greatfather Aldrimus", faction = "Both", level = 64, requires = 64, startMap = { mapID = 1952, x = 0.3500, y = 0.6520, label = "Greatfather Aldrimus - Terokkar Forest", markerType = "quest" } },
        { id = 10167, name = "Auchindoun...", objective = "Enter the Auchenai Crypts and speak with the spirit connected to the Auchindoun storyline.", pickup = "A'dal", turnin = "A'dal", faction = "Both", level = 66, requires = 66, note = "Part of the longer Terokkar/Shadowmoon Auchindoun storyline; not a standalone pickup.", startMap = { mapID = 1955, x = 0.5460, y = 0.4460, label = "A'dal - Terrace of Light, Shattrath", markerType = "quest" } },
    },
    bosses = {
        { name = "Shirrak the Dead Watcher", npcID = 18371, displayID = 18916, loot = {
            {27410, "Collar of Command", "Item", 3},
            {27409, "Raven-Heart Headdress", "Item", 3},
            {27408, "Hope Bearer Helm", "Item", 3},
            {26055, "Oculus of the Hidden Eye", "Item", 3},
            {25964, "Shaarde the Lesser", "Item", 3},
        } },
        { name = "Exarch Maladaar", npcID = 18373, displayID = 17715, loot = {
            {27411, "Slippers of Serenity", "Item", 3},
            {27415, "Darkguard Face Mask", "Item", 3},
            {27414, "Mok'Nathal Beast-Mask", "Item", 3},
            {27413, "Ring of the Exarchs", "Item", 3},
            {27416, "Fetish of the Fallen", "Item", 3},
            {27412, "Ironstaff of Regeneration", "Item", 3},
        } },
    },
    entrance = { mapID = 1952, x = 0.3960, y = 0.7160, label = "Auchenai Crypts Entrance", detail = "Auchindoun; descend to the Auchenai Crypts entrance on the western side of the circular ruin.", markerType = "dungeon" },
}

FDJ.DB["Old Hillsbrad Foothills"] = {
    level = "66-68",
    location = "Tanaris",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Caverns of Time, Tanaris. Enter the caverns and follow the passage to Old Hillsbrad; outer marker shows the Caverns entrance.",
    icon = "Interface\\Icons\\INV_Misc_PocketWatch_01",
    quests = {
        { id = 10279, name = "To The Master's Lair", objective = "Travel into the Caverns of Time and speak to the dragon guiding you into the caverns.", pickup = "Andormu", turnin = "Andormu", faction = "Both", level = 66, requires = 66, startMap = { mapID = 1446, x = 0.5840, y = 0.5420, label = "Andormu - Caverns of Time (underground; outer zone marker)", markerType = "quest" } },
        { id = 10277, name = "The Caverns of Time", objective = "Follow the Caverns of Time escort tour and learn about the disturbances in the timeways.", pickup = "Andormu", turnin = "Andormu", faction = "Both", level = 66, requires = 66, startMap = { mapID = 1446, x = 0.5840, y = 0.5420, label = "Andormu - Caverns of Time (underground; outer zone marker)", markerType = "quest" } },
        { id = 10282, name = "Old Hillsbrad", objective = "Enter Old Hillsbrad Foothills and speak to Erozion inside the instance.", pickup = "Andormu", turnin = "Erozion (inside Old Hillsbrad)", faction = "Both", level = 66, requires = 66, note = "Requires The Caverns of Time.", startMap = { mapID = 1446, x = 0.5840, y = 0.5420, label = "Andormu - Caverns of Time (underground; outer zone marker)", markerType = "quest" } },
        { id = 10283, name = "Taretha's Diversion", objective = "Burn the barracks in Durnholde Keep to distract the guards before freeing Thrall.", pickup = "Erozion (inside Old Hillsbrad)", turnin = "Thrall (inside Durnholde)", faction = "Both", level = 66, requires = 66, note = "Use the Incendiary Bombs on the marked barrels; free Thrall after the diversion." },
        { id = 10284, name = "Escape from Durnholde", objective = "Escort Thrall out of Durnholde, through Tarren Mill and to Taretha; defeat Epoch Hunter.", pickup = "Thrall (inside Durnholde)", turnin = "Erozion (inside Old Hillsbrad)", faction = "Both", level = 66, requires = 66, note = "Clear the escort path before starting the event." },
        { id = 10285, name = "Return to Andormu", objective = "Report the successful rescue of Thrall to Andormu in the Caverns of Time.", pickup = "Erozion (inside Old Hillsbrad)", turnin = "Andormu", faction = "Both", level = 66, requires = 66 },
    },
    bosses = {
        { name = "Lieutenant Drake", npcID = 17848, displayID = 17386, loot = {
            {27423, "Cloak of Impulsiveness", "Item", 3},
            {27418, "Stormreaver Shadow-Kilt", "Item", 3},
            {27417, "Ravenwing Pauldrons", "Item", 3},
            {27420, "Uther's Ceremonial Warboots", "Item", 3},
            {27436, "Iron Band of the Unbreakable", "Item", 3},
        } },
        { name = "Captain Skarloc", npcID = 17862, displayID = 17387, loot = {
            {27428, "Stormfront Gauntlets", "Item", 3},
            {27430, "Scaled Greaves of Patience", "Item", 3},
            {27427, "Durotan's Battle Harness", "Item", 3},
            {27424, "Amani Venom-Axe", "Item", 3},
            {27426, "Northshire Battlemace", "Item", 3},
            {22927, "Recipe: Ironshield Potion", "Item", 2},
        } },
        { name = "Epoch Hunter", npcID = 18096, displayID = 19135, loot = {
            {24173, "Design: Circlet of Arcane Might", "Item", 2},
            {27433, "Pauldrons of Sufferance", "Item", 3},
            {27434, "Mantle of Perenolde", "Item", 3},
            {27440, "Diamond Prism of Recurrence", "Item", 3},
            {27432, "Broxigar's Ring of Valor", "Item", 3},
            {27431, "Time-Shifted Dagger", "Item", 3},
        } },
    },
    entrance = { mapID = 1446, x = 0.6450, y = 0.5000, label = "Old Hillsbrad Foothills Entrance", detail = "Caverns of Time, Tanaris. Enter the caverns and follow the passage to Old Hillsbrad; outer marker shows the Caverns entrance.", markerType = "dungeon" },
}

FDJ.DB["Sethekk Halls"] = {
    level = "67-69",
    location = "Terokkar Forest",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Auchindoun; Sethekk Halls is reached on the eastern side of the ring.",
    icon = "Interface\\Icons\\INV_Feather_15",
    quests = {
        { id = 10097, name = "Brother Against Brother", objective = "Find and free Isfar's brother, Lakka, who is held prisoner in Sethekk Halls.", pickup = "Isfar", turnin = "Isfar", faction = "Both", level = 65, requires = 65, startMap = { mapID = 1952, x = 0.3940, y = 0.5860, label = "Isfar - Auchindoun", markerType = "quest" } },
        { id = 10098, name = "Terokk's Legacy", objective = "Recover Terokk's Mask, Terokk's Quill, and the Saga of Terokk from within Sethekk Halls.", pickup = "Isfar", turnin = "Isfar", faction = "Both", level = 65, requires = 65, startMap = { mapID = 1952, x = 0.3940, y = 0.5860, label = "Isfar - Auchindoun", markerType = "quest" } },
    },
    bosses = {
        { name = "Darkweaver Syth", npcID = 18472, displayID = 20599, loot = {
            {27919, "Light-Woven Slippers", "Item", 3},
            {27914, "Moonstrider Boots", "Item", 3},
            {27915, "Sky-Hunter Swift Boots", "Item", 3},
            {27918, "Bands of Syth", "Item", 3},
            {27917, "Libram of the Eternal Rest", "Item", 3},
            {27916, "Sethekk Feather-Darts", "Item", 3},
            {24160, "Design: Khorium Inferno Band", "Item", 2},
        } },
        { name = "Talon King Ikiss", npcID = 18473, displayID = 18636, loot = {
            {27946, "Avian Cloak of Feathers", "Item", 3},
            {27981, "Sethekk Oracle Cloak", "Item", 3},
            {27985, "Deathforge Girdle", "Item", 3},
            {27925, "Ravenclaw Band", "Item", 3},
            {27980, "Terokk's Nightmace", "Item", 3},
            {27986, "Crow Wing Reaper", "Item", 3},
            {27948, "Trousers of Oblivion", "Item", 3},
            {27838, "Incanter's Trousers", "Item", 3},
            {27875, "Hallowed Trousers", "Item", 3},
            {27776, "Shoulderpads of Assassination", "Item", 3},
            {27936, "Greaves of Desolation", "Item", 3},
        } },
    },
    entrance = { mapID = 1952, x = 0.3960, y = 0.7160, label = "Sethekk Halls Entrance", detail = "Auchindoun; Sethekk Halls is reached on the eastern side of the ring.", markerType = "dungeon" },
}

FDJ.DB["The Shattered Halls"] = {
    level = "69-70",
    location = "Hellfire Peninsula",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Hellfire Citadel, northern battlements. The entrance gate normally requires the Shattered Halls Key.",
    icon = "Interface\\Icons\\INV_Axe_39",
    quests = {
        { id = 9492, name = "Turning the Tide", objective = "Slay Warchief Kargath Bladefist in the Shattered Halls.", pickup = "Force Commander Danath Trollbane", turnin = "Force Commander Danath Trollbane", faction = "Alliance", level = 67, requires = 67, startMap = { mapID = 1944, x = 0.5660, y = 0.6660, label = "Danath Trollbane - Honor Hold", markerType = "quest" } },
        { id = 9495, name = "The Will of the Warchief", objective = "Slay Warchief Kargath Bladefist and recover his Fist of Kargath.", pickup = "Nazgrel", turnin = "Nazgrel", faction = "Horde", level = 67, requires = 67, startMap = { mapID = 1944, x = 0.5500, y = 0.3600, label = "Nazgrel - Thrallmar", markerType = "quest" } },
        { id = 9493, name = "Pride of the Fel Horde", objective = "Kill the required fel orcs inside the Shattered Halls.", pickup = "Field Commander Romus", turnin = "Field Commander Romus", faction = "Alliance", level = 66, requires = 66, startMap = { mapID = 1944, x = 0.5680, y = 0.6260, label = "Field Commander Romus - Honor Hold", markerType = "quest" } },
        { id = 9496, name = "Pride of the Fel Horde", objective = "Kill the required fel orcs inside the Shattered Halls.", pickup = "Shadow Hunter Ty'jin", turnin = "Shadow Hunter Ty'jin", faction = "Horde", level = 66, requires = 66, startMap = { mapID = 1944, x = 0.5500, y = 0.3620, label = "Shadow Hunter Ty'jin - Thrallmar", markerType = "quest" } },
        { id = 10670, name = "Tear of the Earthmother", objective = "Retrieve the Tear of the Earthmother from Warbringer O'mrogg in the Shattered Halls.", pickup = "David Wayne", turnin = "David Wayne", faction = "Both", level = 67, requires = 67, startMap = { mapID = 1952, x = 0.7740, y = 0.3860, label = "David Wayne - Wayne's Refuge", markerType = "quest" } },
    },
    bosses = {
        { name = "Grand Warlock Nethekurse", npcID = 16807, displayID = 16628, loot = {
            {24312, "Pattern: Spellstrike Hood", "Item", 2},
            {27519, "Cloak of Malice", "Item", 3},
            {27517, "Bands of Nethekurse", "Item", 3},
            {27521, "Telaari Hunting Girdle", "Item", 3},
            {27520, "Greathelm of the Unbreakable", "Item", 3},
            {27518, "Ivory Idol of the Moongoddess", "Item", 3},
        } },
        { name = "Warbringer O'mrogg", npcID = 16809, displayID = 18031, loot = {
            {27525, "Jeweled Boots of Sanctification", "Item", 3},
            {27868, "Runesong Dagger", "Item", 3},
            {27524, "Firemaul of Destruction", "Item", 3},
            {27526, "Skyfire Hawk-Bow", "Item", 3},
            {30829, "Tear of the Earthmother", "Item", 3},
            {27802, "Tidefury Shoulderguards", "Item", 3},
        } },
        { name = "Warchief Kargath Bladefist", npcID = 16808, displayID = 19799, loot = {
            {27527, "Greaves of the Shatterer", "Item", 3},
            {27529, "Figurine of the Colossus", "Item", 3},
            {27534, "Hortus' Seal of Brilliance", "Item", 3},
            {27533, "Demonblood Eviscerator", "Item", 3},
            {27538, "Lightsworn Hammer", "Item", 3},
            {27540, "Nexus Torch", "Item", 3},
            {27536, "Hallowed Handwraps", "Item", 3},
            {27537, "Gloves of Oblivion", "Item", 3},
            {27531, "Wastewalker Gloves", "Item", 3},
            {27474, "Beast Lord Handguards", "Item", 3},
            {27528, "Gauntlets of Desolation", "Item", 3},
            {27535, "Gauntlets of the Righteous", "Item", 3},
        } },
    },
    entrance = { mapID = 1944, x = 0.4770, y = 0.5200, label = "The Shattered Halls Entrance", detail = "Hellfire Citadel, northern battlements. The entrance gate normally requires the Shattered Halls Key.", markerType = "dungeon" },
}

FDJ.DB["The Steamvault"] = {
    level = "68-70",
    location = "Zangarmarsh",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Coilfang Reservoir; swim through the Serpent Lake intake pipe. Steamvault entrance is straight ahead.",
    icon = "Interface\\Icons\\INV_Gizmo_01",
    quests = {
        { id = 9763, name = "The Warlord's Hideout", objective = "Locate the entrance to Warlord Kalithresh's chamber inside The Steamvault.", pickup = "Watcher Jhang", turnin = "Watcher Jhang", faction = "Both", level = 67, requires = 67, startMap = { mapID = 1946, x = 0.5220, y = 0.3600, label = "Watcher Jhang - Coilfang Reservoir", markerType = "quest" } },
        { id = 9764, name = "Orders from Lady Vashj", objective = "Deliver the recovered Naga orders to the Cenarion Expedition.", pickup = "Orders from Lady Vashj (drop inside Steamvault)", turnin = "Ysiel Windsinger", faction = "Both", level = 67, requires = 67 },
        { id = 9832, name = "The Second and Third Fragments", objective = "Use the supplied vessel in the Steamvault to recover a fragment of the Karazhan key.", pickup = "Khadgar", turnin = "Khadgar", faction = "Both", level = 68, requires = 68, note = "One of the two key fragments is in Steamvault, the other in Arcatraz; Karazhan attunement chain.", startMap = { mapID = 1955, x = 0.5460, y = 0.4420, label = "Khadgar - Shattrath City", markerType = "quest" } },
        { id = 10667, name = "Underworld Loam", objective = "Collect the loam needed by David Wayne from the Steamvault.", pickup = "David Wayne", turnin = "David Wayne", faction = "Both", level = 67, requires = 67, startMap = { mapID = 1952, x = 0.7740, y = 0.3860, label = "David Wayne - Wayne's Refuge", markerType = "quest" } },
    },
    bosses = {
        { name = "Hydromancer Thespia", npcID = 17797, displayID = 11268, loot = {
            {27789, "Cloak of Whispering Shells", "Item", 3},
            {27787, "Chestguard of No Remorse", "Item", 3},
            {27783, "Moonrage Girdle", "Item", 3},
            {27784, "Scintillating Coral Band", "Item", 3},
            {29673, "Pattern: Frost Armor Kit", "Item", 2},
            {27508, "Incanter's Gloves", "Item", 3},
        } },
        { name = "Mekgineer Steamrigger", npcID = 17796, displayID = 18638, loot = {
            {27793, "Earth Mantle Handwraps", "Item", 3},
            {27790, "Mask of Penance", "Item", 3},
            {27792, "Steam-Hinge Chain of Valor", "Item", 3},
            {27791, "Serpentcrest Life-Staff", "Item", 3},
            {27794, "Recoilless Rocket Ripper X-54", "Item", 3},
            {23887, "Schematic: Rocket Boots Xtreme", "Item", 2},
        } },
        { name = "Warlord Kalithresh", npcID = 17798, displayID = 20235, loot = {
            {24313, "Pattern: Battlecast Hood", "Item", 2},
            {27804, "Devilshark Cape", "Item", 3},
            {27799, "Vermillion Robes of the Dominant", "Item", 3},
            {27795, "Sash of Serpentra", "Item", 3},
            {27806, "Fathomheart Gauntlets", "Item", 3},
            {27805, "Ring of the Silver Hand", "Item", 3},
            {27738, "Incanter's Pauldrons", "Item", 3},
            {27737, "Moonglade Shoulders", "Item", 3},
            {27801, "Beast Lord Mantle", "Item", 3},
            {27510, "Tidefury Gauntlets", "Item", 3},
            {27874, "Beast Lord Leggings", "Item", 3},
            {28203, "Breastplate of the Righteous", "Item", 3},
            {27475, "Gauntlets of the Bold", "Item", 3},
        } },
    },
    entrance = { mapID = 1946, x = 0.5020, y = 0.4070, label = "The Steamvault Entrance", detail = "Coilfang Reservoir; swim through the Serpent Lake intake pipe. Steamvault entrance is straight ahead.", markerType = "dungeon" },
}

FDJ.DB["Shadow Labyrinth"] = {
    level = "69-70",
    location = "Terokkar Forest",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Auchindoun; Shadow Labyrinth door is on the southern side and requires the Shadow Labyrinth Key.",
    icon = "Interface\\Icons\\INV_Misc_Bone_HumanSkull_01",
    quests = {
        { id = 10177, name = "Trouble at Auchindoun", objective = "Report to Field Commander Mahfuun at the Auchindoun entrance.", pickup = "Spymistress Mehlisah Highcrown", turnin = "Field Commander Mahfuun", faction = "Both", level = 68, requires = 68, startMap = { mapID = 1955, x = 0.5060, y = 0.4560, label = "Spymistress Mehlisah Highcrown - Shattrath", markerType = "quest" } },
        { id = 10094, name = "The Codex of Blood", objective = "Find and investigate the Codex of Blood inside Shadow Labyrinth.", pickup = "Field Commander Mahfuun", turnin = "The Codex of Blood (inside Shadow Labyrinth)", faction = "Both", level = 68, requires = 68, note = "Requires Trouble at Auchindoun.", startMap = { mapID = 1952, x = 0.4000, y = 0.7220, label = "Field Commander Mahfuun - Auchindoun", markerType = "quest" } },
        { id = 10095, name = "Into the Heart of the Labyrinth", objective = "Defeat Murmur, the final boss of Shadow Labyrinth.", pickup = "The Codex of Blood (inside Shadow Labyrinth)", turnin = "Field Commander Mahfuun", faction = "Both", level = 68, requires = 68, note = "Requires The Codex of Blood." },
        { id = 10178, name = "Find Spy To'gun", objective = "Locate Spy To'gun inside Shadow Labyrinth.", pickup = "Spy Grik'tha", turnin = "Spy To'gun (inside Shadow Labyrinth)", faction = "Both", level = 68, requires = 68, startMap = { mapID = 1952, x = 0.3950, y = 0.7160, label = "Spy Grik'tha - Auchindoun", markerType = "quest" } },
        { id = 10091, name = "The Soul Devices", objective = "Collect the soul devices found throughout Shadow Labyrinth.", pickup = "Spy To'gun (inside Shadow Labyrinth)", turnin = "Spy To'gun (inside Shadow Labyrinth)", faction = "Both", level = 68, requires = 68, note = "Requires Find Spy To'gun." },
        { id = 10649, name = "The Book of Fel Names", objective = "Collect the Book of Fel Names from Blackheart the Inciter in Shadow Labyrinth.", pickup = "Altruis the Sufferer", turnin = "Altruis the Sufferer", faction = "Both", level = 68, requires = 68, note = "Requires Illidan's Pupil (the Aldor/Scryer storyline).", startMap = { mapID = 1951, x = 0.2760, y = 0.4350, label = "Altruis the Sufferer - Nagrand (approximate area)", markerType = "quest" } },
        { id = 10666, name = "The Lexicon Demonica", objective = "Recover the Lexicon Demonica from Grandmaster Vorpil in Shadow Labyrinth.", pickup = "David Wayne", turnin = "David Wayne", faction = "Both", level = 67, requires = 67, startMap = { mapID = 1952, x = 0.7740, y = 0.3860, label = "David Wayne - Wayne's Refuge", markerType = "quest" } },
        { id = 9831, name = "Entry Into Karazhan", objective = "Recover the First Key Fragment from the arcane container near Murmur in Shadow Labyrinth.", pickup = "Khadgar", turnin = "Khadgar", faction = "Both", level = 68, requires = 68, note = "Karazhan attunement; begins at Archmage Alturus outside Karazhan.", startMap = { mapID = 1955, x = 0.5460, y = 0.4420, label = "Khadgar - Shattrath City", markerType = "quest" } },
    },
    bosses = {
        { name = "Ambassador Hellmaw", npcID = 18731, displayID = 18821, loot = {
            {27889, "Jaedenfire Gloves of Annihilation", "Item", 3},
            {27888, "Dream-Wing Helm", "Item", 3},
            {27884, "Ornate Boots of the Sanctified", "Item", 3},
            {27886, "Idol of the Emerald Queen", "Item", 3},
            {27887, "Platinum Shield of the Valorous", "Item", 3},
            {27885, "Soul-Wand of the Aldor", "Item", 3},
        } },
        { name = "Blackheart the Inciter", npcID = 18667, displayID = 18058, loot = {
            {27892, "Cloak of the Inciter", "Item", 3},
            {27893, "Ornate Leggings of the Venerated", "Item", 3},
            {28134, "Brooch of Heightened Potential", "Item", 3},
            {27891, "Adamantine Figurine", "Item", 3},
            {27890, "Wand of the Netherwing", "Item", 3},
            {25728, "Pattern: Stylin' Purple Hat", "Item", 2},
            {27468, "Moonglade Handwraps", "Item", 3},
        } },
        { name = "Grandmaster Vorpil", npcID = 18732, displayID = 18535, loot = {
            {27897, "Breastplate of Many Graces", "Item", 3},
            {27900, "Jewel of Charismatic Mystique", "Item", 3},
            {27901, "Blackout Truncheon", "Item", 3},
            {27898, "Wrathfire Hand-Cannon", "Item", 3},
            {27775, "Hallowed Pauldrons", "Item", 3},
        } },
        { name = "Murmur", npcID = 18708, displayID = 18839, loot = {
            {24309, "Pattern: Spellstrike Pants", "Item", 2},
            {27902, "Silent Slippers of Meditation", "Item", 3},
            {27912, "Harness of the Deep Currents", "Item", 3},
            {27913, "Whispering Blade of Slaying", "Item", 3},
            {27905, "Greatsword of Horrid Dreams", "Item", 3},
            {27903, "Sonic Spear", "Item", 3},
            {27910, "Silvermoon Crest Shield", "Item", 3},
            {27778, "Spaulders of Oblivion", "Item", 3},
            {28232, "Robe of Oblivion", "Item", 3},
            {28230, "Hallowed Garments", "Item", 3},
            {27908, "Leggings of Assassination", "Item", 3},
            {27909, "Tidefury Kilt", "Item", 3},
            {27803, "Shoulderguards of the Bold", "Item", 3},
        } },
    },
    entrance = { mapID = 1952, x = 0.3960, y = 0.7160, label = "Shadow Labyrinth Entrance", detail = "Auchindoun; Shadow Labyrinth door is on the southern side and requires the Shadow Labyrinth Key.", markerType = "dungeon" },
}

FDJ.DB["The Black Morass"] = {
    level = "70",
    location = "Tanaris",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Caverns of Time, Tanaris. Enter the caverns then travel to the Black Morass portal; outer marker shows Caverns entrance.",
    icon = "Interface\\Icons\\INV_Misc_PocketWatch_02",
    quests = {
        { id = 10296, name = "The Black Morass", objective = "Enter the Black Morass in Caverns of Time and speak to Sa'at.", pickup = "Andormu", turnin = "Sa'at (inside Black Morass)", faction = "Both", level = 66, requires = 66, note = "Requires completing the Old Hillsbrad questline.", startMap = { mapID = 1446, x = 0.5840, y = 0.5420, label = "Andormu - Caverns of Time (underground; outer zone marker)", markerType = "quest" } },
        { id = 10297, name = "The Opening of the Dark Portal", objective = "Protect Medivh as he opens the Dark Portal, keeping the time rifts under control until Aeonus is defeated.", pickup = "Sa'at (inside Black Morass)", turnin = "Sa'at (inside Black Morass)", faction = "Both", level = 66, requires = 66, note = "Protect Medivh until all 18 rifts are sealed." },
        { id = 9836, name = "The Master's Touch", objective = "Speak to Medivh in the Black Morass to have him restore the Master's Key.", pickup = "Khadgar", turnin = "Medivh (inside Black Morass)", faction = "Both", level = 68, requires = 68, note = "Part of Karazhan attunement; requires the assembled key.", startMap = { mapID = 1955, x = 0.5460, y = 0.4420, label = "Khadgar - Shattrath City", markerType = "quest" } },
        { id = 10902, name = "Master of Elixirs", objective = "Bring the required Essences of Infinity from Rift Lords/Rift Keepers in Black Morass and the other alchemy reagents to Lorokeem.", pickup = "Lorokeem", turnin = "Lorokeem", faction = "Both", level = 68, requires = 68, note = "Alchemy specialization; requires sufficient Alchemy skill.", startMap = { mapID = 1955, x = 0.4580, y = 0.2040, label = "Lorokeem - Shattrath City", markerType = "quest" } },
    },
    bosses = {
        { name = "Chrono Lord Deja", npcID = 17879, displayID = 20513, loot = {
            {27988, "Burnoose of Shifting Ages", "Item", 3},
            {27994, "Mantle of Three Terrors", "Item", 3},
            {27995, "Sun-Gilded Shouldercaps", "Item", 3},
            {27993, "Mask of Inner Fire", "Item", 3},
            {27996, "Ring of Spiritual Precision", "Item", 3},
            {27987, "Melmorta's Twilight Longbow", "Item", 3},
            {29675, "Pattern: Arcane Armor Kit", "Item", 2},
        } },
        { name = "Temporus", npcID = 17880, displayID = 19066, loot = {
            {28185, "Khadgar's Kilt of Abjuration", "Item", 3},
            {28186, "Laughing Skull Battle-Harness", "Item", 3},
            {28034, "Hourglass of the Unraveller", "Item", 3},
            {28187, "Star-Heart Lamp", "Item", 3},
            {28184, "Millennium Blade", "Item", 3},
            {28033, "Epoch-Mender", "Item", 3},
        } },
        { name = "Aeonus", npcID = 17881, displayID = 20510, loot = {
            {28206, "Cowl of the Guiltless", "Item", 3},
            {28194, "Primal Surge Bracers", "Item", 3},
            {28207, "Pauldrons of the Crimson Flight", "Item", 3},
            {28190, "Scarab of the Infinite Cycle", "Item", 3},
            {28189, "Latro's Shifting Sword", "Item", 3},
            {28188, "Bloodfire Greatstaff", "Item", 3},
            {28193, "Mana-Etched Crown", "Item", 3},
            {27509, "Handgrips of Assassination", "Item", 3},
            {27873, "Moonglade Pants", "Item", 3},
            {28192, "Helm of Desolation", "Item", 3},
            {27977, "Legplates of the Bold", "Item", 3},
            {27839, "Legplates of the Righteous", "Item", 3},
        } },
    },
    entrance = { mapID = 1446, x = 0.6450, y = 0.5000, label = "The Black Morass Entrance", detail = "Caverns of Time, Tanaris. Enter the caverns then travel to the Black Morass portal; outer marker shows Caverns entrance.", markerType = "dungeon" },
}

FDJ.DB["The Mechanar"] = {
    level = "70",
    location = "Netherstorm",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Tempest Keep; fly to the south-eastern satellite ship, The Mechanar (flying mount required).",
    icon = "Interface\\Icons\\INV_Gizmo_RocketBoot_01",
    quests = {
        { id = 10704, name = "How to Break Into the Arcatraz", objective = "Kill Pathaleon the Calculator and recover the Bottom Shard of the Arcatraz Key.", pickup = "A'dal", turnin = "A'dal", faction = "Both", level = 67, requires = 67, note = "Requires Special Delivery to Shattrath City; the Top Shard comes from Botanica.", startMap = { mapID = 1955, x = 0.5460, y = 0.4460, label = "A'dal - Terrace of Light, Shattrath", markerType = "quest" } },
        { id = 10665, name = "Fresh from the Mechanar", objective = "Retrieve the requested fresh fel-iron/mechanical materials from the Mechanar for David Wayne.", pickup = "David Wayne", turnin = "David Wayne", faction = "Both", level = 67, requires = 67, startMap = { mapID = 1952, x = 0.7740, y = 0.3860, label = "David Wayne - Wayne's Refuge", markerType = "quest" } },
    },
    bosses = {
        { name = "Mechano-Lord Capacitus", npcID = 19219, displayID = 19162, loot = {
            {28256, "Thoriumweave Cloak", "Item", 3},
            {28255, "Lunar-Claw Pauldrons", "Item", 3},
            {28254, "Warp Engineer's Prismatic Chain", "Item", 3},
            {28257, "Hammer of the Penitent", "Item", 3},
            {28253, "Plasma Rat's Hyper-Scythe", "Item", 3},
            {35582, "Schematic: Rocket Boots Xtreme Lite", "Item", 2},
        } },
        { name = "Nethermancer Sepethrea", npcID = 19221, displayID = 19166, loot = {
            {28262, "Jade-Skull Breastplate", "Item", 3},
            {28259, "Cosmic Lifeband", "Item", 3},
            {28260, "Manual of the Nethermancer", "Item", 3},
            {28263, "Stellaris", "Item", 3},
            {28258, "Nethershrike", "Item", 3},
            {22920, "Recipe: Major Fire Protection Potion", "Item", 2},
        } },
        { name = "Pathaleon the Calculator", npcID = 19220, displayID = 20033, loot = {
            {28269, "Baba's Cloak of Arcanistry", "Item", 3},
            {28266, "Molten Earth Kilt", "Item", 3},
            {28265, "Dath'Remar's Ring of Defense", "Item", 3},
            {28288, "Abacus of Violent Odds", "Item", 3},
            {27899, "Mana Wrath", "Item", 3},
            {28267, "Edge of the Cosmos", "Item", 3},
            {28286, "Telescopic Sharprifle", "Item", 3},
            {21907, "Pattern: Arcanoweave Robe", "Item", 2},
            {28278, "Incanter's Cowl", "Item", 3},
            {28202, "Moonglade Robe", "Item", 3},
            {28204, "Tunic of Assassination", "Item", 3},
            {28275, "Beast Lord Helm", "Item", 3},
            {28285, "Helm of the Righteous", "Item", 3},
        } },
    },
    entrance = { mapID = 1953, x = 0.7050, y = 0.6900, label = "The Mechanar Entrance", detail = "Tempest Keep; fly to the south-eastern satellite ship, The Mechanar (flying mount required).", markerType = "dungeon" },
}

FDJ.DB["The Botanica"] = {
    level = "70",
    location = "Netherstorm",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Tempest Keep; fly to the western satellite ship with blue energy, The Botanica (flying mount required).",
    icon = "Interface\\Icons\\INV_Misc_Herb_15",
    quests = {
        { id = 10704, name = "How to Break Into the Arcatraz", objective = "Kill Warp Splinter and recover the Top Shard of the Arcatraz Key.", pickup = "A'dal", turnin = "A'dal", faction = "Both", level = 67, requires = 67, note = "Requires Special Delivery to Shattrath City; the Bottom Shard comes from Mechanar.", startMap = { mapID = 1955, x = 0.5460, y = 0.4460, label = "A'dal - Terrace of Light, Shattrath", markerType = "quest" } },
        { id = 10897, name = "Master of Potions", objective = "Collect Botanist's Field Guide from Botanica and gather the required potions for Lauranna.", pickup = "Lauranna Thar'well", turnin = "Lauranna Thar'well", faction = "Both", level = 68, requires = 68, note = "Alchemy specialization quest.", startMap = { mapID = 1946, x = 0.8020, y = 0.6420, label = "Lauranna Thar'well - Cenarion Refuge", markerType = "quest" } },
        { id = 10257, name = "Capturing the Keystone", objective = "Recover the keystone from the Botanica after defeating the appropriate blood elf gatekeepers.", pickup = "Archmage Vargoth", turnin = "Archmage Vargoth", faction = "Both", level = 67, requires = 67, note = "Requires Finding the Keymaster.", startMap = { mapID = 1953, x = 0.5820, y = 0.8640, label = "Archmage Vargoth - Kirin'Var Village", markerType = "quest" } },
    },
    bosses = {
        { name = "Commander Sarannis", npcID = 17976, displayID = 18929, loot = {
            {28301, "Syrannis' Mystic Sheen", "Item", 3},
            {28304, "Prismatic Mittens of Mending", "Item", 3},
            {28306, "Towering Mantle of the Hunt", "Item", 3},
            {28296, "Libram of the Lightbringer", "Item", 3},
            {28311, "Revenger", "Item", 3},
        } },
        { name = "High Botanist Freywinn", npcID = 17975, displayID = 19045, loot = {
            {28317, "Energis Armwraps", "Item", 3},
            {28318, "Obsidian Clodstompers", "Item", 3},
            {28321, "Enchanted Thorium Torque", "Item", 3},
            {28315, "Stormreaver Warblades", "Item", 3},
            {28316, "Aegis of the Sunbird", "Item", 3},
            {23617, "Plans: Earthpeace Breastplate", "Item", 2},
        } },
        { name = "Thorngrin the Tender", npcID = 17978, displayID = 14416, loot = {
            {24310, "Pattern: Battlecast Pants", "Item", 2},
            {28324, "Gauntlets of Cruel Intention", "Item", 3},
            {28327, "Arcane Netherband", "Item", 3},
            {28323, "Ring of Umbral Doom", "Item", 3},
            {28322, "Runed Dagger of Solace", "Item", 3},
            {28325, "Dreamer's Dragonstaff", "Item", 3},
        } },
        { name = "Laj", npcID = 17980, displayID = 13109, loot = {
            {28328, "Mithril-Bark Cloak", "Item", 3},
            {28338, "Devil-Stitched Leggings", "Item", 3},
            {28340, "Mantle of Autumn", "Item", 3},
            {28339, "Boots of the Shifting Sands", "Item", 3},
            {27739, "Spaulders of the Righteous", "Item", 3},
        } },
        { name = "Warp Splinter", npcID = 17977, displayID = 19438, loot = {
            {24311, "Pattern: Whitemend Hood", "Item", 2},
            {28371, "Netherfury Cape", "Item", 3},
            {28342, "Warp Infused Drape", "Item", 3},
            {28347, "Warpscale Leggings", "Item", 3},
            {28343, "Jagged Bark Pendant", "Item", 3},
            {28370, "Bangle of Endless Blessings", "Item", 3},
            {28345, "Warp Splinter's Thorn", "Item", 3},
            {28367, "Greatsword of Forlorn Visions", "Item", 3},
            {28341, "Warpstaff of Arcanum", "Item", 3},
            {28229, "Incanter's Robe", "Item", 3},
            {28348, "Moonglade Cowl", "Item", 3},
            {28349, "Tidefury Helm", "Item", 3},
            {28228, "Beast Lord Cuirass", "Item", 3},
            {28350, "Warhelm of the Bold", "Item", 3},
        } },
    },
    entrance = { mapID = 1953, x = 0.7150, y = 0.5500, label = "The Botanica Entrance", detail = "Tempest Keep; fly to the western satellite ship with blue energy, The Botanica (flying mount required).", markerType = "dungeon" },
}

FDJ.DB["The Arcatraz"] = {
    level = "70",
    location = "Netherstorm",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Tempest Keep; fly to the upper satellite fortress, The Arcatraz (Arcatraz Key access).",
    icon = "Interface\\Icons\\INV_Misc_Key_04",
    quests = {
        { id = 10882, name = "Harbinger of Doom", objective = "Defeat Harbinger Skyriss in the Arcatraz and report to A'dal.", pickup = "A'dal", turnin = "A'dal", faction = "Both", level = 66, requires = 66, note = "Requires the Arcatraz Key questline.", startMap = { mapID = 1955, x = 0.5460, y = 0.4460, label = "A'dal - Terrace of Light, Shattrath", markerType = "quest" } },
        { id = 9832, name = "The Second and Third Fragments", objective = "Recover the third Karazhan key fragment from its arcane container in the Arcatraz.", pickup = "Khadgar", turnin = "Khadgar", faction = "Both", level = 68, requires = 68, note = "Second fragment is in Steamvault; both required for the Master's Key.", startMap = { mapID = 1955, x = 0.5460, y = 0.4420, label = "Khadgar - Shattrath City", markerType = "quest" } },
        { id = 10705, name = "Seer Udalo", objective = "Find Seer Udalo inside The Arcatraz and learn what happened to him.", pickup = "Akama", turnin = "Akama", faction = "Both", level = 67, requires = 67, note = "Part of Akama's Shadowmoon Valley storyline.", startMap = { mapID = 1948, x = 0.5800, y = 0.4820, label = "Akama - Warden's Cage", markerType = "quest" } },
    },
    bosses = {
        { name = "Zereketh the Unbound", npcID = 20870, displayID = 19882, loot = {
            {28373, "Cloak of Scintillating Auras", "Item", 3},
            {28374, "Mana-Sphere Shoulderguards", "Item", 3},
            {28384, "Outland Striders", "Item", 3},
            {28375, "Rubium War-Girdle", "Item", 3},
            {28372, "Idol of Feral Shadows", "Item", 3},
        } },
        { name = "Dalliah the Doomsayer", npcID = 20885, displayID = 19888, loot = {
            {24308, "Pattern: Whitemend Pants", "Item", 2},
            {28391, "Worldfire Chestguard", "Item", 3},
            {28390, "Thatia's Self-Correcting Gauntlets", "Item", 3},
            {28387, "Lamp of Peaceful Repose", "Item", 3},
            {28392, "Reflex Blades", "Item", 3},
            {28386, "Nether Core's Control Rod", "Item", 3},
        } },
        { name = "Wrath-Scryer Soccothrates", npcID = 20886, displayID = 19977, loot = {
            {28396, "Gloves of the Unbound", "Item", 3},
            {28398, "The Sleeper's Cord", "Item", 3},
            {28394, "Ryngo's Band of Ingenuity", "Item", 3},
            {28393, "Warmaul of Infused Light", "Item", 3},
            {28397, "Emberhawk Crossbow", "Item", 3},
        } },
        { name = "Harbinger Skyriss", npcID = 20912, displayID = 19943, loot = {
            {28406, "Sigil-Laced Boots", "Item", 3},
            {28419, "Choker of Fluid Thought", "Item", 3},
            {28407, "Elementium Band of the Sentry", "Item", 3},
            {28418, "Shiffar's Nexus-Horn", "Item", 3},
            {28412, "Lamp of Peaceful Radiance", "Item", 3},
            {28416, "Hungering Spineripper", "Item", 3},
            {28415, "Hood of Oblivion", "Item", 3},
            {28413, "Hallowed Crown", "Item", 3},
            {28414, "Helm of Assassination", "Item", 3},
            {28231, "Tidefury Chestpiece", "Item", 3},
            {28403, "Doomplate Chestguard", "Item", 3},
            {28205, "Breastplate of the Bold", "Item", 3},
        } },
    },
    entrance = { mapID = 1953, x = 0.7450, y = 0.5750, label = "The Arcatraz Entrance", detail = "Tempest Keep; fly to the upper satellite fortress, The Arcatraz (Arcatraz Key access).", markerType = "dungeon" },
}

FDJ.DB["Magisters' Terrace"] = {
    level = "70",
    location = "Isle of Quel'Danas",
    expansion = "tbc",
    difficulty = "normal",
    description = "Normal-mode TBC 5-player instance. Isle of Quel'Danas; portal up the terrace east of Sun's Reach. Dungeon introduced in the Sunwell phase.",
    icon = "Interface\\Icons\\INV_Misc_Sunwell_01",
    quests = {
        { id = 11488, name = "Magisters' Terrace", objective = "Enter Magisters' Terrace and find the injured blood elf spy Tyrith after the first boss.", pickup = "Exarch Larethor, Shattered Sun Staging Area", turnin = "Tyrith (inside Magisters' Terrace)", faction = "Both", level = 70, requires = 70, note = "Requires the Shattrath referral Crisis at the Sunwell (Aldor) or Duty Calls (Scryers).", startMap = { mapID = 1957, x = 0.4900, y = 0.3020, label = "Exarch Larethor - Shattered Sun Staging Area" } },
        { id = 11500, name = "Wanted: Sisters of Torment", objective = "Kill 4 Sisters of Torment in Magisters' Terrace; return to Nether-Stalker Mah'duun.", pickup = "Nether-Stalker Mah'duun, Lower City, Shattrath", turnin = "Nether-Stalker Mah'duun, Lower City, Shattrath", faction = "Both", level = 70, requires = 70, note = "Daily dungeon quest; available only when this bounty is offered.", startMap = { mapID = 1955, x = 0.7500, y = 0.3700, label = "Nether-Stalker Mah'duun - Lower City" } },
        { id = 11490, name = "The Scryer's Scryer", objective = "Use the scrying orb on the balcony beyond Vexallus and speak to Kalecgos.", pickup = "Tyrith (inside Magisters' Terrace)", turnin = "Kalecgos (inside Magisters' Terrace)", faction = "Both", level = 70, requires = 70, note = "Requires Magisters' Terrace." },
        { id = 11492, name = "Hard to Kill", objective = "Defeat Kael'thas Sunstrider at the end of Magisters' Terrace.", pickup = "Kalecgos (inside Magisters' Terrace)", turnin = "Exarch Larethor, Shattered Sun Staging Area", faction = "Both", level = 70, requires = 70, note = "Take Kael'thas's head to Larethor. The normal-mode chain unlocks heroic access." },
    },
    bosses = {
        { name = "Selin Fireheart", npcID = 24723, displayID = 22642, loot = {
            {34702, "Cloak of Swift Mending", "Item", 3},
            {34697, "Bindings of Raging Fire", "Item", 3},
            {34701, "Leggings of the Betrayed", "Item", 3},
            {34698, "Bracers of the Forest Stalker", "Item", 3},
            {34700, "Gauntlets of Divine Blessings", "Item", 3},
            {34699, "Sun-forged Cleaver", "Item", 3},
        } },
        { name = "Vexallus", npcID = 24744, displayID = 22731, loot = {
            {34708, "Cloak of the Coming Night", "Item", 3},
            {34705, "Bracers of Divine Infusion", "Item", 3},
            {34707, "Boots of Resuscitation", "Item", 3},
            {34704, "Band of Arcane Alacrity", "Item", 3},
            {34706, "Band of Determination", "Item", 3},
            {34703, "Latro's Dancing Blade", "Item", 3},
        } },
        { name = "Priestess Delrissa", npcID = 24560, displayID = 22596, loot = {
            {34792, "Cloak of the Betrayed", "Item", 3},
            {34788, "Duskhallow Mantle", "Item", 3},
            {34791, "Gauntlets of the Tranquil Waves", "Item", 3},
            {34789, "Bracers of Slaughter", "Item", 3},
            {34790, "Battle-mace of the High Priestess", "Item", 3},
            {34783, "Nightstrike", "Item", 3},
            {35756, "Formula: Enchant Cloak - Steelweave", "Item", 2},
        } },
        { name = "Kael'thas Sunstrider", npcID = 24664, displayID = 22906, loot = {
            {34810, "Cloak of Blade Turning", "Item", 3},
            {34808, "Gloves of Arcane Acuity", "Item", 3},
            {34809, "Sunrage Treads", "Item", 3},
            {34799, "Hauberk of the War Bringer", "Item", 3},
            {34807, "Sunstrider Warboots", "Item", 3},
            {34625, "Kharmaa's Ring of Fate", "Item", 3},
            {34793, "Cord of Reconstruction", "Item", 3},
            {34796, "Robes of Summer Flame", "Item", 3},
            {34795, "Helm of Sanctification", "Item", 3},
            {34798, "Band of Celerity", "Item", 3},
            {34794, "Axe of Shattered Dreams", "Item", 3},
            {34797, "Sun-infused Focus Staff", "Item", 3},
            {35504, "Phoenix Hatchling", "Item", 3},
            {35311, "Schematic: Mana Potion Injector", "Item", 2},
            {35304, "Design: Solid Star of Elune", "Item", 2},
            {35294, "Recipe: Elixir of Empowerment", "Item", 2},
        } },
    },
    entrance = { mapID = 1957, x = 0.4770, y = 0.3500, label = "Magisters' Terrace Entrance", detail = "Isle of Quel'Danas; portal up the terrace east of Sun's Reach. Dungeon introduced in the Sunwell phase.", markerType = "dungeon" },
}

-- Append in the standard Normal Mode levelling progression after all Vanilla wings.
local tbcOrder = {
    "Hellfire Ramparts",
    "The Blood Furnace",
    "The Slave Pens",
    "The Underbog",
    "Mana-Tombs",
    "Auchenai Crypts",
    "Old Hillsbrad Foothills",
    "Sethekk Halls",
    "The Shattered Halls",
    "The Steamvault",
    "Shadow Labyrinth",
    "The Black Morass",
    "The Mechanar",
    "The Botanica",
    "The Arcatraz",
    "Magisters' Terrace",
}
local present = {}
for _, name in ipairs(FDJ.ORDER) do present[name] = true end
for _, name in ipairs(tbcOrder) do if not present[name] then FDJ.ORDER[#FDJ.ORDER + 1] = name end end

-- Reuse official TBC 5-player loading screens for the cover gallery and detail header.
local prefix = "Interface\\Glues\\LoadingScreens\\"
for _, entry in ipairs({
    {"Hellfire Ramparts", "LoadScreenHellfireCitadel5Man"},
    {"The Blood Furnace", "LoadScreenHellfireCitadel5Man"},
    {"The Slave Pens", "LoadScreenCoilfang"},
    {"The Underbog", "LoadScreenCoilfang"},
    {"Mana-Tombs", "LoadScreenAuchindoun"},
    {"Auchenai Crypts", "LoadScreenAuchindoun"},
    {"Old Hillsbrad Foothills", "LoadScreenCavernsTime"},
    {"Sethekk Halls", "LoadScreenAuchindoun"},
    {"The Shattered Halls", "LoadScreenHellfireCitadel5Man"},
    {"The Steamvault", "LoadScreenCoilfang"},
    {"Shadow Labyrinth", "LoadScreenAuchindoun"},
    {"The Black Morass", "LoadScreenCavernsTime"},
    {"The Mechanar", "LoadScreenTempestKeep"},
    {"The Botanica", "LoadScreenTempestKeep"},
    {"The Arcatraz", "LoadScreenTempestKeep"},
    {"Magisters' Terrace", "LoadScreenSunwell5Man"},
}) do
    local name, art = entry[1], prefix .. entry[2]
    FDJ.DUNGEON_HOME_ART = FDJ.DUNGEON_HOME_ART or {}
    FDJ.DUNGEON_HOME_TEXCOORD = FDJ.DUNGEON_HOME_TEXCOORD or {}
    FDJ.DUNGEON_PAGE_ART = FDJ.DUNGEON_PAGE_ART or {}
    FDJ.DUNGEON_PAGE_TEXCOORD = FDJ.DUNGEON_PAGE_TEXCOORD or {}
    FDJ.DUNGEON_HOME_ART[name] = art
    FDJ.DUNGEON_HOME_TEXCOORD[name] = {0.02, 0.98, 0.24, 0.82}
    FDJ.DUNGEON_PAGE_ART[name] = art
    FDJ.DUNGEON_PAGE_TEXCOORD[name] = {0.02, 0.98, 0.24, 0.82}
end

-- User-supplied artwork for eleven Outland dungeon covers.
-- WoW-compatible 1024x512 TGA textures replace the shared expansion covers.
-- Other dungeons retain their existing artwork.
-- Apply to both home cards/search previews and the page background.
do
    local media = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\"
    local covers = {
        ["Hellfire Ramparts"] = { "HellfireRampartsHome", {0.01, 0.99, 0.22, 0.83} },
        ["The Blood Furnace"] = { "BloodFurnaceHome", {0.01, 0.99, 0.37, 0.98} },
        ["The Slave Pens"] = { "SlavePensHome", {0.01, 0.99, 0.14, 0.82} },
        ["The Underbog"] = { "UnderbogHome", {0.01, 0.99, 0.14, 0.78} },
        ["Mana-Tombs"] = { "ManaTombsHome", {0.01, 0.99, 0.16, 0.82} },
        ["Auchenai Crypts"] = { "AuchenaiCryptsHome", {0.01, 0.99, 0.16, 0.82} },
        ["Sethekk Halls"] = { "SethekkHallsHome", {0.01, 0.99, 0.16, 0.82} },
        ["The Botanica"] = { "BotanicaHome", {0.01, 0.99, 0.14, 0.82} },
        ["The Mechanar"] = { "MechanarHome", {0.01, 0.99, 0.14, 0.82} },
        ["The Black Morass"] = { "BlackMorassHome", {0.01, 0.99, 0.14, 0.82} },
    }
    for dungeonName, cover in pairs(covers) do
        local texture = media .. cover[1]
        local crop = cover[2]
        FDJ.DUNGEON_HOME_ART[dungeonName] = texture
        FDJ.DUNGEON_HOME_TEXCOORD[dungeonName] = crop
        FDJ.DUNGEON_PAGE_ART[dungeonName] = texture
        FDJ.DUNGEON_PAGE_TEXCOORD[dungeonName] = crop
    end
end

-- Actual pre-requisite chains, with individually resolvable quest detail pages.
FDJ.QUEST_PREREQ_CHAINS = FDJ.QUEST_PREREQ_CHAINS or {}
FDJ.QUEST_PREREQ_DETAILS = FDJ.QUEST_PREREQ_DETAILS or {}
local function chain(finalID, steps)
    FDJ.QUEST_PREREQ_CHAINS[finalID] = {}
    for _, step in ipairs(steps) do
        FDJ.QUEST_PREREQ_CHAINS[finalID][#FDJ.QUEST_PREREQ_CHAINS[finalID]+1] = {id = step[1], name = step[2]}
    end
end
local oldHills = {
 {10279, "To The Master's Lair"}, {10277, "The Caverns of Time"},
 {10282, "Old Hillsbrad"}, {10283, "Taretha's Diversion"},
 {10284, "Escape from Durnholde"}, {10285, "Return to Andormu"}
}
for n=2,#oldHills do
 local seq={}
 for k=1,n do seq[#seq+1]=oldHills[k] end
 chain(oldHills[n][1],seq)
end
chain(10095, {{10177,"Trouble at Auchindoun"},{10094,"The Codex of Blood"},{10095,"Into the Heart of the Labyrinth"}})
chain(10091, {{10178,"Find Spy To'gun"},{10091,"The Soul Devices"}})
chain(9607, {{9575,"Weaken the Ramparts"},{9607,"Heart of Rage"}})
chain(9608, {{9572,"Weaken the Ramparts"},{9608,"Heart of Rage"}})
chain(9589, {{9587,"Dark Tidings"},{9589,"The Blood is Life"}})
chain(9590, {{9588,"Dark Tidings"},{9590,"The Blood is Life"}})
chain(10882, {{10280,"Special Delivery to Shattrath City"},{10704,"How to Break Into the Arcatraz"},{10882,"Harbinger of Doom"}})
chain(10704, {{10280,"Special Delivery to Shattrath City"},{10704,"How to Break Into the Arcatraz"}})
chain(10297, {{10296,"The Black Morass"},{10297,"The Opening of the Dark Portal"}})
chain(11488, {{11488,"Magisters' Terrace"}})
chain(11490, {{11488,"Magisters' Terrace"},{11490,"The Scryer's Scryer"}})
chain(11492, {{11488,"Magisters' Terrace"},{11490,"The Scryer's Scryer"},{11492,"Hard to Kill"}})
-- Quest chain UI should not fall back to placeholder step descriptions.
for _, d in pairs(FDJ.DB) do
 if d.expansion == "tbc" then
  for _, quest in ipairs(d.quests or {}) do
   if quest.id and not FDJ.QUEST_PREREQ_DETAILS[quest.id] then
    FDJ.QUEST_PREREQ_DETAILS[quest.id] = {
      id = quest.id, name = quest.name, objective = quest.objective,
      pickup = quest.pickup, turnin = quest.turnin, startMap = quest.startMap,
      faction = quest.faction, requires = quest.requires, note = quest.note,
    }
   end
  end
 end
end
FDJ.QUEST_PREREQ_DETAILS[10280] = {
 name="Special Delivery to Shattrath City", objective="Deliver the completed Arcatraz security data to A'dal in Shattrath City.",
 pickup="Image of Nexus-Prince Haramad, Netherstorm", turnin="A'dal, Shattrath City",
 startMap={mapID=1953,x=0.325,y=0.645,label="Stormspire area - Netherstorm (approximate)"}
}
