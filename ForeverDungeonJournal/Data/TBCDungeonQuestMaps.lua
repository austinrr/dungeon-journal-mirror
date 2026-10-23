-- Dungeon Journal (TBC Anniversary): quest-giver locations for the TBC
-- dungeon quest chains, from "TBC Dungeon Quest Starter Locations" (22 Oct 2026),
-- supplied by the author. Coordinates are TBC zone-map percentages (0-1 here).
-- The same location is used on a quest's own page and on every chain step page.
local _, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY then return end
FDJ.QUEST_PREREQ_DETAILS = FDJ.QUEST_PREREQ_DETAILS or {}
FDJ.QUEST_START_MAPS = FDJ.QUEST_START_MAPS or {}
local DETAILS, START = FDJ.QUEST_PREREQ_DETAILS, FDJ.QUEST_START_MAPS

-- [questID] = { uiMapID, x, y, label, NPC name }
local MAPS = {
    [9572] = { 1944, 0.552, 0.360, "Stone Guard Stok'ton - Thrallmar, main command building", "Stone Guard Stok'ton" },
    [9575] = { 1944, 0.567, 0.663, "Lieutenant Chadwick - Honor Hold, main keep command room", "Lieutenant Chadwick" },
    [9630] = { 1430, 0.473, 0.752, "Archmage Alturus - Deadwind Pass, immediately outside Karazhan's main entrance", "Archmage Alturus" },
    [9631] = { 1430, 0.473, 0.752, "Archmage Alturus - Deadwind Pass, immediately outside Karazhan's main entrance", "Archmage Alturus" },
    [9680] = { 1430, 0.473, 0.752, "Archmage Alturus - Deadwind Pass, immediately outside Karazhan's main entrance", "Archmage Alturus" },
    [9824] = { 1430, 0.473, 0.752, "Archmage Alturus - Deadwind Pass, immediately outside Karazhan's main entrance", "Archmage Alturus" },
    [9825] = { 1430, 0.473, 0.752, "Archmage Alturus - Deadwind Pass, immediately outside Karazhan's main entrance", "Archmage Alturus" },
    [9826] = { 1430, 0.473, 0.752, "Archmage Alturus - Deadwind Pass, immediately outside Karazhan's main entrance", "Archmage Alturus" },
    [9829] = { 1416, 0.156, 0.546, "Archmage Cedric - Alterac Mountains, beside the old Dalaran magical barrier", "Archmage Cedric" },
    [9831] = { 1955, 0.548, 0.443, "Khadgar - Shattrath, Terrace of Light central hall", "Khadgar" },
    [9832] = { 1955, 0.548, 0.443, "Khadgar - Shattrath, Terrace of Light central hall", "Khadgar" },
    [9836] = { 1955, 0.548, 0.443, "Khadgar - Shattrath, Terrace of Light central hall", "Khadgar" },
    [9991] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [9999] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10001] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10004] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10009] = { 1955, 0.773, 0.349, "Sal'salabim - Shattrath Lower City, World's End Tavern", "Sal'salabim" },
    [10010] = { 1955, 0.773, 0.349, "Sal'salabim - Shattrath Lower City, World's End Tavern", "Sal'salabim" },
    [10011] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10044] = { 1951, 0.554, 0.376, "Garrosh - Garadar, Nagrand", "Garrosh" },
    [10045] = { 1951, 0.567, 0.343, "Greatmother Geyah - Garadar, northern main hut", "Greatmother Geyah" },
    [10081] = { 1951, 0.567, 0.343, "Greatmother Geyah - Garadar, northern main hut", "Greatmother Geyah" },
    [10082] = { 1951, 0.261, 0.606, "Mother Kashur - Ancestral Grounds, western Nagrand", "Mother Kashur" },
    [10085] = { 1951, 0.261, 0.606, "Mother Kashur - Ancestral Grounds, western Nagrand", "Mother Kashur" },
    [10094] = { 1952, 0.400, 0.722, "Field Commander Mahfuun - South Auchindoun, outside Shadow Labyrinth", "Field Commander Mahfuun" },
    [10101] = { 1951, 0.261, 0.606, "Mother Kashur - Ancestral Grounds, western Nagrand", "Mother Kashur" },
    [10102] = { 1951, 0.359, 0.674, "K'ure - Oshu'gun north entrance; he is deep inside, in the lowest chamber", "K'ure" },
    [10120] = { 1944, 0.873, 0.498, "Lieutenant General Orion - Stair of Destiny, Outland side of the Dark Portal", "Lieutenant General Orion" },
    [10121] = { 1944, 0.550, 0.360, "Nazgrel - Thrallmar, main command building", "Nazgrel" },
    [10123] = { 1944, 0.581, 0.413, "Sergeant Shatterskull - Thrallmar supply caravan, southeast of the base", "Sergeant Shatterskull" },
    [10141] = { 1944, 0.566, 0.667, "Force Commander Danath Trollbane - Honor Hold, main keep", "Force Commander Danath Trollbane" },
    [10142] = { 1944, 0.617, 0.610, "Sergeant Altumus - East Supply Caravan, east/northeast of Honor Hold", "Sergeant Altumus" },
    [10173] = { 1953, 0.314, 0.662, "Ravandwyr - Area 52, Netherstorm", "Ravandwyr" },
    [10174] = { 1953, 0.314, 0.662, "Ravandwyr - Area 52, Netherstorm", "Ravandwyr" },
    [10178] = { 1952, 0.399, 0.723, "Spy Grik'tha - South Auchindoun, outside Shadow Labyrinth", "Spy Grik'tha" },
    [10205] = { 1953, 0.324, 0.642, "Nether-Stalker Khay'ji - Area 52, Netherstorm", "Nether-Stalker Khay'ji" },
    [10216] = { 1952, 0.394, 0.585, "Artificer Morphalius - North Auchindoun, outside Mana-Tombs", "Artificer Morphalius" },
    [10227] = { 1952, 0.351, 0.651, "Ha'lei - Western Auchindoun approach, beside the Auchenai Crypts entrance", "Ha'lei" },
    [10228] = { 1952, 0.351, 0.662, "Ramdor the Mad - Bone pile just outside the Auchenai Crypts approach", "Ramdor the Mad" },
    [10231] = { 1955, 0.491, 0.359, "Ezekiel - patrols the Lower City ring, Shattrath", "Ezekiel" },
    [10251] = { 1955, 0.436, 0.298, "\"Dirty\" Larry - Northwestern Lower City, Shattrath", "\"Dirty\" Larry" },
    [10252] = { 1951, 0.518, 0.568, "Nitrin the Learned - Abandoned Armory, small door on the west side", "Nitrin the Learned" },
    [10253] = { 1951, 0.518, 0.568, "Nitrin the Learned - Abandoned Armory, small door on the west side", "Nitrin the Learned" },
    [10256] = { 1953, 0.583, 0.864, "Archmage Vargoth - Violet Tower, Kirin'Var Village, southeastern Netherstorm", "Archmage Vargoth" },
    [10262] = { 1953, 0.324, 0.642, "Nether-Stalker Khay'ji - Area 52, Netherstorm", "Nether-Stalker Khay'ji" },
    [10265] = { 1953, 0.324, 0.642, "Nether-Stalker Khay'ji - Area 52, Netherstorm", "Nether-Stalker Khay'ji" },
    [10266] = { 1953, 0.324, 0.642, "Nether-Stalker Khay'ji - Area 52, Netherstorm", "Nether-Stalker Khay'ji" },
    [10267] = { 1953, 0.467, 0.570, "Gahruj - Midrealm Post, Netherstorm", "Gahruj" },
    [10268] = { 1953, 0.467, 0.570, "Gahruj - Midrealm Post, Netherstorm", "Gahruj" },
    [10269] = { 1953, 0.459, 0.360, "Image of Nexus-Prince Haramad - The Stormspire, Netherstorm", "Image of Nexus-Prince Haramad" },
    [10275] = { 1953, 0.584, 0.313, "Dealer Hazzin - Protectorate Watch Post, Netherstorm", "Dealer Hazzin" },
    [10276] = { 1953, 0.346, 0.380, "Wind Trader Tuluman - Tuluman's Landing, Netherstorm", "Wind Trader Tuluman" },
    [10277] = { 1446, 0.584, 0.543, "Andormu - Tanaris, deep inside the Caverns of Time hub", "Andormu" },
    [10279] = { 1446, 0.660, 0.497, "Steward of Time - Tanaris, outer entrance to the Caverns of Time", "Steward of Time" },
    [10280] = { 1953, 0.459, 0.360, "Image of Nexus-Prince Haramad - The Stormspire, Netherstorm", "Image of Nexus-Prince Haramad" },
    [10282] = { 1446, 0.584, 0.543, "Andormu - Tanaris, deep inside the Caverns of Time hub", "Andormu" },
    [10289] = { 1944, 0.873, 0.481, "Vlagga Freyfeather - Stair of Destiny, Horde flight point", "Vlagga Freyfeather" },
    [10291] = { 1944, 0.559, 0.366, "General Krakork - Thrallmar, arrival / wind-rider area", "General Krakork" },
    [10296] = { 1446, 0.584, 0.543, "Andormu - Tanaris, deep inside the Caverns of Time hub", "Andormu" },
    [10300] = { 1953, 0.314, 0.662, "Ravandwyr - Area 52, Netherstorm", "Ravandwyr" },
    [10588] = { 1948, 0.540, 0.235, "Oronok Torn-heart - Oronok's Farm, northern Shadowmoon Valley", "Oronok Torn-heart" },
    [10622] = { 1948, 0.573, 0.496, "Sanoru - Warden's Cage, Shadowmoon Valley, upper underground passages", "Sanoru" },
    [10626] = { 1948, 0.368, 0.549, "Ordinn Thunderfist - Wildhammer Stronghold, Shadowmoon Valley", "Ordinn Thunderfist" },
    [10627] = { 1948, 0.298, 0.313, "Grokom Deatheye - Shadowmoon Village, Shadowmoon Valley", "Grokom Deatheye" },
    [10628] = { 1948, 0.573, 0.496, "Sanoru - Warden's Cage, Shadowmoon Valley, upper underground passages", "Sanoru" },
    [10641] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10646] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10662] = { 1948, 0.368, 0.549, "Ordinn Thunderfist - Wildhammer Stronghold, Shadowmoon Valley", "Ordinn Thunderfist" },
    [10663] = { 1948, 0.298, 0.313, "Grokom Deatheye - Shadowmoon Village, Shadowmoon Valley", "Grokom Deatheye" },
    [10664] = { 1952, 0.776, 0.387, "David Wayne - Wayne's Refuge, far eastern Terokkar Forest", "David Wayne" },
    [10665] = { 1952, 0.776, 0.387, "David Wayne - Wayne's Refuge, far eastern Terokkar Forest", "David Wayne" },
    [10666] = { 1952, 0.776, 0.387, "David Wayne - Wayne's Refuge, far eastern Terokkar Forest", "David Wayne" },
    [10668] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10669] = { 1951, 0.273, 0.431, "Altruis the Sufferer - Western Nagrand, roadside camp", "Altruis the Sufferer" },
    [10704] = { 1955, 0.540, 0.448, "A'dal - Shattrath, central Terrace of Light", "A'dal" },
    [10705] = { 1948, 0.581, 0.482, "Akama - Warden's Cage, hidden lower chamber", "Akama" },
    [10883] = { 1955, 0.548, 0.443, "Khadgar - Shattrath, Terrace of Light central hall", "Khadgar" },
    [10955] = { 1450, 0.525, 0.406, "Loganaar - Nighthaven, Moonglade", "Loganaar" },
    [10961] = { 1946, 0.802, 0.652, "Morthis Whisperwing - Cenarion Refuge, eastern Zangarmarsh", "Morthis Whisperwing" },
    [10964] = { 1946, 0.802, 0.652, "Morthis Whisperwing - Cenarion Refuge, eastern Zangarmarsh", "Morthis Whisperwing" },
    [10965] = { 1450, 0.755, 0.670, "Clintar Dreamwalker - Stormrage Barrow Dens, southeastern Moonglade", "Clintar Dreamwalker" },
    [10970] = { 1953, 0.595, 0.324, "Commander Ameer - Protectorate Watch Post, Netherstorm", "Commander Ameer" },
    [10971] = { 1953, 0.595, 0.324, "Commander Ameer - Protectorate Watch Post, Netherstorm", "Commander Ameer" },
    [10973] = { 1953, 0.595, 0.324, "Commander Ameer - Protectorate Watch Post, Netherstorm", "Commander Ameer" },
    [10974] = { 1953, 0.595, 0.324, "Commander Ameer - Protectorate Watch Post, Netherstorm", "Commander Ameer" },
    [10975] = { 1949, 0.529, 0.150, "Image of Commander Ameer - Bash'ir Landing, northern Blade's Edge Mountains", "Image of Commander Ameer" },
    [10976] = { 1949, 0.529, 0.150, "Image of Commander Ameer - Bash'ir Landing, northern Blade's Edge Mountains", "Image of Commander Ameer" },
    [10977] = { 1949, 0.529, 0.150, "Image of Commander Ameer - Bash'ir Landing, northern Blade's Edge Mountains", "Image of Commander Ameer" },
    [10978] = { 1450, 0.725, 0.633, "Dreamwarden Lurosa - Stormrage Barrow Dens, near the southern entrance", "Dreamwarden Lurosa" },
    [10979] = { 1946, 0.802, 0.652, "Morthis Whisperwing - Cenarion Refuge, eastern Zangarmarsh", "Morthis Whisperwing" },
    [10980] = { 1949, 0.615, 0.383, "Arthorn Windsong - Evergrove, Ruuan Weald, Blade's Edge Mountains", "Arthorn Windsong" },
    [10986] = { 1949, 0.615, 0.383, "Arthorn Windsong - Evergrove, Ruuan Weald, Blade's Edge Mountains", "Arthorn Windsong" },
    [10987] = { 1951, 0.206, 0.357, "Watcher Elaira - Northwestern Nagrand, high ground near the western ridge", "Watcher Elaira" },
    [10988] = { 1951, 0.206, 0.357, "Watcher Elaira - Northwestern Nagrand, high ground near the western ridge", "Watcher Elaira" },
    [10990] = { 1949, 0.615, 0.383, "Arthorn Windsong - Evergrove, Ruuan Weald, Blade's Edge Mountains", "Arthorn Windsong" },
    [10993] = { 1949, 0.615, 0.383, "Arthorn Windsong - Evergrove, Ruuan Weald, Blade's Edge Mountains", "Arthorn Windsong" },
    [10994] = { 1946, 0.802, 0.652, "Morthis Whisperwing - Cenarion Refuge, eastern Zangarmarsh", "Morthis Whisperwing" },
    [11488] = { 1957, 0.474, 0.307, "Exarch Larethor - Shattered Sun Staging Area, Isle of Quel'Danas", "Exarch Larethor" },
    -- Midsummer only: the Earthen Ring Elder stands at every capital's festival
    -- camp. The neutral Shattrath camp is used as the pin.
    [11955] = { 1955, 0.607, 0.306, "Earthen Ring Elder - Midsummer camp, northeastern Lower City (also at every capital's festival camp)", "Earthen Ring Elder" },
}

