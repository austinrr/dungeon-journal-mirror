-- Conservative wing signatures. IDs are Classic references; exact names also
-- work when Forever hides or replaces IDs. Never infer a wing from a prefix.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end
FDJ.RunLogWingTrash = {
    ["Dire Maul: East"] = {
        [13022] = "Whip Lasher",
        [13276] = "Wildspawn Imp",
        [11461] = "Warpwood Guardian",
        [11462] = "Warpwood Treant",
        [11464] = "Warpwood Tangler",
        [11465] = "Warpwood Stomper",
        [13021] = "Warpwood Crusher",
        [13196] = "Phase Lasher",
        [13197] = "Fel Lash",
        [11451] = "Wildspawn Satyr",
        [11452] = "Wildspawn Rogue",
        [11453] = "Wildspawn Trickster",
        [11454] = "Wildspawn Betrayer",
        [11455] = "Wildspawn Felsworn",
        [11456] = "Wildspawn Shadowstalker",
        [11457] = "Wildspawn Hellcaller",
    },
    ["Dire Maul: West"] = {
        [11458] = "Petrified Treant",
        [11459] = "Ironbark Protector",
        [11469] = "Eldreth Seether",
        [11470] = "Eldreth Sorcerer",
        [11471] = "Eldreth Apparition",
        [11472] = "Eldreth Spirit",
        [11473] = "Eldreth Spectre",
        [11475] = "Eldreth Phantasm",
        [11480] = "Arcane Aberration",
        [11483] = "Mana Remnant",
        [11484] = "Residual Monstrosity",
    },
    ["Dire Maul: North"] = {
        [11441] = "Gordok Brute",
        [11444] = "Gordok Mage-Lord",
        [11445] = "Gordok Captain",
        [11448] = "Gordok Warlock",
        [11450] = "Gordok Reaver",
        [13036] = "Gordok Mastiff",
    },
    ["Scarlet Monastery: Graveyard"] = {
        [4283] = "Scarlet Sentry",
        [4293] = "Scarlet Scryer",
        [4306] = "Scarlet Torturer",
        [4308] = "Unfettered Spirit",
        [6426] = "Anguished Dead",
        [6427] = "Haunting Phantasm",
    },
    ["Scarlet Monastery: Library"] = {
        [4287] = "Scarlet Gallant",
        [4288] = "Scarlet Beastmaster",
        [4291] = "Scarlet Diviner",
        [4296] = "Scarlet Adept",
        [4304] = "Scarlet Tracking Hound",
    },
    ["Scarlet Monastery: Armory"] = {
        [4286] = "Scarlet Soldier",
        [4289] = "Scarlet Evoker",
        [4290] = "Scarlet Guardsman",
        [4292] = "Scarlet Protector",
        [4297] = "Scarlet Conjuror",
    },
    ["Scarlet Monastery: Cathedral"] = {
        [4294] = "Scarlet Sorcerer",
        [4300] = "Scarlet Wizard",
        [4301] = "Scarlet Centurion",
        [4302] = "Scarlet Champion",
        [4303] = "Scarlet Abbot",
    },
    ["Upper Blackrock Spire"] = {
        [9096] = "Rage Talon Dragonspawn",
        [9818] = "Blackhand Summoner",
        [9819] = "Blackhand Veteran",
    },
    -- Stratholme had no signatures: a run (and the tracker) only started
    -- at the first boss kill unless an English room name matched. IDs and
    -- names checked on Wowhead (Nov 2026); mobs found on both sides
    -- (ghouls, skeletons, gargoyles, cadavers, banshees) are left out.
    ["Stratholme: Living"] = {
        [10418] = "Crimson Guardsman",
        [10419] = "Crimson Conjuror",
        [10420] = "Crimson Initiate",
        [10421] = "Crimson Defender",
        [10422] = "Crimson Sorcerer",
        [10423] = "Crimson Priest",
        [10424] = "Crimson Gallant",
        [10425] = "Crimson Battle Mage",
        [10426] = "Crimson Inquisitor",
        [11043] = "Crimson Monk",
        [11054] = "Crimson Rifleman",
        [11032] = "Malor the Zealous",
    },
    ["Stratholme: Undead"] = {
        [10394] = "Black Guard Sentry",
        [10399] = "Thuzadin Acolyte",
        [10412] = "Crypt Crawler",
        [10413] = "Crypt Beast",
        [10416] = "Bile Spewer",
        [10417] = "Venom Belcher",
    },
    ["Lower Blackrock Spire"] = {
        [9197] = "Spirestone Battle Mage",
        [9198] = "Spirestone Mystic",
        [9199] = "Spirestone Enforcer",
        [9200] = "Spirestone Reaver",
        [9201] = "Spirestone Ogre Magus",
        [9239] = "Smolderthorn Mystic",
        [9240] = "Smolderthorn Shadow Priest",
        [9241] = "Smolderthorn Headhunter",
        [9259] = "Firebrand Grunt",
        [9261] = "Firebrand Darkweaver",
        [9264] = "Firebrand Pyromancer",
        -- spiremobs (2.1.4, M 23 Nov 2026, a Discord report: in Lower
        -- Blackrock Spire the tracker only started at the first boss): more
        -- of the Lower side's own mobs, none of them in Upper Blackrock
        -- Spire: the Bloodaxe and Firebrand orcs of Hordemar City, the
        -- Smolderthorn trolls, the Spirestone Warlord, the Skitterweb spiders
        -- (SOURCES.txt, spiremobs).
        [9262] = "Firebrand Invoker",
        [9583] = "Bloodaxe Veteran",
        [9692] = "Bloodaxe Raider",
        [9693] = "Bloodaxe Evoker",
        [9696] = "Bloodaxe Worg",
        [9716] = "Bloodaxe Warmonger",
        [9717] = "Bloodaxe Summoner",
        [9265] = "Smolderthorn Shadow Hunter",
        [9266] = "Smolderthorn Witch Doctor",
        [9267] = "Smolderthorn Axe Thrower",
        [9268] = "Smolderthorn Berserker",
        [9269] = "Smolderthorn Seer",
        [9216] = "Spirestone Warlord",
        [10374] = "Spire Spider",
        [10375] = "Spire Spiderling",
    },
}
FDJ.RunLogWingGroups = {
    [429] = { "Dire Maul: East", "Dire Maul: West", "Dire Maul: North" },
    [189] = { "Scarlet Monastery: Graveyard", "Scarlet Monastery: Library", "Scarlet Monastery: Armory", "Scarlet Monastery: Cathedral" },
    [229] = { "Lower Blackrock Spire", "Upper Blackrock Spire" },
    [329] = { "Stratholme: Living", "Stratholme: Undead" },
}

