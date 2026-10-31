-- Dungeon Journal (TBC Anniversary): Map tab for every TBC five-player dungeon.
-- The art is the game's own dungeon map (found at login). Boss pins and the
-- entrance arrow come from "TBC All Dungeon Boss Location Maps" (22 Oct 2026),
-- transferred onto the game's map. Ctrl-drag a pin to fine-tune it; moved
-- pins are saved per character install (ForeverDungeonJournalDB.mapPinMoves).
-- /fdjmaps prints what was found.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY or not FDJ.DUNGEON_MAPS then return end

-- floor = the game's map level (1 = entrance level); x/y are 0-1 on the map art.
local PINS = {
    ["Hellfire Ramparts"] = {
        entrance = { floor = 1, x = 0.522, y = 0.719, angle = 270 },
        bosses = {
            { name = "Watchkeeper Gargolmar", floor = 1, x = 0.732, y = 0.311 },
            { name = "Omor the Unscarred", floor = 1, x = 0.390, y = 0.207 },
            { name = "Vazruden and Nazan", floor = 1, x = 0.353, y = 0.826 },
        },
    },
    ["The Blood Furnace"] = {
        entrance = { floor = 1, x = 0.486, y = 0.916, angle = 270 },
        bosses = {
            { name = "The Maker", floor = 1, x = 0.384, y = 0.422 },
            { name = "Broggok", floor = 1, x = 0.431, y = 0.218 },
            { name = "Keli'dan the Breaker", floor = 1, x = 0.585, y = 0.421 },
        },
    },
    ["The Shattered Halls"] = {
        entrance = { floor = 1, x = 0.597, y = 0.921, angle = 270 },
        bosses = {
            { name = "Grand Warlock Nethekurse", floor = 1, x = 0.342, y = 0.637 },
            { name = "Blood Guard Porung", floor = 1, x = 0.295, y = 0.154, npcID = 20923 },
            { name = "Warbringer O'mrogg", floor = 1, x = 0.541, y = 0.360 },
            { name = "Warchief Kargath Bladefist", floor = 1, x = 0.677, y = 0.565 },
        },
    },
    ["The Slave Pens"] = {
        entrance = { floor = 1, x = 0.216, y = 0.140, angle = 90 },
        bosses = {
            { name = "Mennu the Betrayer", floor = 1, x = 0.496, y = 0.284 },
            { name = "Rokmar the Crackler", floor = 1, x = 0.578, y = 0.396 },
            { name = "Quagmirran", floor = 1, x = 0.819, y = 0.771 },
        },
    },
    ["The Underbog"] = {
        entrance = { floor = 1, x = 0.280, y = 0.704, angle = 180 },
        bosses = {
            { name = "Hungarfen", floor = 1, x = 0.692, y = 0.906 },
            { name = "Ghaz'an", floor = 1, x = 0.785, y = 0.288 },
            { name = "Swamplord Musel'ek", floor = 1, x = 0.414, y = 0.245 },
            { name = "The Black Stalker", floor = 1, x = 0.247, y = 0.455 },
        },
    },
    ["The Steamvault"] = {
        entrance = { floor = 1, x = 0.176, y = 0.304, angle = 180 },
        bosses = {
            { name = "Hydromancer Thespia", floor = 1, x = 0.536, y = 0.125 },
            { name = "Mekgineer Steamrigger", floor = 1, x = 0.310, y = 0.824 },
            { name = "Warlord Kalithresh", floor = 1, x = 0.761, y = 0.437 },
        },
    },
    ["Mana-Tombs"] = {
        entrance = { floor = 1, x = 0.335, y = 0.155, angle = 90 },
        bosses = {
            { name = "Pandemonius", floor = 1, x = 0.482, y = 0.290 },
            { name = "Tavarok", floor = 1, x = 0.624, y = 0.737 },
            { name = "Nexus-Prince Shaffar", floor = 1, x = 0.325, y = 0.498 },
            { name = "Yor", floor = 1, x = 0.345, y = 0.527, npcID = 22930 },
        },
    },
    ["Auchenai Crypts"] = {
        entrance = { floor = 1, x = 0.440, y = 0.775, angle = 270 },
        bosses = {
            { name = "Shirrak the Dead Watcher", floor = 2, x = 0.462, y = 0.673 },
            { name = "Exarch Maladaar", floor = 2, x = 0.740, y = 0.503 },
        },
    },
    ["Sethekk Halls"] = {
        entrance = { floor = 1, x = 0.735, y = 0.383, angle = 0 },
        bosses = {
            { name = "Darkweaver Syth", floor = 1, x = 0.487, y = 0.683 },
            { name = "Anzu", floor = 2, x = 0.322, y = 0.546, npcID = 23035 },
            { name = "Talon King Ikiss", floor = 2, x = 0.326, y = 0.277 },
        },
    },
    ["Shadow Labyrinth"] = {
        entrance = { floor = 1, x = 0.218, y = 0.105, angle = 90 },
        bosses = {
            { name = "Ambassador Hellmaw", floor = 1, x = 0.218, y = 0.393 },
            { name = "Blackheart the Inciter", floor = 1, x = 0.267, y = 0.706 },
            { name = "Grandmaster Vorpil", floor = 1, x = 0.535, y = 0.536 },
            { name = "Murmur", floor = 1, x = 0.812, y = 0.391 },
        },
    },
    ["The Mechanar"] = {
        entrance = { floor = 1, x = 0.458, y = 0.906, angle = 270 },
        bosses = {
            { name = "Gatewatcher Gyro-Kill", floor = 1, x = 0.471, y = 0.562, npcID = 19218 },
            { name = "Gatewatcher Iron-Hand", floor = 1, x = 0.591, y = 0.522, npcID = 19710 },
            { name = "Mechano-Lord Capacitus", floor = 1, x = 0.512, y = 0.316 },
            { name = "Nethermancer Sepethrea", floor = 2, x = 0.476, y = 0.197 },
            { name = "Pathaleon the Calculator", floor = 2, x = 0.271, y = 0.615 },
        },
    },
    ["The Botanica"] = {
        entrance = { floor = 1, x = 0.901, y = 0.399, angle = 0 },
        bosses = {
            { name = "Commander Sarannis", floor = 1, x = 0.444, y = 0.229 },
            { name = "High Botanist Freywinn", floor = 1, x = 0.243, y = 0.227 },
            { name = "Thorngrin the Tender", floor = 1, x = 0.070, y = 0.487 },
            { name = "Laj", floor = 1, x = 0.342, y = 0.866 },
            { name = "Warp Splinter", floor = 1, x = 0.340, y = 0.366 },
        },
    },
    ["The Arcatraz"] = {
        entrance = { floor = 1, x = 0.412, y = 0.864, angle = 270 },
        bosses = {
            { name = "Zereketh the Unbound", floor = 1, x = 0.591, y = 0.240 },
            { name = "Dalliah the Doomsayer", floor = 2, x = 0.361, y = 0.784 },
            { name = "Wrath-Scryer Soccothrates", floor = 2, x = 0.201, y = 0.784 },
            { name = "Harbinger Skyriss", floor = 3, x = 0.616, y = 0.307 },
        },
    },
    ["Old Hillsbrad Foothills"] = {
        entrance = { floor = 1, x = 0.273, y = 0.477, angle = 180 },
        bosses = {
            { name = "Lieutenant Drake", floor = 1, x = 0.751, y = 0.659 },
            { name = "Captain Skarloc", floor = 1, x = 0.691, y = 0.693 },
            { name = "Epoch Hunter", floor = 1, x = 0.505, y = 0.320 },
            { name = "Don Carlos", floor = 1, x = 0.423, y = 0.465, npcID = 28132 },
        },
    },
    ["The Black Morass"] = {
        entrance = { floor = 1, x = 0.494, y = 0.172, angle = 90 },
        bosses = {
            { name = "Chrono Lord Deja", floor = 1, x = 0.443, y = 0.548 },
            { name = "Temporus", floor = 1, x = 0.582, y = 0.569 },
            { name = "Aeonus", floor = 1, x = 0.478, y = 0.741 },
        },
    },
    ["Magisters' Terrace"] = {
        entrance = { floor = 1, x = 0.424, y = 0.942, angle = 270 },
        bosses = {
            { name = "Selin Fireheart", floor = 1, x = 0.426, y = 0.223 },
            { name = "Vexallus", floor = 1, x = 0.834, y = 0.266 },
            { name = "Priestess Delrissa", floor = 2, x = 0.395, y = 0.562 },
            { name = "Kael'thas Sunstrider", floor = 2, x = 0.087, y = 0.501 },
        },
    },
}

