










local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local MIN_OFF, MAX_OFF = 4, 80

local function Plain(v)
    if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
    return v
end
local function Store()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    if type(ForeverDungeonJournalDB.spotFixes) ~= "table" then ForeverDungeonJournalDB.spotFixes = {} end
    return ForeverDungeonJournalDB.spotFixes
end
local known
local function Known()
    if not known then
        known = {}
        for name, id in pairs(FDJ.ARROW_NPC_IDS or {}) do
            if type(id) == "number" then known[id] = name end
        end
    end
    return known
end
local function SpotName(spot)
    if type(spot.targetName) == "string" and spot.targetName ~= "" then return spot.targetName end
    if type(spot.label) == "string" then
        local name = spot.label:match("^(.-)%s+—") or spot.label:match("^(.-)%s+%-%s")
        if name and name ~= "" then return name end
    end
end


function FDJ.SpotFix(spot, wx, wy, continent)
    if type(spot) ~= "table" or not wx or not wy then return nil end
    local name = SpotName(spot)
    local id = name and FDJ.ARROW_NPC_IDS and FDJ.ARROW_NPC_IDS[name]
    local fix = id and Store()[id]
    if type(fix) ~= "table" or fix[3] ~= continent then return nil end
    local off = math.sqrt((fix[1] - wx) ^ 2 + (fix[2] - wy) ^ 2)
    if off < MIN_OFF or off > MAX_OFF then return nil end
    return fix[1], fix[2]
end

local function Learn()
    if type(IsInInstance) == "function" and IsInInstance() then return end
    if type(UnitGUID) ~= "function" or type(UnitPosition) ~= "function" then return end
    local ok, guid = pcall(UnitGUID, "npc")
    guid = ok and Plain(guid) or nil
    if type(guid) ~= "string" then return end
    local kind, id = guid:match("^(%a+)%-%d+%-%d+%-%d+%-%d+%-(%d+)")
    id = tonumber(id)
    if kind ~= "Creature" or not id or not Known()[id] then return end
    local okP, px, py, _, continent = pcall(UnitPosition, "player")
    px, py, continent = okP and tonumber(Plain(px)), okP and tonumber(Plain(py)), okP and tonumber(Plain(continent))
    if not px or not py or not continent then return end
    local fix = { px, py, continent, name = Known()[id] }
    if C_Map and type(C_Map.GetBestMapForUnit) == "function" and type(C_Map.GetPlayerMapPosition) == "function" then
        local okM, map = pcall(C_Map.GetBestMapForUnit, "player")
        local okV, pos = pcall(C_Map.GetPlayerMapPosition, okM and map or 0, "player")
        if okM and okV and type(pos) == "table" then
            local x, y = pos.x, pos.y
            if (x == nil or y == nil) and pos.GetXY then x, y = pos:GetXY() end
            fix.map, fix.x, fix.y = map, tonumber(Plain(x)), tonumber(Plain(y))
        end
    end
    local old = Store()[id]
    if type(old) == "table" and old[3] == continent and math.sqrt((old[1] - px) ^ 2 + (old[2] - py) ^ 2) < 2 then return end
    Store()[id] = fix
    if FDJ.ResetSpotWorlds then pcall(FDJ.ResetSpotWorlds) end
end

local watch = CreateFrame("Frame")
for _, event in ipairs({ "GOSSIP_SHOW", "QUEST_GREETING", "QUEST_DETAIL", "QUEST_PROGRESS", "QUEST_COMPLETE", "MERCHANT_SHOW", "TAXIMAP_OPENED" }) do
    pcall(watch.RegisterEvent, watch, event)
end
watch:SetScript("OnEvent", function() pcall(Learn) end)

