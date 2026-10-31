-- Dungeon Journal: Burning Crusade Anniversary raids (phase 1-5).
-- All 9 raid instances and their encounter rosters. Boss loot is an
-- intentionally curated starting subset; no fabricated drop IDs.
local _, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY then return end
FDJ.DB = FDJ.DB or {}
FDJ.ORDER = FDJ.ORDER or {}
FDJ.BOSS_LEVELS = FDJ.BOSS_LEVELS or {}
FDJ.DUNGEON_HOME_ART = FDJ.DUNGEON_HOME_ART or {}
FDJ.DUNGEON_HOME_TEXCOORD = FDJ.DUNGEON_HOME_TEXCOORD or {}
FDJ.DUNGEON_PAGE_ART = FDJ.DUNGEON_PAGE_ART or {}
FDJ.DUNGEON_PAGE_TEXCOORD = FDJ.DUNGEON_PAGE_TEXCOORD or {}
local names = {}
local loads = "Interface\\Glues\\LoadingScreens\\"
local phaseList = {}
-- Karazhan: 10-player raid, phase 1.
FDJ.DB["Karazhan"] = {
  expansion = "raids", isRaid = true,
  raidSize = 10, phase = 1,
  level = "70", location = "Deadwind Pass",
  description = "TBC 10-player raid (Phase 1).",
  quests = {},
  bosses = {
    { name = "Servants' Quarters", customIcon = "Interface\\Icons\\INV_Misc_Key_14", loot = {  } },
    { name = "Attumen the Huntsman", npcID = 15550, loot = { {30480, "Fiery Warhorse's Reins", "Item", 4} } },
    { name = "Moroes", npcID = 15687, loot = { {28528, "Moroes' Lucky Pocket Watch", "Item", 4} } },
    { name = "Maiden of Virtue", npcID = 16457, loot = {  } },
    { name = "Opera Event", customIcon = "Interface\\Icons\\INV_Misc_Book_09", loot = {  } },
    { name = "The Curator", npcID = 15691, loot = {  } },
    { name = "Terestian Illhoof", npcID = 15688, loot = {  } },
    { name = "Shade of Aran", npcID = 16524, loot = {  } },
    { name = "Netherspite", npcID = 15689, loot = {  } },
    { name = "Chess Event", customIcon = "Interface\\Icons\\INV_Misc_ChessPiece_01", loot = {  } },
    { name = "Prince Malchezaar", npcID = 15690, loot = { {28773, "Gorehowl", "Item", 4} } },
    { name = "Nightbane", npcID = 17225, loot = {  } },
  },
  entrance = {mapID = 1430, x = 0.469, y = 0.746, label = "Karazhan Entrance", markerType = "dungeon"},
}
names[#names+1] = "Karazhan"
phaseList["Karazhan"] = 1
FDJ.DUNGEON_HOME_ART["Karazhan"] = loads .. "LoadScreenKarazhan"
FDJ.DUNGEON_PAGE_ART["Karazhan"] = loads .. "LoadScreenKarazhan"
FDJ.DUNGEON_HOME_TEXCOORD["Karazhan"] = {0.02, 0.98, 0.25, 0.81}
FDJ.DUNGEON_PAGE_TEXCOORD["Karazhan"] = {0.02, 0.98, 0.25, 0.81}
FDJ.BOSS_LEVELS["Karazhan"] = {
  ["Attumen the Huntsman"] = "??",
  ["Moroes"] = "??",
  ["Maiden of Virtue"] = "??",
  ["The Curator"] = "??",
  ["Terestian Illhoof"] = "??",
  ["Shade of Aran"] = "??",
  ["Netherspite"] = "??",
  ["Prince Malchezaar"] = "??",
  ["Nightbane"] = "??",
}

-- Gruul's Lair: 25-player raid, phase 1.
FDJ.DB["Gruul's Lair"] = {
  expansion = "raids", isRaid = true,
  raidSize = 25, phase = 1,
  level = "70", location = "Blade's Edge Mountains",
  description = "TBC 25-player raid (Phase 1).",
  quests = {},
  bosses = {
    { name = "High King Maulgar", npcID = 18831, loot = {  } },
    { name = "Gruul the Dragonkiller", npcID = 19044, loot = { {28830, "Dragonspine Trophy", "Item", 4} } },
  },
  entrance = {mapID = 1949, x = 0.684, y = 0.243, label = "Gruul's Lair Entrance", markerType = "dungeon"},
}
names[#names+1] = "Gruul's Lair"
phaseList["Gruul's Lair"] = 1
-- Gruul's Lair's own loading screen if this client ships one, else Outland's.
local gruulArt = loads .. "LoadScreenOutland"
if GetFileIDFromPath then
    for _, file in ipairs({ "LoadScreenGruulsLair", "LoadScreenGruul", "LoadScreenGruulsLairRaid" }) do
        local ok, id = pcall(GetFileIDFromPath, loads .. file)
        if ok and id then gruulArt = loads .. file break end
    end
end
FDJ.DUNGEON_HOME_ART["Gruul's Lair"] = gruulArt
FDJ.DUNGEON_PAGE_ART["Gruul's Lair"] = gruulArt
FDJ.DUNGEON_HOME_TEXCOORD["Gruul's Lair"] = {0.02, 0.98, 0.25, 0.81}
FDJ.DUNGEON_PAGE_TEXCOORD["Gruul's Lair"] = {0.02, 0.98, 0.25, 0.81}
FDJ.BOSS_LEVELS["Gruul's Lair"] = {
  ["High King Maulgar"] = "??",
  ["Gruul the Dragonkiller"] = "??",
}

-- Magtheridon's Lair: 25-player raid, phase 1.
FDJ.DB["Magtheridon's Lair"] = {
  expansion = "raids", isRaid = true,
  raidSize = 25, phase = 1,
  level = "70", location = "Hellfire Peninsula",
  description = "TBC 25-player raid (Phase 1).",
  quests = {},
  bosses = {
    { name = "Magtheridon", npcID = 17257, loot = {  } },
  },
  entrance = {mapID = 1944, x = 0.467, y = 0.526, label = "Magtheridon's Lair Entrance", markerType = "dungeon"},
}
names[#names+1] = "Magtheridon's Lair"
phaseList["Magtheridon's Lair"] = 1
FDJ.DUNGEON_HOME_ART["Magtheridon's Lair"] = loads .. "LoadScreenHellfireCitadelRaid"
FDJ.DUNGEON_PAGE_ART["Magtheridon's Lair"] = loads .. "LoadScreenHellfireCitadelRaid"
FDJ.DUNGEON_HOME_TEXCOORD["Magtheridon's Lair"] = {0.02, 0.98, 0.25, 0.81}
FDJ.DUNGEON_PAGE_TEXCOORD["Magtheridon's Lair"] = {0.02, 0.98, 0.25, 0.81}
FDJ.BOSS_LEVELS["Magtheridon's Lair"] = {
  ["Magtheridon"] = "??",
}

-- Serpentshrine Cavern: 25-player raid, phase 2.
FDJ.DB["Serpentshrine Cavern"] = {
  expansion = "raids", isRaid = true,
  raidSize = 25, phase = 2,
  level = "70", location = "Zangarmarsh",
  description = "TBC 25-player raid (Phase 2).",
  quests = {},
  bosses = {
    { name = "Hydross the Unstable", npcID = 21216, loot = {  } },
    { name = "The Lurker Below", npcID = 21217, loot = {  } },
    { name = "Leotheras the Blind", npcID = 21215, loot = {  } },
    { name = "Fathom-Lord Karathress", npcID = 21214, loot = {  } },
    { name = "Morogrim Tidewalker", npcID = 21213, loot = {  } },
    { name = "Lady Vashj", npcID = 21212, loot = {  } },
  },
  entrance = {mapID = 1946, x = 0.502, y = 0.406, label = "Serpentshrine Cavern Entrance", markerType = "dungeon"},
}
names[#names+1] = "Serpentshrine Cavern"
phaseList["Serpentshrine Cavern"] = 2
FDJ.DUNGEON_HOME_ART["Serpentshrine Cavern"] = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\RaidSSCHome"
FDJ.DUNGEON_PAGE_ART["Serpentshrine Cavern"] = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\RaidSSCHome"
FDJ.DUNGEON_HOME_TEXCOORD["Serpentshrine Cavern"] = {0, 1, 0, 1}
FDJ.DUNGEON_PAGE_TEXCOORD["Serpentshrine Cavern"] = {0, 1, 0, 1}
FDJ.BOSS_LEVELS["Serpentshrine Cavern"] = {
  ["Hydross the Unstable"] = "??",
  ["The Lurker Below"] = "??",
  ["Leotheras the Blind"] = "??",
  ["Fathom-Lord Karathress"] = "??",
  ["Morogrim Tidewalker"] = "??",
  ["Lady Vashj"] = "??",
}

-- Tempest Keep: The Eye: 25-player raid, phase 2.
FDJ.DB["Tempest Keep: The Eye"] = {
  expansion = "raids", isRaid = true,
  raidSize = 25, phase = 2,
  level = "70", location = "Netherstorm",
  description = "TBC 25-player raid (Phase 2).",
  quests = {},
  bosses = {
    { name = "Al'ar", npcID = 19514, loot = {  } },
    { name = "Void Reaver", npcID = 19516, loot = {  } },
    { name = "High Astromancer Solarian", npcID = 18805, loot = {  } },
    { name = "Kael'thas Sunstrider", npcID = 19622, loot = {  } },
  },
  entrance = {mapID = 1953, x = 0.736, y = 0.636, label = "Tempest Keep: The Eye Entrance", markerType = "dungeon"},
}
names[#names+1] = "Tempest Keep: The Eye"
phaseList["Tempest Keep: The Eye"] = 2
FDJ.DUNGEON_HOME_ART["Tempest Keep: The Eye"] = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\RaidTKHome"
FDJ.DUNGEON_PAGE_ART["Tempest Keep: The Eye"] = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\RaidTKHome"
FDJ.DUNGEON_HOME_TEXCOORD["Tempest Keep: The Eye"] = {0, 1, 0, 1}
FDJ.DUNGEON_PAGE_TEXCOORD["Tempest Keep: The Eye"] = {0, 1, 0, 1}
FDJ.BOSS_LEVELS["Tempest Keep: The Eye"] = {
  ["Al'ar"] = "??",
  ["Void Reaver"] = "??",
  ["High Astromancer Solarian"] = "??",
  ["Kael'thas Sunstrider"] = "??",
}

-- Battle for Mount Hyjal: 25-player raid, phase 3.
FDJ.DB["Battle for Mount Hyjal"] = {
  expansion = "raids", isRaid = true,
  raidSize = 25, phase = 3,
  level = "70", location = "Caverns of Time, Tanaris",
  description = "TBC 25-player raid (Phase 3).",
  quests = {},
  bosses = {
    { name = "Rage Winterchill", npcID = 17767, loot = {  } },
    { name = "Anetheron", npcID = 17808, loot = {  } },
    { name = "Kaz'rogal", npcID = 17888, loot = {  } },
    { name = "Azgalor", npcID = 17842, loot = {  } },
    { name = "Archimonde", npcID = 17968, loot = {  } },
  },
  entrance = {mapID = 1446, x = 0.651, y = 0.498, label = "Battle for Mount Hyjal Entrance", markerType = "dungeon"},
}
names[#names+1] = "Battle for Mount Hyjal"
phaseList["Battle for Mount Hyjal"] = 3
FDJ.DUNGEON_HOME_ART["Battle for Mount Hyjal"] = loads .. "LoadScreenHyjal"
FDJ.DUNGEON_PAGE_ART["Battle for Mount Hyjal"] = loads .. "LoadScreenHyjal"
FDJ.DUNGEON_HOME_TEXCOORD["Battle for Mount Hyjal"] = {0.02, 0.98, 0.25, 0.81}
FDJ.DUNGEON_PAGE_TEXCOORD["Battle for Mount Hyjal"] = {0.02, 0.98, 0.25, 0.81}
FDJ.BOSS_LEVELS["Battle for Mount Hyjal"] = {
  ["Rage Winterchill"] = "??",
  ["Anetheron"] = "??",
  ["Kaz'rogal"] = "??",
  ["Azgalor"] = "??",
  ["Archimonde"] = "??",
}

-- Black Temple: 25-player raid, phase 3.
FDJ.DB["Black Temple"] = {
  expansion = "raids", isRaid = true,
  raidSize = 25, phase = 3,
  level = "70", location = "Shadowmoon Valley",
  description = "TBC 25-player raid (Phase 3).",
  quests = {},
  bosses = {
    { name = "High Warlord Naj'entus", npcID = 22887, loot = {  } },
    { name = "Supremus", npcID = 22898, loot = {  } },
    { name = "Shade of Akama", npcID = 22841, loot = {  } },
    { name = "Teron Gorefiend", npcID = 22871, loot = {  } },
    { name = "Reliquary of Souls", customIcon = "Interface\\Icons\\Spell_Shadow_SoulLeech", loot = {  } },
    { name = "Gurtogg Bloodboil", npcID = 22948, loot = {  } },
    { name = "Mother Shahraz", npcID = 22947, loot = {  } },
    { name = "Illidari Council", customIcon = "Interface\\Icons\\Spell_Shadow_DemonForm", loot = {  } },
    { name = "Illidan Stormrage", npcID = 22917, loot = { {32837, "Warglaive of Azzinoth (Main Hand)", "Item", 5}, {32838, "Warglaive of Azzinoth (Off Hand)", "Item", 5} } },
  },
  entrance = {mapID = 1948, x = 0.708, y = 0.464, label = "Black Temple Entrance", markerType = "dungeon"},
}
names[#names+1] = "Black Temple"
phaseList["Black Temple"] = 3
FDJ.DUNGEON_HOME_ART["Black Temple"] = loads .. "LoadScreenBlackTemple"
FDJ.DUNGEON_PAGE_ART["Black Temple"] = loads .. "LoadScreenBlackTemple"
FDJ.DUNGEON_HOME_TEXCOORD["Black Temple"] = {0.02, 0.98, 0.25, 0.81}
FDJ.DUNGEON_PAGE_TEXCOORD["Black Temple"] = {0.02, 0.98, 0.25, 0.81}
FDJ.BOSS_LEVELS["Black Temple"] = {
  ["High Warlord Naj'entus"] = "??",
  ["Supremus"] = "??",
  ["Shade of Akama"] = "??",
  ["Teron Gorefiend"] = "??",
  ["Gurtogg Bloodboil"] = "??",
  ["Mother Shahraz"] = "??",
  ["Illidan Stormrage"] = "??",
}

-- Zul'Aman: 10-player raid, phase 4.
FDJ.DB["Zul'Aman"] = {
  expansion = "raids", isRaid = true,
  raidSize = 10, phase = 4,
  level = "70", location = "Ghostlands",
  description = "TBC 10-player raid (Phase 4).",
  quests = {},
  bosses = {
    { name = "Akil'zon", npcID = 23574, loot = {  } },
    { name = "Nalorakk", npcID = 23576, loot = {  } },
    { name = "Jan'alai", npcID = 23578, loot = {  } },
    { name = "Halazzi", npcID = 23577, loot = {  } },
    { name = "Hex Lord Malacrass", npcID = 24239, loot = {  } },
    { name = "Zul'jin", npcID = 23863, loot = {  } },
  },
  entrance = {mapID = 1942, x = 0.822, y = 0.645, label = "Zul'Aman Entrance", markerType = "dungeon"},
}
names[#names+1] = "Zul'Aman"
phaseList["Zul'Aman"] = 4
FDJ.DUNGEON_HOME_ART["Zul'Aman"] = loads .. "LoadScreenZulAman"
FDJ.DUNGEON_PAGE_ART["Zul'Aman"] = loads .. "LoadScreenZulAman"
FDJ.DUNGEON_HOME_TEXCOORD["Zul'Aman"] = {0.02, 0.98, 0.25, 0.81}
FDJ.DUNGEON_PAGE_TEXCOORD["Zul'Aman"] = {0.02, 0.98, 0.25, 0.81}
FDJ.BOSS_LEVELS["Zul'Aman"] = {
  ["Akil'zon"] = "??",
  ["Nalorakk"] = "??",
  ["Jan'alai"] = "??",
  ["Halazzi"] = "??",
  ["Hex Lord Malacrass"] = "??",
  ["Zul'jin"] = "??",
}

-- Sunwell Plateau: 25-player raid, phase 5.
FDJ.DB["Sunwell Plateau"] = {
  expansion = "raids", isRaid = true,
  raidSize = 25, phase = 5,
  level = "70", location = "Isle of Quel'Danas",
  description = "TBC 25-player raid (Phase 5).",
  quests = {},
  bosses = {
    { name = "Kalecgos", npcID = 24850, loot = {  } },
    { name = "Brutallus", npcID = 24882, loot = {  } },
    { name = "Felmyst", npcID = 25038, customIcon = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\FelmystPortrait.tga", customIconFlipX = true, loot = {  } },
    { name = "Eredar Twins", npcID = 25166, displayID = 23334, loot = {  } }, -- Alythess model, verified on Wowhead TBC
    { name = "M'uru", npcID = 25741, loot = {  } },
    { name = "Kil'jaeden", npcID = 25315, loot = { {34334, "Thori'dal, the Stars' Fury", "Item", 5} } },
  },
  entrance = {mapID = 1957, x = 0.439, y = 0.45, label = "Sunwell Plateau Entrance", markerType = "dungeon"},
}
names[#names+1] = "Sunwell Plateau"
phaseList["Sunwell Plateau"] = 5
FDJ.DUNGEON_HOME_ART["Sunwell Plateau"] = loads .. "LoadScreenSunwell"
FDJ.DUNGEON_PAGE_ART["Sunwell Plateau"] = loads .. "LoadScreenSunwell"
FDJ.DUNGEON_HOME_TEXCOORD["Sunwell Plateau"] = {0.02, 0.98, 0.25, 0.81}
FDJ.DUNGEON_PAGE_TEXCOORD["Sunwell Plateau"] = {0.02, 0.98, 0.25, 0.81}
FDJ.BOSS_LEVELS["Sunwell Plateau"] = {
  ["Kalecgos"] = "??",
  ["Brutallus"] = "??",
  ["Felmyst"] = "??",
  ["M'uru"] = "??",
  ["Kil'jaeden"] = "??",
  ["Eredar Twins"] = "??",
}

FDJ.TBC_RAID_PHASES = phaseList
-- Order is release phase order, keeping other galleries unchanged.
local present = {}
for _, n in ipairs(FDJ.ORDER) do present[n] = true end
for _, n in ipairs(names) do if not present[n] then FDJ.ORDER[#FDJ.ORDER + 1] = n end end
