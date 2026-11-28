










local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local missing
local missingCount = 0
local candidates
local checked = {}

local function Plain(v)
    if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
    return v
end


local function Norm(name)
    name = Plain(name)
    if type(name) ~= "string" then return nil end
    name = name:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|cn[^:]*:", ""):gsub("|r", "")
    name = name:gsub("|A.-|a", ""):gsub("|T.-|t", "")
    name = name:gsub("^%s+", ""):gsub("%s+$", "")
    if name == "" then return nil end
    return name:lower()
end

local function Store()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    local db = ForeverDungeonJournalDB
    if type(db.learnedItemIDs) ~= "table" then db.learnedItemIDs = {} end
    return db.learnedItemIDs
end

local function Say(text) print("|cffd8a83cDungeonJournal:|r " .. text) end

local function KnownID(item)
    local id = type(item) == "table" and tonumber(item[1])
    if id and id > 0 then return id end
end

local function AddMissing(item, known)
    if type(item) ~= "table" or type(item[2]) ~= "string" then return end
    local id = KnownID(item)
    if id then known[#known + 1] = id return end
    local key = Norm(item[2])
    if not key then return end
    if not missing[key] then
        missing[key] = {}
        missingCount = missingCount + 1
    end
    table.insert(missing[key], item)
end

local SPAN = 60

local function Collect()
    missing, missingCount, candidates = {}, 0, {}
    local seen = {}
    for _, dungeon in pairs(FDJ.DB or {}) do
        if type(dungeon) == "table" then
            local known, before = {}, missingCount
            for _, boss in ipairs(dungeon.bosses or {}) do
                for _, item in ipairs((type(boss) == "table" and boss.loot) or {}) do AddMissing(item, known) end
            end
            for _, quest in ipairs(dungeon.quests or {}) do
                for _, list in ipairs({ quest.rewardItems, quest.additionalRewardItems, quest.noteRewardItems }) do
                    for _, item in ipairs(type(list) == "table" and list or {}) do AddMissing(item, known) end
                end
                AddMissing(quest.requiredItem, known) AddMissing(quest.startItem, known)
                AddMissing(quest.noteItem, known) AddMissing(quest.providedItem, known)
            end

            if missingCount > before then
                for _, id in ipairs(known) do
                    for n = id - SPAN, id + SPAN do
                        if n > 0 and not seen[n] then seen[n] = true candidates[#candidates + 1] = n end
                    end
                end
            end
        end
    end
    local known = {}
    for _, byBoss in pairs(FDJ.SHARED_BY_BOSS or {}) do
        for _, list in pairs(byBoss) do
            for _, item in ipairs(list) do AddMissing(item, known) end
        end
    end
    table.sort(candidates)
end


local function Apply(key, id, announce)
    local items = missing and missing[key]
    if not items then return false end
    local name
    for _, item in ipairs(items) do
        item[1] = id
        name = name or item[2]
    end
    missing[key] = nil
    missingCount = missingCount - 1
    if FDJ.ResetItemSourceIndex then pcall(FDJ.ResetItemSourceIndex) end
    if FDJ.RefreshLootNow then pcall(FDJ.RefreshLootNow) end
    if announce then
        FDJ.ChatLine("|cffd8a83cDungeonJournal:|r found the item ID of " .. tostring(name) .. ": " .. id .. "  (/dj newids)")
    end
    return true
end

local function Learn(id, name)
    id = tonumber(Plain(id))
    if not missing or missingCount == 0 then return end
    if not id or id <= 0 then return end
    local key = Norm(name)
    if not key or not missing[key] then return end
    Store()[key] = { id = id, name = missing[key][1][2] }

    Apply(key, id, false)
end





local function NameOfID(id, quiet)
    if quiet then
        local known = false
        if C_Item and type(C_Item.IsItemDataCachedByID) == "function" then
            local ok, res = pcall(C_Item.IsItemDataCachedByID, id)
            known = ok and Plain(res) == true
        end
        if not known then return nil end
    end
    if C_Item and C_Item.GetItemNameByID then
        local ok, name = pcall(C_Item.GetItemNameByID, id)
        name = ok and Plain(name)
        if type(name) == "string" and name ~= "" then return name end
    end
    local getInfo = (C_Item and C_Item.GetItemInfo) or GetItemInfo
    if getInfo then
        local ok, name = pcall(getInfo, id)
        name = ok and Plain(name)
        if type(name) == "string" and name ~= "" then return name end
    end
end


local function CheckID(id, quiet)
    id = tonumber(Plain(id))
    if not id or id <= 0 or checked[id] then return end
    local name = NameOfID(id, quiet)
    if name then
        checked[id] = true
        Learn(id, name)
    end
end

local function LearnLink(link)
    link = Plain(link)
    if type(link) ~= "string" then return end
    for id, name in link:gmatch("|Hitem:(%d+)[^|]*|h%[(.-)%]|h") do
        Learn(id, name)
        CheckID(id)
    end
    for id in link:gmatch("item:(%d+)") do CheckID(id) end
end


local function TryCache()
    if not missing or missingCount == 0 then return end
    local getInfo = (C_Item and C_Item.GetItemInfo) or GetItemInfo
    if not getInfo then return end
    for _, items in pairs(missing) do
        local ok, _, link = pcall(getInfo, items[1][2])
        if ok then LearnLink(link) end
    end
end


local function ScanInventory()
    if not missing or missingCount == 0 then return end
    if C_Container and C_Container.GetContainerNumSlots then
        for bag = 0, (NUM_TOTAL_EQUIPPED_BAG_SLOTS or NUM_BAG_SLOTS or 4) do
            local okN, slots = pcall(C_Container.GetContainerNumSlots, bag)
            for slot = 1, (okN and tonumber(slots) or 0) do
                local okI, id = pcall(C_Container.GetContainerItemID, bag, slot)
                if okI and id then CheckID(id) end
                local okL, link = pcall(C_Container.GetContainerItemLink, bag, slot)
                if okL then LearnLink(link) end
            end
        end
    end
    if GetInventoryItemLink then
        for slot = 1, 19 do
            local ok, link = pcall(GetInventoryItemLink, "player", slot)
            if ok then LearnLink(link) end
        end
    end
end








local talkedAt
local function Talking()
    for _, name in ipairs({ "QuestFrame", "GossipFrame", "MerchantFrame" }) do
        local f = _G[name]
        if type(f) == "table" and type(f.IsShown) == "function" then
            local ok, on = pcall(f.IsShown, f)
            if ok and on then
                talkedAt = (GetTime and GetTime()) or 0
                return true
            end
        end
    end
    return talkedAt ~= nil and ((GetTime and GetTime()) or 0) - talkedAt < 5
end
FDJ.ItemScanQuiet = Talking
local function Paused(fn)
    if ((FDJ.LookupsPaused and FDJ.LookupsPaused()) or Talking()) and C_Timer and C_Timer.After then
        C_Timer.After(1, fn)
        return true
    end
    return false
end


local scanIndex, scanning = 1, false
local function ScanStep()
    if not missing or missingCount == 0 or not candidates then scanning = false return end
    if Paused(ScanStep) then return end
    local requestLoad = C_Item and C_Item.RequestLoadItemDataByID
    local doExist = C_Item and C_Item.DoesItemExistByID



    local stop, asked = scanIndex - 1, 0
    while stop < #candidates and asked < 5 and stop - scanIndex < 199 do
        stop = stop + 1
        local id = candidates[stop]
        if not checked[id] then
            CheckID(id, true)
            if not checked[id] then
                local exists = true
                if doExist then
                    local ok, res = pcall(doExist, id)
                    if ok and res == false then exists = false checked[id] = true end
                end
                if exists then
                    asked = asked + 1
                    if requestLoad then pcall(requestLoad, id) else NameOfID(id) end
                end
            end
        end
    end
    scanIndex = stop + 1
    if scanIndex <= #candidates and C_Timer and C_Timer.After then
        C_Timer.After(asked > 0 and 0.5 or 0.05, ScanStep)
    else

        scanning = false
        if C_Timer and C_Timer.After then
            local function LastPass()
                if not missing or missingCount == 0 then return end
                if Paused(LastPass) then return end
                for _, id in ipairs(candidates) do CheckID(id, true) end
            end
            C_Timer.After(5, LastPass)
        end
    end
end

local function StartScan()
    if scanning or not candidates or #candidates == 0 or missingCount == 0 then return end
    scanning, scanIndex = true, 1
    ScanStep()
end

function FDJ.LearnMissingItemIDsNow()
    if Paused(FDJ.LearnMissingItemIDsNow) then return end
    pcall(TryCache)
    pcall(ScanInventory)
    for _, id in ipairs(candidates or {}) do pcall(CheckID, id, true) end
    StartScan()
end




local function OnTooltip(tooltip)
    if not tooltip or not tooltip.GetItem then return end
    local ok, _, link, id = pcall(tooltip.GetItem, tooltip)
    if ok then LearnLink(link) CheckID(id) end
end

local CHAT_EVENTS = {
    "CHAT_MSG_LOOT", "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER",
    "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER",
    "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM", "CHAT_MSG_CHANNEL", "CHAT_MSG_INSTANCE_CHAT",
    "CHAT_MSG_INSTANCE_CHAT_LEADER",
}

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
local pendingBags = false

events:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        pcall(Collect)

        for key, entry in pairs(Store()) do
            if type(entry) == "table" and tonumber(entry.id) then Apply(Norm(key) or key, tonumber(entry.id), false) end
        end
        if missingCount == 0 then return end
        for _, name in ipairs(CHAT_EVENTS) do pcall(self.RegisterEvent, self, name) end
        for _, name in ipairs({ "LOOT_OPENED", "LOOT_READY", "START_LOOT_ROLL", "GET_ITEM_INFO_RECEIVED",
                                "ITEM_DATA_LOAD_RESULT", "BAG_UPDATE_DELAYED", "PLAYER_EQUIPMENT_CHANGED" }) do
            pcall(self.RegisterEvent, self, name)
        end
        local viaProcessor = false
        if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall
            and Enum and Enum.TooltipDataType and Enum.TooltipDataType.Item then
            viaProcessor = pcall(TooltipDataProcessor.AddTooltipPostCall, Enum.TooltipDataType.Item,
                function(tooltip) pcall(OnTooltip, tooltip) end)
        end
        if not viaProcessor then
            for _, tooltip in ipairs({ GameTooltip, ItemRefTooltip }) do
                if tooltip and tooltip.HookScript then
                    pcall(tooltip.HookScript, tooltip, "OnTooltipSetItem", function(t) pcall(OnTooltip, t) end)
                end
            end
        end
        if C_Timer and C_Timer.After then
            C_Timer.After(3, function() FDJ.LearnMissingItemIDsNow() end)
        else
            FDJ.LearnMissingItemIDsNow()
        end
        return
    end

    if missingCount == 0 then return end
    if (event == "LOOT_OPENED" or event == "LOOT_READY") and GetNumLootItems and GetLootSlotLink then
        for i = 1, GetNumLootItems() or 0 do
            local ok, link = pcall(GetLootSlotLink, i)
            if ok then LearnLink(link) end
        end
    elseif event == "START_LOOT_ROLL" and GetLootRollItemLink then
        local ok, link = pcall(GetLootRollItemLink, (...))
        if ok then LearnLink(link) end
    elseif event == "GET_ITEM_INFO_RECEIVED" or event == "ITEM_DATA_LOAD_RESULT" then
        local id, success = ...
        if success ~= false then CheckID(id) end
    elseif event == "BAG_UPDATE_DELAYED" or event == "PLAYER_EQUIPMENT_CHANGED" then
        if not pendingBags and C_Timer and C_Timer.After then
            pendingBags = true
            C_Timer.After(0.5, function() pendingBags = false pcall(ScanInventory) pcall(TryCache) end)
        end
    else
        LearnLink((...))
    end
end)


function FDJ.PrintLearnedItemIDs()
    local parts = {}
    for _, entry in pairs(Store()) do
        if type(entry) == "table" and entry.id then parts[#parts + 1] = tostring(entry.name) .. " = " .. entry.id end
    end
    table.sort(parts)
    if #parts > 0 then Say("learned item IDs: " .. table.concat(parts, "; ")) end
    local still = {}
    for _, items in pairs(missing or {}) do still[#still + 1] = tostring(items[1][2]) end
    table.sort(still)
    if #still > 0 then
        Say("still searching (" .. #still .. "): " .. table.concat(still, ", "))
        FDJ.LearnMissingItemIDsNow()
    elseif #parts == 0 then
        Say("no missing item IDs.")
    end
end