for questID, m in pairs(MAPS) do
    local loc = { mapID = m[1], x = m[2], y = m[3], label = m[4], targetName = m[5], markerType = "quest" }
    local d = DETAILS[questID]
    if d then d.map = loc end
    START[questID] = loc
end

-- No fixed spot: summoned NPCs and raid-interior NPCs.
local function SetPickup(ids, text, inside)
    for _, id in ipairs(ids) do
        local d = DETAILS[id]
        if d then
            d.pickup = text
            d.map = nil
            if inside then d.startsInDungeon = true end
        end
    end
end
SetPickup({ 10188, 10192, 10301, 10209, 10176 },
    "Image of Archmage Vargoth - summon it with Archmage Vargoth's Staff (item 28455); if lost, Ravandwyr in Area 52 replaces it")
SetPickup({ 10991, 10992 },
    "Arthorn's Sparrowhawk - summon it with Arthorn's Sparrowhawk Whistle (item 32657); only works in Terokkar Forest")
SetPickup({ 9638 }, "Wravien - Karazhan, Guardian's Library, beyond The Curator", true)
SetPickup({ 9639 }, "Gradav - Karazhan, Guardian's Library", true)
SetPickup({ 9640, 9645 }, "Kamsis - Karazhan, Guardian's Library", true)

