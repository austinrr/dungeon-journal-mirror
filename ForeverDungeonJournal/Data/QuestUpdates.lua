local ADDON_NAME, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS


FDJ.FOREVER_QUEST_XP_FALLBACK[1490] = 115

FDJ.FOREVER_QUEST_XP_FALLBACK[378] = 5750
FDJ.QUEST_PREREQ_CHAINS[98823] = {{
    id = 95664,
    name = "Elder Knowledge",


    startsInDungeon = true,
}}
FDJ.QUEST_PREREQ_CHAINS[98824] = {{
    id = 95810,
    name = "Lost Relic Carry",
}}
FDJ.QUEST_PREREQ_DETAILS[95664] = {
    objective = "Take the Titan Relic to the Elder Rise in Thunder Bluff and look for someone who can tell you more about it.",
    startItem = {270866, "Titan Relic", 1, "Dropped by: Relic Guardian"},
    pickup = "Titan Relic (dropped by Relic Guardian)",
    level = 31,
    requires = 24,
    turnin = "Bashana Runetotem, Elder Rise, Thunder Bluff",
}
FDJ.FOREVER_QUEST_XP_FALLBACK[95664] = 1400
FDJ.QUEST_PREREQ_DETAILS[95810] = {
    objective = "Deliver the Titan Relic to Prospector Whelgar at the Wetlands excavation site.",
    objectiveInDungeon = false,
    startItem = {270866, "Titan Relic", 1, "Dropped by: Relic Guardian"},
    pickup = "Titan Relic (dropped by Relic Guardian)",
    level = 31,
    requires = 24,
    turnin = "Prospector Whelgar, Whelgar's Excavation Site, Wetlands",
}
FDJ.FOREVER_QUEST_XP_FALLBACK[95810] = 630










FDJ.QUEST_PREREQ_CHAINS[1806] = {
    { id = 1649, name = "The Tome of Valor" },
    { id = 1650, name = "The Tome of Valor" },
    { id = 1651, name = "The Tome of Valor" },
    { id = 1652, name = "The Tome of Valor" },
    { id = 1653, name = "The Test of Righteousness" },
    { id = 1654, name = "The Test of Righteousness" },
}
do
    local RALL = { mapID = 1453, x = 0.505, y = 0.475, label = "Duthorian Rall \226\128\148 Stormwind", targetName = "Duthorian Rall", detail = "Duthorian Rall: Cathedral of Light, Stormwind" }
    local DAPHNE = { mapID = 1436, x = 0.422, y = 0.886, label = "Daphne Stilwell \226\128\148 Westfall", detail = "Daphne Stilwell is in the far south of Westfall" }
    FDJ.QUEST_PREREQ_DETAILS[1649] = {
        level = 20, requires = 20,
        objective = "Speak to Duthorian Rall in Stormwind.",
        pickup = "Tome of Valor: read the book to start the quest",
        startItem = {6776, "Tome of Valor", 1, "Read the book to start the quest"},
        turnin = "Duthorian Rall, Cathedral Square, Stormwind",
        map = RALL, turninMap = RALL,
    }
    FDJ.QUEST_PREREQ_DETAILS[1650] = {
        level = 23, requires = 20,
        objective = "Find Daphne Stilwell in Westfall.",
        pickup = "Duthorian Rall, Cathedral Square, Stormwind",
        turnin = "Daphne Stilwell, Westfall",
        map = RALL, turninMap = DAPHNE,
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[1649] = 390
    FDJ.FOREVER_QUEST_XP_FALLBACK[1650] = 1850
end
FDJ.QUEST_PREREQ_DETAILS[1651] = { level = 25, requires = 20, objective = "Defend Daphne Stilwell from the Defias attack.", pickup = "Daphne Stilwell, Westfall", turnin = "Daphne Stilwell, Westfall", map = { mapID = 1436, x = 0.422, y = 0.886, label = "Daphne Stilwell — Westfall", detail = "Daphne Stilwell is in the far south of Westfall" } }
FDJ.QUEST_PREREQ_DETAILS[1652] = { level = 25, requires = 20, objective = "Speak to Duthorian Rall in Stormwind.", pickup = "Daphne Stilwell, Westfall", turnin = "Duthorian Rall, Cathedral Square, Stormwind" }
FDJ.QUEST_PREREQ_DETAILS[1653] = { level = 21, requires = 20, objective = "Speak to Jordan Stilwell in Ironforge.", pickup = "Duthorian Rall, Cathedral Square, Stormwind", turnin = "Jordan Stilwell, Gates of Ironforge, Dun Morogh" }
FDJ.QUEST_PREREQ_DETAILS[1654] = {
    level = 22, requires = 20,
    objective = "Using Jordan's Weapon Notes, find some Whitestone Oak Lumber, Bailor's Refined Ore Shipment, Jordan's Smithing Hammer, and a Kor Gem, and return them to Jordan Stilwell in Ironforge.",

    requiredItems = {
        {6994, "Whitestone Oak Lumber", 1, "Dropped by: Goblin Woodcarver, The Deadmines"},
        {6993, "Jordan's Refined Ore Shipment", 1, "Reward from the quest Bailor's Ore Shipment: Bailor Stonehand, Thelsamar, Loch Modan"},
        {6895, "Jordan's Smithing Hammer", 1, "Found in: Jordan's Hammer, Shadowfang Keep courtyard"},
        {7083, "Purified Kor Gem", 1, "Reward from the quest Seeking the Kor Gem: Thundris Windweaver, Auberdine, Darkshore. The Corrupted Kor Gem he asks for drops from Blackfathom Tide Priestesses and Oracles at the Blackfathom Deeps entrance and from Blackfathom Sea Witches inside."},
    },
    providedItem = {6996, "Jordan's Weapon Notes", 1, "Given by Jordan Stilwell when you accept the quest"},
    pickup = "Jordan Stilwell, Gates of Ironforge, Dun Morogh",
    turnin = "Jordan Stilwell, Gates of Ironforge, Dun Morogh",
    map = { mapID = 1426, x = 0.526, y = 0.368, label = "Jordan Stilwell — Gates of Ironforge", detail = "Jordan Stilwell stands outside the gates of Ironforge" },
}
FDJ.QUEST_PREREQ_DETAILS[1806] = { level = 22, requires = 20, objective = "Wait for Jordan Stilwell to finish forging a weapon for you.", pickup = "Jordan Stilwell, Gates of Ironforge, Dun Morogh", turnin = "Jordan Stilwell, Gates of Ironforge, Dun Morogh", description = "Final step. Rewards Verigan's Fist." }
FDJ.PREREQ_REWARD_ITEMS_FALLBACK[1806] = { items = { {6953, "Verigan's Fist", 3} }, choice = false }
FDJ.FOREVER_QUEST_XP_FALLBACK[1806] = 5500








FDJ.QUEST_PREREQ_CHAINS[95140] = {
    { id = 91858, name = "Diplomatic Incident" },
    { id = 91859, name = "A Curious Pair" },
    { id = 91860, name = "A Grim Fate" },
    { id = 91861, name = "Into Fenris Keep" },
    { id = 91862, name = "Lumina Windsinger" },
    { id = 96204, name = "The Windshaper's Wrath" },
    { id = 95034, name = "The Debt" },
    { id = 95036, name = "A Moon-Kissed Blade" },
    { id = 95111, name = "An Underrated Talent" },
    { id = 95125, name = "Ott's Masterwork" },
    { id = 95126, name = "The Moonsilver Blade" },
}
FDJ.QUEST_PREREQ_DETAILS[95034] = {
    level = 24, requires = 18,
    objective = "Speak with Lumina Windsinger in the Sepulcher.",
    pickup = "Lumina Windsinger, The Sepulcher, Silverpine Forest",
    turnin = "Lumina Windsinger, The Sepulcher, Silverpine Forest",
    description = "The questline starts at level 18 with Diplomatic Incident from Danitha Morr at Bandarion Keep, Tirisfal Glades. It takes you to Fenris Isle, where you free Lumina Windsinger from Fenris Keep.",
    map = { mapID = 1421, x = 0.433, y = 0.410, label = "Lumina Windsinger — The Sepulcher", targetName = "Lumina Windsinger" },
}
FDJ.QUEST_PREREQ_DETAILS[95036] = {
    level = 25, requires = 20,
    objective = "Speak with Trevan Rol in the Sepulcher and bring him the materials he requires.",

    requiredItems = {
        {6994, "Whitestone Oak Lumber", 1, "Dropped by: Goblin Woodcarver, The Deadmines"},
        {267361, "Enchanted Silver Ingot", 1, "Found on a table in Archmage Arugal's room at the end of Shadowfang Keep, after you kill him"},
        {272448, "Purified Kor Gem", 1, "Reward from the quest Seeking the Kor Gem: Ulric Frostveil, Zoram'gar Outpost, Ashenvale. The Corrupted Kor Gem he asks for drops from Blackfathom Tide Priestesses and Oracles at the Blackfathom Deeps entrance and from Blackfathom Sea Witches inside, once you have his quest."},
    },
    providedItem = {267454, "Trevan's Weapon Notes", 1, "Given by Trevan Rol in the Sepulcher"},
    pickup = "Lumina Windsinger, The Sepulcher, Silverpine Forest",
    turnin = "Trevan Rol, The Sepulcher, Silverpine Forest",
    map = { mapID = 1421, x = 0.433, y = 0.410, label = "Lumina Windsinger — The Sepulcher", targetName = "Lumina Windsinger" },
    turninMap = { mapID = 1421, x = 0.434, y = 0.410, label = "Trevan Rol — The Sepulcher", targetName = "Trevan Rol" },
}
FDJ.QUEST_PREREQ_DETAILS[95111] = {
    level = 25, requires = 20,
    objective = "Speak with Ott and ask him to forge your blade.",
    pickup = "Trevan Rol, The Sepulcher, Silverpine Forest",
    turnin = "Ott, Tarren Mill, Hillsbrad Foothills",
    map = { mapID = 1421, x = 0.434, y = 0.410, label = "Trevan Rol — The Sepulcher", targetName = "Trevan Rol" },
    turninMap = { mapID = 1424, x = 0.604, y = 0.262, label = "Ott — Tarren Mill", targetName = "Ott" },
}
FDJ.QUEST_PREREQ_DETAILS[95125] = {
    level = 25, requires = 20,
    objective = "Watch as Ott forges your blade.",
    pickup = "Ott, Tarren Mill, Hillsbrad Foothills",
    turnin = "Ott, Tarren Mill, Hillsbrad Foothills",
    map = { mapID = 1424, x = 0.604, y = 0.262, label = "Ott — Tarren Mill", targetName = "Ott" },
}
FDJ.QUEST_PREREQ_DETAILS[95126] = {
    level = 25, requires = 20,
    objective = "Bring Ott's Masterwork to Trevan Rol in Silverpine Forest.",
    pickup = "Ott, Tarren Mill, Hillsbrad Foothills",
    turnin = "Trevan Rol, The Sepulcher, Silverpine Forest",
    map = { mapID = 1424, x = 0.604, y = 0.262, label = "Ott — Tarren Mill", targetName = "Ott" },
    turninMap = { mapID = 1421, x = 0.434, y = 0.410, label = "Trevan Rol — The Sepulcher", targetName = "Trevan Rol" },
}
FDJ.PREREQ_REWARD_ITEMS_FALLBACK[95126] = { items = { {268484, "Moonsilver Blade", 2} }, choice = false }
FDJ.QUEST_PREREQ_DETAILS[95140] = { level = 26, requires = 20, objective = "Use the Moonsilver Blade to destroy Old-Fire Eye in Silverpine Forest.", pickup = "Lumina Windsinger, The Sepulcher, Silverpine Forest", turnin = "Lumina Windsinger, The Sepulcher, Silverpine Forest", description = "Final step. Old Fire-Eye is at the Greymane Wall in southern Silverpine Forest. Rewards Wolfsbane." }
FDJ.PREREQ_REWARD_ITEMS_FALLBACK[95140] = { items = { {267369, "Wolfsbane", 3} }, choice = false }
FDJ.FOREVER_QUEST_XP_FALLBACK[95140] = 2650


do
    local DANITHA = { mapID = 1420, x = 0.220, y = 0.446, label = "Danitha Morr — Bandarion Keep, Tirisfal Glades", targetName = "Danitha Morr" }
    local TREVAN = { mapID = 1421, x = 0.434, y = 0.410, label = "Trevan Rol — The Sepulcher", targetName = "Trevan Rol" }
    local BALDREN = { mapID = 1421, x = 0.456, y = 0.418, label = "Deathguard Baldren — The Sepulcher", targetName = "Deathguard Baldren" }
    local REMAINS = { mapID = 1421, x = 0.650, y = 0.342, label = "Charred Remains — Fenris Isle", targetName = "Charred Remains" }
    local LUMINA_KEEP = { mapID = 1421, x = 0.657, y = 0.274, label = "Lumina Windsinger — Fenris Keep", targetName = "Lumina Windsinger" }
    local LUMINA = { mapID = 1421, x = 0.433, y = 0.410, label = "Lumina Windsinger — The Sepulcher", targetName = "Lumina Windsinger" }
    local D = FDJ.QUEST_PREREQ_DETAILS
    D[91858] = {
        level = 22, requires = 18,
        objective = "Travel to The Sepulcher in Silverpine Forest and speak with Trevan Rol about the missing Earthen Ring travelers.",
        pickup = "Danitha Morr, Bandarion Keep, Tirisfal Glades",
        turnin = "Trevan Rol, The Sepulcher, Silverpine Forest",
        map = DANITHA, turninMap = TREVAN,
    }
    D[91859] = {
        level = 22, requires = 18,
        objective = "Speak with Deathguard Baldren about the mysterious Earthen Ring travelers who recently passed through The Sepulcher.",
        pickup = "Trevan Rol, The Sepulcher, Silverpine Forest",
        turnin = "Deathguard Baldren, The Sepulcher, Silverpine Forest",
        map = TREVAN, turninMap = BALDREN,
    }
    D[91860] = {
        level = 22, requires = 18,
        objective = "Investigate Fenris Isle to the east and learn the fate of the Earthen Ring traveling party.",
        pickup = "Deathguard Baldren, The Sepulcher, Silverpine Forest",
        turnin = "Charred Remains, Fenris Isle, Silverpine Forest",
        map = BALDREN, turninMap = REMAINS,
    }
    D[91861] = {
        level = 22, requires = 18,
        objective = "Investigate Fenris Keep to the north and attempt to locate the missing member of the Earthen Ring party.",
        pickup = "Charred Remains, Fenris Isle, Silverpine Forest",
        turnin = "Lumina Windsinger, Fenris Keep, Silverpine Forest",
        map = REMAINS, turninMap = LUMINA_KEEP,
    }
    D[91862] = {
        level = 22, requires = 18,
        objective = "Retrieve the Fenris Isle Key from the Rot Hide Gnolls and use it to free Lumina Windsinger.",
        requiredItems = { {267412, "Fenris Isle Key", 1, "Dropped by the Rot Hide gnolls on Fenris Isle (Rot Hide Savage, Raging Rot Hide, Rot Hide Bruiser, Snarlmane)", map = { mapID = 1421, x = 0.656, y = 0.238, label = "Rot Hide gnolls — Fenris Isle", detail = "Dropped by the Rot Hide gnolls on Fenris Isle (Rot Hide Savage, Raging Rot Hide, Rot Hide Bruiser, Snarlmane)" }} },
        pickup = "Lumina Windsinger, Fenris Keep, Silverpine Forest",
        turnin = "Lumina Windsinger, Fenris Keep, Silverpine Forest",
        map = LUMINA_KEEP,
    }
    D[96204] = {
        level = 22, requires = 18,
        objective = "Accompany Lumina Windsinger and help her escape Fenris Keep.",
        pickup = "Lumina Windsinger, Fenris Keep, Silverpine Forest",
        turnin = "Lumina Windsinger, The Sepulcher, Silverpine Forest",
        map = LUMINA_KEEP, turninMap = LUMINA,
    }
end






do
    local TABETHA = { mapID = 1445, x = 0.460, y = 0.570, label = "Tabetha — Dustwallow Marsh", targetName = "Tabetha" }
    local TIRTH = { mapID = 1441, x = 0.782, y = 0.758, label = "Magus Tirth — Shimmering Flats", targetName = "Magus Tirth" }
    FDJ.QUEST_PREREQ_CHAINS[1951] = {


        { id = 1947, name = "Journey to the Marsh" },
        { id = 1949, name = "Hidden Secrets" },
        { id = 1950, name = "Get the Scoop" },
    }
    FDJ.QUEST_PREREQ_DETAILS[1947] = {
        level = 38, requires = 30,
        objective = "Speak with Tabetha.",
        pickup = "Your mage trainer in a capital city: Jennea Cannon (Stormwind), Bink (Ironforge), Deino (Orgrimmar), Ursyn Ghull (Thunder Bluff) or Anastasia Hartwell (Undercity)",
        pickupAlliance = "Your mage trainer in a capital city: Jennea Cannon (Stormwind) or Bink (Ironforge)",
        pickupHorde = "Your mage trainer in a capital city: Deino (Orgrimmar), Ursyn Ghull (Thunder Bluff) or Anastasia Hartwell (Undercity)",
        turnin = "Tabetha, Dustwallow Marsh",
        turninMap = TABETHA,
    }
    FDJ.QUEST_PREREQ_DETAILS[1949] = {
        level = 38, requires = 30,
        objective = "Speak with Magus Tirth in the Shimmering Flats.",
        pickup = "Tabetha, Dustwallow Marsh",
        turnin = "Magus Tirth, Shimmering Flats, Thousand Needles",
        map = TABETHA, turninMap = TIRTH,
    }
    FDJ.QUEST_PREREQ_DETAILS[1950] = {
        level = 30, requires = 30,
        objective = "Find the phrase to Tirth's strongbox, then return to Tirth.",
        pickup = "Magus Tirth, Shimmering Flats, Thousand Needles",
        turnin = "Magus Tirth, Shimmering Flats, Thousand Needles",
        map = TIRTH,
    }
end






do
    local GIVER = {
        Alliance = { text = "Garion Wendell, Stormwind",
            map = { mapID = 1453, x = 0.488, y = 0.866, label = "Garion Wendell — Stormwind", targetName = "Garion Wendell" } },
        Horde = { text = "Owen Thadd, Undercity",
            map = { mapID = 1458, x = 0.736, y = 0.330, label = "Owen Thadd — Undercity", targetName = "Owen Thadd" } },
    }
    local function Apply()
        if type(UnitFactionGroup) ~= "function" then return end
        local ok, faction = pcall(UnitFactionGroup, "player")
        if not ok or (type(issecretvalue) == "function" and issecretvalue(faction)) then return end
        local giver = GIVER[faction]
        local d = FDJ.DB and FDJ.DB["Zul'Farrak"]
        if not giver or not d then return end
        for _, q in ipairs(d.quests or {}) do
            if q.id == 82084 then
                q.pickup, q.turnin, q.startMap = giver.text, giver.text, giver.map
            end
        end
    end
    Apply()
    if CreateFrame then
        local f = CreateFrame("Frame")
        f:RegisterEvent("PLAYER_LOGIN")
        f:SetScript("OnEvent", Apply)
    end
end




FDJ.QUEST_PREREQ_CHAINS[6521] = {
    { id = 6522, name = "An Unholy Alliance" },
}
FDJ.QUEST_PREREQ_DETAILS[6522] = { level = 36, requires = 28, objective = "Take the Small Scroll to Varimathras in the Undercity.", pickup = "Small Scroll, dropped by Charlga Razorflank", startItem = {17008, "Small Scroll", 1, "Drops from Charlga Razorflank in Razorfen Kraul"}, turnin = "Varimathras, Royal Quarter, Undercity" }
FDJ.QUEST_PREREQ_DETAILS[6521] = { level = 36, requires = 28, objective = "Bring Ambassador Malcin's Head to Varimathras in the Undercity.", pickup = "Varimathras, Royal Quarter, Undercity", turnin = "Varimathras, Royal Quarter, Undercity", description = "Final step. Ambassador Malcin is outside Razorfen Downs." }
FDJ.PREREQ_REWARD_ITEMS_FALLBACK[6521] = { items = { {17039, "Skullbreaker", 2}, {17042, "Nail Spitter", 2}, {17043, "Zealot's Robe", 2}, {270054, "Cultist's Chestguard", 3} }, choice = true }
FDJ.PREREQ_REWARD_MONEY_FALLBACK[6521] = 2000
FDJ.FOREVER_QUEST_XP_FALLBACK[6521] = 3500


FDJ.QUEST_SHAREABILITY_AUDIT[95809] = false
FDJ.QUEST_SHAREABILITY_AUDIT[95664] = false
FDJ.QUEST_SHAREABILITY_AUDIT[95810] = false


for _, content in pairs(FDJ.ContentLocales or {}) do
    local quests = content.quests or {}
    if quests[95809] then
        quests[95809].pickup = nil
        quests[95809].objective = nil
    end
end




FDJ.QUEST_PREREQ_CHAINS[5724] = {
    { id = 5722, name = "Searching for the Lost Satchel" },
}
FDJ.QUEST_PREREQ_DETAILS[5722] = { level = 16, requires = 9, objective = "Find Maur Grimtotem's corpse inside Ragefire Chasm and search it for anything of interest.", pickup = "Rahauro, Elder Rise, Thunder Bluff", turnin = "Maur Grimtotem's corpse inside Ragefire Chasm. From the first major three-way junction, take the right-hand tunnel, follow it uphill toward the dead end, then enter the small side room on the left. Interact with Maur's corpse there.", map = { mapID = 1456, x = 0.7040, y = 0.3220, label = "Rahauro" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[5722] = 880
FDJ.QUEST_PREREQ_CHAINS[1394] = {
    { id = 1149, name = "Test of Faith" },
    { id = 1150, name = "Test of Endurance" },
    { id = 1151, name = "Test of Strength" },
    { id = 1152, name = "Test of Lore" },
    { id = 1154, name = "Test of Lore" },
    { id = 6627, name = "Test of Lore" },
    { id = 1159, name = "Test of Lore" },
    { id = 1160, name = "Test of Lore" },
    { id = 6628, name = "Test of Lore" },
}
FDJ.QUEST_PREREQ_DETAILS[1149] = { level = 26, requires = 25, objective = "If you have faith, leap from the planks overlooking Thousand Needles.", pickup = "Dorn Plainstalker, Thousand Needles", turnin = "Dorn Plainstalker, Thousand Needles", map = { mapID = 1441, x = 0.538, y = 0.414, label = "Dorn Plainstalker — Thousand Needles", detail = "Dorn Plainstalker in Thousand Needles" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[1149] = 1050
FDJ.QUEST_PREREQ_DETAILS[1150] = { level = 30, requires = 25, objective = "Bring Grenka's Claw to Dorn Plainstalker in Thousand Needles.", pickup = "Dorn Plainstalker, Thousand Needles", turnin = "Dorn Plainstalker, Thousand Needles", map = { mapID = 1441, x = 0.538, y = 0.414, label = "Dorn Plainstalker — Thousand Needles", detail = "Dorn Plainstalker in Thousand Needles" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[1150] = 2450
FDJ.QUEST_PREREQ_DETAILS[1151] = { level = 30, requires = 25, objective = "Bring Fragments of Rok'Alim to Dorn Plainstalker in Thousand Needles.", pickup = "Dorn Plainstalker, Thousand Needles", turnin = "Dorn Plainstalker, Thousand Needles", map = { mapID = 1441, x = 0.538, y = 0.414, label = "Dorn Plainstalker — Thousand Needles", detail = "Dorn Plainstalker in Thousand Needles" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[1151] = 3050
FDJ.QUEST_PREREQ_DETAILS[1152] = { level = 30, requires = 25, objective = "Find Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains.", pickup = "Dorn Plainstalker, Thousand Needles", turnin = "Braug Dimspirit, Talondeep Path, Stonetalon Mountains", suppressDescription = true, map = { mapID = 1441, x = 0.538, y = 0.414, label = "Dorn Plainstalker — Thousand Needles", detail = "Dorn Plainstalker in Thousand Needles" }, turninMap = { mapID = 1442, x = 0.786, y = 0.454, label = "Braug Dimspirit — Stonetalon Mountains", detail = "Near the entrance to Talondeep Path" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[1152] = 1200
FDJ.QUEST_PREREQ_DETAILS[1154] = { level = 30, requires = 25, objective = "Find the Legacy of the Aspects and return it to Braug Dimspirit near the entrance to Talondeep Path in Stonetalon Mountains.", pickup = "Braug Dimspirit, Talondeep Path, Stonetalon Mountains", turnin = "Braug Dimspirit, Talondeep Path, Stonetalon Mountains", map = { mapID = 1442, x = 0.786, y = 0.454, label = "Braug Dimspirit — Stonetalon Mountains", detail = "Near the entrance to Talondeep Path" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[1154] = 1850














FDJ.QUEST_PREREQ_DETAILS[1154].objectiveMap = { mapID = 1440, x = 0.755, y = 0.745, label = "Dor'Danil Barrow Den \226\128\148 Ashenvale", noteKey = "ARROW_ASPECTS_BOOK",
    markerType = "location", exact = true, pickUp = true }












do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local IN, DOWN, LEFT = "Into the barrow den", "Down to the bottom", "Left at the bottom, to the book in the big room"

    local function P(x, y, label) return { mapID = 1440, x = x, y = y, label = label, keep = true, labelNear = 150 } end
    FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1440", 0.755, 0.745)] = { reach = 4, leg = 3,
        P(0.7590, 0.7530, IN), P(0.7626, 0.7501, IN), P(0.7648, 0.7490, IN), P(0.7699, 0.7490, IN),
        P(0.7706, 0.7480, DOWN), P(0.7756, 0.7480, DOWN), P(0.7793, 0.7523, DOWN), P(0.7822, 0.7534, DOWN),
        P(0.7843, 0.7501, DOWN), P(0.7843, 0.7447, DOWN), P(0.7822, 0.7415, DOWN), P(0.7807, 0.7415, DOWN),
        P(0.7691, 0.7425, LEFT), P(0.7670, 0.7371, LEFT), P(0.7648, 0.7328, LEFT), P(0.7605, 0.7328, LEFT),
        P(0.7590, 0.7339, LEFT), P(0.7576, 0.7371, LEFT), P(0.7569, 0.7436, LEFT), P(0.7554, 0.7458, LEFT),
    }
    local LINES = {
        deDE = { "In den Grabhügel hinein", "Ganz nach unten", "Unten links, zum Buch im großen Raum" },
        frFR = { "Entrez dans le refuge", "Descendez tout en bas", "En bas à gauche, jusqu'au livre dans la grande salle" },
        esES = { "Entra en el túmulo", "Baja hasta el fondo", "Abajo a la izquierda, hasta el libro en la sala grande" },
        itIT = { "Entra nel tumulo", "Scendi fino in fondo", "In fondo a sinistra, fino al libro nella sala grande" },
        ptBR = { "Entre no túmulo", "Desça até o fundo", "Embaixo à esquerda, até o livro na sala grande" },
        ruRU = { "Войдите в курган", "Спуститесь в самый низ", "Внизу налево, к книге в большом зале" },
        koKR = { "굴 안으로 들어가세요", "맨 아래까지 내려가세요", "아래에서 왼쪽, 큰 방의 책으로" },
        zhCN = { "进入巢穴", "下到最底层", "到底后向左，前往大厅里的书" },
        zhTW = { "進入巢穴", "下到最底層", "到底後向左，前往大廳裡的書" },
    }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, lines in pairs(LINES) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.places = content.places or {}
        for i, english in ipairs({ IN, DOWN, LEFT }) do
            if content.places[english] == nil then content.places[english] = lines[i] end
        end
    end
end
do
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    local fr = FDJ.ContentLocales.frFR or {}
    FDJ.ContentLocales.frFR = fr
    fr.places = fr.places or {}
    if fr.places["Dor'Danil Barrow Den"] == nil then fr.places["Dor'Danil Barrow Den"] = "Refuge des saisons de Dor'danil" end

    for lang, name in pairs({ koKR = "잿빛 골짜기", zhCN = "灰谷", zhTW = "梣谷" }) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.places = content.places or {}
        if content.places["Ashenvale"] == nil then content.places["Ashenvale"] = name end
    end
    local strings = {
        enUS = "The book is at the bottom of the barrow den, on a stone podium",
        deDE = "Das Buch liegt ganz unten im Grabhügel, auf einem Steinpodest",
        frFR = "Le livre est tout en bas du refuge, sur un petit socle de pierre",
        esES = "El libro está al fondo del túmulo, sobre un pedestal de piedra",
        itIT = "Il libro è in fondo al tumulo, su un piedistallo di pietra",
        ptBR = "O livro fica no fundo do túmulo, sobre um pedestal de pedra",
        ruRU = "Книга в самом низу кургана, на каменном постаменте",
        koKR = "책은 굴 맨 아래쪽 돌 받침대 위에 있습니다",
        zhCN = "书在巢穴最底层的石台上",
        zhTW = "書在巢穴最底層的石台上",
    }
    strings.esMX = strings.esES
    for locale, text in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ARROW_ASPECTS_BOOK == nil then t.ARROW_ASPECTS_BOOK = text end
    end
end
FDJ.QUEST_PREREQ_DETAILS[6627] = { level = 30, requires = 25, objective = "Answer Braug Dimspirit's question successfully and then speak to him again.", pickup = "Braug Dimspirit, Talondeep Path, Stonetalon Mountains", turnin = "Braug Dimspirit, Talondeep Path, Stonetalon Mountains", warning = "ANSWER: Neltharion", map = { mapID = 1442, x = 0.786, y = 0.454, label = "Braug Dimspirit — Stonetalon Mountains", detail = "Near the entrance to Talondeep Path" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[6627] = 245




do
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    local KEY = "The key from this quest opens a shortcut to the last boss."
    for lang, text in pairs({
        deDE = "Der Schl\195\188ssel aus dieser Quest \195\182ffnet eine Abk\195\188rzung zum letzten Boss.",
        frFR = "La cl\195\169 de cette qu\195\170te ouvre un raccourci vers le dernier boss.",
        esES = "La llave de esta misi\195\179n abre un atajo hacia el \195\186ltimo jefe.",
        itIT = "La chiave di questa missione apre una scorciatoia verso l'ultimo boss.",
        ptBR = "A chave desta miss\195\163o abre um atalho para o \195\186ltimo chefe.",
        ruRU = "\208\154\208\187\209\142\209\135 \208\184\208\183 \209\141\209\130\208\190\208\179\208\190 \208\183\208\176\208\180\208\176\208\189\208\184\209\143 \208\190\209\130\208\186\209\128\209\139\208\178\208\176\208\181\209\130 \208\186\208\190\209\128\208\190\209\130\208\186\208\184\208\185 \208\191\209\131\209\130\209\140 \208\186 \208\191\208\190\209\129\208\187\208\181\208\180\208\189\208\181\208\188\209\131 \208\177\208\190\209\129\209\129\209\131.",
        koKR = "\236\157\180 \237\128\152\236\138\164\237\138\184\236\157\152 \236\151\180\236\135\160\235\161\156 \235\167\136\236\167\128\235\167\137 \236\154\176\235\145\144\235\168\184\235\166\172\236\151\144\234\178\140 \234\176\128\235\138\148 \236\167\128\235\166\132\234\184\184\236\157\180 \236\151\180\235\166\189\235\139\136\235\139\164.",
        zhCN = "\230\173\164\228\187\187\229\138\161\232\142\183\229\190\151\231\154\132\233\146\165\229\140\153\229\143\175\228\187\165\230\137\147\229\188\128\233\128\154\229\190\128\230\156\128\229\144\142\228\184\128\228\184\170\233\166\150\233\162\134\231\154\132\230\141\183\229\190\132\227\128\130",
        zhTW = "\230\173\164\228\187\187\229\139\153\231\141\178\229\190\151\231\154\132\233\145\176\229\140\153\229\143\175\228\187\165\230\137\147\233\150\139\233\128\154\229\190\128\230\156\128\229\190\140\228\184\128\229\128\139\233\166\150\233\160\152\231\154\132\230\141\183\229\190\145\227\128\130",
    }) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.places = content.places or {}
        if content.places[KEY] == nil then content.places[KEY] = text end
    end
end


do
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, name in pairs({ frFR = "Zalfan Lunombre", esES = "Zalfan Umbraluna", ptBR = "Zalfan Umbraluna",
        ruRU = "\208\151\208\176\208\187\209\132\208\176\208\189 \208\162\208\181\208\189\209\140 \208\155\209\131\208\189\209\139",
        koKR = "\236\158\152\237\140\144 \235\172\184\236\132\128\235\143\132",
        zhCN = "\230\137\142\229\176\148\229\135\161\194\183\230\156\136\229\189\177",
        zhTW = "\232\150\169\231\136\190\229\135\161\226\128\167\230\156\136\229\189\177" }) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.places = content.places or {}
        if content.places["Zalfan Moonshadow"] == nil then content.places["Zalfan Moonshadow"] = name end
    end
end




FDJ.QUEST_PREREQ_DETAILS[6627].objectiveMap = { mapID = 1442, x = 0.786, y = 0.454, label = "Braug Dimspirit \226\128\148 Stonetalon Mountains", targetName = "Braug Dimspirit", noteKey = "ARROW_LORE_ANSWER", exact = true }
do
    local strings = {
        enUS = "Answer: Neltharion",
        deDE = "Antwort: Neltharion",
        frFR = "R\195\169ponse : Neltharion",
        esES = "Respuesta: Neltharion",
        itIT = "Risposta: Neltharion",
        ptBR = "Resposta: Neltharion",
        ruRU = "\208\158\209\130\208\178\208\181\209\130: \208\157\208\181\208\187\209\130\208\176\209\128\208\184\208\190\208\189",
        koKR = "\236\160\149\235\139\181: \235\132\172\237\131\128\235\166\172\236\152\168",
        zhCN = "\231\173\148\230\161\136\239\188\154\229\165\136\232\144\168\233\135\140\229\165\165",
        zhTW = "\231\173\148\230\161\136\239\188\154\229\165\136\232\150\169\233\135\140\229\165\167",
    }
    strings.esMX = strings.esES
    for locale, text in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ARROW_LORE_ANSWER == nil then t.ARROW_LORE_ANSWER = text end
    end
end
FDJ.QUEST_PREREQ_DETAILS[1159] = { level = 30, requires = 25, objective = "Find Parqual Fintallas in Undercity.", pickup = "Braug Dimspirit, Talondeep Path, Stonetalon Mountains", turnin = "Parqual Fintallas, Undercity", map = { mapID = 1442, x = 0.786, y = 0.454, label = "Braug Dimspirit — Stonetalon Mountains", detail = "Near the entrance to Talondeep Path" } }
FDJ.FOREVER_QUEST_XP_FALLBACK[1159] = 1200

FDJ.QUEST_PREREQ_DETAILS[1160] = { level = 36, requires = 25, objective = "Find The Beginnings of the Undead Threat and return it to Parqual Fintallas in Undercity.", pickup = "Parqual Fintallas, Undercity", turnin = "Parqual Fintallas, Undercity", description = "The book is inside Scarlet Monastery: Library.", map = { mapID = 1458, x = 0.576, y = 0.652, label = "Parqual Fintallas — Undercity", detail = "Parqual Fintallas in Undercity" } }



FDJ.QUEST_PREREQ_DETAILS[1160].objectiveInDungeon = true
FDJ.FOREVER_QUEST_XP_FALLBACK[1160] = 2100
FDJ.QUEST_PREREQ_DETAILS[6628] = { level = 30, requires = 25, objective = "Answer Parqual Fintallas' question successfully and then speak to him again.", pickup = "Parqual Fintallas, Undercity", turnin = "Parqual Fintallas, Undercity", warning = "ANSWER: Ner'zhul", map = { mapID = 1458, x = 0.576, y = 0.652, label = "Parqual Fintallas — Undercity", detail = "Parqual Fintallas in Undercity" } }






FDJ.QUEST_PREREQ_CHAINS[92458] = {
    { id = 92432, name = "An Alarming Request" },
}
FDJ.QUEST_PREREQ_CHAINS[92457] = {
    { id = 92432, name = "An Alarming Request" },
}
FDJ.QUEST_PREREQ_DETAILS[92432] = {
    level = 33,
    requires = 30,
    objective = "Report to the Image of Archmage Modera near the City of Dalaran.",
    pickup = "Emissary Jacques, Southshore, Hillsbrad Foothills",
    turnin = "Image of Archmage Modera, Lordamere Lake near Dalaran",

    map = { mapID = 1424, x = 0.484, y = 0.602, label = "Emissary Jacques — Southshore", detail = "Emissary Jacques in Southshore, Hillsbrad Foothills" },
    description = "Introductory quest leading to Heart of Disruption and Starving Arcane.",
}
FDJ.FOREVER_QUEST_XP_FALLBACK[92457] = 9400
FDJ.FOREVER_QUEST_XP_FALLBACK[92458] = 9400
FDJ.QUEST_SHAREABILITY_AUDIT[92432] = true
FDJ.QUEST_SHAREABILITY_AUDIT[92457] = true
FDJ.QUEST_SHAREABILITY_AUDIT[92458] = false








FDJ.QUEST_PREREQ_CHAINS[96984] = {
    { id = 544, name = "Prison Break In" },
    { id = 93680, name = "Key to the City", shareNormally = true },
    { id = 545, name = "Dalaran Patrols" },
    { id = 92434, name = "Blood in the Streets" },
}

FDJ.QUEST_PREREQ_DETAILS[544] = {
    level = 34,
    requires = 30,
    objective = "Find the four Forsaken traitors at the Lordamere Internment Camp, recover their Bloodstone artifacts, and return to Magus Wordeen Voidglare.",
    pickup = "Magus Wordeen Voidglare, Tarren Mill, Hillsbrad Foothills",
    turnin = "Magus Wordeen Voidglare, Tarren Mill, Hillsbrad Foothills",
    note = "Pick up Key to the City from Magus Wordeen Voidglare at the same time.",
    map = { mapID = 1424, x = 0.615, y = 0.207, label = "Magus Wordeen Voidglare — Tarren Mill", detail = "Inside the building in Tarren Mill" },
}
FDJ.FOREVER_QUEST_XP_FALLBACK[544] = 3350

FDJ.QUEST_PREREQ_DETAILS[93680] = {
    level = 33,
    requires = 30,
    objective = "Acquire the Grimy Key for Magus Wordeen Voidglare in Tarren Mill.",
    requiredItems = {
        {279469, "Grimy Key", 1, "Found while investigating the Dalaran forces around the Lordamere Internment Camp"},
    },
    pickup = "Magus Wordeen Voidglare, Tarren Mill, Hillsbrad Foothills",
    turnin = "Magus Wordeen Voidglare, Tarren Mill, Hillsbrad Foothills",
    note = "This quest can be accepted alongside Prison Break In.",
    map = { mapID = 1424, x = 0.615, y = 0.207, label = "Magus Wordeen Voidglare — Tarren Mill", detail = "Inside the building in Tarren Mill" },
}

FDJ.QUEST_PREREQ_DETAILS[545] = {
    level = 35,
    requires = 30,
    objective = "Kill 6 Dalaran Summoners and 12 Elemental Slaves, then return to Magus Wordeen Voidglare in Tarren Mill.",
    pickup = "Magus Wordeen Voidglare, Tarren Mill, Hillsbrad Foothills",
    turnin = "Magus Wordeen Voidglare, Tarren Mill, Hillsbrad Foothills",
    description = "Available after completing Prison Break In.",
    map = { mapID = 1424, x = 0.615, y = 0.207, label = "Magus Wordeen Voidglare — Tarren Mill", detail = "Inside the building in Tarren Mill" },
}
FDJ.FOREVER_QUEST_XP_FALLBACK[545] = 2050

FDJ.QUEST_PREREQ_DETAILS[92434] = {
    level = 34,
    requires = 30,
    objective = "Find a way into Dalaran along Lordamere Lake.",
    pickup = "Magus Wordeen Voidglare, Tarren Mill, Hillsbrad Foothills",
    turnin = "Image of Archmage Modera, Lordamere Lake near Dalaran",
    providedItem = {279469, "Grimy Key", 1, "Provided for Blood in the Streets"},
    note = "Requires Magus Wordeen Voidglare's Dalaran quests. Stone Tokens and Bracers of Binding from Keeper Bel'varil are optional and are not required for attunement.",
    map = { mapID = 1424, x = 0.615, y = 0.207, label = "Magus Wordeen Voidglare — Tarren Mill", detail = "Inside the building in Tarren Mill" },
    turninMap = { mapID = 1416, x = 0.077, y = 0.588, label = "Image of Archmage Modera — Lordamere Lake near Dalaran", detail = "Outside Dalaran near Lordamere Lake" },
}
FDJ.FOREVER_QUEST_XP_FALLBACK[92434] = 270
FDJ.FOREVER_QUEST_XP_FALLBACK[96984] = 9400

FDJ.QUEST_SHAREABILITY_AUDIT[544] = true
FDJ.QUEST_SHAREABILITY_AUDIT[93680] = true
FDJ.QUEST_SHAREABILITY_AUDIT[545] = true
FDJ.QUEST_SHAREABILITY_AUDIT[92434] = false
FDJ.QUEST_SHAREABILITY_AUDIT[96984] = false


for _, id in ipairs({ 1652, 1653 }) do
    local details = FDJ.QUEST_PREREQ_DETAILS and FDJ.QUEST_PREREQ_DETAILS[id]
    if details and not details.map and FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[id] then
        details.map = FDJ.QUEST_START_MAPS[id]
    end
end


do
    local t = {
        deDE = "Ihr müsst tot sein, um mit ihm zu sprechen. Er befindet sich im Schwarzfels, in einem Raum, an dem Ihr auf dem Weg die Kette hinab nach BRD vorbeikommt.",
        frFR = "Vous devez être mort pour lui parler. Il se trouve dans le mont Rochenoire, dans une salle que vous longez en descendant la chaîne vers les Profondeurs de Rochenoire.",
        esES = "Tienes que estar muerto para hablar con él. Está en la Montaña Roca Negra, en una sala junto a la cadena que baja a las Profundidades de Roca Negra.",
        itIT = "Devi essere morto per parlare con lui. Si trova nella Montagna Rocconera, in una stanza lungo la catena che scende verso le Profondità di Rocconera.",
        ptBR = "Você precisa estar morto para falar com ele. Ele fica na Montanha Rocha Negra, numa sala ao longo da corrente que desce até as Profundezas Rocha Negra.",
        ruRU = "Чтобы поговорить с ним, нужно быть мертвым. Он находится в Черной горе, в комнате у цепи, по которой спускаются к Глубинам Черной горы.",
        koKR = "죽은 상태에서만 대화할 수 있습니다. 검은바위 산에서 검은바위 나락으로 내려가는 사슬 길 옆 방에 있습니다.",
        zhCN = "你必须处于死亡状态才能与他交谈。他在黑石山中，位于沿锁链走向黑石深渊途中的一个房间里。",
        zhTW = "你必須處於死亡狀態才能與他交談。他在黑石山中，位於沿鎖鏈走向黑石深淵途中的一個房間裡。",
    }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for loc, text in pairs(t) do
        local c = FDJ.ContentLocales[loc] or {}
        FDJ.ContentLocales[loc] = c
        c.quests = c.quests or {}
        c.quests[3801] = c.quests[3801] or {}
        c.quests[3801].warning = text
    end
end




do
    local DEAD_DROP = {"Dead Drop", "Interface\\Icons\\INV_Box_02", "A chest in a hut beside Pyrewood Village, Silverpine Forest"}
    local function DropMap() return { mapID = 1421, x = 0.471, y = 0.711, label = "Dead Drop — Pyrewood Village", detail = "A chest in a hut beside Pyrewood Village" } end
    local WHERE = "Dead Drop, Pyrewood Village, Silverpine Forest"
    local SOLO = "Solo job: you must do it alone, outside any group."
    FDJ.QUEST_PREREQ_CHAINS[78307] = {
        { id = 78261, name = "The Horn of Xelthos" },
    }
    FDJ.QUEST_PREREQ_CHAINS[78699] = {
        { id = 78261, name = "The Horn of Xelthos" },
        { id = 78307, name = "The Horn of Xelthos" },
        { id = 78676, name = "The Eye of Bhossca" },
    }
    FDJ.QUEST_PREREQ_DETAILS[78261] = {
        level = 23, requires = 20,
        warning = SOLO,
        objective = "Find The Horn of Xelthos inside of Shadowfang Keep. Then, return it to C's dead drop near Pyrewood Village. You must complete the job alone.",
        requiredItems = {
            {210186, "Breaching Charge", 1, "From Veenix, Stonetalon Mountains, for a Venture Co. Work Order. Blows open the courtyard gate of Shadowfang Keep", map = { mapID = 1442, x = 0.582, y = 0.517, label = "Veenix — Stonetalon Mountains", detail = "From Veenix, Stonetalon Mountains, for a Venture Co. Work Order. Blows open the courtyard gate of Shadowfang Keep" }},
            {210209, "Twin Key", 1, "Combine the Sister's Half-Key and the Brother's Half-Key, picked from the sister (dining hall) and the brother (upstairs) in Shadowfang Keep. Combining them breaks stealth"},
            {210183, "Horn of Xelthos", 1, "Found in: a locked chest in the courtyard stables of Shadowfang Keep. Open it with the Twin Key"},
        },
        startObject = DEAD_DROP, pickup = WHERE, turnin = WHERE, map = DropMap(),
    }
    FDJ.QUEST_PREREQ_DETAILS[78307] = {
        level = 23, requires = 20,
        objective = "Collect C's payment from the Dead Drop near Pyrewood Village.",
        description = "Offered after C's next letter reaches you in a capital city.",
        startObject = DEAD_DROP, pickup = WHERE, turnin = WHERE, map = DropMap(),
    }
    FDJ.QUEST_PREREQ_DETAILS[78676] = {
        level = 35, requires = 25,
        warning = SOLO,
        objective = "Find The Eye of Bhossca inside of the Scarlet Monastery. Then, return it to C's dead drop near Pyrewood Village. You must complete the job alone.",
        requiredItems = {
            {210955, "Scarlet Initiate's Uniform", 1, "Found in: the Supply Locker in the stables behind the Scarlet Monastery. Wear it to pass the Scarlet Crusade"},
            {210963, "Scryer's Key", 1, "Pick pocket a Scarlet Scryer in the first big room of the Scarlet Monastery Graveyard"},
            {210967, "Confidential Message", 1, "Found in: the Personal Letterbox in Arcanist Doan's room, Scarlet Monastery Library. Open it with the Scryer's Key"},
            {210968, "Reliquary Key", 1, "Found in: the Stone Coffer in the mausoleum on the north side of the Scarlet Monastery Graveyard. It opens after you sit on both benches between the two statues"},
            {210953, "Eye of Bhossca", 1, "Found in: the Padlocked Reliquary in the first small room on the left of the Scarlet Monastery Library. Open it with the Reliquary Key"},
        },
        startObject = DEAD_DROP, pickup = WHERE, turnin = WHERE, map = DropMap(),
    }
    FDJ.QUEST_PREREQ_DETAILS[78699] = {
        level = 35, requires = 25,
        objective = "Collect C's payment from the Dead Drop near Pyrewood Village.",
        description = "Offered after C's next letter reaches you in a capital city.",
        startObject = DEAD_DROP, pickup = WHERE, turnin = WHERE, map = DropMap(),
    }
    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[78307] = { items = { {277210, "Pyrewood Signet Ring", 3} }, choice = false }
    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[78699] = { items = { {277246, "Ruby-Adorned Blade", 3} }, choice = false }
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[78307] = 3000
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[78699] = 7500
    FDJ.FOREVER_QUEST_XP_FALLBACK[78261] = 1850
    FDJ.FOREVER_QUEST_XP_FALLBACK[78307] = 6900
    FDJ.FOREVER_QUEST_XP_FALLBACK[78676] = 3450
    FDJ.FOREVER_QUEST_XP_FALLBACK[78699] = 6900

    for _, id in ipairs({ 78261, 78307, 78676, 78699 }) do
        FDJ.QUEST_SHAREABILITY_AUDIT[id] = false
    end
end










do
    local function Fahrad() return { mapID = 1416, x = 0.845, y = 0.803, label = "Fahrad — Ravenholdt Manor", targetName = "Fahrad" } end
    local AT_FAHRAD = "Fahrad, Ravenholdt Manor, Alterac Mountains"
    FDJ.QUEST_PREREQ_CHAINS[80411] = {
        { id = 6681, name = "The Manor, Ravenholdt" },
        { id = 78261, name = "The Horn of Xelthos" },
        { id = 78307, name = "The Horn of Xelthos" },
        { id = 78676, name = "The Eye of Bhossca" },
        { id = 78699, name = "The Eye of Bhossca" },
        { id = 80526, name = "Fool Me Twice" },
    }
    FDJ.QUEST_PREREQ_DETAILS[6681] = {
        level = 24, requires = 24,
        objective = "Take the Seal of Ravenholdt to Fahrad at Ravenholdt Manor, hidden away in the hills of Hillsbrad.",



        warning = "Train Detect Traps first: walking past the trapped chest in the cave passage into the manor completes the test (Fahrad teaches it too).",
        description = "Get the letter that starts this quest. Horde: a rogue trainer's option \"May I have it, please.\" Alliance: Mathias Shaw in Stormwind.",
        startItem = {17126, "Elegant Letter", 1, "Horde: from a rogue trainer (\"May I have it, please.\"). Alliance: from Mathias Shaw, Stormwind"},
        pickup = "Elegant Letter, from a rogue trainer",
        turnin = AT_FAHRAD, turninMap = Fahrad(),
    }
    FDJ.QUEST_PREREQ_DETAILS[80526] = {
        level = 50, requires = 45,
        objective = "Speak to Fahrad when you're ready to hear his plan.",
        description = "At level 45, with C's jobs done, go to a capital city: Fahrad's letter in the mailbox sends you to Ravenholdt Manor. Accept the quest, speak to Fahrad again and hand it in to him.",
        pickup = AT_FAHRAD, turnin = AT_FAHRAD, map = Fahrad(), turninMap = Fahrad(),
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[6681] = 1950
    FDJ.FOREVER_QUEST_XP_FALLBACK[80526] = 470
    FDJ.FOREVER_QUEST_XP_FALLBACK[80411] = 4700

    for _, id in ipairs({ 6681, 80526, 80411 }) do
        FDJ.QUEST_SHAREABILITY_AUDIT[id] = false
    end
end






FDJ.QUEST_PREREQ_CHAINS[95216] = {
    { id = 447, name = "A Recipe For Death" },
    { id = 450, name = "A Recipe For Death" },
    { id = 451, name = "A Recipe For Death" },
}
FDJ.QUEST_PREREQ_DETAILS[447] = {
    level = 12, requires = 9,
    objective = "Collect 6 Grizzled Bear Hearts and 6 samples of Skittering Blood and deliver them to Master Apothecary Faranell in the Undercity.",
    pickup = "Apothecary Renferrel, The Sepulcher, Silverpine Forest", turnin = "Master Apothecary Faranell, Undercity",
    map = { mapID = 1421, x = 0.428, y = 0.409, label = "Apothecary Renferrel — The Sepulcher", targetName = "Apothecary Renferrel" },
    turninMap = { mapID = 1458, x = 0.488, y = 0.693, label = "Master Apothecary Faranell — Undercity", targetName = "Master Apothecary Faranell" },
    requiredItems = {
        {3253, "Grizzled Bear Heart", 1, "Dropped by Ferocious Grizzled Bears and Giant Grizzled Bears all over Silverpine Forest"},
        {3254, "Skittering Blood", 1, "Dropped by Moss Stalkers and Mist Creepers in the Skittering Dark, north-west of the Sepulcher (around 35, 12)", map = { markerType = "location", mapID = 1421, x = 0.355, y = 0.120, label = "Moss Stalkers and Mist Creepers", detail = "Dropped by Moss Stalkers and Mist Creepers in the Skittering Dark, north-west of the Sepulcher (around 35, 12)" }},
    },
}
FDJ.QUEST_PREREQ_DETAILS[450] = {
    level = 15, requires = 9,
    warning = "Group quest: the inn is in Pyrewood Village, among hostile villagers.",
    objective = "Retrieve Apothecary Berard's journal from Pyrewood Village and take it to Apothecary Renferrel at the Sepulcher.",
    pickup = "Master Apothecary Faranell, Undercity", turnin = "Apothecary Renferrel, The Sepulcher, Silverpine Forest",
    map = { mapID = 1458, x = 0.488, y = 0.693, label = "Master Apothecary Faranell — Undercity", targetName = "Master Apothecary Faranell" },
    turninMap = { mapID = 1421, x = 0.428, y = 0.409, label = "Apothecary Renferrel — The Sepulcher", targetName = "Apothecary Renferrel" },
    requiredItems = {
        {3255, "Berard's Journal", 1, "Found on Berard's Bookshelf in the Pyrewood Village inn (Silverpine Forest 43, 73)", map = { markerType = "location", mapID = 1421, x = 0.430, y = 0.732, label = "Berard's Bookshelf — Pyrewood Village", detail = "Found on Berard's Bookshelf in the Pyrewood Village inn (Silverpine Forest 43, 73)", pickUp = true }},
    },
}
FDJ.QUEST_PREREQ_DETAILS[451] = {
    level = 18, requires = 9,
    objective = "Bring 6 samples of Lake Creeper Moss, 6 samples of Lake Skulker Moss and a Hardened Tumor to Master Apothecary Faranell in the Undercity.",
    pickup = "Apothecary Renferrel, The Sepulcher, Silverpine Forest", turnin = "Master Apothecary Faranell, Undercity",
    map = { mapID = 1421, x = 0.428, y = 0.409, label = "Apothecary Renferrel — The Sepulcher", targetName = "Apothecary Renferrel" },
    turninMap = { mapID = 1458, x = 0.488, y = 0.693, label = "Master Apothecary Faranell — Undercity", targetName = "Master Apothecary Faranell" },
    requiredItems = {
        {3256, "Lake Skulker Moss", 1, "Dropped by Lake Skulkers and Elder Lake Skulkers on the Dawning Isles in Lordamere Lake (around 72, 35)", map = { markerType = "location", mapID = 1421, x = 0.720, y = 0.355, label = "Lake Skulkers — Lordamere Lake", detail = "Dropped by Lake Skulkers and Elder Lake Skulkers on the Dawning Isles in Lordamere Lake (around 72, 35)" }},
        {3257, "Lake Creeper Moss", 1, "Dropped by Lake Creepers and Elder Lake Creepers on the Dawning Isles in Lordamere Lake (around 77, 25)", map = { markerType = "location", mapID = 1421, x = 0.770, y = 0.250, label = "Lake Creepers — Lordamere Lake", detail = "Dropped by Lake Creepers and Elder Lake Creepers on the Dawning Isles in Lordamere Lake (around 77, 25)" }},
        {3258, "Hardened Tumor", 1, "Rare drop from Vile Fin murlocs around Lordamere Lake; the higher-level ones on the Dawning Isles and on the south-west shore behind Ambermill are the best bet", map = { markerType = "location", mapID = 1421, x = 0.785, y = 0.315, label = "Vile Fin murlocs — Lordamere Lake", detail = "Rare drop from Vile Fin murlocs around Lordamere Lake; the higher-level ones on the Dawning Isles and on the south-west shore behind Ambermill are the best bet" }},
    },
}
FDJ.PREREQ_REWARD_ITEMS_FALLBACK[447] = { items = { {3448, "Senggin Root", 1} }, choice = false }

FDJ.PREREQ_REWARD_ITEMS_FALLBACK[451] = { items = { {3451, "Nightglow Concoction", 2}, {3582, "Acidproof Cloak", 2} }, choice = true,
    also = { {2458, "Elixir of Minor Fortitude", 1}, {2459, "Swiftness Potion", 1} } }
FDJ.PREREQ_REWARD_MONEY_FALLBACK[447] = 500
FDJ.PREREQ_REWARD_MONEY_FALLBACK[450] = 1400
FDJ.FOREVER_QUEST_XP_FALLBACK[447] = 900
FDJ.FOREVER_QUEST_XP_FALLBACK[450] = 1350
FDJ.FOREVER_QUEST_XP_FALLBACK[451] = 2050
FDJ.QUEST_SHAREABILITY_AUDIT[447] = true
FDJ.QUEST_SHAREABILITY_AUDIT[450] = true





FDJ.QUEST_PREREQ_CHAINS[92422] = {
    { id = 356, name = "Rear Guard Patrol" },
    { id = 99156, name = "Rear Guard Patrol" },
}
FDJ.QUEST_PREREQ_DETAILS[356] = {
    level = 11, requires = 6,
    objective = "Kill 8 Bleeding Horrors and 8 Wandering Spirits, then report back to Linnea at her camp.",
    description = "Both are at the Balnir Farmstead, east of Linnea's camp.",
    pickup = "Deathguard Linnea, camp south-east of Brill, Tirisfal Glades", turnin = "Deathguard Linnea, camp south-east of Brill, Tirisfal Glades",
    map = { mapID = 1420, x = 0.655, y = 0.603, label = "Deathguard Linnea — Tirisfal Glades", targetName = "Deathguard Linnea" },
}
FDJ.QUEST_PREREQ_DETAILS[99156] = {
    level = 13, requires = 6,
    warning = "Group quest: Riptear is a level 13 elite.",
    objective = "Kill Riptear in north-east Tirisfal Glades and bring Riptear's Heart to Deathguard Linnea.",
    pickup = "Deathguard Linnea, camp south-east of Brill, Tirisfal Glades", turnin = "Deathguard Linnea, camp south-east of Brill, Tirisfal Glades",
    map = { mapID = 1420, x = 0.655, y = 0.603, label = "Deathguard Linnea — Tirisfal Glades", targetName = "Deathguard Linnea" },
    requiredItems = {
        {286326, "Riptear's Heart", 1, "Dropped by Riptear (level 13 elite) in Venomweb Vale, north-east Tirisfal Glades (around 84, 44)", map = { mapID = 1420, x = 0.839, y = 0.440, label = "Riptear — Venomweb Vale", detail = "Dropped by Riptear (level 13 elite) in Venomweb Vale, north-east Tirisfal Glades (around 84, 44)" }},
    },
}
FDJ.PREREQ_REWARD_ITEMS_FALLBACK[99156] = { items = { {286742, "Riptear's Cleaver", 2}, {286743, "Riptear's Spare Arm", 2}, {286744, "Thrice-Stitched Flesh", 2} }, choice = true }
FDJ.PREREQ_REWARD_MONEY_FALLBACK[356] = 300
FDJ.FOREVER_QUEST_XP_FALLBACK[356] = 650
FDJ.FOREVER_QUEST_XP_FALLBACK[99156] = 900
FDJ.QUEST_SHAREABILITY_AUDIT[356] = true
FDJ.QUEST_SHAREABILITY_AUDIT[99156] = true







do
    local KINWEELAY = { mapID = 1434, x = 0.323, y = 0.277, label = "Kin'weelay — Grom'gol Base Camp", targetName = "Kin'weelay", detail = "Kin'weelay at Grom'gol Base Camp, Stranglethorn Vale" }
    local GROMGOL = "Kin'weelay, Grom'gol Base Camp, Stranglethorn Vale"
    FDJ.QUEST_START_MAPS[95775] = KINWEELAY
    FDJ.QUEST_START_MAPS[96774] = { mapID = 1412, x = 0.325, y = 0.206, label = "Mazu'kon — Mulgore", targetName = "Mazu'kon", detail = "Mazu'kon of the Earthen Ring, north-west Mulgore" }
    FDJ.QUEST_START_MAPS[95789] = { mapID = 1434, x = 0.269, y = 0.772, label = "Krazek — Booty Bay", targetName = "Krazek", detail = "Krazek, upstairs in Booty Bay, Stranglethorn Vale" }
    FDJ.QUEST_START_MAPS[95791] = FDJ.QUEST_START_MAPS[95789]
    FDJ.QUEST_START_MAPS[95787] = { mapID = 1424, x = 0.506, y = 0.571, label = "Loremaster Dibbs — Southshore", targetName = "Loremaster Dibbs", detail = "Loremaster Dibbs in Southshore, Hillsbrad Foothills" }

    FDJ.QUEST_START_MAPS[95788] = FDJ.QUEST_START_MAPS[95787]
    FDJ.QUEST_START_MAPS[95799] = FDJ.QUEST_START_MAPS[95787]
    FDJ.QUEST_START_MAPS[95798] = FDJ.QUEST_START_MAPS[95787]

    FDJ.QUEST_PREREQ_CHAINS[95775] = {
        { id = 629, name = "The Vile Reef" },
        { id = 95748, name = "The Gurubashi Legends of Old" },
        { id = 95770, name = "Locating the Lost City" },
    }
    FDJ.QUEST_PREREQ_DETAILS[629] = {
        level = 37, requires = 30,
        warning = "Group quest: the Saltscale murlocs at the Vile Reef are elite.",
        objective = "Bring a Tablet Shard to Kin'weelay at Grom'gol Base Camp.",
        pickup = GROMGOL, turnin = GROMGOL,
        map = KINWEELAY,
        requiredItems = {
            {4094, "Tablet Shard", 1, "From the tablet Gri'lek the Wanderer, at the bottom of the Vile Reef (around 25, 23)", map = { mapID = 1434, x = 0.248, y = 0.230, label = "Gri'lek the Wanderer — the Vile Reef", detail = "The tablet at the bottom of the Vile Reef (around 25, 23)", pickUp = true, underwater = true }},
        },
    }
    FDJ.QUEST_PREREQ_DETAILS[95748] = {
        level = 40, requires = 30,
        objective = "Use the hide and charcoal to make a rubbing of the Third Troll Legend tablet.",
        pickup = GROMGOL, turnin = GROMGOL,
        map = KINWEELAY,
        requiredItems = {
            {2007, "The Third Troll Legend", 1, "Rubbing of the tablet Fall of Gurubashi, in the troll ruins on the coast north of the Vile Reef (around 23, 12)", map = { mapID = 1434, x = 0.230, y = 0.120, label = "Fall of Gurubashi — troll ruins north of the Vile Reef", detail = "The tablet in the troll ruins on the coast (around 23, 12)", pickUp = true }},
        },
    }
    FDJ.QUEST_PREREQ_DETAILS[95770] = {
        level = 40, requires = 30,
        objective = "Explore just west of the Vile Reef and find the cavern entrance, then report back to Kin'weelay.",
        description = "The cave is in Sunken Hollow, underwater around 21, 28: the entrance to the Drowned City.",
        pickup = GROMGOL, turnin = GROMGOL,
        map = KINWEELAY,
    }





    local GADRIN = { mapID = 1411, x = 0.558, y = 0.744, label = "Master Gadrin — Sen'jin Village", targetName = "Master Gadrin", detail = "Master Gadrin in Sen'jin Village, Durotar" }
    local TABLET_VARTAKA, TABLET_MINLOTH = "Next to the boss Var'Taka", "Next to the last boss, Min'loth the Serpent"
    local TABLET_DREADRISE = "In Captain Dreadrise's area"
    local TABLET_FIRST = "Down the stairs after the first boss, on the left"
    FDJ.QUEST_START_MAPS[96078] = KINWEELAY
    FDJ.QUEST_PREREQ_CHAINS[96078] = {
        { id = 629, name = "The Vile Reef" },
        { id = 95748, name = "The Gurubashi Legends of Old" },
        { id = 95770, name = "Locating the Lost City" },
        { id = 95775, name = "The Drowned City" },
    }
    FDJ.QUEST_PREREQ_DETAILS[95775] = {
        level = 40, requires = 30,
        objective = "Use the hide and charcoal to make rubbings of the four Tablets of I'lalai in the Drowned City.",
        pickup = GROMGOL, turnin = GROMGOL,
        map = KINWEELAY, turninMap = KINWEELAY,
        requiredItems = {



            {270308, "The First Tablet of I'lalai", 1, TABLET_FIRST},
            {270309, "The Second Tablet of I'lalai", 1, TABLET_VARTAKA},
            {270310, "The Third Tablet of I'lalai", 1, TABLET_DREADRISE},
            {270311, "The Fourth Tablet of I'lalai", 1, TABLET_MINLOTH},
        },
    }
    for _, quest in ipairs((FDJ.DB["The Drowned City"] and FDJ.DB["The Drowned City"].quests) or {}) do
        if quest.id == 95775 then quest.hideFromMainList = true end
        if quest.id == 96078 then quest.turninMap = GADRIN end
    end






    local AGGROGOSH = { mapID = 1434, x = 0.322, y = 0.288, label = "Commander Aggro'gosh — Grom'gol Base Camp", targetName = "Commander Aggro'gosh", detail = "Commander Aggro'gosh at Grom'gol Base Camp, Stranglethorn Vale" }
    local AT_AGGROGOSH = "Commander Aggro'gosh, Grom'gol Base Camp, Stranglethorn Vale"
    FDJ.QUEST_START_MAPS[95773] = AGGROGOSH
    FDJ.QUEST_START_MAPS[95776] = AGGROGOSH
    FDJ.QUEST_PREREQ_CHAINS[95776] = {
        { id = 629, name = "The Vile Reef" },
        { id = 95748, name = "The Gurubashi Legends of Old" },
        { id = 95773, name = "Enemies in the Water" },
        { id = 95770, name = "Locating the Lost City" },
    }
    FDJ.QUEST_PREREQ_DETAILS[95773] = {
        level = 37, requires = 30,
        objective = "Gather 10 Brinescale Tridents from Brinescale Skirmishers.",
        note = "Commander Aggro'gosh offers it once The Gurubashi Legends of Old is handed in.",
        pickup = AT_AGGROGOSH, turnin = AT_AGGROGOSH,
        map = AGGROGOSH, turninMap = AGGROGOSH,
        requiredItems = {
            {270305, "Brinescale Trident", 1, "Dropped by Brinescale Skirmishers around the Vile Reef, west of Grom'gol (around 22, 26)", map = { mapID = 1434, x = 0.225, y = 0.256, label = "Brinescale Skirmishers — around the Vile Reef", detail = "Brinescale Skirmishers on the sea floor west of Grom'gol (around 22, 26)" }},
        },
    }

    FDJ.FOREVER_QUEST_XP_FALLBACK[629] = 2850
    FDJ.FOREVER_QUEST_XP_FALLBACK[95748] = 3150
    FDJ.FOREVER_QUEST_XP_FALLBACK[95770] = 3150
    FDJ.FOREVER_QUEST_XP_FALLBACK[95773] = 2850
    FDJ.FOREVER_QUEST_XP_FALLBACK[95775] = 8450
    FDJ.FOREVER_QUEST_XP_FALLBACK[95776] = 9500
    FDJ.FOREVER_QUEST_XP_FALLBACK[96774] = 8800
    FDJ.FOREVER_QUEST_XP_FALLBACK[97130] = 10450
    FDJ.FOREVER_QUEST_XP_FALLBACK[96078] = 2350
    for _, id in ipairs({ 629, 95748, 95770, 95773, 95775, 95776, 96078, 96774, 97130 }) do
        FDJ.QUEST_SHAREABILITY_AUDIT[id] = true
    end
end


















do
    local BRINESCALE = { markerType = "location", mapID = 1434, x = 0.225, y = 0.256, label = "Brinescale Skirmishers — Stranglethorn Vale", detail = "Brinescale Skirmishers on the sea floor west of Grom'gol, by the Drowned City's entrance" }





    local CAVERN = { markerType = "location", mapID = 1434, x = 0.218, y = 0.276, exact = true, label = "Cavern west of the Vile Reef — Stranglethorn Vale", detail = "The underwater cavern just west of the Vile Reef: the way into the Drowned City" }
    local D = FDJ.QUEST_PREREQ_DETAILS
    if D[95770] then D[95770].objectiveMap = CAVERN end
    if D[95773] then
        D[95773].objectiveMap = BRINESCALE
        for _, item in ipairs(D[95773].requiredItems or {}) do
            if type(item) == "table" and item[1] == 270305 then item.noRouteStop = true end
        end
    end
    for _, step in ipairs(FDJ.QUEST_PREREQ_CHAINS[95776] or {}) do
        if step.id == 95770 then step.together = true end
    end
    for _, step in ipairs(FDJ.QUEST_PREREQ_CHAINS[96078] or {}) do
        if step.id == 95775 then step.needsDungeon = true end
    end
    for _, quest in ipairs((FDJ.DB["The Drowned City"] and FDJ.DB["The Drowned City"].quests) or {}) do
        if quest.id == 96078 then quest.routeNoRun = true end
    end

    local MAZUKON = FDJ.QUEST_START_MAPS[96774]
    if type(MAZUKON) == "table" then
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(MAZUKON.mapID), MAZUKON.x, MAZUKON.y)] = {
            { mapID = 1412, x = 0.402, y = 0.174, label = "Take the path up the hill", keep = true },
        }
    end
end








do
    local D = FDJ.QUEST_PREREQ_DETAILS
    local function Swim(spot) if type(spot) == "table" then spot.swim = true end end
    if D[95773] then
        Swim(D[95773].objectiveMap)
        for _, item in ipairs(D[95773].requiredItems or {}) do
            if type(item) == "table" then Swim(item.map) end
        end
    end
    if D[95770] then Swim(D[95770].objectiveMap) end
    if D[629] then
        for _, item in ipairs(D[629].requiredItems or {}) do
            if type(item) == "table" then Swim(item.map) end
        end
    end
    Swim(FDJ.DB and FDJ.DB["The Drowned City"] and FDJ.DB["The Drowned City"].entrance)



    local cavern = D[95770] and D[95770].objectiveMap
    if type(cavern) == "table" then cavern.underwater = true end
    local door = FDJ.DB and FDJ.DB["The Drowned City"] and FDJ.DB["The Drowned City"].entrance
    if type(door) == "table" then door.underwater = true end
end















do
    local DIBBS = FDJ.QUEST_START_MAPS[95787]
    local NIMETZ = { mapID = 1434, x = 0.378, y = 0.036, label = "Brother Nimetz — Rebel Camp", targetName = "Brother Nimetz", detail = "Brother Nimetz at the Rebel Camp, northern Stranglethorn Vale" }
    local KARNIK = { mapID = 1455, x = 0.775, y = 0.118, label = "Historian Karnik — Hall of Explorers", targetName = "Historian Karnik", detail = "Historian Karnik in the Hall of Explorers, Ironforge" }
    local ABRA = { mapID = 1416, x = 0.132, y = 0.696, label = "Abra Cadabra — Dalaran", targetName = "Abra Cadabra", detail = "Abra Cadabra in Dalaran, Alterac Mountains" }
    local YOHWA = { mapID = 1434, x = 0.380, y = 0.034, label = "Sergeant Yohwa — Rebel Camp", targetName = "Sergeant Yohwa", detail = "Sergeant Yohwa at the Rebel Camp, northern Stranglethorn Vale" }
    local AT_DIBBS = "Loremaster Dibbs, Southshore, Hillsbrad Foothills"
    local AT_YOHWA = "Sergeant Yohwa, Rebel Camp, Stranglethorn Vale"
    local AT_NIMETZ = "Brother Nimetz, Rebel Camp, Stranglethorn Vale"
    local TABLET_VARTAKA, TABLET_MINLOTH = "Next to the boss Var'Taka", "Next to the last boss, Min'loth the Serpent"
    local TABLET_DREADRISE = "In Captain Dreadrise's area"
    local TABLET_FIRST = "Down the stairs after the first boss, on the left"
    local BOTH = "Done together with the other of Sergeant Yohwa's two quests (The Second Rebellion and Bad Medicine); Brother Nimetz offers Kurzen's Mystery once both are handed in."


    local function Tablet(name, x, y, where)


        return { markerType = "location", mapID = 1434, x = x, y = y, label = name .. " — Stranglethorn Vale", detail = where, pickUp = true,
            underwater = (name == "Gri'lek the Wanderer") or nil }
    end

    local LEAD_IN = {
        { id = 203, name = "The Second Rebellion" },
        { id = 204, name = "Bad Medicine" },
        { id = 207, name = "Kurzen's Mystery" },
        { id = 205, name = "Troll Witchery" },
        { id = 95786, name = "An Acquaintance in Southshore" },
    }
    local function Chain(lastStep)
        local chain = {}
        for i, step in ipairs(LEAD_IN) do chain[i] = { id = step.id, name = step.name } end
        chain[#chain + 1] = lastStep
        return chain
    end
    FDJ.QUEST_PREREQ_CHAINS[95799] = Chain({ id = 95787, name = "Take Two With Water" })
    FDJ.QUEST_PREREQ_CHAINS[95798] = Chain({ id = 95788, name = "Magics of the Drowned City" })

    FDJ.QUEST_PREREQ_DETAILS[203] = {
        level = 33, requires = 30,
        objective = "Kill 15 Kurzen Jungle Fighters.",
        pickup = AT_YOHWA, turnin = AT_YOHWA,
        map = YOHWA, turninMap = YOHWA,
        note = BOTH,
    }
    FDJ.QUEST_PREREQ_DETAILS[204] = {
        level = 34, requires = 30,
        objective = "Bring 7 Jungle Remedies and 1 Venom Fern Extract to Sergeant Yohwa.",
        pickup = AT_YOHWA, turnin = AT_YOHWA,
        map = YOHWA, turninMap = YOHWA,
        requiredItems = {
            {2633, "Jungle Remedy", 1, "Dropped by the Kurzen trolls in and around Kurzen's Compound (7 needed)"},
            {2634, "Venom Fern Extract", 1, "Dropped by the Kurzen trolls in and around Kurzen's Compound"},
        },
        note = BOTH,
    }
    FDJ.QUEST_PREREQ_DETAILS[207] = {
        level = 38, requires = 30,
        objective = "Find the four troll tablets on the coast and in the Vile Reef, and bring back the First, Second, Third and Fourth Troll Legends.",
        pickup = AT_NIMETZ, turnin = AT_NIMETZ,
        map = NIMETZ, turninMap = NIMETZ,
        requiredItems = {
            {2005, "The First Troll Legend", 1, "From the tablet Moon Over the Vale (around 29, 19)", map = Tablet("Moon Over the Vale", 0.294, 0.192, "The tablet Moon Over the Vale (around 29, 19)")},
            {2006, "The Second Troll Legend", 1, "From the tablet Gri'lek the Wanderer, at the bottom of the Vile Reef (around 25, 23)", map = Tablet("Gri'lek the Wanderer", 0.248, 0.228, "The tablet at the bottom of the Vile Reef (around 25, 23)")},
            {2007, "The Third Troll Legend", 1, "From the tablet Fall of Gurubashi, in the troll ruins on the coast north of the Vile Reef (around 23, 12)", map = Tablet("Fall of Gurubashi", 0.230, 0.120, "The tablet in the troll ruins on the coast (around 23, 12)")},
            {2008, "The Fourth Troll Legend", 1, "From the tablet The Emperor's Tomb (around 25, 9)", map = Tablet("The Emperor's Tomb", 0.247, 0.090, "The tablet The Emperor's Tomb (around 25, 9)")},
        },
    }
    FDJ.QUEST_PREREQ_DETAILS[205] = {
        level = 40, requires = 30,
        objective = "Bring 4 Skullsplitter Fetishes to Brother Nimetz.",
        pickup = AT_NIMETZ, turnin = AT_NIMETZ,
        map = NIMETZ, turninMap = NIMETZ,
        requiredItems = {
            {2466, "Skullsplitter Fetish", 1, "Dropped by Skullsplitter Witchdoctors and Mystics in the troll ruins south of the Rebel Camp (4 needed)"},
        },
    }
    FDJ.QUEST_PREREQ_DETAILS[95786] = {
        level = 40, requires = 30,
        objective = "Take the Savage Coast Report Bundle (the fetishes, the troll legends and the scouting report) to Loremaster Dibbs in Southshore.",
        pickup = AT_NIMETZ, turnin = AT_DIBBS,
        map = NIMETZ, turninMap = DIBBS,
        providedItem = {270340, "Savage Coast Report Bundle", 1, "Given by Brother Nimetz when you accept the quest"},
    }
    FDJ.QUEST_PREREQ_DETAILS[95787] = {
        level = 40, requires = 30,
        objective = "Make rubbings of the four Tablets of I'lalai in the Drowned City.",
        pickup = AT_DIBBS, turnin = AT_DIBBS,
        map = DIBBS,
        requiredItems = {



            {270308, "The First Tablet of I'lalai", 1, TABLET_FIRST},
            {270309, "The Second Tablet of I'lalai", 1, TABLET_VARTAKA},
            {270310, "The Third Tablet of I'lalai", 1, TABLET_DREADRISE},
            {270311, "The Fourth Tablet of I'lalai", 1, TABLET_MINLOTH},
        },
    }
    FDJ.QUEST_PREREQ_DETAILS[95788] = {
        level = 40, requires = 30,
        objective = "Collect 5 I'lalai Fetishes from the trolls in the Drowned City.",
        pickup = AT_DIBBS, turnin = AT_DIBBS,
        map = DIBBS,
        requiredItems = {
            {270343, "I'lalai Fetish", 1, "Dropped by the trolls in the Drowned City (5 needed)"},
        },
    }
    FDJ.QUEST_START_MAPS[95786] = NIMETZ
    FDJ.QUEST_START_MAPS[203] = YOHWA
    FDJ.QUEST_START_MAPS[204] = YOHWA
    FDJ.QUEST_START_MAPS[207] = NIMETZ
    FDJ.QUEST_START_MAPS[205] = NIMETZ
    FDJ.FOREVER_QUEST_XP_FALLBACK[203] = 1950
    FDJ.FOREVER_QUEST_XP_FALLBACK[204] = 2700
    FDJ.FOREVER_QUEST_XP_FALLBACK[207] = 3550
    FDJ.FOREVER_QUEST_XP_FALLBACK[205] = 3150
    FDJ.FOREVER_QUEST_XP_FALLBACK[95786] = 3150
    FDJ.FOREVER_QUEST_XP_FALLBACK[95787] = 8450
    FDJ.FOREVER_QUEST_XP_FALLBACK[95788] = 8450
    for _, id in ipairs({ 203, 204, 205, 207 }) do
        FDJ.QUEST_SHAREABILITY_AUDIT[id] = true
    end




    FDJ.QUEST_START_MAPS[97130] = { mapID = 1416, x = 0.154, y = 0.740, label = "Archmage Timear — Dalaran", targetName = "Archmage Timear", detail = "Archmage Timear, outside where the Violet Hold stood in Dalaran, Alterac Mountains" }

    for _, quest in ipairs((FDJ.DB["The Drowned City"] and FDJ.DB["The Drowned City"].quests) or {}) do
        if quest.id == 97130 then
            quest.turninMap = FDJ.QUEST_START_MAPS[97130]
            break
        end
    end














    do
        local KURZEN = { markerType = "location", mapID = 1434, x = 0.447, y = 0.104, label = "Kurzen's Compound — Stranglethorn Vale", detail = "Kurzen Jungle Fighters and Medicine Men, in and around Kurzen's Compound" }
        local SKULLSPLITTERS = { markerType = "location", mapID = 1434, x = 0.459, y = 0.364, label = "Skullsplitter trolls — Stranglethorn Vale", detail = "Skullsplitter Mystics and Witch Doctors in the troll ruins south of Kurzen's Compound" }
        FDJ.QUEST_PREREQ_DETAILS[203].objectiveMap = KURZEN
        FDJ.QUEST_PREREQ_DETAILS[204].objectiveMap = KURZEN
        FDJ.QUEST_PREREQ_DETAILS[205].objectiveMap = SKULLSPLITTERS
        for _, id in ipairs({ 95799, 95798 }) do
            for _, step in ipairs(FDJ.QUEST_PREREQ_CHAINS[id]) do
                if step.id == 204 then step.together = true end
                if step.id == 95787 or step.id == 95788 then step.needsDungeon = true end
            end
        end
        for _, quest in ipairs((FDJ.DB["The Drowned City"] and FDJ.DB["The Drowned City"].quests) or {}) do
            if quest.id == 95799 or quest.id == 95798 then quest.routeNoRun = true end
        end
    end







    do
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        local function D(x, y) return { mapID = 1431, x = x, y = y } end
        local function S(x, y) return { mapID = 1434, x = x, y = y } end
        local route = { forward = true, nearest = true, reach = 4, leg = 3, byNet = true,
        D(0.7770, 0.4502), D(0.7647, 0.4664), D(0.7647, 0.4803), D(0.7616, 0.4919), D(0.7600, 0.4965),
        D(0.7600, 0.4988), D(0.7569, 0.5081), D(0.7492, 0.5220), D(0.7492, 0.5243), D(0.7492, 0.5289),
        D(0.7492, 0.5313), D(0.7477, 0.5336), D(0.7461, 0.5359), D(0.7446, 0.5382), D(0.7446, 0.5405),
        D(0.7415, 0.5498), D(0.7292, 0.5822), D(0.7060, 0.5984), D(0.6921, 0.6100), D(0.6890, 0.6123),
        D(0.6875, 0.6123), D(0.6844, 0.6146), D(0.6829, 0.6215), D(0.6829, 0.6238), D(0.6813, 0.6262),
        D(0.6798, 0.6285), D(0.6782, 0.6308), D(0.6674, 0.6447), D(0.6628, 0.6447), D(0.6427, 0.6609),
        D(0.6412, 0.6632), D(0.6381, 0.6678), D(0.6366, 0.6701), D(0.6350, 0.6725), D(0.5995, 0.7465),
        D(0.5810, 0.7650), D(0.5718, 0.7789), D(0.5625, 0.7859), D(0.5548, 0.7882), D(0.5532, 0.7882),
        D(0.5378, 0.7882), D(0.5332, 0.7998), D(0.5301, 0.8021), D(0.5285, 0.8044), D(0.5255, 0.8044),
        D(0.5239, 0.8044), S(0.4385, 0.0000), S(0.4378, 0.0010), S(0.4378, 0.0020), S(0.4372, 0.0029),
        S(0.4372, 0.0039), S(0.4365, 0.0049), S(0.4358, 0.0059), S(0.4352, 0.0069), S(0.4345, 0.0078),
        S(0.4339, 0.0088), S(0.4326, 0.0098), S(0.4319, 0.0108), S(0.4313, 0.0118), S(0.4306, 0.0118),
        S(0.4306, 0.0127), S(0.4300, 0.0137), S(0.4300, 0.0147), S(0.4300, 0.0157), S(0.4300, 0.0167),
        S(0.4293, 0.0176), S(0.4234, 0.0186), S(0.4221, 0.0186), S(0.4215, 0.0186), S(0.4150, 0.0225),
        S(0.4143, 0.0235), S(0.4136, 0.0235), S(0.4117, 0.0255), S(0.4110, 0.0264), S(0.4097, 0.0294),
        S(0.4091, 0.0304), S(0.4071, 0.0304), S(0.4065, 0.0333), S(0.4071, 0.0343), S(0.4071, 0.0353),
        S(0.4071, 0.0362), S(0.4078, 0.0372), S(0.4078, 0.0382), S(0.4078, 0.0392), S(0.4084, 0.0402),
        S(0.4084, 0.0411), S(0.4078, 0.0421), S(0.4071, 0.0431), S(0.4045, 0.0460), S(0.4039, 0.0470),
        S(0.4032, 0.0470), S(0.4025, 0.0480), S(0.3954, 0.0490), S(0.3908, 0.0490), S(0.3862, 0.0480),
        S(0.3856, 0.0480), S(0.3849, 0.0480), S(0.3843, 0.0480), S(0.3836, 0.0480), S(0.3830, 0.0470),
        S(0.3823, 0.0460), S(0.3817, 0.0451), S(0.3803, 0.0382),
        }
        for _, spot in ipairs({ YOHWA, NIMETZ }) do
            FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(spot.mapID), spot.x, spot.y)] = route
        end
    end








    do
        local PLACE = { camp = true, T1 = "1434|0.2940|0.1920", T2 = "1434|0.2480|0.2280", T3 = "1434|0.2300|0.1200", T4 = "1434|0.2470|0.0900" }
        local WAYS = {
            { "T1", "T2",
            0.2942, 0.1929, 0.2948, 0.1939, 0.2942, 0.1939, 0.2942, 0.1949, 0.2935, 0.1949, 0.2935, 0.1939,
            0.2929, 0.1939, 0.2517, 0.1998, 0.2511, 0.2008, 0.2511, 0.2018, 0.2491, 0.2262, 0.2478, 0.2282,
            },
            { "T1", "T3",
            0.2942, 0.1929, 0.2948, 0.1939, 0.2942, 0.1939, 0.2942, 0.1949, 0.2935, 0.1949, 0.2935, 0.1939,
            0.2929, 0.1939, 0.2922, 0.1929, 0.2922, 0.1812, 0.2935, 0.1802, 0.2942, 0.1792, 0.2948, 0.1783,
            0.2955, 0.1763, 0.2948, 0.1753, 0.2942, 0.1743, 0.2902, 0.1763, 0.2896, 0.1763, 0.2889, 0.1753,
            0.2883, 0.1743, 0.2700, 0.1548, 0.2628, 0.1548, 0.2609, 0.1518, 0.2609, 0.1508, 0.2602, 0.1499,
            0.2595, 0.1499, 0.2589, 0.1499, 0.2576, 0.1489, 0.2569, 0.1479, 0.2563, 0.1469, 0.2511, 0.1420,
            0.2465, 0.1420, 0.2458, 0.1420, 0.2445, 0.1420, 0.2439, 0.1410, 0.2432, 0.1410, 0.2426, 0.1410,
            0.2419, 0.1401, 0.2387, 0.1391, 0.2380, 0.1381, 0.2334, 0.1312, 0.2334, 0.1303, 0.2328, 0.1293,
            0.2334, 0.1283, 0.2334, 0.1273, 0.2328, 0.1263, 0.2302, 0.1205,
            },
            { "T1", "T4",
            0.2942, 0.1929, 0.2948, 0.1929, 0.2961, 0.1920, 0.2968, 0.1910, 0.2974, 0.1910, 0.2987, 0.1910,
            0.2994, 0.1900, 0.3000, 0.1900, 0.3007, 0.1890, 0.3013, 0.1881, 0.3013, 0.1871, 0.3020, 0.1861,
            0.3020, 0.1851, 0.3013, 0.1851, 0.3007, 0.1822, 0.3000, 0.1763, 0.3000, 0.1753, 0.2994, 0.1743,
            0.2987, 0.1734, 0.2987, 0.1724, 0.2974, 0.1675, 0.2974, 0.1665, 0.2968, 0.1655, 0.2961, 0.1645,
            0.2935, 0.1606, 0.2929, 0.1596, 0.2720, 0.1312, 0.2687, 0.1312, 0.2674, 0.1332, 0.2667, 0.1342,
            0.2661, 0.1342, 0.2654, 0.1332, 0.2648, 0.1332, 0.2641, 0.1322, 0.2615, 0.1312, 0.2609, 0.1312,
            0.2602, 0.1312, 0.2595, 0.1312, 0.2589, 0.1303, 0.2576, 0.1293, 0.2471, 0.1117, 0.2380, 0.1117,
            0.2367, 0.1087, 0.2373, 0.1068, 0.2413, 0.1068, 0.2419, 0.1068, 0.2458, 0.1028, 0.2471, 0.0901,
            },
            { "T1", "camp",
            0.2942, 0.1929, 0.2948, 0.1929, 0.2961, 0.1920, 0.2968, 0.1910, 0.2974, 0.1910, 0.2987, 0.1910,
            0.2994, 0.1900, 0.3000, 0.1900, 0.3007, 0.1890, 0.3013, 0.1881, 0.3013, 0.1871, 0.3020, 0.1861,
            0.3026, 0.1851, 0.3046, 0.1841, 0.3085, 0.1743, 0.3275, 0.1459, 0.3281, 0.1450, 0.3359, 0.1381,
            0.3386, 0.1381, 0.3392, 0.1381, 0.3399, 0.1371, 0.3405, 0.1342, 0.3418, 0.1312, 0.3438, 0.1303,
            0.3581, 0.1126, 0.3588, 0.1117, 0.3588, 0.1107, 0.3595, 0.1097, 0.3601, 0.1087, 0.3673, 0.0989,
            0.3771, 0.0930, 0.3777, 0.0921, 0.3777, 0.0911, 0.3777, 0.0901, 0.3777, 0.0891, 0.3777, 0.0881,
            0.3784, 0.0872, 0.3790, 0.0862, 0.3797, 0.0852, 0.3843, 0.0803, 0.3849, 0.0793, 0.3856, 0.0784,
            0.3901, 0.0764, 0.3901, 0.0754, 0.3901, 0.0744, 0.3921, 0.0627, 0.3921, 0.0539, 0.3862, 0.0480,
            0.3856, 0.0480, 0.3849, 0.0480, 0.3843, 0.0480, 0.3836, 0.0480, 0.3830, 0.0470, 0.3823, 0.0460,
            0.3817, 0.0451, 0.3803, 0.0382, 0.3797, 0.0362,
            },
            { "T2", "T3",
            0.2478, 0.2282, 0.2498, 0.2194, 0.2491, 0.2184, 0.2491, 0.2174, 0.2511, 0.2018, 0.2511, 0.2008,
            0.2504, 0.1988, 0.2354, 0.1802, 0.2334, 0.1783, 0.2289, 0.1743, 0.2282, 0.1724, 0.2276, 0.1714,
            0.2269, 0.1704, 0.2262, 0.1694, 0.2269, 0.1636, 0.2282, 0.1616, 0.2289, 0.1606, 0.2289, 0.1596,
            0.2289, 0.1587, 0.2295, 0.1577, 0.2302, 0.1567, 0.2302, 0.1557, 0.2308, 0.1548, 0.2321, 0.1538,
            0.2328, 0.1538, 0.2334, 0.1538, 0.2341, 0.1518, 0.2341, 0.1508, 0.2347, 0.1459, 0.2347, 0.1450,
            0.2347, 0.1440, 0.2354, 0.1410, 0.2321, 0.1352, 0.2315, 0.1342, 0.2295, 0.1322, 0.2289, 0.1312,
            0.2302, 0.1205,
            },
            { "T2", "T4",
            0.2478, 0.2282, 0.2498, 0.2194, 0.2491, 0.2184, 0.2491, 0.2174, 0.2511, 0.2018, 0.2511, 0.2008,
            0.2484, 0.1802, 0.2484, 0.1792, 0.2478, 0.1783, 0.2484, 0.1773, 0.2491, 0.1773, 0.2491, 0.1763,
            0.2498, 0.1753, 0.2498, 0.1743, 0.2498, 0.1694, 0.2498, 0.1685, 0.2504, 0.1675, 0.2504, 0.1665,
            0.2504, 0.1655, 0.2511, 0.1655, 0.2517, 0.1655, 0.2524, 0.1645, 0.2517, 0.1567, 0.2511, 0.1557,
            0.2511, 0.1548, 0.2504, 0.1538, 0.2504, 0.1528, 0.2511, 0.1518, 0.2511, 0.1508, 0.2517, 0.1508,
            0.2517, 0.1499, 0.2524, 0.1499, 0.2530, 0.1489, 0.2530, 0.1401, 0.2537, 0.1391, 0.2543, 0.1381,
            0.2498, 0.1156, 0.2419, 0.1117, 0.2380, 0.1117, 0.2367, 0.1087, 0.2373, 0.1068, 0.2413, 0.1068,
            0.2419, 0.1068, 0.2458, 0.1028, 0.2471, 0.0901,
            },
            { "T3", "T4",
            0.2302, 0.1205, 0.2347, 0.1234, 0.2354, 0.1234, 0.2360, 0.1234, 0.2367, 0.1224, 0.2419, 0.1185,
            0.2426, 0.1185, 0.2432, 0.1185, 0.2432, 0.1175, 0.2439, 0.1175, 0.2445, 0.1175, 0.2452, 0.1166,
            0.2452, 0.1156, 0.2452, 0.1146, 0.2458, 0.1136, 0.2419, 0.1117, 0.2380, 0.1117, 0.2367, 0.1087,
            0.2373, 0.1068, 0.2413, 0.1068, 0.2419, 0.1068, 0.2458, 0.1028, 0.2471, 0.0901,
            },
            { "camp", "T2",
            0.3797, 0.0362, 0.3817, 0.0451, 0.3823, 0.0460, 0.3830, 0.0470, 0.3856, 0.0500, 0.3875, 0.0500,
            0.3921, 0.0539, 0.3921, 0.0637, 0.3914, 0.0646, 0.3908, 0.0656, 0.3901, 0.0744, 0.3901, 0.0754,
            0.3901, 0.0764, 0.3901, 0.0774, 0.3895, 0.0784, 0.3856, 0.0833, 0.3836, 0.0833, 0.3830, 0.0833,
            0.3823, 0.0833, 0.3817, 0.0833, 0.3810, 0.0842, 0.3790, 0.0862, 0.3784, 0.0872, 0.3777, 0.0881,
            0.3777, 0.0891, 0.3777, 0.0901, 0.3777, 0.0911, 0.3777, 0.0921, 0.3745, 0.1009, 0.3738, 0.1019,
            0.3732, 0.1028, 0.3418, 0.1401, 0.3373, 0.1401, 0.3366, 0.1401, 0.3346, 0.1410, 0.3327, 0.1440,
            0.3320, 0.1450, 0.3262, 0.1499, 0.2974, 0.1753, 0.2948, 0.1783, 0.2929, 0.1802, 0.2824, 0.1969,
            0.2785, 0.1988, 0.2778, 0.1988, 0.2602, 0.1988, 0.2517, 0.1998, 0.2511, 0.2008, 0.2511, 0.2018,
            0.2491, 0.2262, 0.2478, 0.2282,
            },
            { "camp", "T3",
            0.3797, 0.0362, 0.3817, 0.0451, 0.3823, 0.0460, 0.3830, 0.0470, 0.3836, 0.0480, 0.3843, 0.0480,
            0.3849, 0.0480, 0.3856, 0.0480, 0.3862, 0.0480, 0.3921, 0.0539, 0.3921, 0.0637, 0.3914, 0.0646,
            0.3908, 0.0656, 0.3901, 0.0744, 0.3901, 0.0754, 0.3901, 0.0764, 0.3901, 0.0774, 0.3895, 0.0784,
            0.3830, 0.0803, 0.3797, 0.0852, 0.3790, 0.0862, 0.3784, 0.0872, 0.3777, 0.0881, 0.3777, 0.0891,
            0.3777, 0.0901, 0.3777, 0.0911, 0.3777, 0.0921, 0.3771, 0.0930, 0.3510, 0.1038, 0.3353, 0.1077,
            0.3209, 0.1126, 0.3196, 0.1126, 0.3190, 0.1126, 0.3105, 0.1136, 0.2765, 0.1126, 0.2746, 0.1146,
            0.2667, 0.1146, 0.2661, 0.1136, 0.2530, 0.1146, 0.2498, 0.1195, 0.2491, 0.1205, 0.2484, 0.1214,
            0.2478, 0.1224, 0.2478, 0.1234, 0.2471, 0.1244, 0.2432, 0.1234, 0.2426, 0.1244, 0.2419, 0.1244,
            0.2360, 0.1244, 0.2354, 0.1234, 0.2347, 0.1234, 0.2302, 0.1205,
            },
            { "camp", "T4",
            0.3797, 0.0362, 0.3817, 0.0451, 0.3823, 0.0460, 0.3830, 0.0470, 0.3836, 0.0480, 0.3843, 0.0480,
            0.3849, 0.0480, 0.3856, 0.0480, 0.3862, 0.0480, 0.3921, 0.0539, 0.3921, 0.0637, 0.3914, 0.0646,
            0.3908, 0.0656, 0.3901, 0.0744, 0.3901, 0.0754, 0.3901, 0.0764, 0.3901, 0.0774, 0.3895, 0.0784,
            0.3830, 0.0803, 0.3797, 0.0852, 0.3790, 0.0862, 0.3784, 0.0872, 0.3777, 0.0881, 0.3777, 0.0891,
            0.3777, 0.0901, 0.3777, 0.0911, 0.3777, 0.0921, 0.3771, 0.0930, 0.3510, 0.1038, 0.3353, 0.1077,
            0.3209, 0.1126, 0.3196, 0.1126, 0.3190, 0.1126, 0.3105, 0.1136, 0.2765, 0.1126, 0.2746, 0.1146,
            0.2680, 0.1146, 0.2582, 0.1117, 0.2380, 0.1117, 0.2367, 0.1087, 0.2373, 0.1068, 0.2413, 0.1068,
            0.2419, 0.1068, 0.2458, 0.1028, 0.2471, 0.0901,
            },
        }
        local function Way(list, back)
            local route = { forward = true, nearest = true, reach = 4, leg = 3, byNet = true }
            local n = (#list - 2) / 2
            for i = 1, n do
                local k = back and (n - i + 1) or i
                route[i] = { mapID = 1434, x = list[1 + 2 * k], y = list[2 + 2 * k] }
            end
            return route
        end
        local into = {}
        for _, list in ipairs(WAYS) do
            local a, b = list[1], list[2]
            into[b] = into[b] or {}
            into[b][#into[b] + 1] = Way(list, false)
            into[a] = into[a] or {}
            into[a][#into[a] + 1] = Way(list, true)
        end
        for place, key in pairs(PLACE) do
            if key ~= true then FDJ.ARROW_VIAS[key] = { routes = into[place] } end
        end


        for _, spot in ipairs({ YOHWA, NIMETZ }) do
            local key = string.format("%s|%.4f|%.4f", tostring(spot.mapID), spot.x, spot.y)
            local routes = { FDJ.ARROW_VIAS[key] }
            for _, way in ipairs(into.camp or {}) do routes[#routes + 1] = way end
            FDJ.ARROW_VIAS[key] = { routes = routes }
        end
    end




    for _, quest in ipairs((FDJ.DB["The Drowned City"] and FDJ.DB["The Drowned City"].quests) or {}) do
        if quest.id == 95787 or quest.id == 95788 then quest.hideFromMainList = true end
        if quest.id == 95799 then quest.turninMap = KARNIK end
        if quest.id == 95798 then quest.turninMap = ABRA end
    end
end








do
    local FALLA = { mapID = 1413, x = 0.482, y = 0.328, label = "Falla Sagewind — above Wailing Caverns", targetName = "Falla Sagewind", detail = "In a tent on top of the mountain above Wailing Caverns" }
    for _, quest in ipairs((FDJ.DB["Wailing Caverns"] and FDJ.DB["Wailing Caverns"].quests) or {}) do
        if quest.id == 6981 then
            quest.objective = "Speak with Sputtervalve in Ratchet about the Glowing Shard, then deliver it to Falla Sagewind on top of the mountain above Wailing Caverns."
            quest.turnin = "Falla Sagewind, on top of the mountain above Wailing Caverns, The Barrens (48.2, 32.8)"
            quest.turninMap = FALLA
            quest.objectiveMap = { mapID = 1413, x = 0.630, y = 0.372, label = "Sputtervalve — Ratchet", targetName = "Sputtervalve", detail = "By the flight master in Ratchet; he has no ? over his head" }
            quest.objectiveWhere = "Sputtervalve, by the flight master in Ratchet (63.0, 37.2); he has no ? over his head"
        end
    end

    FDJ.QUEST_START_MAPS[6981] = FALLA


    FDJ.OBJECTIVE_LINE_OVERRIDES = FDJ.OBJECTIVE_LINE_OVERRIDES or {}
    FDJ.OBJECTIVE_LINE_OVERRIDES[6981] = { match = "in ratchet", text = "Speak with Sputtervalve in Ratchet" }
end




















do
    local PAGE = "Mallet of Zul'Farrak"
    FDJ.MALLET_PAGE = PAGE
    local MAIN = -97100
    local SACRED, MALLET = 9241, 9240
    FDJ.MALLET_QUEST = MAIN

    local QIAGA = { mapID = 1425, x = 0.486, y = 0.680, label = "Qiaga the Keeper — Altar of Zul, The Hinterlands", targetName = "Qiaga the Keeper", detail = "At the top of the Altar of Zul" }
    local ALTAR = { markerType = "location", mapID = 1425, x = 0.585, y = 0.775, label = "Altar of Jintha'Alor — The Hinterlands", detail = "The altar at the very top of Jintha'Alor" }


    local function Has(itemID)
        local count
        if C_Item and C_Item.GetItemCount then
            local ok, n = pcall(C_Item.GetItemCount, itemID, true)
            if ok then count = n end
        end
        if count == nil and GetItemCount then
            local ok, n = pcall(GetItemCount, itemID, true)
            if ok then count = n end
        end
        if type(issecretvalue) == "function" and issecretvalue(count) then return false end
        return type(count) == "number" and count > 0
    end

    local quest = {
        id = MAIN, name = "Mallet of Zul'Farrak", level = 50, requires = 1, faction = "Both",
        noPickUp = true, objectiveInDungeon = false,

        warning = "There is no quest to pick up here. Just kill and loot.",




        subWarning = "Best done together with:",
        subWarningLink = { dungeon = "Sunken Temple", quest = 3528, step = 4787, name = "The Ancient Egg" },
        objective = "Kill Qiaga the Keeper to loot the Sacred Mallet.",
        objectiveMap = QIAGA,

        objectiveMore = { text = "Then use the Sacred Mallet at the altar on the very top of %s: it turns into the Mallet of Zul'Farrak.", area = { 354, "Jintha'Alor" }, map = ALTAR },
        pickup = "Qiaga the Keeper, top of the Altar of Zul, The Hinterlands (48.6, 68.0)",
        turnin = "The gong at Gahz'rilla's pool, inside Zul'Farrak: use the Mallet of Zul'Farrak there to summon Gahz'rilla.",
        note = "Qiaga the Keeper and Morta'gya the Keeper are level 50 elites with casters around them, and the way up to the top altar is full of level 45-50 trolls: bring a group, or sneak up. Everyone in the group can loot a Sacred Mallet, and it can be used in combat. One Mallet of Zul'Farrak in the group is enough, and it summons Gahz'rilla in every later run too.",
        rewardSummary = "",
        rewardItems = { { MALLET, "Mallet of Zul'Farrak", 1 } },
    }

    setmetatable(quest, { __index = function(_, key)
        if key == "startMap" then return Has(SACRED) and ALTAR or QIAGA end
    end })

    FDJ.DB[PAGE] = {
        questChainPage = true,

        parentDungeon = "Zul'Farrak",
        parentBoss = "Gahz'rilla",
        level = "45+",
        location = "The Hinterlands",
        description = "",
        bosses = {},
        quests = { quest },
    }

    FDJ.PSEUDO_QUEST_DONE = FDJ.PSEUDO_QUEST_DONE or {}
    FDJ.PSEUDO_QUEST_DONE[MAIN] = function() return Has(MALLET) end



    local zf = FDJ.DB["Zul'Farrak"]
    for _, boss in ipairs((zf and zf.bosses) or {}) do
        if boss.name == "Gahz'rilla" then
            boss.summonItem = MALLET
            boss.summonChain = { page = PAGE, quest = MAIN }
        end
    end



    for _, q in ipairs((zf and zf.quests) or {}) do
        if q.id == 2770 then
            q.summonHelp = { boss = "Gahz'rilla", item = MALLET, itemName = "Mallet of Zul'Farrak", page = PAGE, quest = MAIN }
        end
    end
end







do
    local D = FDJ.QUEST_PREREQ_DETAILS
    if D and D[2989] and D[2989].warning == nil then
        D[2989].warning = "You can kill Qiaga the Keeper at the top of the altar to loot the Sacred Mallet."
        D[2989].warningTop = true
    end
end











do
    local PAGE = "Cozy Sleeping Bag"
    FDJ.SLEEPING_BAG_PAGE = PAGE
    FDJ.SLEEPING_BAG_ITEM = 211527


    local function Spot(mapID, x, y, label, detail)
        return { markerType = "location", mapID = mapID, x = x, y = y, label = label, detail = detail }
    end
    local BARRENS_REMAINS = Spot(1413, 0.463, 0.739, "Burned-Out Remains — The Barrens", "The burnt tower on the road south of Camp Taurajo")
    local WESTFALL_REMAINS = Spot(1436, 0.373, 0.506, "Burned-Out Remains — Westfall", "The cart wreckage at the Alexston Farmstead")
    local BARRENS_PLANK = Spot(1413, 0.464, 0.738, "Nailed Plank — The Barrens", "Beside the Burned-Out Remains, south of Camp Taurajo")
    local WESTFALL_PLANK = Spot(1436, 0.374, 0.509, "Nailed Plank — Westfall", "Beside the Burned-Out Remains at the Alexston Farmstead")
    local POCKET_LITTER = Spot(1442, 0.408, 0.526, "Pocket Litter — Stonetalon Mountains", "On a box at the abandoned camp")
    local MOUND = Spot(1442, 0.396, 0.499, "Mound of Dirt — Stonetalon Mountains", "Below the cliff north of the abandoned camp")
    local FIGURINE = Spot(1432, 0.494, 0.129, "Carved Figurine — Stonewrought Dam", "On the carved heads of the dam, facing the Wetlands")
    local BAG = Spot(1424, 0.857, 0.522, "Messenger Bag — Thoradin's Wall", "Hanging outside the room in Thoradin's Wall")
    local SATCHEL = Spot(1424, 0.857, 0.522, "Hastily Rolled-Up Satchel — Thoradin's Wall", "Right under the Messenger Bag")





    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local function Via(spot, list)
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(spot.mapID), spot.x, spot.y)] = list
    end





    Via(POCKET_LITTER, { routes = {
        {
            { mapID = 1442, x = 0.500, y = 0.610, label = "Out of Sun Rock Retreat: its east exit, to the road", faction = "Horde" },
            { mapID = 1442, x = 0.520, y = 0.579, label = "The main road, north", faction = "Horde" },
            { mapID = 1442, x = 0.522, y = 0.560, label = "The main road, north" },
            { mapID = 1442, x = 0.522, y = 0.534, label = "Where the path into the hills leaves the road (left side)" },
            { mapID = 1442, x = 0.510, y = 0.524, label = "Up the path into the hills" },
            { mapID = 1442, x = 0.488, y = 0.542, label = "The hill path, west" },
            { mapID = 1442, x = 0.430, y = 0.541, label = "The hill path, west" },
        },
        {
            { mapID = 1413, x = 0.402, y = 0.249, label = "The road into Stonetalon (round Honor's Stand)", faction = "Alliance" },
            { mapID = 1442, x = 0.605, y = 0.817, label = "The road west out of the Barrens" },
            { mapID = 1442, x = 0.580, y = 0.672, label = "The road north, past Webwinder Path" },
            { mapID = 1442, x = 0.540, y = 0.614, label = "The road north, past Webwinder Path" },
            { mapID = 1442, x = 0.522, y = 0.560, label = "The main road, north" },
            { mapID = 1442, x = 0.522, y = 0.534, label = "Where the path into the hills leaves the road (left side)" },
            { mapID = 1442, x = 0.510, y = 0.524, label = "Up the path into the hills" },
            { mapID = 1442, x = 0.488, y = 0.542, label = "The hill path, west" },
            { mapID = 1442, x = 0.430, y = 0.541, label = "The hill path, west" },
        },
        {
            { mapID = 1442, x = 0.410, y = 0.157, label = "The road south out of Stonetalon Peak", faction = "Alliance" },
            { mapID = 1442, x = 0.438, y = 0.164, label = "The road south out of Stonetalon Peak", faction = "Alliance" },
            { mapID = 1442, x = 0.467, y = 0.291, label = "The road south", faction = "Alliance" },
            { mapID = 1442, x = 0.467, y = 0.358, label = "The road south", faction = "Alliance" },
            { mapID = 1442, x = 0.455, y = 0.385, label = "West, down towards the Charred Vale", faction = "Alliance" },
            { mapID = 1442, x = 0.426, y = 0.425, label = "West, down towards the Charred Vale", faction = "Alliance" },
            { mapID = 1442, x = 0.390, y = 0.428, label = "Down the path towards the Charred Vale", faction = "Alliance" },
            { mapID = 1442, x = 0.373, y = 0.445, label = "Down the path towards the Charred Vale", faction = "Alliance" },
            { mapID = 1442, x = 0.376, y = 0.527, label = "Halfway down: the path right (east), into the mountains", faction = "Alliance" },
            { mapID = 1442, x = 0.407, y = 0.552, label = "Up the mountain path to the camp", faction = "Alliance" },
        },
    } })












    local WALL = { mapID = 1424, x0 = 0.850, y0 = 0.464, step = 0.001, rows = {
            "............................+++++",
            "........................... +++++",
            "........................... +++++",
            "............................+++++",
            "............................+++++",
            "............................+++++",
            "...........................++++++",
            "...........................++++++",
            "...........................++++++",
            "...........................++++++",
            "...........................++++++",
            "...........................++++++",
            "............................+++++",
            "............................+++++",
            ".........................+++++.++",
            ".........................++#++.++",
            ".........................++#++++.",
            ".........................++#++++.",
            ".........................++#+++++",
            ".........................++####++",
            ".......................++++####++",
            ".......................+++######+",
            "......................++++######+",
            "......................++#########",
            ".....................+++#########",
            ".....................++#########+",
            "...................++++#########+",
            "...................+++#########++",
            "...................+++#########++",
            "...................+#########++++",
            "..................++#########+++.",
            "..................+#########++++.",
            ".................++#########++...",
            ".................++########+++...",
            ".............++++++########++....",
            ".............+++++#########++....",
            "...........+++++++#########+.....",
            "...........+++############++.....",
            "...........+############++++.....",
            ".........+++############+++......",
            ".........++############++++......",
            ".........++############++........",
            ".........+############+++........",
            "........++############+++........",
            "........+##############++........",
            "........+##############++........",
            ".......  #############+++........",
            "......+  #############++.........",
            "...... #############++++.........",
            ".....+ #############+++..........",
            ".....+############# +++..........",
            "....++############# .............",
            "....+##############+.............",
            "..+++##############+.............",
            "..+++############# +.............",
            ".++++############# ..............",
            ".++#############  +..............",
            "+++#############  ...............",
            "++############# +................",
            "++############# .................",
            "++############ +.................",
            "++############ ..................",
            "++##########  +..................",
            "++##########  ...................",
            "+###########+....................",
    } }
    local CART = { mapID = 1424, x = 0.8804, y = 0.4708, label = "The fallen cart at Thoradin's Wall: climb it", climb = WALL, reach = 5 }
    Via(BAG, { CART })
    Via(SATCHEL, { CART })



    local AT_BARRENS = "Burned-Out Remains at the burnt tower on the road south of Camp Taurajo, The Barrens (46.3, 73.9)"
    local AT_WESTFALL = "Burned-Out Remains in the cart wreckage at the Alexston Farmstead, Westfall (37.3, 50.6)"
    local AT_LITTER = "Pocket Litter on a box at the abandoned camp, Stonetalon Mountains (40.8, 52.6)"
    local AT_MOUND = "Mound of Dirt below the cliff north of the camp, Stonetalon Mountains (39.6, 49.9)"
    local AT_FIGURINE = "Carved Figurine on the carved heads of the Stonewrought Dam, Loch Modan (49.4, 12.9)"
    local AT_BAG = "Messenger Bag hanging at Thoradin's Wall, Hillsbrad Foothills (85.7, 52.2)"

    FDJ.DB[PAGE] = {
        questChainPage = true,
        level = "14+",
        location = "",
        description = "",
        bosses = {},
        quests = { {
            id = 79976, name = "This Must Be The Place", level = 32, requires = 14, faction = "Alliance",
            objective = "Search the Hastily Rolled-Up Satchel under the Messenger Bag at Thoradin's Wall.",
            pickup = AT_BAG,
            turnin = "Hastily Rolled-Up Satchel, right under the Messenger Bag",
            startMap = BAG, turninMap = SATCHEL,
            liveXPFallback = 1950,
            rewardItems = { {211527, "Cozy Sleeping Bag", 3}, {216619, "Student Fodder", 2} },
        } },
    }



    local NOTE = { id = 79008, name = "... and that note you found" }
    FDJ.QUEST_PREREQ_CHAINS[79976] = {
        NOTE,
        { id = 79192, name = "Stepping Stones" },
        { id = 79980, name = "Scramble" },
        { id = 79974, name = "Wet Job" },
        { id = 79975, name = "Eagle's Fist" },
    }
    FDJ.QUEST_PREREQ_DETAILS[79007] = {
        level = 22, requires = 14,
        objective = "Follow the charred note from The Barrens to its twin place: the Burned-Out Remains at the Alexston Farmstead in Westfall.",
        pickup = AT_BARRENS, turnin = AT_WESTFALL,
        map = BARRENS_REMAINS, turninMap = WESTFALL_REMAINS,
    }
    FDJ.QUEST_PREREQ_DETAILS[79008] = {
        level = 22, requires = 14,
        objective = "Follow the charred note from Westfall to its twin place: the Burned-Out Remains at the burnt tower south of Camp Taurajo in The Barrens.",
        pickup = AT_WESTFALL, turnin = AT_BARRENS,
        map = WESTFALL_REMAINS, turninMap = BARRENS_REMAINS,
    }


    local STEPPING = {
        level = 24, requires = 14,
        objective = "Find the cozy spot in the mountains between The Barrens and Desolace: the Pocket Litter at an abandoned camp in Stonetalon Mountains.",
        turnin = AT_LITTER,
        turninMap = POCKET_LITTER,
        note = "Take the path north-east of Sun Rock Retreat (50.9, 52.3) up to the abandoned camp; the Pocket Litter lies on a box. Optional: light the Firepit in the middle of the camp with the Simple Wood and Flint and Tinder from this quest (Rekindle).",
    }
    FDJ.QUEST_PREREQ_DETAILS[79192] = STEPPING
    FDJ.QUEST_PREREQ_DETAILS[79980] = {
        level = 24, requires = 14,
        objective = "Take a hundred paces due north of the camp and find the Mound of Dirt below the cliff.",
        pickup = AT_LITTER, turnin = AT_MOUND,
        map = POCKET_LITTER, turninMap = MOUND,
        note = "Head straight north from the camp, climb the hill and jump down from its edge to the Mound of Dirt. Watch your step.",
    }
    FDJ.QUEST_PREREQ_DETAILS[79974] = {
        level = 32, requires = 14,
        objective = "Find the eagle's nest on the face of the Stonewrought Dam in Loch Modan: the Carved Figurine.",
        pickup = AT_MOUND, turnin = AT_FIGURINE,
        map = MOUND, turninMap = FIGURINE,
        note = "Jump onto the carved heads of the dam, on the side facing the Wetlands, to reach the figurine. Getting there is tricky for the Horde.",
    }
    FDJ.QUEST_PREREQ_DETAILS[79975] = {
        level = 32, requires = 14,
        objective = "Find the Messenger Bag at Thoradin's Wall, between Hillsbrad Foothills and the Arathi Highlands.",
        pickup = AT_FIGURINE, turnin = AT_BAG,
        map = FIGURINE, turninMap = BAG,
        note = "Climb into Thoradin's Wall from the cart on the Hillsbrad side (87.3, 49.6), go through the room in the wall and look outside to the right: the bag hangs there.",
    }

    local PLANK = {
        Horde = { WESTFALL_PLANK, "Nailed Plank next to the Burned-Out Remains at the Alexston Farmstead, Westfall (37.4, 50.9)" },
        Alliance = { BARRENS_PLANK, "Nailed Plank on the side of the burnt tower south of Camp Taurajo, The Barrens (46.4, 73.8)" },
    }


    function FDJ.SetSleepingBagFaction(faction)
        local plank = PLANK[faction] or PLANK.Alliance
        NOTE.id = faction == "Horde" and 79007 or 79008
        STEPPING.map, STEPPING.pickup = plank[1], plank[2]
        FDJ.DB[PAGE].quests[1].faction = faction == "Horde" and "Horde" or "Alliance"
    end
    FDJ.SetSleepingBagFaction("Alliance")

    local REWARDS = FDJ.PREREQ_REWARD_ITEMS_FALLBACK
    REWARDS[79007] = { items = { {2459, "Swiftness Potion", 1}, {3388, "Lesser Troll's Blood Elixir", 1} }, choice = false }
    REWARDS[79008] = REWARDS[79007]
    REWARDS[79192] = { items = { {2901, "Mining Pick", 1}, {3334, "Farmer's Shovel", 2} }, choice = true,
        also = { {1652, "Sturdy Lunchbox", 1}, {4470, "Simple Wood", 1}, {4471, "Flint and Tinder", 1}, {221498, "Old Toolbox", 1} } }
    REWARDS[79980] = { items = { {3463, "Silver Star", 2}, {217314, "Moonsight Rifle", 2}, {217315, "Precision Bow", 2} }, choice = true,
        also = { {3464, "Feathered Arrow", 2}, {3465, "Exploding Shot", 2}, {216619, "Student Fodder", 2} } }
    REWARDS[79974] = { items = { {5432, "Hickory Pipe", 0}, {20709, "Rumsey Rum Light", 1} }, choice = false }

    local XP = FDJ.FOREVER_QUEST_XP_FALLBACK
    XP[79007], XP[79008], XP[79192], XP[79980] = 1750, 1750, 1950, 200
    XP[79974], XP[79975], XP[79976] = 2550, 2550, 1950
    for _, id in ipairs({ 79007, 79008, 79192, 79980, 79974, 79975, 79976 }) do
        FDJ.QUEST_SHAREABILITY_AUDIT[id] = false
    end
end






for _, id in ipairs({ 65, 132, 135, 141, 153, 155, 275, 276, 277, 303, 373, 389, 463, 545, 865, 870, 877, 880, 1100, 1109, 1198, 1489, 1490, 1806, 2041, 2842, 2926, 2947, 2949, 5726, 92432, 92742, 92744, 92745, 92748, 92750, 92751, 92752, 92819, 95647, 95663, 96391 }) do
    local d = FDJ.QUEST_PREREQ_DETAILS[id]
    if d then d.suppressDescription = true end
end







FDJ.NPC_FLOORS = {
    ["Apothecary Zamah"] = { { 1, -996, 277, -26 }, { 1, -995.5, 278.5, -26 }, { 1, -995.5, 280.5, -26 } },
    ["Argent Outfitter"] = { { 0, 1580, 245, -122 }, { 0, 1586, 250, -122 } },
    ["Argent Scout"] = { { 0, 1577, 238, -122 } },
    ["Astarii Starseeker"] = { { 1, 9666, 2531.5, 26 }, { 1, 9667, 2532.5, 26 } },
    ["Beetix Ficklespragg"] = { { 1, -6855.5, 740, 11 } },
    ["Cenarion Emissary Blackhoof"] = { { 1, 1658.5, -4349, -32 } },
    ["Clarice Foster"] = { { 1, -1033.5, 214, -25 } },
    ["Dizzy One-Eye"] = { { 0, -14397.5, 396.5, 14 } },
    ["Elder Skychaser"] = { { 0, -10499, 1034, 28 } },
    ["Elenia Haydon"] = { { 0, 1588.5, 231, -112 } },
    ["Fenstad Argyle"] = { { 0, 1591.5, 233.5, -112 } },
    ["Godrick Farsan"] = { { 0, 1783, 60, -16 } },
    ["Harbinger Balthazad"] = { { 0, 1596, 260, -117 } },
    ["High Executor Hadrec"] = { { 0, 522.5, 1626.5, -20 } },
    ["High Sorcerer Andromath"] = { { 0, -9011, 876.5, 119 } },
    ["Innkeeper Norman"] = { { 0, 1635.5, 223.5, -106 } },
    ["Jeremiah Payson"] = { { 0, 1595.5, 224.5, -122 } },
    ["Kwee Q. Peddlefeet"] = { { 1, 9669.5, 2536.5, 28 }, { 1, 9670.5, 2535, 26 } },
    ["Lunar Festival Herald"] = { { 0, 1600.5, 233, -112 } },
    ["Malakai Cross"] = { { 1, -1008, 259, -26 }, { 1, -1007, 260.5, -26 }, { 1, -1006, 260, -26 } },
    ["Nardstrum Copperpinch"] = { { 0, 1629, 218.5, -106 } },
    ["Nissa Firestone"] = { { 0, -4876.5, -1149, 10 } },
    ["Nixxrax Fillamug"] = { { 0, -14451.5, 495.5, -11 } },
    ["Noggle Ficklespragg"] = { { 1, -6852.5, 739, 12 } },
    ["Oglethorpe Obnoticus"] = { { 0, -14417, 411, 14 } },
    ["Priestess Alathea"] = { { 1, 9665.5, 2520, 26 }, { 1, 9666, 2521.5, 26 } },
    ["Sage Truthseeker"] = { { 1, -1177, 157.5, -9 }, { 1, -1176, 157.5, -9 } },
    ["Scooty"] = { { 0, -14465, 459.5, -11 } },
    ["Scout Riell"] = { { 0, -10505, 1033, 28 } },
    ["Sentinel Elissa Starbreeze"] = { { 1, 6431.5, 384, 9 } },
    ["Thurston Xane"] = { { 1, -996, 254, -36 }, { 1, -995.5, 255, -36 } },
    ["Tyrande Whisperwind"] = { { 1, 9662.5, 2524.5, 29 }, { 1, 9662.5, 2526.5, 28 } },
}






do
    local texts = {
        enUS = "Extremely rare drop", deDE = "Extrem seltene Beute", frFR = "Butin extrêmement rare",
        esES = "Botín extremadamente raro", esMX = "Botín extremadamente raro", itIT = "Bottino estremamente raro",
        ptBR = "Saque extremamente raro", ruRU = "Чрезвычайно редкая добыча", koKR = "극히 드문 전리품",
        zhCN = "极其稀有的掉落", zhTW = "極其稀有的掉落",
    }
    for locale, text in pairs(texts) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.EXTREMELY_RARE_DROP == nil then t.EXTREMELY_RARE_DROP = text end
    end
end


do
    local texts = {
        enUS = { "Remove quest glow on chain step \"Pick it up\"", "A quest whose chain you have finished, and that you can take now, glows gold in the quest list. Tick this to remove the glow (\"Pick it up\" stays)." },
        deDE = { "Questleuchten bei „Annehmen“ (Questreihen-Schritt) entfernen", "Eine Quest, deren Questreihe du abgeschlossen hast und die du jetzt annehmen kannst, leuchtet in der Questliste golden. Anhaken, um das Leuchten zu entfernen („Annehmen“ bleibt)." },
        frFR = { "Retirer la lueur des quêtes « À prendre » (étape de suite)", "Une quête dont vous avez fini la suite, et que vous pouvez prendre, brille en doré dans la liste des quêtes. Cochez pour retirer la lueur (« À prendre » reste)." },
        esES = { "Quitar el brillo de misiones «Recoger» (paso de cadena)", "Una misión cuya cadena has terminado y que ya puedes recoger brilla en dorado en la lista de misiones. Márcalo para quitar el brillo («Recoger» se queda)." },
        itIT = { "Rimuovi il bagliore delle missioni «Da prendere» (passo della catena)", "Una missione di cui hai finito la catena, e che ora puoi prendere, brilla d'oro nell'elenco delle missioni. Spunta per togliere il bagliore («Da prendere» resta)." },
        ptBR = { "Remover o brilho das missões \"Pegar\" (etapa de cadeia)", "Uma missão cuja cadeia você terminou, e que já pode pegar, brilha dourada na lista de missões. Marque para remover o brilho (\"Pegar\" continua)." },
        ruRU = { "Убрать свечение заданий «Взять» (шаг цепочки)", "Задание, цепочку которого вы прошли и которое уже можно взять, светится золотом в списке заданий. Отметьте, чтобы убрать свечение («Взять» останется)." },
        koKR = { "연계 퀘스트 단계 \"수락 가능\" 빛 효과 끄기", "연계 퀘스트를 마쳐 지금 받을 수 있는 퀘스트는 퀘스트 목록에서 금빛으로 빛납니다. 체크하면 빛 효과가 사라집니다(\"수락 가능\"은 남습니다)." },
        zhCN = { "移除任务链步骤“可以接取”的任务光效", "已完成任务链、现在可以接取的任务会在任务列表中发出金光。勾选后移除光效（“可以接取”仍会显示）。" },
        zhTW = { "移除任務鏈步驟「可以接取」的任務光效", "已完成任務鏈、現在可以接取的任務會在任務列表中發出金光。勾選後移除光效（「可以接取」仍會顯示）。" },
    }
    texts.esMX = texts.esES
    for locale, pair in pairs(texts) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            if t.OPT_HIDE_CHAIN_GLOW == nil then t.OPT_HIDE_CHAIN_GLOW = pair[1] end
            if t.OPT_HIDE_CHAIN_GLOW_TIP == nil then t.OPT_HIDE_CHAIN_GLOW_TIP = pair[2] end
        end
    end
end

do
    local tips = {
        enUS = "Click to open the quest", deDE = "Klicken, um die Quest zu öffnen", frFR = "Cliquez pour ouvrir la quête",
        esES = "Haz clic para abrir la misión", esMX = "Haz clic para abrir la misión", itIT = "Clicca per aprire la missione",
        ptBR = "Clique para abrir a missão", ruRU = "Нажмите, чтобы открыть задание", koKR = "클릭하여 퀘스트 열기",
        zhCN = "点击打开任务", zhTW = "點擊打開任務",
    }
    for locale, text in pairs(tips) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.BOSS_QUEST_TIP == nil then t.BOSS_QUEST_TIP = text end
    end
end





do
    local LABELS = {
        ["Paladin Mount Quest Boss"] = {
            deDE = "Paladin-Reittierquest-Boss", frFR = "Boss quête monture paladin",
            esES = "Jefe misión montura paladín", esMX = "Jefe misión montura paladín",
            itIT = "Boss destriero paladino", ptBR = "Chefe montaria de paladino",
            ruRU = "Босс квеста коня паладина", koKR = "성기사 탈것 퀘스트 보스",
            zhCN = "圣骑士坐骑任务首领", zhTW = "聖騎士坐騎任務首領",
        },

        ["Warlock Mount Quest Boss"] = {
            deDE = "Hexenmeister-Reittierquest-Boss", frFR = "Boss quête monture démoniste",
            esES = "Jefe misión montura brujo", esMX = "Jefe misión montura brujo",
            itIT = "Boss destriero stregone", ptBR = "Chefe montaria de bruxo",
            ruRU = "Босс квеста коня чернокнижника", koKR = "흑마법사 탈것 퀘스트 보스",
            zhCN = "术士坐骑任务首领", zhTW = "術士坐騎任務首領",
        },


        ["0.5 Quest Event"] = {
            deDE = "0.5-Questereignis", frFR = "Événement de quête 0.5",
            esES = "Evento de misión 0.5", esMX = "Evento de misión 0.5",
            itIT = "Evento missione 0.5", ptBR = "Evento de missão 0.5",
            ruRU = "Событие задания 0.5", koKR = "0.5 퀘스트 이벤트",
            zhCN = "0.5任务事件", zhTW = "0.5任務事件",
        },
    }
    function FDJ.RareLabelText(label)
        if type(label) ~= "string" then return nil end
        local byLang = LABELS[label]
        local lang = FDJ.GetLanguage and FDJ.GetLanguage() or nil
        return (byLang and lang and byLang[lang]) or label
    end
end









FDJ.QUESTROW_TRIAL = {
    ["The Deadmines"] = true,
    ["Scarlet Monastery: Library"] = true,
}



FDJ.QUESTROW_ALL = true
do
    local strings = {
        enUS = { "Pick it up", "How to pick it up", "Its quest chain first: %s", "Show both factions' quests",
            "Lets you switch a dungeon's quest list to the other faction's quests (the crests at the top of the list). Off: you only see your own faction's quests.",
            "Your faction's quests. To see the other faction's too: Options, \"Show both factions' quests\".", "Show pickup on map" },
        deDE = { "Annehmen", "So nimmst du sie an", "Erst die Questreihe: %s", "Quests beider Fraktionen anzeigen",
            "Lässt dich die Questliste eines Dungeons auf die Quests der anderen Fraktion umschalten (die Wappen oben in der Liste). Aus: Du siehst nur die Quests deiner Fraktion.",
            "Die Quests deiner Fraktion. Um auch die der anderen zu sehen: Optionen, \"Quests beider Fraktionen anzeigen\".", "Annahmeort auf der Karte zeigen" },
        frFR = { "À prendre", "Comment la prendre", "D'abord sa suite de quêtes : %s", "Afficher les quêtes des deux factions",
            "Permet d'afficher dans la liste des quêtes d'un donjon celles de l'autre faction (les blasons en haut de la liste). Désactivé : vous ne voyez que les quêtes de votre faction.",
            "Les quêtes de votre faction. Pour voir aussi celles de l'autre : Options, « Afficher les quêtes des deux factions ».", "Afficher sur la carte où la prendre" },
        esES = { "Recoger", "Cómo conseguirla", "Primero su cadena de misiones: %s", "Mostrar misiones de ambas facciones",
            "Te deja cambiar la lista de misiones de una mazmorra a las de la otra facción (los blasones de arriba de la lista). Desactivado: solo ves las misiones de tu facción.",
            "Las misiones de tu facción. Para ver también las de la otra: Opciones, «Mostrar misiones de ambas facciones».", "Mostrar en el mapa dónde conseguirla" },
        itIT = { "Da prendere", "Come prenderla", "Prima la sua catena di missioni: %s", "Mostra le missioni di entrambe le fazioni",
            "Ti permette di passare l'elenco delle missioni di un'istanza a quelle dell'altra fazione (gli stemmi in cima all'elenco). Disattivato: vedi solo le missioni della tua fazione.",
            "Le missioni della tua fazione. Per vedere anche quelle dell'altra: Opzioni, «Mostra le missioni di entrambe le fazioni».", "Mostra sulla mappa dove prenderla" },
        ptBR = { "Pegar", "Como pegá-la", "Primeiro a cadeia de missões: %s", "Mostrar missões das duas facções",
            "Permite trocar a lista de missões de uma masmorra para as da outra facção (os brasões no topo da lista). Desligado: você só vê as missões da sua facção.",
            "As missões da sua facção. Para ver também as da outra: Opções, \"Mostrar missões das duas facções\".", "Mostrar no mapa onde pegá-la" },
        ruRU = { "Взять", "Как взять задание", "Сначала цепочка заданий: %s", "Показывать задания обеих фракций",
            "Позволяет переключать список заданий подземелья на задания другой фракции (гербы вверху списка). Выкл.: видны только задания вашей фракции.",
            "Задания вашей фракции. Чтобы видеть и задания другой: Настройки, «Показывать задания обеих фракций».", "Показать на карте, где взять" },
        koKR = { "수락 가능", "퀘스트 받는 방법", "먼저 연계 퀘스트: %s", "양 진영 퀘스트 보기",
            "던전 퀘스트 목록을 다른 진영의 퀘스트로 바꿀 수 있습니다(목록 위의 문장). 끄기: 자신의 진영 퀘스트만 보입니다.",
            "자신의 진영 퀘스트입니다. 다른 진영 퀘스트도 보려면: 설정, \"양 진영 퀘스트 보기\".", "받는 곳을 지도에 표시" },
        zhCN = { "可以接取", "如何接取", "先完成任务链：%s", "显示两个阵营的任务",
            "可以将副本的任务列表切换为另一阵营的任务（列表顶部的徽记）。关闭：只显示你所在阵营的任务。",
            "你所在阵营的任务。要同时查看另一阵营的任务：选项，“显示两个阵营的任务”。", "在地图上显示接取地点" },
        zhTW = { "可以接取", "如何接取", "先完成任務鏈：%s", "顯示兩個陣營的任務",
            "可以將副本的任務列表切換為另一陣營的任務（列表頂部的徽記）。關閉：只顯示你所在陣營的任務。",
            "你所在陣營的任務。要同時查看另一陣營的任務：選項，「顯示兩個陣營的任務」。", "在地圖上顯示接取地點" },
    }
    strings.esMX = strings.esES
    local keys = { "PICK_IT_UP", "PICKUP_HOW", "PICKUP_CHAIN_FIRST", "OPT_BOTH_FACTIONS", "OPT_BOTH_FACTIONS_TIP", "FACTION_LOCKED_TIP", "PICKUP_ON_MAP" }
    for locale, texts in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            for i, key in ipairs(keys) do
                if t[key] == nil then t[key] = texts[i] end
            end
        end
    end
end







FDJ.NPC_UPSTAIRS = {
    ["Raleigh the Devout"] = true,
    ["Ashe Amberhall"] = true,
    ["Archmage Tervosh"] = true,
}
do
    local strings = {
        enUS = "Go upstairs", deDE = "Geh nach oben", frFR = "Montez à l'étage", esES = "Sube al piso de arriba",
        itIT = "Sali al piano di sopra", ptBR = "Suba as escadas", ruRU = "Поднимитесь наверх",
        koKR = "위층으로 올라가세요", zhCN = "上楼", zhTW = "上樓",
    }
    strings.esMX = strings.esES
    for locale, text in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ARROW_GO_UP == nil then t.ARROW_GO_UP = text end
    end
end









do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local IN = "Into the tower"
    FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1445", 0.664, 0.493)] = { reach = 10,
        { mapID = 1445, x = 0.654, y = 0.482, label = IN, keep = true, inside = true, labelNear = 150 },
    }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, line in pairs({ deDE = "In den Turm hinein", frFR = "Entrez dans la tour", esES = "Entra en la torre", itIT = "Entra nella torre",
        ptBR = "Entre na torre", ruRU = "Войдите в башню", koKR = "탑 안으로 들어가세요", zhCN = "进入塔内", zhTW = "進入塔內" }) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.places = content.places or {}
        if content.places[IN] == nil then content.places[IN] = line end
    end
end










FDJ.QUEST_RP = {
    [1052] = { npc = 3980, name = "Raleigh the Devout", lines = 3 },
}
do
    local strings = {
        enUS = { "Wait for the RP", "Wait for the RP (%ds)" },
        deDE = { "Warte auf die Szene", "Warte auf die Szene (%d s)" },
        frFR = { "Attendez la fin de la scène", "Attendez la fin de la scène (%d s)" },
        esES = { "Espera a que termine la escena", "Espera a que termine la escena (%d s)" },
        itIT = { "Aspetta la fine della scena", "Aspetta la fine della scena (%d s)" },
        ptBR = { "Aguarde o fim da cena", "Aguarde o fim da cena (%d s)" },
        ruRU = { "Дождитесь конца сценки", "Дождитесь конца сценки (%d с)" },
        koKR = { "장면이 끝날 때까지 기다리세요", "장면이 끝날 때까지 기다리세요 (%d초)" },
        zhCN = { "等待剧情结束", "等待剧情结束（%d秒）" },
        zhTW = { "等待劇情結束", "等待劇情結束（%d秒）" },
    }
    strings.esMX = strings.esES
    for locale, pair in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            if t.ARROW_RP_WAIT == nil then t.ARROW_RP_WAIT = pair[1] end
            if t.ARROW_RP_WAIT_TIME == nil then t.ARROW_RP_WAIT_TIME = pair[2] end
        end
    end
end










do
    local LANDALOCK = { mapID = 1416, x = 0.154, y = 0.738, label = "Archmage Lan'dalock — Dalaran", targetName = "Archmage Lan'dalock" }
    local ADDED = {



        { dungeon = "Blackmaw Hold", quest = {
            id = 97327,
            learnTitle = "Blackmaw Pouches",
            learnItem = 273050,
            name = "Blackmaw Pouches",
            level = 60,
            requires = 55,
            faction = "Both",
            pickup = "Ekkal, Ruins of Eldarath, Azshara (42.0, 38.9)",
            objective = "Enter Blackmaw Hold and recover 5 Blackmaw Pouches for Ekkal at the Ruins of Eldarath in Azshara.",
            turnin = "Ekkal, Ruins of Eldarath, Azshara (42.0, 38.9)",
            rewardSummary = "90s  •  Timbermaw Hold +150",
            liveXPFallback = 13200,
            requiredItem = { 273050, "Blackmaw Pouch", 1, 5, "From the Blackmaw furbolgs inside Blackmaw Hold" },
            note = "Afterwards Ekkal takes more pouches as a repeatable quest (Timbermaw Hold +100).",
            startMap = { mapID = 1447, x = 0.420, y = 0.389, label = "Ekkal — Ruins of Eldarath, Azshara", targetName = "Ekkal" },
            turninMap = { mapID = 1447, x = 0.420, y = 0.389, label = "Ekkal — Ruins of Eldarath, Azshara", targetName = "Ekkal" },
        } },

















        { dungeon = "Shaper's Terrace", quest = {
            id = 97049,
            learnTitle = "Essence of Seeping Slimes",
            learnItem = 276235,
            name = "Essence of Seeping Slimes",
            level = 60,
            requires = 55,
            faction = "Horde",
            pickup = "Chemist Fuely, The Apothecarium, Undercity (47.5, 73.3)",
            objective = "Gather 8 Seeping Slime Essence in the Shaper's Terrace.",
            turnin = "Chemist Fuely, The Apothecarium, Undercity (47.5, 73.3)",
            turninMap = { mapID = 1458, x = 0.475, y = 0.733, label = "Chemist Fuely — Undercity", targetName = "Chemist Fuely" },
            liveXPFallback = 17650,
            rewardSummary = "90s  •  Undercity +100  •  Orgrimmar +50",
            rewardItems = { {279932, "Slime-Resistant Shroud", 3}, {279902, "Reinforced Muck Protectors", 3} },
            rewardChoice = true,
            requiredItem = { 276235, "Seeping Slime Essence", 1, 8, "From the slimes in the pools inside Shaper's Terrace" },
            startMap = { mapID = 1458, x = 0.475, y = 0.733, label = "Chemist Fuely — Undercity", targetName = "Chemist Fuely" },
        } },
        { dungeon = "Shaper's Terrace", quest = {
            id = 95926,
            learnTitle = "The Dark Crystal",
            learnItem = 271771,
            name = "The Dark Crystal",
            level = 60,
            requires = 55,
            faction = "Horde",
            pickup = "Master Apothecary Faranell, The Apothecarium, Undercity (48.8, 69.3)",
            objective = "Gather a colorless Drained Crystal Fragment near the Achromatic Crystal in the Shaper's Terrace.",
            turnin = "Master Apothecary Faranell, The Apothecarium, Undercity (48.8, 69.3)",
            turninMap = { mapID = 1458, x = 0.488, y = 0.693, label = "Master Apothecary Faranell — Undercity", targetName = "Master Apothecary Faranell" },
            liveXPFallback = 17650,
            rewardSummary = "Undercity +100  •  Orgrimmar +50",
            rewardItems = { {279908, "Crystal-Infused Cleaver", 3}, {279910, "Beastslayer's Trident", 3}, {279912, "Faintly Glowing Orb", 3} },
            rewardChoice = true,
            requiredItem = { 271771, "Drained Crystal Fragment", 1, 1, "Near the Achromatic Crystal inside Shaper's Terrace" },
            startMap = { mapID = 1458, x = 0.488, y = 0.693, label = "Master Apothecary Faranell — Undercity", targetName = "Master Apothecary Faranell" },
        } },

        { dungeon = "Shaper's Terrace", quest = {
            id = 95924,
            learnTitle = "Panic at the Digsite",
            name = "Panic at the Digsite",
            level = 60,
            requires = 55,
            faction = "Alliance",
            pickup = "Curator Thorius, Hall of Explorers, Ironforge (71.5, 15.7)",
            objective = "Slay Venomridge, 6 Ravasaur Matriarchs and 8 Ironhide Ravasaurs in Shaper's Terrace.",
            turnin = "Curator Thorius, Hall of Explorers, Ironforge (71.5, 15.7)",
            turninMap = { mapID = 1455, x = 0.715, y = 0.157, label = "Curator Thorius — Hall of Explorers, Ironforge", targetName = "Curator Thorius" },
            liveXPFallback = 17650,
            rewardSummary = "90s  •  Ironforge +100  •  Stormwind +50",
            rewardItems = { {279903, "Diemetradon Scale Spaulders", 3}, {279905, "Ravasaur Hide Footpads", 3} },
            rewardChoice = true,
            note = "The quest text asks for 9 Ironhide Ravasaurs, its objective counts 8.",
            startMap = { mapID = 1455, x = 0.715, y = 0.157, label = "Curator Thorius — Hall of Explorers, Ironforge", targetName = "Curator Thorius" },
        } },
        { dungeon = "Shaper's Terrace", quest = {
            id = 95925,
            learnTitle = "Mapping the Way Forward",
            name = "Mapping the Way Forward",
            level = 60,
            requires = 55,
            faction = "Alliance",
            pickup = "Curator Thorius, Hall of Explorers, Ironforge (71.5, 15.7)",
            objective = "Find Interesting Landmarks in Shaper's Terrace and fill out the explorer's map at each: the Pillar of Assimilation, the Achromatic Crystal, the Western Gates, the Regrowth Vestibule and the Unearthed Stone Watcher.",
            turnin = "Curator Thorius, Hall of Explorers, Ironforge (71.5, 15.7)",
            turninMap = { mapID = 1455, x = 0.715, y = 0.157, label = "Curator Thorius — Hall of Explorers, Ironforge", targetName = "Curator Thorius" },
            liveXPFallback = 17650,
            rewardSummary = "Ironforge +100  •  Stormwind +50",
            rewardItems = { {279908, "Crystal-Infused Cleaver", 3}, {279910, "Beastslayer's Trident", 3}, {279912, "Faintly Glowing Orb", 3} },
            rewardChoice = true,
            note = "You map them with an Explorers' League Cartographer's Kit.",
            startMap = { mapID = 1455, x = 0.715, y = 0.157, label = "Curator Thorius — Hall of Explorers, Ironforge", targetName = "Curator Thorius" },
        } },


        { dungeon = "Shaper's Terrace", quest = {
            id = 95790,
            learnTitle = "Digestible Research",
            name = "Digestible Research",
            level = 60,
            requires = 55,
            faction = "Alliance",
            pickup = "The Partially Digested Journal lying on the ground inside Shaper's Terrace (the Verdant Plains): click it to get the quest",
            objective = "Collect 15 Partially Digested Journal Pages in Shaper's Terrace.",
            turnin = "Curator Thorius, Hall of Explorers, Ironforge (71.5, 15.7)",
            turninMap = { mapID = 1455, x = 0.715, y = 0.157, label = "Curator Thorius — Hall of Explorers, Ironforge", targetName = "Curator Thorius" },
            rewardSummary = "Ironforge +100  •  Stormwind +100",
            liveXPFallback = 17650,
            rewardItems = { {279931, "Lost Researcher's Hood", 3}, {279901, "Expeditionary Legplates", 3} },
            rewardChoice = true,
            note = "Starts from the Partially Digested Journal on the ground inside the dungeon.",
        } },
        { dungeon = "Razorfen Downs", quest = {
            id = 96773,
            learnTitle = "The Coldbringer's Eye",
            learnItem = 276916,
            name = "The Coldbringer's Eye",
            level = 41,
            requires = 34,
            faction = "Alliance",
            pickup = "Archmage Lan'dalock, Dalaran, Alterac Mountains",
            objective = "Recover The Coldbringer's Eye from Razorfen Downs.",
            turnin = "Archmage Lan'dalock, Dalaran, Alterac Mountains",
            liveXPFallback = 8600,
            rewardSummary = "55s",
            requiredItem = { 276916, "The Coldbringer's Eye", 1, 1, "From Amnennar the Coldbringer, the last boss of Razorfen Downs" },

            startMap = LANDALOCK,
            turninMap = LANDALOCK,
        } },

        { dungeon = "Zul'Farrak", quest = {
            id = 96770,
            learnTitle = "The Witch Doctor's Head",
            learnItem = 277112,
            name = "The Witch Doctor's Head",
            level = 46,
            requires = 39,
            faction = "Alliance",
            pickup = "Archmage Lan'dalock, Dalaran, Alterac Mountains",
            objective = "Slay Witch Doctor Zum'rah and bring Zum'rah's Head to Archmage Lan'dalock in Dalaran.",
            turnin = "Archmage Lan'dalock, Dalaran, Alterac Mountains",
            liveXPFallback = 10100,
            rewardSummary = "1g 30s  •  Kirin Tor +300",
            requiredItem = { 277112, "Zum'rah's Head", 1, 1, "From Witch Doctor Zum'rah, Zul'Farrak" },
            startMap = LANDALOCK,
            turninMap = LANDALOCK,
        } },



        { dungeon = "Zul'Farrak", quest = {
            id = 96775,
            learnTitle = "Zum'rah's Head",
            learnItem = 277112,
            name = "Zum'rah's Head",
            level = 46,
            requires = 42,
            faction = "Horde",
            pickup = "Mazu'kon, Skywatcher Plateau, Mulgore",
            objective = "Slay Witch Doctor Zum'rah and bring Zum'rah's Head to Mazu'kon in Mulgore.",
            turnin = "Mazu'kon, Skywatcher Plateau, Mulgore",
            liveXPFallback = 10100,
            rewardSummary = "65s  •  Earthen Ring +300  •  Darkspear Trolls +150",
            requiredItem = { 277112, "Zum'rah's Head", 1, 1, "From Witch Doctor Zum'rah, Zul'Farrak" },
            startMap = FDJ.QUEST_START_MAPS[96774],
            turninMap = FDJ.QUEST_START_MAPS[96774],
        } },



        { dungeon = "Alcaz Prison", quest = {
            id = 95483,
            learnTitle = "Thrall Needs to Know",
            name = "Thrall Needs to Know",
            level = 53,
            requires = 48,
            faction = "Horde",
            pickup = "Commander Folkar, inside Alcaz Prison",
            objective = "Bring word of Varian Wrynn's fate to Thrall in Orgrimmar.",
            turnin = "Thrall, Valley of Wisdom, Orgrimmar (32.0, 37.8)",
            rewardSummary = "",
            rewards = "Choose: Fatebound Buckler, Courier's Clasp or Dustwallow Dirk\n2,400 XP • Orgrimmar +100",

            rewardChoice = true,
            rewardItems = { { 279831, "Fatebound Buckler", 3 }, { 279833, "Courier's Clasp", 3 }, { 279474, "Dustwallow Dirk", 3 } },
            liveXPFallback = 2400,
            turninMap = { mapID = 1454, x = 0.320, y = 0.378, label = "Thrall — Orgrimmar", targetName = "Thrall" },
        } },



        { dungeon = "Alcaz Prison", quest = {
            id = 96334,
            learnTitle = "Blood Red Bandanas",
            learnItem = 274028,
            name = "Blood Red Bandanas",
            level = 50,
            requires = 48,
            faction = "Horde",
            pickup = "Sergeant Ulka, outside Alcaz Prison, Alcaz Island, Dustwallow Marsh (70.2, 18.8)",
            objective = "Enter Alcaz Prison and collect 8 Blood Red Bandanas from the human guards there.",
            turnin = "Eitrigg, Grommash Hold, Orgrimmar",
            liveXPFallback = 9700,
            rewardSummary = "",
            rewardChoice = true,
            rewardItems = { { 279448, "Bloodsplattered Bandana", 2 }, { 279473, "Makeshift Belt", 2 } },
            requiredItem = { 274028, "Blood Red Bandana", 1, 8, "From the Defias guards in Alcaz Prison" },
            turninMap = { mapID = 1454, x = 0.344, y = 0.386, label = "Eitrigg — Grommash Hold, Orgrimmar", targetName = "Eitrigg" },
        } },


        { dungeon = "Alcaz Prison", quest = {
            id = 96332,
            learnTitle = "A Little Payback",
            learnItem = 273883,
            name = "A Little Payback",
            level = 53,
            requires = 48,
            faction = "Horde",
            pickup = "Sergeant Ulka, outside Alcaz Prison, Alcaz Island, Dustwallow Marsh (70.2, 18.8)",
            objective = "Enter the Alcaz Prison and slay 15 Strashaz Soldiers, 8 Strashaz Enchantresses, and bring the head of Tidemistress Ca'zass to Sergeant Ulka.",
            turnin = "Sergeant Ulka, outside Alcaz Prison, Alcaz Island, Dustwallow Marsh (70.2, 18.8)",
            liveXPFallback = 9700,
            rewardSummary = "Orgrimmar +75",
            rewards = "Choose: Kor'kron Battle Gauntlets, Marshdweller's Pants or Naga Scale Spaulders\n9,700 XP • Orgrimmar +75",
            rewardChoice = true,
            rewardItems = { { 279824, "Kor'kron Battle Gauntlets", 2 }, { 279826, "Marshdweller's Pants", 2 }, { 279829, "Naga Scale Spaulders", 2 } },
            requiredItem = { 273883, "Ca'zass's Head", 1, 1, "From Tidemistress Ca'zass in Alcaz Prison" },
        } },
    }

    local pending = {}
    for _, add in ipairs(ADDED) do
        local d = FDJ.DB and FDJ.DB[add.dungeon]
        if d then
            d.quests = d.quests or {}
            local have = false
            for _, q in ipairs(d.quests) do
                if q.name == add.quest.name and q.faction == add.quest.faction then have = true end
            end
            if not have then
                table.insert(d.quests, add.quest)
                if add.quest.id < 0 then pending[add.quest.id] = add.quest end
                if FDJ.QUEST_START_MAPS then FDJ.QUEST_START_MAPS[add.quest.id] = add.quest.startMap end
            end
        end
    end







    local ULKA = { mapID = 1445, x = 0.702, y = 0.188, label = "Sergeant Ulka — Dustwallow Marsh", targetName = "Sergeant Ulka", detail = "Sergeant Ulka, outside Alcaz Prison on Alcaz Island" }
    FDJ.QUEST_PREREQ_CHAINS[95483] = {
        { id = 95309, name = "No Orc Left Behind" },
        { id = 95454, name = "The Honor of the Kor'kron" },
        { id = 96369, name = "Bad News for Folkar" },
    }
    FDJ.QUEST_PREREQ_DETAILS[95309] = {
        level = 53, requires = 48,
        objective = "Find Commander Folkar inside Alcaz Prison.",
        pickup = "Sergeant Ulka, outside Alcaz Prison, Dustwallow Marsh (70.2, 18.8)",
        turnin = "Commander Folkar, inside Alcaz Prison",
        map = ULKA,
    }
    FDJ.QUEST_PREREQ_DETAILS[95454] = {
        level = 53, requires = 48,
        objective = "Look for King Varian Wrynn in Alcaz Prison.",
        pickup = "Commander Folkar, inside Alcaz Prison",
        turnin = "Perfumed Note, after Blazeroar, inside Alcaz Prison",
    }


    FDJ.QUEST_PREREQ_DETAILS[96369] = {
        level = 53, requires = 48,
        objective = "Tell Commander Folkar what you found.",
        pickup = "Perfumed Note, after Blazeroar, inside Alcaz Prison",
        turnin = "Commander Folkar, inside Alcaz Prison",
    }
    if FDJ.FOREVER_QUEST_XP_FALLBACK then
        FDJ.FOREVER_QUEST_XP_FALLBACK[95309] = 12100
        FDJ.FOREVER_QUEST_XP_FALLBACK[95454] = 12100
        FDJ.FOREVER_QUEST_XP_FALLBACK[96369] = 2400
    end

    local function Plain(v)
        if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
        return v
    end

    local function Saved()
        ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
        if type(ForeverDungeonJournalDB.learnedQuestIDs) ~= "table" then ForeverDungeonJournalDB.learnedQuestIDs = {} end
        return ForeverDungeonJournalDB.learnedQuestIDs
    end


    local function Use(standIn, real, quiet)
        local quest = pending[standIn]
        if not quest or type(real) ~= "number" or real <= 0 then return end
        pending[standIn] = nil
        for _, d in pairs(FDJ.DB or {}) do
            for _, q in ipairs((type(d) == "table" and d.quests) or {}) do
                if q.id == standIn then q.id = real end
            end
        end
        local maps = FDJ.QUEST_START_MAPS
        if maps and maps[standIn] ~= nil then
            if maps[real] == nil then maps[real] = maps[standIn] end
            maps[standIn] = nil
        end


        local chains = FDJ.QUEST_PREREQ_CHAINS
        if chains then
            if chains[standIn] ~= nil then
                if chains[real] == nil then chains[real] = chains[standIn] end
                chains[standIn] = nil
            end
            for _, chain in pairs(chains) do
                for _, step in ipairs(type(chain) == "table" and chain or {}) do
                    if type(step) == "table" and step.id == standIn then step.id = real end
                end
            end
        end
        for _, t in ipairs({ FDJ.QUEST_PREREQ_DETAILS, FDJ.FOREVER_QUEST_XP_FALLBACK, FDJ.QUEST_SHAREABILITY_AUDIT }) do
            if type(t) == "table" and t[standIn] ~= nil then
                if t[real] == nil then t[real] = t[standIn] end
                t[standIn] = nil
            end
        end
        Saved()[quest.learnTitle] = real
        if not quiet then
            if FDJ.RPGStateChanged then pcall(FDJ.RPGStateChanged) end
            if FDJ.ScheduleQuestRefresh then pcall(FDJ.ScheduleQuestRefresh) end
        end
    end

    local function ItemName(id)
        local name
        if C_Item and C_Item.GetItemNameByID then
            local ok, n = pcall(C_Item.GetItemNameByID, id)
            if ok then name = Plain(n) end
        end
        if not name and GetItemInfo then
            local ok, n = pcall(GetItemInfo, id)
            if ok then name = Plain(n) end
        end
        if not name and C_Item and C_Item.RequestLoadItemDataByID then pcall(C_Item.RequestLoadItemDataByID, id) end
        return type(name) == "string" and name ~= "" and name or nil
    end


    function FDJ.LearnQuestID(questID, title)
        questID = tonumber(Plain(questID))
        if not questID or questID <= 0 or not next(pending) then return end
        for _, q in pairs(FDJ.DB or {}) do
            for _, e in ipairs((type(q) == "table" and q.quests) or {}) do
                if e.id == questID then return end
            end
        end
        title = Plain(title)
        local faction = UnitFactionGroup and Plain(UnitFactionGroup("player"))
        for standIn, quest in pairs(pending) do
            if quest.faction == "Both" or quest.faction == faction then
                local hit = type(title) == "string" and title:lower() == quest.learnTitle:lower()
                if not hit and quest.learnItem and C_QuestLog and C_QuestLog.GetQuestObjectives then
                    local item = ItemName(quest.learnItem)
                    local ok, objectives = pcall(C_QuestLog.GetQuestObjectives, questID)
                    if item and ok and type(objectives) == "table" then
                        for _, o in ipairs(objectives) do
                            local text = type(o) == "table" and Plain(o.text)
                            if type(text) == "string" and text:find(item, 1, true) then hit = true break end
                        end
                    end
                end
                if hit then return Use(standIn, questID) end
            end
        end
    end



    local learn = CreateFrame("Frame")
    learn:RegisterEvent("PLAYER_LOGIN")
    learn:RegisterEvent("QUEST_ACCEPTED")
    learn:SetScript("OnEvent", function(_, event, a, b)
        if event == "PLAYER_LOGIN" then
            local saved = Saved()
            for standIn, quest in pairs(pending) do
                if type(saved[quest.learnTitle]) == "number" then Use(standIn, saved[quest.learnTitle], true) end
            end
            return
        end
        local id = tonumber(Plain(b)) or tonumber(Plain(a))
        if not id then return end
        local title
        if C_QuestLog and C_QuestLog.GetTitleForQuestID then
            local ok, t = pcall(C_QuestLog.GetTitleForQuestID, id)
            if ok then title = t end
        end
        pcall(FDJ.LearnQuestID, id, title)
    end)
end








do
    local db = FDJ.DB and FDJ.DB["Alcaz Prison"]
    local EITRIGG = { mapID = 1454, x = 0.344, y = 0.386, label = "Eitrigg — Grommash Hold, Orgrimmar", targetName = "Eitrigg" }




    local NAZEER = { mapID = 1445, x = 0.352, y = 0.307, label = "Nazeer Bloodpike — Brackenwall Village, Dustwallow Marsh", targetName = "Nazeer Bloodpike" }
    local ULKA = { mapID = 1445, x = 0.702, y = 0.188, label = "Sergeant Ulka — Alcaz Island, Dustwallow Marsh", targetName = "Sergeant Ulka" }





    local SHAW = { mapID = 1453, x = 0.783, y = 0.707, label = "Master Mathias Shaw — SI:7, Old Town, Stormwind", targetName = "Master Mathias Shaw" }
    local SULLY = { mapID = 1445, x = 0.662, y = 0.452, label = "Sully McCleary — inn, Theramore", targetName = "Sully McCleary" }
    local SULLY_OUT = { mapID = 1445, x = 0.634, y = 0.424, label = "Sully McCleary — outside Theramore, across the bridge", targetName = "Sully McCleary" }





    local AT_SULLY_OUT = "Sully McCleary, outside Theramore across the bridge, Dustwallow Marsh (63.4, 42.4)"
    local LANDALOCK = { mapID = 1416, x = 0.154, y = 0.738, label = "Archmage Lan'dalock — Violet Hold entrance, Dalaran", targetName = "Archmage Lan'dalock" }
    local MOONBROOK = { mapID = 1436, x = 0.434, y = 0.678, label = "Mason Connery's treasure — Moonbrook inn, Westfall", targetName = "Loose Floorboard" }
    local AT_ULKA = "Sergeant Ulka, outside Alcaz Prison, Alcaz Island, Dustwallow Marsh (70.2, 18.8)"
    local AT_NAZEER = "Nazeer Bloodpike, Brackenwall Village, Dustwallow Marsh"
    local AT_SULLY = "Sully McCleary, in the inn in Theramore, Dustwallow Marsh (66.2, 45.2)"
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK




    local KORKRON = {
        { id = 95283, name = "The Missing Kor'kron" },
        { id = 95284, name = "The Elite of the Elite" },
        { id = 95285, name = "Right Place, Wrong Time" },
    }
    local function With(list, extra)
        local out = {}
        for i, s in ipairs(list) do out[i] = { id = s.id, name = s.name } end
        for _, s in ipairs(extra or {}) do out[#out + 1] = { id = s.id, name = s.name } end
        return out
    end
    C[95483] = With(KORKRON, {
        { id = 95309, name = "No Orc Left Behind" },
        { id = 95454, name = "The Honor of the Kor'kron" },
        { id = 96369, name = "Bad News for Folkar" },
    })
    C[96332] = With(KORKRON)
    C[96334] = With(KORKRON)
    D[95283] = {
        level = 53, requires = 48,
        objective = "Speak with Nazeer Bloodpike in Brackenwall Village.",
        pickup = "Eitrigg, Grommash Hold (Thrall's room), Orgrimmar", turnin = AT_NAZEER,
        map = EITRIGG, turninMap = NAZEER,
    }
    D[95284] = {
        level = 53, requires = 48,
        objective = "Find the missing Kor'kron Elites.",
        pickup = AT_NAZEER, turnin = AT_ULKA, map = NAZEER, turninMap = ULKA,
        note = "Nazeer offers it even before you hand in The Missing Kor'kron.",
    }
    D[95285] = {
        level = 53, requires = 48,
        objective = "Speak with Sergeant Ulka to learn more about the situation on Alcaz Isle.",
        pickup = AT_ULKA, turnin = AT_ULKA, map = ULKA, turninMap = ULKA,
        note = "Sergeant Ulka then offers No Orc Left Behind, A Little Payback and Blood Red Bandanas.",
    }
    if D[95309] then D[95309].turninMap = nil end
    XP[95283] = 1300; XP[95284] = 1300; XP[95285] = 1300



    local SI7 = {
        { id = 95194, name = "Our Man in Theramore" },
        { id = 95196, name = "Watch Yer Back" },
        { id = 95198, name = "The Return of the King?" },
    }
    D[95194] = {
        level = 53, requires = 48,
        objective = "Seek out the SI:7 agent stationed on Theramore Isle.",
        pickup = "Master Mathias Shaw, SI:7, Old Town, Stormwind City (78.3, 70.7)", turnin = AT_SULLY,
        map = SHAW, turninMap = SULLY,
    }
    D[95196] = {
        level = 53, requires = 48,
        objective = "Meet Sully McCleary in Dustwallow Marsh and learn more about your mission.",
        pickup = AT_SULLY, turnin = "Sully McCleary, outside Theramore across the bridge, Dustwallow Marsh (63.4, 42.4)",
        map = SULLY, turninMap = SULLY_OUT,
    }
    D[95198] = {
        level = 53, requires = 48,
        objective = "Use the SI:7 Disguise Kit to eavesdrop on Jaina and her inner circle at the Theramore Mage Tower.",
        pickup = AT_SULLY_OUT, turnin = AT_SULLY_OUT,
        map = SULLY_OUT, turninMap = SULLY_OUT,
        providedItem = {269000, "SI:7 Disguise Kit", 1, "Given when you accept the quest"},
        note = "Up the tower, talk to the guard next to Archmage Tervosh (he looks like you in the disguise) and relieve him; don't get close to Jaina or she dispels it. You stay stuck a while after it completes: use Exit Vehicle.",
    }
    D[95262] = {
        level = 53, requires = 48,
        objective = "Enter Alcaz Prison and learn what became of the King of Stormwind.",
        pickup = AT_SULLY_OUT, turnin = "Inside Alcaz Prison (who takes it is not known yet)",
        map = SULLY_OUT,
    }
    XP[95194] = 1300; XP[95196] = 1300; XP[95198] = 1300; XP[95262] = 14400




    D[96335] = {
        level = 53, requires = 48, startsInDungeon = true,
        objective = "Recover the Alcaz Shackle Key from The Questioner in Alcaz Prison.",
        pickup = "Mason Connery, the man in iron chains, inside Alcaz Prison",
        turnin = "Mason Connery, inside Alcaz Prison",
        requiredItems = { {274029, "Ornate Shackle Key", 1, "From The Questioner in Alcaz Prison"} },
    }
    XP[96335] = 2850

    local ADD = {
        {
            id = 95263, name = "Somber News", level = 53, requires = 48, faction = "Alliance",
            pickup = "Inside Alcaz Prison, once you learn what became of King Varian Wrynn",
            objective = "Return to Sully McCleary in Dustwallow Marsh.",
            turnin = AT_SULLY_OUT, turninMap = SULLY_OUT,
            liveXPFallback = 2850,
            rewardSummary = "Stormwind +75",
            rewards = "2,850 XP • Stormwind +75",
            chain = { SI7[1], SI7[2], SI7[3], { id = 95262, name = "The Secret Prison" } },
        },
        {
            id = 96381, name = "A Bit of Wet Work", level = 53, requires = 48, faction = "Alliance",
            pickup = AT_SULLY_OUT, startMap = SULLY_OUT,
            objective = "Enter the Alcaz Prison and slay 15 Strashaz Soldiers, 8 Strashaz Enchantresses, and bring the head of Tidemistress Ca'zass to Sully McCleary.",
            turnin = AT_SULLY_OUT, turninMap = SULLY_OUT,
            liveXPFallback = 11550,
            rewardSummary = "Stormwind +100  •  Ironforge +100",
            rewards = "Choose: Theramore Defender's Gauntlets, Marshdweller's Pants or Naga Scale Spaulders\n11,550 XP • Stormwind +100 • Ironforge +100",
            rewardChoice = true,
            rewardItems = { { 279825, "Theramore Defender's Gauntlets", 2 }, { 279826, "Marshdweller's Pants", 2 }, { 279829, "Naga Scale Spaulders", 2 } },
            requiredItem = { 273883, "Ca'zass's Head", 1, 1, "From Tidemistress Ca'zass in Alcaz Prison" },
            chain = SI7,
        },
        {
            id = 96337, name = "More Valuable Than Gold", level = 53, requires = 48, faction = "Both",
            warning = "Don't kill The Questioner before the last boss, or you can't get this quest.",
            pickup = "Mason Connery, inside Alcaz Prison, once you free him",
            objective = "Use the note provided by Mason Connery to find his hidden treasure.",
            turnin = "Mason Connery's treasure: a loose floorboard upstairs in the middle room of the Moonbrook inn, Westfall (43.4, 67.8)",
            turninMap = MOONBROOK,
            providedItem = {274077, "Mason's Note", 1, "Given by Mason Connery when you accept the quest"},
            liveXPFallback = 11550,
            rewardSummary = "",
            rewards = "Document Box\n11,550 XP",
            rewardItems = { { 274041, "Document Box", 1 } },




            note = "The Document Box sells for 25g, OR it starts State Secrets:",
            noteQuestLinkSide = { Alliance = { id = 96377, name = "State Secrets" }, Horde = { id = 96376, name = "State Secrets" } },
            chain = { { id = 96335, name = "The Man in the Iron Chains" } },
        },
    }
    if db then
        db.quests = db.quests or {}
        for _, q in ipairs(ADD) do
            local have = false
            for _, e in ipairs(db.quests) do if e.id == q.id then have = true end end
            if not have then
                local chain = q.chain
                q.chain = nil
                C[q.id] = With(chain)
                XP[q.id] = q.liveXPFallback
                table.insert(db.quests, q)
            end
        end
        for _, q in ipairs(db.quests) do
            if q.id == 96772 then q.startMap = LANDALOCK; q.turninMap = LANDALOCK end
            if q.id == 96334 or q.id == 96332 then q.startMap = ULKA end
            if q.id == 96332 then q.turninMap = ULKA end
            if q.id == 96334 then
                q.rewardSummary = "Orgrimmar +75"
                q.rewards = "Choose: Bloodsplattered Bandana or Makeshift Belt\n9,700 XP • Orgrimmar +75"
            end
        end
    end
    FDJ.QUEST_START_MAPS[96772] = LANDALOCK
    FDJ.QUEST_START_MAPS[96332] = ULKA
    FDJ.QUEST_START_MAPS[96334] = ULKA
    FDJ.QUEST_START_MAPS[96381] = SULLY_OUT
end
















do
    local D = FDJ.QUEST_PREREQ_DETAILS
    local ap = FDJ.DB and FDJ.DB["Alcaz Prison"]



    if D and D[95198] and D[95198].objectiveMap == nil then







        D[95198].objectiveMap = { mapID = 1445, x = 0.664, y = 0.493, label = "Jaina's guard \226\128\148 Theramore Mage Tower",
            markerType = "location", upstairs = true, clickItem = { 269000, "SI:7 Disguise Kit" }, hintKey = "ROUTE_DISGUISE_NEAR",
            goalAt = 75, goalIndoors = true, useAtGoal = true }
    end
    local SHAW = { mapID = 1453, x = 0.783, y = 0.707, label = "Master Mathias Shaw \226\128\148 SI:7, Old Town, Stormwind", targetName = "Master Mathias Shaw" }





    FDJ.READY_ON_PICKUP = FDJ.READY_ON_PICKUP or {}
    FDJ.READY_ON_PICKUP[96337] = true
    local TRUNK = { mapID = 1436, x = 0.434, y = 0.678, label = "Mason Connery's treasure \226\128\148 Moonbrook inn, Westfall",
        markerType = "location", upstairs = true, hintKey = "ROUTE_CONNERY_TRUNK" }
    for _, quest in ipairs((ap and ap.quests) or {}) do
        if quest.id == 96337 then
            quest.turninMap = TRUNK
        end


        if quest.id == 95263 and quest.routeFollow == nil then
            quest.routeFollow = { Alliance = { id = 95264, name = "Shaw Needs To Know", turnin = SHAW } }
        end
    end







    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local SWIM = "Swim across to Alcaz Island"
    FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1445", 0.753, 0.141)] = {
        direct = { mapID = 1445, x0 = 0.700, y0 = 0.100, x1 = 0.810, y1 = 0.262 },
        { mapID = 1445, x = 0.703, y = 0.189, label = SWIM, labelNear = 1000 },
    }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, list in pairs({
        deDE = { "Schwimmt hinüber zur Insel Alcaz", "Jainas Wache \226\128\148 Magierturm von Theramore", "Meister Mathias Shaw \226\128\148 SI:7, Altstadt, Sturmwind", "Mason Connerys Schatz \226\128\148 Gasthaus von Mondbruch, Westfall" },
        frFR = { "Nagez jusqu'à l'île d'Alcaz", "Garde de Jaina \226\128\148 Tour des mages de Theramore", "Maître Mathias Shaw \226\128\148 SI:7, Vieille ville, Hurlevent", "Trésor de Mason Connery \226\128\148 auberge de Ruisselune, Marche de l'Ouest" },
        esES = { "Nada hasta la isla de Alcaz", "Guardia de Jaina \226\128\148 Torre de los Magos de Theramore", "Maestro Mathias Shaw \226\128\148 IV:7, Casco Antiguo, Ventormenta", "Tesoro de Mason Connery \226\128\148 posada de Arroyo de la Luna, Páramos de Poniente" },
        itIT = { "Nuota fino all'isola di Alcaz", "Guardia di Jaina \226\128\148 Torre dei Maghi di Theramore", "Master Mathias Shaw \226\128\148 SI:7, Old Town, Stormwind", "Tesoro di Mason Connery \226\128\148 locanda di Moonbrook, Westfall" },
        ptBR = { "Nade até a Ilha Alcaz", "Guarda de Jaina \226\128\148 Torre dos Magos de Theramore", "Mestre Mathias Shaw \226\128\148 AVIN, Cidade Velha, Ventobravo", "Tesouro de Mason Connery \226\128\148 estalagem de Arroio da Lua, Cerro Oeste" },
        ruRU = { "Плывите к острову Алькац", "Стражник Джайны \226\128\148 башня магов Терамора", "Мастер Матиас Шоу \226\128\148 ШРУ, Старый город, Штормград", "Сокровище Мейсона Коннери \226\128\148 таверна Луноречья, Западный Край" },
        koKR = { "알카즈 섬까지 헤엄쳐 가세요", "제이나의 경비병 \226\128\148 테라모어 마법사의 탑", "Master Mathias Shaw \226\128\148 SI:7, 구시가지, 스톰윈드", "Mason Connery의 보물 \226\128\148 달빛시내 마을 여관, 서부 몰락지대" },
        zhCN = { "游到奥卡兹岛", "吉安娜的卫兵 \226\128\148 塞拉摩法师塔", "Master Mathias Shaw \226\128\148 军情七处，旧城区，暴风城", "Mason Connery的宝藏 \226\128\148 月溪镇旅店，西部荒野" },
        zhTW = { "游到奧卡茲島", "吉安娜的衛兵 \226\128\148 塞拉摩法師塔", "Master Mathias Shaw \226\128\148 軍情七處，舊城區，暴風城", "Mason Connery的寶藏 \226\128\148 月溪鎮旅店，西部荒野" },
    }) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.places = content.places or {}
        for i, english in ipairs({ SWIM, "Jaina's guard \226\128\148 Theramore Mage Tower", SHAW.label, TRUNK.label }) do
            if content.places[english] == nil then content.places[english] = list[i] end
        end
    end

    local lines = {
        enUS = { "Use the SI:7 Disguise Kit (click its icon), then relieve the guard next to Archmage Tervosh. Keep away from Jaina.",
            "Upstairs, in the middle room: click Connery's Trunk" },
        deDE = { "Benutzt das Verkleidungsset (klickt sein Symbol) und löst dann die Wache neben Erzmagier Tervosh ab. Haltet Abstand zu Jaina.",
            "Oben im mittleren Zimmer: klickt auf die Truhe" },
        frFR = { "Utilisez le kit de déguisement (cliquez sur son icône), puis relevez le garde à côté de l'archimage Tervosh. Restez loin de Jaina.",
            "À l'étage, dans la pièce du milieu : cliquez sur la malle" },
        esES = { "Usa el kit de disfraz (haz clic en su icono) y luego releva al guardia junto al archimago Tervosh. Mantente lejos de Jaina.",
            "Arriba, en la habitación del medio: haz clic en el baúl" },
        itIT = { "Usa il kit di travestimento (clicca la sua icona), poi dai il cambio alla guardia accanto all'Arcimago Tervosh. Stai lontano da Jaina.",
            "Al piano di sopra, nella stanza centrale: clicca il baule" },
        ptBR = { "Use o kit de disfarce (clique no ícone) e depois renda o guarda ao lado do arquimago Tervosh. Fique longe de Jaina.",
            "No andar de cima, no quarto do meio: clique no baú" },
        ruRU = { "Используйте набор для маскировки (щелкните по значку), затем смените стражника рядом с верховным магом Тервошем. Держитесь подальше от Джайны.",
            "Наверху, в средней комнате: щелкните по сундуку" },
        koKR = { "변장 도구를 사용한 뒤(아이콘 클릭) 대마법사 테르보쉬 옆의 경비병과 교대하세요. 제이나에게 가까이 가지 마세요.",
            "위층 가운데 방에서 상자를 클릭하세요" },
        zhCN = { "使用伪装工具（点击图标），然后去接替大法师特沃什身边的卫兵。别靠近吉安娜。",
            "楼上中间的房间：点击箱子" },
        zhTW = { "使用偽裝工具（點擊圖示），然後去接替大法師特沃什身邊的衛兵。別靠近吉安娜。",
            "樓上中間的房間：點擊箱子" },
    }
    lines.esMX = lines.esES
    for locale, pair in pairs(lines) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            if t.ROUTE_DISGUISE_NEAR == nil then t.ROUTE_DISGUISE_NEAR = pair[1] end
            if t.ROUTE_CONNERY_TRUNK == nil then t.ROUTE_CONNERY_TRUNK = pair[2] end
        end
    end
end





FDJ.FOREVER_QUEST_XP_FALLBACK[8258] = 19900
FDJ.FOREVER_QUEST_XP_FALLBACK[97169] = 19900









do
    local C, D = FDJ.QUEST_PREREQ_CHAINS, FDJ.QUEST_PREREQ_DETAILS
    local MORZUL = { mapID = 1428, x = 0.126, y = 0.314, label = "Mor'zul Bloodbringer \226\128\148 Burning Steppes", targetName = "Mor'zul Bloodbringer" }
    local chain = C and C[7629]
    if chain and not (chain[1] and chain[1].id == 7562) then
        table.insert(chain, 1, { id = 7562, name = "Mor'zul Bloodbringer" })
    end
    if D and D[7562] == nil then
        D[7562] = {
            level = 58, requires = 60,
            objective = "Speak with Mor'zul Bloodbringer in the Burning Steppes.",
            pickup = "Your demon trainer in a capital city: Spackle Thornberry (Stormwind), Jubahl Corpseseeker (Ironforge), Martha Strain (Undercity) or Kurgul (Orgrimmar)",
            pickupAlliance = "Your demon trainer in a capital city: Spackle Thornberry (Stormwind) or Jubahl Corpseseeker (Ironforge)",
            pickupHorde = "Your demon trainer in a capital city: Martha Strain (Undercity) or Kurgul (Orgrimmar)",
            turnin = "Mor'zul Bloodbringer, Burning Steppes",
            turninMap = MORZUL,
        }
    end
    if FDJ.QUEST_SHAREABILITY_AUDIT and FDJ.QUEST_SHAREABILITY_AUDIT[7562] == nil then FDJ.QUEST_SHAREABILITY_AUDIT[7562] = false end


    local T = {
        deDE = { "Mor'zul Bloodbringer", "Sprecht mit Mor'zul Bloodbringer in der Brennenden Steppe.",
            "Euer Dämonenausbilder in einer Hauptstadt: Spackle Thornberry (Sturmwind), Jubahl Corpseseeker (Eisenschmiede), Martha Strain (Unterstadt) oder Kurgul (Orgrimmar)",
            "Euer Dämonenausbilder in einer Hauptstadt: Spackle Thornberry (Sturmwind) oder Jubahl Corpseseeker (Eisenschmiede)",
            "Euer Dämonenausbilder in einer Hauptstadt: Martha Strain (Unterstadt) oder Kurgul (Orgrimmar)",
            "Mor'zul Bloodbringer, Brennende Steppe" },
        frFR = { "Mor'zul Bloodbringer", "Parlez à Mor'zul Bloodbringer dans les Steppes ardentes.",
            "Votre maître des démons dans une capitale : Spackle Thornberry (Hurlevent), Jubahl Corpseseeker (Forgefer), Martha Strain (Fossoyeuse) ou Kurgul (Orgrimmar)",
            "Votre maître des démons dans une capitale : Spackle Thornberry (Hurlevent) ou Jubahl Corpseseeker (Forgefer)",
            "Votre maître des démons dans une capitale : Martha Strain (Fossoyeuse) ou Kurgul (Orgrimmar)",
            "Mor'zul Bloodbringer, Steppes ardentes" },
        esES = { "Mor'zul Sangredoble", "Habla con Mor'zul Sangredoble en Las Estepas Ardientes.",
            "Tu instructor de demonios en una capital: Spackle Thornberry (Ventormenta), Jubahl Corpseseeker (Forjaz), Martha Strain (Entrañas) o Kurgul (Orgrimmar)",
            "Tu instructor de demonios en una capital: Spackle Thornberry (Ventormenta) o Jubahl Corpseseeker (Forjaz)",
            "Tu instructor de demonios en una capital: Martha Strain (Entrañas) o Kurgul (Orgrimmar)",
            "Mor'zul Sangredoble, Las Estepas Ardientes" },
        itIT = { "Mor'zul Bloodbringer", "Parla con Mor'zul Bloodbringer nelle Steppe Ardenti.",
            "Il tuo istruttore dei demoni in una capitale: Spackle Thornberry (Roccavento), Jubahl Corpseseeker (Forgiardente), Martha Strain (Sepulcra) o Kurgul (Orgrimmar)",
            "Il tuo istruttore dei demoni in una capitale: Spackle Thornberry (Roccavento) o Jubahl Corpseseeker (Forgiardente)",
            "Il tuo istruttore dei demoni in una capitale: Martha Strain (Sepulcra) o Kurgul (Orgrimmar)",
            "Mor'zul Bloodbringer, Steppe Ardenti" },
        ptBR = { "Mor'zul Trazangre", "Fale com Mor'zul Trazangre nas Estepes Ardentes.",
            "Seu instrutor de demônios em uma capital: Spackle Thornberry (Ventobravo), Jubahl Corpseseeker (Altaforja), Martha Strain (Cidade Baixa) ou Kurgul (Orgrimmar)",
            "Seu instrutor de demônios em uma capital: Spackle Thornberry (Ventobravo) ou Jubahl Corpseseeker (Altaforja)",
            "Seu instrutor de demônios em uma capital: Martha Strain (Cidade Baixa) ou Kurgul (Orgrimmar)",
            "Mor'zul Trazangre, Estepes Ardentes" },
        ruRU = { "Мор'зул Кровопуск", "Поговорите с Мор'зулом Кровопуском в Пылающих степях.",
            "Ваш учитель демонов в столице: Spackle Thornberry (Штормград), Jubahl Corpseseeker (Стальгорн), Martha Strain (Подгород) или Kurgul (Оргриммар)",
            "Ваш учитель демонов в столице: Spackle Thornberry (Штормград) или Jubahl Corpseseeker (Стальгорн)",
            "Ваш учитель демонов в столице: Martha Strain (Подгород) или Kurgul (Оргриммар)",
            "Мор'зул Кровопуск, Пылающие степи" },
        koKR = { "모르줄 블러드브링어", "불타는 평원에 있는 모르줄 블러드브링어와 대화하십시오.",
            "수도의 악마 훈련사: Spackle Thornberry (스톰윈드), Jubahl Corpseseeker (아이언포지), Martha Strain (언더시티) 또는 Kurgul (오그리마)",
            "수도의 악마 훈련사: Spackle Thornberry (스톰윈드) 또는 Jubahl Corpseseeker (아이언포지)",
            "수도의 악마 훈련사: Martha Strain (언더시티) 또는 Kurgul (오그리마)",
            "모르줄 블러드브링어, 불타는 평원" },
        zhCN = { "莫苏尔·召血者", "与燃烧平原的莫苏尔·召血者谈话。",
            "主城里的恶魔训练师：Spackle Thornberry（暴风城）、Jubahl Corpseseeker（铁炉堡）、Martha Strain（幽暗城）或Kurgul（奥格瑞玛）",
            "主城里的恶魔训练师：Spackle Thornberry（暴风城）或Jubahl Corpseseeker（铁炉堡）",
            "主城里的恶魔训练师：Martha Strain（幽暗城）或Kurgul（奥格瑞玛）",
            "莫苏尔·召血者，燃烧平原" },
        zhTW = { "莫蘇爾·召血者", "與燃燒平原的莫蘇爾·召血者談話。",
            "主城裡的惡魔訓練師：Spackle Thornberry（暴風城）、Jubahl Corpseseeker（鐵爐堡）、Martha Strain（幽暗城）或Kurgul（奧格瑪）",
            "主城裡的惡魔訓練師：Spackle Thornberry（暴風城）或Jubahl Corpseseeker（鐵爐堡）",
            "主城裡的惡魔訓練師：Martha Strain（幽暗城）或Kurgul（奧格瑪）",
            "莫蘇爾·召血者，燃燒平原" },
    }
    T.esMX = T.esES
    local STEPPES = { deDE = "Brennende Steppe", frFR = "Steppes ardentes", esES = "Las Estepas Ardientes", esMX = "Las Estepas Ardientes",
        itIT = "Steppe Ardenti", ptBR = "Estepes Ardentes", ruRU = "Пылающие степи", koKR = "불타는 평원", zhCN = "燃烧平原", zhTW = "燃燒平原" }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, t in pairs(T) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.quests = content.quests or {}
        local q = content.quests[7562] or {}
        content.quests[7562] = q
        q.name, q.objective, q.pickup, q.pickupAlliance, q.pickupHorde, q.turnin = t[1], t[2], t[3], t[4], t[5], t[6]
        content.places = content.places or {}
        if content.places[MORZUL.label] == nil then content.places[MORZUL.label] = t[1] .. " \226\128\148 " .. STEPPES[lang] end
    end
end


















do
    local ap = FDJ.DB and FDJ.DB["Alcaz Prison"]
    local XP = FDJ.FOREVER_QUEST_XP_FALLBACK
    local RENZIK = { mapID = 1453, x = 0.783, y = 0.711, label = 'Renzik "The Shiv" \226\128\148 SI:7, Old Town, Stormwind',
        targetName = 'Renzik "The Shiv"', upstairs = true }
    local NAZGREL = { mapID = 1454, x = 0.323, y = 0.358, label = "Nazgrel \226\128\148 Grommash Hold, Orgrimmar", targetName = "Nazgrel" }
    local AT_RENZIK = 'Renzik "The Shiv", upstairs in SI:7, Old Town, Stormwind (78.3, 71.1)'
    local AT_NAZGREL = "Nazgrel, Grommash Hold, Orgrimmar (32.3, 35.8)"
    local BOX_FROM = "The reward of More Valuable Than Gold"
    local function Page(id, side, at, spot, who, rep)
        return { id = id, name = "State Secrets", level = 53, requires = 48, faction = side, hideFromMainList = true,
            pickup = at, startMap = spot, turnin = at, turninMap = spot,
            objective = "Show the Document Box to " .. who .. ".",
            requiredItem = { 274041, "Document Box", 1, 1, BOX_FROM },
            liveXPFallback = 6550,
            rewardSummary = "1g 60s" .. (rep and ("  \226\128\162  " .. rep) or ""),
            rewards = "Fractured Insignia\n6,550 XP \226\128\162 1g 60s" .. (rep and (" \226\128\162 " .. rep) or ""),
            rewardItems = { { 279450, "Fractured Insignia", 1 } } }
    end
    if ap then
        ap.quests = ap.quests or {}
        for _, q in ipairs({ Page(96377, "Alliance", AT_RENZIK, RENZIK, 'Renzik "The Shiv"'),
            Page(96376, "Horde", AT_NAZGREL, NAZGREL, "Nazgrel", "Orgrimmar +150") }) do
            local have = false
            for _, e in ipairs(ap.quests) do if e.id == q.id then have = true end end
            if not have then
                table.insert(ap.quests, q)
                if XP and XP[q.id] == nil then XP[q.id] = q.liveXPFallback end
            end
        end
    end
    FDJ.QUEST_START_MAPS = FDJ.QUEST_START_MAPS or {}
    if FDJ.QUEST_START_MAPS[96377] == nil then FDJ.QUEST_START_MAPS[96377] = RENZIK end
    if FDJ.QUEST_START_MAPS[96376] == nil then FDJ.QUEST_START_MAPS[96376] = NAZGREL end


    local T = {
        deDE = { "Die Dokumentenkiste bringt beim Händler 25g, ODER sie startet State Secrets:",
            'Renzik "The Shiv", oben im SI:7, Altstadt, Sturmwind (78.3, 71.1)', 'Zeigt Renzik "The Shiv" die Dokumentenkiste.',
            "Nazgrel, Feste Grommash, Orgrimmar (32.3, 35.8)", "Zeigt Nazgrel die Dokumentenkiste.",
            'Renzik "The Shiv" \226\128\148 SI:7, Altstadt, Sturmwind', "Nazgrel \226\128\148 Feste Grommash, Orgrimmar", "Die Belohnung von More Valuable Than Gold" },
        frFR = { "La boîte de documents se vend 25 po, OU elle lance State Secrets :",
            'Renzik "The Shiv", à l\'étage du SI:7, Vieille ville, Hurlevent (78.3, 71.1)', 'Montrez la boîte de documents à Renzik "The Shiv".',
            "Nazgrel, fort Grommash, Orgrimmar (32.3, 35.8)", "Montrez la boîte de documents à Nazgrel.",
            'Renzik "The Shiv" \226\128\148 SI:7, Vieille ville, Hurlevent', "Nazgrel \226\128\148 fort Grommash, Orgrimmar", "La récompense de More Valuable Than Gold" },
        esES = { "La caja de documentos se vende por 25 de oro, O empieza State Secrets:",
            'Renzik "The Shiv", en el piso de arriba del IV:7, Casco Antiguo, Ventormenta (78.3, 71.1)', 'Enseña la caja de documentos a Renzik "The Shiv".',
            "Nazgrel, Bastión Grommash, Orgrimmar (32.3, 35.8)", "Enseña la caja de documentos a Nazgrel.",
            'Renzik "The Shiv" \226\128\148 IV:7, Casco Antiguo, Ventormenta', "Nazgrel \226\128\148 Bastión Grommash, Orgrimmar", "La recompensa de More Valuable Than Gold" },
        itIT = { "La Document Box si vende a 25 mo, O avvia State Secrets:",
            'Renzik "The Shiv", al piano di sopra dello SI:7, Old Town, Stormwind (78.3, 71.1)', 'Mostra la Document Box a Renzik "The Shiv".',
            "Nazgrel, Grommash Hold, Orgrimmar (32.3, 35.8)", "Mostra la Document Box a Nazgrel.",
            'Renzik "The Shiv" \226\128\148 SI:7, Old Town, Stormwind', "Nazgrel \226\128\148 Grommash Hold, Orgrimmar", "La ricompensa di More Valuable Than Gold" },
        ptBR = { "A Caixa de Documentos vende por 25 po, OU inicia State Secrets:",
            'Renzik "The Shiv", no andar de cima do SI:7, Cidade Velha, Ventobravo (78.3, 71.1)', 'Mostre a Caixa de Documentos a Renzik "The Shiv".',
            "Nazgrel, Fortaleza Grommash, Orgrimmar (32.3, 35.8)", "Mostre a Caixa de Documentos a Nazgrel.",
            'Renzik "The Shiv" \226\128\148 SI:7, Cidade Velha, Ventobravo', "Nazgrel \226\128\148 Fortaleza Grommash, Orgrimmar", "A recompensa de More Valuable Than Gold" },
        ruRU = { "Ящик с документами продается за 25 з., ИЛИ с него начинается State Secrets:",
            'Renzik "The Shiv", наверху в штабе ШРУ, Старый город, Штормград (78.3, 71.1)', 'Покажите ящик с документами Renzik "The Shiv".',
            "Nazgrel, Крепость Громмаша, Оргриммар (32.3, 35.8)", "Покажите ящик с документами Nazgrel.",
            'Renzik "The Shiv" \226\128\148 ШРУ, Старый город, Штормград', "Nazgrel \226\128\148 Крепость Громмаша, Оргриммар", "Награда за More Valuable Than Gold" },
        koKR = { "문서 상자는 25골드에 팔 수 있고, 또는 State Secrets를 시작합니다:",
            'Renzik "The Shiv", SI:7 위층, 구 시가지, 스톰윈드 (78.3, 71.1)', 'Renzik "The Shiv"에게 문서 상자를 보여주세요.',
            "Nazgrel, 그롬마쉬 요새, 오그리마 (32.3, 35.8)", "Nazgrel에게 문서 상자를 보여주세요.",
            'Renzik "The Shiv" \226\128\148 SI:7, 구 시가지, 스톰윈드', "Nazgrel \226\128\148 그롬마쉬 요새, 오그리마", "More Valuable Than Gold의 보상" },
        zhCN = { "文件箱可卖25金，或者用来开始State Secrets：",
            'Renzik "The Shiv"，军情七处楼上，旧城区，暴风城 (78.3, 71.1)', '把文件箱给Renzik "The Shiv"看。',
            "Nazgrel，格罗玛什要塞，奥格瑞玛 (32.3, 35.8)", "把文件箱给Nazgrel看。",
            'Renzik "The Shiv" \226\128\148 军情七处，旧城区，暴风城', "Nazgrel \226\128\148 格罗玛什要塞，奥格瑞玛", "More Valuable Than Gold的奖励" },
        zhTW = { "文件箱可賣25金，或者用來開始State Secrets：",
            'Renzik "The Shiv"，軍情七處樓上，舊城區，暴風城 (78.3, 71.1)', '把文件箱給Renzik "The Shiv"看。',
            "Nazgrel，格羅瑪許堡，奧格瑪 (32.3, 35.8)", "把文件箱給Nazgrel看。",
            'Renzik "The Shiv" \226\128\148 軍情七處，舊城區，暴風城', "Nazgrel \226\128\148 格羅瑪許堡，奧格瑪", "More Valuable Than Gold的獎勵" },
    }
    T.esMX = T.esES
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, t in pairs(T) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.quests = content.quests or {}
        local gold = content.quests[96337] or {}
        content.quests[96337] = gold
        gold.note = t[1]
        for id, texts in pairs({ [96377] = { t[2], t[3] }, [96376] = { t[4], t[5] } }) do
            local q = content.quests[id] or {}
            content.quests[id] = q
            if q.pickup == nil then q.pickup = texts[1] end
            if q.turnin == nil then q.turnin = texts[1] end
            if q.objective == nil then q.objective = texts[2] end
        end
        content.places = content.places or {}
        if content.places[RENZIK.label] == nil then content.places[RENZIK.label] = t[6] end
        if content.places[NAZGREL.label] == nil then content.places[NAZGREL.label] = t[7] end
        if content.places[BOX_FROM] == nil then content.places[BOX_FROM] = t[8] end
    end
end








do
    local db = FDJ.DB and FDJ.DB["Maraudon"]
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local M = 2652
    local PYLON = { mapID = M, x = 0.436, y = 0.342, label = "Shen'dralar Pylon — Shen'dralas", targetName = "Shen'dralar Pylon" }
    local MORDENT = { mapID = M, x = 0.350, y = 0.464, label = "Mordent Evenshade — Evenshade's Overlook, Shen'dralas", targetName = "Mordent Evenshade" }
    local KIRANDIS = { mapID = M, x = 0.472, y = 0.758, label = "Magister Kirandis — temple of Shen'dralas", targetName = "Magister Kirandis" }
    local MITHERA = { mapID = M, x = 0.528, y = 0.760, label = "Mithera — by the Forlorn Gardens, Shen'dralas", targetName = "Mithera" }

    local WOODWYRD = { mapID = M, x = 0.699, y = 0.721, label = "Woodwyrd — Forlorn Gardens, Shen'dralas", targetName = "Woodwyrd" }
    local AT_MORDENT = "Mordent Evenshade, Evenshade's Overlook, Shen'dralas (35.0, 46.4)"
    local AT_WOODWYRD = "Woodwyrd, Forlorn Gardens, Shen'dralas (69.9, 72.1)"

    C[93404] = {
        { id = 92914, name = "Strange Pylons" },
        { id = 96010, name = "Fragments of the Pylons" },
        { id = 96018, name = "Powering the Pylons" },
        { id = 93016, name = "A Brief History Lesson" },
        { id = 93394, name = "Meeting the Magister" },
        { id = 93341, name = "Forlorn Gardens" },
        { id = 93594, name = "Word of the Woods" },
    }
    D[92914] = {
        level = 43, requires = 35,
        objective = "Explore Shen'dralas in an effort to find other pylons like the one you found.",
        pickup = "Shen'dralar Pylon, Shen'dralas (43.6, 34.2)",
        startObject = { "Shen'dralar Pylon", "Interface\\Icons\\INV_Enchant_ShardBrilliantLarge", "A cracked crystal on an old pedestal, guarded by mana elementals, Shen'dralas (43.6, 34.2)" },
        turnin = AT_MORDENT, map = PYLON, turninMap = MORDENT,
        note = "The other pylons: east at 73, 23 (more arcane elementals, you get dismounted there) and south at 47, 78 inside the big Shen'dralas building.",
    }


    D[92914].objectiveSpots = {
        [1] = { mapID = M, x = 0.435, y = 0.342, label = "Western pylon — Shen'dralas" },
        [2] = { mapID = M, x = 0.730, y = 0.233, label = "Eastern pylon — Shen'dralas (arcane elementals, you get dismounted there)" },
        [3] = { mapID = M, x = 0.470, y = 0.780, label = "Temple pylon — inside the big Shen'dralas building", hint = "Inside the big building" },
    }
    D[96010] = {
        level = 41, requires = 35,
        objective = "Recover shards and fragments of the pylons, found guarded at the Magram and Gelkis villages. Return them to Mordent Evenshade.",
        pickup = AT_MORDENT, turnin = AT_MORDENT, map = MORDENT, turninMap = MORDENT,
        requiredItems = {

            {255656, "Pylon Fragment", 1, "From the Pylon Shard crystal at the Magram village, Desolace (68.1, 79.1)", map = { mapID = 1443, x = 0.681, y = 0.791, label = "Pylon Fragment — the crystal at the Magram village, Desolace", pickUp = true }},
            {255657, "Pylon Shard", 1, "From the Pylon Shard crystal at the Gelkis village, Desolace (36.1, 85.6)", map = { mapID = 1443, x = 0.361, y = 0.856, label = "Pylon Shard — the crystal at the Gelkis village, Desolace", pickUp = true }},
        },
        note = "One crystal at each centaur camp in Desolace.",
    }
    D[96018] = {
        level = 43, requires = 35,
        objective = "Acquire the Mana Sieve from within the temple in Shen'dralas and use it to collect Ancient Mana Crystals, then empower the pylons and return to Mordent Evenshade.",
        pickup = AT_MORDENT, turnin = AT_MORDENT, map = MORDENT, turninMap = MORDENT,
        note = "The Mana Sieve is on the top floor of the big temple. Take 8 mana from the arcane orbs around Shen'dralas, then use the pylon parts with 4 mana on each pylon.",

        requiredItems = { {255662, "Mana Sieve", 1, "On the top floor of the big temple in Shen'dralas (46.0, 78.1)", map = { mapID = M, x = 0.460, y = 0.781, label = "Mana Sieve — top floor of the big temple, Shen'dralas", pickUp = true, upstairs = true }} },
        objectiveSpots = {

            ["Western pylon"] = { mapID = M, x = 0.435, y = 0.342, label = "Western pylon — Shen'dralas", markerType = "location", clickItem = { 271882, "Pile of Pylon Parts" }, hint = "Collect 8 Coalesced Mana Crystals from the Unstable Mana Rifts, then use the Pile of Pylon Parts" },
            ["Eastern pylon"] = { mapID = M, x = 0.730, y = 0.233, label = "Eastern pylon — Shen'dralas", markerType = "location", clickItem = { 271882, "Pile of Pylon Parts" }, hint = "Collect 8 Coalesced Mana Crystals from the Unstable Mana Rifts, then use the Pile of Pylon Parts" },
        },
    }









    do
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        local function P(x, y, label) return { mapID = M, x = x, y = y, label = label } end
        local STAIRS = {
            P(0.463, 0.609, "The foot of the long stairway north of the temple"),
            P(0.465, 0.645, "Up the stairway, south to the temple"),
            P(0.466, 0.709, "Up the stairway, south to the temple"),
            P(0.471, 0.733, "Into the temple's top floor (its north door)"),
        }
        local function Join(head, tail)
            local list = {}
            for _, point in ipairs(head) do list[#list + 1] = point end
            for _, point in ipairs(tail) do list[#list + 1] = point end
            return list
        end
        local routes = {
            STAIRS,
            Join({
                P(0.387, 0.712, "North-west, round the cliffs below the temple"),
                P(0.395, 0.663, "North, round the cliffs below the temple"),
                P(0.436, 0.633, "East, to the stairway north of the temple"),
            }, STAIRS),
            {
                P(0.440, 0.800, "Along the west side of the temple"),
                P(0.440, 0.758, "Along the west side of the temple"),
                P(0.456, 0.733, "Round to the temple's north side"),
                P(0.471, 0.733, "Into the temple's top floor (its north door)"),
            },
            {
                P(0.507, 0.758, "West, to the temple's north side"),
                P(0.487, 0.730, "West, to the temple's north side"),
                P(0.471, 0.733, "Into the temple's top floor (its north door)"),
            },
        }




        FDJ.ARROW_EXITS = FDJ.ARROW_EXITS or {}
        table.insert(FDJ.ARROW_EXITS, { mapID = M, x = 0.470, y = 0.770, radius = 60,
            door = P(0.473, 0.726, "Leave the temple") })
        for _, spot in ipairs({ { 0.460, 0.781 }, { 0.470, 0.780 } }) do
            FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(M), spot[1], spot[2])] = { routes = routes }
        end
    end
    D[93016] = {
        level = 43, requires = 35,
        objective = "Speak with Mordent Evenshade in Shen'dralas for information about the crystals you repaired.",
        pickup = AT_MORDENT, turnin = AT_MORDENT, map = MORDENT, turninMap = MORDENT,
    }
    D[93394] = {
        level = 43, requires = 35,
        objective = "Locate Magister Kirandis inside the temple of Shen'dralas.",

        pickup = AT_MORDENT, turnin = "Magister Kirandis, in the temple of Shen'dralas (47.2, 75.8)",
        map = MORDENT, turninMap = KIRANDIS,
        note = "This opens the Shen'dralas quests, Mithera's included.",
    }


    D[93341] = {
        level = 43, requires = 35,
        objective = "Investigate the Forlorn Gardens near Shen'dralas and then return to Mithera at the nearby temple.",
        pickup = "Mithera, by the Forlorn Gardens, Shen'dralas (52.8, 76.0)",
        turnin = "Mithera, by the Forlorn Gardens, Shen'dralas (52.8, 76.0)",
        map = MITHERA, turninMap = MITHERA,



        objectiveSpots = { [1] = { mapID = M, x = 0.716, y = 0.796, label = "Pedestal — Forlorn Gardens, Shen'dralas", markerType = "location", hint = "Examine the pedestal" } },
    }
    D[93594] = {
        level = 43, requires = 35,
        objective = "Find Woodwyrd in the Forlorn Gardens at Shen'dralas.",
        pickup = "Mithera, by the Forlorn Gardens, Shen'dralas (52.8, 76.0)",
        turnin = AT_WOODWYRD, map = MITHERA, turninMap = WOODWYRD,
        note = "Mithera offers it once Forlorn Gardens is handed in.",
    }
    XP[92914] = 3600; XP[96010] = 2450; XP[96018] = 3600; XP[93016] = 360; XP[93394] = 360; XP[93341] = 1800; XP[93594] = 360

    local FOREVER_XP = {
        [7067] = 10650, [7068] = 6750, [7070] = 6750, [7029] = 10250, [7041] = 10250,
        [7028] = 10250, [7044] = 6650, [7046] = 11100, [7064] = 11900, [7065] = 11900,
        [7066] = 11900, [93404] = 11100, [96776] = 11900,
    }
    for id, xp in pairs(FOREVER_XP) do XP[id] = xp end
    if db and type(db.quests) == "table" then
        for _, q in ipairs(db.quests) do
            if FOREVER_XP[q.id] then q.liveXPFallback = FOREVER_XP[q.id] end
            if q.id == 7068 then q.rewardSummary = "Darkspear Trolls +150" end
            if q.id == 7066 then q.rewardSummary = "1g 50s  •  Cenarion Circle +150" end
            if q.id == 93404 then
                q.pickup = AT_WOODWYRD
                q.turnin = AT_WOODWYRD
                q.startMap = WOODWYRD
                q.turninMap = WOODWYRD
                q.objective = "Venture to Maraudon and recover a Vial of Earth Song Water, then use it to put out Woodwyrd's flame at the Forlorn Gardens."
                q.requiredItem = { 258296, "Vial of Earth Song Water", 1, 1, "From the small geyser in the pools Rotgrip swims around in, Maraudon" }
                q.rewards = "Choose: Overgrown Cuffs or Thornplated Cord\n11,100 XP"
                q.rewardSummary = ""
                q.note = "Back at the Forlorn Gardens, use the vial on the burning tree next to Woodwyrd, not on Woodwyrd himself. Afterwards Woodwyrd sends you to the Bristleback Retreat (Passing the Blame), which leads to Agamaggan's Blood."
            end
        end
    end
    FDJ.QUEST_START_MAPS[93404] = WOODWYRD
end








do
    local db = FDJ.DB and FDJ.DB["Razorfen Downs"]
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local M = 2652

    local WOODWYRD = { mapID = M, x = 0.699, y = 0.721, label = "Woodwyrd — Forlorn Gardens, Shen'dralas", targetName = "Woodwyrd" }
    local KOGTHUG = { mapID = M, x = 0.726, y = 0.314, label = "Kog'thug the Brave — Bristleback Retreat, Shen'dralas", targetName = "Kog'thug the Brave" }
    local LANDALOCK = { mapID = 1416, x = 0.154, y = 0.738, label = "Archmage Lan'dalock — Violet Hold entrance, Dalaran", targetName = "Archmage Lan'dalock" }
    local AT_WOODWYRD = "Woodwyrd, Forlorn Gardens, Shen'dralas (69.9, 72.1)"
    local AT_KOGTHUG = "Kog'thug the Brave, Bristleback Retreat, Shen'dralas (72.6, 31.4)"

    C[93604] = {
        { id = 92914, name = "Strange Pylons" },
        { id = 96010, name = "Fragments of the Pylons" },
        { id = 96018, name = "Powering the Pylons" },
        { id = 93016, name = "A Brief History Lesson" },
        { id = 93394, name = "Meeting the Magister" },
        { id = 93341, name = "Forlorn Gardens" },
        { id = 93594, name = "Word of the Woods" },
        { id = 93404, name = "Rot and Regret" },
        { id = 93601, name = "Passing the Blame" },
    }
    D[93404] = {
        level = 49, requires = 35,
        objective = "Venture to Maraudon and recover a Vial of Earth Song Water, then use it to put out Woodwyrd's flame at the Forlorn Gardens.",
        pickup = AT_WOODWYRD, turnin = AT_WOODWYRD, map = WOODWYRD, turninMap = WOODWYRD,

        requiredItems = { {258296, "Vial of Earth Song Water", 1, "From the small geyser in the pools Rotgrip swims around in, Maraudon", map = { mapID = 1443, x = 0.291, y = 0.625, label = "Maraudon Entrance — the Vial of Earth Song Water is inside (the small geyser in Rotgrip's pools)", markerType = "dungeon" }} },
        note = "A Maraudon dungeon quest (see Maraudon). Use the vial on the burning tree next to Woodwyrd, not on Woodwyrd himself.",


        warning = "Yes, this step is in MARAUDON. It's needed to unlock this Razorfen quest.",
        warningTop = true,
    }
    D[93601] = {
        level = 45, requires = 35,
        objective = "Seek out a quilboar of significance at the Bristleback Retreat.",
        pickup = AT_WOODWYRD, turnin = AT_KOGTHUG, map = WOODWYRD, turninMap = KOGTHUG,
    }
    XP[93404] = 11100; XP[93601] = 390








    local SHOW_AGAMAGGAN = false
    if db then
        db.quests = db.quests or {}
        local have = false
        for _, q in ipairs(db.quests) do if q.id == 93604 then have = true end end
        if not have then
            local agamaggan = {
                id = 93604,
                name = "Agamaggan's Blood",
                faction = "Both",
                level = 45,
                requires = 35,
                pickup = AT_KOGTHUG,
                objective = "Venture to Razorfen Downs and acquire Virulent Blood of Agamaggan, then return it to Kog'thug the Brave at Bristleback Retreat.",
                turnin = AT_KOGTHUG,
                startMap = KOGTHUG,
                turninMap = KOGTHUG,
                liveXPFallback = 10200,
                rewardSummary = "65s",
                rewards = "10,200 XP • 65s",
                rewardItems = {},
                requiredItem = { 260237, "Virulent Blood of Agamaggan", 1, 1, "From the Virulent Blood of Agamaggan, which a Cauldron of Agamaggan's Blood summons in Razorfen Downs" },
            }
            if SHOW_AGAMAGGAN then
                table.insert(db.quests, agamaggan)
            else
                FDJ.SHELVED_QUESTS = FDJ.SHELVED_QUESTS or {}
                FDJ.SHELVED_QUESTS[93604] = { dungeon = "Razorfen Downs", quest = agamaggan }
            end
        end
        local FOREVER_XP = {
            [3525] = 10100, [6626] = 8200, [3341] = 9050, [3636] = 10200, [6521] = 7350,
            [96773] = 8600, [97196] = 8600, [93604] = 10200,
        }
        for _, q in ipairs(db.quests) do
            if FOREVER_XP[q.id] then q.liveXPFallback = FOREVER_XP[q.id] end


            if q.id == 93604 and not q.warning then q.warning = "WARNING: This chain has a step in Maraudon\nThis quest is completed in the area OUTSIDE Razorfen Downs" end
            if q.id == 3341 or q.id == 3636 then


                q.rewardChoice = true
                q.rewardItems = { {10824, "Amberglow Talisman", 3}, {270081, "Purified Ring", 3} }
                q.additionalRewardItems = { {10823, "Vanquisher's Sword", 3} }
                q.rewardSummary = (q.id == 3341) and "Undercity +150" or "Stormwind +150"
            end
            if q.id == 6521 then
                q.rewardItems = { {17039, "Skullbreaker", 2}, {17042, "Nail Spitter", 2}, {17043, "Zealot's Robe", 2}, {270054, "Cultist's Chestguard", 3} }
            end
            if q.id == 96773 then
                q.rewardSummary = "55s  •  Kirin Tor +300  •  Stormwind +150"
                q.startMap, q.turninMap = LANDALOCK, LANDALOCK
                q.pickup = "Archmage Lan'dalock, at the Violet Hold entrance in Dalaran, Alterac Mountains (15.4, 73.8)"
                q.turnin = q.pickup
            end
        end
        for id, xp in pairs(FOREVER_XP) do XP[id] = xp end
    end
    XP[3523] = 675; XP[6522] = 5900
    FDJ.QUEST_START_MAPS[93604] = KOGTHUG
    FDJ.QUEST_START_MAPS[96773] = LANDALOCK
    if FDJ.QUEST_SHAREABILITY_AUDIT then
        FDJ.QUEST_SHAREABILITY_AUDIT[93604] = true
        FDJ.QUEST_SHAREABILITY_AUDIT[96773] = true
    end
end











do
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local SM = FDJ.QUEST_START_MAPS
    local TALVASH = { mapID = 1455, x = 0.360, y = 0.040, label = "Talvash del Kissel — Mystic Ward, Ironforge", targetName = "Talvash del Kissel" }
    local DRAN = { mapID = 1454, x = 0.594, y = 0.368, label = "Dran Droffers — The Drag, Orgrimmar", targetName = "Dran Droffers" }
    local JARKAL = { mapID = 1418, x = 0.026, y = 0.460, label = "Jarkal Mossmeld — Kargath, Badlands", targetName = "Jarkal Mossmeld" }
    local MAGELLAS = { mapID = 1455, x = 0.696, y = 0.186, label = "High Explorer Magellas — Hall of Explorers, Ironforge", targetName = "High Explorer Magellas" }
    local DINITA = { mapID = 1455, x = 0.338, y = 0.602, label = "Dinita Stonemantle — The Vault, Ironforge", targetName = "Dinita Stonemantle" }

    local TRUTHSEEKER = { mapID = 1456, x = 0.344, y = 0.472, label = "Sage Truthseeker — Thunder Bluff", targetName = "Sage Truthseeker" }
    local BENA = { mapID = 1456, x = 0.468, y = 0.334, label = "Bena Winterhoof — Thunder Bluff", targetName = "Bena Winterhoof" }


    local function AsStep(q)
        if D[q.id] then return end
        local items = q.requiredItems
        if not items and q.requiredItem then
            items = { { q.requiredItem[1], q.requiredItem[2], q.requiredItem[3], q.requiredItem[5] } }
        end
        D[q.id] = {
            level = q.level, requires = q.requires, objective = q.objective,
            pickup = q.pickup, turnin = q.turnin, startsInDungeon = q.startsInDungeon,
            startItem = q.startItem, startObject = q.startObject, providedItem = q.providedItem,
            map = q.startMap or SM[q.id], turninMap = q.turninMap, note = q.note,
            requiredItems = items,
        }
    end
    local function Insert(dungeon, afterID, quest, chain)
        local d = FDJ.DB and FDJ.DB[dungeon]
        if not d or type(d.quests) ~= "table" then return end
        for _, q in ipairs(d.quests) do if q.id == quest.id then return end end
        local at = #d.quests + 1
        for i, q in ipairs(d.quests) do if q.id == afterID then at = i + 1 end end
        table.insert(d.quests, at, quest)
        C[quest.id] = chain
        local stepIDs = {}
        for _, s in ipairs(chain) do stepIDs[s.id] = true end
        for _, q in ipairs(d.quests) do
            if stepIDs[q.id] then AsStep(q); q.hideFromMainList = true end
        end
    end


    Insert("Uldaman", 2204, {
        id = 2361, name = "Restoring the Necklace", faction = "Alliance", level = 44, requires = 37,
        pickup = "Talvash del Kissel, Mystic Ward, Ironforge (36.0, 4.0)",
        objective = "Let Talvash del Kissel finish restoring the necklace, then take it from him.",
        turnin = "Talvash del Kissel, Mystic Ward, Ironforge (36.0, 4.0)",
        startMap = TALVASH, turninMap = TALVASH,
        liveXPFallback = 5600,
        rewardSummary = "Gnomeregan Exiles +200",
        rewards = "Talvash's Enhancing Necklace\n5,600 XP • Gnomeregan Exiles +200",
        rewardItems = { { 7673, "Talvash's Enhancing Necklace", 3 } },
    }, {
        { id = 2198, name = "The Shattered Necklace" },
        { id = 2199, name = "Lore for a Price" },
        { id = 2200, name = "Back to Uldaman" },
        { id = 2201, name = "Find the Gems" },
        { id = 2204, name = "Restoring the Necklace" },
    })


    D[2340] = {
        level = 44, requires = 37,
        objective = "Deliver the Necklace and Gem Salvage to Dran Droffers in Orgrimmar.",
        pickup = "Jarkal Mossmeld, Kargath, Badlands (2.6, 46.0)",
        turnin = "Dran Droffers, The Drag, Orgrimmar (59.4, 36.8)",
        map = JARKAL, turninMap = DRAN,
        providedItem = { 0, "Necklace and Gem Salvage", 1, "Given by Jarkal Mossmeld when you accept the quest" },
    }
    Insert("Uldaman", 2339, {
        id = 2341, name = "Necklace Recovery, Take 3", faction = "Horde", level = 44, requires = 37,
        pickup = "Dran Droffers, The Drag, Orgrimmar (59.4, 36.8)",
        objective = "Visit Jarkal Mossmeld in Kargath to see if he was successful.",
        turnin = "Jarkal Mossmeld, Kargath, Badlands (2.6, 46.0)",
        startMap = DRAN, turninMap = JARKAL,
        liveXPFallback = 5600,
        rewardSummary = "Darkspear Trolls +100",
        rewards = "Jarkal's Enhancing Necklace\n5,600 XP • Darkspear Trolls +100",
        rewardItems = { { 7888, "Jarkal's Enhancing Necklace", 3 } },



    }, {
        { id = 2283, name = "Necklace Recovery" },
        { id = 2284, name = "Necklace Recovery, Take 2" },
        { id = 2318, name = "Translating the Journal" },
        { id = 2338, name = "Translating the Journal" },
        { id = 2339, name = "Find the Gems and Power Source" },
        { id = 2340, name = "Deliver the Gems" },
    })


    if D[2283] then
        D[2283].warning = "As Horde you can't start the quest from the necklace, you need to have the quest first."
        D[2283].warningTop = true
    end
    local NECKLACE_NOTE = {
        deDE = "Als Horde könnt Ihr die Quest nicht über die Halskette starten, Ihr müsst die Quest zuerst haben.",
        frFR = "Côté Horde, vous ne pouvez pas commencer la quête avec le collier : vous devez d'abord avoir la quête.",
        esES = "Como Horda no puedes empezar la misión desde el collar; primero necesitas tener la misión.",
        itIT = "Come Orda non puoi iniziare la missione dalla collana: devi prima avere la missione.",
        ptBR = "Como Horda, você não pode iniciar a missão pelo colar; precisa ter a missão primeiro.",
        ruRU = "За Орду нельзя начать задание с ожерелья: сначала нужно взять задание.",
        koKR = "호드는 목걸이로 퀘스트를 시작할 수 없습니다. 먼저 퀘스트를 받아야 합니다.",
        zhCN = "部落无法通过项链开始任务，你需要先接到任务。",
        zhTW = "部落無法透過項鍊開始任務，你需要先接到任務。",
    }
    for lang, text in pairs(NECKLACE_NOTE) do
        local c = FDJ.ContentLocales and FDJ.ContentLocales[lang]
        if c then
            c.quests = c.quests or {}
            c.quests[2283] = c.quests[2283] or {}
            c.quests[2283].warning = text
        end
    end






    local DISC_CHOICE = { { 3928, "Superior Healing Potion", 1, 5 }, { 6149, "Greater Mana Potion", 1, 5 } }
    local DISC_ALSO = { { 9587, "Thawpelt Sack", 1 } }
    for _, q in ipairs((FDJ.DB and FDJ.DB["Uldaman"] and FDJ.DB["Uldaman"].quests) or {}) do
        if q.id == 2279 then
            q.rewardItems = {}
            q.rewardChoice = nil
            q.rewardSummary = "Ironforge +150"
            q.turninMap = q.turninMap or MAGELLAS
        elseif q.id == 2280 then
            q.rewardItems = {}
            q.rewardChoice = nil
            q.additionalRewardItems = nil
            q.rewardSummary = "Thunder Bluff +150"
            q.turninMap = q.turninMap or TRUTHSEEKER
        end
    end
    Insert("Uldaman", 2279, {
        id = 2439, name = "The Platinum Discs", faction = "Alliance", level = 47, requires = 40,
        pickup = "High Explorer Magellas, Hall of Explorers, Ironforge (69.6, 18.6)",
        objective = "Take your reward voucher to Dinita Stonemantle in the Vault of Ironforge.",
        turnin = "Dinita Stonemantle, The Vault, Ironforge (33.8, 60.2)",
        startMap = MAGELLAS, turninMap = DINITA,
        providedItem = { 8070, "Reward Voucher", 1, "Given by High Explorer Magellas when you accept the quest" },
        liveXPFallback = 420,
        rewardSummary = "",
        rewardChoice = true,
        rewardItems = DISC_CHOICE,
        additionalRewardItems = DISC_ALSO,
    }, {
        { id = 2278, name = "The Platinum Discs" },
        { id = 2279, name = "The Platinum Discs" },
    })
    Insert("Uldaman", 2280, {
        id = 2440, name = "The Platinum Discs", faction = "Horde", level = 47, requires = 40,
        pickup = "Sage Truthseeker, Thunder Bluff (34.4, 47.2)",
        objective = "Take the reward voucher to Bena Winterhoof in Thunder Bluff.",
        turnin = "Bena Winterhoof, Thunder Bluff (46.8, 33.4)",
        startMap = TRUTHSEEKER, turninMap = BENA,
        providedItem = { 8070, "Reward Voucher", 1, "Given by Sage Truthseeker when you accept the quest" },
        liveXPFallback = 420,
        rewardSummary = "Thunder Bluff +10",
        rewardChoice = true,
        rewardItems = DISC_CHOICE,
        additionalRewardItems = DISC_ALSO,
    }, {
        { id = 2278, name = "The Platinum Discs" },
        { id = 2280, name = "The Platinum Discs" },
    })


    local FOREVER_XP = {

        [2398] = 550, [2240] = 6850, [721] = 4800, [722] = 5500, [707] = 710, [704] = 5000,
        [17] = 6050, [2202] = 6750, [709] = 6150, [2418] = 3500, [1360] = 6300, [2342] = 7000,
        [1139] = 10250, [2200] = 4450, [2201] = 6300, [2204] = 1650, [2283] = 4800, [2284] = 4800,
        [2339] = 7300, [2278] = 8200, [2279] = 5250, [2280] = 5250, [1956] = 7800,
        [2198] = 5800, [2199] = 2450, [2318] = 6750, [2338] = 350, [2340] = 1850,
        [2341] = 5600, [2361] = 5600, [2439] = 420, [2440] = 420,

        [2769] = 405, [2770] = 14200, [2861] = 410, [2846] = 12100, [2768] = 12600, [2864] = 390,
        [2865] = 7800, [3042] = 7800, [3527] = 10500, [2991] = 10500, [2936] = 9700,
        [96770] = 10100, [96775] = 10100,
    }
    for id, xp in pairs(FOREVER_XP) do XP[id] = xp end
    for _, name in ipairs({ "Uldaman", "Zul'Farrak" }) do
        for _, q in ipairs((FDJ.DB and FDJ.DB[name] and FDJ.DB[name].quests) or {}) do
            if FOREVER_XP[q.id] then q.liveXPFallback = FOREVER_XP[q.id] end
            if q.id == 2936 and (q.rewardSummary or "") == "" then q.rewardSummary = "Darkspear Trolls +150" end
            if q.id == 2418 and (q.rewardSummary or "") == "" then q.rewardSummary = "Booty Bay +150  •  Bloodsail Buccaneers -750" end
        end
    end
end








do
    local D = FDJ.QUEST_PREREQ_DETAILS

    local ITEMS = {

        [704]  = { {4610, "Carved Stone Urn", 4, "Outside the instance: urns on both sides of the gate and under the tents before Dig One"} },
        [17]   = { {8047, "Magenta Fungus Cap", 12, "Mushrooms near the fires, mostly outside the instance in the Uldaman excavation"} },
        [2202] = { {8047, "Magenta Fungus Cap", 12, "Mushrooms near the fires, mostly outside the instance in the Uldaman excavation"} },
        [709]  = { {4631, "Tablet of Ryun'eh", 1, "In the middle of the Sealed Hall, before the instance portal"} },
        [2418] = { {8009, "Dentrium Power Stone", 8, "Dropped by the Shadowforge dwarves outside the instance"},
                   {8052, "An'Alleum Power Stone", 8, "Dropped by the Shadowforge dwarves outside the instance"} },
        [1360] = { {8027, "Krom Stoutarm's Treasure", 1, "In his chest in the North Common Hall, outside the instance"} },
        [2342] = { {8026, "Garrett Family Treasure", 1, "In the family chest in the South Common Hall, outside the instance"} },
        [722]  = { {4635, "Hammertoe's Amulet", 1, "Dropped by Magregan Deepshadow in the Uldaman excavation"} },
        [1139] = { {5824, "Tablet of Will", 1, "Inside Uldaman"} },
        [1956] = { {8053, "Obsidian Power Source", 1, "Dropped by the Obsidian Sentinel in Uldaman"} },
        [2283] = { {7666, "Shattered Necklace", 1, "Dropped by the troggs and Shadowforge dwarves of the Uldaman dig site"} },
        [2199] = { {2842, "Silver Bar", 5, "Smelted from Silver Ore: mining, trade or the auction house"} },
        [2201] = { {7669, "Shattered Necklace Ruby", 1, "In the Shadowforge Stash in Galgann Firehammer's room; opening it brings two enemies"},
                   {7670, "Shattered Necklace Sapphire", 1, "Dropped by Grimlok"},
                   {7671, "Shattered Necklace Topaz", 1, "In the Conspicuous Urn in the room with Baelog, Olaf and Eric"} },
        [2204] = { {7672, "Shattered Necklace Power Source", 1, "Dropped by Archaedas, the last boss of Uldaman"} },
        [2339] = { {7669, "Shattered Necklace Ruby", 1, "In the Shadowforge Stash in Galgann Firehammer's room; opening it brings two enemies"},
                   {7670, "Shattered Necklace Sapphire", 1, "Dropped by Grimlok"},
                   {7671, "Shattered Necklace Topaz", 1, "In the Conspicuous Urn in the room with Baelog, Olaf and Eric"},
                   {7672, "Shattered Necklace Power Source", 1, "Dropped by Archaedas, the last boss of Uldaman"} },
        [2258] = { {7847, "Buzzard Gizzard", 5, "Dropped by buzzards in the Badlands, e.g. around the big carcass at 15, 60"},
                   {7846, "Crag Coyote Fang", 10, "Dropped by crag coyotes all over the Badlands"},
                   {7848, "Rock Elemental Shard", 5, "Dropped by rock elementals in the hills by Kargath, around 13, 36"} },
        [2500] = { {7847, "Buzzard Gizzard", 5, "Dropped by buzzards in the Badlands, e.g. around the big carcass at 15, 60"},
                   {7846, "Crag Coyote Fang", 10, "Dropped by crag coyotes all over the Badlands"},
                   {7848, "Rock Elemental Shard", 5, "Dropped by rock elementals in the hills by Kargath, around 13, 36"} },
        [1954] = { {7291, "Infernal Orb", 1, "Dropped by the summoners at Mannoroc Coven, Desolace (around 53, 83)"} },

        [2770] = { {8707, "Gahz'rilla's Electrified Scale", 1, "From Gahz'rilla, summoned with the Mallet of Zul'Farrak at the gong"} },
        [2846] = { {9234, "Tiara of the Deep", 1, "Dropped by Hydromancer Velratha"} },
        [2768] = { {8548, "Divino-matic Rod", 1, "Dropped by Sergeant Bly"} },
        [2865] = { {9238, "Uncracked Scarab Shell", 5, "Dropped by the scarabs in Zul'Farrak (a room full of them on the right-hand path)"} },
        [3042] = { {9523, "Troll Temper", 20, "Dropped by the Sandfury trolls in Zul'Farrak"} },
        [3527] = { {10660, "First Mosh'aru Tablet", 1, "Dropped by Theka the Martyr"},
                   {10661, "Second Mosh'aru Tablet", 1, "Dropped by Hydromancer Velratha"} },
        [2991] = { {9471, "Nekrum's Medallion", 1, "Dropped by Nekrum Gutchewer"} },
        [2934] = { {9322, "Undamaged Venom Sac", 1, "Dropped by spiders in the Hinterlands around 35, 64 (not every one has it; everyone in the group can loot it)"} },
    }
    local function List(entries)
        local out = {}
        for i, e in ipairs(entries) do
            local where = e[4]
            if e[3] > 1 then where = where .. " (" .. e[3] .. " needed)" end
            out[i] = { e[1], e[2], 1, where }
        end
        return out
    end
    for _, name in ipairs({ "Uldaman", "Zul'Farrak" }) do
        for _, q in ipairs((FDJ.DB and FDJ.DB[name] and FDJ.DB[name].quests) or {}) do
            local e = ITEMS[q.id]
            if e and not q.requiredItem and not q.requiredItems then
                if #e == 1 then
                    q.requiredItem = { e[1][1], e[1][2], 1, e[1][3], e[1][4] }
                else
                    q.requiredItems = List(e)
                end
            end
            if q.id == 2865 then
                q.warning = "Have Tran'rek in your quest log? Hand it in to Tran'rek first: until then you can't accept Scarab Shells, not even when someone shares it."
            end
        end
    end
    for id, e in pairs(ITEMS) do
        local d = D[id]
        if d and not d.requiredItems then d.requiredItems = List(e) end
    end
    if D[2990] and not D[2990].providedItem then
        D[2990].providedItem = { 9468, "Sharpbeak's Feather", 1, "Given by Gryphon Master Talonaxe when you accept the quest" }
    end
end










do
    local db = FDJ.DB and FDJ.DB["Blackrock Depths"]
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local FALRIN = "Falrin Treeshaper, the Athenaeum, Dire Maul (West)"
    local ANTHION = "Anthion Harmon, outside Stratholme, Eastern Plaguelands"

    C[9015] = {
        { id = 8948, name = "Anthion's Old Friend" },
        { id = 8949, name = "Falrin's Vendetta" },
        { id = 8950, name = "The Instigator's Enchantment" },
    }
    D[8948] = {
        level = 60, requires = 58,
        objective = "Take the incomplete Banner of Provocation to Falrin Treeshaper at the library in Dire Maul.",
        pickup = ANTHION, turnin = FALRIN,
        description = "Part of Anthion Harmon's Dungeon Set 2 quests: the earlier ones unlock this step.",
        providedItem = {21983, "Incomplete Banner of Provocation", 1, "Given by Anthion Harmon"},
    }
    D[8949] = {
        level = 60, requires = 58,
        objective = "Collect 25 Ogre Warbeads from ogres inside Dire Maul or Blackrock Spire.",
        pickup = FALRIN, turnin = FALRIN,
        requiredItems = { {21982, "Ogre Warbeads", 1, "From ogres in Dire Maul or Blackrock Spire (25 needed)"} },
    }
    D[8950] = {
        level = 60, requires = 58,
        objective = "Bring 1 Jeering Spectre's Essence, 4 Dark Runes and 8 Large Brilliant Shards to Falrin Treeshaper inside Dire Maul.",
        pickup = FALRIN, turnin = FALRIN,
        requiredItems = {
            {22224, "Jeering Spectre's Essence", 1, "From Eldreth Phantasms, Spectres, Spirits and Apparitions in Dire Maul (1 needed)"},
            {20520, "Dark Rune", 2, "From undead in the Plaguelands, Scholomance and Stratholme (4 needed)"},
            {14344, "Large Brilliant Shard", 3, "Enchanting: disenchant rare items, or buy one (8 needed)"},
        },
    }

    if db then
        db.quests = db.quests or {}
        local have = {}
        for _, q in ipairs(db.quests) do have[q.id] = true end
        if not have[97197] then
            table.insert(db.quests, {
                id = 97197,
                name = "Fragment of the Firelands",
                faction = "Horde",
                level = 55,
                requires = 49,
                pickup = "Alaana Stormwalker, Skywatcher Plateau, Mulgore (33.4, 22.5)",
                startMap = { mapID = 1412, x = 0.334, y = 0.225, label = "Alaana Stormwalker — Skywatcher Plateau", targetName = "Alaana Stormwalker", detail = "Where the skycutter lands, northwest of Thunder Bluff" },
                objective = "Recover a Fragment of the Firelands from Magmus in Blackrock Depths for Alaana Stormwalker in Mulgore.",
                turnin = "Alaana Stormwalker, Skywatcher Plateau, Mulgore (33.4, 22.5)",
                liveXPFallback = 14800,
                rewardSummary = "85s  •  Cenarion Circle +300",
                rewards = "14,800 XP • 85s • Cenarion Circle +300",
                rewardItems = {},



                requiredItems = {
                    {277129, "Fragment of the Firelands", 1, "Drops from Magmus in Blackrock Depths"},
                },
                note = "The Fragment of the Firelands drops from Magmus, the guardian at the door to the Imperial Seat in Blackrock Depths. Seen picked up at level 49.",
            })
        end




        if false and not have[9015] then
            table.insert(db.quests, {
                id = 9015,
                name = "The Challenge",
                faction = "Both",
                level = 60,
                requires = 58,
                pickup = FALRIN,
                objective = "Use the Banner of Provocation in the center of the Ring of Law as High Justice Grimstone sentences you, slay Theldren and his gladiators, and bring the Top Piece of Lord Valthalak's Amulet to Anthion Harmon in the Eastern Plaguelands.",
                turnin = ANTHION,
                liveXPFallback = 1450,
                rewardSummary = "",
                rewards = "1,450 XP",
                rewardItems = {},
                requiredItem = { 22047, "Top Piece of Lord Valthalak's Amulet", 1, 1, "Dropped by Theldren in the Ring of Law, Blackrock Depths" },
                note = "Plant the banner before the normal challenger comes out. Theldren and his gladiators then fight you, and an Arena Spoils chest appears afterwards. You keep the banner (10 min cooldown) to summon him again.",
            })
        end
        local FOREVER_XP = {
            [3802] = 9450, [4123] = 10450, [4136] = 5550, [4201] = 10900, [4128] = 550,
            [4126] = 14800, [4133] = 550, [4134] = 11300, [4263] = 10450, [3907] = 13500,
            [7201] = 10100, [4322] = 13950, [3982] = 10100, [4063] = 12400, [4081] = 9950,
            [4082] = 10650, [4132] = 15500, [4024] = 11450, [4362] = 16900, [4003] = 16100,
            [4286] = 10450, [7604] = 725, [4083] = 5650, [97197] = 14800, [9015] = 1450,
        }
        for _, q in ipairs(db.quests) do
            if FOREVER_XP[q.id] then q.liveXPFallback = FOREVER_XP[q.id] end
        end
        for id, xp in pairs(FOREVER_XP) do XP[id] = xp end
    end

    XP[3801] = 500; XP[4002] = 550; XP[4342] = 2900; XP[4122] = 6200; XP[4361] = 6400
    XP[4121] = 7750; XP[3981] = 9450; XP[4242] = 9800; XP[4264] = 11150; XP[4282] = 11150
    XP[4241] = 11450; XP[4341] = 11500; XP[4001] = 12600; XP[4004] = 2200; XP[4363] = 20250
    XP[8948] = 1450; XP[8949] = 1450; XP[8950] = 1450

end










do
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local bh = FDJ.DB and FDJ.DB["Blackmaw Hold"]
    local EKKAL = "Ekkal, Ruins of Eldarath, Azshara (42.0, 38.9)"
    local EKKAL_MAP = { mapID = 1447, x = 0.420, y = 0.389, label = "Ekkal — Ruins of Eldarath, Azshara", targetName = "Ekkal" }
    if bh then
        bh.quests = bh.quests or {}
        local have = {}
        for _, q in ipairs(bh.quests) do have[q.id] = true end
        local function Add(q) if not have[q.id] then table.insert(bh.quests, q) have[q.id] = true end end
        Add({
            id = 92066, name = "The Twin Bears", faction = "Both", level = 55, requires = 47,
            pickup = "Lorekeeper Nok, Ursolan, Azshara (41.4, 20.0)",
            objective = "Find the Totem of Ursoc and the Totem of Ursol inside Blackmaw Hold. Then, return them to Lorekeeper Nok at Ursolan.",
            turnin = "Lorekeeper Nok, Ursolan, Azshara (41.4, 20.0)",
            startMap = { mapID = 1447, x = 0.414, y = 0.200, label = "Lorekeeper Nok — Ursolan, Azshara", targetName = "Lorekeeper Nok" },
            turninMap = { mapID = 1447, x = 0.414, y = 0.200, label = "Lorekeeper Nok — Ursolan, Azshara", targetName = "Lorekeeper Nok" },
            liveXPFallback = 11300,
            rewardSummary = "Timbermaw Hold +150",
            rewards = "11,300 XP • Timbermaw Hold +150",
            rewardChoice = true,
            rewardItems = { {279891, "Guidance of Ursoc", 2}, {279892, "Wisdom of Ursol", 2} },



            repNeeds = {
                { faction = 576, name = "Timbermaw Hold", standing = 4 },
            },
        })
        Add({
            id = 92065, name = "Blackmaw Reclamation", faction = "Both", level = 60, requires = 47,
            pickup = "Gatekeeper Rageroar, Ursolan, Azshara (42.4, 20.2)",
            objective = "Bring Varrox Bleakhoof's Head to Gatekeeper Rageroar at Ursolan.",
            turnin = "Gatekeeper Rageroar, Ursolan, Azshara (42.4, 20.2)",
            startMap = { mapID = 1447, x = 0.424, y = 0.202, label = "Gatekeeper Rageroar — Ursolan, Azshara", targetName = "Gatekeeper Rageroar" },
            turninMap = { mapID = 1447, x = 0.424, y = 0.202, label = "Gatekeeper Rageroar — Ursolan, Azshara", targetName = "Gatekeeper Rageroar" },
            liveXPFallback = 13200,
            rewardSummary = "Timbermaw Hold +150",
            rewards = "13,200 XP • Timbermaw Hold +150",
            rewardChoice = true,
            rewardItems = { {260216, "Ouroboros Ring", 3}, {260217, "Eagle's Head Signet", 3}, {260218, "Malefactor's End", 3}, {260219, "Engraved Band", 3} },



            repNeeds = { { faction = 576, name = "Timbermaw Hold", standing = 4 } },
        })
        Add({
            id = 96246, name = "Blackmaw Pouches", faction = "Both", level = 60, requires = 55,
            repeatable = true,
            pickup = EKKAL, turnin = EKKAL, startMap = EKKAL_MAP, turninMap = EKKAL_MAP,
            objective = "Enter Blackmaw Hold and recover 5 Blackmaw Pouches for Ekkal at the Ruins of Eldarath in Azshara.",
            rewardSummary = "Timbermaw Hold +100",
            rewards = "Timbermaw Hold +100",
            rewardItems = {},
            requiredItem = { 273050, "Blackmaw Pouch", 1, 5, "From the Blackmaw furbolgs inside Blackmaw Hold" },
            note = "Repeatable, after the first Blackmaw Pouches.",
        })
        Add({
            id = 92067, name = "Feeding Time!", faction = "Both", level = 55, requires = 45,
            repeatable = true,
            pickup = "Not known yet",
            objective = "Bring Fel-Tainted Flesh.",
            turnin = "Not known yet",
            rewardSummary = "Regurgitated Seed Pod",
            rewards = "Regurgitated Seed Pod",
            rewardItems = { {249900, "Regurgitated Seed Pod", 1} },
            note = "Repeatable. By its completion text you feed the flesh to a hungry lasher, which spits out a seed pod. Where it is isn't known yet; please report it on Discord.",
        })
        for _, q in ipairs(bh.quests) do
            if q.id == 92070 then q.liveXPFallback = 11300 end
        end
        XP[92070] = 11300; XP[92065] = 13200; XP[92066] = 11300; XP[97327] = 13200
    end



    local FERALAS = 1444
    D[3445] = {
        level = 51, requires = 46,
        objective = "Find Marvon Rivetseeker in Tanaris.",
        pickup = "Angelas Moonbreeze, Feathermoon Stronghold, Feralas (31.8, 45.6)",
        turnin = "Marvon Rivetseeker, Broken Pillar, Tanaris (52.6, 45.8)",
        map = { mapID = FERALAS, x = 0.318, y = 0.456, label = "Angelas Moonbreeze — Feathermoon Stronghold", targetName = "Angelas Moonbreeze" },
    }
    D[3380] = {
        level = 51, requires = 46,
        objective = "Find Marvon Rivetseeker in Tanaris.",
        pickup = "Witch Doctor Uzer'i, Camp Mojache, Feralas (74.4, 43.4)",
        turnin = "Marvon Rivetseeker, Broken Pillar, Tanaris (52.6, 45.8)",
        map = { mapID = FERALAS, x = 0.744, y = 0.434, label = "Witch Doctor Uzer'i — Camp Mojache", targetName = "Witch Doctor Uzer'i" },
    }
    local ST_STEP = { id = 3445, name = "The Sunken Temple" }
    C[3446] = { ST_STEP, { id = 3444, name = "The Stone Circle" } }
    C[3447] = { ST_STEP, { id = 3444, name = "The Stone Circle" } }
    function FDJ.SetSunkenTempleFaction(faction)
        ST_STEP.id = (faction == "Horde") and 3380 or 3445
    end
    do
        local ok, faction = pcall(UnitFactionGroup, "player")
        if ok and type(faction) == "string" then FDJ.SetSunkenTempleFaction(faction) end
        local f = CreateFrame("Frame")
        f:RegisterEvent("PLAYER_LOGIN")
        f:SetScript("OnEvent", function()
            local ok2, fac = pcall(UnitFactionGroup, "player")
            if ok2 and type(fac) == "string" then FDJ.SetSunkenTempleFaction(fac) end
        end)
    end

    local st = FDJ.DB and FDJ.DB["Sunken Temple"]
    local ST_XP = {
        [3373] = 5450, [3446] = 9550, [1445] = 10600, [3447] = 11900, [1446] = 12750,
        [1475] = 13850, [3528] = 15400, [4143] = 9950, [4146] = 9200,
        [9053] = 12400, [8232] = 12400, [8253] = 12400, [8418] = 12400, [8257] = 12400,
        [8236] = 12400, [8413] = 12400, [8422] = 12400, [8425] = 12400,
        [9063] = 500, [8151] = 500, [8250] = 500, [8415] = 500, [8254] = 500, [8233] = 500, [8417] = 500,
    }
    if st then
        for _, q in ipairs(st.quests or {}) do
            if ST_XP[q.id] then q.liveXPFallback = ST_XP[q.id] end
        end
    end
    for id, xp in pairs(ST_XP) do XP[id] = xp end

    local STEP_XP = {
        [3445] = 3650, [3380] = 6550, [3444] = 4900,
        [1424] = 4450, [1429] = 3750, [1444] = 3750,
        [1448] = 3600, [1449] = 1800, [1450] = 900, [1451] = 1800, [1452] = 3600, [1469] = 2700,
        [3520] = 3750, [4787] = 5900, [4141] = 5100, [4142] = 3800, [4145] = 5100, [4147] = 2550,
        [9052] = 5100, [8153] = 5100, [8231] = 5100, [8251] = 5100, [8252] = 5100,
        [8414] = 5100, [8416] = 2550, [8255] = 5100, [8256] = 5100, [8234] = 5100, [8235] = 5100,
        [8410] = 3800, [8412] = 5100, [8419] = 3800, [8420] = 3800, [8421] = 5100,
        [8423] = 5100, [8424] = 5100,
    }
    for id, xp in pairs(STEP_XP) do XP[id] = xp end
end
















do
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local rfk = FDJ.DB and FDJ.DB["Razorfen Kraul"]
    local VEYRIC = "Veyric Thunderhame, Arathi Highlands (59.6, 27.6)"
    local VEYRIC_MAP = { mapID = 1417, x = 0.596, y = 0.276, label = "Veyric Thunderhame — Arathi Highlands", targetName = "Veyric Thunderhame" }
    local RAU = "Rau Cliffrunner, Freewind Post, Thousand Needles (46.0, 51.6)"
    local RAU_MAP = { mapID = 1441, x = 0.460, y = 0.516, label = "Rau Cliffrunner — Freewind Post", targetName = "Rau Cliffrunner" }
    local PRATE = "Prate Cloudseer, The Weathered Nook, Thousand Needles (53, 42)"
    local PRATE_MAP = { mapID = 1441, x = 0.530, y = 0.420, label = "Prate Cloudseer — The Weathered Nook", targetName = "Prate Cloudseer", detail = "In the cave up the ledge on the north wall, northeast of Freewind Post" }
    local BATHRAH = "Bath'rah the Windwatcher, Alterac Mountains (80.4, 66.8)"
    local NOTE = {274463, "Tattered Note", 1, "Drops from Charlga Razorflank in Razorfen Kraul, for every Shaman on the quest"}
    local TOTEMS = "Twisted Totems only drop while this quest is in your log. Water: Mirefin murlocs, northeast coast of Dustwallow Marsh. Air: Maraudine centaurs, Desolace. Earth: Lost Ones, Swamp of Sorrows. Fire: Dustbelcher ogres and Stonevault troggs, Badlands."
    local RITUAL = "Elite, level 40: bring a group. At the steam pools in Thousand Needles, stand on the rune circle and use the Corrupted Totems. Waves of elementals come, then an elite quilboar and the Ravaging Tempest, which drops the Eye of the Tempest for every Shaman on the quest."
    local WEAPONS = {{280604, "Rage of the Storm", 3}, {280607, "Lightning's Grasp", 3}, {280605, "Tidebringer's Claw", 3}}
    local DUNGEON_NOTE = "Shaman class quest from level 30, unlocked by Call of Air (the Air Totem quest). In this dungeon: Elemental Aid. Kill Charlga Razorflank and loot the Tattered Note; every Shaman on the quest gets one. After that: 20 Twisted Totems from four zones and the elite Heed My Call ritual in Thousand Needles."

    if rfk then
        rfk.quests = rfk.quests or {}
        local have = {}
        for _, q in ipairs(rfk.quests) do have[q.id] = true end
        local function Add(q) if not have[q.id] then table.insert(rfk.quests, q) have[q.id] = true end end
        Add({
            id = 96016, name = "The Tempest's Weapons", faction = "Alliance", classOnly = "SHAMAN",
            warning = "This is a chain quest with a step in Razorfen Kraul",
            level = 40, requires = 30,
            pickup = VEYRIC,
            objective = "Deliver the Eye of the Tempest to Bath'rah the Windwatcher in Alterac Mountains.",
            turnin = BATHRAH,
            note = DUNGEON_NOTE,
            rewardSummary = "",
            rewardChoice = true,
            rewardItems = WEAPONS,
            additionalRewardItems = {{280696, "Elementalist's Guard", 3}},
            liveXPFallback = 3900,
            startMap = VEYRIC_MAP,
        })
        Add({
            id = 79442, name = "The Tempest's Weapons", faction = "Horde", classOnly = "SHAMAN",
            warning = "This is a chain quest with a step in Razorfen Kraul",
            level = 40, requires = 30,
            pickup = "Prate Cloudseer, Thousand Needles (follow your quest log)",
            objective = "Deliver the Eye of the Tempest to Bath'rah the Windwatcher in Alterac Mountains.",
            turnin = BATHRAH,
            note = DUNGEON_NOTE .. " Horde quest givers after the dungeon aren't confirmed yet (Prate Cloudseer or Rau Cliffrunner): follow your quest log.",
            rewardSummary = "",
            rewardChoice = true,
            rewardItems = WEAPONS,

            additionalRewardItems = {{280696, "Elementalist's Guard", 3}},
            startMap = PRATE_MAP,
        })
    end

    C[96016] = {
        { id = 96264, name = "Elemental Aid" },
        { id = 79358, name = "Storm, Earth, and Fire" },
        { id = 96135, name = "Heed My Call" },
    }
    C[79442] = {
        { id = 1531, name = "Call of Air" },
        { id = 79360, name = "Elemental Aid" },
        { id = 79364, name = "Eyes on the Sky" },
        { id = 79361, name = "Storm, Earth, and Fire" },
        { id = 79366, name = "Heed My Call" },
    }

    D[96264] = {
        level = 33, requires = 30,
        objective = "Defeat Charlga Razorflank in Razorfen Kraul and collect information on the quilboar's plans.",
        requiredItems = { NOTE },
        pickup = VEYRIC, turnin = VEYRIC,
        description = "The Razorfen Kraul step. Call of Air (from Eldrun Stormbreaker in Ironforge) sends you to Veyric. Alliance Shamans can share this quest.",
        map = VEYRIC_MAP,
    }

    local SEARN_MAP = { mapID = 1454, x = 0.380, y = 0.377, label = "Searn Firewarder \226\128\148 Orgrimmar", targetName = "Searn Firewarder" }
    D[1531] = {
        level = 30, requires = 30,
        objective = "Find Prate Cloudseer in Thousand Needles.",
        pickup = "Searn Firewarder, Orgrimmar (38.0, 37.7)", turnin = PRATE,
        description = "Also given by Xanis Flameweaver in Thunder Bluff, and to Skyborne Shamans by Alaana Stormwalker in Mulgore (33.4, 22.4): any one of them counts. Prate Cloudseer gives you the Air Totem and Elemental Aid.",
        map = SEARN_MAP, turninMap = PRATE_MAP,
    }
    FDJ.QUEST_DONE_BY = FDJ.QUEST_DONE_BY or {}
    FDJ.QUEST_DONE_BY[1531] = { 1532, 96136 }
    XP[1531] = XP[1531] or 2450
    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[1531] = FDJ.PREREQ_REWARD_ITEMS_FALLBACK[1531] or { items = { {5178, "Air Totem", 1} }, choice = false }
    D[79360] = {
        level = 33, requires = 30,
        objective = "Defeat Charlga Razorflank in Razorfen Kraul and collect information on the quilboar's plans.",
        requiredItems = { NOTE },
        pickup = PRATE, turnin = RAU,
        description = "The Razorfen Kraul step. Prate Cloudseer gives it when you hand in Call of Air; hand it in to Rau Cliffrunner at Freewind Post. It can't be shared on the Horde side.",
        map = PRATE_MAP, turninMap = RAU_MAP,
    }

    do
        local T = {
            deDE = { "Ruf der Luft", "Sucht Prate Cloudseer in Tausend Nadeln.", "Searn Firewarder, Orgrimmar (38.0, 37.7)",
                "Auch Xanis Flameweaver in Donnerfels gibt sie, und Alaana Stormwalker in Mulgore (33.4, 22.4) den Skyborne-Schamanen: eine davon genügt. Prate Cloudseer gibt Euch das Lufttotem und Elementare Hilfe.",
                "Der Schritt im Kral von Razorfen. Prate Cloudseer gibt sie Euch, wenn Ihr Ruf der Luft abgebt; abgegeben wird sie bei Rau Cliffrunner am Freiwindposten. Auf Seiten der Horde kann sie nicht geteilt werden." },
            frFR = { "L'appel de l'air", "Trouvez Prate Œil-des-Nuages aux Mille pointes.", "Searn Firewarder, Orgrimmar (38.0, 37.7)",
                "Xanis Flameweaver aux Pitons-du-Tonnerre la donne aussi, et Alaana Stormwalker en Mulgore (33.4, 22.4) aux chamans Skyborne : une seule suffit. Prate Œil-des-Nuages vous donne le totem d'air et Soutien élémentaire.",
                "L'étape du kraal de Tranchebauge. Prate Œil-des-Nuages vous la donne quand vous rendez L'appel de l'air ; elle se rend à Rau Cliffrunner au poste de Librevent. Côté Horde, elle ne peut pas être partagée." },
            esES = { "La llamada del aire", "Encuentra a Prate Cloudseer en Las Mil Agujas.", "Searn Firewarder, Orgrimmar (38.0, 37.7)",
                "También la dan Xanis Flameweaver en Cima del Trueno y, a los chamanes Skyborne, Alaana Stormwalker en Mulgore (33.4, 22.4): basta con una. Prate Cloudseer te da el tótem de aire y Ayuda elemental.",
                "El paso del Horado Rajacieno. Prate Cloudseer te la da al entregar La llamada del aire; se entrega a Rau Cliffrunner en el Puesto Viento Libre. En la Horda no se puede compartir." },
            itIT = { "Call of Air", "Trova Prate Cloudseer a Thousand Needles.", "Searn Firewarder, Orgrimmar (38.0, 37.7)",
                "La danno anche Xanis Flameweaver a Thunder Bluff e, agli sciamani Skyborne, Alaana Stormwalker a Mulgore (33.4, 22.4): ne basta una. Prate Cloudseer ti dà il totem dell'aria ed Elemental Aid.",
                "Il passo di Razorfen Kraul. Prate Cloudseer te la dà quando consegni Call of Air; si consegna a Rau Cliffrunner a Freewind Post. Per l'Orda non si può condividere." },
            ptBR = { "O Chamado do Ar", "Encontre Prate Cloudseer em Mil Agulhas.", "Searn Firewarder, Orgrimmar (38.0, 37.7)",
                "Xanis Flameweaver em Penhasco do Trovão também a dá, e Alaana Stormwalker em Mulgore (33.4, 22.4) aos xamãs Skyborne: basta uma. Prate Cloudseer dá o Totem do Ar e Auxílio elemental.",
                "A etapa do Urzal dos Tuscos. Prate Cloudseer a dá quando você entrega O Chamado do Ar; é entregue a Rau Cliffrunner no Posto Vento Livre. Na Horda não pode ser compartilhada." },
            ruRU = { "Зов воздуха", "Найдите Пратту Заклинательницу Туч в Тысяче Игл.", "Searn Firewarder, Оргриммар (38.0, 37.7)",
                "Его также дает Xanis Flameweaver в Громовом Утесе, а шаманам Skyborne — Alaana Stormwalker в Мулгоре (33.4, 22.4): хватит любого. Пратта Заклинательница Туч дает тотем воздуха и «Стихийную помощь».",
                "Этап в лабиринтах Иглошкурых. Пратта Заклинательница Туч дает его, когда вы сдаете «Зов воздуха»; сдается Rau Cliffrunner на Заставе Вольного Ветра. У Орды им нельзя поделиться." },
            koKR = { "바람의 부름", "버섯구름 봉우리에서 Prate Cloudseer를 찾으세요.", "Searn Firewarder, 오그리마 (38.0, 37.7)",
                "썬더 블러프의 Xanis Flameweaver도 주며, Skyborne 주술사는 멀고어의 Alaana Stormwalker(33.4, 22.4)에게 받습니다. 하나만 하면 됩니다. Prate Cloudseer가 바람의 토템과 정령의 도움을 줍니다.",
                "가시덩굴 우리 단계입니다. 바람의 부름을 완료하면 Prate Cloudseer가 줍니다. 자유바람 야영지의 Rau Cliffrunner에게 완료합니다. 호드는 공유할 수 없습니다." },
            zhCN = { "空气的召唤", "在千针石林找到Prate Cloudseer。", "Searn Firewarder，奥格瑞玛 (38.0, 37.7)",
                "雷霆崖的Xanis Flameweaver也会给，Skyborne萨满则在莫高雷找Alaana Stormwalker (33.4, 22.4)：完成其中一个即可。Prate Cloudseer会给你空气图腾和元素援助。",
                "剃刀沼泽的步骤。交付空气的召唤时Prate Cloudseer会给你这个任务；交给乱风岗的Rau Cliffrunner。部落方无法共享。" },
            zhTW = { "空氣的召喚", "在千針石林找到Prate Cloudseer。", "Searn Firewarder，奧格瑪 (38.0, 37.7)",
                "雷霆崖的Xanis Flameweaver也會給，Skyborne薩滿則在莫高雷找Alaana Stormwalker (33.4, 22.4)：完成其中一個即可。Prate Cloudseer會給你空氣圖騰和元素援助。",
                "剃刀沼澤的步驟。交付空氣的召喚時Prate Cloudseer會給你這個任務；交給亂風崗的Rau Cliffrunner。部落方無法共享。" },
        }
        T.esMX = T.esES
        FDJ.ContentLocales = FDJ.ContentLocales or {}
        for lang, t in pairs(T) do
            local content = FDJ.ContentLocales[lang] or {}
            FDJ.ContentLocales[lang] = content
            content.quests = content.quests or {}
            local q = content.quests[1531] or {}
            content.quests[1531] = q
            if q.name == nil then q.name = t[1] end
            if q.objective == nil then q.objective = t[2] end
            if q.pickup == nil then q.pickup = t[3] end
            if q.description == nil then q.description = t[4] end
            local aid = content.quests[79360] or {}
            content.quests[79360] = aid
            aid.description = t[5]
            content.places = content.places or {}
            if content.places[SEARN_MAP.label] == nil then
                content.places[SEARN_MAP.label] = "Searn Firewarder \226\128\148 " .. ((lang == "ruRU" and "Оргриммар") or (lang == "koKR" and "오그리마")
                    or (lang == "zhCN" and "奥格瑞玛") or (lang == "zhTW" and "奧格瑪") or "Orgrimmar")
            end
        end
    end
    D[79364] = {
        requires = 30,
        objective = "Speak with Prate Cloudseer in Thousand Needles.",
        pickup = RAU, turnin = PRATE,
        map = RAU_MAP, turninMap = PRATE_MAP,
    }
    D[79358] = {
        requires = 30,
        objective = "Collect 5 Twisted Fire Totems, 5 Twisted Earth Totems, 5 Twisted Air Totems and 5 Twisted Water Totems for Veyric Thunderhame in Arathi Highlands.",
        pickup = VEYRIC, turnin = VEYRIC,
        description = TOTEMS,
        map = VEYRIC_MAP,
    }
    D[79361] = {
        requires = 30,
        objective = "Collect 5 Twisted Fire Totems, 5 Twisted Earth Totems, 5 Twisted Air Totems and 5 Twisted Water Totems and turn them in to Prate Cloudseer in Thousand Needles.",
        pickup = PRATE, turnin = PRATE,
        description = TOTEMS,
        map = PRATE_MAP,
    }
    D[96135] = {
        level = 40, requires = 30,
        objective = "Use the Twisted Totems to put an end to the quilboar ritual.",
        pickup = VEYRIC, turnin = VEYRIC,
        description = RITUAL,
        map = VEYRIC_MAP,
    }
    D[79366] = {
        level = 40, requires = 30,
        objective = "Use the Twisted Totems to put an end to the quilboar ritual.",
        pickup = PRATE, turnin = PRATE,
        description = RITUAL .. " Horde: givers not confirmed yet, follow your quest log.",
        map = PRATE_MAP,
    }
    D[96016] = { level = 40, requires = 30, objective = "Deliver the Eye of the Tempest to Bath'rah the Windwatcher in Alterac Mountains.", pickup = VEYRIC, turnin = BATHRAH, description = "Final step. Choose Rage of the Storm, Lightning's Grasp or Tidebringer's Claw; Alliance Shamans also get Elementalist's Guard." }
    D[79442] = { level = 40, requires = 30, objective = "Deliver the Eye of the Tempest to Bath'rah the Windwatcher in Alterac Mountains.", pickup = "Prate Cloudseer, Thousand Needles (follow your quest log)", turnin = BATHRAH, description = "Final step. Choose Rage of the Storm, Lightning's Grasp or Tidebringer's Claw." }

    XP[96264] = 6950
    XP[96135] = 3150
    XP[96016] = 3900
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[96264] = 3500
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[96135] = 5000
end








do
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local rfk = FDJ.DB and FDJ.DB["Razorfen Kraul"]
    local FUREN = "Furen Longbeard, Dwarven District, Stormwind (64.6, 37.2)"
    local FUREN_MAP = { mapID = 1453, x = 0.646, y = 0.372, label = "Furen Longbeard — Stormwind", targetName = "Furen Longbeard" }
    local YORUS = "Yorus Barleybrew, Lakeshire, Redridge Mountains"

    local YORUS_MAP = { mapID = 1433, x = 0.215, y = 0.447, label = "Yorus Barleybrew — Lakeshire", targetName = "Yorus Barleybrew" }
    local THUNGRIM = "Thun'grim Firegaze, hills east of the Crossroads, The Barrens (57, 30)"
    local THUNGRIM_MAP = { mapID = 1413, x = 0.570, y = 0.300, label = "Thun'grim Firegaze — east of the Crossroads", targetName = "Thun'grim Firegaze", detail = "On the hilltop east of the Crossroads, just south of Thorn Hill" }
    local RUGA = "Ruga Ragetotem, Camp Taurajo, The Barrens"
    local RUGA_MAP = { mapID = 1413, x = 0.450, y = 0.590, label = "Ruga Ragetotem — Camp Taurajo", targetName = "Ruga Ragetotem" }
    local VIAL = {6841, "Vial of Phlogiston", 1, "Drops from Roogug, the first boss in Razorfen Kraul (take the first left)"}

    if rfk then
        rfk.quests = rfk.quests or {}
        local have = {}
        for _, q in ipairs(rfk.quests) do have[q.id] = true end
        local function Add(q) if not have[q.id] then table.insert(rfk.quests, q) have[q.id] = true end end
        Add({
            id = 1782, name = "Furen's Armor", faction = "Alliance", classOnly = "WARRIOR",
            warning = "This is a chain quest with a step in Razorfen Kraul",
            level = 28, requires = 20,
            pickup = FUREN,
            objective = "Wait for Furen Longbeard to finish your armor.",
            turnin = FUREN,
            note = "Warrior class quest from level 20. In this dungeon: Fire Hardened Mail needs the Vial of Phlogiston from Roogug, the first boss. After Fire Hardened Mail, Grimand Elmore (Stormwind), Klockmort Spannerspan (Ironforge) and Mathiel (Darnassus) each make one more piece:",
            noteRewardItems = {{6971, "Fire Hardened Coif", 2}, {6974, "Fire Hardened Gauntlets", 2}, {6973, "Fire Hardened Leggings", 2}},
            rewardSummary = "",
            rewardItems = {{6972, "Fire Hardened Hauberk", 3}},
            liveXPFallback = 3400,
            startMap = FUREN_MAP,
        })
        Add({
            id = 1848, name = "Brutal Hauberk", faction = "Horde", classOnly = "WARRIOR",
            warning = "This is a chain quest with a step in Razorfen Kraul",
            level = 30, requires = 20,
            pickup = THUNGRIM,
            objective = "Wait for Thun'grim Firegaze to finish your armor.",
            turnin = THUNGRIM,
            note = "Warrior class quest from level 20. In this dungeon: Brutal Armor needs the Vial of Phlogiston from Roogug, the first boss. After Brutal Armor, Ula'elek, Orm Stonehoof (Thunder Bluff) and Velora Nitely each make one more piece:",
            noteRewardItems = {{7129, "Brutal Gauntlets", 2}, {7130, "Brutal Helm", 2}, {7132, "Brutal Legguards", 2}},
            rewardSummary = "",
            rewardItems = {{7133, "Brutal Hauberk", 3}},
            liveXPFallback = 3050,
            startMap = THUNGRIM_MAP,
        })
    end

    C[1782] = {
        { id = 1699, name = "The Rethban Gauntlet" },
        { id = 1702, name = "The Shieldsmith" },
        { id = 1701, name = "Fire Hardened Mail", needsDungeon = true },
    }
    C[1848] = {
        { id = 1824, name = "Trial at the Field of Giants" },
        { id = 1825, name = "Speak with Thun'grim" },
        { id = 1838, name = "Brutal Armor" },
    }

    D[1699] = {
        level = 22, requires = 20,
        objective = "Enter the Rethban Caverns, reach the first fork and return to Yorus Barleybrew in time. You must not die and release your spirit.",
        pickup = YORUS, turnin = YORUS,
        description = "Your warrior trainer (Wu Shen in Stormwind, or the trainers in Ironforge and Darnassus) sends you to Yorus Barleybrew in Lakeshire first. The run is timed.",
        map = YORUS_MAP, turninMap = YORUS_MAP,
    }
    D[1702] = {
        level = 22, requires = 20,
        objective = "Bring the Cask of Scalder to Furen Longbeard.",
        pickup = YORUS, turnin = FUREN,
        description = "Furen rewards you with a shield, Furen's Favor.",
        map = YORUS_MAP,
        turninMap = FUREN_MAP,
    }
    D[1701] = {
        level = 28, requires = 20,
        objective = "Gather the materials Furen Longbeard requires, and bring them to him in Stormwind.",
        requiredItems = {
            {6838, "Scorched Spider Fang", 1, "Leech Stalkers and Cave Stalkers at Thelgen Rock, Wetlands (50 needed)"},
            {6839, "Charred Horn", 1, "Fledgeling and Young Chimaeras, Charred Vale, Stonetalon Mountains (12 needed)"},
            {6840, "Galvanized Horn", 1, "Chimaera Matriarch, Charred Vale, Stonetalon Mountains"},
            VIAL,
        },
        providedItem = {6842, "Furen's Instructions", 1, "Given by Furen Longbeard when you accept the quest"},
        pickup = FUREN, turnin = FUREN,
        description = "The Razorfen Kraul step.",
        map = FUREN_MAP,
    }
    D[1782] = { level = 28, requires = 20, objective = "Wait for Furen Longbeard to finish your armor.", pickup = FUREN, turnin = FUREN, description = "Final step. Rewards Fire Hardened Hauberk.", map = FUREN_MAP }
    D[1824] = {
        level = 20, requires = 20,
        objective = "Deliver 5 Twitching Antennae to Ruga Ragetotem at Camp Taurajo.",
        pickup = RUGA, turnin = RUGA,
        description = "Your warrior trainer (Sorek in Orgrimmar) sends you to Ruga first. Timed: 30 minutes. The antennae come from the silithids at the Field of Giants, south of Camp Taurajo.",
        map = RUGA_MAP,
    }
    D[1825] = {
        level = 20, requires = 20,
        objective = "Speak with Thun'grim Firegaze in the Barrens.",
        pickup = RUGA, turnin = THUNGRIM,
        map = RUGA_MAP, turninMap = THUNGRIM_MAP,
    }
    D[1838] = {
        level = 30, requires = 20,
        objective = "Bring Thun'grim Firegaze 15 Smoky Iron Ingots, 10 Powdered Azurite, 10 Iron Bars and a Vial of Phlogiston.",
        requiredItems = {
            {7126, "Smoky Iron Ingot", 1, "Windshear kobolds, Windshear Crag, Stonetalon Mountains (15 needed)"},
            {7127, "Powdered Azurite", 1, "Hillsbrad Miners, Azurelode Mine, Hillsbrad Foothills (10 needed)"},
            {3575, "Iron Bar", 1, "Mining (smelted) or the Auction House (10 needed)"},
            VIAL,
        },
        pickup = THUNGRIM, turnin = THUNGRIM,
        description = "The Razorfen Kraul step.",
        map = THUNGRIM_MAP,
    }
    D[1848] = { level = 30, requires = 20, objective = "Wait for Thun'grim Firegaze to finish your armor.", pickup = THUNGRIM, turnin = THUNGRIM, description = "Final step. Rewards Brutal Hauberk.", map = THUNGRIM_MAP }

    XP[1701] = 2300
    XP[1838] = 3650
    XP[1848] = 3050
end







do
    local d = FDJ.DB and FDJ.DB["The Drowned City"]
    if d and type(d.bosses) == "table" then
        d.fullItemsTBD = true
        local LOOT = {
            ["Zul'Alai"] = {
                { 274599, "Oathbound Bracers", "Wrist, Leather", 3 },
                { 274598, "Bloodslash Axe", "One-Hand, Axe", 3 },
                { 274600, "Berserker Shackles", "Wrist, Mail", 3 },
            },
            ["Var'Taka"] = {
                { 274602, "Brinebelly Leggings", "Legs, Leather", 3 },
                { 274601, "Harpoon of Command", "Two-Hand, Polearm", 3 },
                { 274613, "Priestess Cloak", "Back", 3 },
            },
            ["Captain Dreadrise"] = {
                { 274604, "Frosty Blunderbuss", "Ranged, Gun", 3 },
                { 274605, "Briny Sash", "Waist, Cloth", 3 },
                { 274603, "Dreadfrost Saber", "Main Hand, Sword", 3 },
            },
            ["Deathless Marrow"] = {
                { 274606, "Bloodspine Staff", "Two-Hand, Staff", 3 },
                { 274614, "Knucklebone Ring", "Finger", 3 },
                { 274607, "Viscera Spaulders", "Shoulder, Mail", 3 },
            },
            ["Primeval Elemental"] = {
                { 274612, "Waterlogged Burial Shroud", "Back", 3 },
                { 274611, "Robe of the Drowned", "Chest, Cloth", 3 },
                { 274615, "Heart of the Primeval", "Trinket", 3 },
            },
            ["Min'loth the Serpent"] = {
                { 274610, "Ritual-Binder's Gloves", "Hands, Leather", 3 },
                { 274608, "Maw of Min'loth", "Off Hand, Shield", 3 },
                { 274609, "Serpentbane Crown", "Head, Mail", 3 },
            },
        }




        local PROBABLE = {

        }
        local have = false
        for _, b in ipairs(d.bosses) do
            if b.name == "Primeval Elemental" then have = true end
        end
        if not have then
            for i, b in ipairs(d.bosses) do
                if b.name == "Deathless Marrow" then
                    table.insert(d.bosses, i + 1, {
                        name = "Primeval Elemental",
                        portraitNpcID = 270887,
                        aliases = { "Primeval Elemental" },
                        description = "Fought together with Deathless Marrow.",
                        loot = {},
                    })
                    break
                end
            end
        end
        for _, b in ipairs(d.bosses) do
            for _, item in ipairs(LOOT[b.name] or {}) do
                b.loot = b.loot or {}
                local dup = false
                for _, listed in ipairs(b.loot) do
                    if listed[2] == item[2] then dup = true end
                end
                if not dup then table.insert(b.loot, item) end
            end
            if PROBABLE[b.name] and not b.probableLoot then b.probableLoot = PROBABLE[b.name] end
        end


        if FDJ.SHARED_BY_BOSS then
            local byBoss = FDJ.SHARED_BY_BOSS["The Drowned City"] or {}
            FDJ.SHARED_BY_BOSS["The Drowned City"] = byBoss
            for _, boss in ipairs(d.bosses) do
                if not boss.trash and not boss.recipeTab and not boss.fdjDungeon then
                    local list = byBoss[boss.name] or {}
                    byBoss[boss.name] = list
                    local have = false
                    for _, item in ipairs(list) do
                        if tonumber(item[1]) == 271718 then have = true end
                    end
                    if not have then
                        list[#list + 1] = { 271718, "Linken's Boots of Iron", "Feet, Mail", 3 }
                    end
                end
            end
        end
    end
    if FDJ.BOSS_LEVELS then
        FDJ.BOSS_LEVELS["The Drowned City"] = FDJ.BOSS_LEVELS["The Drowned City"] or {}
        local levels = FDJ.BOSS_LEVELS["The Drowned City"]
        levels["Zul'Alai"] = "37"
        levels["Var'Taka"] = "38"
        levels["Captain Dreadrise"] = "38"
        levels["Deathless Marrow"] = "39"
        levels["Primeval Elemental"] = "38"
        levels["Gill"] = "38"
        levels["Umbra"] = "38"
        levels["\"Pyromancer\" Braxton"] = "38"
        levels["Min'loth the Serpent"] = "40"
    end
end







do
    local RANATH = { mapID = 1416, x = 0.178, y = 0.660, label = "Ranath Nightstride — Dalaran", targetName = "Ranath Nightstride", detail = "Ranath Nightstride, in the inn in Dalaran, Alterac Mountains" }
    FDJ.QUEST_START_MAPS[96771] = RANATH
    for _, quest in ipairs((FDJ.DB["Krol'dok Stronghold"] and FDJ.DB["Krol'dok Stronghold"].quests) or {}) do
        if quest.id == 96771 then quest.turninMap = RANATH end
    end
    FDJ.QUEST_SHAREABILITY_AUDIT[96771] = true



    local ASHE = { mapID = 2548, x = 0.666, y = 0.810, label = "Ashe Amberhall — Farholde Keep, Riverglades", targetName = "Ashe Amberhall" }
    local AT_ASHE = "Ashe Amberhall, Farholde Keep, Riverglades"
    FDJ.QUEST_PREREQ_CHAINS[94984] = {
        { id = 94879, name = "Scraps of Knowledge" },
        { id = 94881, name = "Curious Trinkets" },
        { id = 94907, name = "A Small Favor" },
    }
    FDJ.QUEST_PREREQ_DETAILS[94879] = {
        level = 40, requires = 36,
        objective = "Collect 5 Twilight Pages from within Sunnyglade for Ashe Amberhall in Farholde Keep.",
        pickup = AT_ASHE, turnin = AT_ASHE, map = ASHE, turninMap = ASHE,
        requiredItems = { {266424, "Twilight Page", 1, "From the Twilight's Hammer in Sunnyglade (5 needed)"} },
        note = "Done alongside Curious Trinkets.",
    }
    FDJ.QUEST_PREREQ_DETAILS[94881] = {
        level = 38, requires = 36,
        objective = "Retrieve 25 Twilight Charms from Twilight Shadowmancers and Twilight Neophytes in Sunnyglade for Ashe Amberhall in Farholde Keep.",
        pickup = AT_ASHE, turnin = AT_ASHE, map = ASHE, turninMap = ASHE,
        requiredItems = { {266425, "Twilight Charm", 1, "Dropped by Twilight Shadowmancers and Twilight Neophytes in Sunnyglade (25 needed)"} },
        note = "Done alongside Scraps of Knowledge.",
    }




    FDJ.QUEST_PREREQ_CHAINS[94981] = { { id = 94980, name = "Krol'dok Moulding" } }
    FDJ.QUEST_PREREQ_CHAINS[94974] = { { id = 94973, name = "Krol'dok Moulding" } }
    FDJ.QUEST_PREREQ_DETAILS[94980] = {
        level = 41, requires = 38, startsInDungeon = true,
        objective = "Find someone in Farholde Keep who may know about the mould.",
        pickup = "Krol'dok Moulding, dropped by Tunk in Krol'dok Stronghold",
        startItem = {267138, "Krol'dok Moulding", 1, "Dropped by Tunk, at the forge beside War Handler Ashka in Krol'dok Stronghold; everyone in the group can loot it"},
        turnin = "Alphonse Dumas, Farholde Keep, Riverglades (64.4, 82.0)", turninMap = { mapID = 2548, x = 0.644, y = 0.820, label = "Alphonse Dumas — Farholde Keep, Riverglades", targetName = "Alphonse Dumas" },
    }
    FDJ.QUEST_PREREQ_DETAILS[94973] = {
        level = 41, requires = 38, startsInDungeon = true,
        objective = "Find someone in Rog'mar who may know about the mould.",
        pickup = "Krol'dok Moulding, dropped by Tunk in Krol'dok Stronghold",
        startItem = {267137, "Krol'dok Moulding", 1, "Dropped by Tunk, at the forge beside War Handler Ashka in Krol'dok Stronghold; everyone in the group can loot it"},
        turnin = "Kreza Darkthorn, Rog'mar, Riverglades (59.8, 46.0)", turninMap = { mapID = 2548, x = 0.598, y = 0.460, label = "Kreza Darkthorn — Rog'mar, Riverglades", targetName = "Kreza Darkthorn" },
    }




    local KD_RIFTAN = { mapID = 2548, x = 0.306, y = 0.490, label = "Sergeant Riftan — Farholde Lookouts, Twilight's Shroud", targetName = "Sergeant Riftan" }


    FDJ.QUEST_PREREQ_CHAINS[94998] = {
        { id = 94890, name = "Bring Me His Head" },
        { id = 94983, name = "Twilight Mementos" },
        { id = 94997, name = "Lingering Essence" },
    }
    FDJ.QUEST_PREREQ_DETAILS[94890] = {
        level = 46, requires = 38,
        objective = "Defeat Overlord Kilgar within the Twilight's Shroud and bring his head to Sergeant Riftan.",
        pickup = "Farholde Keep, Riverglades (giver not known yet)",
        turnin = "Sergeant Riftan, Farholde Keep, Riverglades",
        requiredItems = { {265837, "Kilgar's Head", 1, "From Overlord Kilgar in the Twilight's Shroud, Riverglades"} },
        note = "Handing it in to Sergeant Riftan unlocks Twilight Mementos.",
    }
    FDJ.QUEST_PREREQ_DETAILS[94983] = {
        level = 42, requires = 38,
        note = "Unlocked by handing in Bring Me His Head to Sergeant Riftan.",
        objective = "Collect 8 Twilight Bangles from the Twilight's Hammer in Krol'dok Stronghold.",
        pickup = "Sergeant Riftan, Farholde Lookouts, Twilight's Shroud, Riverglades (30.6, 49.0)",
        turnin = "Sergeant Riftan, Farholde Lookouts, Twilight's Shroud, Riverglades",
        map = KD_RIFTAN, turninMap = KD_RIFTAN,
        requiredItems = { {267234, "Twilight Bangle", 1, "Dropped by the Twilight's Hammer cultists in Krol'dok Stronghold (8 needed)"} },
    }
    FDJ.QUEST_PREREQ_DETAILS[94997] = {
        level = 42, requires = 38,
        objective = "Bring the Satchel of Cursed Mementos to Ashe Amberhall in Farholde Keep.",
        pickup = "Sergeant Riftan, Farholde Lookouts, Twilight's Shroud, Riverglades (30.6, 49.0)", map = KD_RIFTAN,
        turnin = AT_ASHE, turninMap = ASHE,
        providedItem = {268035, "Satchel of Cursed Mementos", 1, "Given when you accept the quest"},
    }
    FDJ.QUEST_START_MAPS[94998] = ASHE


    FDJ.FOREVER_QUEST_XP_FALLBACK[94879] = 3150
    FDJ.FOREVER_QUEST_XP_FALLBACK[94881] = 2850
    FDJ.FOREVER_QUEST_XP_FALLBACK[94980] = 3300
    FDJ.FOREVER_QUEST_XP_FALLBACK[94973] = 3300
    FDJ.FOREVER_QUEST_XP_FALLBACK[94981] = 3300
    FDJ.FOREVER_QUEST_XP_FALLBACK[94974] = 3300
    FDJ.FOREVER_QUEST_XP_FALLBACK[94890] = 5050
    FDJ.FOREVER_QUEST_XP_FALLBACK[94997] = 3450
    FDJ.FOREVER_QUEST_XP_FALLBACK[94998] = 3450
    FDJ.FOREVER_QUEST_XP_FALLBACK[96772] = 14400
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[94980] = 5500
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[94973] = 5500
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[94997] = 5500
    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[94890] = { items = { {275046, "Twilight Overlord Drape", 2}, {275049, "Farholde Bastion", 2} }, choice = true }
    for _, quest in ipairs((FDJ.DB["Krol'dok Stronghold"] and FDJ.DB["Krol'dok Stronghold"].quests) or {}) do
        if quest.id == 94983 then quest.hideFromMainList = true end
    end
    FDJ.QUEST_PREREQ_DETAILS[94907] = {
        objective = "Summon a Twilight's Thrall from a conduit within the Twilight's Shroud and capture it with Amberhall's Soulstone.",
        pickup = AT_ASHE, turnin = AT_ASHE, map = ASHE, turninMap = ASHE,
        providedItem = {0, "Amberhall's Soulstone", 1, "Given by Ashe Amberhall when you accept the quest"},
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[94968] = 11500
    FDJ.FOREVER_QUEST_XP_FALLBACK[94972] = 11050
    FDJ.FOREVER_QUEST_XP_FALLBACK[94975] = 8200
    FDJ.FOREVER_QUEST_XP_FALLBACK[94982] = 11500
    FDJ.FOREVER_QUEST_XP_FALLBACK[94983] = 10200
    FDJ.FOREVER_QUEST_XP_FALLBACK[94984] = 11050
    FDJ.FOREVER_QUEST_XP_FALLBACK[96771] = 11500
    FDJ.FOREVER_QUEST_XP_FALLBACK[94907] = 3750
end






do
    local ROGMAR = {
        mapID = 2548, x = 0.594, y = 0.455,
        label = "Krom'rosh — Rog'mar, Riverglades", targetName = "Krom'rosh",
        detail = "Eye of Mugg (Horde): pick up and return to Krom'rosh at Rog'mar."
    }
    local FARHOLDE = {
        mapID = 2548, x = 0.666, y = 0.810,
        label = "Commander Demar Brant — Farholde Keep, Riverglades", targetName = "Demar Brant",
        detail = "Eye of Mugg (Alliance): pick up and return to Commander Demar Brant at Farholde Keep."
    }
    local DAGROSH = {
        mapID = 2548, x = 0.334, y = 0.380,
        label = "Da'grosh — Twilight's Shroud, Riverglades", targetName = "Da'grosh"
    }
    local RIFTAN = {
        mapID = 2548, x = 0.306, y = 0.490,
        label = "Sergeant Riftan — Farholde Lookouts, Twilight's Shroud", targetName = "Sergeant Riftan"
    }
    FDJ.QUEST_START_MAPS[94968] = ROGMAR
    FDJ.QUEST_START_MAPS[94982] = FARHOLDE
    FDJ.QUEST_START_MAPS[94768] = DAGROSH
    FDJ.QUEST_START_MAPS[94890] = RIFTAN








    local HORDE_TWILIGHT = {
        { id = 94744, name = "The Wayward Warrior" },
        { id = 94748, name = "Break Their Chains" },
        { id = 94745, name = "Carving a Path" },
        { id = 95432, name = "Rise Up!" },
        { id = 94768, name = "Bring Me His Head" },
    }
    local function hordeChain(withMissive)
        local chain = {}
        for i, step in ipairs(HORDE_TWILIGHT) do chain[i] = { id = step.id, name = step.name } end
        if withMissive then chain[#chain + 1] = { id = 95278, name = "It Is Time, Brother..." } end
        return chain
    end
    local TRANGUL = {
        mapID = 2548, x = 0.594, y = 0.440,
        label = "Tran'gul — Rog'mar, Riverglades", targetName = "Tran'gul"
    }
    FDJ.QUEST_PREREQ_CHAINS[94968] = hordeChain(true)
    FDJ.QUEST_PREREQ_CHAINS[94972] = hordeChain(true)
    FDJ.QUEST_PREREQ_CHAINS[94975] = hordeChain(false)
    FDJ.QUEST_START_MAPS[94972] = TRANGUL
    FDJ.QUEST_START_MAPS[94975] = DAGROSH
    FDJ.QUEST_START_MAPS[94983] = RIFTAN
    FDJ.QUEST_PREREQ_DETAILS[94744] = {
        pickup = "Riverglades (giver not known yet)",
        objective = "The first step of the Horde's fight against the Twilight's Hammer in the Riverglades.",
        turnin = "Riverglades (not known yet)",
    }
    FDJ.QUEST_PREREQ_DETAILS[94748] = {
        objective = "Rescue 5 Rog'mar Scouts within the Twilight's Shroud for Da'grosh.",
        pickup = "Da'grosh, Twilight's Shroud, Riverglades (33.4, 38.0)",
        turnin = "Da'grosh, Twilight's Shroud, Riverglades (33.4, 38.0)",
        map = DAGROSH, turninMap = DAGROSH,
    }
    FDJ.QUEST_PREREQ_DETAILS[94745] = {
        pickup = "Riverglades (giver not known yet)",
        objective = "Done alongside Break Their Chains and Rise Up!.",
        turnin = "Riverglades (not known yet)",
    }
    FDJ.QUEST_PREREQ_DETAILS[95432] = {
        pickup = "Riverglades (giver not known yet)",
        objective = "Done alongside Break Their Chains and Carving a Path.",
        turnin = "Riverglades (not known yet)",
    }
    FDJ.QUEST_PREREQ_DETAILS[95278] = {
        objective = "Deliver the missive to Krom'rosh at Rog'mar.",
        pickup = "Da'grosh, Twilight's Shroud, Riverglades (probably)",
        turnin = "Krom'rosh, Rog'mar, Riverglades (59.4, 45.5)",
        turninMap = ROGMAR,
        note = "Handing it in opens Eye of Mugg (Krom'rosh) and Tome of Twilight (Tran'gul).",
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[94744] = 360
    FDJ.FOREVER_QUEST_XP_FALLBACK[94748] = 3750
    FDJ.FOREVER_QUEST_XP_FALLBACK[94745] = 3750
    FDJ.FOREVER_QUEST_XP_FALLBACK[95432] = 1800
    FDJ.FOREVER_QUEST_XP_FALLBACK[95278] = 390
    FDJ.QUEST_PREREQ_CHAINS[94982] = { { id = 94890, name = "Bring Me His Head" } }
    FDJ.QUEST_PREREQ_DETAILS[94768] = {
        level = 46, requires = 38,
        objective = "Defeat Overlord Kilgar within the Twilight's Shroud and bring his head to Da'grosh.",
        pickup = "Da'grosh, Twilight's Shroud, Riverglades (33.4, 38.0)",
        turnin = "Da'grosh, Twilight's Shroud, Riverglades (33.4, 38.0)",
        map = DAGROSH, turninMap = DAGROSH,
        requiredItems = { {265837, "Kilgar's Head", 1, "From Overlord Kilgar at Twilight's Shroud"} },
        note = "Horde version. Handing it in to Da'grosh opens A Token of Vengeance."
    }

    local ally = FDJ.QUEST_PREREQ_DETAILS[94890] or {}
    ally.pickup = "Sergeant Riftan, Farholde Lookouts, Twilight's Shroud, Riverglades (30.6, 49.0)"
    ally.turnin = "Sergeant Riftan, Farholde Lookouts, Twilight's Shroud, Riverglades (30.6, 49.0)"
    ally.map = RIFTAN
    ally.turninMap = RIFTAN
    ally.note = "Alliance version. Return Kilgar's Head to Sergeant Riftan; completing this step unlocks Eye of Mugg."
    FDJ.QUEST_PREREQ_DETAILS[94890] = ally
    FDJ.FOREVER_QUEST_XP_FALLBACK[94768] = 5050

    for _, quest in ipairs((FDJ.DB["Krol'dok Stronghold"] and FDJ.DB["Krol'dok Stronghold"].quests) or {}) do
        if quest.id == 94968 then
            quest.startMap = ROGMAR
            quest.turninMap = ROGMAR
        elseif quest.id == 94982 then
            quest.startMap = FARHOLDE
            quest.turninMap = FARHOLDE
        elseif quest.id == 94972 then
            quest.startMap = TRANGUL
            quest.turninMap = TRANGUL
        elseif quest.id == 94975 then
            quest.startMap = DAGROSH
            quest.turninMap = DAGROSH
        elseif quest.id == 94983 then
            quest.startMap = RIFTAN
            quest.turninMap = RIFTAN
        elseif quest.id == 94998 then
            quest.turninMap = { mapID = 2548, x = 0.662, y = 0.832, label = "Melanie Sable — Farholde Keep, Riverglades", targetName = "Melanie Sable" }
        elseif quest.id == 94981 then
            quest.startMap = { mapID = 2548, x = 0.644, y = 0.820, label = "Alphonse Dumas — Farholde Keep, Riverglades", targetName = "Alphonse Dumas" }
            quest.turninMap = quest.startMap
        elseif quest.id == 94974 then
            quest.startMap = { mapID = 2548, x = 0.598, y = 0.460, label = "Kreza Darkthorn — Rog'mar, Riverglades", targetName = "Kreza Darkthorn" }
            quest.turninMap = quest.startMap
        elseif quest.id == 94984 then
            quest.startMap = { mapID = 2548, x = 0.666, y = 0.810, label = "Ashe Amberhall — Farholde Keep, Riverglades", targetName = "Ashe Amberhall" }
            quest.turninMap = quest.startMap
        end
    end
end












do
    local M = 2548
    local BRANT = { mapID = M, x = 0.666, y = 0.810, label = "Demar Brant — Farholde Keep, Riverglades", targetName = "Demar Brant" }
    local ASHE = { mapID = M, x = 0.666, y = 0.810, label = "Ashe Amberhall — Farholde Keep, Riverglades", targetName = "Ashe Amberhall" }
    local RIFTAN = { mapID = M, x = 0.306, y = 0.490, label = "Sergeant Riftan — Farholde Lookouts, Twilight's Shroud", targetName = "Sergeant Riftan" }
    local KROM = { mapID = M, x = 0.594, y = 0.456, label = "Krom'rosh — Rog'mar, Riverglades", targetName = "Krom'rosh" }
    local TRANGUL = { mapID = M, x = 0.594, y = 0.440, label = "Tran'gul — Rog'mar, Riverglades", targetName = "Tran'gul" }
    local DAGROSH = { mapID = M, x = 0.334, y = 0.380, label = "Da'grosh — Twilight's Shroud, Riverglades", targetName = "Da'grosh" }
    local CRAGROG = { mapID = M, x = 0.274, y = 0.370, label = "Crag'rog — Riverglades", targetName = "Crag'rog" }
    local CLUGFIST = { mapID = M, x = 0.644, y = 0.148, label = "Clugfist — Riverglades", targetName = "Clugfist" }
    local AT_BRANT = "Demar Brant, Farholde Keep, Riverglades (66.6, 81.0)"
    local AT_ASHE = "Ashe Amberhall, Farholde Keep, Riverglades (66.6, 81.0)"
    local AT_RIFTAN = "Sergeant Riftan, Farholde Lookouts, Twilight's Shroud, Riverglades (30.6, 49.0)"
    local AT_KROM = "Krom'rosh, Rog'mar, Riverglades (59.4, 45.6)"
    local AT_DAGROSH = "Da'grosh, Twilight's Shroud, Riverglades (33.4, 38.0)"
    local function Copy(list)
        local out = {}
        for i, s in ipairs(list) do out[i] = { id = s.id, name = s.name } end
        return out
    end


    local RIFTAN_LINE = {
        { id = 94886, name = "The Western Front" },
        { id = 94888, name = "No Soldier Left Behind" },
        { id = 94889, name = "Carving a Path" },
        { id = 94890, name = "Bring Me His Head" },
    }
    local eye = { { id = 94879, name = "Scraps of Knowledge" } }
    for _, s in ipairs(RIFTAN_LINE) do eye[#eye + 1] = { id = s.id, name = s.name } end
    eye[#eye + 1] = { id = 94891, name = "News to Farholde" }
    FDJ.QUEST_PREREQ_CHAINS[94982] = eye
    local curios = { { id = 94877, name = "Saving Sunnyglade" } }
    for _, s in ipairs(RIFTAN_LINE) do curios[#curios + 1] = { id = s.id, name = s.name } end
    curios[#curios + 1] = { id = 94983, name = "Twilight Mementos" }
    curios[#curios + 1] = { id = 94997, name = "Lingering Essence" }
    FDJ.QUEST_PREREQ_CHAINS[94998] = curios

    local D = FDJ.QUEST_PREREQ_DETAILS
    D[94879] = D[94879] or {}
    D[94879].note = "First step of the Eye of Mugg chain (Mobalytics). Done alongside Curious Trinkets; what leads from Ashe's quests to The Western Front is not confirmed yet."
    D[94877] = {
        level = 40, requires = 36,
        objective = "Defeat 8 Twilight Raiders, 8 Twilight Shadowmancers and 8 Twilight Neophytes within Sunnyglade for Demar Brant.",
        pickup = AT_BRANT, turnin = AT_BRANT, map = BRANT, turninMap = BRANT,
        note = "First step of the Twilight Mementos chain (Mobalytics); what leads from it to The Western Front is not confirmed yet.",
    }
    D[94886] = {
        level = 44, requires = 38,
        objective = "Find Sergeant Riftan near the Twilight's Shroud to the west.",
        pickup = AT_BRANT, turnin = AT_RIFTAN, map = BRANT, turninMap = RIFTAN,
    }
    D[94888] = {
        level = 44, requires = 38,
        objective = "Rescue 5 Farholde Scouts within the Twilight's Shroud for Sergeant Riftan.",
        pickup = AT_RIFTAN, turnin = AT_RIFTAN, map = RIFTAN, turninMap = RIFTAN,
        note = "Done alongside Carving a Path.",
    }
    D[94889] = {
        level = 44, requires = 38,
        objective = "Defeat 8 Twilight Fanatics, 8 Twilight Corrupters and 8 Twilight Champions within the Twilight's Shroud for Sergeant Riftan.",
        pickup = AT_RIFTAN, turnin = AT_RIFTAN, map = RIFTAN, turninMap = RIFTAN,
        note = "Done alongside No Soldier Left Behind.",
    }
    if D[94890] then D[94890].note = "Alliance version. Handing it in to Sergeant Riftan gives News to Farholde and opens Twilight Mementos." end
    D[94891] = {
        level = 46, requires = 38,
        objective = "Return to Ashe Amberhall in Farholde Keep.",
        pickup = "Given when you hand in Bring Me His Head to Sergeant Riftan",
        turnin = AT_ASHE, turninMap = ASHE,
        providedItem = {265837, "Kilgar's Head", 1, "Given when you accept the quest"},
        note = "Handing it in opens Eye of Mugg (Demar Brant).",
    }












    local horde = {
        { id = 93786, name = "A Message in Blood" },
        { id = 93787, name = "Food for the Taking" },
        { id = 94483, name = "Show Them How It's Done" },
        { id = 94672, name = "Encroaching Twilight" },
        { id = 94680, name = "Twilight Missives" },
        { id = 94727, name = "Digging for Answers" },
        { id = 95417, name = "The Purple Ones" },
        { id = 95601, name = "The Purple Ones" },
        { id = 95602, name = "Sickening Lights" },
        { id = 95427, name = "Twilight No More!" },
        { id = 95418, name = "Spread the Word" },
        { id = 95420, name = "Land of Giants" },
        { id = 95424, name = "Might Makes Right" },
        { id = 95425, name = "Unworthy Champion" },
        { id = 95428, name = "Clugfist's Decree" },
        { id = 94744, name = "The Wayward Warrior" },
        { id = 94748, name = "Break Their Chains" },
        { id = 94745, name = "Carving a Path" },
        { id = 95431, name = "Rumblings of Discontent" },
        { id = 95432, name = "Rise Up!" },
        { id = 94768, name = "Bring Me His Head" },
    }
    local withMissive = Copy(horde)
    withMissive[#withMissive + 1] = { id = 95278, name = "It Is Time, Brother..." }
    FDJ.QUEST_PREREQ_CHAINS[94968] = withMissive
    FDJ.QUEST_PREREQ_CHAINS[94972] = Copy(withMissive)
    FDJ.QUEST_PREREQ_CHAINS[94975] = Copy(horde)
    D[94483] = {
        level = 42, requires = 38,
        objective = "Slay 8 Farholde Priests and 12 Farholde Scouts south of the river.",
        pickup = "Riverglades (giver not known yet)", turnin = "Riverglades (not known yet)",
        note = "Needed before the Twilight's Hammer quests (a player's report on the Discord).",
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[94483] = 3000
    D[94672] = {
        level = 41, requires = 36,
        objective = "Defeat 8 Twilight Raiders, 8 Twilight Shadowmancers and 8 Twilight Neophytes within Sunnyglade for Tran'gul in Rog'mar.",
        pickup = "Tran'gul, Rog'mar, Riverglades (59.4, 44.0)", turnin = "Tran'gul, Rog'mar, Riverglades",
        map = TRANGUL, turninMap = TRANGUL,
        note = "Start of the Horde chains (Mobalytics); what leads from it to Clugfist's Decree is not confirmed yet.",
    }
    D[95428] = {
        level = 41, requires = 36,
        objective = "Report to Krom'rosh in Rog'mar.",
        pickup = "Clugfist, Riverglades (64.4, 14.8)", turnin = AT_KROM,
        map = CLUGFIST, turninMap = KROM,
    }
    D[94744] = {
        level = 43, requires = 38,
        objective = "Find Da'grosh in the hills west of Rog'mar.",
        pickup = AT_KROM, turnin = AT_DAGROSH, map = KROM, turninMap = DAGROSH,
    }
    D[94748] = D[94748] or {}
    D[94748].level, D[94748].requires = 44, 38
    D[94748].note = "Done alongside Carving a Path and Rise Up!."
    D[94745] = {
        level = 44, requires = 38,
        objective = "Defeat 8 Twilight Fanatics, 8 Twilight Corrupters and 8 Twilight Champions within the Twilight's Shroud for Da'grosh.",
        pickup = AT_DAGROSH, turnin = AT_DAGROSH, map = DAGROSH, turninMap = DAGROSH,
        note = "Done alongside Break Their Chains and Rise Up!.",
    }
    D[95432] = {
        level = 43, requires = 36,
        objective = "Recruit 5 Ogre Miners.",
        pickup = "Crag'rog, Riverglades (27.4, 37.0)", turnin = "Crag'rog, Riverglades (27.4, 37.0)",
        map = CRAGROG, turninMap = CRAGROG,
        note = "Done alongside Break Their Chains and Carving a Path.",
    }
    D[95278] = D[95278] or {}
    D[95278].level, D[95278].requires = 45, 38
    D[95278].pickup = AT_DAGROSH
    D[95278].map = DAGROSH
    D[95278].providedItem = {0, "Blood and Battle", 1, "Given by Da'grosh when you accept the quest"}

    local XP = FDJ.FOREVER_QUEST_XP_FALLBACK
    XP[94877] = 3150; XP[94886] = 380; XP[94888] = 3750; XP[94889] = 3750; XP[94891] = 4050
    XP[94672] = 3300; XP[95428] = 330





    local CLUBTOE = { mapID = M, x = 0.500, y = 0.470, label = "Clubtoe — Sunnyglade cave, Riverglades", targetName = "Clubtoe" }
    local BRUTE = { mapID = M, x = 0.492, y = 0.467, label = "Twilight Brute — Sunnyglade cave, Riverglades", targetName = "Twilight Brute" }
    local AT_TRANGUL = "Tran'gul, Rog'mar, Riverglades (59.5, 44.0)"
    local AT_CLUBTOE = "Clubtoe, in the cave under Sunnyglade, Riverglades (50.0, 47.0; the cave's entrance is near 50, 46)"
    local AT_BRUTE = "Twilight Brute, in the cave under Sunnyglade, Riverglades (49.2, 46.7)"
    local AT_CLUGFIST = "Clugfist, Bolder'ok, Riverglades (64.4, 14.8)"
    local AT_CRAGROG = "Crag'rog, Riverglades (27.4, 37.0)"
    D[93786] = {
        level = 36, requires = 35,
        objective = "Slay 12 Meadowsbrook Farmhands, then return to Krom'rosh with news of your success.",
        pickup = AT_KROM, turnin = AT_KROM, map = KROM, turninMap = KROM,
        note = "Done alongside Food for the Taking.",
    }
    D[93787] = {
        level = 36, requires = 36,
        objective = "Steal 6 Feed Satchels from the Alliance farm in Meadowsbrook then return to Krom'rosh.",
        pickup = AT_KROM, turnin = AT_KROM, map = KROM, turninMap = KROM,
        note = "Done alongside A Message in Blood. Krom'rosh offers Show Them How It's Done once this is handed in.",
    }
    D[94483].level, D[94483].requires = 39, 36
    D[94483].pickup, D[94483].turnin = AT_KROM, AT_KROM
    D[94483].map, D[94483].turninMap = KROM, KROM
    D[94672].note = "Done alongside Twilight Missives; Tran'gul gives Digging for Answers once both are handed in."
    D[94680] = {
        level = 41, requires = 36,
        objective = "Retrieve 3 Twilight Missives from Twilight Shadowmancers in Sunnyglade for Tran'gul in Rog'mar.",
        pickup = AT_TRANGUL, turnin = AT_TRANGUL, map = TRANGUL, turninMap = TRANGUL,
        note = "Done alongside Encroaching Twilight; Tran'gul gives Digging for Answers once both are handed in.",
    }
    D[94727] = {
        level = 40, requires = 36,
        objective = "Convince a Twilight's Hammer miner in Sunnyglade to divulge their secrets.",
        pickup = AT_TRANGUL, turnin = AT_CLUBTOE, map = TRANGUL, turninMap = CLUBTOE,
    }
    D[95417] = {
        level = 40, requires = 36,
        objective = "Find missing ogres in the caves beneath Sunnyglade for Clubtoe.",
        pickup = AT_CLUBTOE, turnin = AT_BRUTE, map = CLUBTOE, turninMap = BRUTE,
        note = "The first of two quests called The Purple Ones. Clubtoe gives Sickening Lights at the same time.",
    }
    D[95601] = {
        level = 40, requires = 36,
        objective = "Kill 5 Empowered Brutes and 10 Twilight Ritualists then return to Clubtoe in Sunnyglade.",
        pickup = AT_BRUTE, turnin = AT_CLUBTOE, map = BRUTE, turninMap = CLUBTOE,
        note = "The second of two quests called The Purple Ones. Done alongside Sickening Lights; both are needed for Twilight No More!.",
    }
    D[95602] = {
        level = 40, requires = 36,
        objective = "Destroy 5 Twilight Ritual Circles found throughout the caves underneath Sunnyglade.",
        pickup = AT_CLUBTOE, turnin = AT_CLUBTOE, map = CLUBTOE, turninMap = CLUBTOE,
        note = "Done alongside The Purple Ones; both are needed for Twilight No More!.",
    }
    D[95427] = {
        level = 41, requires = 36,
        objective = "Kill Chogg'Zac in the Sunnyglade cave and collect their heads for Clubtoe.",
        pickup = AT_CLUBTOE, turnin = AT_CLUBTOE, map = CLUBTOE, turninMap = CLUBTOE,
        requiredItems = { {265750, "Chogg's Head", 1, "From Chogg'Zac in the Sunnyglade cave"}, {265751, "Zac's Head", 1, "From Chogg'Zac in the Sunnyglade cave"} },
        note = "Chogg'Zac is an elite.",
    }
    D[95418] = {
        level = 40, requires = 36,
        objective = "Deliver the head of Chogg to Tran'gul in Rog'mar.",
        pickup = AT_CLUBTOE, turnin = AT_TRANGUL, map = CLUBTOE, turninMap = TRANGUL,
    }
    D[95420] = {
        level = 40, requires = 36,
        objective = "Deliver Chogg's head to the ogre city to the north.",
        pickup = AT_TRANGUL, turnin = AT_CLUGFIST, map = TRANGUL, turninMap = CLUGFIST,
    }
    D[95424] = {
        level = 41, requires = 36,
        objective = "Kill 7 Twilight Maulers and 7 Twilight Firecallers for Clugfist in Bolder'ok.",
        pickup = AT_CLUGFIST, turnin = AT_CLUGFIST, map = CLUGFIST, turninMap = CLUGFIST,
        note = "Done alongside Unworthy Champion; both are needed for Clugfist's Decree.",
    }
    D[95425] = {
        level = 42, requires = 36,
        objective = "Collect Skullthumper from Klunk for Clugfist in Bolder'ok.",
        pickup = AT_CLUGFIST, turnin = AT_CLUGFIST, map = CLUGFIST, turninMap = CLUGFIST,
        note = "Done alongside Might Makes Right; both are needed for Clugfist's Decree. Skullthumper is reported to drop near 75, 27.",
    }
    D[94748].note = "Done alongside Carving a Path; both are needed for Bring Me His Head."
    D[94745].note = "Done alongside Break Their Chains; both are needed for Bring Me His Head."
    D[95431] = {
        level = 41, requires = 38,
        objective = "Look for the Bolder'ok ogre in the nearby cave.",
        pickup = AT_DAGROSH, turnin = AT_CRAGROG, map = DAGROSH, turninMap = CRAGROG,
        note = "Leads to Rise Up!. Not confirmed as needed for Bring Me His Head: a player reports it, the quest databases don't list it.",
    }
    D[95432].note = "Comes after Rumblings of Discontent. Not confirmed as needed for Bring Me His Head: a player reports it, the quest databases don't list it."
    D[95278].providedItem = {268705, "Blood and Battle", 1, "Given by Da'grosh when you accept the quest"}
    XP[93786] = 2800; XP[93787] = 2800; XP[94680] = 2450; XP[94727] = 320
    XP[95417] = 320; XP[95601] = 3150; XP[95602] = 3150; XP[95427] = 3300
    XP[95418] = 320; XP[95420] = 320; XP[95424] = 3300; XP[95425] = 3450; XP[95431] = 330
end






FDJ.QUEST_SHAREABILITY_AUDIT[92070] = false



do
    local NARA = { mapID = 1456, x = 0.756, y = 0.310, label = "Nara Wildmane — Elder Rise, Thunder Bluff", targetName = "Nara Wildmane" }
    local MATHRENGYL = { mapID = 1457, x = 0.354, y = 0.084, label = "Mathrengyl Bearwalker — Cenarion Enclave, Darnassus", targetName = "Mathrengyl Bearwalker" }
    local JEDIGA = { mapID = 1447, x = 0.225, y = 0.514, label = "Jediga — Valormok, Azshara", targetName = "Jediga" }
    local OGTINC = { mapID = 1447, x = 0.424, y = 0.427, label = "Ogtinc — Azshara", targetName = "Ogtinc" }
    local TRUESONG = { mapID = 1447, x = 0.118, y = 0.783, label = "Commander Truesong — Azshara", targetName = "Commander Truesong" }
    FDJ.QUEST_START_MAPS[92343] = NARA
    FDJ.QUEST_START_MAPS[92344] = MATHRENGYL
    FDJ.QUEST_START_MAPS[92069] = OGTINC
    FDJ.QUEST_PREREQ_CHAINS[92343] = { { id = 92346, name = "Beneath Nordrassil" } }
    FDJ.QUEST_PREREQ_CHAINS[92344] = { { id = 92345, name = "Beneath Nordrassil" } }
    FDJ.QUEST_PREREQ_DETAILS[92346] = {
        level = 55, requires = 45,
        objective = "Speak with Nara Wildmane on Elder Rise in Thunder Bluff.",
        pickup = "Jediga, Valormok, Azshara (22.5, 51.4)",
        turnin = "Nara Wildmane, Elder Rise, Thunder Bluff",
        map = JEDIGA, turninMap = NARA,
    }
    FDJ.QUEST_PREREQ_DETAILS[92345] = {
        level = 55, requires = 45,
        objective = "Speak with Mathrengyl Bearwalker in the Cenarion Enclave in Darnassus.",
        pickup = "Commander Truesong, Azshara (11.8, 78.3)",
        turnin = "Mathrengyl Bearwalker, Cenarion Enclave, Darnassus",
        map = TRUESONG, turninMap = MATHRENGYL,
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[92345] = 560
    FDJ.FOREVER_QUEST_XP_FALLBACK[92346] = 560
    FDJ.FOREVER_QUEST_XP_FALLBACK[92343] = 11300
    FDJ.FOREVER_QUEST_XP_FALLBACK[92344] = 11300
    FDJ.FOREVER_QUEST_XP_FALLBACK[92069] = 12400
    FDJ.FOREVER_QUEST_XP_FALLBACK[97173] = 12800
    FDJ.FOREVER_QUEST_XP_FALLBACK[97198] = 16100
    for _, quest in ipairs((FDJ.DB["Blackmaw Hold"] and FDJ.DB["Blackmaw Hold"].quests) or {}) do
        if quest.id == 92343 then quest.turninMap = NARA end
        if quest.id == 92344 then quest.turninMap = MATHRENGYL end
        if quest.id == 92069 then quest.turninMap = OGTINC end
    end
end










do
    local TIMEAR = { mapID = 1416, x = 0.154, y = 0.740, label = "Archmage Timear — Dalaran", targetName = "Archmage Timear" }
    local MULN = { mapID = 1412, x = 0.334, y = 0.225, label = "Muln Earthfury — Skywatcher Plateau, Mulgore", targetName = "Muln Earthfury" }
    local RAGEROAR = { mapID = 1447, x = 0.424, y = 0.202, label = "Gatekeeper Rageroar — Ursolan, Azshara", targetName = "Gatekeeper Rageroar" }
    local KORSA = { mapID = 1447, x = 0.629, y = 0.211, label = "Korsa — Legashi Stronghold, Azshara", targetName = "Korsa" }
    local UNELE = { mapID = 1447, x = 0.434, y = 0.174, label = "Unele — Ursolan, Azshara", targetName = "Unele" }
    local RAGEROAR_TEXT = "Gatekeeper Rageroar, Ursolan, Azshara (42.4, 20.2)"
    local GORN = "Gorn One Eye, Timbermaw Hold"


    local GORN_MAP = { mapID = 1448, x = 0.652, y = 0.026, label = "Gorn One Eye — Timbermaw Hold, Felwood", targetName = "Gorn One Eye" }
    FDJ.QUEST_START_MAPS[97173] = TIMEAR
    FDJ.QUEST_START_MAPS[97198] = MULN
    FDJ.QUEST_START_MAPS[92065] = RAGEROAR
    FDJ.QUEST_START_MAPS[92066] = { mapID = 1447, x = 0.414, y = 0.200, label = "Lorekeeper Nok — Ursolan, Azshara", targetName = "Lorekeeper Nok" }
    for _, quest in ipairs((FDJ.DB["Blackmaw Hold"] and FDJ.DB["Blackmaw Hold"].quests) or {}) do
        if quest.id == 97173 then quest.turninMap = TIMEAR end
        if quest.id == 97198 then quest.turninMap = MULN end
        if quest.id == 92070 then quest.turninMap = UNELE end
    end












    FDJ.QUEST_PREREQ_CHAINS[92065] = {
        { id = 86746, name = "The Legashi Threat" },
        { id = 86752, name = "Report to Rageroar" },
        { id = 86791, name = "Missing Blackmaw Scouts" },
        { id = 86777, name = "Master Feardred" },
        { id = 86792, name = "Thinning Their Forces" },
        { id = 86796, name = "Later, Satyr" },
        { id = 86797, name = "Return to Rageroar" },
        { id = 86798, name = "Timbermaw Reinforcements" },
        { id = 87346, name = "Chieftain Bloodmaw" },
        { id = 86814, name = "Blackmaw Counter-Offensive" },
    }
    FDJ.QUEST_PREREQ_DETAILS[86797] = {
        level = 53, requires = 47,
        objective = "Return to Gatekeeper Rageroar at Ursolan.",
        pickup = "Korsa, outside Legashi Stronghold, Azshara (62.9, 21.1)",
        turnin = RAGEROAR_TEXT,
        map = KORSA, turninMap = RAGEROAR,
    }


    local KORSA_TEXT = "Korsa, outside Legashi Stronghold, Azshara (62.9, 21.1)"
    local GRAAL = { mapID = 1447, x = 0.659, y = 0.144, label = "Graal — Legashi Stronghold, Azshara", targetName = "Graal" }
    FDJ.QUEST_PREREQ_DETAILS[86777] = {
        level = 53, requires = 47,
        objective = "Kill Master Feardred, and bring his amulet to Korsa.",
        pickup = KORSA_TEXT, turnin = KORSA_TEXT,
        map = KORSA, turninMap = KORSA,
        requiredItems = { {235334, "Feardred's Amulet", 1, "From Master Feardred"} },
    }
    FDJ.QUEST_PREREQ_DETAILS[86792] = {
        level = 54, requires = 47,
        objective = "Kill 6 Legashi Hellraisers, 4 Legashi Soulstealers, and 2 Legashi Blackguards for Korsa outside Legashi Stronghold.",
        pickup = KORSA_TEXT, turnin = KORSA_TEXT,
        map = KORSA, turninMap = KORSA,
    }
    FDJ.QUEST_PREREQ_DETAILS[86796] = {
        level = 54, requires = 47,
        objective = "Help Graal break out of Legashi Stronghold, then inform Korsa outside Legashi Stronghold.",
        pickup = "Graal, caged in Legashi Stronghold, Azshara (65.9, 14.4)",
        turnin = KORSA_TEXT,
        map = GRAAL, turninMap = KORSA,
    }

    local EKKAL_TEXT = "Ekkal, Ruins of Eldarath, Azshara (42.0, 38.9)"
    local EKKAL_MAP = { mapID = 1447, x = 0.420, y = 0.389, label = "Ekkal — Ruins of Eldarath, Azshara", targetName = "Ekkal" }
    FDJ.QUEST_PREREQ_DETAILS[86746] = {
        level = 53, requires = 47,
        objective = "Kill 5 Legashi Satyrs, 5 Legashi Rogues and 5 Legashi Hellcallers for Ekkal at the Ruins of Eldarath.",
        pickup = EKKAL_TEXT, turnin = EKKAL_TEXT,
        map = EKKAL_MAP, turninMap = EKKAL_MAP,
    }
    FDJ.QUEST_PREREQ_DETAILS[86752] = {
        level = 53, requires = 47,
        objective = "Speak with Gatekeeper Rageroar at Ursolan.",
        pickup = EKKAL_TEXT, turnin = RAGEROAR_TEXT,
        map = EKKAL_MAP, turninMap = RAGEROAR,
        note = "Needs Neutral reputation with Timbermaw Hold.",
    }
    FDJ.QUEST_PREREQ_DETAILS[86791] = {
        level = 53, requires = 47,
        objective = "Find the Blackmaw scouting party near the Legashi camps east of Ursolan.",
        pickup = RAGEROAR_TEXT, turnin = KORSA_TEXT,
        map = RAGEROAR, turninMap = KORSA,
    }
    FDJ.QUEST_PREREQ_DETAILS[86798] = {
        level = 55, requires = 47,
        objective = "Speak to Gorn One Eye in Timbermaw Hold and ask him to provide reinforcements.",
        pickup = RAGEROAR_TEXT,
        turnin = GORN,
        map = RAGEROAR, turninMap = GORN_MAP,
    }
    FDJ.QUEST_PREREQ_DETAILS[87346] = {
        level = 55, requires = 47,
        objective = "Kill Chieftain Bloodmaw and bring his mace to Gorn One Eye in Timbermaw Hold.",
        pickup = GORN,
        turnin = GORN,
        map = GORN_MAP, turninMap = GORN_MAP,
        requiredItems = { {236631, "Bloodmaw's Basher", 1, "From Chieftain Bloodmaw"} },
        note = "Chieftain Bloodmaw is in Felwood, south of Timbermaw Hold.",
    }
    FDJ.QUEST_PREREQ_DETAILS[86814] = {
        level = 55, requires = 47,
        objective = "Plant the Timbermaw War Banner at the Legashi Stronghold in Azshara. Kill Prince Halanox, report your victory to Gatekeeper Rageroar at Ursolan.",
        pickup = GORN,
        turnin = RAGEROAR_TEXT,
        map = GORN_MAP, turninMap = RAGEROAR,
        providedItem = {235518, "Timbermaw War Banner", 1, "Given by Gorn One Eye when you accept the quest"},
        note = "Elite quest: bring a group for Prince Halanox.",
    }
    local XP = FDJ.FOREVER_QUEST_XP_FALLBACK
    XP[86797] = 525; XP[86798] = 550; XP[87346] = 5650; XP[86814] = 7050
    XP[86777] = 5250; XP[86792] = 5450; XP[86796] = 5450
    XP[86746] = 5250; XP[86752] = 530; XP[86791] = 530
end





do
    local MAYENA = { mapID = 1412, x = 0.348, y = 0.222, label = "Mayena Earthseeker — Mulgore", targetName = "Mayena Earthseeker" }
    FDJ.QUEST_START_MAPS[95928] = MAYENA
    FDJ.FOREVER_QUEST_XP_FALLBACK[95928] = 17650
    FDJ.FOREVER_QUEST_XP_FALLBACK[95790] = 17650


    FDJ.FOREVER_QUEST_XP_FALLBACK[97049] = 17650
    FDJ.FOREVER_QUEST_XP_FALLBACK[95926] = 17650
    FDJ.FOREVER_QUEST_XP_FALLBACK[95924] = 17650
    FDJ.FOREVER_QUEST_XP_FALLBACK[95925] = 17650
    FDJ.QUEST_SHAREABILITY_AUDIT[95928] = true
    FDJ.QUEST_SHAREABILITY_AUDIT[97049] = true
    FDJ.QUEST_SHAREABILITY_AUDIT[95926] = true
    FDJ.QUEST_SHAREABILITY_AUDIT[95924] = true
    FDJ.QUEST_SHAREABILITY_AUDIT[95925] = false
    FDJ.QUEST_SHAREABILITY_AUDIT[95790] = false
end









do
    local PAIRS = {
        { dungeon = "Excavation Site: Wetlands", nextID = 95795, lead = { id = 95772 } },
        { dungeon = "Excavation Site: Wetlands", nextID = 95809, lead = {
            id = 95647,
            name = "Lost in the Thicket Things",
            faction = "Alliance",
            level = 31,
            requires = 24,
            pickup = "Caitlin Grassman, Menethil Harbor, Wetlands",
            objective = "Find Ardin Grassman in the Excavation Sites. Learn what happened to Ardin Grassman.",
            turnin = "Ardin Grassman, inside Excavation Site: Wetlands",
            rewardSummary = "",
            rewardItems = {},
            liveXPFallback = 4900,
        } },
        { dungeon = "Ragefire Chasm", nextID = 5724, lead = {
            id = 5722,
            name = "Searching for the Lost Satchel",
            faction = "Horde",
            level = 16,
            requires = 9,
            pickup = "Rahauro, Elder Rise, Thunder Bluff",
            objective = "Find Maur Grimtotem's corpse inside Ragefire Chasm and search it for anything of interest.",
            turnin = "Maur Grimtotem's corpse, inside Ragefire Chasm",
            note = "From the first major three-way junction, take the right-hand tunnel, follow it uphill toward the dead end, then enter the small side room on the left. Interact with Maur's corpse there.",
            rewardSummary = "",
            rewardItems = {},
            liveXPFallback = 880,
        } },
        { dungeon = "Lower Blackrock Spire", nextID = 4982, lead = {
            id = 4981,
            name = "Operative Bijou",
            faction = "Horde",
            level = 59,
            requires = 55,
            pickup = "Lexlort, Kargath, Badlands",
            objective = "Travel to Blackrock Spire and find out what happened to Bijou.",
            turnin = "Bijou, inside Lower Blackrock Spire",
            rewardSummary = "",
            rewardItems = {},
        } },
        { dungeon = "Maraudon", nextID = 7046, lead = {
            id = 7044,
            name = "Legends of Maraudon",
            faction = "Both",
            level = 49,
            requires = 41,
            pickup = "Cavindra, Maraudon Orange Entrance, Desolace",
            objective = "Recover the two parts of the Scepter of Celebras: the Celebrian Rod and the Celebrian Diamond. Find a way to speak with Celebras.",
            turnin = "Celebras the Redeemed, inside Maraudon",
            rewardSummary = "",
            rewardItems = {},
        } },
    }

    for _, pair in ipairs(PAIRS) do
        local d = FDJ.DB and FDJ.DB[pair.dungeon]
        local quests = d and d.quests
        if quests then
            local nextIndex, nextQuest, leadQuest
            for i, q in ipairs(quests) do
                if q.id == pair.nextID then nextIndex, nextQuest = i, q end
                if q.id == pair.lead.id then leadQuest = q end
            end
            if nextQuest then

                if not leadQuest then
                    leadQuest = pair.lead
                    local details = FDJ.QUEST_PREREQ_DETAILS and FDJ.QUEST_PREREQ_DETAILS[leadQuest.id]
                    leadQuest.startMap = leadQuest.startMap or (details and details.map)
                        or (FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[leadQuest.id])
                    if FDJ.QUEST_START_MAPS and leadQuest.startMap and not FDJ.QUEST_START_MAPS[leadQuest.id] then
                        FDJ.QUEST_START_MAPS[leadQuest.id] = leadQuest.startMap
                    end
                    table.insert(quests, nextIndex, leadQuest)
                end
                leadQuest.hideFromMainList = nil
                leadQuest.leadsToQuestLink = { id = nextQuest.id, name = nextQuest.name }
                nextQuest.startQuestLink = { id = leadQuest.id, name = leadQuest.name }
                if FDJ.QUEST_PREREQ_CHAINS then FDJ.QUEST_PREREQ_CHAINS[nextQuest.id] = nil end
            end
        end
    end


    local function Q(dungeon, id)
        for _, q in ipairs((FDJ.DB and FDJ.DB[dungeon] and FDJ.DB[dungeon].quests) or {}) do
            if q.id == id then return q end
        end
    end
    local songblade = Q("Excavation Site: Wetlands", 95772)
    if songblade then songblade.note = nil end
    local heartwoven = Q("Excavation Site: Wetlands", 95809)
    if heartwoven and heartwoven.note == "Follow-up of Lost in the Thicket Things." then heartwoven.note = nil end


    for _, pins in pairs(FDJ.MAP_QUEST_PINS or {}) do
        for _, pin in ipairs(pins) do
            for _, spot in ipairs(pin.spots or {}) do
                for _, q in ipairs(spot.quests or {}) do
                    if q.id == 95647 or q.id == 5722 or q.id == 4981 or q.id == 7044 then q.main = nil end
                end
            end
        end
    end
end










do
    local ALBA_EXIT = "Alba Fairmoon, in the hills behind Moonbrook (at the Deadmines exit), Westfall"
    local d = FDJ.DB and FDJ.DB["The Deadmines"]
    for _, q in ipairs((d and d.quests) or {}) do
        if q.id == 92753 then
            q.turnin = ALBA_EXIT
            q.rewardSummary = "Stormwind +100"
            break
        end
    end
    local chains = FDJ.QUEST_PREREQ_CHAINS
    if chains and chains[92753] then
        local steps = {}
        for _, step in ipairs(chains[92753]) do
            if step.id ~= 92753 and step.id ~= 92819 then steps[#steps + 1] = step end
        end
        chains[92753] = steps
    end
    local details = FDJ.QUEST_PREREQ_DETAILS
    if details and details[92753] then
        details[92753].turnin = ALBA_EXIT
        details[92753].description = "Plant the explosives beside the forge, then meet Alba Fairmoon at the Deadmines exit."
    end

    if details then details[92819] = nil end
    if FDJ.QUEST_START_MAPS then FDJ.QUEST_START_MAPS[92819] = nil end

    for _, content in pairs(FDJ.ContentLocales or {}) do
        local quests = content.quests or {}
        if quests[92753] then quests[92753].turnin = nil end
    end
end











do
    local spots = FDJ.TURNIN_SPOTS or {}
    FDJ.TURNIN_SPOTS = spots
    local function Add(mapID, x, y, label, targetName)
        spots[#spots + 1] = { mapID = mapID, x = x, y = y, label = label, targetName = targetName }
    end
    Add(1457, 0.558, 0.242, "Dawnwatcher Selgorm — Darnassus", "Dawnwatcher Selgorm")
    Add(1455, 0.694, 0.186, "High Explorer Magellas — Hall of Explorers, Ironforge", "High Explorer Magellas")
    Add(1457, 0.693, 0.670, "Treshala Fallowbrook — Tradesmen's Terrace, Darnassus (walks around)", "Treshala Fallowbrook")
    Add(1424, 0.626, 0.190, "Monika Sengutz — Tarren Mill", "Monika Sengutz")
    Add(1450, 0.362, 0.416, "Keeper Remulos — Shrine of Remulos, Moonglade", "Keeper Remulos")
    Add(1447, 0.280, 0.500, "Sanath Lim-yo — Azshara", "Sanath Lim-yo")
    Add(1448, 0.512, 0.822, "Greta Mosshoof — Emerald Sanctuary, Felwood", "Greta Mosshoof")
    Add(1452, 0.610, 0.386, "Malyfous Darkhammer — Everlook, Winterspring", "Malyfous Darkhammer")
    Add(1428, 0.288, 0.284, "Franclorn Forgewright — Blackrock Mountain (a ghost, seen only while dead)", "Franclorn Forgewright")
    spots[#spots].ghostTalk = true
    Add(1428, 0.264, 0.246, "Lothos Riftwaker — Blackrock Mountain", "Lothos Riftwaker")
    Add(2548, 0.594, 0.454, "Krom'rosh — Riverglades", "Krom'rosh")
    Add(2548, 0.666, 0.810, "Ashe Amberhall — Farholde Keep, Riverglades", "Ashe Amberhall")
    Add(2548, 0.666, 0.799, "Demar Brant — Farholde Keep, Riverglades", "Demar Brant")



    local MULN = { mapID = 1412, x = 0.334, y = 0.224, label = "Muln Earthfury — Skywatcher Plateau, Mulgore", targetName = "Muln Earthfury" }
    local GROMGOL = { mapID = 1434, x = 0.323, y = 0.277, label = "Grom'gol Base Camp — Stranglethorn Vale (who takes it is not known yet)" }
    local FARHOLDE = { mapID = 2548, x = 0.666, y = 0.800, label = "Farholde Keep — Riverglades (who takes it is not known yet)" }

    local AGGROGOSH = { mapID = 1434, x = 0.322, y = 0.288, label = "Commander Aggro'gosh — Grom'gol Base Camp", targetName = "Commander Aggro'gosh" }
    local byQuest = { [98823] = MULN, [95776] = AGGROGOSH, [95773] = AGGROGOSH, [94983] = FARHOLDE }
    for _, data in pairs(FDJ.DB or {}) do
        for _, quest in ipairs((type(data) == "table" and data.quests) or {}) do
            local spot = type(quest) == "table" and quest.id and byQuest[quest.id]
            if spot and not quest.turninMap then quest.turninMap = spot end
        end
    end
    local details = FDJ.QUEST_PREREQ_DETAILS or {}
    for id, spot in pairs(byQuest) do
        if details[id] and not details[id].turninMap then details[id].turninMap = spot end
    end
    if details[92750] then
        details[92750].turnin = "Jasper Fel, SI:7, Old Town, Stormwind"
    end
end








do
    local SUTARA = { mapID = 1412, x = 0.344, y = 0.228, label = "Sutara Plainstalker — Mulgore", targetName = "Sutara Plainstalker", detail = "Sutara Plainstalker of the Earthen Ring, north-west Mulgore" }
    local d = FDJ.DB and FDJ.DB["Razorfen Downs"]
    if d then
        d.quests = d.quests or {}
        local have, after = false, nil
        for i, q in ipairs(d.quests) do
            if q.id == 97196 then
                have = true
                q.pickup = "Sutara Plainstalker, Skywatcher Plateau, Mulgore"
                q.turnin = "Sutara Plainstalker, Skywatcher Plateau, Mulgore"
                q.startMap, q.turninMap, q.note = SUTARA, SUTARA, nil
            end
            if q.name == "The Coldbringer's Eye" and q.faction == "Alliance" then after = i end
        end
        if not have then
            table.insert(d.quests, (after or #d.quests) + 1, {
                id = 97196,
                name = "The Coldbringer's Eye",
                level = 41,
                requires = 34,
                faction = "Horde",
                pickup = "Sutara Plainstalker, Skywatcher Plateau, Mulgore",
                objective = "Recover The Coldbringer's Eye from Razorfen Downs.",
                turnin = "Sutara Plainstalker, Skywatcher Plateau, Mulgore",
                liveXPFallback = 8600,
                rewardSummary = "55s  •  Earthen Ring +300  •  Thunder Bluff +150",
                requiredItem = { 276916, "The Coldbringer's Eye", 1, 1, "From Amnennar the Coldbringer, the last boss of Razorfen Downs" },
                startMap = SUTARA,
                turninMap = SUTARA,
            })
        end
    end
    if FDJ.QUEST_SHAREABILITY_AUDIT then FDJ.QUEST_SHAREABILITY_AUDIT[97196] = true end
end














do
    local PAGE = "Onyxia Attunement"
    FDJ.ONYXIA_PAGE = PAGE
    FDJ.ONYXIA_QUESTS = { Alliance = 6502, Horde = 6602 }
    local C, D, XP = FDJ.QUEST_PREREQ_CHAINS, FDJ.QUEST_PREREQ_DETAILS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local GORETOOTH = { mapID = 1418, x = 0.058, y = 0.474, label = "Warlord Goretooth — Kargath, Badlands", targetName = "Warlord Goretooth" }
    local AT_GORETOOTH = "Warlord Goretooth, Kargath, Badlands (5.8, 47.4)"

    D[98325] = {
        level = 60, requires = 55,
        objective = "Speak to Warlord Goretooth to serve the Kargath Expeditionary Force.",
        pickup = AT_GORETOOTH, turnin = AT_GORETOOTH,
        map = GORETOOTH, turninMap = GORETOOTH,
        note = "New in WoW Forever: it comes before Warlord's Command.",
    }
    XP[98325] = 660
    if FDJ.PREREQ_REWARD_MONEY_FALLBACK then FDJ.PREREQ_REWARD_MONEY_FALLBACK[98325] = 900 end


    if C[4903] == nil then C[4903] = { { id = 98325, name = "Blood and Thunder" } } end

    for _, id in ipairs({ 4974, 6569, 6602 }) do
        local chain = C[id]
        if type(chain) == "table" and type(chain[1]) == "table" and chain[1].id == 4903 then
            table.insert(chain, 1, { id = 98325, name = "Blood and Thunder" })
        end
    end



    local quests = {}
    local ubrs = FDJ.DB and FDJ.DB["Upper Blackrock Spire"]
    for _, faction in ipairs({ "Alliance", "Horde" }) do
        for _, q in ipairs((ubrs and ubrs.quests) or {}) do
            if type(q) == "table" and q.id == FDJ.ONYXIA_QUESTS[faction] then
                local copy = {}
                for k, v in pairs(q) do copy[k] = v end
                copy.note = "Every raider needs the Drakefire Amulet in their bags to enter Onyxia's Lair; it doesn't need to be worn. The last step is in Upper Blackrock Spire: General Drakkisath's blood."
                quests[#quests + 1] = copy
            end
        end
    end
    FDJ.DB[PAGE] = {
        questChainPage = true,
        noArrow = true,
        level = "48+",
        location = "",
        description = "",
        bosses = {},
        quests = quests,
    }
end














do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local WEST = "Round Dalaran's west wall, along the lake"
    local NORTH = "Round Dalaran's north side, along the lake shore"
    local function West(x, y) return { mapID = 1416, x = x, y = y, label = WEST } end
    local function North(x, y) return { mapID = 1416, x = x, y = y, label = NORTH } end
    local routes = {
        direct = { mapID = 1416, x0 = 0.000, y0 = 0.000, x1 = 0.125, y1 = 0.500 },
        routes = {
            { forward = true,
                West(0.182, 0.865), West(0.153, 0.847), West(0.141, 0.847), West(0.115, 0.823),
                West(0.100, 0.740), West(0.094, 0.731), West(0.074, 0.651), West(0.072, 0.640),
            },
            { forward = true,
                North(0.248, 0.625), North(0.193, 0.530), North(0.142, 0.510), North(0.130, 0.508),
                North(0.117, 0.515), North(0.109, 0.523), North(0.089, 0.559),
            },
        },
    }


    for _, spot in ipairs({ { 1416, 0.077, 0.588 }, { 1421, 0.684, 0.452 } }) do
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(spot[1]), spot[2], spot[3])] = routes
    end
end


















do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local below = { [1441] = true, [1444] = true, [1446] = true, [1449] = true, [1451] = true }
    local above = { [1413] = true, [1412] = true, [1456] = true, [1411] = true, [1454] = true, [1445] = true,
        [1440] = true, [1442] = true, [1439] = true, [1438] = true, [1457] = true, [1447] = true, [1448] = true, [1452] = true, [1450] = true }
    local UP = "Take the Great Lift up to the Barrens"
    local DOWN = "Take the Great Lift down to Thousand Needles"
    local RATCHET_LIFT = {
        0.6238, 0.3765, 0.6234, 0.3777, 0.6172, 0.3808, 0.6106, 0.3827, 0.6061, 0.3882, 0.6057, 0.3888, 0.5995, 0.3944, 0.5970, 0.3950,
        0.5917, 0.4006, 0.5674, 0.4357, 0.5654, 0.4431, 0.5617, 0.4487, 0.5613, 0.4548, 0.5613, 0.4554, 0.5604, 0.4832, 0.5498, 0.4992,
        0.5049, 0.5720, 0.5049, 0.5751, 0.5049, 0.5757, 0.5041, 0.5880, 0.4926, 0.6195, 0.4897, 0.6343, 0.4893, 0.6349, 0.4893, 0.6355,
        0.4881, 0.6374, 0.4877, 0.6380, 0.4840, 0.6448, 0.4782, 0.6583, 0.4774, 0.6596, 0.4770, 0.6602, 0.4770, 0.6608, 0.4770, 0.6614,
        0.4770, 0.6620, 0.4762, 0.6639, 0.4757, 0.6645, 0.4708, 0.6762, 0.4700, 0.6799, 0.4671, 0.7108, 0.4671, 0.7114, 0.4618, 0.7385,
        0.4609, 0.7903, 0.4527, 0.8600, 0.4498, 0.8643, 0.4490, 0.8680, 0.4461, 0.8767, 0.4400, 0.9155, 0.4404, 0.9198, 0.4400, 0.9198,
    }
    local RATCHET_RFK = {
        0.6238, 0.3765, 0.6234, 0.3777, 0.6172, 0.3808, 0.6106, 0.3827, 0.6061, 0.3882, 0.6057, 0.3888, 0.5995, 0.3944, 0.5970, 0.3950,
        0.5917, 0.4006, 0.5674, 0.4357, 0.5654, 0.4431, 0.5617, 0.4487, 0.5613, 0.4548, 0.5613, 0.4554, 0.5609, 0.4672, 0.5111, 0.5628,
        0.5049, 0.5720, 0.5049, 0.5751, 0.5049, 0.5757, 0.5041, 0.5880, 0.4926, 0.6195, 0.4897, 0.6343, 0.4893, 0.6349, 0.4893, 0.6355,
        0.4881, 0.6374, 0.4877, 0.6380, 0.4840, 0.6448, 0.4782, 0.6583, 0.4774, 0.6596, 0.4770, 0.6602, 0.4770, 0.6608, 0.4770, 0.6614,
        0.4770, 0.6620, 0.4762, 0.6639, 0.4757, 0.6645, 0.4708, 0.6762, 0.4700, 0.6799, 0.4671, 0.7108, 0.4671, 0.7114, 0.4618, 0.7385,
        0.4589, 0.8033, 0.4572, 0.8236, 0.4511, 0.8353, 0.4502, 0.8366, 0.4498, 0.8372, 0.4494, 0.8378, 0.4490, 0.8384, 0.4461, 0.8538,
        0.4457, 0.8545, 0.4445, 0.8619, 0.4433, 0.8841, 0.4416, 0.8921, 0.4391, 0.8989, 0.4391, 0.8995, 0.4387, 0.9001, 0.4371, 0.9013,
        0.4326, 0.9026, 0.4289, 0.9019,
    }
    local THERAMORE_LIFT = {
        0.7245, 0.8310, 0.7134, 0.8131, 0.7146, 0.8076, 0.7183, 0.8020, 0.7179, 0.8002, 0.7175, 0.7996, 0.7175, 0.7990, 0.7171, 0.7965,
        0.7171, 0.7959, 0.7163, 0.7928, 0.7155, 0.7897, 0.7150, 0.7885, 0.7150, 0.7879, 0.7146, 0.7872, 0.7130, 0.7835, 0.7064, 0.7730,
        0.7060, 0.7730, 0.7056, 0.7724, 0.7023, 0.7669, 0.6961, 0.7663, 0.6957, 0.7663, 0.6949, 0.7681, 0.6945, 0.7687, 0.6941, 0.7687,
        0.6937, 0.7693, 0.6928, 0.7706, 0.6924, 0.7706, 0.6920, 0.7706, 0.6896, 0.7737, 0.6891, 0.7724, 0.6891, 0.7718, 0.6891, 0.7712,
        0.6887, 0.7706, 0.6887, 0.7700, 0.6883, 0.7693, 0.6859, 0.7681, 0.6854, 0.7681, 0.6822, 0.7681, 0.6817, 0.7681, 0.6731, 0.7638,
        0.6719, 0.7613, 0.6715, 0.7607, 0.6711, 0.7601, 0.6706, 0.7595, 0.6702, 0.7595, 0.6674, 0.7570, 0.6665, 0.7576, 0.6661, 0.7576,
        0.6657, 0.7582, 0.6637, 0.7601, 0.6632, 0.7607, 0.6624, 0.7613, 0.6620, 0.7613, 0.6616, 0.7613, 0.6612, 0.7613, 0.6608, 0.7619,
        0.6587, 0.7632, 0.6583, 0.7632, 0.6567, 0.7632, 0.6562, 0.7632, 0.6546, 0.7638, 0.6542, 0.7638, 0.6377, 0.7650, 0.6373, 0.7650,
        0.6271, 0.7656, 0.6266, 0.7656, 0.6262, 0.7656, 0.6258, 0.7656, 0.6242, 0.7656, 0.6110, 0.7700, 0.6090, 0.7743, 0.6081, 0.7761,
        0.6049, 0.7792, 0.6036, 0.7792, 0.6032, 0.7792, 0.6028, 0.7798, 0.5909, 0.7798, 0.5905, 0.7798, 0.5896, 0.7798, 0.5892, 0.7798,
        0.5806, 0.7798, 0.5674, 0.7811, 0.5592, 0.7805, 0.5588, 0.7805, 0.5559, 0.7823, 0.5555, 0.7823, 0.5551, 0.7823, 0.5498, 0.7823,
        0.5493, 0.7823, 0.5461, 0.7823, 0.5456, 0.7823, 0.5448, 0.7817, 0.5444, 0.7811, 0.5440, 0.7811, 0.5424, 0.7817, 0.5419, 0.7817,
        0.5407, 0.7811, 0.5403, 0.7811, 0.5399, 0.7811, 0.5362, 0.7817, 0.5350, 0.7811, 0.5296, 0.7811, 0.5292, 0.7805, 0.5288, 0.7805,
        0.5275, 0.7811, 0.5197, 0.7805, 0.5193, 0.7805, 0.5189, 0.7805, 0.5136, 0.7811, 0.5132, 0.7811, 0.5115, 0.7817, 0.5066, 0.7848,
        0.5016, 0.7922, 0.5012, 0.7922, 0.5008, 0.7928, 0.4852, 0.8020, 0.4663, 0.8384, 0.4498, 0.8643, 0.4490, 0.8680, 0.4461, 0.8767,
        0.4400, 0.9155, 0.4404, 0.9198, 0.4400, 0.9198,
    }
    local THERAMORE_RFK = {
        0.7245, 0.8310, 0.7134, 0.8131, 0.7146, 0.8076, 0.7183, 0.8020, 0.7179, 0.8002, 0.7175, 0.7996, 0.7175, 0.7990, 0.7171, 0.7965,
        0.7171, 0.7959, 0.7163, 0.7928, 0.7155, 0.7897, 0.7150, 0.7885, 0.7150, 0.7879, 0.7146, 0.7872, 0.7130, 0.7835, 0.7064, 0.7730,
        0.7060, 0.7730, 0.7056, 0.7724, 0.7023, 0.7669, 0.6961, 0.7663, 0.6957, 0.7663, 0.6949, 0.7681, 0.6945, 0.7687, 0.6941, 0.7687,
        0.6937, 0.7693, 0.6928, 0.7706, 0.6924, 0.7706, 0.6920, 0.7706, 0.6896, 0.7737, 0.6891, 0.7724, 0.6891, 0.7718, 0.6891, 0.7712,
        0.6887, 0.7706, 0.6887, 0.7700, 0.6883, 0.7693, 0.6859, 0.7681, 0.6854, 0.7681, 0.6822, 0.7681, 0.6817, 0.7681, 0.6731, 0.7638,
        0.6719, 0.7613, 0.6715, 0.7607, 0.6711, 0.7601, 0.6706, 0.7595, 0.6702, 0.7595, 0.6674, 0.7570, 0.6665, 0.7570, 0.6653, 0.7582,
        0.6591, 0.7626, 0.6587, 0.7632, 0.6583, 0.7632, 0.6567, 0.7632, 0.6562, 0.7632, 0.6546, 0.7638, 0.6542, 0.7638, 0.6377, 0.7650,
        0.6373, 0.7650, 0.6271, 0.7656, 0.6266, 0.7656, 0.6262, 0.7656, 0.6258, 0.7656, 0.6242, 0.7656, 0.6110, 0.7700, 0.6090, 0.7743,
        0.6081, 0.7761, 0.6049, 0.7792, 0.6036, 0.7792, 0.6032, 0.7792, 0.6028, 0.7798, 0.5909, 0.7798, 0.5905, 0.7798, 0.5896, 0.7798,
        0.5892, 0.7798, 0.5806, 0.7798, 0.5674, 0.7811, 0.5592, 0.7805, 0.5588, 0.7805, 0.5559, 0.7823, 0.5555, 0.7823, 0.5551, 0.7823,
        0.5498, 0.7823, 0.5493, 0.7823, 0.5461, 0.7823, 0.5456, 0.7823, 0.5448, 0.7817, 0.5444, 0.7811, 0.5440, 0.7811, 0.5424, 0.7817,
        0.5419, 0.7817, 0.5407, 0.7811, 0.5403, 0.7811, 0.5399, 0.7811, 0.5362, 0.7817, 0.5350, 0.7811, 0.5296, 0.7811, 0.5292, 0.7805,
        0.5288, 0.7805, 0.5275, 0.7811, 0.5197, 0.7805, 0.5193, 0.7805, 0.5189, 0.7805, 0.5136, 0.7811, 0.5132, 0.7811, 0.5115, 0.7817,
        0.5066, 0.7848, 0.5016, 0.7922, 0.5012, 0.7922, 0.5008, 0.7928, 0.4852, 0.8020, 0.4663, 0.8384, 0.4433, 0.8748, 0.4433, 0.8841,
        0.4416, 0.8921, 0.4391, 0.8989, 0.4391, 0.8995, 0.4387, 0.9001, 0.4371, 0.9013, 0.4326, 0.9026, 0.4289, 0.9019,
    }
    local LIFT_RFK = {
        0.4400, 0.9198, 0.4404, 0.9192, 0.4400, 0.9050, 0.4379, 0.9032, 0.4359, 0.9026, 0.4289, 0.9019,
    }
    local FOOT_JOURNAL = {
        0.3168, 0.2422, 0.3158, 0.2422, 0.3149, 0.2436, 0.3130, 0.2450, 0.3120, 0.2450, 0.3111, 0.2450, 0.3092, 0.2450, 0.3082, 0.2450,
        0.3073, 0.2436,
    }
    local JOURNAL_THALANAAR = {
        0.3073, 0.2436, 0.3082, 0.2450, 0.3092, 0.2493, 0.3092, 0.2621, 0.3082, 0.2706, 0.3045, 0.2805, 0.3026, 0.2820, 0.2997, 0.2862,
        0.2988, 0.2862, 0.2978, 0.2862, 0.2969, 0.2862, 0.2959, 0.2862, 0.2950, 0.2862, 0.2865, 0.2848, 0.2855, 0.2848, 0.2846, 0.2862,
        0.2836, 0.2876, 0.2656, 0.2862, 0.2476, 0.2777, 0.2448, 0.2734, 0.2429, 0.2692, 0.2372, 0.2592, 0.2268, 0.2592, 0.2259, 0.2592,
        0.2173, 0.2706, 0.2012, 0.2720, 0.2003, 0.2720, 0.1974, 0.2706, 0.1662, 0.2663, 0.1634, 0.2635, 0.1586, 0.2592, 0.1567, 0.2592,
        0.1558, 0.2592, 0.1548, 0.2592, 0.1444, 0.2621, 0.1397, 0.2621, 0.1274, 0.2607, 0.1236, 0.2550, 0.1226, 0.2536, 0.1160, 0.2479,
        0.1122, 0.2379, 0.1122, 0.2365, 0.1122, 0.2351, 0.1113, 0.2337, 0.1084, 0.2308, 0.1075, 0.2308, 0.1065, 0.2294, 0.1056, 0.2280,
        0.0942, 0.2095, 0.0885, 0.2095, 0.0810, 0.1953, 0.0810, 0.1939, 0.0810, 0.1925, 0.0810, 0.1911, 0.0810, 0.1896,
    }
    local FOOT_THALANAAR = {
        0.3168, 0.2422, 0.3158, 0.2422, 0.3149, 0.2436, 0.3130, 0.2621, 0.3045, 0.2805, 0.3026, 0.2820, 0.2997, 0.2862, 0.2988, 0.2862,
        0.2978, 0.2862, 0.2969, 0.2862, 0.2959, 0.2862, 0.2950, 0.2862, 0.2865, 0.2848, 0.2855, 0.2848, 0.2846, 0.2862, 0.2836, 0.2876,
        0.2656, 0.2862, 0.2476, 0.2777, 0.2448, 0.2734, 0.2429, 0.2692, 0.2372, 0.2592, 0.2268, 0.2592, 0.2259, 0.2592, 0.2173, 0.2706,
        0.2012, 0.2720, 0.2003, 0.2720, 0.1974, 0.2706, 0.1662, 0.2663, 0.1634, 0.2635, 0.1586, 0.2592, 0.1567, 0.2592, 0.1558, 0.2592,
        0.1548, 0.2592, 0.1444, 0.2621, 0.1397, 0.2621, 0.1274, 0.2607, 0.1236, 0.2550, 0.1226, 0.2536, 0.1160, 0.2479, 0.1122, 0.2379,
        0.1122, 0.2365, 0.1122, 0.2351, 0.1113, 0.2337, 0.1084, 0.2308, 0.1075, 0.2308, 0.1065, 0.2294, 0.1056, 0.2280, 0.0942, 0.2095,
        0.0885, 0.2095, 0.0810, 0.1953, 0.0810, 0.1939, 0.0810, 0.1925, 0.0810, 0.1911, 0.0810, 0.1896,
    }



    local function Route(...)
        local route = { forward = true, nearest = true, reach = 4, leg = 3 }
        local legs = { ... }
        local crosses = false
        for i = 2, #legs do if legs[i][3] ~= legs[1][3] then crosses = true end end
        local crossed = false
        for i, leg in ipairs(legs) do
            local list, top = leg[1], leg[3]
            if i > 1 and legs[i - 1][3] ~= top then crossed = true end
            local label = (crosses and not crossed) and (top and DOWN or UP) or nil
            local n = #list / 2
            for k = 1, n do
                local at = leg[2] and (n - k) or (k - 1)
                route[#route + 1] = { mapID = top and 1413 or 1441, x = list[at * 2 + 1], y = list[at * 2 + 2],
                    maps = top and above or below, label = label }
            end
        end
        return route
    end
    local function Set(mapID, x, y, ...)
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(mapID), x, y)] = { routes = { ... } }
    end

    Set(1413, 0.429, 0.902,
        Route({ RATCHET_RFK, false, true }),
        Route({ THERAMORE_RFK, false, true }),
        Route({ FOOT_THALANAAR, true, false }, { LIFT_RFK, false, true }))

    Set(1413, 0.624, 0.376,
        Route({ RATCHET_RFK, true, true }),
        Route({ FOOT_THALANAAR, true, false }, { RATCHET_LIFT, true, true }))

    Set(1441, 0.307, 0.244,
        Route({ RATCHET_LIFT, false, true }, { FOOT_JOURNAL, false, false }),
        Route({ THERAMORE_LIFT, false, true }, { FOOT_JOURNAL, false, false }),
        Route({ LIFT_RFK, true, true }, { FOOT_JOURNAL, false, false }),
        Route({ JOURNAL_THALANAAR, true, false }))

    Set(1444, 0.896, 0.466,
        Route({ RATCHET_LIFT, false, true }, { FOOT_THALANAAR, false, false }),
        Route({ THERAMORE_LIFT, false, true }, { FOOT_THALANAAR, false, false }),
        Route({ LIFT_RFK, true, true }, { FOOT_THALANAAR, false, false }))
end



















do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}


    local ZONES = { [1420] = true, [1422] = true, [1416] = true, [1424] = true, [1421] = true, [1458] = true, [1423] = true }
    local BULWARK = "Through the Bulwark's gate (Horde guards)"
    local S_C = {
        1424, 0.4928, 0.5225, 0.4941, 0.5244, 0.5072, 0.5068, 0.5085, 0.5049, 0.5254, 0.4854, 0.5905, 0.3975, 0.5944, 0.3955, 0.6048,
        0.3857, 0.6061, 0.3838, 0.6530, 0.3428, 0.6673, 0.3428, 0.6699, 0.3311, 0.6751, 0.3135, 0.6803, 0.3057, 0.6895, 0.2568, 0.7012,
        0.1318, 0.7025, 0.1299, 0.7038, 0.1279, 0.7051, 0.1260, 0.7064, 0.1240, 0.7064, 0.1221, 1416, 0.7091, 0.7221, 0.7150, 0.7154,
        0.7210, 0.6998, 0.7552, 0.6529, 0.7552, 0.6395, 0.7746, 0.6127, 0.7760, 0.6105, 0.7775, 0.6083, 0.7790, 0.6060, 0.7835, 0.5949,
        0.7865, 0.5614, 0.7865, 0.5234, 0.7865, 0.5212, 0.7894, 0.4185, 1422, 0.4297, 0.9222, 0.4307, 0.9208, 0.4327, 0.9179, 0.4336,
        0.9164, 0.4346, 0.9092, 0.4356, 0.9077, 0.4356, 0.9063, 0.4365, 0.9048, 0.4365, 0.8975, 0.4365, 0.8961, 0.4365, 0.8757, 0.4346,
        0.8670, 0.4327, 0.8641, 0.4317, 0.8626, 0.4317, 0.8612, 0.4317, 0.8568, 0.4307, 0.8539, 0.4297, 0.8539, 0.4288, 0.8525, 0.4288,
        0.8510,
    }
    local C_L = {
        1422, 0.4288, 0.8510, 0.4288, 0.8496, 0.4278, 0.8481, 0.4220, 0.8438, 0.4210, 0.8423, 0.4201, 0.8423, 0.4201, 0.8408, 0.4191,
        0.8394, 0.4084, 0.8176, 0.4075, 0.8161, 0.3920, 0.7943, 0.3852, 0.7871, 0.3842, 0.7856, 0.3774, 0.7754, 0.3765, 0.7754, 0.3755,
        0.7754, 0.3716, 0.7754, 0.3648, 0.7682, 0.3658, 0.7507, 0.3774, 0.7202, 0.3774, 0.7188, 0.3774, 0.7173, 0.3774, 0.7115, 0.3774,
        0.7100, 0.3765, 0.7086, 0.3755, 0.7086, 0.3745, 0.7086, 0.3735, 0.7071, 0.3726, 0.7071, 0.3706, 0.7057, 0.3697, 0.6999, 0.3706,
        0.6984, 0.3716, 0.6969, 0.3706, 0.6969, 0.3706, 0.6955, 0.3697, 0.6940, 0.3687, 0.6926, 0.3677, 0.6911, 0.3600, 0.6839, 0.3590,
        0.6839, 0.3580, 0.6824, 0.3580, 0.6810, 0.3406, 0.6533, 0.3367, 0.6519, 0.3358, 0.6475, 1420, 0.8912, 0.7586, 0.8654, 0.7241,
        0.8645, 0.7227, 0.8598, 0.7144, 0.8580, 0.7102, 0.8525, 0.7047, 0.8469, 0.7047, 0.8460, 0.7047, 0.8451, 0.7047, 0.8442, 0.7047,
        0.8423, 0.7047, 0.8414, 0.7061, 0.8405, 0.7061, 0.8110, 0.7033, 0.8073, 0.6604, 0.8064, 0.6591, 0.8018, 0.6203, 0.8018, 0.6189,
        0.7962, 0.5788, 0.7944, 0.5761, 0.7944, 0.5747, 0.7944, 0.5733, 0.7971, 0.5650, 0.8082, 0.5443, 0.8091, 0.5429, 0.8119, 0.5346,
        0.8156, 0.5138, 0.8174, 0.4903, 0.8248, 0.4793, 0.8248, 0.4723, 0.8248, 0.4710, 0.8248, 0.4391, 0.8230, 0.4350, 0.8248, 0.4142,
        0.8248, 0.4129, 0.8248, 0.3990, 0.8248, 0.3976, 0.8257, 0.3963, 0.8266, 0.3797, 0.8266, 0.3783, 0.8266, 0.3368, 0.8257, 0.3354,
        0.8248, 0.3340, 0.8257, 0.3326, 0.8257, 0.3299, 0.8248, 0.3285, 0.8239, 0.3271, 0.8239, 0.3257, 0.8230, 0.3243, 0.8230, 0.3230,
        0.8239, 0.3230, 0.8248, 0.3230, 0.8248, 0.3216, 0.8257, 0.3216, 0.8266, 0.3202, 0.8285, 0.3243, 0.8294, 0.3243, 0.8313, 0.3243,
        0.8313, 0.3230, 0.8479, 0.3230, 0.8497, 0.3202, 0.8515, 0.3202, 0.8534, 0.3243,
    }
    local O_C = {
        1416, 0.0945, 0.6261, 0.1109, 0.6261, 0.1153, 0.6350, 0.1183, 0.6350, 0.1213, 0.6395, 0.1228, 0.6395, 0.1243, 0.6417, 0.1287,
        0.6417, 0.1302, 0.6440, 0.1391, 0.6440, 0.1421, 0.6484, 0.1436, 0.6484, 0.1436, 0.6507, 0.1436, 0.6529, 0.1451, 0.6819, 0.1451,
        0.6842, 0.1481, 0.6953, 0.1525, 0.6998, 0.1734, 0.7109, 0.1823, 0.7109, 0.1838, 0.7132, 0.1912, 0.7132, 0.1942, 0.7154, 1424,
        0.2611, 0.1182, 0.2611, 0.1240, 0.2611, 0.1260, 0.2624, 0.1279, 0.2650, 0.1748, 0.2637, 0.1768, 0.2637, 0.1787, 0.2650, 0.1807,
        0.2650, 0.1826, 0.2650, 0.1846, 0.2650, 0.1865, 0.2663, 0.1865, 0.2663, 0.1885, 0.2676, 0.1904, 0.2689, 0.1924, 0.2715, 0.1963,
        0.2728, 0.2002, 0.2741, 0.2021, 0.2780, 0.2061, 0.2793, 0.2080, 0.2819, 0.2080, 0.2910, 0.2061, 0.2949, 0.2041, 0.3184, 0.1670,
        0.3197, 0.1611, 0.3262, 0.1377, 0.3275, 0.1357, 1416, 0.2984, 0.7221, 0.3013, 0.7199, 0.3281, 0.6931, 0.3296, 0.6931, 0.3311,
        0.6931, 0.3490, 0.6931, 0.3504, 0.6931, 0.3519, 0.6908, 0.3534, 0.6886, 0.3802, 0.6864, 0.4442, 0.6127, 0.4710, 0.5725, 0.4725,
        0.5703, 0.4740, 0.5681, 0.4740, 0.5614, 0.5007, 0.5301, 0.5201, 0.5257, 0.5365, 0.5123, 0.5379, 0.5100, 0.5513, 0.4877, 0.5558,
        0.4877, 0.5766, 0.4833, 0.5811, 0.4788, 0.5900, 0.4788, 0.5915, 0.4788, 0.6406, 0.4766, 0.6421, 0.4743, 0.6838, 0.4721, 0.6957,
        0.4676, 0.7046, 0.4676, 0.7061, 0.4676, 0.7150, 0.4676, 0.7418, 0.4632, 0.7433, 0.4609, 0.7448, 0.4609, 0.7522, 0.4632, 0.7567,
        0.4587, 0.7701, 0.4520, 0.7850, 0.4319, 1422, 0.4327, 0.9179, 0.4336, 0.9164, 0.4346, 0.9092, 0.4356, 0.9077, 0.4356, 0.9063,
        0.4365, 0.9048, 0.4365, 0.8975, 0.4365, 0.8961, 0.4365, 0.8757, 0.4346, 0.8670, 0.4327, 0.8641, 0.4317, 0.8626, 0.4317, 0.8612,
        0.4317, 0.8568, 0.4307, 0.8539, 0.4297, 0.8539, 0.4288, 0.8525, 0.4288, 0.8510,
    }
    local C_R = {
        1422, 0.4288, 0.8510, 0.4288, 0.8525, 0.4297, 0.8525, 0.4336, 0.8597, 0.4346, 0.8612, 0.4346, 0.8626, 0.4346, 0.8670, 0.4356,
        0.8714, 0.4365, 0.8844, 0.4365, 0.8961, 0.4365, 0.8975, 0.4356, 0.9063, 0.4356, 0.9077, 0.4346, 0.9092, 0.4336, 0.9164, 0.4327,
        0.9179, 0.4307, 0.9208, 0.4297, 0.9222, 1416, 0.7894, 0.4185, 0.7865, 0.5212, 0.7865, 0.5234, 0.7835, 0.5949, 0.7820, 0.5971,
        0.7760, 0.6105, 0.7746, 0.6127, 0.7552, 0.6395, 0.7552, 0.6529, 0.7478, 0.6641, 0.7463, 0.6663, 0.7180, 0.7042, 0.7121, 0.7199,
        1424, 0.7077, 0.1182, 0.7064, 0.1221, 0.7064, 0.1240, 0.7051, 0.1260, 0.7038, 0.1279, 0.7025, 0.1299, 0.7012, 0.1318, 0.6895,
        0.2568, 0.6868, 0.2744, 0.6790, 0.3076, 0.6699, 0.3252, 0.6699, 0.3350, 0.6673, 0.3428, 0.6387, 0.3896, 0.6387, 0.4014, 0.6387,
        0.4033, 0.6374, 0.4072, 0.6335, 0.4229, 0.5996, 0.4697, 0.5983, 0.4697, 0.5944, 0.4736, 0.5931, 0.4756, 0.5918, 0.4756, 0.5905,
        0.4775, 0.5618, 0.5186, 0.5332, 0.5479, 0.5241, 0.5674, 0.5150, 0.5771, 0.5150, 0.5791,
    }
    local S_O = {
        1424, 0.4928, 0.5225, 0.4928, 0.5205, 0.4928, 0.5186, 0.4915, 0.5166, 0.4915, 0.5107, 0.4785, 0.5010, 0.4759, 0.4951, 0.4746,
        0.4932, 0.4408, 0.4346, 0.4395, 0.4346, 0.4382, 0.4326, 0.4030, 0.3779, 0.4017, 0.3760, 0.3483, 0.3096, 0.3392, 0.3096, 0.3132,
        0.2627, 0.2923, 0.2373, 0.2884, 0.2354, 0.2871, 0.2334, 0.2793, 0.2178, 0.2793, 0.2139, 0.2793, 0.2119, 0.2780, 0.2061, 0.2741,
        0.2021, 0.2728, 0.1982, 0.2715, 0.1963, 0.2689, 0.1904, 0.2676, 0.1885, 0.2663, 0.1865, 0.2650, 0.1846, 0.2650, 0.1826, 0.2650,
        0.1807, 0.2637, 0.1787, 0.2637, 0.1768, 0.2637, 0.1748, 0.2650, 0.1729, 0.2624, 0.1279, 0.2611, 0.1260, 0.2611, 0.1240, 0.2598,
        0.1221, 1416, 0.1957, 0.7176, 0.1942, 0.7154, 0.1912, 0.7132, 0.1838, 0.7132, 0.1823, 0.7132, 0.1808, 0.7109, 0.1704, 0.7109,
        0.1496, 0.6975, 0.1451, 0.6886, 0.1451, 0.6663, 0.1436, 0.6529, 0.1436, 0.6507, 0.1436, 0.6484, 0.1421, 0.6484, 0.1362, 0.6440,
        0.1302, 0.6440, 0.1287, 0.6440, 0.1228, 0.6440, 0.1213, 0.6417, 0.1183, 0.6395, 0.1124, 0.6283, 0.0960, 0.6283, 0.0945, 0.6261,
    }


    local function Route(...)
        local route = { forward = true, nearest = true, reach = 4, leg = 3, zones = ZONES, walkfirst = true }
        for _, leg in ipairs({ ... }) do
            local points, map = {}, nil
            for _, v in ipairs(leg[1]) do
                if v > 2 then
                    map = v
                elseif points.x then
                    points[#points + 1] = { mapID = map, x = points.x, y = v, maps = ZONES }
                    points.x = nil
                else
                    points.x = v
                end
            end
            if leg[3] then
                for i = leg[3], leg[4] do points[i].label = leg[5] end
            end
            local n = #points
            for k = 1, n do
                local point = points[leg[2] and (n - k + 1) or k]
                local last = route[#route]

                if not (last and last.mapID == point.mapID and last.x == point.x and last.y == point.y) then
                    route[#route + 1] = point
                end
            end
        end
        return route
    end
    local function Set(mapID, x, y, ...)
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(mapID), x, y)] = { routes = { ... } }
    end
    local TO_DOOR = { C_L, false, 50, 59, BULWARK }
    local FROM_DOOR = { C_L, true, 50, 59, BULWARK }

    Set(1420, 0.8535, 0.3239,
        Route({ S_C, false }, TO_DOOR),
        Route({ O_C, false }, TO_DOOR))

    Set(1424, 0.514, 0.584,
        Route(FROM_DOOR, { C_R, false }))


    Set(1416, 0.094, 0.626,
        Route(FROM_DOOR, { O_C, true }),
        Route({ S_O, false }))
    Set(1416, 0.097, 0.619,
        Route({ S_O, false }))


    Set(1455, 0.740, 0.134,
        Route(FROM_DOOR, { S_C, true }))
end













do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local ZONES = { [1437] = true }
    local N_A = {
        0.5159, 0.0605, 0.5149, 0.0605, 0.5149, 0.0650, 0.5159, 0.0665, 0.5159, 0.0680, 0.5159, 0.0711, 0.5149, 0.0726, 0.5118, 0.0771,
        0.5118, 0.0786, 0.5118, 0.0801, 0.5118, 0.0831, 0.5118, 0.0847, 0.5118, 0.1119, 0.5118, 0.1134, 0.5118, 0.1164, 0.5118, 0.1179,
        0.5098, 0.1345, 0.5098, 0.2147, 0.5108, 0.2162, 0.5118, 0.2177, 0.5139, 0.2646, 0.5139, 0.2661, 0.5139, 0.2676, 0.5149, 0.2691,
        0.5149, 0.2706, 0.5199, 0.3054, 0.5199, 0.3069, 0.5219, 0.3175, 0.5290, 0.3810, 0.5320, 0.4535, 0.5320, 0.4580, 0.5320, 0.4596,
        0.5340, 0.4626, 0.5350, 0.4641, 0.5401, 0.4807, 0.5461, 0.4913, 0.5471, 0.4958, 0.5491, 0.5231, 0.5511, 0.5276, 0.5531, 0.5367,
        0.5531, 0.5382, 0.5531, 0.5397, 0.5552, 0.5488, 0.5632, 0.5850, 0.5622, 0.5941, 0.5612, 0.5956, 0.5612, 0.5971, 0.5612, 0.6092,
        0.5521, 0.6259, 0.5511, 0.6274, 0.5511, 0.6289, 0.5501, 0.6319, 0.5270, 0.6606, 0.5249, 0.6606, 0.5239, 0.6591, 0.5239, 0.6576,
        0.5229, 0.6546, 0.5229, 0.6531, 0.5219, 0.6500, 0.5209, 0.6485, 0.5209, 0.6470, 0.5169, 0.6379, 0.5128, 0.6289, 0.5118, 0.6243,
        0.5088, 0.6198, 0.5078, 0.6092, 0.5058, 0.5926, 0.5068, 0.5896, 0.5078, 0.5896, 0.5088, 0.5911, 0.5139, 0.5926,
    }
    local M_A = {
        0.1048, 0.5593, 0.1048, 0.5578, 0.1048, 0.5563, 0.1078, 0.5503, 0.1078, 0.5488, 0.1078, 0.5472, 0.1078, 0.5457, 0.1088, 0.5442,
        0.1219, 0.5125, 0.1229, 0.5110, 0.1239, 0.5094, 0.1239, 0.5079, 0.1249, 0.5034, 0.1280, 0.5019, 0.1471, 0.4913, 0.1924, 0.4414,
        0.2035, 0.4399, 0.2166, 0.4218, 0.2176, 0.4203, 0.2771, 0.4082, 0.3093, 0.3976, 0.3224, 0.3915, 0.3365, 0.3915, 0.3436, 0.3810,
        0.3486, 0.3794, 0.3557, 0.3764, 0.3738, 0.3734, 0.3839, 0.3779, 0.3849, 0.3794, 0.3889, 0.3810, 0.3899, 0.3810, 0.3929, 0.3825,
        0.4020, 0.3885, 0.4050, 0.3915, 0.4141, 0.4006, 0.4161, 0.4021, 0.4171, 0.4021, 0.4202, 0.4067, 0.4222, 0.4067, 0.4232, 0.4082,
        0.4363, 0.4278, 0.4393, 0.4278, 0.4403, 0.4293, 0.4413, 0.4308, 0.4685, 0.4626, 0.4695, 0.4641, 0.4786, 0.4717, 0.5098, 0.4943,
        0.5219, 0.4913, 0.5229, 0.4928, 0.5239, 0.4928, 0.5259, 0.4943, 0.5259, 0.4958, 0.5259, 0.4974, 0.5270, 0.4974, 0.5280, 0.4974,
        0.5290, 0.4974, 0.5300, 0.4974, 0.5310, 0.4989, 0.5320, 0.5004, 0.5340, 0.5019, 0.5350, 0.5019, 0.5360, 0.5019, 0.5421, 0.5019,
        0.5441, 0.5064, 0.5491, 0.5200, 0.5511, 0.5291, 0.5531, 0.5367, 0.5531, 0.5382, 0.5531, 0.5397, 0.5552, 0.5488, 0.5632, 0.5850,
        0.5622, 0.5941, 0.5612, 0.5956, 0.5612, 0.5971, 0.5612, 0.6092, 0.5521, 0.6259, 0.5511, 0.6274, 0.5511, 0.6289, 0.5501, 0.6319,
        0.5270, 0.6606, 0.5249, 0.6606, 0.5239, 0.6591, 0.5239, 0.6576, 0.5229, 0.6546, 0.5229, 0.6531, 0.5219, 0.6500, 0.5209, 0.6485,
        0.5209, 0.6470, 0.5169, 0.6379, 0.5128, 0.6289, 0.5118, 0.6243, 0.5088, 0.6198, 0.5078, 0.6092, 0.5058, 0.5926, 0.5068, 0.5896,
        0.5078, 0.5896, 0.5088, 0.5911, 0.5139, 0.5926,
    }
    local S_A = {
        0.5511, 0.7377, 0.5431, 0.6924, 0.5431, 0.6848, 0.5401, 0.6803, 0.5390, 0.6788, 0.5390, 0.6772, 0.5380, 0.6757, 0.5380, 0.6742,
        0.5370, 0.6727, 0.5340, 0.6682, 0.5330, 0.6667, 0.5249, 0.6606, 0.5239, 0.6591, 0.5239, 0.6576, 0.5229, 0.6546, 0.5229, 0.6531,
        0.5219, 0.6500, 0.5209, 0.6485, 0.5209, 0.6470, 0.5169, 0.6379, 0.5128, 0.6289, 0.5118, 0.6243, 0.5088, 0.6198, 0.5078, 0.6092,
        0.5058, 0.5926, 0.5068, 0.5896, 0.5078, 0.5896, 0.5088, 0.5911, 0.5139, 0.5926,
    }
    local N_E = {
        0.5159, 0.0605, 0.5149, 0.0605, 0.5149, 0.0650, 0.5159, 0.0665, 0.5159, 0.0680, 0.5159, 0.0711, 0.5149, 0.0726, 0.5118, 0.0771,
        0.5118, 0.0786, 0.5118, 0.0801, 0.5118, 0.0831, 0.5118, 0.0847, 0.5118, 0.1119, 0.5118, 0.1134, 0.5118, 0.1164, 0.5118, 0.1179,
        0.5098, 0.1345, 0.5098, 0.2147, 0.5108, 0.2162, 0.5118, 0.2177, 0.5139, 0.2646, 0.5139, 0.2661, 0.5139, 0.2676, 0.5149, 0.2691,
        0.5149, 0.2706, 0.5199, 0.3054, 0.5199, 0.3069, 0.5219, 0.3175, 0.5290, 0.3810, 0.5320, 0.4535, 0.5320, 0.4580, 0.5320, 0.4596,
        0.5340, 0.4626, 0.5350, 0.4641, 0.5401, 0.4807, 0.5461, 0.4913, 0.5471, 0.4958, 0.5491, 0.5231, 0.5511, 0.5276, 0.5531, 0.5367,
        0.5531, 0.5382, 0.5531, 0.5397, 0.5552, 0.5488, 0.5632, 0.5850, 0.5622, 0.5941, 0.5612, 0.5956, 0.5612, 0.5971, 0.5612, 0.6092,
        0.5521, 0.6259, 0.5511, 0.6274, 0.5511, 0.6289, 0.5501, 0.6319, 0.5270, 0.6606, 0.5249, 0.6606, 0.5239, 0.6591, 0.5209, 0.6515,
        0.5169, 0.6395, 0.5159, 0.6379, 0.5149, 0.6364, 0.5118, 0.6243, 0.5088, 0.6198, 0.5068, 0.6092, 0.5038, 0.5881, 0.4937, 0.5729,
        0.4766, 0.5624,
    }
    local M_E = {
        0.1048, 0.5593, 0.1048, 0.5578, 0.1048, 0.5563, 0.1078, 0.5503, 0.1078, 0.5488, 0.1078, 0.5472, 0.1078, 0.5457, 0.1088, 0.5442,
        0.1219, 0.5125, 0.1229, 0.5110, 0.1239, 0.5094, 0.1239, 0.5079, 0.1249, 0.5034, 0.1280, 0.5019, 0.1471, 0.4913, 0.1924, 0.4414,
        0.2035, 0.4399, 0.2166, 0.4218, 0.2176, 0.4203, 0.2771, 0.4082, 0.3093, 0.3976, 0.3224, 0.3915, 0.3365, 0.3915, 0.3436, 0.3810,
        0.3486, 0.3794, 0.3557, 0.3764, 0.3738, 0.3734, 0.3839, 0.3779, 0.3849, 0.3794, 0.3889, 0.3810, 0.3899, 0.3810, 0.3929, 0.3825,
        0.4020, 0.3885, 0.4050, 0.3915, 0.4141, 0.4006, 0.4161, 0.4021, 0.4171, 0.4021, 0.4202, 0.4067, 0.4222, 0.4067, 0.4232, 0.4082,
        0.4363, 0.4278, 0.4393, 0.4278, 0.4403, 0.4293, 0.4413, 0.4308, 0.4685, 0.4626, 0.4695, 0.4641, 0.4786, 0.4717, 0.5098, 0.4943,
        0.5219, 0.4913, 0.5229, 0.4928, 0.5239, 0.4928, 0.5259, 0.4943, 0.5259, 0.4958, 0.5259, 0.4974, 0.5270, 0.4974, 0.5280, 0.4974,
        0.5290, 0.4974, 0.5300, 0.4974, 0.5310, 0.4989, 0.5320, 0.5004, 0.5340, 0.5019, 0.5350, 0.5019, 0.5360, 0.5019, 0.5421, 0.5019,
        0.5441, 0.5064, 0.5491, 0.5200, 0.5511, 0.5291, 0.5531, 0.5367, 0.5531, 0.5382, 0.5531, 0.5397, 0.5552, 0.5488, 0.5632, 0.5850,
        0.5622, 0.5941, 0.5612, 0.5956, 0.5612, 0.5971, 0.5612, 0.6092, 0.5521, 0.6259, 0.5511, 0.6274, 0.5511, 0.6289, 0.5501, 0.6319,
        0.5270, 0.6606, 0.5249, 0.6606, 0.5239, 0.6591, 0.5209, 0.6515, 0.5169, 0.6395, 0.5159, 0.6379, 0.5149, 0.6364, 0.5118, 0.6243,
        0.5088, 0.6198, 0.5068, 0.6092, 0.5038, 0.5881, 0.4937, 0.5729, 0.4766, 0.5624,
    }
    local S_E = {
        0.5511, 0.7377, 0.5431, 0.6924, 0.5431, 0.6848, 0.5401, 0.6803, 0.5390, 0.6788, 0.5390, 0.6772, 0.5380, 0.6757, 0.5340, 0.6682,
        0.5330, 0.6667, 0.5249, 0.6606, 0.5239, 0.6591, 0.5209, 0.6515, 0.5169, 0.6395, 0.5159, 0.6379, 0.5149, 0.6364, 0.5118, 0.6243,
        0.5088, 0.6198, 0.5068, 0.6092, 0.5038, 0.5881, 0.4937, 0.5729, 0.4766, 0.5624,
    }
    local function Route(list, reversed)



        local route = { forward = true, nearest = true, reach = 4, leg = 3, zones = ZONES, walkfirst = true, off = 8 }
        local n = #list / 2
        for k = 1, n do
            local at = reversed and (n - k) or (k - 1)
            route[#route + 1] = { mapID = 1437, x = list[at * 2 + 1], y = list[at * 2 + 2], maps = ZONES }
        end
        return route
    end
    local function Set(x, y, ...)
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1437", x, y)] = { routes = { ... } }
    end





    Set(0.514, 0.592, Route(N_A), Route(M_A), Route(S_A))

    Set(0.477, 0.562, Route(N_E), Route(M_E), Route(S_E))
end












do
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local bh = FDJ.DB and FDJ.DB["Blackmaw Hold"]
    local KNIGHT = "Knight of Mourning, Tirisfal Glades (17.6, 67.4)"
    local KNIGHT_MAP = { mapID = 1420, x = 0.176, y = 0.674, label = "Knight of Mourning — Tirisfal Glades", targetName = "Knight of Mourning" }
    C[99187] = {
        { id = 93030, name = "The Knight of Mourning" },
    }
    D[93030] = {
        level = 58, requires = 50,
        objective = "Speak with the Knight of Mourning to learn more about his unfinished quest.",
        pickup = KNIGHT,
        turnin = KNIGHT,
        map = KNIGHT_MAP,
    }
    XP[93030] = 620
    XP[99187] = 13550
    if bh then
        bh.quests = bh.quests or {}
        local have = false
        for _, q in ipairs(bh.quests) do if q.id == 99187 then have = true end end
        if not have then
            table.insert(bh.quests, {
                id = 99187, name = "The Reliquary of Tyr",
                classOnly = "PALADIN", faction = "Horde",
                level = 58, requires = 50,
                pickup = KNIGHT, turnin = KNIGHT,
                startMap = KNIGHT_MAP, turninMap = KNIGHT_MAP,
                objective = "Travel to Blackmaw Hold in Kalimdor, and recover the Reliquary of Tyr.",
                liveXPFallback = 13550,
                rewardSummary = "",
                rewardItems = { {286408, "Sword of Mourning", 3} },
                requiredItem = { 286415, "Reliquary of Tyr", 4, 1, "Dropped by: Elder Shaman Bloodmane, Blackmaw Hold" },
                note = "Forsaken paladin class quest. The Reliquary of Tyr drops from Elder Shaman Bloodmane.",
            })
        end
    end
end















do
    local VELAROK = { mapID = 1427, x = 0.390, y = 0.390, label = "Velarok Windblade — Searing Gorge", targetName = "Velarok Windblade" }
    local MALTRAKE = { mapID = 1427, x = 0.390, y = 0.390, label = "Squire Maltrake — Searing Gorge", targetName = "Squire Maltrake" }
    local HOARD = { mapID = 1427, x = 0.390, y = 0.389, label = "Hoard of the Black Dragonflight — Searing Gorge" }







    local CYRUS = { mapID = 1428, x = 0.948, y = 0.316, label = "Cyrus Therepentous — Burning Steppes", targetName = "Cyrus Therepentous", direct = { { 0.78, 0.48, 0.97, 0.72 }, { 0.84, 0.25, 0.99, 0.48 } } }








    local OPEN = { 0.27, 0.35, 0.42, 0.46 }
    for _, spot in ipairs({ VELAROK, MALTRAKE, HOARD }) do spot.noGetTo = true spot.direct = OPEN end
    local VELAROK_TEXT = "Velarok Windblade, Searing Gorge (39.0, 39.0)"
    local MALTRAKE_TEXT = "Squire Maltrake, Searing Gorge (39.0, 39.0)"
    local HOARD_TEXT = "Hoard of the Black Dragonflight, Searing Gorge (39.0, 38.9)"
    local CYRUS_TEXT = "Cyrus Therepentous, Burning Steppes (94.8, 31.6)"





    local TORCH = { mapID = 1427, x = 0.391, y = 0.391, label = "Torch of Retribution \226\128\148 Searing Gorge", exact = true, noGetTo = true, direct = OPEN }
    local TORCH_TEXT = "Torch of Retribution, Searing Gorge (39.1, 39.1)"
    local FIRE = { markerType = "location", mapID = 1427, x = 0.515, y = 0.455, label = "Fire elementals and war golems \226\128\148 Searing Gorge" }
    local DARKIRON = { markerType = "location", mapID = 1427, x = 0.410, y = 0.365, label = "Dark Iron dwarves \226\128\148 Searing Gorge" }
    local TWILIGHT = { markerType = "location", mapID = 1427, x = 0.230, y = 0.340, label = "Twilight's Hammer camp \226\128\148 Searing Gorge" }
    local HEART_FROM = "Dropped by the fire elementals in the area"
    local OIL_FROM = "Dropped by the war golems and the magma elementals in the area"
    local DAGGER_FROM = "Dropped by the Dark Iron dwarves and their slaves all over the gorge"
    local SYMBOL_FROM = "Dropped by the Twilight's Hammer elites in their camp to the northwest"
    local function At(spot, detail)
        local t = {}
        for k, v in pairs(spot) do t[k] = v end
        t.detail = detail
        return t
    end
    FDJ.QUEST_PREREQ_CHAINS[4024] = {
        { id = 3441, name = "Divine Retribution" },
        { id = 3442, name = "The Flawless Flame" },
        { id = 3443, name = "Forging the Shaft" },
        { id = 3452, name = "The Flame's Casing" },
        { id = 3453, name = "The Torch of Retribution" },
        { id = 3454, name = "The Torch of Retribution" },
        { id = 3462, name = "Squire Maltrake" },
        { id = 3463, name = "Set Them Ablaze!" },
        { id = 3481, name = "Trinkets..." },
        { id = 4022, name = "A Taste of Flame" },
    }
    FDJ.QUEST_PREREQ_DETAILS[3441] = {
        level = 48, requires = 40,
        objective = "Listen as Velarok Windblade tells his story.",
        pickup = VELAROK_TEXT, turnin = VELAROK_TEXT,
        map = VELAROK, turninMap = VELAROK,
    }
    FDJ.QUEST_PREREQ_DETAILS[3442] = {
        level = 48, requires = 40,
        objective = "Collect 4 Hearts of Flame and 4 globes of Golem Oil and return the items to Velarok Windblade.",
        pickup = VELAROK_TEXT, turnin = VELAROK_TEXT,
        map = VELAROK, turninMap = VELAROK,
        requiredItems = {
            { 10509, "Heart of Flame", 4, HEART_FROM, map = At(FIRE, HEART_FROM), noRouteStop = true },
            { 10511, "Golem Oil", 4, OIL_FROM, map = At(FIRE, OIL_FROM), noRouteStop = true },
        },
        routeGoals = {
            { 10509, 4, spot = At(FIRE, HEART_FROM) },
            { 10511, 4, spot = At(FIRE, OIL_FROM) },
        },
    }
    FDJ.QUEST_PREREQ_DETAILS[3443] = {
        level = 48, requires = 40,
        objective = "Bring 8 Thorium Plated Daggers to Velarok Windblade.",
        pickup = VELAROK_TEXT, turnin = VELAROK_TEXT,
        map = VELAROK, turninMap = VELAROK,
        requiredItems = { { 10551, "Thorium Plated Dagger", 8, DAGGER_FROM, map = At(DARKIRON, DAGGER_FROM), noRouteStop = true } },
        routeGoals = { { 10551, 8, spot = At(DARKIRON, DAGGER_FROM) } },
    }
    FDJ.QUEST_PREREQ_DETAILS[3452] = {
        level = 50, requires = 40,
        objective = "Find and return a Symbol of Ragnaros to Velarok Windblade.",
        pickup = VELAROK_TEXT, turnin = VELAROK_TEXT,
        map = VELAROK, turninMap = VELAROK,
        requiredItems = { { 10552, "Symbol of Ragnaros", 1, SYMBOL_FROM, map = At(TWILIGHT, SYMBOL_FROM), noRouteStop = true } },
        routeGoals = { { 10552, 1, spot = At(TWILIGHT, SYMBOL_FROM) } },
        note = "Elite quest.",
    }
    FDJ.QUEST_PREREQ_DETAILS[3453] = {
        level = 50, requires = 40,
        objective = "Wait for Velarok Windblade to complete the Torch of Retribution.",
        pickup = VELAROK_TEXT, turnin = VELAROK_TEXT,
        map = VELAROK, turninMap = VELAROK,
    }
    FDJ.QUEST_PREREQ_DETAILS[3454] = {
        level = 50, requires = 40,
        objective = "Take the Torch of Retribution.",
        pickup = VELAROK_TEXT, turnin = TORCH_TEXT,
        map = VELAROK, turninMap = TORCH,
    }
    FDJ.QUEST_PREREQ_DETAILS[3462] = {
        level = 50, requires = 40,
        objective = "Speak with Squire Maltrake.",
        pickup = VELAROK_TEXT, turnin = MALTRAKE_TEXT,
        map = VELAROK, turninMap = MALTRAKE,
    }
    FDJ.QUEST_PREREQ_DETAILS[3463] = {
        level = 52, requires = 40,
        objective = "Set the North, South, East, and West Sentry Towers on fire by using the Torch of Retribution inside each of the buildings.",
        pickup = MALTRAKE_TEXT, turnin = MALTRAKE_TEXT,
        map = MALTRAKE, turninMap = MALTRAKE,
        providedItem = {10515, "Torch of Retribution", 1, "Given by Squire Maltrake when you accept the quest: use it on the Sentry Brazier inside each tower"},
        note = "Elite quest.",
    }
    FDJ.QUEST_PREREQ_DETAILS[3481] = {
        level = 50, requires = 40,
        objective = "Open the chest.",
        pickup = HOARD_TEXT, turnin = HOARD_TEXT,
        startObject = {"Hoard of the Black Dragonflight", "Interface\\Icons\\INV_Box_02", "Beside Squire Maltrake, Searing Gorge (39.0, 38.9)"},
        map = HOARD, turninMap = HOARD,
    }





    local CYRUS_MOLT = {}
    for k, v in pairs(CYRUS) do CYRUS_MOLT[k] = v end
    CYRUS_MOLT.openItem = { 10569, "Hoard of the Black Dragonflight", 10575 }
    FDJ.QUEST_PREREQ_DETAILS[4022] = {
        level = 54, requires = 52,
        objective = "Show Cyrus Therepentous the Black Dragonflight Molt you received from Velarok Windblade.",
        pickup = CYRUS_TEXT, turnin = CYRUS_TEXT,
        map = CYRUS_MOLT, turninMap = CYRUS_MOLT,
        requiredItems = { {10575, "Black Dragonflight Molt", 1, "Inside the Hoard of the Black Dragonflight (Trinkets...)"} },
        note = "No molt? Cyrus has another A Taste of Flame (elite): after accepting it, ask him how to prove your worth and kill the Frenzied Black Drake he summons for its molt. It opens the Blackrock Depths quest too.",
    }

    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[3463] = { items = { {10742, "Dragonflight Leggings", 2}, {10743, "Drakefire Headguard", 2}, {10744, "Axe of the Ebon Drake", 2}, {270114, "Dragonscale Pants", 2} }, choice = true }
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[3463] = 23000
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[3442] = 21000
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[3443] = 21000
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[3452] = 22000
    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[3454] = { items = { {10515, "Torch of Retribution", 1} }, choice = false }
    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[3481] = { items = { {10569, "Hoard of the Black Dragonflight", 1} }, choice = false }
    FDJ.QUEST_DONE_BY = FDJ.QUEST_DONE_BY or {}
    FDJ.QUEST_DONE_BY[4022] = { 4023 }
    local XP = FDJ.FOREVER_QUEST_XP_FALLBACK
    XP[3441] = 440; XP[3442] = 4400; XP[3443] = 4400; XP[3452] = 4700; XP[3453] = 470; XP[3454] = 4700
    XP[3462] = 470; XP[3463] = 7600; XP[3481] = 470; XP[4022] = 5450
end










do
    local XP = FDJ.FOREVER_QUEST_XP_FALLBACK

    XP[4182] = 5450; XP[4183] = 4100; XP[4184] = 4100; XP[4185] = 540
    XP[4186] = 5450; XP[4223] = 540; XP[4224] = 540
    XP[4241] = 11450
    XP[4242] = 9800
    XP[4264] = 11150; XP[4282] = 11150
    XP[4322] = 13950
    XP[6402] = 660; XP[6403] = 9950; XP[99435] = 9950
    XP[6501] = 6600
    XP[6502] = 22200

    XP[98325] = 660
    XP[4903] = 15350
    XP[4941] = 6600
    XP[4974] = 26600
    XP[6566] = 660; XP[6567] = 3300; XP[6568] = 4950; XP[6569] = 6600; XP[6570] = 4950
    XP[6582] = 6600; XP[6583] = 6600; XP[6584] = 6600; XP[6585] = 6600
    XP[6601] = 4950
    XP[6602] = 26600
end



















do
    local rfk = FDJ.DB and FDJ.DB["Razorfen Kraul"]
    for _, quest in ipairs((rfk and rfk.quests) or {}) do
        if quest.id == 6522 then
            quest.routeDrop = true
            quest.turninMap = { mapID = 1458, x = 0.562, y = 0.926, label = "Varimathras — Royal Quarter, Undercity", targetName = "Varimathras" }
        end
    end
    for _, step in ipairs(FDJ.QUEST_PREREQ_CHAINS[1848] or {}) do
        if step.id == 1838 then step.needsDungeon = true end
    end
    local D = FDJ.QUEST_PREREQ_DETAILS
    if type(D[1824]) == "table" then
        D[1824].objectiveMap = { markerType = "location", mapID = 1413, x = 0.445, y = 0.705, label = "Field of Giants — The Barrens", detail = "Silithid Creepers, Swarmers and Grubs at the mounds south of Camp Taurajo drop Twitching Antennae" }
    end
    if type(D[1838]) == "table" then
        D[1838].routeGoals = {
            { 7126, 15, spot = { markerType = "location", mapID = 1442, x = 0.730, y = 0.602, label = "Windshear Mine — Stonetalon Mountains", detail = "Windshear dwarves in and around the Windshear Mine drop Smoky Iron Ingots (15 needed)" } },
            { 7127, 10, spot = { markerType = "location", mapID = 1424, x = 0.301, y = 0.547, label = "Azurelode Mine — Hillsbrad Foothills", detail = "Hillsbrad Miners in the Azurelode Mine drop Powdered Azurite (10 needed)" } },
        }
        D[1838].routeBuy = { { 3575, "Iron Bar", 10 } }
    end
end







do
    local rfd = FDJ.DB and FDJ.DB["Razorfen Downs"]
    for _, quest in ipairs((rfd and rfd.quests) or {}) do
        if quest.id == 93604 then
            quest.routeAsk = { "Maraudon", 93404 }
            quest.routeSkipNow = true
        end

        if quest.id == 6626 then quest.routeGroupFirst = true end
    end
end


















do
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    local VARIMATHRAS = { mapID = 1458, x = 0.562, y = 0.926, label = "Varimathras — Royal Quarter, Undercity", targetName = "Varimathras" }
    if type(D[6522]) == "table" then
        D[6522].dropMap = { markerType = "dungeon", mapID = 1413, x = 0.429, y = 0.902, label = "Razorfen Kraul Entrance",
            detail = "Kill Charlga Razorflank inside Razorfen Kraul: she drops the Small Scroll" }
        if D[6522].turninMap == nil then D[6522].turninMap = VARIMATHRAS end
    end
    local rfd = FDJ.DB and FDJ.DB["Razorfen Downs"]
    for _, quest in ipairs((rfd and rfd.quests) or {}) do
        if quest.id == 6521 then
            quest.routeAsk = { "Razorfen Kraul", 6522 }
            if quest.turninMap == nil then quest.turninMap = VARIMATHRAS end
            quest.objectiveMap = { markerType = "location", mapID = 1413, x = 0.485, y = 0.956, label = "Ambassador Malcin — The Barrens",
                detail = "Ambassador Malcin is in the thorn maze before the door: kill him for his head",
                targetName = "Ambassador Malcin", kill = true,
                spawns = { { x = 0.485, y = 0.956 }, { x = 0.484, y = 0.954 }, { x = 0.480, y = 0.924 }, { x = 0.478, y = 0.906 }, { x = 0.462, y = 0.902 } } }


            quest.routeRunIn = true
        end
    end











    local MAZE = { markerType = "location", mapID = 1413, x = 0.477, y = 0.920, label = "Razorfen Downs \226\128\148 The Barrens" }
    for _, quest in ipairs((rfd and rfd.quests) or {}) do
        if quest.id == 6521 and quest.routeRunInArea == nil then
            quest.routeRunInArea = { Horde = { spot = MAZE, lineKey = "RFD_KILL_MALCIN", noteKey = "RFD_MALCIN_PLACES" } }
        elseif quest.id == 6626 and quest.routeRunInArea == nil then
            quest.routeRunInArea = { Horde = { spot = MAZE } }
        end
    end

    local words = {
        enUS = { "Kill Ambassador Malcin", "He can be in different places in the area" },
        deDE = { "Tötet Botschafter Malcin", "Er kann an verschiedenen Stellen in der Gegend sein" },
        frFR = { "Tuez l'Ambassadeur Malcin", "Il peut se trouver à différents endroits de la zone" },
        esES = { "Mata al Embajador Malcin", "Puede estar en distintos lugares de la zona" },
        itIT = { "Uccidi l'ambasciatore Malcin", "Può trovarsi in punti diversi della zona" },
        ptBR = { "Mate o Embaixador Malcin", "Ele pode estar em lugares diferentes da área" },
        ruRU = { "Убейте посла Малкина", "Он может быть в разных местах этой местности" },
        koKR = { "사절 말킨을 처치하세요", "이 지역의 여러 곳에 있을 수 있습니다" },
        zhCN = { "击杀大使玛尔金", "他可能出现在这一带的不同地方" },
        zhTW = { "擊殺大使瑪爾金", "他可能出現在這一帶的不同地方" },
    }
    words.esMX = words.esES
    for locale, pair in pairs(words) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            if t.RFD_KILL_MALCIN == nil then t.RFD_KILL_MALCIN = pair[1] end
            if t.RFD_MALCIN_PLACES == nil then t.RFD_MALCIN_PLACES = pair[2] end
        end
    end
end











do
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local AIR, EARTH, FIRE, WATER = { 7069, "Elemental Air", 1 }, { 7067, "Elemental Earth", 1 },
        { 7068, "Elemental Fire", 1 }, { 7070, "Elemental Water", 1 }
    local BATHRAH = { mapID = 1416, x = 0.804, y = 0.668, label = "Bath'rah the Windwatcher — Alterac Mountains", targetName = "Bath'rah the Windwatcher" }
    if D[8410] then
        D[8410].requiredItems = { AIR, FIRE, EARTH, WATER }
        D[8410].showRequiredIcons = true
    end
    D[8411] = {
        level = 52, requires = 50,
        objective = "Bring the elements earth, air, fire and water to Bath'rah the Windwatcher.",
        pickup = "Bath'rah the Windwatcher, Alterac Mountains",
        turnin = "Bath'rah the Windwatcher, Alterac Mountains",
        map = BATHRAH, turninMap = BATHRAH,
        requiredItems = { AIR, EARTH, FIRE, WATER },
        showRequiredIcons = true,
    }
    XP[8411] = 3800
    for _, q in ipairs((FDJ.DB and FDJ.DB["Sunken Temple"] and FDJ.DB["Sunken Temple"].quests) or {}) do
        if q.id == 8413 then q.faction = "Both" end
    end
    local FIRST = { id = 8410, name = "Elemental Mastery" }
    C[8413] = { FIRST, { id = 8412, name = "Spirit Totem" } }





    local function Apply(view)
        local faction = view
        if faction ~= "Alliance" and faction ~= "Horde" then
            if type(UnitFactionGroup) ~= "function" then return end
            local ok, own = pcall(UnitFactionGroup, "player")
            if not ok or (type(issecretvalue) == "function" and issecretvalue(own)) then return end
            faction = own
        end
        if faction == "Alliance" then
            FIRST.id, FIRST.name = 8411, "Mastering the Elements"
        elseif faction == "Horde" then
            FIRST.id, FIRST.name = 8410, "Elemental Mastery"
        end
    end
    Apply()
    if CreateFrame then
        local f = CreateFrame("Frame")
        f:RegisterEvent("PLAYER_LOGIN")
        f:SetScript("OnEvent", function() Apply() end)
    end
    function FDJ.ApplyViewFaction(faction) Apply(faction) end


    local LOC = {
        deDE = { name = "Die Beherrschung der Elemente", objective = "Bringt Bath'rah dem Windbehüter die Elemente Erde, Luft, Feuer und Wasser." },
        frFR = { name = "Maîtriser les éléments" },
        esES = { name = "Dominar los elementos" },
        ptBR = { name = "Dominando os elementos" },
        ruRU = { name = "Покорение Стихий" },
        koKR = { name = "원소에 대한 깨달음", objective = "바람의감시자 바스라에게 바람, 불, 대지, 물의 원소를 가져가야 합니다." },
        zhTW = { name = "控制元素", objective = "將土元素、風元素、火元素和水元素交給『觀風者』巴斯拉。" },
    }
    for lang, fields in pairs(LOC) do
        local c = FDJ.ContentLocales and FDJ.ContentLocales[lang]
        if c then
            c.quests = c.quests or {}
            c.quests[8411] = c.quests[8411] or {}
            for field, text in pairs(fields) do c.quests[8411][field] = text end
        end
    end
end










do
    local rfk = FDJ.DB and FDJ.DB["Razorfen Kraul"]
    local function At(x, y, label)
        return { mapID = 1413, x = x, y = y, label = label .. " — Ratchet", pickUp = true }
    end
    for _, quest in ipairs((rfk and rfk.quests) or {}) do
        if quest.id == 1221 then
            quest.routePickups = {
                { 5880, "Crate with Holes", 1, map = At(0.623, 0.377, "Crate with Holes") },
                { 6684, "Snufflenose Command Stick", 1, map = At(0.624, 0.376, "Snufflenose Command Sticks") },
                { 5897, "Snufflenose Owner's Manual", 1, map = At(0.623, 0.376, "Snufflenose Owner's Manual") },
            }
        end
    end
end
































do
    local WINGS = { ["Scarlet Monastery: Cathedral"] = { 1, 2 }, ["Scarlet Monastery: Armory"] = { 3 }, ["Scarlet Monastery: Library"] = { 4 } }
    local KRAUL = FDJ.DB and FDJ.DB["Razorfen Kraul"] and FDJ.DB["Razorfen Kraul"].entrance
    for _, name in ipairs({ "Scarlet Monastery: Graveyard", "Scarlet Monastery: Library", "Scarlet Monastery: Armory", "Scarlet Monastery: Cathedral" }) do
        local wing = FDJ.DB and FDJ.DB[name]
        for _, quest in ipairs((wing and wing.quests) or {}) do
            if quest.id == 1048 or quest.id == 1053 then quest.routeWings = WINGS end
            if quest.id == 1113 then quest.routeAsk = { "Razorfen Kraul", 1109 } end
            if quest.id == 1394 then quest.routeNoRun = true end
        end
    end
    for _, step in ipairs((FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[1394]) or {}) do
        if step.id == 1160 then step.needsDungeon = true end
    end
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    if type(D[1109]) == "table" and type(KRAUL) == "table" and KRAUL.mapID then
        D[1109].objectiveMap = { markerType = "dungeon", mapID = KRAUL.mapID, x = KRAUL.x, y = KRAUL.y, label = KRAUL.label, detail = "Kraul Bats inside Razorfen Kraul drop the Kraul Guano" }
    end
    if type(D[1150]) == "table" then










        D[1150].objectiveMap = { markerType = "location", mapID = 1441, x = 0.266, y = 0.558, label = "Roguefeather Den — Thousand Needles", detail = "Grenka Bloodscreech, in the harpies' cave, drops Grenka's Claw",
            targetName = "Grenka Bloodscreech", kill = true }
        local function P(x, y, label, keep) return { mapID = 1441, x = x, y = y, label = label, keep = keep or nil } end
        local UP, IN = "Up the path to the harpies' cave", "Into the harpies' cave"
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1441", 0.266, 0.558)] = { forward = true, nearest = true, reach = 4, leg = 3, byNet = true,
            P(0.2997, 0.4695, UP), P(0.2770, 0.4950, UP), P(0.2760, 0.4964, UP), P(0.2817, 0.5050, UP),
            P(0.2855, 0.5078, UP), P(0.2874, 0.5107, UP), P(0.2855, 0.5135, UP), P(0.2770, 0.5107, UP),
            P(0.2760, 0.5121, UP), P(0.2723, 0.5149, UP), P(0.2704, 0.5206, UP), P(0.2647, 0.5220, UP),
            P(0.2628, 0.5277, UP), P(0.2637, 0.5305, UP), P(0.2666, 0.5376, IN, true), P(0.2694, 0.5376, IN, true),
            P(0.2713, 0.5391, IN, true), P(0.2713, 0.5476, IN, true), P(0.2704, 0.5518, IN, true),
        }
    end
    if type(D[1151]) == "table" then











        local PATH = { { 0.105, 0.230 }, { 0.111, 0.240 }, { 0.140, 0.278 }, { 0.135, 0.300 }, { 0.161, 0.365 },
            { 0.173, 0.377 }, { 0.188, 0.390 }, { 0.205, 0.394 }, { 0.244, 0.425 }, { 0.256, 0.422 } }





        local line, way = {}, { forward = true, nearest = true, reach = 6, leg = 5 }
        for i, p in ipairs(PATH) do
            line[i] = { mapID = 1441, x = p[1], y = p[2] }
            way[#PATH - i + 1] = { mapID = 1441, x = p[1], y = p[2] }
        end
        D[1151].objectiveMap = { markerType = "location", mapID = 1441, x = PATH[1][1], y = PATH[1][2], label = "Rok'Alim the Pounder — Thousand Needles", detail = "Rok'Alim the Pounder patrols the west side of Thousand Needles and drops the Fragments of Rok'Alim",
            targetName = "Rok'Alim the Pounder", kill = true, patrol = { mapID = 1441, points = line },
            hintKey = "ARROW_ROKALIM_PATROL", hintAlways = true, noGetTo = true, seenPortrait = true }
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1441", PATH[1][1], PATH[1][2])] = way
    end

    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local ZONES = { [1420] = true }
    local FOOT = {
        1420, 0.6210, 0.6162, 0.6256, 0.6093, 0.6302, 0.6051, 0.6367, 0.6010, 0.6597, 0.5913, 0.6597, 0.5858, 0.6634, 0.5802, 0.6653,
        0.5789, 0.6708, 0.5775, 0.6828, 0.5775, 0.6883, 0.5747, 0.6957, 0.5733, 0.6966, 0.5719, 0.7077, 0.5692, 0.7151, 0.5650, 0.7400,
        0.5277, 0.7400, 0.5235, 0.7593, 0.4945, 0.7704, 0.4945, 0.7732, 0.4903, 0.7769, 0.4862, 0.7778, 0.4862, 0.7888, 0.4696, 0.7898,
        0.4696, 0.7962, 0.4613, 0.7990, 0.4585, 0.8018, 0.4557, 0.8045, 0.4530, 0.8082, 0.4488, 0.8128, 0.4419, 0.8138, 0.4391, 0.8147,
        0.4350, 0.8147, 0.4073, 0.8138, 0.4059, 0.8138, 0.3963, 0.8211, 0.3838, 0.8211, 0.3824, 0.8230, 0.3769, 0.8239, 0.3741, 0.8248,
        0.3700, 0.8267, 0.3603, 0.8266, 0.3368,
    }
    local LIB = {
        1420, 0.6210, 0.6162, 0.6256, 0.6093, 0.6302, 0.6051, 0.6367, 0.6010, 0.6597, 0.5913, 0.6597, 0.5858, 0.6634, 0.5802, 0.6653,
        0.5789, 0.6708, 0.5775, 0.6828, 0.5775, 0.6883, 0.5747, 0.6957, 0.5733, 0.6966, 0.5719, 0.7077, 0.5692, 0.7151, 0.5650, 0.7400,
        0.5277, 0.7400, 0.5235, 0.7593, 0.4945, 0.7704, 0.4945, 0.7732, 0.4903, 0.7769, 0.4862, 0.7778, 0.4862, 0.7888, 0.4696, 0.7898,
        0.4696, 0.7962, 0.4613, 0.7990, 0.4585, 0.8018, 0.4557, 0.8045, 0.4530, 0.8082, 0.4488, 0.8128, 0.4419, 0.8138, 0.4391, 0.8147,
        0.4350, 0.8147, 0.4073, 0.8138, 0.4059, 0.8138, 0.3963, 0.8211, 0.3838, 0.8211, 0.3824, 0.8230, 0.3769, 0.8239, 0.3741, 0.8248,
        0.3700, 0.8267, 0.3603, 0.8266, 0.3368, 0.8257, 0.3354, 0.8248, 0.3340, 0.8257, 0.3326, 0.8257, 0.3299, 0.8248, 0.3285, 0.8239,
        0.3271, 0.8239, 0.3257, 0.8230, 0.3243, 0.8230, 0.3230, 0.8239, 0.3230, 0.8248, 0.3230, 0.8248, 0.3216, 0.8257, 0.3216, 0.8266,
        0.3202, 0.8285, 0.3243, 0.8294, 0.3243, 0.8313, 0.3243, 0.8313, 0.3230, 0.8479, 0.3230, 0.8497, 0.3202, 0.8515, 0.3202, 0.8534,
        0.3243,
    }
    local GRAVE = {
        1420, 0.6210, 0.6162, 0.6256, 0.6093, 0.6349, 0.6010, 0.6367, 0.6010, 0.6570, 0.5955, 0.6653, 0.5775, 0.6828, 0.5775, 0.6883,
        0.5747, 0.6957, 0.5733, 0.6966, 0.5719, 0.7077, 0.5692, 0.7151, 0.5650, 0.7400, 0.5277, 0.7400, 0.5235, 0.7593, 0.4945, 0.7704,
        0.4945, 0.7732, 0.4903, 0.7769, 0.4862, 0.7778, 0.4862, 0.7888, 0.4696, 0.7898, 0.4696, 0.7962, 0.4613, 0.7990, 0.4585, 0.8018,
        0.4557, 0.8045, 0.4530, 0.8082, 0.4488, 0.8128, 0.4419, 0.8138, 0.4391, 0.8147, 0.4350, 0.8147, 0.4073, 0.8138, 0.4059, 0.8138,
        0.3963, 0.8211, 0.3838, 0.8211, 0.3824, 0.8230, 0.3769, 0.8239, 0.3741, 0.8248, 0.3700, 0.8257, 0.3658, 0.8267, 0.3644, 0.8267,
        0.3437, 0.8257, 0.3368, 0.8248, 0.3326, 0.8239, 0.3299, 0.8230, 0.3285, 0.8230, 0.3257, 0.8211, 0.3230, 0.8211, 0.3105, 0.8230,
        0.3078, 0.8239, 0.3078, 0.8276, 0.3050, 0.8340, 0.3064, 0.8480, 0.3037,
    }
    local function Route(list)
        local route = { forward = true, nearest = true, reach = 4, leg = 3, zones = ZONES, walkfirst = true }
        local map, x
        for _, v in ipairs(list) do
            if v > 2 then
                map = v
            elseif x then
                route[#route + 1] = { mapID = map, x = x, y = v, maps = ZONES }
                x = nil
            else
                x = v
            end
        end
        return route
    end

    local function Horde()
        local ok, side = pcall(UnitFactionGroup, "player")
        return ok and side == "Horde"
    end
    local function Set(mapID, x, y, list)
        FDJ.ARROW_VIAS_HORDE = FDJ.ARROW_VIAS_HORDE or {}
        FDJ.ARROW_VIAS_HORDE[string.format("%s|%.4f|%.4f", tostring(mapID), x, y)] = { routes = { Route(list) } }
    end
    Set(1420, 0.8535, 0.3239, LIB)
    Set(1420, 0.8480, 0.3037, GRAVE)
    Set(1420, 0.826, 0.338, FOOT)


    local swap = CreateFrame and CreateFrame("Frame")
    if swap and swap.RegisterEvent then
        swap:RegisterEvent("PLAYER_LOGIN")
        swap:SetScript("OnEvent", function()
            if Horde() then
                for key, vias in pairs(FDJ.ARROW_VIAS_HORDE or {}) do FDJ.ARROW_VIAS[key] = vias end
            end
            FDJ.ARROW_VIAS_HORDE = nil
        end)
    end
end










do
    local XP = {
        [166] = 6200, [214] = 2950, [373] = 2050, [377] = 4400, [386] = 4200, [387] = 5550,
        [388] = 5550, [391] = 4950, [707] = 700, [914] = 4300, [959] = 2650, [962] = 3300,
        [971] = 6550, [1013] = 5600, [1014] = 8850, [1048] = 12250, [1053] = 15300, [1098] = 5350,
        [1101] = 7950, [1102] = 8500, [1109] = 6950, [1142] = 7250, [1144] = 7250, [1198] = 5700,
        [1199] = 6050, [1200] = 7850, [1486] = 3100, [1487] = 4000, [1491] = 2650, [1740] = 5100,
        [1806] = 3850, [2040] = 3700, [2769] = 410, [2841] = 8200, [2904] = 5800, [2922] = 4750,
        [2924] = 5500, [2926] = 3950, [2928] = 4400, [2929] = 6200, [2930] = 6550, [2962] = 4400,
        [5722] = 1800, [5723] = 2150, [5724] = 2950, [5725] = 2950, [5728] = 2350, [5761] = 2350,
        [6561] = 7850, [6562] = 440, [6981] = 5150, [92401] = 4600, [92421] = 4600, [92422] = 4600,
        [92456] = 9400, [92489] = 9400, [95189] = 6200, [95195] = 6200, [95204] = 5450, [95216] = 5450,
        [95250] = 3900, [95795] = 6150, [96986] = 9400, [96987] = 9400, [96988] = 9400, [98823] = 6950,
        [98824] = 6150,
    }
    local fallback = FDJ.FOREVER_QUEST_XP_FALLBACK
    local function Grouped(n)
        local s = tostring(n)
        while true do
            local done
            s, done = s:gsub("^(%d+)(%d%d%d)", "%1,%2")
            if done == 0 then return s end
        end
    end
    if fallback then
        for id, xp in pairs(XP) do fallback[id] = xp end
    end
    for _, dungeon in pairs(FDJ.DB or {}) do
        for _, quest in ipairs(dungeon.quests or {}) do
            local xp = quest.id and XP[quest.id]
            if xp then
                quest.liveXPFallback = xp
                if type(quest.rewards) == "string" then
                    quest.rewards = quest.rewards:gsub("%d[%d,]* XP", Grouped(xp) .. " XP")
                end
            end
        end
    end
end



















do
    local D, C, XP = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS, FDJ.FOREVER_QUEST_XP_FALLBACK
    local function Add(dungeonName, quest, afterID)
        local db = FDJ.DB and FDJ.DB[dungeonName]
        if not db then return end
        db.quests = db.quests or {}
        local at
        for i, q in ipairs(db.quests) do
            if q.id == quest.id then return end
            if afterID and q.id == afterID then at = i end
        end
        if XP and quest.liveXPFallback then XP[quest.id] = quest.liveXPFallback end
        table.insert(db.quests, (at or #db.quests) + 1, quest)
    end
    local function Pin(dungeonName, spotName, entry)
        local pins = FDJ.MAP_QUEST_PINS and FDJ.MAP_QUEST_PINS[dungeonName]
        if not pins then return end
        for _, floor in ipairs(pins) do
            for _, spot in ipairs(floor.spots or {}) do
                if spot.name == spotName then
                    spot.quests = spot.quests or {}
                    for _, q in ipairs(spot.quests) do if q.id == entry.id then return end end
                    table.insert(spot.quests, entry)
                    return
                end
            end
        end
    end
    local share = FDJ.QUEST_SHAREABILITY_AUDIT





    Add("Blackrock Depths", {
        id = 82062, name = "Ever After",
        faction = "Both", level = 56, requires = 48, startsInDungeon = true,
        pickup = "Rugged Traveler, on a hidden ledge above the lava, Blackrock Depths",
        objective = "Speak with the Rugged Traveler.",
        turnin = "Rugged Traveler, Blackrock Depths",
        liveXPFallback = 8400,



        rewardSummary = "85s  •  Faction capitals +300",
        rewardItems = {
            { 221316, "Premo's Poise-Demanding Uniform", 1 },
            { 216619, "Student Fodder", 2, 3 },
            { 221315, "Traveler's Symbols", 3 },
        },
        note = "Take the bridge just east of the Ring of Law that runs north over the lava and clear it. On its left side, by the small brazier, jump from the railing onto the platform against the wall, follow it to the corner and keep your left shoulder on the wall until you drop onto the rock ledge below: the Rugged Traveler is there. The door on the ledge takes you to a ledge above Lord Incendius; there is no way back. Not shareable.",
    })
    if share then share[82062] = false end


    local NEW = {
        [1049] = 8450, [1050] = 8900, [1113] = 7850, [4701] = 12500, [4724] = 11850,
        [4729] = 12500, [4742] = 16200, [4764] = 4400, [4766] = 660, [4768] = 22200,
        [4769] = 660, [4771] = 23650, [4788] = 15100, [4862] = 12500, [4866] = 18900,
        [4867] = 18900, [4981] = 11850, [4982] = 11850, [5001] = 12500, [5047] = 17650,
        [5081] = 16200, [5089] = 12850, [5102] = 26600, [5125] = 21900, [5127] = 16600,
        [5160] = 17650, [5212] = 14500, [5214] = 17450, [5243] = 14500, [5251] = 17450,
        [5262] = 17450, [5263] = 18250, [5282] = 17450, [5341] = 15700, [5343] = 15700,
        [5382] = 15700, [5384] = 19700, [5463] = 14500, [5466] = 23650, [5515] = 15700,
        [5518] = 17650, [5525] = 17650, [5526] = 22200, [5529] = 14750, [5848] = 13850,
        [6163] = 9900, [7441] = 20750, [7461] = 23650, [7463] = 13200, [7481] = 19700,
        [7482] = 19700, [7483] = 3300, [7484] = 3300, [7485] = 3300, [7488] = 20200,
        [7489] = 20200, [7492] = 1500, [7494] = 1500, [7498] = 15700, [7499] = 15700,
        [7500] = 15700, [7501] = 15700, [7502] = 15700, [7503] = 15700, [7504] = 15700,
        [7505] = 15700, [7506] = 15700, [7507] = 19900, [7604] = 6600, [7629] = 13200,
        [7631] = 13200, [7647] = 19900, [7668] = 19900, [7703] = 22200, [8945] = 16600,
        [92415] = 6200, [92753] = 2700, [96393] = 3200, [96394] = 2300, [96395] = 2300,
        [96403] = 2950, [97288] = 3450, [98423] = 2550,
    }
    local function Grouped(n)
        local s = tostring(n)
        while true do
            local done
            s, done = s:gsub("^(%d+)(%d%d%d)", "%1,%2")
            if done == 0 then return s end
        end
    end
    if XP then
        for id, xp in pairs(NEW) do XP[id] = xp end
    end
    for _, dungeon in pairs(FDJ.DB or {}) do
        for _, quest in ipairs(dungeon.quests or {}) do
            local xp = quest.id and NEW[quest.id]
            if xp then
                quest.liveXPFallback = xp
                if type(quest.rewards) == "string" then
                    quest.rewards = quest.rewards:gsub("%d[%d,]* XP", Grouped(xp) .. " XP")
                end
            end
        end
    end
end




















do
    local D, C = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_PREREQ_CHAINS
    local CAMP = { mapID = 1416, x = 0.214, y = 0.882, label = "Lordamere Internment Camp — the four Forsaken traitors", goalNear = 40 }




    local LOCKER = { mapID = 1416, x = 0.1629, y = 0.8920, label = "Warden's Footlocker — downstairs in the big house west of the Lordamere Internment Camp", hint = "Open the box in the house for the key" }
    local TRAITORS = {}

    local PATROL = { mapID = 1416, x = 0.250, y = 0.600, label = "Dalaran Summoners and Elemental Slaves — Old Dalaran Ruins, east of Dalaran" }
    local VOID = { mapID = 1424, x = 0.615, y = 0.207, label = "Magus Wordeen Voidglare — Tarren Mill", targetName = "Magus Wordeen Voidglare" }
    local MEL = { mapID = 1424, x = 0.626, y = 0.206, label = "Melisara — Tarren Mill", targetName = "Melisara" }
    local FELBEN = { mapID = 1458, x = 0.466, y = 0.741, label = "Doctor Martin Felben — Undercity", targetName = "Doctor Martin Felben" }
    if D then









        if D[544] then D[544].objectiveMap = CAMP end




        local function Traitor(x, y, who) return { mapID = 1416, x = x, y = y, label = who .. " — Lordamere Internment Camp", detail = "Dropped by " .. who .. " at the Lordamere Internment Camp", kill = true } end
        if D[544] then
            D[544].requiredItems = {
                {3689, "Bloodstone Marble", 1, "Dropped by Ricter at the Lordamere Internment Camp", map = Traitor(0.1933, 0.9018, "Ricter")},
                {3690, "Bloodstone Shard", 1, "Dropped by Alina at the Lordamere Internment Camp", map = Traitor(0.1933, 0.9180, "Alina")},
                {3691, "Bloodstone Wedge", 1, "Dropped by Dermot at the Lordamere Internment Camp", map = Traitor(0.1876, 0.9141, "Dermot")},
                {3688, "Bloodstone Oval", 1, "Dropped by Kegan Darkmar, upstairs in the big house west of the Lordamere Internment Camp", map = Traitor(0.1662, 0.8909, "Kegan Darkmar")},
            }
            D[544].requiredItems[4].map.upstairs = true
            for _, item in ipairs(D[544].requiredItems) do TRAITORS[#TRAITORS + 1] = item.map end
            D[544].objectiveMap = nil
        end
        if D[93680] then
            LOCKER.pickUp = true
            LOCKER.detail = "In the Warden's Footlocker, the box downstairs in the big house west of the Lordamere Internment Camp"
            D[93680].requiredItems = { {279469, "Grimy Key", 1, LOCKER.detail, map = LOCKER} }
        end
        if D[545] then D[545].objectiveMap = PATROL end
    end
    for _, step in ipairs((C and C[96984]) or {}) do
        if step.id == 93680 then step.together = true end
    end
    local dal = FDJ.DB and FDJ.DB["City of Dalaran"]
    for _, q in ipairs((dal and dal.quests) or {}) do
        if q.id == 96984 then q.turninMap = VOID end
        if q.id == 96986 then q.turninMap = MEL end
        if q.id == 96988 then q.turninMap = FELBEN end
    end



    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local AM = 1416
    local function P(x, y, label) return { mapID = AM, x = x, y = y, label = label } end
    local SOUTH = "Round by the south, along the river to Tarren Mill"
    local EAST = "Round Dalaran's east side to Tarren Mill"
    local TOCAMP = "Along the river to the Lordamere Internment Camp"



    local toTM = {
        direct = { mapID = AM, x0 = 0.520, y0 = 0.000, x1 = 1.000, y1 = 1.000 },
        routes = {
            { nearest = true, zones = { [1416] = true, [1421] = true },
                P(0.2329, 0.8605, SOUTH), P(0.2373, 0.8895, SOUTH), P(0.2790, 0.9476, SOUTH),
                P(0.4234, 0.9944, SOUTH), P(0.5484, 0.8984, SOUTH) },
            { nearest = true, zones = { [1416] = true, [1421] = true },
                P(0.1600, 0.9163, SOUTH), P(0.1763, 0.9431, SOUTH), P(0.3073, 0.9476, SOUTH),
                P(0.3207, 0.9676, SOUTH), P(0.4234, 0.9944, SOUTH), P(0.5484, 0.8984, SOUTH) },
            { nearest = true, zones = { [1416] = true, [1421] = true },
                P(0.2180, 0.8248, SOUTH), P(0.2344, 0.8203, SOUTH), P(0.2418, 0.8962, SOUTH),
                P(0.2790, 0.9476, SOUTH), P(0.3073, 0.9476, SOUTH), P(0.3207, 0.9676, SOUTH),
                P(0.3653, 0.9699, SOUTH), P(0.4010, 0.9944, SOUTH), P(0.4234, 0.9944, SOUTH),
                P(0.5379, 0.9074, SOUTH) },
            { nearest = true, zones = { [1416] = true, [1421] = true },
                P(0.1109, 0.5190, EAST), P(0.1406, 0.5056, EAST), P(0.1853, 0.5190, EAST),
                P(0.2284, 0.5659, EAST), P(0.2790, 0.6819, EAST), P(0.3013, 0.6909, EAST),
                P(0.3802, 0.6842, EAST), P(0.4055, 0.6484, EAST), P(0.4650, 0.6216, EAST),
                P(0.4993, 0.6373, EAST), P(0.5141, 0.6596, EAST), P(0.5365, 0.7511, EAST) },
        },
    }

    local HB = { [1424] = true }
    local toCamp = { routes = { { nearest = true, zones = HB,
        P(0.5379, 0.9074, TOCAMP), P(0.4323, 0.9899, TOCAMP), P(0.4010, 0.9944, TOCAMP), P(0.3341, 0.9944, TOCAMP),
        P(0.2656, 0.9274, TOCAMP), P(0.2359, 0.8851, TOCAMP) } } }
    local toLocker = { routes = { { nearest = true, zones = HB,
        P(0.5379, 0.9074, TOCAMP), P(0.4323, 0.9899, TOCAMP), P(0.4010, 0.9944, TOCAMP), P(0.3341, 0.9944, TOCAMP),
        P(0.2998, 0.9498, TOCAMP), P(0.1912, 0.9342, TOCAMP), P(0.1763, 0.9431, TOCAMP), P(0.1600, 0.9163, TOCAMP) } } }
    local toPatrol = { routes = { { nearest = true, zones = HB,

        P(0.5484, 0.8984, "Round the hill east of Dalaran"), P(0.4323, 0.9899, "Round the hill east of Dalaran"), P(0.4010, 0.9944, "Round the hill east of Dalaran"), P(0.3564, 0.9609, "Round the hill east of Dalaran"),
        P(0.3460, 0.9275, "Round the hill east of Dalaran"), P(0.3460, 0.8471, "Round the hill east of Dalaran"), P(0.3177, 0.7868, "Round the hill east of Dalaran"), P(0.3013, 0.7645, "Round the hill east of Dalaran"),
        P(0.2671, 0.7199, "Round the hill east of Dalaran"), P(0.2656, 0.6775, "Round the hill east of Dalaran") } } }
    local function Key(s) return string.format("%s|%.4f|%.4f", tostring(s.mapID), s.x, s.y) end
    FDJ.ARROW_VIAS[Key(VOID)] = toTM
    FDJ.ARROW_VIAS[Key(MEL)] = toTM
    FDJ.ARROW_VIAS[Key(CAMP)] = toCamp
    for _, spot in ipairs(TRAITORS) do FDJ.ARROW_VIAS[Key(spot)] = toCamp end
    FDJ.ARROW_VIAS[Key(LOCKER)] = toLocker
    FDJ.ARROW_VIAS[Key(PATROL)] = toPatrol
end




do
    local WARN = {
        deDE = "Diese Quest wird außerhalb des Dungeons abgeschlossen, im See unterhalb von Unterstadt.",
        frFR = "Cette quête se termine hors du donjon, dans le lac sous Fossoyeuse.",
        esES = "Esta misión se completa fuera de la mazmorra, en el lago bajo Entrañas.",
        esMX = "Esta misión se completa fuera del calabozo, en el lago bajo Entrañas.",
        itIT = "Questa missione si completa fuori dal dungeon, nel lago sotto Sepulcra.",
        ptBR = "Esta missão é concluída fora da masmorra, no lago abaixo de Cidade Baixa.",
        ruRU = "Это задание выполняется за пределами подземелья, в озере под Подгородом.",
        koKR = "이 퀘스트는 던전 밖, 언더시티 아래의 호수에서 완료합니다.",
        zhCN = "此任务在地下城外完成，位于幽暗城下方的湖中。",
        zhTW = "此任務在地城外完成，位於幽暗城下方的湖中。",
    }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, text in pairs(WARN) do
        local c = FDJ.ContentLocales[lang]
        if not c and lang ~= "esMX" then
            c = {}
            FDJ.ContentLocales[lang] = c
        end
        if c then
            c.quests = c.quests or {}
            c.quests[1051] = c.quests[1051] or {}
            c.quests[1051].warning = text
        end
    end
end














do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local function P(x, y, label, keep) return { mapID = 1441, x = x, y = y, label = label, keep = keep or nil } end
    local CAVE = {
        P(0.5469, 0.4510, "The path up to the cave"),
        P(0.5460, 0.4430, "Up the path to the cave"),
        P(0.5365, 0.4283, "Into the cave", true),
        P(0.5374, 0.4197, "Into the cave", true),
    }
    local function Join(head, tail)
        local list = {}
        for _, point in ipairs(head) do list[#list + 1] = point end
        for _, point in ipairs(tail) do list[#list + 1] = point end
        return list
    end
    FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1441", 0.538, 0.414)] = { routes = {
        CAVE,
        Join({
            P(0.5137, 0.4964, "Along the canyon, east to the cave"),
            P(0.5213, 0.4822, "Along the canyon, east to the cave"),
            P(0.5308, 0.4766, "Along the canyon, east to the cave"),
        }, CAVE),
    } }
end
















do
    local d = FDJ.QUEST_PREREQ_DETAILS and FDJ.QUEST_PREREQ_DETAILS[1149]
    if d then


        d.objectiveMap = { mapID = 1441, x = 0.264, y = 0.324, label = "The planks — Test of Faith",
            markerType = "location", hintKey = "ARROW_JUMP_PLANKS", exact = true }
    end
end







do

    local NOTE = "Amnennar doesn't drop the Eye from his body: after killing him, click the Eye on the floor to pick it up."
    local SOURCE = "Click it after killing Amnennar the Coldbringer, the last boss of Razorfen Downs"
    local d = FDJ.DB and FDJ.DB["Razorfen Downs"]
    for _, q in ipairs((d and d.quests) or {}) do
        if q.id == 96773 or q.id == 97196 then
            q.objectiveNote = NOTE
            if type(q.requiredItem) == "table" then q.requiredItem[5] = SOURCE end
        end
    end
    local LOCAL = {
        deDE = { "Das Auge lässt sich nicht von Amnennars Leiche plündern: Klicke nach seinem Tod auf das Auge am Boden, um es aufzuheben.", "Nach dem Tod von Amnennar, dem letzten Boss, anklicken" },
        frFR = { "L'Œil ne se trouve pas sur le corps d'Amnennar : après l'avoir tué, cliquez sur l'Œil au sol pour le ramasser.", "À cliquer après avoir tué Amnennar, le dernier boss" },
        esES = { "El Ojo no está en el cuerpo de Amnennar: tras matarlo, haz clic en el Ojo del suelo para recogerlo.", "Haz clic en él tras matar a Amnennar, el último jefe" },
        esMX = { "El Ojo no está en el cuerpo de Amnennar: tras matarlo, haz clic en el Ojo del suelo para recogerlo.", "Haz clic en él tras matar a Amnennar, el último jefe" },
        itIT = { "L'Occhio non si trova sul corpo di Amnennar: dopo averlo ucciso, clicca sull'Occhio a terra per raccoglierlo.", "Cliccalo dopo aver ucciso Amnennar, l'ultimo boss" },
        ptBR = { "O Olho não está no corpo de Amnennar: depois de matá-lo, clique no Olho no chão para pegá-lo.", "Clique nele depois de matar Amnennar, o último chefe" },
        ruRU = { "Глаз нельзя забрать с тела Амненнара: после его убийства щёлкните по Глазу на полу, чтобы подобрать его.", "Щёлкните по нему после убийства Амненнара, последнего босса" },
        koKR = { "암네나르의 시체에서는 눈을 얻을 수 없습니다: 처치한 뒤 바닥에 있는 눈을 클릭해 주우세요.", "마지막 우두머리 암네나르를 처치한 뒤 클릭하세요" },
        zhCN = { "亚门纳尔的尸体上不会掉落眼睛：击杀他之后，点击地上的眼睛将其拾取。", "击杀最后一个首领亚门纳尔后点击它" },
        zhTW = { "亞門納爾的屍體上不會掉落眼睛：擊殺他之後，點擊地上的眼睛將其拾取。", "擊殺最後一個首領亞門納爾後點擊它" },
    }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, pair in pairs(LOCAL) do
        local c = FDJ.ContentLocales[lang]
        if not c and lang ~= "esMX" then
            c = {}
            FDJ.ContentLocales[lang] = c
        end
        if c then
            c.quests = c.quests or {}
            for _, id in ipairs({ 96773, 97196 }) do
                c.quests[id] = c.quests[id] or {}
                c.quests[id].objectiveNote = pair[1]
            end
            c.places = c.places or {}
            if c.places[SOURCE] == nil then c.places[SOURCE] = pair[2] end
        end
    end
end













do
    local function Gregory() return { mapID = 1448, x = 0.446, y = 0.520, label = "Gregory — Bloodvenom Falls, Felwood", targetName = "Gregory" } end
    local function Katherine() return { mapID = 1453, x = 0.486, y = 0.492, label = "Katherine the Pure — Cathedral of Light, Stormwind", targetName = "Katherine the Pure" } end
    local AT_GREGORY = "Gregory, near Bloodvenom Falls, Felwood (44.6, 52.0)"
    local AT_KATHERINE = "Katherine the Pure, Cathedral of Light, Stormwind"
    local quest = {
        classOnly = "PALADIN",
        warning = "Long chain quest: part of the Alliance Paladin storyline that also has A Brother In Need",
        objective = "Use the hints in Gregory's Note to determine where to find the magical components needed for the ritual. You will need help from allies for this.",
        rewardSummary = "1g 67s 52c",
        id = 81790,
        name = "Materials of Significance",
        faction = "Alliance",
        pickup = AT_GREGORY,
        startMap = Gregory(),
        turninMap = Gregory(),
        level = 53,
        requires = 45,
        note = "Alliance Paladin quest. How to unlock it: The Bloody Missive, then In Search of Aeonas (at the Emerald Sanctuary interact with Aeonas's horse first, then follow his trail), then speak with Aeonas and Gregory in Felwood: Gregory offers Materials of Significance. Its parts come from Felwood, Maraudon, Blackrock Depths and Hillsbrad Foothills.",
        turnin = AT_GREGORY,
        liveXPFallback = 12750,
        providedItem = {220170, "Note from Gregory", 1, "Given by Gregory when you accept the quest"},
        requiredItems = {
            {220166, "Fiery Infernal Core", 1, "Dropped by the infernals (Infernal Bodyguards, Infernal Sentries) in Shatter Scar Vale, northern Felwood", count = 3,
                map = { mapID = 1448, x = 0.430, y = 0.405, label = "Infernals — Shatter Scar Vale, Felwood" }},
            {220167, "Shimmering Grave Dust", 1, "From the grave mound in Princess Theradras's area of Maraudon", dungeon = "Maraudon"},
            {220168, "Triple-Brewed Molten Lager", 1, "Bought from Plugger Spazzring in the Grim Guzzler, Blackrock Depths", dungeon = "Blackrock Depths"},
            {220169, "Symbol of Faith", 1, "Reward from the quest A Newly Discovered Purpose...: Brave Stonetorch, Hillsbrad Foothills (67.4, 14.8)",
                map = { mapID = 1424, x = 0.674, y = 0.148, label = "Brave Stonetorch — Hillsbrad Foothills", targetName = "Brave Stonetorch" }},
        },
    }
    for _, name in ipairs({ "Maraudon", "Blackrock Depths" }) do
        local d = FDJ.DB and FDJ.DB[name]
        if d then
            d.quests = d.quests or {}
            local have = false
            for _, q in ipairs(d.quests) do if type(q) == "table" and q.id == quest.id then have = true end end
            if not have then table.insert(d.quests, quest) end
        end
    end








    local full = {}
    for _, step in ipairs(FDJ.QUEST_PREREQ_CHAINS[79946] or {}) do
        full[#full + 1] = { id = step.id, name = step.name }
    end
    for _, step in ipairs({
        { 79946, "A Brother In Need" }, { 79963, "By The Light's Grace" }, { 79970, "Aeonas the Vindicated" },
        { 81762, "Some Good News" }, { 81764, "The Mysterious Merchant" }, { 81765, "Elrick, Paladin of the Silver Hand" },
        { 81766, "The Bloody Missive" }, { 96476, "In Search of Aeonas" },
    }) do
        full[#full + 1] = { id = step[1], name = step[2] }
    end
    FDJ.QUEST_PREREQ_CHAINS[81790] = full
    local AT_CATHEDRAL_AEONAS = "Aeonas, rear chamber of the Cathedral, Scarlet Monastery"
    local function Elrick() return { mapID = 1445, x = 0.664, y = 0.454, label = "Elrick — Theramore Inn, Dustwallow Marsh", targetName = "Elrick" } end
    FDJ.QUEST_PREREQ_DETAILS[79946] = FDJ.QUEST_PREREQ_DETAILS[79946] or {
        level = 40, requires = 35,
        objective = "Find Aeonas in the Scarlet Monastery.",
        pickup = AT_KATHERINE, turnin = AT_CATHEDRAL_AEONAS, map = Katherine(),
    }
    FDJ.QUEST_PREREQ_DETAILS[79963] = FDJ.QUEST_PREREQ_DETAILS[79963] or {
        level = 40, requires = 35,
        objective = "Heal Aeonas (players report: to full health).",
        pickup = AT_CATHEDRAL_AEONAS, turnin = AT_CATHEDRAL_AEONAS,
    }
    FDJ.QUEST_PREREQ_DETAILS[79970] = FDJ.QUEST_PREREQ_DETAILS[79970] or {
        level = 40, requires = 35,
        objective = "Meet Aeonas in the Cathedral of Light in Stormwind.",
        pickup = AT_CATHEDRAL_AEONAS, turnin = "Aeonas, Cathedral of Light, Stormwind",
        turninMap = { mapID = 1453, x = 0.486, y = 0.492, label = "Aeonas the Vindicated — Cathedral of Light, Stormwind", targetName = "Aeonas the Vindicated" },
    }
    FDJ.QUEST_PREREQ_DETAILS[81762] = {
        level = 50, requires = 45,
        objective = "Speak with Katherine the Pure at the Cathedral of Light in Stormwind.",
        pickup = "Aeonas the Vindicated, Cathedral of Light, Stormwind", turnin = AT_KATHERINE,
        map = { mapID = 1453, x = 0.486, y = 0.492, label = "Aeonas the Vindicated — Cathedral of Light, Stormwind", targetName = "Aeonas the Vindicated" },
        turninMap = Katherine(),
    }
    FDJ.QUEST_PREREQ_DETAILS[81764] = {
        level = 50, requires = 45,
        objective = "Travel to Theramore and find the mysterious merchant.",
        pickup = AT_KATHERINE, turnin = "Elrick, Theramore Inn, Dustwallow Marsh (66.4, 45.4)",
        map = Katherine(), turninMap = Elrick(),
    }
    FDJ.QUEST_PREREQ_DETAILS[81765] = {
        level = 50, requires = 45,

        warning = "In a group with other paladins only one of you can pick up the note Elrick drops (the Bloody Missive). If you didn't get it, don't hand this in to the innkeeper: abandon the quest and do it again.",
        objective = "Speak with Elrick to learn more.",
        pickup = "Elrick, Theramore Inn, Dustwallow Marsh (66.4, 45.4)", turnin = "Innkeeper Janene, Theramore Inn, Dustwallow Marsh (66.6, 45.2)",
        map = Elrick(),
        turninMap = { mapID = 1445, x = 0.666, y = 0.452, label = "Innkeeper Janene — Theramore Inn, Dustwallow Marsh", targetName = "Innkeeper Janene" },
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[79970] = FDJ.FOREVER_QUEST_XP_FALLBACK[79970] or 2350
    FDJ.FOREVER_QUEST_XP_FALLBACK[81762] = 2350
    FDJ.FOREVER_QUEST_XP_FALLBACK[81764] = 4700
    FDJ.FOREVER_QUEST_XP_FALLBACK[81765] = 5900
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[81764] = 8225
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[81765] = 10325
    FDJ.PREREQ_REWARD_ITEMS_FALLBACK[79970] = FDJ.PREREQ_REWARD_ITEMS_FALLBACK[79970] or { items = { {277236, "Pauldrons of Vindication", 3} }, choice = false }
    for _, id in ipairs({ 81762, 81765 }) do FDJ.QUEST_SHAREABILITY_AUDIT[id] = false end
    FDJ.QUEST_PREREQ_DETAILS[81766] = {
        level = 50, requires = 45,
        objective = "Bring the missive to Katherine the Pure at the Cathedral of Light in Stormwind.",
        startItem = {219929, "Bloody Missive", 1, "Found on the body of the \"paladin\": the search for the \"merchant\" was a trap"},
        pickup = "Bloody Missive, found on the body of the \"paladin\"",
        turnin = AT_KATHERINE, turninMap = Katherine(),
    }
    FDJ.QUEST_PREREQ_DETAILS[96476] = {
        level = 53, requires = 45,
        objective = "Search for signs of Aeonas the Vindicated at the Emerald Sanctuary in Felwood.",
        description = "At the Emerald Sanctuary, interact with Aeonas's horse (the Silver Hand Charger, 51.0, 81.8) first, then follow Aeonas's trail in Felwood to him (45.0, 52.0). Then speak with Aeonas and Gregory: Gregory offers Materials of Significance.",
        pickup = AT_KATHERINE, map = Katherine(),
        objectiveMap = { mapID = 1448, x = 0.510, y = 0.818, label = "Aeonas's horse — Emerald Sanctuary, Felwood", targetName = "Silver Hand Charger" },
        turnin = "Aeonas the Vindicated, Felwood (45.0, 52.0)",
        turninMap = { mapID = 1448, x = 0.450, y = 0.520, label = "Aeonas the Vindicated — Felwood", targetName = "Aeonas the Vindicated" },
    }
    FDJ.FOREVER_QUEST_XP_FALLBACK[81766] = 5900
    FDJ.FOREVER_QUEST_XP_FALLBACK[96476] = 2650
    FDJ.FOREVER_QUEST_XP_FALLBACK[81790] = 12750
    FDJ.PREREQ_REWARD_MONEY_FALLBACK[81766] = 10412

    for _, id in ipairs({ 81766, 96476, 81790 }) do
        FDJ.QUEST_SHAREABILITY_AUDIT[id] = false
    end







    FDJ.QUEST_DONE_BY = FDJ.QUEST_DONE_BY or {}
    FDJ.QUEST_DONE_BY[96438] = FDJ.QUEST_DONE_BY[96438] or { 79939 }
    FDJ.QUEST_DONE_BY_LOG = FDJ.QUEST_DONE_BY_LOG or {}
    FDJ.QUEST_DONE_BY_LOG[96438] = FDJ.QUEST_DONE_BY_LOG[96438] or { 79939 }
end










FDJ.REPEAT_ONCE = FDJ.REPEAT_ONCE or {}
FDJ.REPEAT_ONCE[5122] = { 5125 }
function FDJ.DoneOnce(questID)
    local proof = FDJ.REPEAT_ONCE[questID]
    if not proof then return false end
    local db = ForeverDungeonJournalCharacterDB
    if type(db) == "table" and type(db.doneOnce) == "table" and db.doneOnce[questID] then return true end
    if C_QuestLog and type(C_QuestLog.IsQuestFlaggedCompleted) == "function" then
        for _, id in ipairs(proof) do
            local ok, done = pcall(C_QuestLog.IsQuestFlaggedCompleted, id)
            if ok and done == true then return true end
        end
    end
    return false
end
do
    local f = CreateFrame("Frame")
    f:RegisterEvent("QUEST_TURNED_IN")
    f:RegisterEvent("PLAYER_LOGIN")
    f:SetScript("OnEvent", function(_, event, questID)
        if event == "PLAYER_LOGIN" then

            for _, content in pairs(FDJ.ContentLocales or {}) do
                local src = type(content) == "table" and content.quests and content.quests[5122]
                if src then
                    local copy = content.quests[-5122] or {}
                    for k, v in pairs(src) do if copy[k] == nil then copy[k] = v end end
                    content.quests[-5122] = copy
                end
            end
            return
        end
        questID = tonumber(questID)
        if not (questID and FDJ.REPEAT_ONCE[questID]) then return end
        ForeverDungeonJournalCharacterDB = ForeverDungeonJournalCharacterDB or {}
        local db = ForeverDungeonJournalCharacterDB
        if type(db.doneOnce) ~= "table" then db.doneOnce = {} end
        db.doneOnce[questID] = true
    end)


    local d = FDJ.DB and FDJ.DB["Stratholme: Living"]
    if d and type(d.quests) == "table" then
        local at, have
        for i, q in ipairs(d.quests) do
            if type(q) == "table" and q.id == 5122 then at = i end
            if type(q) == "table" and q.id == -5122 then have = true end
        end
        if at and not have then
            local base = d.quests[at]
            table.insert(d.quests, at + 1, {
                id = -5122, name = base.name, faction = base.faction, level = base.level, requires = base.requires,
                repeatable = true, startsInDungeon = base.startsInDungeon,
                objective = base.objective, pickup = base.pickup, turnin = base.turnin, rewardSummary = "",
                note = "Repeatable, after the first The Medallion of Faith.",
            })
        end
    end
end

















do
    local M = 2548
    local SUNNYGLADE = { markerType = "location", mapID = M, x = 0.455, y = 0.523, label = "Sunnyglade — Riverglades",
        detail = "The Twilight's Hammer cultists in the ruins of Sunnyglade" }
    local CAMPS = { markerType = "location", mapID = M, x = 0.305, y = 0.452, label = "Twilight's Shroud — Riverglades",
        detail = "The Twilight camps north of Sergeant Riftan: the cultists, and the captive Farholde Scouts" }
    local CONDUIT = { markerType = "location", mapID = M, x = 0.266, y = 0.473, label = "Conduit — Twilight's Shroud",
        detail = "At the top of the tower in the south of the camp: click the portal to summon the Twilight Thrall, bring it low, then use Amberhall's Soulstone" }
    local KILGAR = { markerType = "location", mapID = M, x = 0.264, y = 0.442, label = "Overlord Kilgar — Twilight's Shroud", targetName = "Overlord Kilgar",
        detail = "In the fortress, a level 46 elite: bring a group" }
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    for id, spot in pairs({ [94877] = SUNNYGLADE, [94879] = SUNNYGLADE, [94881] = SUNNYGLADE,
        [94888] = CAMPS, [94889] = CAMPS, [94907] = CONDUIT, [94890] = KILGAR }) do
        if D[id] and D[id].objectiveMap == nil then D[id].objectiveMap = spot end
    end


    if D[94890] then D[94890].routeNote, D[94890].routeNoteArg = "ROUTE_ELITE_GROUP", 46 end
    local C = FDJ.QUEST_PREREQ_CHAINS or {}
    for _, id in ipairs({ 94981, 94974 }) do
        for _, step in ipairs(C[id] or {}) do
            if type(step) == "table" and (step.id == 94980 or step.id == 94973) then step.startsInDungeon = true end
        end
    end
    for _, step in ipairs(C[94998] or {}) do
        if type(step) == "table" and step.id == 94983 then step.needsDungeon = true end
    end






    for _, chain in pairs(C) do
        local prev
        for _, step in ipairs(type(chain) == "table" and chain or {}) do
            if type(step) == "table" and step.id == 94889 and prev and prev.id == 94888 then step.together = true end
            prev = type(step) == "table" and step or nil
        end
    end
    local kd = FDJ.DB and FDJ.DB["Krol'dok Stronghold"]
    for _, quest in ipairs((kd and kd.quests) or {}) do
        if quest.id == 94981 then
            quest.routeNoRun = true
            quest.routeBuy = { { 4304, "Thick Leather", 4 }, { 3575, "Iron Bar", 12 } }
            quest.routeBuyFirst = true
        end
    end
end
























do
    local M = 2548
    local function Spot(x, y, label, detail, extra)
        local spot = { markerType = "location", mapID = M, x = x, y = y, label = label, detail = detail }
        for k, v in pairs(extra or {}) do spot[k] = v end
        return spot
    end
    local MEADOWSBROOK = Spot(0.466, 0.813, "Meadowsbrook \226\128\148 Riverglades",
        "The farm west of Wheeler's Grange: the farmhands, and the Feed Satchels (tan grain bags)")
    local SOUTH = Spot(0.480, 0.690, "South of the river \226\128\148 Riverglades", "The Farholde Priests and Scouts south of the river")
    local SUNNYGLADE = Spot(0.455, 0.523, "Sunnyglade \226\128\148 Riverglades", "The Twilight's Hammer cultists in the ruins of Sunnyglade")
    local CAVE = Spot(0.485, 0.495, "Sunnyglade cave \226\128\148 Riverglades", "In the caves under Sunnyglade: the stairs down are near 50, 46")
    local BOLDEROK = Spot(0.760, 0.275, "Southeast of Bolder'ok \226\128\148 Riverglades", "The Twilight's Hammer camp southeast of Bolder'ok")
    local KLUNK = Spot(0.751, 0.266, "Klunk \226\128\148 Riverglades", "Kill him: he drops what Clugfist wants", { targetName = "Klunk" })
    local SHROUD = Spot(0.280, 0.420, "Twilight's Shroud \226\128\148 Riverglades", "The Twilight camps: the cultists, and the captive Rog'mar Scouts")
    local MINERS = Spot(0.265, 0.356, "Crag'rog's cave \226\128\148 Riverglades", "The ogre miners in the cave beside Crag'rog")
    local KILGAR = Spot(0.264, 0.442, "Overlord Kilgar \226\128\148 Twilight's Shroud", "In the fortress, a level 46 elite: bring a group", { targetName = "Overlord Kilgar" })
    local D = FDJ.QUEST_PREREQ_DETAILS or {}


    local function Loot(spot)
        local t = {}
        for k, v in pairs(spot) do t[k] = v end
        t.pickUp = true
        return t
    end
    for id, spot in pairs({ [93786] = MEADOWSBROOK, [93787] = Loot(MEADOWSBROOK), [94483] = SOUTH,
        [94672] = SUNNYGLADE, [94680] = SUNNYGLADE, [95601] = CAVE, [95602] = Loot(CAVE), [95427] = CAVE,
        [95424] = BOLDEROK, [95425] = KLUNK, [94748] = SHROUD, [94745] = SHROUD, [95432] = MINERS, [94768] = KILGAR }) do
        if D[id] and D[id].objectiveMap == nil then D[id].objectiveMap = spot end
    end

    if D[94768] then D[94768].routeNote, D[94768].routeNoteArg = "ROUTE_ELITE_GROUP", 46 end

    local TOGETHER = { [93787] = 93786, [94680] = 94672, [95602] = 95601, [95425] = 95424, [94745] = 94748 }
    for _, chain in pairs(FDJ.QUEST_PREREQ_CHAINS or {}) do
        local prev
        for _, step in ipairs(type(chain) == "table" and chain or {}) do
            if type(step) == "table" and TOGETHER[step.id] and prev and prev.id == TOGETHER[step.id] then step.together = true end
            prev = type(step) == "table" and step or nil
        end
    end
    local kd = FDJ.DB and FDJ.DB["Krol'dok Stronghold"]
    for _, quest in ipairs((kd and kd.quests) or {}) do
        if quest.id == 94974 then
            quest.routeNoRun = true
            quest.routeBuy = { { 4304, "Thick Leather", 4 }, { 3575, "Iron Bar", 12 } }
            quest.routeBuyFirst = true
        end
    end
end
























do
    local FER, HIN, BAD = 1444, 1425, 1418
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    local function Spot(m, x, y, label, detail, extra)
        local spot = { markerType = "location", mapID = m, x = x, y = y, label = label, detail = detail }
        for k, v in pairs(extra or {}) do spot[k] = v end
        return spot
    end

    if D[3520] and D[3520].objectiveMap == nil then



        D[3520].objectiveMap = Spot(FER, 0.475, 0.481, "Screecher Spirit — Feralas",
            "Kill the screechers here, use Yeh'kinya's Bramble on a body, then touch the spirit that appears (3 spirits)")
    end
    if D[2988] and D[2988].objectiveSpots == nil then
        local CHECK = "Click the cage to check it"
        D[2988].objectiveSpots = {
            [1] = Spot(HIN, 0.233, 0.588, "First Witherbark Cage — The Hinterlands", CHECK),
            [2] = Spot(HIN, 0.231, 0.588, "Second Witherbark Cage — The Hinterlands", CHECK),
            [3] = Spot(HIN, 0.320, 0.573, "Third Witherbark Cage — The Hinterlands", CHECK),
        }
    end
    if D[2989] and D[2989].objectiveMap == nil then
        D[2989].objectiveMap = Spot(HIN, 0.490, 0.680, "The Altar of Zul — The Hinterlands",
            "Go in through the gate on the north side and run up the pyramid's steps to the top of the altar", { exact = true })
    end







    if D[739] and D[739].objectiveMap == nil then
        D[739].objectiveMap = Spot(BAD, 0.496, 0.663, "Murdaloc — Badlands",
            "Slay Agmond's killer, Murdaloc. Slay 12 Stonevault Bonesnappers.")
    end
    if D[722] and D[722].objectiveMap == nil then
        D[722].objectiveMap = Spot(BAD, 0.390, 0.197, "Magregan Deepshadow — Badlands",
            "He carries Hammertoe's Amulet: a level 38 elite, bring a group", { targetName = "Magregan Deepshadow", kill = true })
    end








    if D[762] and D[762].objectiveMap == nil then
        D[762].objectiveMap = Spot(BAD, 0.421, 0.289, "Ambassador Infernus — Badlands",
            "He drops Ambassador Infernus' Bracer: a level 42 elite at the bottom of Angor Fortress, with stone golems", { targetName = "Ambassador Infernus", kill = true })
    end









    if D[762] and D[762].objectiveMap then
        local spot = D[762].objectiveMap
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(spot.mapID), spot.x, spot.y)] = {
            direct = { mapID = BAD, x0 = 0.395, y0 = 0.245, x1 = 0.455, y1 = 0.335 },



            directLine = "Get to the bottom of the fortress",
            { mapID = BAD, x = 0.463, y = 0.350, label = "Up the ramp into Angor Fortress" },
        }
    end
    if D[2500] and D[2500].routeGoals == nil then
        D[2500].routeGoals = {
            { 7846, 10, spot = Spot(BAD, 0.492, 0.387, "Crag Coyote Fang — Badlands", "Kill the crag coyotes here") },



            { 7847, 5, spot = Spot(BAD, 0.162, 0.586, "Buzzard Gizzard — Badlands", "Kill the buzzards here") },
            { 7848, 5, spot = Spot(BAD, 0.154, 0.377, "Rock Elemental Shard — Badlands", "Kill the rock elementals here") },
        }
    end
    if D[2199] and D[2199].routeBuy == nil then D[2199].routeBuy = { { 2842, "Silver Bar", 5 } } end
    local ud = FDJ.DB and FDJ.DB["Uldaman"]
    for _, quest in ipairs((ud and ud.quests) or {}) do
        if quest.id == 704 and quest.routePickups == nil then

            quest.routePickups = { { 4610, "Carved Stone Urn", 4, map = Spot(BAD, 0.355, 0.155, "Carved Stone Urn — Badlands",
                "On the ground at the dig site outside Uldaman", { pickUp = true }), withRun = true } }
        end
    end










    if D[2198] and D[2198].dropMap == nil then
        D[2198].dropMap = Spot(BAD, 0.473, 0.120, "Shattered Necklace — Badlands",
            "Kill the elite Shadowforge dwarves here until the Shattered Necklace drops", { goalNear = 150 })
    end
    local INSIDE = { [2201] = true, [2204] = true, [2278] = true, [2279] = true }
    for _, chain in pairs(FDJ.QUEST_PREREQ_CHAINS or {}) do
        for _, step in ipairs(type(chain) == "table" and chain or {}) do
            if type(step) == "table" then
                if INSIDE[step.id] then step.startsInDungeon = true end
                if step.id == 2200 then step.needsDungeon = true end
            end
        end
    end
end

















do
    local md = FDJ.DB and FDJ.DB["Maraudon"]
    for _, quest in ipairs((md and md.quests) or {}) do
        if quest.id == 81790 then quest.routeOptIn = true end


        if quest.id == 7044 then quest.routeGroupNow = true end





        if quest.id == 7067 then quest.warning = "Three of the five gems come from the Khans OUTSIDE the instance, in the outer caves." end












        if quest.id == 7067 and not quest.requiredItems then
            local function Spot(x, y, label) return { mapID = 1443, x = x, y = y, label = label } end
            quest.requiredItems = {
                { 17757, "Amulet of Spirits", 1, "From the Nameless Prophet, an elite centaur in the first tunnel behind Maraudon's stone doors, outside the instance. Use it on each Khan's spirit so he turns hostile.", map = Spot(0.282, 0.624, "The Nameless Prophet — outer caves of Maraudon"), noRouteStop = true },
                { 17761, "Gem of the First Khan", 1, "Outside the instance: follow the middle path from the crossroads to its end. Kolk's spirit is by the Scepter of Celebras shrine. Use the Amulet of Spirits on him, then kill him.", map = Spot(0.297, 0.605, "Kolk's spirit — outer caves of Maraudon"), noRouteStop = true },
                { 17762, "Gem of the Second Khan", 1, "Outside the instance, on the purple path: Gelk's spirit wanders between two pools of water where the rock elementals are. Use the Amulet of Spirits on him, then kill him.", map = Spot(0.294, 0.569, "Gelk's spirit — outer caves of Maraudon"), noRouteStop = true },
                { 17763, "Gem of the Third Khan", 1, "Outside the instance, on the orange path: Magra's spirit waits in a nook full of crystals beside some stairs. Use the Amulet of Spirits on him, then kill him.", map = Spot(0.358, 0.604, "Magra's spirit — outer caves of Maraudon"), noRouteStop = true },
                { 17764, "Gem of the Fourth Khan", 1, "Inside, in the purple wing: Maraudos's spirit roams between the wing's entrance and the stairs up to Lord Vyletongue. Use the Amulet of Spirits on him, then kill him." },
                { 17765, "Gem of the Fifth Khan", 1, "Inside, in the orange wing: Veng's spirit roams a long route that begins near the entrance and heads toward Razorlash. Use the Amulet of Spirits on him, then kill him." },
            }
        end
    end












    do
        local AMULET = { 17757, "Amulet of Spirits" }



        local function Spirit(x, y, who, label, side)
            return { mapID = 1443, x = x, y = y, label = label, targetName = who, clickItem = AMULET, nearKey = "ROUTE_KHAN_NEAR", getToKey = side }
        end
        for _, quest in ipairs((md and md.quests) or {}) do
            if quest.id == 7067 and quest.routePickups == nil then
                quest.routePickups = {
                    { 17757, "Amulet of Spirits", 1, map = { mapID = 1443, x = 0.282, y = 0.624,
                        label = "The Nameless Prophet — outer caves of Maraudon", targetName = "The Nameless Prophet", kill = true,
                        spawns = { { x = 0.282, y = 0.624 }, { x = 0.282, y = 0.642 }, { x = 0.288, y = 0.624 }, { x = 0.272, y = 0.631 } } } },
                    { 17761, "Gem of the First Khan", 1, afterItem = 17757, map = Spirit(0.297, 0.605, "Spirit of Kolk", "Kolk's spirit — outer caves of Maraudon", "ROUTE_SIDE_MIDDLE") },
                    { 17762, "Gem of the Second Khan", 1, afterItem = 17757, map = Spirit(0.294, 0.569, "Spirit of Gelk", "Gelk's spirit — outer caves of Maraudon", "ROUTE_SIDE_PURPLE") },
                    { 17763, "Gem of the Third Khan", 1, afterItem = 17757, map = Spirit(0.358, 0.604, "Spirit of Magra", "Magra's spirit — outer caves of Maraudon", "ROUTE_SIDE_ORANGE") },
                }
            end
        end

        local ids = FDJ.ARROW_NPC_IDS
        if type(ids) == "table" then
            for who, npc in pairs({ ["Spirit of Kolk"] = 12240, ["Spirit of Gelk"] = 12239, ["Spirit of Magra"] = 12241, ["The Nameless Prophet"] = 13718 }) do
                if ids[who] == nil then ids[who] = npc end
            end
        end
        local strings = {
            enUS = "Target the spirit, use the Amulet of Spirits on it (click its icon), then kill the Khan",
            deDE = "Visiert den Geist an, benutzt das Amulett an ihm (klickt sein Symbol) und tötet dann den Khan",
            frFR = "Ciblez l'esprit, utilisez l'amulette sur lui (cliquez sur son icône), puis tuez le khan",
            esES = "Selecciona al espíritu, usa el amuleto en él (haz clic en su icono) y luego mata al kan",
            itIT = "Seleziona lo spirito, usa l'Amulet of Spirits su di lui (clicca la sua icona), poi uccidi il Khan",
            ptBR = "Selecione o espírito, use o amuleto nele (clique no ícone) e depois mate o khan",
            ruRU = "Выберите духа целью, используйте на нем амулет (щелкните по значку), затем убейте хана",
            koKR = "영혼을 대상으로 잡고 부적을 사용한 뒤(아이콘 클릭) 칸을 처치하세요",
            zhCN = "选中灵魂，对它使用护符（点击图标），然后击杀可汗",
            zhTW = "選取靈魂，對它使用護符（點擊圖示），然後擊殺可汗",
        }
        strings.esMX = strings.esES
        for locale, text in pairs(strings) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t and t.ROUTE_KHAN_NEAR == nil then t.ROUTE_KHAN_NEAR = text end
        end
        local sides = {
            enUS = { "Get to the orange side", "Get to the purple side", "Take the middle path" },
            deDE = { "Begib dich zur orangefarbenen Seite", "Begib dich zur violetten Seite", "Nimm den mittleren Weg" },
            frFR = { "Rendez-vous du côté orange", "Rendez-vous du côté violet", "Prenez le chemin du milieu" },
            esES = { "Ve al lado naranja", "Ve al lado morado", "Toma el camino central" },
            itIT = { "Raggiungi il lato arancione", "Raggiungi il lato viola", "Prendi il percorso centrale" },
            ptBR = { "Vá para o lado laranja", "Vá para o lado roxo", "Pegue o caminho do meio" },
            ruRU = { "Доберитесь до оранжевой стороны", "Доберитесь до фиолетовой стороны", "Идите средним путем" },
            koKR = { "주황색 구역으로 가세요", "보라색 구역으로 가세요", "가운데 길로 가세요" },
            zhCN = { "前往橙色区域", "前往紫色区域", "走中间的路" },
            zhTW = { "前往橙色區域", "前往紫色區域", "走中間的路" },
        }
        sides.esMX = sides.esES
        for locale, list in pairs(sides) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t then
                for i, key in ipairs({ "ROUTE_SIDE_ORANGE", "ROUTE_SIDE_PURPLE", "ROUTE_SIDE_MIDDLE" }) do
                    if t[key] == nil then t[key] = list[i] end
                end
            end
        end
    end









    do
        local POOL = { mapID = 1443, x = 0.332, y = 0.657, label = "Orange crystal pool — outer caves of Maraudon",
            clickItem = { 17693, "Coated Cerulean Vial" }, hintKey = "ROUTE_FILL_VIAL", getToKey = "ROUTE_SIDE_ORANGE" }
        for _, quest in ipairs((md and md.quests) or {}) do
            if (quest.id == 7041 or quest.id == 7029) and quest.routePickups == nil then
                quest.routePickups = { { 17696, "Filled Cerulean Vial", 1, map = POOL } }
            end
        end
        local lines = {
            enUS = "Use the vial in the big orange crystal pool (click its icon)",
            deDE = "Benutzt das Fläschchen im großen Teich mit den orangefarbenen Kristallen (klickt sein Symbol)",
            frFR = "Utilisez la fiole dans le grand bassin aux cristaux orange (cliquez sur son icône)",
            esES = "Usa el vial en el estanque grande de cristales naranjas (haz clic en su icono)",
            itIT = "Usa la fiala nella grande pozza di cristalli arancioni (clicca la sua icona)",
            ptBR = "Use o frasco na grande poça de cristais laranja (clique no ícone)",
            ruRU = "Используйте флакон в большом водоеме с оранжевыми кристаллами (щелкните по значку)",
            koKR = "주황색 수정이 있는 큰 웅덩이에서 약병을 사용하세요 (아이콘 클릭)",
            zhCN = "在有橙色水晶的大水池里使用药瓶（点击图标）",
            zhTW = "在有橙色水晶的大水池裡使用藥瓶（點擊圖示）",
        }
        lines.esMX = lines.esES
        for locale, text in pairs(lines) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t and t.ROUTE_FILL_VIAL == nil then t.ROUTE_FILL_VIAL = text end
        end
        FDJ.ContentLocales = FDJ.ContentLocales or {}
        for lang, text in pairs({
            deDE = "Teich mit orangefarbenen Kristallen — äußere Höhlen von Maraudon",
            frFR = "Bassin aux cristaux orange — grottes extérieures de Maraudon",
            esES = "Estanque de cristales naranjas — cuevas exteriores de Maraudon",
            itIT = "Pozza di cristalli arancioni — grotte esterne di Maraudon",
            ptBR = "Poça de cristais laranja — cavernas externas de Maraudon",
            ruRU = "Водоем с оранжевыми кристаллами — внешние пещеры Мародона",
            koKR = "주황색 수정 웅덩이 — 마라우돈 외부 동굴",
            zhCN = "橙色水晶水池 — 玛拉顿外围洞穴",
            zhTW = "橙色水晶水池 — 瑪拉頓外圍洞穴",
        }) do
            local content = FDJ.ContentLocales[lang] or {}
            FDJ.ContentLocales[lang] = content
            content.places = content.places or {}
            if content.places[POOL.label] == nil then content.places[POOL.label] = text end
        end
    end





    do
        local IMG = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\MaraudonVylestemVine"
        local CAPTION = "Use the Filled Cerulean Vial on these plants, the Vylestem Vines. They can't be clicked or targeted, so look out for them in the orange wing."
        for _, quest in ipairs((md and md.quests) or {}) do
            if (quest.id == 7041 or quest.id == 7029) and quest.noteImage == nil then




                quest.note = CAPTION
                quest.noteImage = { file = IMG, size = 190 }
            end
        end
        FDJ.ContentLocales = FDJ.ContentLocales or {}
        for lang, text in pairs({
            deDE = "Benutzt das gefüllte Fläschchen an diesen Pflanzen. Man kann sie weder anklicken noch anvisieren, also haltet im orangefarbenen Flügel nach ihnen Ausschau.",
            frFR = "Utilisez la fiole remplie sur ces plantes. On ne peut ni cliquer dessus ni les cibler : repérez-les dans l'aile orange.",
            esES = "Usa el vial lleno en estas plantas. No se pueden pulsar ni seleccionar, así que búscalas en el ala naranja.",
            itIT = "Usa la Filled Cerulean Vial su queste piante. Non si possono cliccare né selezionare, quindi cercale nell'ala arancione.",
            ptBR = "Use o frasco cheio nestas plantas. Não dá para clicar nelas nem selecioná-las, então fique de olho nelas na ala laranja.",
            ruRU = "Используйте наполненный флакон на этих растениях. Их нельзя ни выбрать целью, ни щелкнуть по ним, так что ищите их в оранжевом крыле.",
            koKR = "채워진 약병을 이 식물에 사용하세요. 클릭하거나 대상으로 잡을 수 없으니 주황색 구역에서 잘 찾아보세요.",
            zhCN = "对这些植物使用装满的药瓶。它们无法点击也无法选中，请在橙色区域留意寻找。",
            zhTW = "對這些植物使用裝滿的藥瓶。它們無法點擊也無法選取，請在橙色區域留意尋找。",
        }) do
            local content = FDJ.ContentLocales[lang] or {}
            FDJ.ContentLocales[lang] = content
            content.places = content.places or {}
            if content.places[CAPTION] == nil then content.places[CAPTION] = text end
        end
    end
    local pariah = FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[7067]
    if pariah and pariah.hintKey == nil then pariah.hintKey = "ROUTE_PARIAH_WALKS" end
end










do
    local md = FDJ.DB and FDJ.DB["Maraudon"]
    local TREE = { mapID = 2652, x = 0.699, y = 0.721, label = "Woodwyrd \226\128\148 Forlorn Gardens, Shen'dralas", targetName = "Woodwyrd",
        clickItem = { 258296, "Vial of Earth Song Water" }, nearKey = "ROUTE_USE_VIAL_TREE" }
    local KOGTHUG = { mapID = 2652, x = 0.726, y = 0.314, label = "Kog'thug the Brave \226\128\148 Bristleback Retreat, Shen'dralas", targetName = "Kog'thug the Brave" }
    for _, quest in ipairs((md and md.quests) or {}) do
        if quest.id == 93404 and quest.routeRunItem == nil then
            quest.routeRunItem = { 258296, "Vial of Earth Song Water", 1, map = TREE }
        end
        if quest.id == 7070 or quest.id == 7068 then quest.routeLowDrop = true end






        if quest.id == 93404 and quest.routeFollow == nil then
            local follow = { id = 93601, name = "Passing the Blame", turnin = KOGTHUG,
                next = { id = 93604, name = "Agamaggan's Blood" } }
            quest.routeFollow = { Alliance = follow, Horde = follow }
        end
    end
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for lang, text in pairs({
        deDE = "Kog'thug the Brave \226\128\148 Zuflucht der Borstennacken, Shen'dralas",
        frFR = "Kog'thug the Brave \226\128\148 Retraite des Hérisse-dos, Shen'dralas",
        esES = "Kog'thug the Brave \226\128\148 Refugio Erizapellejo, Shen'dralas",
        esMX = "Kog'thug the Brave \226\128\148 Refugio Erizapellejo, Shen'dralas",
        itIT = "Kog'thug the Brave \226\128\148 Rifugio dei Bristleback, Shen'dralas",
        ptBR = "Kog'thug the Brave \226\128\148 Refúgio dos Bristleback, Shen'dralas",
        ruRU = "Kog'thug the Brave \226\128\148 Убежище Иглогривых, Shen'dralas",
        koKR = "Kog'thug the Brave \226\128\148 뾰족등 은신처, Shen'dralas",
        zhCN = "Kog'thug the Brave \226\128\148 鬃背野猪人避难所，Shen'dralas",
        zhTW = "Kog'thug the Brave \226\128\148 鬃背野豬人避難所，Shen'dralas",
    }) do
        local content = FDJ.ContentLocales[lang] or {}
        FDJ.ContentLocales[lang] = content
        content.places = content.places or {}
        if content.places[KOGTHUG.label] == nil then content.places[KOGTHUG.label] = text end
    end
    local lines = {
        enUS = "Use the vial on the burning tree next to Woodwyrd (click its icon)",
        deDE = "Benutzt das Fläschchen am brennenden Baum neben Woodwyrd (klickt sein Symbol)",
        frFR = "Utilisez la fiole sur l'arbre en feu à côté de Woodwyrd (cliquez sur son icône)",
        esES = "Usa el vial en el árbol en llamas junto a Woodwyrd (haz clic en su icono)",
        itIT = "Usa la fiala sull'albero in fiamme accanto a Woodwyrd (clicca la sua icona)",
        ptBR = "Use o frasco na árvore em chamas ao lado de Woodwyrd (clique no ícone)",
        ruRU = "Используйте флакон на горящем дереве рядом с Woodwyrd (щелкните по значку)",
        koKR = "Woodwyrd 옆의 불타는 나무에 약병을 사용하세요 (아이콘 클릭)",
        zhCN = "对Woodwyrd旁边燃烧的树使用药瓶（点击图标）",
        zhTW = "對Woodwyrd旁邊燃燒的樹使用藥瓶（點擊圖示）",
    }
    lines.esMX = lines.esES
    for locale, text in pairs(lines) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ROUTE_USE_VIAL_TREE == nil then t.ROUTE_USE_VIAL_TREE = text end
    end
end








do
    local md = FDJ.DB and FDJ.DB["Maraudon"]
    local MOONGLADE = { mapID = 1450, name = "Moonglade", enUS = "Moonglade", deDE = "Mondlichtung",
        frFR = "Reflet-de-Lune", esES = "Claro de la Luna", esMX = "Claro de la Luna", itIT = "Radaluna",
        ptBR = "Clareira da Lua", ruRU = "Лунная поляна", koKR = "달의 숲", zhCN = "月光林地", zhTW = "月光林地" }
    for _, quest in ipairs((md and md.quests) or {}) do
        if quest.id == 7066 and quest.routeFarTurnIn == nil then quest.routeFarTurnIn = MOONGLADE end
    end
    local lines = {
        enUS = "This turn-in is in %s",
        deDE = "Diese Quest wird in %s abgegeben",
        frFR = "Cette quête se rend à : %s",
        esES = "Esta misión se entrega en %s",
        itIT = "Questa missione si consegna a: %s",
        ptBR = "Esta missão é entregue em %s",
        ruRU = "Это задание сдается в локации «%s»",
        koKR = "이 퀘스트는 %s에서 완료합니다",
        zhCN = "此任务在%s交付",
        zhTW = "此任務在%s交付",
    }
    lines.esMX = lines.esES
    for locale, text in pairs(lines) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ARROW_TURNIN_ZONE == nil then t.ARROW_TURNIN_ZONE = text end
    end
end























do
    FDJ.ROUTE_ON_WAY = FDJ.ROUTE_ON_WAY or {}
    local SITE = { mapID = 1418, x = 0.400, y = 0.145 }
    FDJ.ROUTE_ON_WAY["Uldaman"] = {
        at = {
            mapID = 1418, x0 = 0.330, y0 = 0.070, x1 = 0.470, y1 = 0.245,
            quests = { [709] = true, [721] = true, [722] = true, [723] = true, [1360] = true, [2342] = true,
                [704] = true, [17] = true, [2202] = true, [2418] = true, [2198] = true, [2283] = true },
        },
        { quest = 704, area = SITE },
        { quest = 17, area = SITE },
        { quest = 2202, area = SITE },
        { quest = 2418, area = SITE },
    }
end













do
    local D = FDJ.QUEST_PREREQ_DETAILS

    for _, id in ipairs({
        4974, 6569, 4903, 4734, 4735, 1109, 93404, 7629, 7642, 5463, 7643, 5382,
        5515, 5384, 4241, 3527, 3528, 78261, 78676, 79946, 79963
    }) do
        if D[id] then D[id].objectiveInDungeon = true end
    end

    for _, id in ipairs({
        5089, 6522, 373, 4264, 79970
    }) do
        if D[id] then D[id].dungeonStep = true end
    end

    local outside = {}
    for _, id in ipairs({
        3765, 1806, 6562, 4128, 4133, 4324, 7492, 7494, 5250, 98823, 98824, 2926,
        2843, 2948, 2950, 94998, 6626, 6521, 1848, 1782, 96016, 79442, 6141, 78699,
        78307, 168, 167, 5961, 8233, 8417, 8254, 8415, 8250, 8151, 9063, 96078,
        95799, 95798, 704, 707, 2341, 2418, 2361, 709, 2439, 2440, 4766, 4769,
        2861, 2769, 2864
    }) do
        outside[id] = true
    end
    for _, dungeon in pairs(FDJ.DB or {}) do
        for _, quest in ipairs(type(dungeon) == "table" and dungeon.quests or {}) do
            if type(quest) == "table" and outside[quest.id] then quest.dungeonStep = false end
        end
    end
end








do
    local D = FDJ.QUEST_PREREQ_DETAILS
    if D and D[2198] then
        D[2198].warning = "Farm the elites outside Uldaman for the necklace."
        D[2198].warningTop = true
    end
    local ud = FDJ.DB and FDJ.DB["Uldaman"]
    for _, quest in ipairs((ud and ud.quests) or {}) do
        if type(quest) == "table" and quest.id == 704 then


            quest.warning = "This is completed in the area outside the dungeon."
        end




        if type(quest) == "table" and quest.id == 2418 then
            quest.warning = "The power stones can also drop from elite dwarves outside the dungeon."
        end
    end
end







do
    local rfd = FDJ.DB and FDJ.DB["Razorfen Downs"]
    for _, quest in ipairs((rfd and rfd.quests) or {}) do
        if type(quest) == "table" and quest.id == 6626 and quest.warning == nil then
            quest.warning = "This is completed in the area outside the dungeon."
        end
    end
end








do
    local mara = FDJ.DB and FDJ.DB["Maraudon"]
    for _, quest in ipairs((mara and mara.quests) or {}) do
        if type(quest) == "table" and (quest.id == 7070 or quest.id == 7068) and quest.warning == nil then
            quest.warning = "This is completed in the area outside the dungeon."
        end
    end
end







do
    local D = FDJ.QUEST_PREREQ_DETAILS
    if D and D[4262] and D[4262].warning == nil then
        D[4262].warning = "This is completed right outside the dungeon entrance."
        D[4262].warningTop = true
    end
end





do
    local D = FDJ.QUEST_PREREQ_DETAILS
    if D and D[4361] and D[4361].dungeonStep == nil then D[4361].dungeonStep = false end
end










do
    local page = FDJ.DB and FDJ.DB["Blackrock Depths"]
    for _, quest in ipairs((page and page.quests) or {}) do
        if type(quest) == "table" and quest.id == 4123 then
            if quest.warning == nil then
                quest.warning = "Your group needs 12 Relic Coffer Keys to open all the Relic Coffer doors in the Black Vault. Once they are all open, Watchman Doomgrip spawns: he drops the key for this quest."
            end
            if quest.requiredItems == nil then
                quest.requiredItems = {
                    { 11078, "Relic Coffer Key", 1, "Drops from the Dark Iron dwarves inside Blackrock Depths, or buy it from the auction house.", count = 12 },
                }
            end
        end
    end
end



do
    local page = FDJ.DB and FDJ.DB["Blackrock Depths"]
    for _, boss in ipairs((page and page.bosses) or {}) do
        if type(boss) == "table" and boss.name == "Secret Safe" and boss.lootNote == nil then
            boss.lootNote = "LOOT_NOTE_SECRET_SAFE"
        end
    end
    local lines = {
        enUS = "12 Relic Coffer Keys vault event",
        deDE = "Gewölbe-Event: 12 Relic Coffer Keys",
        frFR = "Événement de la chambre forte : 12 Relic Coffer Keys",
        esES = "Evento de la cámara: 12 Relic Coffer Keys",
        itIT = "Evento della camera blindata: 12 Relic Coffer Key",
        ptBR = "Evento do cofre: 12 Relic Coffer Keys",
        ruRU = "Событие хранилища: 12 ключей Relic Coffer Key",
        koKR = "금고 이벤트: Relic Coffer Key 12개",
        zhCN = "宝库事件：12把Relic Coffer Key",
        zhTW = "寶庫事件：12把Relic Coffer Key",
    }
    lines.esMX = lines.esES
    for locale, text in pairs(lines) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.LOOT_NOTE_SECRET_SAFE == nil then t.LOOT_NOTE_SECRET_SAFE = text end
    end
end














do
    local D = FDJ.QUEST_PREREQ_DETAILS
    for _, id in ipairs({ 721, 722, 723, 2283 }) do
        if D and D[id] then
            D[id].dungeonStep = false
            D[id].objectiveInDungeon = false
            D[id].startsInDungeon = nil
        end
    end


    for _, id in ipairs({ 721, 722 }) do
        if D and D[id] then
            D[id].warning = "This is completed OUTSIDE the instance."
            D[id].warningTop = true
        end
    end
end







do
    local D = FDJ.QUEST_PREREQ_DETAILS
    if D and D[2201] then
        D[2201].warning = "Complete this quest before killing the last boss."
        D[2201].warningTop = true
    end
end













do
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", "1418", 0.379, 0.106)] = { forward = true,
        { mapID = 1418, x = 0.443, y = 0.120, label = "Into the excavation cave" },
    }
end









do
    local ud = FDJ.DB and FDJ.DB["Uldaman"]
    for _, quest in ipairs((ud and ud.quests) or {}) do
        if type(quest) == "table" and (quest.id == 17 or quest.id == 2202) then
            quest.warning = "The Magenta Fungus Caps can also be picked up outside the dungeon."
        end
    end
end












do
    local IMG = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\UldamanExcavationMinimap"
    local ud = FDJ.DB and FDJ.DB["Uldaman"]
    for _, quest in ipairs((ud and ud.quests) or {}) do
        if type(quest) == "table" and quest.id == 709 then
            quest.warning = "The Tablet of Ryun'eh is in the Ancient Chest outside the instance."
            quest.noteImage = { file = IMG, size = 190, marks = { { x = 0.6246, y = 0.7275, item = 4631 } },
                caption = "Minimap, outside Uldaman: the icon marks the Ancient Chest." }
        end
    end
    local D = FDJ.QUEST_PREREQ_DETAILS
    if D and D[722] then
        D[722].noteImage = { file = IMG, size = 190, marks = { { x = 0.6246, y = 0.7275, item = 4635 } },
            caption = "Minimap, outside Uldaman: the icon marks Magregan Deepshadow." }
    end
end















do
    local IMG = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\UldamanCommonHallMinimap"
    local ud = FDJ.DB and FDJ.DB["Uldaman"]
    for _, quest in ipairs((ud and ud.quests) or {}) do
        if type(quest) == "table" and quest.id == 1360 then
            quest.warning = "Krom Stoutarm's Treasure is in his chest outside the instance."
            quest.noteImage = { file = IMG, size = 190, marks = { { x = 0.5379, y = 0.7112, item = 8027 } },
                caption = "Minimap, outside Uldaman: the icon marks Krom Stoutarm's Chest." }
        end
        if type(quest) == "table" and quest.id == 2342 then
            quest.warning = "The Garrett Family Treasure is in the family chest outside the instance."
        end
    end
end








FDJ.QUEST_PREREQ_CHAINS[5282] = {
    { id = 5281, name = "The Restless Souls" },
}
FDJ.QUEST_PREREQ_DETAILS[5281] = {
    level = 60,
    requires = 55,
    objective = "Find Egan. You only know that he was last seen around Stratholme.",


    objectiveInDungeon = false,
    pickup = "Caretaker Alen, Light's Hope Chapel, Eastern Plaguelands",
    turnin = "Egan, Terrordale, Eastern Plaguelands",
    map = FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[5281],
}
FDJ.FOREVER_QUEST_XP_FALLBACK[5281] = FDJ.FOREVER_QUEST_XP_FALLBACK[5281] or 6600














do
    local BAD = 1418
    local function Spot(x, y, label, detail)
        return { markerType = "location", mapID = BAD, x = x, y = y, label = label, detail = detail, pickUp = true }
    end
    local CHESTS = {
        [709] = { 4631, "Tablet of Ryun'eh", Spot(0.393, 0.188, "Ancient Chest — Badlands",
            "In the Sealed Hall before the instance portal, in the excavation caves") },
        [1360] = { 8027, "Krom Stoutarm's Treasure", Spot(0.356, 0.235, "Krom Stoutarm's Chest — Badlands",
            "At the end of the North Common Hall, in the excavation caves") },
        [2342] = { 8026, "Garrett Family Treasure", Spot(0.342, 0.186, "Garrett Family Chest — Badlands",
            "In the South Common Hall, in the excavation caves") },
    }
    local ud = FDJ.DB and FDJ.DB["Uldaman"]
    for _, quest in ipairs((ud and ud.quests) or {}) do
        local chest = type(quest) == "table" and CHESTS[quest.id] or nil
        if chest and quest.routePickups == nil then
            quest.routePickups = { { chest[1], chest[2], 1, map = chest[3] } }
        end
    end
    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    for _, chest in pairs(CHESTS) do
        local spot = chest[3]
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(BAD), spot.x, spot.y)] = { forward = true,
            { mapID = BAD, x = 0.443, y = 0.120, label = "Into the excavation cave" },
        }
    end
end








for _, quest in ipairs((FDJ.DB and FDJ.DB["Uldaman"] and FDJ.DB["Uldaman"].quests) or {}) do
    if quest.id == 2439 or quest.id == 2361 then quest.routeNoRun = true end
end







for _, quest in ipairs((FDJ.DB and FDJ.DB["Uldaman"] and FDJ.DB["Uldaman"].quests) or {}) do
    if quest.id == 2418 then quest.routeLowDrop = true end
end











do
    for _, quest in ipairs((FDJ.DB and FDJ.DB["Uldaman"] and FDJ.DB["Uldaman"].quests) or {}) do
        if quest.id == 709 then
            quest.routeFollow = {
                Alliance = { id = 727, name = "To Ironforge for Yagyin's Digest",
                    turnin = { mapID = 1455, x = 0.508, y = 0.056, label = "Gerrig Bonegrip \226\128\148 The Forlorn Cavern, Ironforge", targetName = "Gerrig Bonegrip" } },
                Horde = { id = 728, name = "To the Undercity for Yagyin's Digest",
                    turnin = { mapID = 1458, x = 0.538, y = 0.544, label = "Keeper Bel'dugur \226\128\148 The Apothecarium, Undercity", targetName = "Keeper Bel'dugur" } },
            }
        end
    end
    local NAMES = {
        [727] = { deDE = "Auf nach Ironforge zu 'Yagyins Zusammenstellung'", frFR = "Aller à Ironforge chercher le « Sommaire de Yagyin »",
            esES = "Ir a Forjaz a buscar el \"Compendio\" de Yagyin", ptBR = "Em busca do Compêndio de Yagyin em Altaforja",
            ruRU = "В Стальгорн за книгой Йагина", koKR = "야그인의 법전을 찾아서", zhCN = "远赴铁炉堡", zhTW = "遠赴鐵爐堡" },
        [728] = { deDE = "Auf nach Undercity zu 'Yagyins Zusammenstellung'", frFR = "Pour le « Sommaire de Yagyin »",
            esES = "Ir a Entrañas a buscar el \"Compendio\" de Yagyin", ptBR = "Em busca do compêndio de Yagyin na Cidade Baixa",
            ruRU = "В Подгород за книгой Йагина", koKR = "야그인의 법전을 찾아서", zhCN = "远赴幽暗城", zhTW = "遠赴幽暗城" },
    }
    FDJ.ContentLocales = FDJ.ContentLocales or {}
    for id, list in pairs(NAMES) do
        list.esMX = list.esES
        for lang, text in pairs(list) do
            local content = FDJ.ContentLocales[lang] or {}
            FDJ.ContentLocales[lang] = content
            content.quests = content.quests or {}
            content.quests[id] = content.quests[id] or {}
            if content.quests[id].name == nil then content.quests[id].name = text end
        end
    end
end


























do
    local SOS, TAN, FER, RAT, HIN, UNG, AZS, WPL, FEL, BL = 1435, 1446, 1444, 1413, 1425, 1449, 1447, 1422, 1448, 1419
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    local function Spot(m, x, y, label, detail, extra)
        local spot = { markerType = "location", mapID = m, x = x, y = y, label = label, detail = detail }
        for k, v in pairs(extra or {}) do spot[k] = v end
        return spot
    end
    local function Goals(id, list)
        if D[id] and D[id].routeGoals == nil then D[id].routeGoals = list end
    end
    local function Find(id, spot)
        if D[id] and D[id].objectiveMap == nil then D[id].objectiveMap = spot end
    end

    Find(1448, Spot(SOS, 0.702, 0.529, "Temple of Atal'Hakkar — Swamp of Sorrows",
        "Swim out to the temple ruins in the middle of the Pool of Tears"))
    Goals(1452, {
        { 6257, 3, spot = Spot(TAN, 0.454, 0.385, "Roc Gizzard — Tanaris", "Kill the birds here") },
        { 6259, 3, spot = Spot(FER, 0.585, 0.587, "Groddoc Liver — Feralas", "Kill the Groddoc apes here") },
        { 6258, 3, spot = Spot(FER, 0.537, 0.480, "Ironfur Liver — Feralas", "Kill the Ironfur bears here") },
    })

    Find(3444, Spot(RAT, 0.625, 0.385, "Stone Circle — Ratchet",
        "Open Marvon's Chest outside the small hut by the shore", { exact = true, pickUp = true }))

    local zf = FDJ.DB and FDJ.DB["Zul'Farrak"] and FDJ.DB["Zul'Farrak"].entrance
    if type(zf) == "table" and zf.mapID then
        Find(3527, { markerType = "dungeon", mapID = zf.mapID, x = zf.x, y = zf.y, label = zf.label,
            detail = "Both tablets drop from bosses inside Zul'Farrak" })
    end




    Find(4787, Spot(HIN, 0.576, 0.868, "Ancient Egg — The Hinterlands",
        "In the cave behind the amphitheater at the top of Jintha'Alor: trolls patrol around the egg",
        { exact = true, pickUp = true, noteKey = "ROUTE_EGG_CLIMB" }))
    do
        local strings = {
            enUS = "Climb to the top of Jintha'Alor. Find a group.",
            deDE = "Klettere ganz nach oben auf Jintha'Alor. Such dir eine Gruppe.",
            frFR = "Grimpez au sommet de Jintha'Alor. Trouvez un groupe.",
            esES = "Sube a lo alto de Jintha'Alor. Busca un grupo.",
            itIT = "Sali in cima a Jintha'Alor. Trova un gruppo.",
            ptBR = "Suba até o topo de Jintha'Alor. Encontre um grupo.",
            ruRU = "Поднимитесь на вершину Джинта'Алора. Найдите группу.",
            koKR = "진타알로 꼭대기로 올라가세요. 파티를 구하세요.",
            zhCN = "爬到辛萨罗的顶部。请找队伍。",
            zhTW = "爬到辛薩羅的頂部。請找隊伍。",
        }
        strings.esMX = strings.esES
        for locale, text in pairs(strings) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t and t.ROUTE_EGG_CLIMB == nil then t.ROUTE_EGG_CLIMB = text end
        end
    end











    do
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        local CAVE = "Follow the cave to its end"
        local function P(x, y) return { mapID = HIN, x = x, y = y, label = CAVE, keep = true, labelNear = 150 } end
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(HIN), 0.576, 0.868)] = {
            forward = true, nearest = true, reach = 4, leg = 3, byNet = true, indoors = true,
            P(0.5850, 0.7752), P(0.5850, 0.7833), P(0.5871, 0.7865), P(0.5871, 0.7881), P(0.5785, 0.8011),
            P(0.5774, 0.8157), P(0.5752, 0.8190), P(0.5741, 0.8190), P(0.5741, 0.8206), P(0.5731, 0.8206),
            P(0.5720, 0.8239), P(0.5720, 0.8271), P(0.5676, 0.8336), P(0.5514, 0.8336), P(0.5503, 0.8352),
            P(0.5471, 0.8352), P(0.5460, 0.8369), P(0.5460, 0.8417), P(0.5482, 0.8450), P(0.5503, 0.8466),
            P(0.5601, 0.8466), P(0.5676, 0.8580), P(0.5698, 0.8580), P(0.5763, 0.8677),
        }
        local LINES = { deDE = "Der Höhle bis zum Ende folgen", frFR = "Suivez la grotte jusqu'au bout",
            esES = "Sigue la cueva hasta el final", itIT = "Segui la grotta fino in fondo",
            ptBR = "Siga a caverna até o fim", ruRU = "Пройдите пещеру до конца", koKR = "동굴 끝까지 따라가세요",
            zhCN = "沿着洞穴走到尽头", zhTW = "沿著洞穴走到盡頭" }
        FDJ.ContentLocales = FDJ.ContentLocales or {}
        for lang, line in pairs(LINES) do
            local content = FDJ.ContentLocales[lang] or {}
            FDJ.ContentLocales[lang] = content
            content.places = content.places or {}
            if content.places[CAVE] == nil then content.places[CAVE] = line end
        end
    end
    local st = FDJ.DB and FDJ.DB["Sunken Temple"]
    for _, quest in ipairs((st and st.quests) or {}) do
        if quest.id == 3528 and quest.routeAsk == nil then
            quest.routeAsk = { "Zul'Farrak", 3527 }
            quest.routeSkipNow = true
        end
    end

    Goals(4141, { { 11316, 15, spot = Spot(UNG, 0.670, 0.301, "Bloodpetal — Un'Goro Crater", "Kill the Bloodpetal plants in the zone") } })

    Goals(9052, {
        { 22435, 8, spot = Spot(UNG, 0.483, 0.815, "Gorishi Sting — Un'Goro Crater", "Kill the Gorishi wasps here") },
        { 22434, 8, spot = Spot(UNG, 0.375, 0.652, "Bloodcap — Un'Goro Crater",
            "Pick the Bloodcaps from the Bloodpetal Sprouts on the ground around here (green bulbs)") },
    })

    Find(9051, Spot(UNG, 0.573, 0.618, "Devilsaur — Un'Goro Crater", "Use the Devilsaur Barb on any devilsaur (click its icon)", {
        clickItem = { 22432, "Devilsaur Barb" },
        spawns = { { x = 0.573, y = 0.618 }, { x = 0.501, y = 0.607 }, { x = 0.742, y = 0.330 },
            { x = 0.573, y = 0.237 }, { x = 0.312, y = 0.364 }, { x = 0.346, y = 0.224 } },
    }))





    Goals(8153, { { 20017, 2, spot = Spot(AZS, 0.579, 0.235, "Perfect Courser Antler — Azshara", "Kill the Mosshoof Coursers here", { goalNear = 250 }) } })
    Goals(8231, { { 20087, 6, spot = Spot(AZS, 0.862, 0.311, "Wavethrasher Scales — Azshara", "Kill the wavethrashers along the shore here") } })

    Goals(8251, { { 20028, 10, spot = Spot(AZS, 0.567, 0.281, "Glittering Dust — Azshara", "Kill the blood elves here") } })
    Goals(8252, { { 20029, 6, spot = Spot(AZS, 0.405, 0.521, "Enchanted Coral — Azshara", "Kill the Spitelash Sirens here") } })

    Goals(8414, { { 12840, 20, spot = Spot(WPL, 0.508, 0.805, "Minion's Scourgestone — Western Plaguelands", "Kill the Scourge here") } })

    Goals(8255, { { 20027, 4, spot = Spot(AZS, 0.579, 0.235, "Healthy Courser Gland — Azshara", "Kill the Mosshoof Coursers here", { goalNear = 250 }) } })
    Goals(8256, { { 7972, 1, spot = Spot(AZS, 0.166, 0.694, "Ichor of Undeath — Azshara", "Kill the Highborne ghosts here") } })

    Goals(8234, { { 19775, 1, spot = Spot(AZS, 0.442, 0.215, "Sealed Azure Bag — Azshara", "Kill the Timbermaw Shamans here") } })
    Goals(8235, { { 20023, 10, spot = Spot(AZS, 0.692, 0.272, "Encoded Fragment — Azshara", "Kill the Forest Oozes here") } })

    if D[8411] and D[8411].routeBuy == nil then
        D[8411].routeBuy = { { 7069, "Elemental Air", 1 }, { 7067, "Elemental Earth", 1 }, { 7068, "Elemental Fire", 1 }, { 7070, "Elemental Water", 1 } }
    end
    Goals(8412, {
        { 20610, 8, spot = Spot(WPL, 0.334, 0.614, "Bloodshot Spider Eye — Western Plaguelands", "Kill the Venom Mist Lurkers here") },
        { 20611, 8, spot = Spot(WPL, 0.365, 0.636, "Thick Black Claw — Western Plaguelands", "Kill the diseased bears here") },
    })

    for _, id in ipairs({ 8419, 8420 }) do
        if D[id] and D[id].routeBuy == nil then D[id].routeBuy = { { 14256, "Felcloth", 1 } } end
    end
    Goals(8421, {
        { 20613, 10, spot = Spot(FEL, 0.515, 0.217, "Rotting Wood — Felwood", "Kill the Irontree Stompers here") },
        { 20614, 4, spot = Spot(FEL, 0.417, 0.489, "Bloodvenom Essence — Felwood", "Kill the Tainted Oozes here") },
    })
    local chain = FDJ.QUEST_PREREQ_CHAINS and FDJ.QUEST_PREREQ_CHAINS[8422]
    if type(chain) == "table" then
        local imp, itchy
        for i, step in ipairs(chain) do
            if type(step) == "table" and step.id == 8419 then imp = i end
            if type(step) == "table" and step.id == 8420 then itchy = i end
        end
        if imp and itchy and chain[imp].choice == nil then
            local a, b = chain[imp], chain[itchy]
            a.choice, b.choice = "felcloth", "felcloth"
            local first = math.min(imp, itchy)
            chain[first], chain[first + 1] = b, a
        end
    end
    FDJ.QUEST_DONE_BY = FDJ.QUEST_DONE_BY or {}
    FDJ.QUEST_DONE_BY[8419] = FDJ.QUEST_DONE_BY[8419] or { 8420 }
    FDJ.QUEST_DONE_BY[8420] = FDJ.QUEST_DONE_BY[8420] or { 8419 }

    Find(8423, Spot(BL, 0.490, 0.382, "Helboar — Blasted Lands", "Kill 7 Helboar here"))
    Find(8424, Spot(BL, 0.660, 0.317, "Shadowsworn Cultist — Blasted Lands", "Kill the Shadowsworn here"))

    FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
    local XYLEM = string.format("%s|%.4f|%.4f", tostring(AZS), 0.292, 0.402)
    if FDJ.ARROW_VIAS[XYLEM] == nil then
        FDJ.ARROW_VIAS[XYLEM] = {
            { mapID = AZS, x = 0.281, y = 0.501, label = "Talk to Sanath Lim-yo: he teleports you up to Xylem's tower" },
        }
    end
end


























do
    local BS, SG, UNG, AZS = 1428, 1427, 1449, 1447
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    local C = FDJ.QUEST_PREREQ_CHAINS or {}
    local function Spot(m, x, y, label, detail, extra)
        local spot = { markerType = "location", mapID = m, x = x, y = y, label = label, detail = detail }
        for k, v in pairs(extra or {}) do spot[k] = v end
        return spot
    end

    local function Steps(questID, flags)
        for _, step in ipairs(C[questID] or {}) do
            local f = type(step) == "table" and flags[step.id]
            if f then
                for k, v in pairs(f) do if step[k] == nil then step[k] = v end end
            end
        end
    end
    Steps(4322, {
        [4241] = { needsDungeon = true },
        [4242] = { startsInDungeon = true },
        [4264] = { startsInDungeon = true, needsDungeon = true },
        [4282] = { startsInDungeon = true, needsDungeon = true },
    })




    Steps(4263, {
        [4262] = { needsDungeon = true },
    })
    Steps(4362, {
        [4341] = { needsDungeon = true },
        [4342] = { startsInDungeon = true, needsDungeon = true },
        [4361] = { startsInDungeon = true },
    })

    if D[3701] and D[3701].objectiveMap == nil then


        D[3701].objectiveMap = Spot(BS, 0.615, 0.412, "Thaurissan Relic — Burning Steppes", "Click the relics all around the ruins here", { pickUp = true })
    end

    if D[3463] and D[3463].objectiveSpots == nil then
        local TORCH = "Climb the tower, equip the Torch of Retribution and click the small brazier there"





        local WEAR = { equipItem = { 10515, "Torch of Retribution" } }
        D[3463].objectiveSpots = {
            [1] = Spot(SG, 0.357, 0.607, "Western Tower — Searing Gorge", TORCH, WEAR),
            [2] = Spot(SG, 0.440, 0.609, "Southern Tower — Searing Gorge", TORCH, WEAR),
            [3] = Spot(SG, 0.501, 0.548, "Eastern Tower — Searing Gorge", TORCH, WEAR),
            [4] = Spot(SG, 0.333, 0.545, "Northern Tower — Searing Gorge", TORCH, WEAR),
        }
    end

    local brd = FDJ.DB and FDJ.DB["Blackrock Depths"]
    for _, quest in ipairs((brd and brd.quests) or {}) do
        if quest.id == 3802 then quest.routeDoorLast = true end
        if quest.id == 4322 and quest.routeAsk == nil then
            quest.routeAsk = { chainKey = "ATTUNE_ONYXIA", [2] = 4322 }
        end
        if quest.id == 4201 and quest.routeGoals == nil then
            quest.routeGoals = {


                { 11413, 1, spot = Spot(UNG, 0.320, 0.503, "Nagmara's Filled Vial — Un'Goro Crater",
                    "Use the vial in the crater on top of the hill (click its icon)",
                    { exact = true, clickItem = { 11412, "Nagmara's Vial" } }) },
                { 11405, 10, spot = Spot(AZS, 0.540, 0.815, "Giant Silver Vein — Azshara", "Kill the giants around here") },
            }
            quest.routeRunBuy = { { 8846, "Gromsblood", 4 } }
        end
    end
end







do
    local page = FDJ.ONYXIA_PAGE and FDJ.DB and FDJ.DB[FDJ.ONYXIA_PAGE]
    for _, quest in ipairs((page and page.quests) or {}) do
        if quest.id == 6502 then
            quest.logNoteKey, quest.logNoteDungeon = "ONY_KILL_DRAKKISATH", "Upper Blackrock Spire"
            local door = quest.objectiveMap
            if type(door) == "table" and door.noteKey == "ONY_ENTER_DUNGEON" then door.noteKey = "ONY_KILL_DRAKKISATH" end
        end
    end
    local lines = {
        enUS = "Now find a group for %s and kill General Drakkisath",
        deDE = "Such dir jetzt eine Gruppe für %s und töte General Drakkisath",
        frFR = "Trouvez maintenant un groupe pour %s et tuez le Général Drakkisath",
        esES = "Ahora busca un grupo para %s y mata al General Drakkisath",
        itIT = "Ora trova un gruppo per %s e uccidi il General Drakkisath",
        ptBR = "Agora encontre um grupo para %s e mate o General Drakkisath",
        ruRU = "Теперь найдите группу в «%s» и убейте генерала Драккисата",
        koKR = "이제 %s 파티를 구해서 사령관 드라키사스를 처치하세요",
        zhCN = "现在组队前往%s并击杀达基萨斯将军",
        zhTW = "現在組隊前往%s並擊殺達基薩斯將軍",
    }
    lines.esMX = lines.esES
    for locale, text in pairs(lines) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ONY_KILL_DRAKKISATH == nil then t.ONY_KILL_DRAKKISATH = text end
    end
end







do
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    if D[5002] and D[5002].dungeonStep == nil then D[5002].dungeonStep = false end
end









do
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    local d = D[94727]
    if d and type(d.turninMap) == "table" and not d.turninMap.noteKey then
        local t = {}
        for k, v in pairs(d.turninMap) do t[k] = v end
        t.x, t.y, t.noteKey = 0.499, 0.460, "ARROW_GO_DOWNSTAIRS"
        d.turninMap = t
    end
    local strings = {
        enUS = "Go downstairs", deDE = "Geh die Treppe hinunter", frFR = "Descendez les escaliers",
        esES = "Baja las escaleras", itIT = "Scendi le scale", ptBR = "Desça as escadas",
        ruRU = "Спуститесь по лестнице", koKR = "계단을 내려가세요", zhCN = "走下楼梯", zhTW = "走下樓梯",
    }
    strings.esMX = strings.esES
    for locale, text in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ARROW_GO_DOWNSTAIRS == nil then t.ARROW_GO_DOWNSTAIRS = text end
    end
end


















do
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    local X, Y = 0.493, 0.469
    local function Moved(spot)
        local t = {}
        for k, v in pairs(spot) do t[k] = v end
        t.x, t.y = X, Y
        return t
    end
    local map
    if D[95417] and type(D[95417].turninMap) == "table" then
        D[95417].turninMap = Moved(D[95417].turninMap)
        map = D[95417].turninMap.mapID
    end
    if D[95601] and type(D[95601].map) == "table" then D[95601].map = Moved(D[95601].map) end
    if map then
        FDJ.ARROW_VIAS = FDJ.ARROW_VIAS or {}
        local DOWN = "Go further down the cave"
        FDJ.ARROW_VIAS[string.format("%s|%.4f|%.4f", tostring(map), X, Y)] = {
            indoors = true, reach = 5,
            direct = { mapID = map, x0 = 0.470, y0 = 0.455, x1 = 0.4975, y1 = 0.520 },
            { mapID = map, x = 0.499, y = 0.469, label = DOWN, keep = true },
        }
        local LINES = { deDE = "Geh weiter in die Höhle hinunter", frFR = "Descendez plus loin dans la grotte",
            esES = "Baja más adentro de la cueva", itIT = "Scendi più in fondo nella grotta",
            ptBR = "Desça mais fundo na caverna", ruRU = "Спуститесь глубже в пещеру",
            koKR = "동굴 더 아래로 내려가세요", zhCN = "继续往洞穴深处走", zhTW = "繼續往洞穴深處走" }
        LINES.esMX = LINES.esES
        FDJ.ContentLocales = FDJ.ContentLocales or {}
        for lang, line in pairs(LINES) do
            local content = FDJ.ContentLocales[lang] or {}
            FDJ.ContentLocales[lang] = content
            content.places = content.places or {}
            if content.places[DOWN] == nil then content.places[DOWN] = line end
        end
    end
end
























do
    local AZ, FEL = 1447, 1448
    local function Spot(map, x, y, label, detail, extra)
        local spot = { markerType = "location", mapID = map, x = x, y = y, label = label, detail = detail }
        for k, v in pairs(extra or {}) do spot[k] = v end
        return spot
    end
    local CAMP = Spot(AZ, 0.614, 0.249, "Legashi camp \226\128\148 Azshara",
        "South of the Legashi Stronghold: the Legashi Satyrs, Rogues and Hellcallers")
    local FEARDRED = Spot(AZ, 0.614, 0.249, "Master Feardred \226\128\148 Azshara",
        "In the satyrs' camp south of the Legashi Stronghold: kill him for his amulet", { targetName = "Master Feardred" })


    local STRONGHOLD = Spot(AZ, 0.636, 0.179, "Legashi Stronghold \226\128\148 Azshara",
        "The Legashi Hellraisers, Soulstealers and Blackguards in the stronghold")
    local ESCORT = Spot(AZ, 0.659, 0.144, "Graal \226\128\148 Legashi Stronghold, Azshara",
        "Escort Graal out of the stronghold: stay close to him", { targetName = "Graal" })
    local BLOODMAW = Spot(FEL, 0.628, 0.077, "Chieftain Bloodmaw \226\128\148 Felwood",
        "South of Timbermaw Hold: kill him for Bloodmaw's Basher", { targetName = "Chieftain Bloodmaw" })
    local HALANOX = Spot(AZ, 0.667, 0.193, "Prince Halanox \226\128\148 Legashi Stronghold, Azshara",
        "Plant the Timbermaw War Banner in his summoning circle (use it from your bags), then kill him",
        { targetName = "Prince Halanox", clickItem = { 235518, "Timbermaw War Banner" } })
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    for id, spot in pairs({ [86746] = CAMP, [86777] = FEARDRED, [86792] = STRONGHOLD, [86796] = ESCORT,
        [87346] = BLOODMAW, [86814] = HALANOX }) do
        if D[id] and D[id].objectiveMap == nil then D[id].objectiveMap = spot end
    end


    if D[86814] and D[86814].routeNote == nil then D[86814].routeNote, D[86814].routeNoteArg = "ROUTE_ELITE_GROUP", 55 end
    if D[86752] and D[86752].routeNote == nil then D[86752].routeNote = "ROUTE_TIMBERMAW_NEUTRAL" end







    for _, q in ipairs((FDJ.DB and FDJ.DB["Blackmaw Hold"] and FDJ.DB["Blackmaw Hold"].quests) or {}) do
        if type(q) == "table" and q.id == 92066 and q.routeAfter == nil then q.routeAfter = { "turn:86752" } end
    end

    for _, chain in pairs(FDJ.QUEST_PREREQ_CHAINS or {}) do
        local prev
        for _, step in ipairs(type(chain) == "table" and chain or {}) do
            if type(step) == "table" and step.id == 86792 and prev and prev.id == 86777 then step.together = true end
            prev = type(step) == "table" and step or nil
        end
    end
    local bh = FDJ.DB and FDJ.DB["Blackmaw Hold"]
    for _, quest in ipairs((bh and bh.quests) or {}) do
        if quest.id == 92070 and quest.routeDrop == nil then quest.routeDrop = true end
        if quest.id == 97173 and quest.routeOptIn == nil then quest.routeOptIn = true end
    end
    local strings = {
        enUS = "Needs Neutral with Timbermaw Hold", deDE = "Benötigt neutralen Ruf bei der Holzschlundfeste",
        frFR = "Nécessite d'être Neutre auprès des Grumegueules", esES = "Requiere ser Neutral con Bastión Fauces de Madera",
        itIT = "Richiede Neutrale con il Rifugio dei Mordilegno", ptBR = "Requer Neutro com Bastião Presamadeira",
        ruRU = "Требуется отношение «Равнодушие» с Древобрюхами", koKR = "나무구렁 요새와 중립 관계가 필요합니다",
        zhCN = "需要木喉要塞中立声望", zhTW = "需要木喉要塞中立聲望",
    }
    strings.esMX = strings.esES
    for locale, text in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ROUTE_TIMBERMAW_NEUTRAL == nil then t.ROUTE_TIMBERMAW_NEUTRAL = text end
    end
end







do
    local D = FDJ.QUEST_PREREQ_DETAILS or {}
    local d = D[95427]
    if d and type(d.objectiveMap) == "table" and not d.objectiveMap.noteKey then
        local t = {}
        for k, v in pairs(d.objectiveMap) do t[k] = v end
        t.noteKey = "ARROW_CAVE_END"
        d.objectiveMap = t
    end
    local strings = {
        enUS = "Run to the end of the cave", deDE = "Lauf bis zum Ende der Höhle", frFR = "Courez jusqu'au fond de la grotte",
        esES = "Corre hasta el final de la cueva", itIT = "Corri fino in fondo alla grotta", ptBR = "Corra até o fim da caverna",
        ruRU = "Бегите в конец пещеры", koKR = "동굴 끝까지 달려가세요", zhCN = "跑到洞穴尽头", zhTW = "跑到洞穴盡頭",
    }
    strings.esMX = strings.esES
    for locale, text in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t and t.ARROW_CAVE_END == nil then t.ARROW_CAVE_END = text end
    end
end











do
    local THUNDRIS = { mapID = 1439, x = 0.374, y = 0.401, label = "Thundris Windweaver \226\128\148 Auberdine, Darkshore", targetName = "Thundris Windweaver" }
    local ULRIC = { mapID = 1440, x = 0.118, y = 0.345, label = "Ulric Frostveil \226\128\148 Zoram'gar Outpost, Ashenvale", targetName = "Ulric Frostveil" }
    local NOTE = "You also need to pick up:"
    local d = FDJ.QUEST_PREREQ_DETAILS
    if d and d[1654] then
        d[1654].subWarning = NOTE
        d[1654].subWarningLink = { quest = 1442, name = "Seeking the Kor Gem", map = THUNDRIS }
        d[1654].subWarningDungeon, d[1654].subWarningStyle = "Blackfathom Deeps", "warning"
    end
    if d and d[95036] then
        d[95036].subWarning = NOTE
        d[95036].subWarningLink = { quest = 95042, name = "Seeking the Kor Gem", map = ULRIC }
        d[95036].subWarningDungeon, d[95036].subWarningStyle = "Blackfathom Deeps", "warning"
    end
    local T = {

        deDE = { "Du musst auch diese Quest annehmen:", "Suche nach dem Kor-Edelstein", "Suche nach dem Kor-Edelstein",
            "Thundris Windwirker \226\128\148 Auberdine, Dunkelküste", "Ulric Frostveil \226\128\148 Zoram'gar-Außenposten, Ashenvale" },
        frFR = { "Vous devez aussi prendre la quête :", "À la recherche de la gemme de Kor", "À la recherche de la gemme de Kor",
            "Thundris Windweaver \226\128\148 Auberdine, Sombrivage", "Ulric Voile-de-givre \226\128\148 Avant-poste de Zoram'gar, Orneval" },
        esES = { "También necesitas aceptar:", "La búsqueda de la gema Kor", "En busca de la gema Kor",
            "Thundris Tejevientos \226\128\148 Auberdine, Costa Oscura", "Ulric Veloescarcha \226\128\148 Avanzada de Zoram'gar, Vallefresno" },
        itIT = { "Devi anche prendere:", nil, nil,
            "Thundris Windweaver \226\128\148 Auberdine, Rivafosca", "Ulric Frostveil \226\128\148 Zoram'gar Outpost, Ashenvale" },
        ptBR = { "Você também precisa pegar:", "Em busca da Gema Kor", "Em busca da Gema Kor",
            "Trovejius Tecevento \226\128\148 Auberdine, Costa Negra", "Ulorico Glacivéu \226\128\148 Assentamento Zoram'gar, Vale Gris" },
        ruRU = { "Также нужно взять задание:", "Поиск самоцвета Кора", "В поисках самоцвета Кора",
            "Тандрис Ветропряд \226\128\148 Аубердин, Темные берега", "Ульрик Фроствейл \226\128\148 Форт Зорам'гар, Ясеневый лес" },
        koKR = { "다음 퀘스트도 받아야 합니다:", "코르석을 찾아서", "코르석을 찾아서",
            "툰드리스 윈드위버 \226\128\148 아우버다인, 어둠의 해안", "울릭 프로스트베일 \226\128\148 조람가르 전초기지, 잿빛 골짜기" },
        zhCN = { "你还需要接取：", "寻找科尔宝石", "寻找科尔宝石",
            "桑迪斯·织风 \226\128\148 奥伯丁，黑海岸", "乌瑞克·霜帷 \226\128\148 佐拉姆加前哨站，灰谷" },
        zhTW = { "你還需要接取：", "尋找科爾寶石", "尋找科爾寶石",
            "桑迪斯·織風 \226\128\148 奧伯丁，黑海岸", "奧里克‧霜幕 \226\128\148 左拉姆加前哨站，梣谷" },
    }
    for lang, t in pairs(T) do
        local content = FDJ.ContentLocales and FDJ.ContentLocales[lang]
        if content then
            content.quests = content.quests or {}
            local function Set(id, field, value)
                if value == nil then return end
                local q = content.quests[id] or {}
                content.quests[id] = q
                if q[field] == nil then q[field] = value end
            end
            Set(1654, "subWarning", t[1]); Set(95036, "subWarning", t[1])
            Set(1442, "name", t[2]); Set(95042, "name", t[3])
            content.places = content.places or {}
            if content.places[THUNDRIS.label] == nil then content.places[THUNDRIS.label] = t[4] end
            if content.places[ULRIC.label] == nil then content.places[ULRIC.label] = t[5] end
        end
    end
end
