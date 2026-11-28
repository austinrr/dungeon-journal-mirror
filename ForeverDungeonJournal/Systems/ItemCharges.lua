






local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end


FDJ.ITEM_CHARGES = {
    [9449] = 3,
}

local function Plain(v)
    if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
    return v
end


local function OwnedByJournal(tooltip)
    local ok, owner = pcall(tooltip.GetOwner, tooltip)
    if not ok then return false end
    for _ = 1, 25 do
        if type(owner) ~= "table" or not owner.GetParent then return false end
        local okName, name = pcall(owner.GetName, owner)
        name = okName and Plain(name) or nil
        if type(name) == "string" and name:find("^ForeverDungeonJournal") then return true end
        owner = owner:GetParent()
    end
    return false
end

local function ItemID(tooltip, data)
    if type(data) == "table" and type(Plain(data.id)) == "number" then return data.id end
    if tooltip.GetItem then
        local ok, _, link = pcall(tooltip.GetItem, tooltip)
        link = ok and Plain(link) or nil
        local id = type(link) == "string" and link:match("item:(%d+)")
        if id then return tonumber(id) end
    end
end

local function ChargesText(n)
    local fmt = _G.ITEM_SPELL_CHARGES
    if type(fmt) == "string" then
        local ok, text = pcall(string.format, fmt, n)
        if ok and type(text) == "string" then return text end
    end
    return n .. " Charges"
end

local function AddCharges(tooltip, data)
    if not tooltip or not tooltip.GetName or not OwnedByJournal(tooltip) then return end
    local itemID = ItemID(tooltip, data)
    local charges = itemID and FDJ.ITEM_CHARGES[itemID]
    if not charges then return end
    if tooltip.fdjChargesDone == itemID then return end
    local name = tooltip:GetName()
    if not name then return end
    local text = ChargesText(charges)
    local useTag = tostring(_G.ITEM_SPELL_TRIGGER_ONUSE or "Use:")
    local useLine
    for i = 1, (tooltip:NumLines() or 0) do
        local fs = _G[name .. "TextLeft" .. i]
        local t = fs and Plain(fs:GetText())
        if type(t) == "string" then
            if t:find(text, 1, true) then return end
            if not useLine and t:sub(1, #useTag) == useTag then useLine = fs end
        end
    end
    tooltip.fdjChargesDone = itemID
    if useLine then


        useLine:SetText(Plain(useLine:GetText()) .. "\n|cffffffff" .. text .. "|r")
    else
        tooltip:AddLine(text, 1, 1, 1)
    end

    if C_Timer and C_Timer.After then
        C_Timer.After(0, function()
            if tooltip:IsShown() then pcall(tooltip.Show, tooltip) end
        end)
    end
end

local function Safe(tooltip, data) pcall(AddCharges, tooltip, data) end

local viaProcessor = false
if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall
    and Enum and Enum.TooltipDataType and Enum.TooltipDataType.Item then
    viaProcessor = pcall(TooltipDataProcessor.AddTooltipPostCall, Enum.TooltipDataType.Item, Safe)
end
if not viaProcessor and GameTooltip and GameTooltip.HookScript then
    pcall(GameTooltip.HookScript, GameTooltip, "OnTooltipSetItem", function(self) Safe(self) end)
end

if GameTooltip and GameTooltip.HookScript then
    pcall(GameTooltip.HookScript, GameTooltip, "OnTooltipCleared", function(self) self.fdjChargesDone = nil end)
end