local CLIENT = {
    ["Hellfire Ramparts"]       = { ids = { 347 },           folders = { "HellfireRamparts" } },
    ["The Blood Furnace"]       = { ids = { 261 },           folders = { "TheBloodFurnace", "BloodFurnace" } },
    ["The Shattered Halls"]     = { ids = { 246 },           folders = { "TheShatteredHalls", "ShatteredHalls" } },
    ["The Slave Pens"]          = { ids = { 265 },           folders = { "TheSlavePens", "SlavePens" } },
    ["The Underbog"]            = { ids = { 262 },           folders = { "TheUnderbog", "Underbog" } },
    -- Only the level with the bosses is kept (the other one is empty).
    ["The Steamvault"]          = { ids = { 263, 264 },      folders = { "TheSteamvault", "Steamvault" }, onlyFloor = 1 },
    ["Mana-Tombs"]              = { ids = { 272 },           folders = { "ManaTombs" } },
    ["Auchenai Crypts"]         = { ids = { 256, 257 },      folders = { "AuchenaiCrypts" } },
    ["Sethekk Halls"]           = { ids = { 258, 259 },      folders = { "SethekkHalls" } },
    ["Shadow Labyrinth"]        = { ids = { 260 },           folders = { "ShadowLabyrinth" } },
    ["Old Hillsbrad Foothills"] = { ids = { 274 },           folders = { "CoTHillsbradFoothills", "OldHillsbradFoothills", "CoTOldHillsbrad" } },
    ["The Black Morass"]        = { ids = { 273 },           folders = { "CoTTheBlackMorass", "TheBlackMorass", "CoTBlackMorass", "BlackMorass" } },
    ["The Mechanar"]            = { ids = { 267, 268 },      folders = { "TheMechanar", "Mechanar" } },
    ["The Botanica"]            = { ids = { 266 },           folders = { "TheBotanica", "Botanica" } },
    ["The Arcatraz"]            = { ids = { 269, 270, 271 }, folders = { "TheArcatraz", "Arcatraz" } },
    -- The client lists the upper floor first; the entrance level is the second.
    ["Magisters' Terrace"]      = { ids = { 348, 349 },      folders = { "MagistersTerrace" }, reverse = true },
}