-- spireroom (2.1.4, M 23 Nov 2026 on a stream in Hordemar City: "why
-- doesn't it start there directly when people kill a mob in Hordemar
-- City?"): the rooms (the minimap's sub-zone) only one side of Blackrock
-- Spire has. Until the run has a side, a kill in one of them starts it as
-- that side: a first guess, which a later kill of a mob or boss only the
-- other side has still moves (Systems/RunLog.lua). The Hall of Blackhand is
-- left out: both sides start in it (the open ways into Lower Blackrock
-- Spire on its south wall, Upper Blackrock Spire's door on its north wall),
-- and Upper Blackrock Spire has an upper level of it too. English names; in
-- another language the tracker learns the Lower side's rooms itself
-- (FDJ.RunLogRoomLearn).
FDJ.RunLogRoomWings = {
    [229] = {
        ["hordemar city"] = "Lower Blackrock Spire",
        ["mok'doom"] = "Lower Blackrock Spire",
        ["tazz'alaor"] = "Lower Blackrock Spire",
        ["tazz'alor"] = "Lower Blackrock Spire",
        ["skitterweb tunnels"] = "Lower Blackrock Spire",
        ["the storehouse"] = "Lower Blackrock Spire",
        ["halycon's lair"] = "Lower Blackrock Spire",
        ["chamber of battle"] = "Lower Blackrock Spire",
        ["dragonspire hall"] = "Upper Blackrock Spire",
        ["hall of binding"] = "Upper Blackrock Spire",
        ["the rookery"] = "Upper Blackrock Spire",
        ["blackrock stadium"] = "Upper Blackrock Spire",
        ["the furnace"] = "Upper Blackrock Spire",
        ["spire throne"] = "Upper Blackrock Spire",
        ["the beast's lair"] = "Upper Blackrock Spire",
    },
}
-- The side whose rooms are learned in any language: the room a kill of a mob
-- or boss only that side has happens in (a kill only the other side has in
-- such a room marks it as both sides', so it decides nothing). Only the
-- Lower side's: the Hall of Blackhand has none of its mobs, so it is never
-- learned; Upper Blackrock Spire's kills on its upper level would teach it.
FDJ.RunLogRoomLearn = {
    [229] = "Lower Blackrock Spire",
}

-- smwing (2.0.8, M 15 Nov 2026: in the Cathedral the tracker said Graveyard
-- until a Scarlet Wizard died; the Myrmidons killed first can't be in the
-- Graveyard): the wings each shared Scarlet mob lives in, the likeliest
-- first. Such a kill rules the other wings out (Systems/RunLog.lua): when
-- the tracker's wing is one of those, it moves to the likeliest left, and
-- still follows the first kill of a mob only one wing has. Cathedral first
-- for the Myrmidons and Defenders (its courtyard, the Chapel Gardens, is
-- full of them), Library first for the Chaplains and Monks.
FDJ.RunLogSharedWings = {
    [189] = {
        [4295] = { "Scarlet Monastery: Cathedral", "Scarlet Monastery: Armory" }, -- Scarlet Myrmidon
        [4298] = { "Scarlet Monastery: Cathedral", "Scarlet Monastery: Armory" }, -- Scarlet Defender
        [4299] = { "Scarlet Monastery: Library", "Scarlet Monastery: Cathedral" }, -- Scarlet Chaplain
        [4540] = { "Scarlet Monastery: Library", "Scarlet Monastery: Cathedral" }, -- Scarlet Monk
    },
}

-- Real trash, but shared by multiple wings: eligible kills, no wing vote.
FDJ.RunLogSharedTrash = {
    -- Entrance/Scarshield kills count, but never prove the group's route.
    [229] = {
        [9097] = "Scarshield Legionnaire",
        [9098] = "Scarshield Spellbinder",
        [9257] = "Scarshield Warlock",
        [9258] = "Scarshield Raider",
    },
    [189] = {
        [4295] = "Scarlet Myrmidon", -- Armory / Cathedral
        [4298] = "Scarlet Defender", -- Armory / Cathedral
        [4299] = "Scarlet Chaplain", -- Library / Cathedral
        [4540] = "Scarlet Monk", -- Library / Cathedral
    },
}
