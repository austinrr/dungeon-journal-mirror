-- Dungeon Journal (TBC Anniversary): Map tab for the TBC raids.
-- The art is the game's own raid map (Interface\WorldMap tiles). Boss pins use
-- the author's calibrated positions from his TBC Raid Map addon (artwork 0-1).
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY or not FDJ.DUNGEON_MAPS then return end

-- Positions recorded on the old 1024x768 sheet are converted to the 1002x668 art.
local function S(x, y) return x * 1024 / 1002, y * 768 / 668 end
local function B(name, floor, x, y, sheet)
    if sheet then x, y = S(x, y) end
    return { name = name, floor = floor, x = x, y = y }
end

local RAIDS = {
    ["Karazhan"] = { folder = "Karazhan", floors = 17,
        -- Only the levels with a boss are kept; buttons are named after their bosses.
        names = { [1] = "Attumen", [3] = "Moroes", [4] = "Maiden / Opera", [6] = "Nightbane",
            [9] = "Curator", [10] = "Shade of Aran", [11] = "Illhoof", [13] = "Netherspite",
            [14] = "Chess", [17] = "Malchezaar" },
        onlyBossFloors = true,
        bosses = {
            B("Attumen the Huntsman", 1, .444, .716, true), B("Moroes", 3, .263, .553, true),
            B("Maiden of Virtue", 4, .817, .431, true), B("Opera Event", 4, .176, .300, true),
            B("The Curator", 9, .484, .316, true), B("Shade of Aran", 10, .700, .227, true),
            B("Terestian Illhoof", 11, .518, .606, true), B("Netherspite", 13, .353, .365, true),
            B("Chess Event", 14, .352, .540, true), B("Prince Malchezaar", 17, .504, .271, true),
            B("Nightbane", 6, .470, .916),
        } },
    ["Gruul's Lair"] = { folder = "GruulsLair", floors = 1, bosses = {
        B("High King Maulgar", 1, .539, .503, true), B("Gruul the Dragonkiller", 1, .198, .250, true) } },
    ["Magtheridon's Lair"] = { folder = "MagtheridonsLair", floors = 1, bosses = {
        B("Magtheridon", 1, .674, .646, true) } },
    ["Serpentshrine Cavern"] = { folder = "CoilfangReservoir", floors = 1, bosses = {
        B("Hydross the Unstable", 1, .356, .735, true), B("The Lurker Below", 1, .390, .508, true),
        B("Leotheras the Blind", 1, .409, .224, true), B("Fathom-Lord Karathress", 1, .492, .151, true),
        B("Morogrim Tidewalker", 1, .584, .228, true), B("Lady Vashj", 1, .707, .514, true) } },
    ["Tempest Keep: The Eye"] = { folder = "TempestKeep", floors = 1, bosses = {
        B("Al'ar", 1, .490, .511, true), B("Void Reaver", 1, .256, .427, true),
        B("High Astromancer Solarian", 1, .723, .426, true), B("Kael'thas Sunstrider", 1, .489, .127, true) } },
    ["Battle for Mount Hyjal"] = { folder = "CoTMountHyjal", floors = 1, flat = true, bosses = {
        B("Rage Winterchill", 1, .087, .683), B("Anetheron", 1, .146, .645), B("Kaz'rogal", 1, .420, .351),
        B("Azgalor", 1, .485, .402), B("Archimonde", 1, .770, .282) } },
    ["Black Temple"] = { folder = "BlackTemple", floors = 7,
        names = { "Karabor Sewers", "Sanctuary of Shadows", "Halls of Anguish", "Gorefiend's Vigil",
            "Den of Mortal Delights", "Chamber of Command", "Temple Summit" },
        bosses = {
            B("High Warlord Naj'entus", 1, .4385, .1912), B("Supremus", 2, .4112, .891),
            B("Shade of Akama", 3, .5372, .4679), B("Gurtogg Bloodboil", 3, .8701, .5228),
            B("Reliquary of Souls", 3, .6168, .8535), B("Teron Gorefiend", 4, .3977, .1263),
            B("Mother Shahraz", 5, .6765, .3707), B("Illidari Council", 6, .4736, .4399),
            B("Illidan Stormrage", 7, .529, .706),
        } },
    ["Zul'Aman"] = { folder = "ZulAman", floors = 1, flat = true, bosses = {
        B("Akil'zon", 1, .3487, .2254), B("Nalorakk", 1, .4053, .7668), B("Jan'alai", 1, .5575, .7092),
        B("Halazzi", 1, .5816, .2300), B("Hex Lord Malacrass", 1, .7193, .5294), B("Zul'jin", 1, .9073, .5282) } },
    -- Sunwell has a flat outdoor sheet AND a numbered interior sheet.
    ["Sunwell Plateau"] = { folder = "SunwellPlateau", sunwell = true, floors = 2,
        entrance = { floor = 1, x = .309, y = .371, angle = 0 },
        bosses = {
            B("Kalecgos", 1, .305, .512),
            B("Brutallus", 1, .630, .865),
            B("Felmyst", 1, .690, .865),
            B("Eredar Twins", 1, .641, .323),
            B("M'uru", 2, .465, .241),
            B("Kil'jaeden", 2, .459, .618),
        } },
}

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