-- Item starters.
local function SetItem(questID, item)
    local d = DETAILS[questID]
    if d then d.startItem = item end
end
SetItem(10621, { 30756, "Illidari-Bane Shard", "Quest Item", "Drops from Overseer Ripsaw, Legion Hold, Shadowmoon Valley (Alliance)" })
SetItem(10623, { 30579, "Illidari-Bane Shard", "Quest Item", "Drops from Overseer Ripsaw, Legion Hold, Shadowmoon Valley (Horde)" })
do
    local pens = FDJ.DB and FDJ.DB["The Slave Pens"]
    for _, q in ipairs((pens and pens.quests) or {}) do
        if q.id == 11972 and type(q.startItem) == "table" then
            q.startItem[4] = "Loot the Ice Chest after defeating Ahune in the Slave Pens (Midsummer)"
        end
    end
end

-- Illidari-Bane Shard: clicking the shard shows Overseer Ripsaw, who drops it.
do
    local ripsaw = { mapID = 1948, x = 0.232, y = 0.352, label = "Overseer Ripsaw - Legion Hold, Shadowmoon Valley (drops the Illidari-Bane Shard)", targetName = "Overseer Ripsaw", markerType = "quest" }
    for _, id in ipairs({ 10621, 10623 }) do
        local d = DETAILS[id]
        if d then
            d.map = ripsaw
            if type(d.startItem) == "table" then
                d.startItem.dropMap = ripsaw
                d.startItem[4] = (d.startItem[4] or "") .. ". Click to show Ripsaw on the map."
            end
        end
    end
end

-- Trouble at Auchindoun can no longer be accepted once The Codex of Blood is
-- in the quest log or done. Shown as the red disclaimer above the objective.
do
    local warn = "Not available if The Codex of Blood is in your quest log or already completed."
    for _, dungeon in pairs(FDJ.DB or {}) do
        for _, q in ipairs(dungeon.quests or {}) do
            if q.id == 10177 then q.warning = warn end
        end
    end
    if DETAILS[10177] then DETAILS[10177].warning = warn end
end

-- Karazhan: the four Violet Eye ring quests sit under one "Show Ring Quests" row.
FDJ.QUEST_GROUPS = FDJ.QUEST_GROUPS or {}
FDJ.QUEST_GROUPS.violetRings = { name = "Violet Eye Rings", showText = "Show Ring Quests", hideText = "Hide Ring Quests" }
do
    local kara = FDJ.DB and FDJ.DB["Karazhan"]
    local rings = { [10725] = true, [10726] = true, [10727] = true, [10728] = true }
    for _, q in ipairs((kara and kara.quests) or {}) do
        if rings[q.id] then q.listGroup = "violetRings" end
    end
end
