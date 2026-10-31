-- TBC socket gem stat finder. Loaded after Favourites and before Core/Journal,
-- so it can attach its diamond button to the existing home action row.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end
local GEMS = FDJ.GEM_FINDER_DATA or {}
local LABELS = FDJ.GEM_FINDER_STAT_LABELS or {}
local WHITE = 'Interface\\Buttons\\WHITE8X8'
local DIAMOND = 'Interface\\Icons\\INV_Misc_Gem_Diamond_02'
local RUBY = 'Interface\\Icons\\INV_Jewelcrafting_CrimsonSpinel_01'

-- All matching uses true gem stats, not substrings of gem names or a loose
-- tooltip search. In particular 'int' must not match 'int' in an item name.
local ALIASES = {
    ['strength']='str', ['str']='str', ['agi']='agi', ['agility']='agi',
    ['stamina']='sta', ['stam']='sta', ['sta']='sta',
    ['intellect']='int', ['intelligence']='int', ['intel']='int', ['int']='int',
    ['spirit']='spi', ['spi']='spi',
    ['mana per 5 seconds']='mp5', ['mana per five']='mp5',
    ['mana per 5']='mp5', ['mana every 5']='mp5', ['mana regen']='mp5',
    ['mp5']='mp5', ['mp/5']='mp5', ['mp 5']='mp5', ['5sr']='mp5',
    ['spell damage']='sp', ['spell dmg']='sp', ['spell dam']='sp',
    ['spellpower']='sp', ['spell power']='sp', ['spell dmg.']='sp',
    ['spelldamage']='sp', ['sp dmg']='sp', ['spd']='sp', ['sd']='sp', ['sp']='sp',
    ['plus healing']='heal', ['healing power']='heal', ['healing']='heal', ['heal']='heal',
    ['attack power']='ap', ['atk power']='ap', ['ap']='ap',
    ['spell hit rating']='spellhit', ['spell hit']='spellhit', ['spellhit']='spellhit', ['s hit']='spellhit',
    ['spell crit rating']='spellcrit', ['spell critical rating']='spellcrit',
    ['spell crit']='spellcrit', ['spellcrit']='spellcrit', ['spell critical']='spellcrit',
    ['spell haste rating']='haste', ['spell haste']='haste', ['spellhaste']='haste',
    ['haste rating']='haste', ['haste']='haste',
    ['critical strike rating']='crit', ['critical strike']='crit',
    ['crit rating']='crit', ['crit']='crit', ['critical']='crit',
    ['hit rating']='hit', ['hit']='hit',
    ['defense rating']='def', ['defence rating']='def', ['defense']='def', ['defence']='def', ['def']='def',
    ['dodge rating']='dodge', ['dodge']='dodge',
    ['parry rating']='parry', ['parry']='parry',
    ['resilience rating']='resil', ['resilience']='resil', ['resil']='resil', ['resi']='resil',
    ['spell penetration']='pen', ['spell pen']='pen', ['spellpen']='pen', ['penetration']='pen', ['pen']='pen',
    ['all resistance']='resist', ['resistance']='resist', ['resist']='resist',
    ['block value']='block', ['shield block']='block', ['block']='block',
    ['run speed']='speed', ['speed']='speed', ['stun resist']='stun', ['reflect']='reflect',
}
local MAX_ALIAS_TOKENS = 5
local function ParseQuery(query)
    local wanted, names = {}, {}
    query = tostring(query or ''):lower():gsub('[,%+;/]+', ' '):gsub('%s+', ' ')
    local parts = {}
    for word in query:gmatch('%S+') do parts[#parts+1] = word end
    local i = 1
    while i <= #parts do
        local found, used
        for len = math.min(MAX_ALIAS_TOKENS, #parts - i + 1), 1, -1 do
            local phrase = table.concat(parts, ' ', i, i + len - 1)
            if ALIASES[phrase] then found, used = ALIASES[phrase], len; break end
        end
        if found then
            wanted[found] = true
            i = i + used
        else
            -- An unknown token is treated as (partial) gem NAME, not ignored.
            local p = parts[i]:gsub('[^%w%-\']', '')
            if p ~= '' then names[#names+1] = p end
            i = i + 1
        end
    end
    return wanted, names
end
FDJ.GemFinderParseQuery = ParseQuery

local function CanMatch(entry, wanted, names, color)
    if color and color ~= 'Any' and entry.color ~= color then return false end
    for key in pairs(wanted) do
        if not entry.stats[key] then return false end
    end
    local lower = entry.name:lower()
    for _, nameFragment in ipairs(names) do
        if not lower:find(nameFragment, 1, true) then return false end
    end
    return true
end

function FDJ.GemFinderGetResults(query, color)
    local wanted, names = ParseQuery(query)
    local out = {}
    for _, gem in ipairs(GEMS) do
        if CanMatch(gem, wanted, names, color) then out[#out + 1] = gem end
    end
    -- Most useful / strongest cuts first; list within each rarity alphabetically.
    table.sort(out, function(a, b)
        if a.quality ~= b.quality then return a.quality > b.quality end
        return a.name < b.name
    end)
    return out
end

local STATS_ORDER, AVAILABLE_STATS = {}, {}
for _, gem in ipairs(GEMS) do
    for key in pairs(gem.stats) do AVAILABLE_STATS[key] = true end
end
for key in pairs(AVAILABLE_STATS) do STATS_ORDER[#STATS_ORDER + 1] = key end
table.sort(STATS_ORDER, function(a,b) return (LABELS[a] or a) < (LABELS[b] or b) end)

local function SelectedCount(selected)
    local n = 0
    for _ in pairs(selected) do n = n + 1 end
    return n
end
function FDJ.GemFinderToggleStat(selected, key)
    if not AVAILABLE_STATS[key] then return false end
    if selected[key] then selected[key] = nil; return true end
    if SelectedCount(selected) >= 2 then return false end
    selected[key] = true
    return true
end
function FDJ.GemFinderFilterStats(query)
    query = tostring(query or ''):lower():gsub('^%s+', ''):gsub('%s+$', '')
    local out = {}
    local alias = ALIASES[query]
    for _, key in ipairs(STATS_ORDER) do
        if query == '' or key == alias or (LABELS[key] or key):lower():find(query, 1, true) then
            out[#out+1] = key
        end
    end
    return out
end
function FDJ.GemFinderGetSelectedResults(selected)
    if SelectedCount(selected) == 0 or SelectedCount(selected) > 2 then return {} end
    local out = {}
    for _, gem in ipairs(GEMS) do
        if CanMatch(gem, selected, {}, nil) then out[#out+1] = gem end
    end
    table.sort(out, function(a,b)
        if a.quality ~= b.quality then return a.quality > b.quality end
        return a.name < b.name
    end)
    return out
end
local function StatsString(entry)
    local out = {}
    for _, key in ipairs(STATS_ORDER) do
        local value = entry.stats[key]
        if value then
            out[#out+1] = '+' .. tostring(value) .. (key == 'int' and entry.color == 'Meta' and entry.id == 35503 and '%' or '') .. ' ' .. (LABELS[key] or key)
        end
    end
    if entry.special then out[#out+1] = entry.special end
    return table.concat(out, '  |  ')
end
local function QualityRGB(q)
    if ITEM_QUALITY_COLORS and ITEM_QUALITY_COLORS[q] then
        local c = ITEM_QUALITY_COLORS[q]; return c.r, c.g, c.b
    end
    if q == 4 then return 0.64, 0.25, 0.95 end
    if q == 3 then return 0.18, 0.6, 1 end
    if q == 2 then return 0.22, 0.85, 0.28 end
    return 1, 1, 1
end

local colorIcons = {
    Red='Interface\\Icons\\INV_Misc_Gem_Ruby_01',
    Blue='Interface\\Icons\\INV_Misc_Gem_Sapphire_01',
    Yellow='Interface\\Icons\\INV_Misc_Gem_Topaz_01',
    Orange='Interface\\Icons\\INV_Misc_Gem_Opal_01',
    Purple='Interface\\Icons\\INV_Misc_Gem_Amethyst_01',
    Green='Interface\\Icons\\INV_Misc_Gem_Emerald_01',
    Meta=DIAMOND, Prismatic=DIAMOND,
}
local function ItemIcon(id, color)
    if C_Item and C_Item.GetItemIconByID then
        local ok, icon = pcall(C_Item.GetItemIconByID, id)
        if ok and icon then return icon end
    end
    if GetItemIcon then
        local ok, icon = pcall(GetItemIcon, id)
        if ok and icon then return icon end
    end
    if C_Item and C_Item.RequestLoadItemDataByID then
        pcall(C_Item.RequestLoadItemDataByID, id)
    end
    return colorIcons[color] or DIAMOND
end

local function Border(frame, color)
    frame:SetBackdrop({
        bgFile = WHITE, edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border', edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    frame:SetBackdropColor(0.11, 0.085, 0.06, 0.98)
    if color then frame:SetBackdropBorderColor(unpack(color))
    else frame:SetBackdropBorderColor(0.54, 0.40, 0.23, 1) end
end

local function NewLabel(parent, font, r, g, b)
    local label = parent:CreateFontString(nil, 'OVERLAY', font or 'GameFontHighlightSmall')
    if r then label:SetTextColor(r, g, b) end
    label:SetJustifyH('LEFT')
    return label
end

local function MakeButton(parent, text, width)
    local b = CreateFrame('Button', nil, parent, 'BackdropTemplate')
    b:SetSize(width or 70, 23)
    Border(b)
    b:SetBackdropColor(.13, .11, .09, .98)
    b:SetHighlightTexture('Interface\\QuestFrame\\UI-QuestTitleHighlight', 'ADD')
    b.label = NewLabel(b, 'GameFontHighlightSmall', 1, .82, .34)
    b.label:SetPoint('CENTER')
    b.label:SetText(text)
    return b
end
local popup
local ROW_H = 47
local function CreatePopup(frame)
    local win = CreateFrame('Frame', 'ForeverDungeonJournalGemFinder', UIParent, 'BackdropTemplate')
    Border(win)
    win:SetBackdropColor(0.075, 0.060, 0.043, 0.99)
    win:SetBackdropBorderColor(.65, .48, .24, 1)
    win:SetSize(760, 540)
    win:SetPoint('CENTER', UIParent, 'CENTER', 35, 5)
    win:SetFrameStrata('DIALOG')
    win:SetFrameLevel(180)
    win:SetToplevel(true)
    win:SetClampedToScreen(true)
    win:SetMovable(true)
    win:EnableMouse(true)
    win:RegisterForDrag('LeftButton')
    win:SetScript('OnDragStart', win.StartMoving)
    win:SetScript('OnDragStop', win.StopMovingOrSizing)
    if UISpecialFrames then tinsert(UISpecialFrames, 'ForeverDungeonJournalGemFinder') end
    win:Hide()

    local icon = win:CreateTexture(nil, 'ARTWORK')
    icon:SetTexture(RUBY)
    icon:SetSize(26, 26)
    icon:SetPoint('TOPLEFT', 14, -11)
    icon:SetTexCoord(.08, .92, .08, .92)
    local title = NewLabel(win, 'GameFontNormalLarge', 1, .85, .37)
    title:SetPoint('LEFT', icon, 'RIGHT', 8, 0)
    title:SetText('Gem Finder')
    local close = CreateFrame('Button', nil, win, 'UIPanelCloseButton')
    close:SetPoint('TOPRIGHT', win, 'TOPRIGHT', -5, -5)
    close:SetScript('OnClick', function() win:Hide() end)

    local subtitle = NewLabel(win, 'GameFontHighlightSmall', .82, .77, .65)
    subtitle:SetPoint('TOPLEFT', 17, -49)
    subtitle:SetText('Choose your stats or type to find them. Select up to 2.')
    win.selectedStats = {}
    local search = CreateFrame('EditBox', nil, win, 'InputBoxTemplate')
    win.search = search
    search:SetSize(198, 26)
    search:SetAutoFocus(false)
    search:SetMaxLetters(60)
    search:SetPoint('TOPLEFT', 23, -77)
    search:SetTextInsets(5, 5, 0, 0)
    search:SetScript('OnEscapePressed', search.ClearFocus)
    local clear = MakeButton(win, 'Clear', 62)
    clear:SetPoint('TOPLEFT', 158, -110)
    clear:SetScript('OnClick', function()
        win.selectedStats = {}; search:SetText(''); win:Refresh()
    end)
    win.statCount = NewLabel(win, 'GameFontNormalSmall', 1, .82, .39)
    win.statCount:SetPoint('TOPLEFT', 18, -117)
    local statScroll = CreateFrame('ScrollFrame', nil, win, 'UIPanelScrollFrameTemplate')
    statScroll:SetPoint('TOPLEFT', 17, -145)
    statScroll:SetPoint('BOTTOMLEFT', 17, 40)
    statScroll:SetWidth(182)
    local statChild = CreateFrame('Frame', nil, statScroll)
    statChild:SetSize(182, 1)
    statScroll:SetScrollChild(statChild)
    win.statButtons = {}
    win.statEmpty = NewLabel(win, 'GameFontHighlightSmall', .7, .65, .55)
    win.statEmpty:SetPoint('TOPLEFT', 20, -151)
    win.statEmpty:SetText('No matching stats')
    win.statEmpty:Hide()
    local count = NewLabel(win, 'GameFontNormalSmall', 1, .79, .34)
    count:SetPoint('TOPLEFT', 243, -83)
    win.count = count
    local resultBG = CreateFrame('Frame', nil, win, 'BackdropTemplate')
    resultBG:SetPoint('TOPLEFT', 239, -110)
    resultBG:SetPoint('BOTTOMRIGHT', -15, 40)
    Border(resultBG)
    resultBG:SetBackdropColor(.13, .099, .061, .9)
    resultBG:SetBackdropBorderColor(.40, .30, .18, .95)
    local scroll = CreateFrame('ScrollFrame', nil, resultBG, 'UIPanelScrollFrameTemplate')
    scroll:SetPoint('TOPLEFT', resultBG, 'TOPLEFT', 5, -5)
    scroll:SetPoint('BOTTOMRIGHT', resultBG, 'BOTTOMRIGHT', -27, 5)
    local child = CreateFrame('Frame', nil, scroll)
    child:SetSize(472, 1)
    scroll:SetScrollChild(child)
    win.child = child
    win.scroll = scroll
    win.rows = {}
    local message = NewLabel(resultBG, 'GameFontHighlight', .72, .66, .54)
    message:SetPoint('CENTER', 0, 0)
    message:SetWidth(420)
    message:SetJustifyH('CENTER')
    message:Hide()
    win.message = message

    local tip = NewLabel(win, 'GameFontHighlightSmall', .70, .65, .55)
    tip:SetPoint('BOTTOMLEFT', 18, 15)
    tip:SetText('Hover a gem for details. Shift-click to link it in chat.')
    -- Last typed query remains intact when closing/reopening. No SavedVariables.
    local function Row(index)
        local row = win.rows[index]
        if row then return row end
        row = CreateFrame('Button', nil, child, 'BackdropTemplate')
        row:SetHeight(ROW_H - 3)
        row:SetPoint('TOPLEFT', child, 'TOPLEFT', 3, -((index - 1) * ROW_H + 2))
        row:SetPoint('RIGHT', child, 'RIGHT', -4, 0)
        Border(row)
        row:SetBackdropColor(.16, .12, .076, .95)
        row:SetBackdropBorderColor(.38, .29, .17, .8)
        row:SetHighlightTexture('Interface\\QuestFrame\\UI-QuestTitleHighlight', 'ADD')
        row.icon = row:CreateTexture(nil, 'ARTWORK')
        row.icon:SetSize(32, 32)
        row.icon:SetPoint('LEFT', 8, 0)
        row.icon:SetTexCoord(.08, .92, .08, .92)
        row.name = NewLabel(row, 'GameFontNormal', 1, .87, .34)
        row.name:SetPoint('TOPLEFT', row.icon, 'TOPRIGHT', 8, -3)
        row.name:SetPoint('TOPRIGHT', -96, -4)
        if row.name.SetMaxLines then row.name:SetMaxLines(1) end
        if row.name.SetWordWrap then row.name:SetWordWrap(false) end
        row.statsText = NewLabel(row, 'GameFontHighlightSmall', .77, .77, .70)
        row.statsText:SetPoint('BOTTOMLEFT', row.icon, 'BOTTOMRIGHT', 8, 3)
        row.statsText:SetPoint('BOTTOMRIGHT', -8, 5)
        if row.statsText.SetMaxLines then row.statsText:SetMaxLines(1) end
        if row.statsText.SetWordWrap then row.statsText:SetWordWrap(false) end
        row.source = NewLabel(row, 'GameFontHighlightSmall', .65, .56, .42)
        row.source:SetPoint('TOPRIGHT', -9, -7)
        row.source:SetJustifyH('RIGHT')
        row.source:SetWidth(86)
        if row.source.SetMaxLines then row.source:SetMaxLines(1) end
        if row.source.SetWordWrap then row.source:SetWordWrap(false) end
        row:RegisterForClicks('LeftButtonUp')
        row:SetScript('OnEnter', function(self)
            local gem = self.gem
            if not gem or not GameTooltip then return end
            GameTooltip:SetOwner(self, 'ANCHOR_NONE')
            GameTooltip:ClearLines()
            GameTooltip:SetHyperlink('item:' .. gem.id)
            GameTooltip:Show()
            -- Hover near the item, not top-right of the entire screen. Very
            -- tall tooltips go to the window's edge, avoiding the rows below.
            GameTooltip:ClearAllPoints()
            if GameTooltip:GetHeight() > (self:GetTop() or 400) - 24 then
                GameTooltip:SetPoint('TOPLEFT', win, 'TOPRIGHT', 6, -5)
            else
                GameTooltip:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 4)
            end
        end)
        row:SetScript('OnLeave', function() if GameTooltip then GameTooltip:Hide() end end)
        row:SetScript('OnClick', function(self)
            local gem = self.gem
            if not gem then return end
            if IsShiftKeyDown and IsShiftKeyDown() then
                local link = GetItemInfo and select(2, GetItemInfo(gem.id))
                if link and ChatEdit_InsertLink then
                    if ChatEdit_InsertLink(link) then return end
                end
                if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage(link or gem.name) end
            else
                if GameTooltip then
                    GameTooltip:SetOwner(self, 'ANCHOR_RIGHT')
                    GameTooltip:SetHyperlink('item:' .. gem.id)
                    GameTooltip:Show()
                end
            end
        end)
        win.rows[index] = row
        return row
    end
    function win:Refresh()
        local n = SelectedCount(self.selectedStats)
        local filtered = FDJ.GemFinderFilterStats(search:GetText())
        self.statCount:SetText(n .. ' / 2 selected')
        for i, key in ipairs(filtered) do
            local button = self.statButtons[i]
            if not button then
                button = CreateFrame('CheckButton', nil, statChild, 'UICheckButtonTemplate')
                button:SetSize(22, 22)
                button.label = NewLabel(button, 'GameFontHighlightSmall')
                button.label:SetPoint('LEFT', button, 'RIGHT', 3, 0)
                button.label:SetWidth(148)
                button:SetHitRectInsets(0, -150, 0, 0)
                button:SetScript('OnClick', function(self)
                    if FDJ.GemFinderToggleStat(win.selectedStats, self.statKey) then
                        if win.selectedStats[self.statKey] then search:SetText('') end
                        win:Refresh()
                    end
                end)
                self.statButtons[i] = button
            end
            local enabled = self.selectedStats[key] or n < 2
            button.statKey = key
            button:SetPoint('TOPLEFT', statChild, 'TOPLEFT', 0, -(i-1)*26)
            button.label:SetText(LABELS[key] or key)
            button:SetChecked(self.selectedStats[key] or false)
            button:SetEnabled(enabled)
            button:SetAlpha(enabled and 1 or .4)
            button:Show()
        end
        for i = #filtered+1, #self.statButtons do self.statButtons[i]:Hide() end
        statChild:SetHeight(math.max(1, #filtered * 26))
        self.statEmpty:SetShown(#filtered == 0)
        local result = FDJ.GemFinderGetSelectedResults(self.selectedStats)
        local summary = {}
        for _, key in ipairs(STATS_ORDER) do
            if self.selectedStats[key] then summary[#summary+1] = LABELS[key] or key end
        end
        count:SetText(n == 0 and 'Matching gems' or (#result .. ' gems - ' .. table.concat(summary, ' + ')))
        for i, gem in ipairs(result) do
            local row = Row(i)
            row.gem = gem
            row.icon:SetTexture(ItemIcon(gem.id, gem.color))
            local r, g, b = QualityRGB(gem.quality)
            row.name:SetText(gem.name)
            row.name:SetTextColor(r, g, b)
            row.statsText:SetText(gem.color .. '  -  ' .. StatsString(gem))
            row.source:SetText(gem.source)
            row:Show()
        end
        for i = #result + 1, #self.rows do self.rows[i]:Hide(); self.rows[i].gem = nil end
        child:SetHeight(math.max(1, #result * ROW_H + 4))
        scroll:SetVerticalScroll(0)
        if #result == 0 then
            message:SetText(n == 0 and 'Choose 1 or 2 stats to find your gem.' or 'No gems have both stats. Deselect a stat to try another combination.')
            message:Show()
        else message:Hide() end
    end
    search:SetScript('OnTextChanged', function() statScroll:SetVerticalScroll(0); win:Refresh() end)
    search:SetScript('OnEnterPressed', function()
        local filtered = FDJ.GemFinderFilterStats(search:GetText())
        local query = search:GetText():lower():gsub('^%s+', ''):gsub('%s+$', '')
        local key = ALIASES[query] or (#filtered == 1 and filtered[1])
        if key and not win.selectedStats[key] then
            if FDJ.GemFinderToggleStat(win.selectedStats, key) then search:SetText('') end
        end
        win:Refresh(); search:ClearFocus()
    end)
    win:SetScript('OnShow', function() win:Refresh(); search:SetFocus() end)
    return win
end

function FDJ.ToggleGemFinderWindow(frame)
    if not popup then popup = CreatePopup(frame) end
    if popup:IsShown() then popup:Hide() else popup:Show(); if popup.Raise then popup:Raise() end end
end

-- Called once while Core/Journal constructs the homepage toolbar. The
-- wrapping order is Loot Filter -> Favourites -> Gem Finder.
local createHomeActions = FDJ.CreateLootFilterButton
if createHomeActions then
    FDJ.CreateLootFilterButton = function(frame, home, anchorButton)
        createHomeActions(frame, home, anchorButton)
        if not frame or not frame.favouritesButton or frame.gemFinderButton then return end
        local btn = CreateFrame('Button', nil, home, 'BackdropTemplate')
        frame.gemFinderButton = btn
        btn:SetSize(36, 28)
        btn:SetPoint('RIGHT', frame.favouritesButton, 'LEFT', -8, 0)
        Border(btn)
        btn:SetBackdropColor(.12, .11, .095, .99)
        btn:SetBackdropBorderColor(.56, .42, .25, 1)
        local gemIcon = btn:CreateTexture(nil, 'ARTWORK')
        gemIcon:SetTexture(RUBY)
        gemIcon:SetTexCoord(.08, .92, .08, .92)
        gemIcon:SetSize(23, 23)
        gemIcon:SetPoint('CENTER', 0, 0)
        btn:SetHighlightTexture('Interface\\QuestFrame\\UI-QuestTitleHighlight', 'ADD')
        btn:SetScript('OnClick', function() FDJ.ToggleGemFinderWindow(frame) end)
        btn:SetScript('OnEnter', function(self)
            if not GameTooltip then return end
            GameTooltip:SetOwner(self, 'ANCHOR_TOP')
            GameTooltip:SetText('Gem Finder', 1, .83, .28)
            GameTooltip:AddLine('Choose or type up to two gem stats', .9, .85, .72, true)
            GameTooltip:Show()
        end)
        btn:SetScript('OnLeave', function() if GameTooltip then GameTooltip:Hide() end end)
    end
end