local function Resolve()
    for name, r in pairs(RAIDS) do
        if FDJ.DB and FDJ.DB[name] and not FDJ.DUNGEON_MAPS[name] then
            if r.sunwell then
                local base = "Interface\\WorldMap\\SunwellPlateau\\SunwellPlateau"
                local outdoor
                if FileExists(base .. "1") then
                    outdoor = { tiles = base, name = "Level 1" }
                else
                    outdoor = {
                        texture = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\TBCMaps\\SunwellOutdoor.tga",
                        texRight = 1002 / 1024, texBottom = 668 / 1024,
                        name = "Level 1",
                    }
                end
                for _, boss in ipairs(r.bosses) do
                    if boss.name == "Brutallus" or boss.name == "Felmyst" then
                        boss.mapNote = "Shared Dead Scar arena"
                    elseif boss.name == "Eredar Twins" then
                        boss.mapNote = "Witch's Sanctum"
                    end
                end
                FDJ.DUNGEON_MAPS[name] = {
                    floors = { outdoor, { tiles = base .. "1_", name = "Level 2" } },
                    bosses = r.bosses, entrance = r.entrance,
                }
                -- Migrate only Sunwell coordinates from the old composite once.
                if ForeverDungeonJournalDB and ForeverDungeonJournalDB.sunwellParchmentMapVersion ~= 1 then
                    if ForeverDungeonJournalDB.mapPinMoves then
                        ForeverDungeonJournalDB.mapPinMoves[name] = nil
                    end
                    if ForeverDungeonJournalDB.mapFloors then
                        ForeverDungeonJournalDB.mapFloors[name] = 1
                    end
                    ForeverDungeonJournalDB.sunwellParchmentMapVersion = 1
                end
            else
            local base = "Interface\\WorldMap\\" .. r.folder .. "\\" .. r.folder
            local floors, remap = {}, {}
            for f = 1, r.floors do
                local prefix = (r.flat and r.floors == 1) and base or (base .. f .. "_")
                if not FileExists(prefix .. "1") and r.floors == 1 then
                    -- Some raids ship the other naming scheme.
                    local alt = r.flat and (base .. "1_") or base
                    if FileExists(alt .. "1") then prefix = alt end
                end
                local hasBoss = not r.onlyBossFloors
                for _, b in ipairs(r.bosses) do if b.floor == f then hasBoss = true end end
                if hasBoss and FileExists(prefix .. "1") then
                    floors[#floors + 1] = { tiles = prefix, name = (r.floors > 1) and (r.names and r.names[f] or ("Level " .. f)) or nil }
                    remap[f] = #floors
                end
            end
            if #floors > 0 then
                local bosses = {}
                for _, b in ipairs(r.bosses) do
                    if remap[b.floor] then
                        bosses[#bosses + 1] = { name = b.name, floor = remap[b.floor], x = b.x, y = b.y }
                    end
                end
                FDJ.DUNGEON_MAPS[name] = { floors = floors, bosses = bosses, entrance = r.entrance }
            end
            end
            if FDJ.TBCMapDebug then FDJ.TBCMapDebug["raid " .. name] = r.sunwell and "2 parchment sections" or "WorldMap floors resolved" end
        end
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    local ok, err = pcall(Resolve)
    if not ok and FDJ.TBCMapDebug then FDJ.TBCMapDebug._raidError = tostring(err) end
end)
