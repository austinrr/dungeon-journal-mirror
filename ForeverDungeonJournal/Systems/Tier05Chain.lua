-- tier05chain (2.1.5 dev, M 24 Nov 2026: "add it in the tier, a button that
-- gets to the chain", with his "WoW Forever Tier 0.5 Full Questline" guide).
-- The whole Dungeon Set 2 questline as a quest chain page of its own
-- (questChainPage, like the Onyxia Attunement's), opened from a button on the
-- Tier Sets page, left of Compact view; its page has Back to Tiers in the
-- Dungeons button's place (FDJ.OpenFromTierPage, Systems/TierSets.lua). The
-- page lists Saving the Best for Last for the character's class and faction
-- (the other classes' with Options > Show all class quests), its chain the
-- 28 steps before it, from An Earnest Proposition on; the button opens it at
-- the first step not handed in yet.
-- Bodley's relic and summon are the quest he gives (no fixed class mapping
-- known): those steps are "one of the following".
-- Three Kings of Flame: WoW Forever's Ash of Asharell (Executor Asharell, a
-- cave in the Burning Steppes), not the Cinder of Cynders.
-- Kept in the vault (the Tier 0.5 chain stays private until M calls it out);
-- its step texts are English so far.
local FDJ = _G.ForeverDungeonJournal_NS
if not (FDJ and FDJ.DB and FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_DETAILS) then return end
local C, D = FDJ.QUEST_PREREQ_CHAINS, FDJ.QUEST_PREREQ_DETAILS

local PAGE = "Tier 0.5"
FDJ.TIER05_PAGE = PAGE

local function L(key)
    return FDJ.L and FDJ.L(key) or key
end

do
    local strings = {
        enUS = { "Tier 0.5 Quest Chain", "The whole Tier 0.5 questline for your class and faction, step by step." },
        deDE = { "Tier-0.5-Questreihe", "Die ganze Tier-0.5-Questreihe für deine Klasse und Fraktion, Schritt für Schritt." },
        frFR = { "Suite de quêtes Tier 0.5", "Toute la suite de quêtes Tier 0.5 pour votre classe et votre faction, étape par étape." },
        esES = { "Cadena de misiones Tier 0.5", "Toda la cadena de misiones Tier 0.5 para tu clase y facción, paso a paso." },
        itIT = { "Catena di missioni Tier 0.5", "L'intera catena di missioni Tier 0.5 per la tua classe e fazione, passo dopo passo." },
        ptBR = { "Cadeia de missões Tier 0.5", "Toda a cadeia de missões Tier 0.5 para sua classe e facção, passo a passo." },
        ruRU = { "Цепочка заданий Tier 0.5", "Вся цепочка заданий Tier 0.5 для вашего класса и фракции, шаг за шагом." },
        koKR = { "티어 0.5 연계 퀘스트", "직업과 진영에 맞는 티어 0.5 연계 퀘스트 전체를 단계별로 보여 줍니다." },
        zhCN = { "T0.5 系列任务", "按你的职业和阵营逐步列出完整的T0.5系列任务。" },
        zhTW = { "T0.5 系列任務", "按你的職業和陣營逐步列出完整的T0.5系列任務。" },
    }
    strings.esMX = strings.esES
    for locale, pair in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            if t.TIER05_CHAIN == nil then t.TIER05_CHAIN = pair[1] end
            if t.TIER05_CHAIN_TIP == nil then t.TIER05_CHAIN_TIP = pair[2] end
        end
    end
end

-- ------------------------------------------------------------- the spots
local function Spot(mapID, x, y, label, target, detail)
    return { mapID = mapID, x = x, y = y, label = label, targetName = target, detail = detail }
end
local function Loc(mapID, x, y, label, detail)
    return { markerType = "location", mapID = mapID, x = x, y = y, label = label, detail = detail }
end
local DELIANA = Spot(1455, 0.435, 0.526, "Deliana — Ironforge", "Deliana", "Deliana: The High Seat, Ironforge")
local MOKVAR = Spot(1454, 0.350, 0.383, "Mokvar — Orgrimmar", "Mokvar", "Mokvar: Grommash Hold, Valley of Wisdom, Orgrimmar")
local MUX = Spot(1446, 0.524, 0.272, "Mux Manascrambler — Gadgetzan", "Mux Manascrambler", "Mux Manascrambler: Gadgetzan, Tanaris")
local ANTHION = Spot(1423, 0.261, 0.113, "Anthion Harmon — outside the Stratholme main gate (needs the Ghost Revealer)", "Anthion Harmon", "Anthion Harmon: outside the Stratholme main gate (needs the Ghost Revealer)")
local BODLEY = Loc(1427, 0.348, 0.840, "Bodley — Blackrock Mountain (needs the Ghost Revealer)", "Inside Blackrock Mountain, by the Blackrock Spire entrance")
local VOLCANIC = Loc(1428, 0.591, 0.436, "Volcanic Ash — Burning Steppes", "Ash piles near the lava across the Burning Steppes")
local SCORCHED = Loc(1451, 0.621, 0.526, "Southwind Village — Silithus", "Tortured Druids and Sentinels: Scorched Ectoplasm")
local BOKK = Spot(1428, 0.354, 0.578, "Magma Lord Bokk — Burning Steppes", "Magma Lord Bokk", "Magma Lord Bokk: Burning Steppes")
local VIEL = Spot(1452, 0.589, 0.784, "Vi'el — Darkwhisper Gorge, Winterspring", "Vi'el", "Vi'el: an imp in a cave at the entrance of Darkwhisper Gorge")
local ASHARELL = Loc(1428, 0.740, 0.660, "Executor Asharell — Burning Steppes", "In the cave near 74, 66")
local HIVE = Loc(1451, 0.590, 0.861, "Hive'Regal — Silithus", "Silithid of Hive'Regal: Druidical Remains")
local FROSTMAUL = Loc(1452, 0.618, 0.686, "Frostmaul giants — Winterspring", "Frostmaul Giants: Starbreeze Village Relic")
local TYRSHAND = Loc(1423, 0.761, 0.723, "Tyr's Hand — Eastern Plaguelands", "Scarlet Praetorians: Brilliant Sword of Zealotry")
local PURGATION = Loc(1424, 0.190, 0.774, "Purgation Isle — Hillsbrad Foothills", "The ghosts on Purgation Isle: Soul Ashes of the Banished")
local ALCAZ = Loc(1445, 0.759, 0.180, "Alcaz Island — Dustwallow Marsh", "Strashaz naga: Bloodkelp")

local AT_DELIANA = "Deliana, The High Seat, Ironforge (43.5, 52.6)"
local AT_MOKVAR = "Mokvar, Grommash Hold, Orgrimmar (35.0, 38.3)"
local AT_MUX = "Mux Manascrambler, Gadgetzan, Tanaris (52.4, 27.2)"
local AT_ANTHION = "Anthion Harmon, outside the Stratholme main gate, Eastern Plaguelands (26.1, 11.3), seen with the Ghost Revealer"
local AT_BODLEY = "Bodley, inside Blackrock Mountain by the Blackrock Spire entrance, seen with the Ghost Revealer"
local AT_YSIDA = "Ysida Harmon, Baron Rivendare's room, Stratholme"
local AT_VALTHALAK = "The Spirit of Lord Valthalak, in The Beast's room, Upper Blackrock Spire"

-- ---------------------------------------------------------- the quests
local CLASSES = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" }
-- The four armor exchanges, each class's and faction's quest. t05rewards
-- (2.1.5, M 24 Nov 2026: "Forever's class quests offer a choice ... any
-- chance we could properly assign the rewards"): Forever's own versions
-- of them (84147-84210, and 97411-97414 / 97447-97450 for the Undead
-- Paladin and the Dwarf Shaman), the ones with the role choices; the old
-- ones (8905-9022, Classic's rewards) still count as the same step.
local EP = {
    Alliance = { DRUID = 84147, HUNTER = 84148, MAGE = 84149, PALADIN = 84150, PRIEST = 84151, ROGUE = 84152, WARLOCK = 84153, WARRIOR = 84154, SHAMAN = 97447 },
    Horde = { DRUID = 84155, HUNTER = 84156, MAGE = 84157, PRIEST = 84158, ROGUE = 84159, SHAMAN = 84160, WARLOCK = 84161, WARRIOR = 84162, PALADIN = 97411 },
}
local JC = {
    Alliance = { DRUID = 84163, HUNTER = 84164, MAGE = 84165, PALADIN = 84166, PRIEST = 84167, ROGUE = 84168, WARLOCK = 84169, WARRIOR = 84170, SHAMAN = 97448 },
    Horde = { DRUID = 84171, HUNTER = 84172, MAGE = 84173, PRIEST = 84174, ROGUE = 84175, SHAMAN = 84176, WARLOCK = 84177, WARRIOR = 84178, PALADIN = 97412 },
}
local PW = {
    Alliance = { DRUID = 84179, HUNTER = 84180, MAGE = 84181, PALADIN = 84182, PRIEST = 84183, ROGUE = 84184, WARLOCK = 84185, WARRIOR = 84186, SHAMAN = 97449 },
    Horde = { DRUID = 84187, HUNTER = 84188, MAGE = 84189, PRIEST = 84190, ROGUE = 84191, SHAMAN = 84192, WARLOCK = 84193, WARRIOR = 84194, PALADIN = 97413 },
}
local SB = {
    Alliance = { DRUID = 84195, HUNTER = 84196, MAGE = 84197, PALADIN = 84198, PRIEST = 84199, ROGUE = 84200, WARLOCK = 84201, WARRIOR = 84202, SHAMAN = 97450 },
    Horde = { DRUID = 84203, HUNTER = 84204, MAGE = 84205, PRIEST = 84206, ROGUE = 84207, SHAMAN = 84208, WARLOCK = 84209, WARRIOR = 84210, PALADIN = 97414 },
}
local OLD = { -- (Classic's: done counts for the step too)
    { Alliance = { DRUID = 8905, HUNTER = 8906, MAGE = 8907, PALADIN = 8908, PRIEST = 8909, ROGUE = 8910, WARLOCK = 8911, WARRIOR = 8912 },
      Horde = { DRUID = 8913, HUNTER = 8914, MAGE = 8915, PRIEST = 8916, ROGUE = 8917, SHAMAN = 8918, WARLOCK = 8919, WARRIOR = 8920 } },
    { Alliance = { DRUID = 8926, HUNTER = 8931, MAGE = 8932, PALADIN = 8933, PRIEST = 8934, ROGUE = 8935, WARLOCK = 8936, WARRIOR = 8937 },
      Horde = { DRUID = 8927, HUNTER = 8938, MAGE = 8939, PRIEST = 8940, ROGUE = 8941, SHAMAN = 8942, WARLOCK = 8943, WARRIOR = 8944 } },
    { Alliance = { DRUID = 8951, HUNTER = 8952, MAGE = 8953, PALADIN = 8954, PRIEST = 8955, ROGUE = 8956, WARLOCK = 8958, WARRIOR = 8959 },
      Horde = { SHAMAN = 8957, DRUID = 9016, HUNTER = 9017, MAGE = 9018, PRIEST = 9019, ROGUE = 9020, WARLOCK = 9021, WARRIOR = 9022 } },
    { Alliance = { DRUID = 8999, HUNTER = 9000, MAGE = 9001, PALADIN = 9002, PRIEST = 9003, ROGUE = 9004, WARLOCK = 9005, WARRIOR = 9006 },
      Horde = { DRUID = 9007, HUNTER = 9008, PRIEST = 9009, ROGUE = 9010, SHAMAN = 9011, WARLOCK = 9012, WARRIOR = 9013, MAGE = 9014 } },
}
FDJ.QUEST_DONE_BY = FDJ.QUEST_DONE_BY or {}
for n, new in ipairs({ EP, JC, PW, SB }) do
    for faction, list in pairs(new) do
        for class, id in pairs(list) do
            local old = OLD[n][faction][class]
            if old and FDJ.QUEST_DONE_BY[id] == nil then FDJ.QUEST_DONE_BY[id] = { old } end
        end
    end
end

-- What each exchange gives (the same for both factions). The bracers: one
-- piece per version, to pick from; the rest: a box per version, to pick
-- from, the pieces inside. Hunters, Mages, Rogues and Warlocks: one
-- version, the pieces themselves.
local VERSIONS = { -- (Head, Shoulder, Chest, Wrist, Hands, Waist, Legs, Feet: Systems/TierSets.lua's Tier 0.5 versions)
    WARRIOR = { MELEE = { 226860, 226858, 226862, 226863, 226861, 226864, 226859, 226857 }, TANK = { 226869, 226867, 226872, 226865, 226870, 226866, 226868, 226871 } },
    PALADIN = { MELEE = { 226976, 226969, 226973, 226970, 226975, 226971, 226972, 226974 }, HEALER = { 226981, 226979, 226984, 226977, 226982, 226978, 226980, 226983 }, TANK = { 226989, 226987, 226992, 226985, 226990, 226986, 226988, 226991 } },
    PRIEST = { HEALER = { 226947, 226951, 226945, 226949, 226950, 226948, 226946, 226952 }, CASTER = { 226957, 226955, 226960, 226953, 226958, 226954, 226956, 226959 } },
    SHAMAN = { CASTER = { 227002, 227003, 227004, 227001, 227006, 227008, 227005, 227007 }, HEALER = { 227013, 227011, 227016, 227009, 227014, 227010, 227012, 227015 }, MELEE = { 227021, 227019, 227024, 227017, 227022, 227018, 227020, 227023 } },
    DRUID = { CASTER = { 226773, 226778, 226776, 226775, 226777, 226772, 226779, 226774 }, HEALER = { 226786, 226785, 226783, 226782, 226784, 226780, 226787, 226781 }, MELEE = { 226792, 226790, 226795, 226788, 226793, 226789, 226791, 226794 }, TANK = { 226801, 226798, 226804, 226796, 226802, 226797, 226799, 226803 } },
}
local WRIST_NAMES = {
    [226775] = "Feralheart Wraps", [226782] = "Feralheart Bindings", [226788] = "Feralheart Bands", [226796] = "Feralheart Wristguards",
    [226970] = "Soulforge Bracers", [226977] = "Soulforge Bindings", [226985] = "Soulforge Wristguards",
    [226949] = "Virtuous Bracers", [226953] = "Virtuous Wraps",
    [227001] = "Bindings of The Five Thunders", [227009] = "Bracers of The Five Thunders", [227017] = "Bands of The Five Thunders",
    [226863] = "Bracers of Heroism", [226865] = "Wristguards of Heroism",
}
-- t05boxes (2.1.5, M 24 Nov 2026: "when clicking on the boxes, it shows the
-- pieces"): what's in each box (its version's pieces, head to feet), shown
-- in the row a set piece opens when clicked (FDJ.ToggleSetStrip).
FDJ.BOX_CONTENTS = FDJ.BOX_CONTENTS or {}
-- names: the boxes' own (the game's order); roles: the version each one
-- holds, as its tooltip says (Holy, Retribution, Protection ...)
local function Boxes(class, names, roles, gb, bls, hc)
    local t, bracers = { {}, {}, {} }, {}
    for i, name in ipairs(names) do
        local v = VERSIONS[class][roles[i]]
        t[1][i] = { gb[i], name .. " Gloves and Belt Set", 3 }
        t[2][i] = { bls[i], name .. " Boots, Legs, and Shoulders Set", 3 }
        t[3][i] = { hc[i], name .. " Helm and Chestpiece Set", 3 }
        FDJ.BOX_CONTENTS[gb[i]] = { v[5], v[6] }
        FDJ.BOX_CONTENTS[bls[i]] = { v[2], v[7], v[8] }
        FDJ.BOX_CONTENTS[hc[i]] = { v[1], v[3] }
        bracers[i] = { v[4], WRIST_NAMES[v[4]] or ("item " .. v[4]), 3 } -- (in the boxes' order)
    end
    return { bracers = bracers, boxes = t }
end
local REWARDS = {
    DRUID = Boxes("DRUID", { "Feline", "Astral", "Guardian's", "Mender's" }, { "MELEE", "CASTER", "TANK", "HEALER" },
        { 227337, 227338, 227339, 227340 }, { 227359, 227360, 227361, 227365 }, { 227383, 227384, 227385, 227387 }),
    PALADIN = Boxes("PALADIN", { "Merciful", "Radiant", "Divine Will" }, { "HEALER", "MELEE", "TANK" },
        { 227343, 227344, 227345 }, { 227368, 227369, 227370 }, { 227390, 227391, 227392 }),
    PRIEST = Boxes("PRIEST", { "Dawn", "Twilight" }, { "HEALER", "CASTER" },
        { 227346, 227347 }, { 227371, 227372 }, { 227393, 227394 }),
    SHAMAN = Boxes("SHAMAN", { "Relief's", "Eruption's", "Impact's" }, { "HEALER", "CASTER", "MELEE" },
        { 227350, 227351, 227352 }, { 227375, 227376, 227377 }, { 227397, 227398, 227399 }),
    WARRIOR = Boxes("WARRIOR", { "Immoveable", "Unstoppable" }, { "TANK", "MELEE" },
        { 227356, 227357 }, { 227381, 227382 }, { 227403, 227404 }),
    -- one version: Head, Shoulder, Chest, Wrist, Hands, Waist, Legs, Feet
    HUNTER = { pieces = { { 226887, "Beastmaster's Cap" }, { 226884, "Beastmaster's Mantle" }, { 226886, "Beastmaster's Tunic" }, { 226885, "Beastmaster's Bindings" }, { 226883, "Beastmaster's Gauntlets" }, { 226888, "Beastmaster's Belt" }, { 226882, "Beastmaster's Pants" }, { 226881, "Beastmaster's Treads" } } },
    MAGE = { pieces = { { 226935, "Sorcerer's Crown" }, { 226936, "Sorcerer's Mantle" }, { 226932, "Sorcerer's Robes" }, { 226929, "Sorcerer's Bindings" }, { 226930, "Sorcerer's Gauntlets" }, { 226934, "Sorcerer's Belt" }, { 226933, "Sorcerer's Leggings" }, { 226931, "Sorcerer's Sandals" } } },
    ROGUE = { pieces = { { 226829, "Darkmantle Cap" }, { 226826, "Darkmantle Spaulders" }, { 226825, "Darkmantle Tunic" }, { 226830, "Darkmantle Bracers" }, { 226828, "Darkmantle Grips" }, { 226832, "Darkmantle Belt" }, { 226827, "Darkmantle Pants" }, { 226831, "Darkmantle Footpads" } } },
    WARLOCK = { pieces = { { 226909, "Deathmist Mask" }, { 226912, "Deathmist Mantle" }, { 226906, "Deathmist Robe" }, { 226907, "Deathmist Bracers" }, { 226911, "Deathmist Wraps" }, { 226905, "Deathmist Belt" }, { 226910, "Deathmist Leggings" }, { 226908, "Deathmist Sandals" } } },
}
-- step: 1 An Earnest Proposition, 2 Just Compensation, 3 Anthion's Parting
-- Words, 4 Saving the Best for Last. Returns the items and whether to pick one.
local STEP_SLOTS = { { 4 }, { 5, 6 }, { 8, 7, 2 }, { 1, 3 } }
local function Rewards(class, step)
    local r = REWARDS[class]
    if not r then return {}, false end
    if r.pieces then
        local list = {}
        for _, slot in ipairs(STEP_SLOTS[step]) do
            local p = r.pieces[slot]
            list[#list + 1] = { p[1], p[2], 3 }
        end
        return list, false
    end
    local list = step == 1 and r.bracers or r.boxes[step - 1]
    return list, #list > 1
end
for n, new in ipairs({ EP, JC, PW }) do
    for _, list in pairs(new) do
        for class, id in pairs(list) do
            local items, choice = Rewards(class, n)
            if #items > 0 and FDJ.PREREQ_REWARD_ITEMS_FALLBACK and FDJ.PREREQ_REWARD_ITEMS_FALLBACK[id] == nil then
                FDJ.PREREQ_REWARD_ITEMS_FALLBACK[id] = { items = items, choice = choice }
            end
        end
    end
end
FDJ.TIER05_LAST = SB
-- The faction's own steps.
local SUPERNATURAL = { Alliance = 8922, Horde = 8923 }
local RETURN = { Alliance = { 8977, "Return to Deliana" }, Horde = { 8978, "Return to Mokvar" } }
local SEARCH = { Alliance = 8929, Horde = 8930 }
local BODLEYS = { Alliance = 8960, Horde = 9032 }
local BACK = { Alliance = 8997, Horde = 8998 }

-- Tier 0, Head .. Feet (Head, Shoulder, Chest, Wrist, Hands, Waist, Legs, Feet).
local T0 = {
    WARRIOR = { { 16731, "Helm of Valor" }, { 16733, "Spaulders of Valor" }, { 16730, "Breastplate of Valor" }, { 16735, "Bracers of Valor" }, { 16737, "Gauntlets of Valor" }, { 16736, "Belt of Valor" }, { 16732, "Legplates of Valor" }, { 16734, "Boots of Valor" } },
    PALADIN = { { 16727, "Lightforge Helm" }, { 16729, "Lightforge Spaulders" }, { 16726, "Lightforge Breastplate" }, { 16722, "Lightforge Bracers" }, { 16724, "Lightforge Gauntlets" }, { 16723, "Lightforge Belt" }, { 16728, "Lightforge Legplates" }, { 16725, "Lightforge Boots" } },
    HUNTER = { { 16677, "Beaststalker's Cap" }, { 16679, "Beaststalker's Mantle" }, { 16674, "Beaststalker's Tunic" }, { 16681, "Beaststalker's Bindings" }, { 16676, "Beaststalker's Gloves" }, { 16680, "Beaststalker's Belt" }, { 16678, "Beaststalker's Pants" }, { 16675, "Beaststalker's Boots" } },
    ROGUE = { { 16707, "Shadowcraft Cap" }, { 16708, "Shadowcraft Spaulders" }, { 16721, "Shadowcraft Tunic" }, { 16710, "Shadowcraft Bracers" }, { 16712, "Shadowcraft Gloves" }, { 16713, "Shadowcraft Belt" }, { 16709, "Shadowcraft Pants" }, { 16711, "Shadowcraft Boots" } },
    PRIEST = { { 16693, "Devout Crown" }, { 16695, "Devout Mantle" }, { 16690, "Devout Robe" }, { 16697, "Devout Bracers" }, { 16692, "Devout Gloves" }, { 16696, "Devout Belt" }, { 16694, "Devout Skirt" }, { 16691, "Devout Sandals" } },
    SHAMAN = { { 16667, "Coif of Elements" }, { 16669, "Pauldrons of Elements" }, { 16666, "Vest of Elements" }, { 16671, "Bindings of Elements" }, { 16672, "Gauntlets of Elements" }, { 16673, "Cord of Elements" }, { 16668, "Kilt of Elements" }, { 16670, "Boots of Elements" } },
    MAGE = { { 16686, "Magister's Crown" }, { 16689, "Magister's Mantle" }, { 16688, "Magister's Robes" }, { 16683, "Magister's Bindings" }, { 16684, "Magister's Gloves" }, { 16685, "Magister's Belt" }, { 16687, "Magister's Leggings" }, { 16682, "Magister's Boots" } },
    WARLOCK = { { 16698, "Dreadmist Mask" }, { 16701, "Dreadmist Mantle" }, { 16700, "Dreadmist Robe" }, { 16703, "Dreadmist Bracers" }, { 16705, "Dreadmist Wraps" }, { 16702, "Dreadmist Belt" }, { 16699, "Dreadmist Leggings" }, { 16704, "Dreadmist Sandals" } },
    DRUID = { { 16720, "Wildheart Cowl" }, { 16718, "Wildheart Spaulders" }, { 16706, "Wildheart Vest" }, { 16714, "Wildheart Bracers" }, { 16717, "Wildheart Gloves" }, { 16716, "Wildheart Belt" }, { 16719, "Wildheart Kilt" }, { 16715, "Wildheart Boots" } },
}
local function T0Items(class, slots)
    local list = {}
    for _, slot in ipairs(slots) do
        local piece = T0[class] and T0[class][slot]
        if piece then list[#list + 1] = { piece[1], piece[2], 3, "Tier 0" } end
    end
    return list
end

-- --------------------------------------------------------- the steps
local function Step(id, t)
    if D[id] ~= nil then return end -- (steps the journal has already: kept as they are)
    t.level, t.requires = t.level or 60, t.requires or 58
    D[id] = t
end

-- 1, 8, 17: the armor exchanges (29, Saving the Best for Last, is the page's quest)
for faction, list in pairs(EP) do
    local at, spot = faction == "Horde" and AT_MOKVAR or AT_DELIANA, faction == "Horde" and MOKVAR or DELIANA
    local samples = faction == "Horde"
        and { 22381, "Silithus Venom Sample", 1, "From spiders and scorpions in Silithus (15 needed)" }
        or { 21928, "Winterspring Blood Sample", 1, "From beasts in Winterspring (15 needed)" }
    for class, id in pairs(list) do
        local items = T0Items(class, { 4 })
        items[#items + 1] = samples
        Step(id, {
            objective = (faction == "Horde" and "Bring 15 Silithus Venom Samples, 20 gold and your Tier 0 bracers to Mokvar in Orgrimmar."
                or "Bring 15 Winterspring Blood Samples, 20 gold and your Tier 0 bracers to Deliana in Ironforge."),
            pickup = at, turnin = at, map = spot, turninMap = spot,
            objectiveInDungeon = false, dungeonStep = false, -- (t05rewards: the Tier 0 pieces can be bought, M: no Dungeon Chain Step)
            requiredItems = items,
            note = (REWARDS[class] and REWARDS[class].pieces and "" or "Your Tier 0.5 bracers: pick the version for your role when you hand it in. ")
                .. "Later steps need the other seven Tier 0 pieces. Gold before Bodley: allow 100 gold for steps 1, 3 and 6, plus the materials and fuel; the Hallowed Brazier is bought later.",
        })
    end
end
for faction, list in pairs(JC) do
    local at, spot = faction == "Horde" and AT_MOKVAR or AT_DELIANA, faction == "Horde" and MOKVAR or DELIANA
    for class, id in pairs(list) do
        Step(id, {
            objective = "Trade your Tier 0 belt and gloves for their upgrades with " .. (faction == "Horde" and "Mokvar in Orgrimmar." or "Deliana in Ironforge."),
            pickup = at, turnin = at, map = spot, turninMap = spot,
            objectiveInDungeon = false, dungeonStep = false,
            requiredItems = T0Items(class, { 6, 5 }),
        })
    end
end
for faction, list in pairs(PW) do
    local at, spot = faction == "Horde" and AT_MOKVAR or AT_DELIANA, faction == "Horde" and MOKVAR or DELIANA
    for class, id in pairs(list) do
        Step(id, {
            objective = "Return to " .. (faction == "Horde" and "Mokvar in Orgrimmar" or "Deliana in Ironforge") .. " and trade your Tier 0 boots, legs and shoulders for their upgrades.",
            pickup = AT_ANTHION, turnin = at, map = ANTHION, turninMap = spot,
            objectiveInDungeon = false, dungeonStep = false,
            requiredItems = T0Items(class, { 8, 7, 2 }),
        })
    end
end

-- 2 - 7: Mux Manascrambler's distiller
for faction, id in pairs(SUPERNATURAL) do
    Step(id, {
        objective = faction == "Horde" and "Take the Sealed Venom Container to Mux Manascrambler in Gadgetzan."
            or "Take the Sealed Blood Container to Mux Manascrambler in Gadgetzan.",
        pickup = faction == "Horde" and AT_MOKVAR or AT_DELIANA, turnin = AT_MUX,
        map = faction == "Horde" and MOKVAR or DELIANA, turninMap = MUX,
    })
end
Step(8921, {
    objective = "Bring 1 Delicate Arcanite Converter, 4 Greater Eternal Essence, 10 Stonescale Oil, 25 Volcanic Ash and 40 gold to Mux Manascrambler in Gadgetzan.",
    pickup = AT_MUX, turnin = AT_MUX, map = MUX, turninMap = MUX, objectiveMap = VOLCANIC,
    requiredItems = {
        { 16006, "Delicate Arcanite Converter", 2, "Engineering (1 needed)" },
        { 16203, "Greater Eternal Essence", 2, "Enchanting: disenchanting (4 needed)" },
        { 13423, "Stonescale Oil", 1, "Alchemy (10 needed)" },
        { 22338, "Volcanic Ash", 1, "Ash piles near the lava in the Burning Steppes (25 needed)" },
    },
})
Step(8924, {
    objective = "Use the Ectoplasmic Distiller near ghosts: 12 Scorched Ectoplasm in Silithus, 12 Frozen Ectoplasm in Winterspring and 12 Stable Ectoplasm in the Eastern Plaguelands. Bring them to Mux Manascrambler.",
    pickup = AT_MUX, turnin = AT_MUX, map = MUX, turninMap = MUX, objectiveMap = SCORCHED,
    requiredItems = {
        { 21937, "Scorched Ectoplasm", 1, "Tortured Druids and Sentinels, Southwind Village, Silithus (12 needed)" },
        { 21936, "Frozen Ectoplasm", 1, "Suffering and Anguished Highborne, Winterspring (12 needed)" },
        { 21935, "Stable Ectoplasm", 1, "Ghosts in the Eastern Plaguelands (12 needed)" },
    },
    note = "Bring Goblin Rocket Fuel: the distiller needs it.",
})
Step(8925, {
    objective = "Kill Magma Lord Bokk in the Burning Steppes and bring his Magma Core to Mux Manascrambler in Gadgetzan.",
    pickup = AT_MUX, turnin = AT_MUX, map = MUX, turninMap = MUX, objectiveMap = BOKK,
    requiredItems = { { 21938, "Magma Core", 1, "Dropped by Magma Lord Bokk" } },
})
Step(8928, {
    objective = "Buy a Fel Elemental Rod for 40 gold from Vi'el, an imp in a cave at the entrance of Darkwhisper Gorge in southern Winterspring, and bring it to Mux Manascrambler.",
    pickup = AT_MUX, turnin = AT_MUX, map = MUX, turninMap = MUX, objectiveMap = VIEL,
    requiredItems = { { 21939, "Fel Elemental Rod", 1, "Sold by Vi'el for 40 gold" } },
})
for faction, r in pairs(RETURN) do
    Step(r[1], {
        objective = "Bring the Extra-Dimensional Ghost Revealer to " .. (faction == "Horde" and "Mokvar in Orgrimmar." or "Deliana in Ironforge."),
        pickup = AT_MUX, turnin = faction == "Horde" and AT_MOKVAR or AT_DELIANA,
        map = MUX, turninMap = faction == "Horde" and MOKVAR or DELIANA,
        note = "Keep the Ghost Revealer: Anthion Harmon and Bodley are only seen with it.",
    })
end

-- 9 - 16: Anthion Harmon
for faction, id in pairs(SEARCH) do
    Step(id, {
        objective = "Use the Extra-Dimensional Ghost Revealer at the entrance to Stratholme and speak with the ghost of Anthion Harmon.",
        pickup = faction == "Horde" and AT_MOKVAR or AT_DELIANA, turnin = AT_ANTHION,
        map = faction == "Horde" and MOKVAR or DELIANA, turninMap = ANTHION,
    })
end
Step(8945, {
    objective = "Go into Stratholme (Undead side) and rescue Ysida Harmon: kill Baron Rivendare before the 45-minute timer runs out, then speak with Ysida.",
    pickup = AT_ANTHION, turnin = AT_YSIDA, map = ANTHION,
    note = "Timed: the 45 minutes start when the run begins. Ysida gives you her satchel.",
})
Step(8946, {
    objective = "Open Ysida's Satchel and bring Ysida's Locket to Anthion Harmon outside Stratholme.",
    pickup = AT_YSIDA, turnin = AT_ANTHION, turninMap = ANTHION,
})
Step(8947, {
    objective = "Bring 3 Dark Iron Bars, 20 Enchanted Leather, 3 Mooncloth and 4 Cured Rugged Hides to Anthion Harmon.",
    pickup = AT_ANTHION, turnin = AT_ANTHION, map = ANTHION, turninMap = ANTHION,
    requiredItems = {
        { 11371, "Dark Iron Bar", 2, "Mining: smelted at the Black Forge in Blackrock Depths (3 needed)" },
        { 12810, "Enchanted Leather", 1, "Enchanting (20 needed)" },
        { 14342, "Mooncloth", 2, "Tailoring (3 needed)" },
        { 15407, "Cured Rugged Hide", 2, "Leatherworking (4 needed)" },
    },
})
-- (13 - 15: Anthion's Old Friend, Falrin's Vendetta and The Instigator's
-- Enchantment are Blackrock Depths' own steps already)
Step(9015, {
    objective = "Plant the Banner of Provocation in the center of the Ring of Law in Blackrock Depths as High Justice Grimstone starts the event, defeat Theldren and his gladiators, and bring the Top Piece of Lord Valthalak's Amulet to Anthion Harmon.",
    pickup = "Falrin Treeshaper, the Athenaeum, Dire Maul (West)", turnin = AT_ANTHION, turninMap = ANTHION,
    requiredItems = { { 22047, "Top Piece of Lord Valthalak's Amulet", 1, "Dropped by Theldren in the Ring of Law, Blackrock Depths" } },
})

-- 18 - 28: Bodley and Lord Valthalak
for faction, id in pairs(BODLEYS) do
    Step(id, {
        objective = "Travel to Blackrock Mountain and use the Extra-Dimensional Ghost Revealer to find Bodley near the Blackrock Spire entrance.",
        pickup = faction == "Horde" and AT_MOKVAR or AT_DELIANA, turnin = AT_BODLEY,
        map = faction == "Horde" and MOKVAR or DELIANA, turninMap = BODLEY,
    })
end
Step(8961, {
    objective = "Bring Bodley the Incendicite of Incendius, the Ember of Emberseer, the Ash of Asharell and a Hallowed Brazier.",
    pickup = AT_BODLEY, turnin = AT_BODLEY, map = BODLEY, turninMap = BODLEY, objectiveMap = ASHARELL,
    requiredItems = {
        { 21987, "Incendicite of Incendius", 1, "Dropped by Lord Incendius, Blackrock Depths" },
        { 21988, "Ember of Emberseer", 1, "Dropped by Pyroguard Emberseer, Upper Blackrock Spire" },
        { 279415, "Ash of Asharell", 1, "Dropped by Executor Asharell, a cave in the Burning Steppes near 74, 66" },
        { 22014, "Hallowed Brazier", 1, "Sold by Argent Dawn quartermasters (Honored)" },
    },
})
local RELICS = {
    [8962] = { 22226, "Druidical Remains", "the Hive'Regal silithid in Silithus", HIVE },
    [8963] = { 22227, "Starbreeze Village Relic", "Frostmaul giants in Winterspring", FROSTMAUL },
    [8964] = { 22228, "Brilliant Sword of Zealotry", "Scarlet Praetorians at Tyr's Hand, Eastern Plaguelands", TYRSHAND },
    [8965] = { 22229, "Soul Ashes of the Banished", "the ghosts on Purgation Isle, Hillsbrad Foothills", PURGATION },
}
RELICS[8986], RELICS[8985], RELICS[8987], RELICS[8988] = RELICS[8962], RELICS[8963], RELICS[8964], RELICS[8965]
for id, r in pairs(RELICS) do
    Step(id, {
        objective = "Bring Bodley the " .. r[2] .. ", from " .. r[3] .. ".",
        pickup = AT_BODLEY, turnin = AT_BODLEY, map = BODLEY, turninMap = BODLEY, objectiveMap = r[4],
        requiredItems = { { r[1], r[2], 1, "From " .. r[3] } },
        note = "Bodley gives one of four relics: the one in your quest log is yours.",
    })
end
local SUMMONS = {
    [8966] = { "Mor Grayhoof", "War Master Voone's room in Lower Blackrock Spire" },
    [8967] = { "Isalien", "Alzzin the Wildshaper's room in Dire Maul East" },
    [8968] = { "Jarien and Sothos", "Balnazzar's room in Stratholme (Living side)" },
    [8969] = { "Kormok", "Ras Frostwhisper's room in Scholomance" },
}
SUMMONS[8989], SUMMONS[8990], SUMMONS[8991], SUMMONS[8992] = SUMMONS[8966], SUMMONS[8967], SUMMONS[8968], SUMMONS[8969]
for id, s in pairs(SUMMONS) do
    local right = id >= 8989
    Step(id, {
        objective = "Use the Brazier of Beckoning in " .. s[2] .. " to summon " .. s[1] .. ", kill " .. (s[1]:find(" and ") and "them" or "the spirit") .. " and bring the "
            .. (right and "Right Piece of Lord Valthalak's Amulet (combined into the whole amulet)" or "Left Piece of Lord Valthalak's Amulet") .. " and the brazier to Bodley.",
        pickup = AT_BODLEY, turnin = AT_BODLEY, map = BODLEY, turninMap = BODLEY,
        requiredItems = { right and { 22046, "Right Piece of Lord Valthalak's Amulet", 1, "Dropped by " .. s[1] } or { 21984, "Left Piece of Lord Valthalak's Amulet", 1, "Dropped by " .. s[1] } },
        note = "Bodley names one of four summons: the one in your quest log is yours.",
    })
end
Step(8970, {
    objective = "Gather 20 Bloodkelp from the Strashaz naga on Alcaz Island in Dustwallow Marsh and bring them to Bodley.",
    pickup = AT_BODLEY, turnin = AT_BODLEY, map = BODLEY, turninMap = BODLEY, objectiveMap = ALCAZ,
    requiredItems = { { 22094, "Bloodkelp", 1, "From the Strashaz naga on Alcaz Island (20 needed)" } },
})
Step(8994, {
    objective = "Bring Bodley 40 Blackrock Bracers and 1 Flask of Supreme Power.",
    pickup = AT_BODLEY, turnin = AT_BODLEY, map = BODLEY, turninMap = BODLEY,
    requiredItems = {
        { 22138, "Blackrock Bracer", 1, "From the Blackrock Spire orcs (40 needed)" },
        { 13512, "Flask of Supreme Power", 1, "Alchemy (1 needed)" },
    },
})
Step(8995, {
    objective = "In Upper Blackrock Spire, clear The Beast's room, use the Brazier of Beckoning to summon Lord Valthalak and kill him. Use Lord Valthalak's Amulet on his corpse, then speak with his spirit before you leave.",
    pickup = AT_BODLEY, turnin = AT_VALTHALAK, map = BODLEY,
})
Step(8996, {
    objective = "Return to Bodley and give him the Brazier of Beckoning.",
    pickup = AT_VALTHALAK, turnin = AT_BODLEY, turninMap = BODLEY,
    note = "He gives you the Brazier of Invocation and its manual, to summon these bosses again.",
})
for faction, id in pairs(BACK) do
    Step(id, {
        objective = "Report to " .. (faction == "Horde" and "Mokvar in Orgrimmar." or "Deliana in Ironforge."),
        pickup = AT_BODLEY, turnin = faction == "Horde" and AT_MOKVAR or AT_DELIANA,
        map = BODLEY, turninMap = faction == "Horde" and MOKVAR or DELIANA,
    })
end

-- Each of Bodley's four quests of one name says which it is: "Components of
-- Importance (Druidical Remains)", "... Amulet (Kormok)" (the relic's name
-- as the game has it, the spirit's as the journal's boss pages).
do
    local base = FDJ.LocalizeQuestField
    local function ItemName(id, fallback)
        local name
        if C_Item and C_Item.GetItemNameByID then
            local ok, n = pcall(C_Item.GetItemNameByID, id)
            if ok then name = n end
        end
        if (type(name) ~= "string" or name == "") and GetItemInfo then
            local ok, n = pcall(GetItemInfo, id)
            if ok then name = n end
        end
        if type(issecretvalue) == "function" and issecretvalue(name) then name = nil end
        return (type(name) == "string" and name ~= "") and name or fallback
    end
    if base then
        FDJ.LocalizeQuestField = function(questID, field, fallback, ...)
            local value = base(questID, field, fallback, ...)
            if field ~= "name" or type(value) ~= "string" then return value end
            local relic, summon = RELICS[questID], SUMMONS[questID]
            if relic then return value .. " (" .. ItemName(relic[1], relic[2]) .. ")" end
            if summon then
                local boss = FDJ.LocalizeBossName and FDJ.LocalizeBossName(summon[1]) or summon[1]
                return value .. " (" .. boss .. ")"
            end
            return value
        end
    end
end

-- Bodley's four branches: one quest of each, the others counted as done with it.
FDJ.QUEST_DONE_BY = FDJ.QUEST_DONE_BY or {}
for _, group in ipairs({ { 8962, 8963, 8964, 8965 }, { 8966, 8967, 8968, 8969 }, { 8985, 8986, 8987, 8988 }, { 8989, 8990, 8991, 8992 } }) do
    for _, id in ipairs(group) do
        local others = {}
        for _, o in ipairs(group) do if o ~= id then others[#others + 1] = o end end
        FDJ.QUEST_DONE_BY[id] = FDJ.QUEST_DONE_BY[id] or others
    end
end

-- -------------------------------------------------------------- the page
local function Chain(faction, class)
    local function S(id, name, choice) return { id = id, name = name, choice = choice } end
    local chain = {
        S(EP[faction][class], "An Earnest Proposition"),
        S(SUPERNATURAL[faction], "A Supernatural Device"),
        S(8921, "The Ectoplasmic Distiller"),
        S(8924, "Hunting for Ectoplasm"),
        S(8925, "A Portable Power Source"),
        S(8928, "A Shifty Merchant"),
        S(RETURN[faction][1], RETURN[faction][2]),
        S(JC[faction][class], "Just Compensation"),
        S(SEARCH[faction], "In Search of Anthion"),
        S(8945, "Dead Man's Plea"),
        S(8946, "Proof of Life"),
        S(8947, "Anthion's Strange Request"),
        S(8948, "Anthion's Old Friend"),
        S(8949, "Falrin's Vendetta"),
        S(8950, "The Instigator's Enchantment"),
        S(9015, "The Challenge"),
        S(PW[faction][class], "Anthion's Parting Words"),
        S(BODLEYS[faction], "Bodley's Unfortunate Fate"),
        S(8961, "Three Kings of Flame"),
    }
    for _, id in ipairs({ 8962, 8963, 8964, 8965 }) do chain[#chain + 1] = S(id, "Components of Importance", "t05relic1") end
    for _, id in ipairs({ 8966, 8967, 8968, 8969 }) do chain[#chain + 1] = S(id, "The Left Piece of Lord Valthalak's Amulet", "t05left") end
    chain[#chain + 1] = S(8970, "I See Alcaz Island In Your Future...")
    for _, id in ipairs({ 8985, 8986, 8987, 8988 }) do chain[#chain + 1] = S(id, "More Components of Importance", "t05relic2") end
    for _, id in ipairs({ 8989, 8990, 8991, 8992 }) do chain[#chain + 1] = S(id, "The Right Piece of Lord Valthalak's Amulet", "t05right") end
    chain[#chain + 1] = S(8994, "Final Preparations")
    chain[#chain + 1] = S(8995, "Mea Culpa, Lord Valthalak")
    chain[#chain + 1] = S(8996, "Return to Bodley")
    chain[#chain + 1] = S(BACK[faction], "Back to the Beginning")
    return chain
end

local quests = {}
for _, faction in ipairs({ "Alliance", "Horde" }) do
    for _, class in ipairs(CLASSES) do
        local id = SB[faction][class]
        if id then
            C[id] = C[id] or Chain(faction, class)
            local at, spot = faction == "Horde" and AT_MOKVAR or AT_DELIANA, faction == "Horde" and MOKVAR or DELIANA
            quests[#quests + 1] = {
                id = id, name = "Saving the Best for Last", faction = faction, classOnly = class,
                level = 60, requires = 58,
                objective = "Trade your Tier 0 helm and chest for their upgrades with " .. (faction == "Horde" and "Mokvar in Orgrimmar." or "Deliana in Ironforge."),
                pickup = at, turnin = at, startMap = spot, turninMap = spot,
                objectiveInDungeon = false,
                requiredItems = T0Items(class, { 1, 3 }),
                note = "The last step of Dungeon Set 2 (Tier 0.5). Start at level 58 with your class's Tier 0 bracers; the later steps need the other seven Tier 0 pieces."
                    .. (REWARDS[class] and REWARDS[class].pieces and "" or " Pick the reward for your role at each hand-in."),
                rewardSummary = "",
            }
            local items, choice = Rewards(class, 4)
            quests[#quests].rewardItems = items
            quests[#quests].rewardChoice = choice or nil
        end
    end
end
FDJ.DB[PAGE] = {
    questChainPage = true, -- Quests is its only tab
    noArrow = true,        -- no waypoint arrow when tracked (the Sleeping Bag's chain only)
    level = "58+",
    location = "",
    description = "",
    bosses = {},
    quests = quests,
}

local baseName = FDJ.LocalizeDungeonName
FDJ.LocalizeDungeonName = function(name, ...)
    if name == PAGE then return L("TIER05_CHAIN") end
    if baseName then return baseName(name, ...) end
    return name
end

-- -------------------------------------------------- opening the chain
local function Plain(v)
    if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
    return v
end
local function Character()
    local faction, class = "Alliance", "WARRIOR"
    if type(UnitFactionGroup) == "function" then
        local ok, f = pcall(UnitFactionGroup, "player")
        if ok and Plain(f) == "Horde" then faction = "Horde" end
    end
    if type(UnitClass) == "function" then
        local ok, _, token = pcall(UnitClass, "player")
        token = ok and Plain(token) or nil
        if type(token) == "string" and token ~= "" then class = token end
    end
    return faction, class
end

-- The character's chain, at the first step not handed in yet.
function FDJ.OpenTier05Chain()
    if not FDJ.OpenQuestChain then return end
    local faction, class = Character()
    local quest = SB[faction][class]
    if not quest then
        for _, c in ipairs(CLASSES) do
            if SB[faction][c] then quest = SB[faction][c] break end
        end
    end
    local stepID
    for _, step in ipairs(C[quest] or {}) do
        if type(step) == "table" and type(step.id) == "number" and not (FDJ.QuestTurnedIn and FDJ.QuestTurnedIn(step.id)) then
            stepID = step.id
            break
        end
    end
    local function open() FDJ.OpenQuestChain(PAGE, quest, stepID) end
    if FDJ.OpenFromTierPage then FDJ.OpenFromTierPage(PAGE, open) else open() end
end

-- ------------------------------------------------ the Tier Sets button
-- t05button (2.1.5, M 24 Nov 2026: "more centered ... exactly below the
-- character [logs icon], in between Devout Bracers and the character logs
-- icon ... a bit bigger ... the question mark that we use in the dungeon
-- quest pages ... say what step the player is at"): under the Character
-- Logs icon, level with Tier Sets; the Quests tab's big ! in front; the
-- step the character is on once the chain is started ("1/29"), all of it
-- with a tick once Saving the Best for Last is handed in.
local function InLog(id)
    if FDJ.IsQuestInLog and FDJ.IsQuestInLog(id) then return true end
    for _, other in ipairs(FDJ.QUEST_DONE_BY[id] or {}) do
        if FDJ.IsQuestInLog and FDJ.IsQuestInLog(other) then return true end
    end
    return false
end
-- The character's step: current, total, all done, started at all.
function FDJ.Tier05Progress()
    local faction, class = Character()
    local quest = SB[faction] and SB[faction][class]
    local chain = quest and C[quest]
    if type(chain) ~= "table" or not FDJ.ChainStepNumber then return nil end
    local total = FDJ.ChainStepNumber(chain, #chain) + 1
    local turned = FDJ.QuestTurnedIn or function() return false end
    if turned(quest) then return total, total, true, true end
    local started = InLog(quest)
    for i, step in ipairs(chain) do
        if type(step) == "table" and step.id and not turned(step.id) then
            if i > 1 then started = true end
            if not started then
                -- (a choice: any of its quests taken)
                local first, last = i, (FDJ.ChainChoiceEnd and FDJ.ChainChoiceEnd(chain, i)) or i
                for j = first, last do
                    if type(chain[j]) == "table" and InLog(chain[j].id) then started = true end
                end
            end
            return FDJ.ChainStepNumber(chain, i), total, false, started
        end
    end
    return total, total, false, true
end

local function Button(panel)
    if panel.fdjT05 then return panel.fdjT05 end
    local b = CreateFrame("Button", nil, panel, "BackdropTemplate")
    panel.fdjT05 = b
    b:SetHeight(28)
    b:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    b:SetBackdropColor(0.12, 0.10, 0.08, 0.95)
    b:SetBackdropBorderColor(0.52, 0.33, 0.11, 1)
    b:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    b.icon = b:CreateTexture(nil, "OVERLAY")
    b.icon:SetSize(24, 24)
    b.icon:SetPoint("LEFT", 5, 0)
    -- (the dungeon pages' Quests tab: the game's quest-giver !)
    local ok, set = false, nil
    if b.icon.SetAtlas then ok, set = pcall(b.icon.SetAtlas, b.icon, "QuestNormal", false) end
    if not ok or set == false then b.icon:SetTexture("Interface\\GossipFrame\\AvailableQuestIcon") end
    b.icon:SetSize(24, 24)
    b.text = b:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
    b.text:SetPoint("LEFT", b.icon, "RIGHT", 3, 0)
    b.text:SetTextColor(1.00, 0.82, 0.27)
    b.count = b:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
    b.count:SetPoint("LEFT", b.text, "RIGHT", 8, 0)
    b.tick = b:CreateTexture(nil, "OVERLAY")
    b.tick:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    b.tick:SetSize(16, 16)
    b.tick:SetPoint("LEFT", b.count, "RIGHT", 3, 0)
    b.tick:Hide()
    b:SetScript("OnClick", function()
        if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_ABILITY_PAGE_TURN) or 836) end
        GameTooltip:Hide()
        FDJ.OpenTier05Chain()
    end)
    b:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L("TIER05_CHAIN"), 1, 0.82, 0)
        GameTooltip:AddLine(L("TIER05_CHAIN_TIP"), 1, 1, 1, true)
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    -- the step follows the quest log while the page is open
    local pending
    b:SetScript("OnEvent", function(self)
        if pending or not self:IsVisible() then return end
        pending = true
        local function again()
            pending = nil
            if self:IsVisible() and self.fdjUpdate then pcall(self.fdjUpdate) end
        end
        if C_Timer and C_Timer.After then C_Timer.After(0.5, again) else again() end
    end)
    for _, event in ipairs({ "QUEST_TURNED_IN", "QUEST_ACCEPTED", "QUEST_REMOVED", "QUEST_LOG_UPDATE" }) do
        pcall(b.RegisterEvent, b, event)
    end
    return b
end
local function PlaceButton(panel)
    if not (panel and panel.compact) then return end
    local b = Button(panel)
    b.text:SetText(L("TIER05_CHAIN"))
    local cur, total, done, started = FDJ.Tier05Progress()
    if cur and started then
        b.count:SetText(done and ("|cff40ff59" .. total .. "/" .. total .. "|r") or (cur .. "/" .. total))
        b.count:Show()
    else
        b.count:SetText("")
        b.count:Hide()
    end
    b.tick:SetShown(done == true)
    local w = 5 + 24 + 3 + (b.text:GetStringWidth() or 130) + 12
    if b.count:IsShown() then w = w + 8 + (b.count:GetStringWidth() or 30) end
    if done then w = w + 19 end
    b:SetWidth(math.ceil(w))
    -- level with Tier Sets (the Compact view button's line), centred under
    -- the Character Logs icon (without it: over the first row's bracers).
    -- tiertop (2.1.6): the icon is put away on this page; its place still counts.
    b:ClearAllPoints()
    local f = _G.ForeverDungeonJournalFrame
    local icon = f and f.runLogButton
    local over = (icon and icon:GetParent() and icon:GetParent():IsVisible() and icon:GetCenter() and icon) or nil
    if not over then
        local row = panel.rows and panel.rows[1]
        local cell = row and row:IsShown() and row.cells and row.cells[4]
        if cell and cell:IsShown() then over = cell end
    end
    local ox = over and over:GetCenter()
    local _, cy = panel.compact:GetCenter()
    local left, top = panel:GetLeft(), panel:GetTop()
    if ox and cy and left and top then
        local s = (over:GetEffectiveScale() or 1) / (panel:GetEffectiveScale() or 1)
        local cs = (panel.compact:GetEffectiveScale() or 1) / (panel:GetEffectiveScale() or 1)
        b:SetPoint("CENTER", panel, "TOPLEFT", ox * s - left, cy * cs - top)
    else
        b:SetPoint("RIGHT", panel.compact, "LEFT", -8, 0)
    end
    b:Show()
end
local function Place()
    local panel = _G.ForeverDungeonJournalTierPanel
    if panel then pcall(PlaceButton, panel) end
end
local baseOpen = FDJ.OpenTierPage
if baseOpen then
    FDJ.OpenTierPage = function(...)
        local r = baseOpen(...)
        local panel = _G.ForeverDungeonJournalTierPanel
        if panel then
            Place()
            local b = panel.fdjT05
            if b then b.fdjUpdate = Place end
            -- (placed again once the page is laid out, and with the journal's size)
            if C_Timer and C_Timer.After then C_Timer.After(0, Place) end
            if not panel.fdjT05Hooked and panel.HookScript then
                panel.fdjT05Hooked = true
                panel:HookScript("OnSizeChanged", function() if C_Timer and C_Timer.After then C_Timer.After(0, Place) end end)
            end
        end
        return r
    end
end

-- ------------------------------------------------ what's in the boxes
-- t05boxes: a box (a quest reward) clicked opens the row of its pieces, the
-- row a set piece opens (Core/Journal.lua, setstrip), its tooltip saying so.
do
    local strings = {
        enUS = { "Click to see the pieces inside", "Click to hide the pieces" },
        deDE = { "Klicken, um die Teile darin zu sehen", "Klicken, um die Teile auszublenden" },
        frFR = { "Cliquez pour voir les pièces qu'il contient", "Cliquez pour masquer les pièces" },
        esES = { "Haz clic para ver las piezas que contiene", "Haz clic para ocultar las piezas" },
        itIT = { "Clicca per vedere i pezzi contenuti", "Clicca per nascondere i pezzi" },
        ptBR = { "Clique para ver as peças que contém", "Clique para ocultar as peças" },
        ruRU = { "Щелкните, чтобы увидеть предметы внутри", "Щелкните, чтобы скрыть предметы" },
        koKR = { "클릭하여 들어 있는 부위 보기", "클릭하여 부위 숨기기" },
        zhCN = { "点击查看其中的部件", "点击隐藏部件" },
        zhTW = { "點擊查看其中的部件", "點擊隱藏部件" },
    }
    strings.esMX = strings.esES
    for locale, pair in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            if t.BOX_CLICK_SHOW == nil then t.BOX_CLICK_SHOW = pair[1] end
            if t.BOX_CLICK_HIDE == nil then t.BOX_CLICK_HIDE = pair[2] end
        end
    end
end
do
    local function Box(owner)
        local item = owner and owner.fdjSetClick and not owner.fdjMapLocation and owner.item
        local id = type(item) == "table" and tonumber(item[1]) or nil
        return id and FDJ.BOX_CONTENTS[id] or nil
    end
    local baseSet = FDJ.ItemSetOf
    if baseSet then
        FDJ.ItemSetOf = function(itemID, ...)
            local box = FDJ.BOX_CONTENTS[tonumber(itemID) or 0]
            if box then return box end
            return baseSet(itemID, ...)
        end
    end
    local baseHint = FDJ.SetStripHint
    if baseHint then
        FDJ.SetStripHint = function(tip, owner, ...)
            if Box(owner) then
                tip:AddLine(L(FDJ.setStripOwner == owner and "BOX_CLICK_HIDE" or "BOX_CLICK_SHOW"), 0.35, 1.00, 0.35, true)
                return
            end
            return baseHint(tip, owner, ...)
        end
    end
end
