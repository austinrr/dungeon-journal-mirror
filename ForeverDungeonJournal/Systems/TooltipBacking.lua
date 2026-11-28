




local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local function OwnedByJournal(tooltip)
    if not tooltip or not tooltip.GetOwner then return false end
    local ok, owner = pcall(tooltip.GetOwner, tooltip)
    if not ok then return false end
    local journal, favourites = _G.ForeverDungeonJournalFrame, _G.ForeverDungeonJournalFavourites
    for _ = 1, 20 do
        if not owner or type(owner) ~= "table" or not owner.GetParent then return false end
        if owner.fdjSolidTooltip or owner == journal or owner == favourites
            or owner == _G.ForeverDungeonJournalRunTracker
            or owner == _G.ForeverDungeonJournalRunLog then return true end
        owner = owner:GetParent()
    end
    return false
end

local function Backing(tip)
    if not tip.fdjJournalBacking then
        local bg = tip:CreateTexture(nil, "BACKGROUND", nil, -8)
        bg:SetPoint("TOPLEFT", 3, -3)
        bg:SetPoint("BOTTOMRIGHT", -3, 3)
        bg:SetColorTexture(0.03, 0.03, 0.04, 1)
        bg:Hide()
        tip.fdjJournalBacking = bg
    end
    return tip.fdjJournalBacking
end

local function Update(tip)
    if not tip or not tip.CreateTexture then return end
    local fromJournal = OwnedByJournal(tip)

    if not fromJournal and tip ~= GameTooltip and GameTooltip and GameTooltip:IsShown() then
        fromJournal = GameTooltip.fdjJournalBacking and GameTooltip.fdjJournalBacking:IsShown() or false
    end
    if fromJournal then Backing(tip):Show()
    elseif tip.fdjJournalBacking then tip.fdjJournalBacking:Hide() end
end

local function Hook(tip)
    if not tip or not tip.HookScript or tip.fdjBackingHooked then return end
    tip.fdjBackingHooked = true
    pcall(tip.HookScript, tip, "OnShow", function(self) pcall(Update, self) end)
    pcall(tip.HookScript, tip, "OnSizeChanged", function(self) pcall(Update, self) end)
    pcall(tip.HookScript, tip, "OnHide", function(self)
        if self.fdjJournalBacking then self.fdjJournalBacking:Hide() end
    end)
end





local function JournalOwnsMain()
    return GameTooltip and GameTooltip:IsShown() and OwnedByJournal(GameTooltip)
end

local function HideGameCompare()
    for _, name in ipairs({ "ShoppingTooltip1", "ShoppingTooltip2" }) do
        local tip = _G[name]
        if tip and tip:IsShown() then tip:Hide() end
    end
end

local function HookCompare()
    for _, name in ipairs({ "ShoppingTooltip1", "ShoppingTooltip2" }) do
        local tip = _G[name]
        if tip and tip.HookScript and not tip.fdjCompareHooked then
            tip.fdjCompareHooked = true
            pcall(tip.HookScript, tip, "OnShow", function(self)
                if JournalOwnsMain() then self:Hide() end
            end)
        end
    end
    if GameTooltip and GameTooltip.HookScript and not GameTooltip.fdjCompareHooked then
        GameTooltip.fdjCompareHooked = true
        pcall(GameTooltip.HookScript, GameTooltip, "OnUpdate", function(self)
            if self.fdjJournalBacking and self.fdjJournalBacking:IsShown() then HideGameCompare() end
        end)
    end
end








local function SkipAuctionatorVendor()
    local A = _G.Auctionator
    local T = type(A) == "table" and A.Tooltip
    if type(T) ~= "table" or type(T.AddVendorTip) ~= "function" or T.fdjVendorWrapped then return end
    local original = T.AddVendorTip
    T.AddVendorTip = function(tooltipFrame, ...)
        if OwnedByJournal(tooltipFrame) then return end
        return original(tooltipFrame, ...)
    end
    T.fdjVendorWrapped = true
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    for _, name in ipairs({ "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2" }) do
        Hook(_G[name])
    end
    pcall(HookCompare)
    pcall(SkipAuctionatorVendor)
end)



function FDJ.RefreshTooltipBacking()
    for _, name in ipairs({ "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2" }) do
        local tip = _G[name]
        if tip and tip:IsShown() then pcall(Update, tip) end
    end
end