FDJ.TBCMapDebug = {}

for name, def in pairs(PINS) do
    FDJ.DUNGEON_MAPS[name] = {
        floors = {},
        bosses = def.bosses,
        entrance = def.entrance,
        tbcClientMap = true,
    }
end

local probe
local function FileExists(path)
    if not probe then
        local holder = CreateFrame("Frame", nil, UIParent)
        holder:Hide()
        probe = holder:CreateTexture(nil, "ARTWORK")
    end
    probe:SetTexture(nil)
    probe:SetTexture(path)
    local id = probe.GetTextureFileID and probe:GetTextureFileID()
    return id ~= nil and id ~= 0
end

local function MapHasArt(mapID)
    if not (C_Map and C_Map.GetMapArtLayers and C_Map.GetMapArtLayerTextures) then return false end
    local okL, layers = pcall(C_Map.GetMapArtLayers, mapID)
    if not okL or type(layers) ~= "table" or not layers[1] then return false end
    local okT, textures = pcall(C_Map.GetMapArtLayerTextures, mapID, 1)
    return okT and type(textures) == "table" and #textures > 0
end

local function FloorsFromGroup(mapID)
    local floors = {}
    local okG, group = pcall(C_Map.GetMapGroupID, mapID)
    if okG and group and C_Map.GetMapGroupMembersInfo then
        local okM, members = pcall(C_Map.GetMapGroupMembersInfo, group)
        if okM and type(members) == "table" then
            table.sort(members, function(a, b) return (a.relativeHeightIndex or 0) < (b.relativeHeightIndex or 0) end)
            for _, m in ipairs(members) do
                if m.mapID and MapHasArt(m.mapID) then
                    floors[#floors + 1] = { uiMapID = m.mapID, name = (m.name ~= "" and m.name) or nil }
                end
            end
        end
    end
    if #floors == 0 and MapHasArt(mapID) then floors[1] = { uiMapID = mapID } end
    return floors
end

local function Resolve()
    if not C_Map or not C_Map.GetMapInfo then return end
    local byName = {}
    for id = 1, 3000 do
        local ok, info = pcall(C_Map.GetMapInfo, id)
        if ok and info and info.name and info.name ~= "" then
            byName[info.name] = byName[info.name] or {}
            table.insert(byName[info.name], id)
        end
    end
    for name, def in pairs(CLIENT) do
        local data = FDJ.DUNGEON_MAPS[name]
        local floors, how = {}, "no map art"
        if data and data.tbcClientMap then
            local candidates = {}
            for _, id in ipairs(def.ids) do candidates[#candidates + 1] = id end
            local localized = FDJ.LocalizeDungeonName and FDJ.LocalizeDungeonName(name)
            for _, key in ipairs({ name, localized }) do
                for _, id in ipairs((key and byName[key]) or {}) do candidates[#candidates + 1] = id end
            end
            for _, id in ipairs(candidates) do
                floors = FloorsFromGroup(id)
                if #floors > 0 then how = "uiMap " .. id break end
            end
            if #floors == 0 then
                for _, folder in ipairs(def.folders) do
                    local base = "Interface\\WorldMap\\" .. folder .. "\\" .. folder
                    for floor = 1, 6 do
                        if FileExists(base .. floor .. "_1") then floors[#floors + 1] = { tiles = base .. floor .. "_" } end
                    end
                    if #floors == 0 and FileExists(base .. "1") then floors[1] = { tiles = base } end
                    if #floors > 0 then how = "files " .. folder break end
                end
            end
            if def.reverse and #floors > 1 then
                local r = {}
                for i = #floors, 1, -1 do r[#r + 1] = floors[i] end
                floors = r
            end
            if def.onlyFloor and floors[def.onlyFloor] then floors = { floors[def.onlyFloor] } end
            -- Buttons are labelled by position, so "Level 1" is always the first page.
            for i, f in ipairs(floors) do
                f.name = (#floors > 1) and ("Level " .. i) or nil
            end
            data.floors = floors
            -- A boss on a level this client does not have goes on the last one.
            for _, b in ipairs(data.bosses or {}) do
                if #floors > 0 and (b.floor or 1) > #floors then b.floor = #floors end
            end
        end
        FDJ.TBCMapDebug[name] = how .. " (" .. #floors .. " floors)"
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    local ok, err = pcall(Resolve)
    if not ok then FDJ.TBCMapDebug._error = tostring(err) end
    -- No map art at all on this client: no Map tab for that dungeon.
    for name in pairs(PINS) do
        local data = FDJ.DUNGEON_MAPS[name]
        if data and data.tbcClientMap and #(data.floors or {}) == 0 then FDJ.DUNGEON_MAPS[name] = nil end
    end
end)

SLASH_FDJTBCMAPS1 = "/fdjmaps"
SlashCmdList.FDJTBCMAPS = function()
    print("|cffffd100Dungeon Journal|r TBC dungeon maps (Ctrl-drag a boss pin to move it):")
    for name in pairs(CLIENT) do
        print("  " .. name .. ": " .. tostring(FDJ.TBCMapDebug[name] or "not checked"))
    end
    if FDJ.TBCMapDebug._error then print("  error: " .. FDJ.TBCMapDebug._error) end
end

-- Home cards: crop below the TBC logo on the shared loading screens.
if FDJ.DUNGEON_HOME_TEXCOORD then
    for _, n in ipairs({ "The Arcatraz", "Magisters' Terrace" }) do
        FDJ.DUNGEON_HOME_TEXCOORD[n] = { 0.02, 0.98, 0.31, 0.89 }
    end
end
