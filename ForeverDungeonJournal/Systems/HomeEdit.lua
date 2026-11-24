-- editmode (2.1.5, M 24 Nov 2026: "I also wanna replace hide dungeons with
-- edit mode. In Edit mode, when we click we enter a ui kinda like hide
-- dungeons did. In this UI, the icon tabs, char logs icons are replaced with
-- edit mode buttons: Hide Dungeons, Re Order Dungeons, Grid Mode. should be
-- obvious what they do").
--
-- View Mode, Reset (M 24 Nov 2026, with a player's list-view screenshot
-- from Discord: "REMOVE loot filter and favourites buttons when in edit
-- mode. after grid mode add a reset button with red background, it has a
-- popup: Reset back to default UI? ... let's call it View Mode ... clicking
-- on View Mode opens 3 options just below that button, Default, Smaller
-- Cards, List Mode").
--
-- The home page's Hide Dungeons button is now Edit Mode (Core/Journal.lua:
-- FDJ.SetHomeEditMode; it reads Done while on, as before). In Edit Mode the
-- cards get the cyan edit look Hide Dungeons gave them, and the row of icons
-- at the top left (the WoW Forever emblem, Raids, Sleeping Bag, Onyxia, Tier
-- Sets), the Character Logs portrait, Favourites and Loot Filter make way
-- for four buttons:
--   Hide Dungeons     (lit when Edit Mode starts) a click on a card hides it
--                     or brings it back, as the old button did.
--   Reorder Dungeons  every dungeon, locked and hidden ones too: drag a card
--                     onto another and the two swap places (the one under
--                     it lights up gold; the list scrolls at its top and
--                     bottom edges), or click one and then the other (for
--                     controllers) (M 24 Nov 2026: "i also want reorder to
--                     just swap position with a dungeon when dragged over the
--                     dungeon card, no need to drag it all the way past or
--                     before"). Right-click
--                     the button: Reset Order. The order is the account's
--                     (ForeverDungeonJournalDB.homeOrder), and the < > beside
--                     Dungeons follow it.
--   View Mode         opens Default / Smaller Cards (four in a row) / List
--                     (one slim row each: level, name, quests, the art as a
--                     band behind; the green ticks in one column) just below
--                     it; kept between sessions, account-wide
--                     (ForeverDungeonJournalDB.homeView). List's text style:
--                     FDJ.LIST_STYLE below.
--   Reset (red)       "Reset back to default UI?" Yes: hidden dungeons come
--                     back (this character's), the original order, Default view.
-- Done (or closing the journal) brings the icons and buttons back. With the
-- RPG Mode button the row would not fit: it steps aside in Edit Mode too.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local function L(key, ...)
    if FDJ.L then return FDJ.L(key, ...) end
    return key
end
local function Journal() return _G.ForeverDungeonJournalFrame end
local function Store()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    return ForeverDungeonJournalDB
end
local function Sound()
    if PlaySound and SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON then
        pcall(PlaySound, SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
    end
end
local function EditOn() return FDJ.IsHomeEditMode and FDJ.IsHomeEditMode() or false end
local function Refresh()
    if FDJ.RefreshHomeCards then pcall(FDJ.RefreshHomeCards) end
end

FDJ.homeEditTool = FDJ.homeEditTool or "hide"
function FDJ.HomeEditTool() return FDJ.homeEditTool or "hide" end

-- ------------------------------------------------------------ View Mode
local VIEWS = { default = true, small = true, list = true }
function FDJ.HomeViewMode()
    local db = ForeverDungeonJournalDB
    if not db then return "default" end
    if db.homeGrid then -- (the first dev build's Grid Mode is Smaller Cards)
        db.homeGrid = nil
        if db.homeView == nil then db.homeView = "small" end
    end
    return VIEWS[db.homeView] and db.homeView or "default"
end
function FDJ.SetHomeViewMode(mode)
    Store().homeView = (VIEWS[mode] and mode ~= "default") and mode or nil
    Refresh()
end

-- ------------------------------------------------------------ the order
-- The journal's own order (FDJ.ORDER) until the player moves a card. A
-- dungeon added to the journal later goes after the one before it in the
-- journal's own order.
function FDJ.HomeOrder()
    local base = FDJ.ORDER or {}
    local saved = ForeverDungeonJournalDB and ForeverDungeonJournalDB.homeOrder
    if type(saved) ~= "table" or #saved == 0 then return base end
    local known, list, used = {}, {}, {}
    for _, name in ipairs(base) do known[name] = true end
    for _, name in ipairs(saved) do
        if known[name] and not used[name] then
            list[#list + 1] = name
            used[name] = true
        end
    end
    for i, name in ipairs(base) do
        if not used[name] then
            local at = 0
            for j = i - 1, 1, -1 do
                if used[base[j]] then
                    for k, n in ipairs(list) do
                        if n == base[j] then at = k break end
                    end
                    break
                end
            end
            table.insert(list, at + 1, name)
            used[name] = true
        end
    end
    return list
end

-- name goes just before target (after: just after it).
local function Move(name, target, after)
    if not name or not target or name == target then return false end
    local list = {}
    for _, n in ipairs(FDJ.HomeOrder()) do
        if n ~= name then list[#list + 1] = n end
    end
    local at
    for i, n in ipairs(list) do
        if n == target then at = i break end
    end
    if not at then return false end
    table.insert(list, after and at + 1 or at, name)
    -- back to the journal's own order: nothing kept
    local base, same = FDJ.ORDER or {}, #list == #(FDJ.ORDER or {})
    for i = 1, #list do
        if list[i] ~= base[i] then same = false break end
    end
    Store().homeOrder = (not same) and list or nil
    return true
end
FDJ.MoveHomeDungeon = Move

-- The two dungeons change places (the others stay where they are).
local function SwapDungeons(a, b)
    if not a or not b or a == b then return false end
    local list = {}
    for i, n in ipairs(FDJ.HomeOrder()) do list[i] = n end
    local ia, ib
    for i, n in ipairs(list) do
        if n == a then ia = i elseif n == b then ib = i end
    end
    if not (ia and ib) then return false end
    list[ia], list[ib] = list[ib], list[ia]
    local base, same = FDJ.ORDER or {}, #list == #(FDJ.ORDER or {})
    for i = 1, #list do
        if list[i] ~= base[i] then same = false break end
    end
    Store().homeOrder = (not same) and list or nil
    return true
end
FDJ.SwapHomeDungeons = SwapDungeons

function FDJ.ResetHomeOrder()
    Store().homeOrder = nil
    Refresh()
end

-- ------------------------------------------- Reorder Dungeons: the cards
local picked, pickedLabel -- a card picked up by a click (its dungeon)
local drag                -- { name, card } while a card is dragged
local ghost, marker

local function Reordering() return EditOn() and FDJ.HomeEditTool() == "reorder" end

-- The card's name; a page still locked in RPG Mode (its sketch shown, its
-- name hidden) keeps it hidden here too.
local function Label(card)
    if card.rpgPage and card.rpgPage:IsShown() then return L("RPG_LOCKED_TIP_TITLE") end
    return card.title and card.title:GetText() or card.dungeonName or ""
end

local function Cards()
    local f = Journal()
    local list = {}
    if not (f and f.homeCardsContent) then return list end
    for _, child in ipairs({ f.homeCardsContent:GetChildren() }) do
        if child.dungeonName and child:IsShown() and child ~= marker then list[#list + 1] = child end
    end
    return list
end

local function Cursor(region)
    local x, y = GetCursorPosition()
    local s = region:GetEffectiveScale() or 1
    return x / s, y / s
end

-- The card under the cursor (the gaps between cards count for the nearer one).
local function DropTarget()
    local f = Journal()
    local scroll = f and f.homeScroll
    if not (scroll and scroll:IsVisible()) then return nil end
    local x, y = Cursor(scroll)
    local l, r, t, b = scroll:GetLeft(), scroll:GetRight(), scroll:GetTop(), scroll:GetBottom()
    if not (l and r and t and b) then return nil end
    if x < l - 30 or x > r + 30 or y > t + 30 or y < b - 30 then return nil end -- (let go away from the list: nothing moves)
    local best, bestD
    for _, card in ipairs(Cards()) do
        local cl, cr, ct, cb = card:GetLeft(), card:GetRight(), card:GetTop(), card:GetBottom()
        if cl and cr and ct and cb and ct > b - 4 and cb < t + 4 then -- (only cards in view)
            local dx = math.max(cl - x, 0, x - cr)
            local dy = math.max(cb - y, 0, y - ct)
            local d = dx * dx + dy * dy
            if d <= 49 and (not bestD or d < bestD) then best, bestD = card, d end -- (within 7 px: half a gap)
        end
    end
    return best
end

-- The card it would swap with: lit gold.
local function Marker()
    if marker then return marker end
    local f = Journal()
    marker = CreateFrame("Frame", nil, f.homeCardsContent)
    marker.wash = marker:CreateTexture(nil, "OVERLAY")
    marker.wash:SetPoint("TOPLEFT", 4, -4)
    marker.wash:SetPoint("BOTTOMRIGHT", -4, 4)
    marker.wash:SetColorTexture(1, 0.82, 0.25, 0.22)
    -- a 2 px gold frame just inside the card's border
    local function Edge(p1, x1, y1, p2, x2, y2, w, h)
        local e = marker:CreateTexture(nil, "OVERLAY", nil, 1)
        e:SetColorTexture(1, 0.86, 0.32, 1)
        e:SetPoint(p1, x1, y1)
        e:SetPoint(p2, x2, y2)
        if w then e:SetWidth(w) else e:SetHeight(h) end
    end
    Edge("TOPLEFT", 4, -4, "TOPRIGHT", -4, -4, nil, 2)
    Edge("BOTTOMLEFT", 4, 4, "BOTTOMRIGHT", -4, 4, nil, 2)
    Edge("TOPLEFT", 4, -4, "BOTTOMLEFT", 4, 4, 2, nil)
    Edge("TOPRIGHT", -4, -4, "BOTTOMRIGHT", -4, 4, 2, nil)
    marker:Hide()
    return marker
end

local function UpdateMarker()
    local m = Marker()
    local card = DropTarget()
    if not card or not drag or card.dungeonName == drag.name then m:Hide() return end
    m:SetFrameLevel((card:GetFrameLevel() or 1) + 10)
    m:ClearAllPoints()
    m:SetAllPoints(card)
    m:Show()
end

local function StopDrag(drop)
    if not drag then return end
    local d = drag
    drag = nil
    if ghost then ghost:Hide() end
    if marker then marker:Hide() end
    if d.card then d.card:SetAlpha(1) end
    if drop then
        local target = DropTarget()
        if target and target.dungeonName ~= d.name and SwapDungeons(d.name, target.dungeonName) then Sound() end
    end
    Refresh()
end

local function Ghost()
    if ghost then return ghost end
    ghost = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    ghost:SetFrameStrata("TOOLTIP")
    ghost:EnableMouse(false)
    ghost:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    ghost:SetBackdropColor(0.02, 0.02, 0.02, 0.9)
    ghost:SetBackdropBorderColor(1, 0.82, 0.25, 1)
    ghost.art = ghost:CreateTexture(nil, "ARTWORK")
    ghost.art:SetPoint("TOPLEFT", 3, -3)
    ghost.art:SetPoint("BOTTOMRIGHT", -3, 3)
    ghost.shade = ghost:CreateTexture(nil, "ARTWORK", nil, 1)
    ghost.shade:SetPoint("TOPLEFT", 3, -3)
    ghost.shade:SetPoint("TOPRIGHT", -3, -3)
    ghost.shade:SetHeight(26)
    ghost.shade:SetColorTexture(0, 0, 0, 0.5)
    ghost.title = ghost:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
    ghost.title:SetPoint("TOPLEFT", 9, -8)
    ghost.title:SetPoint("RIGHT", -9, 0)
    ghost.title:SetJustifyH("LEFT")
    if ghost.title.SetWordWrap then ghost.title:SetWordWrap(false) end
    ghost.title:SetTextColor(1.00, 0.88, 0.24)
    ghost:SetScript("OnUpdate", function(self, elapsed)
        if not drag then self:Hide() return end
        -- (the button let go somewhere the card's OnDragStop doesn't hear)
        if IsMouseButtonDown and not IsMouseButtonDown("LeftButton") then StopDrag(true) return end
        local x, y = Cursor(UIParent)
        self:ClearAllPoints()
        self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y)
        -- at the list's top or bottom edge, it scrolls
        local f = Journal()
        local scroll = f and f.homeScroll
        if scroll and scroll:IsVisible() then
            local sx, sy = Cursor(scroll)
            local l, r, t, b = scroll:GetLeft(), scroll:GetRight(), scroll:GetTop(), scroll:GetBottom()
            if l and r and t and b and sx > l - 40 and sx < r + 40 then
                local step = (sy > t - 30 and -1) or (sy < b + 30 and 1) or 0
                if step ~= 0 then
                    local range = scroll:GetVerticalScrollRange() or 0
                    local v = (scroll:GetVerticalScroll() or 0) + step * 480 * (elapsed or 0)
                    scroll:SetVerticalScroll(math.max(0, math.min(range, v)))
                end
            end
        end
        UpdateMarker()
    end)
    ghost:Hide()
    return ghost
end

local function StartDrag(card)
    if not (Reordering() and card.dungeonName) then return end
    picked, pickedLabel = nil, nil
    drag = { name = card.dungeonName, card = card }
    local g = Ghost()
    local w = math.min(card:GetWidth() or 200, 220)
    if FDJ.HomeViewMode() == "list" then
        g:SetSize(math.min(card:GetWidth() or 300, 300), card:GetHeight() or 32) -- (a row)
    else
        g:SetSize(w, math.floor(w * 0.36 + 0.5))
    end
    local page = card.rpgPage
    if page and page:IsShown() and page.sketch then
        g.art:SetTexture(page.sketch:GetTexture())
        g.art:SetTexCoord(0, 1, 0, 1)
    else
        g.art:SetTexture(card.art:GetTexture())
        g.art:SetTexCoord(card.art:GetTexCoord())
    end
    g.title:SetText(Label(card))
    g:Show()
    card:SetAlpha(0.35)
    if GameTooltip then GameTooltip:Hide() end
    Sound()
end

local function ReEnter(card)
    if not (card and card:IsVisible() and card:IsMouseOver()) then return end
    local onEnter = card:GetScript("OnEnter")
    if onEnter then pcall(onEnter, card) end
end

-- Core/Journal.lua's card OnClick, in Edit Mode: true when handled here.
function FDJ.HomeEditCardClick(card)
    if not Reordering() then return false end
    local name = card.dungeonName
    if not name then return true end
    Sound()
    if not picked then
        picked, pickedLabel = name, Label(card)
    elseif picked == name then
        picked, pickedLabel = nil, nil
    else
        SwapDungeons(picked, name) -- (the two change places)
        picked, pickedLabel = nil, nil
    end
    Refresh()
    ReEnter(card) -- (its tooltip says what the next click does)
    return true
end

-- Core/Journal.lua's card OnEnter, in Edit Mode: true when handled here.
function FDJ.HomeEditCardEnter(card)
    if not Reordering() then return false end
    if drag then return true end
    GameTooltip:SetOwner(card, "ANCHOR_TOP")
    GameTooltip:SetText(Label(card))
    if picked == card.dungeonName then
        GameTooltip:AddLine(L("REORDER_PICKED_TIP"), 1, 1, 1, true)
    elseif picked then
        GameTooltip:AddLine(L("REORDER_PLACE_TIP", pickedLabel or picked), 1, 1, 1, true)
    else
        GameTooltip:AddLine(L("REORDER_CARD_TIP"), 1, 1, 1, true)
    end
    GameTooltip:Show()
    return true
end

-- --------------------------------------- every card, after each refresh
local function SetFont(fs, name)
    local obj = _G[name]
    if fs and obj then fs:SetFontObject(obj) end
end

-- ------------------------------------------------------ List's text
-- liststyle (M 24 Nov 2026: "in line mode the dungeons are a bit hard to
-- read, can u give me a proper tool to change the font, color, stroke,
-- stroke color, stroke size, font size, until im happy with it. it should
-- only affect list mode"): the names, levels and quest counts of List take
-- these. font: the file for Latin letters (cyr: for Russian; Korean and
-- Chinese keep the journal's own fonts, the size moved the same); outline:
-- the game's black outline ("", "OUTLINE", "THICKOUTLINE"); stroke: an
-- outline of any colour and 1-3 px (copies of the text around it, sr/sg/sb);
-- shadow: px down and right, black. shade: how dark the row is over its art.
-- listlook (M 24 Nov 2026, picked in the dev window /dj liststyle, kept in
-- the vault: "I LIKE THIS"): the name Friz Quadrata 15, #FFD100, the
-- game's outline and a 3 px shadow; the level 11, #FFF2D1; the quests 15,
-- #F7E38A; the rows 60% dark.
local FRIZ, FRIZ_CYR = "Fonts\\FRIZQT__.TTF", "Fonts\\FRIZQT___CYR.TTF"
FDJ.LIST_STYLE = FDJ.LIST_STYLE or {
    name = { font = FRIZ, cyr = FRIZ_CYR, size = 15, r = 1.000, g = 0.820, b = 0.000, outline = "OUTLINE", stroke = 0, sr = 0, sg = 0, sb = 0, shadow = 3 },
    level = { font = FRIZ, cyr = FRIZ_CYR, size = 11, r = 1.000, g = 0.949, b = 0.820, outline = "", stroke = 0, sr = 0, sg = 0, sb = 0, shadow = 1 },
    quests = { font = FRIZ, cyr = FRIZ_CYR, size = 15, r = 0.969, g = 0.890, b = 0.541, outline = "", stroke = 0, sr = 0, sg = 0, sb = 0, shadow = 1 },
    shade = 0.60,
}
-- The journal's own fonts for the other alphabets (Core/Fonts.lua), at the
-- size that goes with the Latin size above.
local LIST_BASE = {
    name = { roman = 12, korean = { "Fonts\\2002.TTF", 12 }, simplifiedchinese = { "Fonts\\ARKai_T.ttf", 15 },
        traditionalchinese = { "Fonts\\blei00d.TTF", 15 }, russian = 12 },
    small = { roman = 10, korean = { "Fonts\\2002.TTF", 11 }, simplifiedchinese = { "Fonts\\ARKai_T.ttf", 15 },
        traditionalchinese = { "Fonts\\blei00d.TTF", 15 }, russian = 10 },
}
local LIST_ALPHABETS = { "roman", "korean", "simplifiedchinese", "traditionalchinese", "russian" }
local listFonts = {}
local function MemberFont(style, base, alphabet)
    local delta = (style.size or base.roman) - base.roman
    if alphabet == "roman" then return style.font or FRIZ, style.size or base.roman end
    if alphabet == "russian" then return style.cyr or FRIZ_CYR, (style.size or base.russian) end
    local b = base[alphabet]
    return b[1], math.max(6, b[2] + delta)
end
-- (a font family of its own for each part: every alphabet keeps its letters)
local function ListFont(part)
    if listFonts[part] == false then return nil end
    local style = FDJ.LIST_STYLE[part]
    local base = LIST_BASE[part == "name" and "name" or "small"]
    local font = listFonts[part]
    if not font then
        if type(CreateFontFamily) ~= "function" then listFonts[part] = false return nil end
        local members = {}
        for _, a in ipairs(LIST_ALPHABETS) do
            local file, size = MemberFont(style, base, a)
            members[#members + 1] = { alphabet = a, file = file, height = size, flags = style.outline or "" }
        end
        local ok, made = pcall(CreateFontFamily, "ForeverDJ_List_" .. part, members)
        if not (ok and made) then listFonts[part] = false return nil end
        font = made
        listFonts[part] = font
    end
    -- the style now (the dev window changes it)
    local key = table.concat({ style.font or "", style.cyr or "", style.size or 0, style.outline or "", style.shadow or 0 }, "|")
    if font.fdjKey ~= key then
        font.fdjKey = key
        local fonts = {}
        if font.GetFontObjectForAlphabet then
            for _, a in ipairs(LIST_ALPHABETS) do
                local ok, m = pcall(font.GetFontObjectForAlphabet, font, a)
                if ok and m then fonts[#fonts + 1] = { m, a } end
            end
        end
        for _, e in ipairs(fonts) do
            local file, size = MemberFont(style, base, e[2])
            local ok, res = pcall(e[1].SetFont, e[1], file, size, style.outline or "")
            if (not ok or res == false) and e[2] == "roman" then pcall(e[1].SetFont, e[1], FRIZ, size, style.outline or "") end -- (a font file the client lacks)
            pcall(e[1].SetShadowOffset, e[1], style.shadow or 0, -(style.shadow or 0))
            pcall(e[1].SetShadowColor, e[1], 0, 0, 0, 1)
        end
        pcall(font.SetShadowOffset, font, style.shadow or 0, -(style.shadow or 0))
        pcall(font.SetShadowColor, font, 0, 0, 0, 1)
    end
    return font
end

-- The coloured stroke: eight copies of the text in the stroke colour, the
-- stroke size away in every direction, under it. (The quest count's crest
-- is left out of them.)
local STROKE_DIRS = { { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 }, { 1, 1 }, { 1, -1 }, { -1, 1 }, { -1, -1 } }
local function Stroke(card, fs, key, font, style)
    local copies = card[key]
    local size = math.floor(style.stroke or 0)
    if size <= 0 or not font then
        if copies then for _, c in ipairs(copies) do c:Hide() end end
        return
    end
    if not copies then
        copies = {}
        for i = 1, #STROKE_DIRS do
            local c = card:CreateFontString(nil, "OVERLAY")
            c:SetDrawLayer("OVERLAY", -1)
            if c.SetWordWrap then c:SetWordWrap(false) end
            copies[i] = c
        end
        card[key] = copies
    end
    local text = (fs:GetText() or ""):gsub("|T.-|t", "")
    local justify = fs.GetJustifyH and fs:GetJustifyH() or "LEFT"
    for i, c in ipairs(copies) do
        local d = STROKE_DIRS[i]
        c:SetFontObject(font)
        c:SetShadowOffset(0, 0)
        c:SetTextColor(style.sr or 0, style.sg or 0, style.sb or 0, 1)
        c:SetJustifyH(justify)
        c:ClearAllPoints()
        c:SetPoint("TOPLEFT", fs, "TOPLEFT", d[1] * size, d[2] * size)
        c:SetPoint("BOTTOMRIGHT", fs, "BOTTOMRIGHT", d[1] * size, d[2] * size)
        c:SetText(text)
        c:SetAlpha(fs:GetAlpha() or 1)
        c:SetShown(fs:IsShown())
    end
end

local function HideStrokes(card)
    for _, key in ipairs({ "fdjStrokeName", "fdjStrokeLevel", "fdjStrokeQuests" }) do
        if card[key] then for _, c in ipairs(card[key]) do c:Hide() end end
    end
end

-- List: the three texts in their style, every refresh.
local function ApplyListText(card)
    local S = FDJ.LIST_STYLE
    for _, part in ipairs({ { "name", card.title, "fdjStrokeName" }, { "level", card.meta, "fdjStrokeLevel" }, { "quests", card.counts, "fdjStrokeQuests" } }) do
        local style, fs = S[part[1]], part[2]
        local font = ListFont(part[1])
        if fs and style then
            if font then
                -- (a font changed in place does not always reach its strings:
                -- another one first, then it again)
                if fs.fdjListKey ~= font.fdjKey and _G.ForeverDJ_GameFontNormal then fs:SetFontObject(_G.ForeverDJ_GameFontNormal) end
                fs:SetFontObject(font)
                fs.fdjListKey = font.fdjKey
            end
            fs:SetTextColor(style.r or 1, style.g or 1, style.b or 1)
            Stroke(card, fs, part[3], font, style)
        end
    end
    card.topShade:SetColorTexture(0, 0, 0, S.shade or 0.45)
end

-- The art at the big cards' scale (about three times as wide as high),
-- what doesn't fit cut off: Smaller Cards lose the sides, List Mode keeps a
-- band through the middle.
local function CropArt(card, width, height)
    local l, t, _, b, r = card.art:GetTexCoord() -- (upper left x, y; lower left x, y; upper right x)
    if not (l and r and t and b and card.art:GetTexture()) then return end
    local aspect = ((width or 177) - 8) / math.max(1, (height or 100) - 8)
    local normal = 3.0
    if aspect < normal then
        local mid, half = (l + r) / 2, (r - l) / 2 * (aspect / normal)
        card.art:SetTexCoord(mid - half, mid + half, t, b)
    else
        local mid, half = (t + b) / 2, (b - t) / 2 * (normal / aspect)
        card.art:SetTexCoord(l, r, mid - half, mid + half)
    end
end

-- Core/Journal.lua calls this for each card it shows (view: "default",
-- "small" for Smaller Cards, "list" for List Mode).
function FDJ.StyleHomeCard(card, view, width, height)
    if not VIEWS[view] then view = "default" end
    if card.fdjView ~= view then
        card.fdjView = view
        card.title:ClearAllPoints()
        card.meta:ClearAllPoints()
        card.counts:ClearAllPoints()
        card.topShade:ClearAllPoints()
        card.topShade:SetPoint("TOPLEFT", 4, -4)
        card.topShade:SetPoint("TOPRIGHT", -4, -4)
        if view == "small" then
            SetFont(card.title, "ForeverDJ_GameFontNormal")
            card.title:SetPoint("TOPLEFT", 10, -9)
            SetFont(card.meta, "ForeverDJ_GameFontHighlightSmall")
            card.meta:SetPoint("BOTTOMLEFT", 10, 8)
            card.meta:SetPoint("RIGHT", -10, 0)
            SetFont(card.counts, "ForeverDJ_GameFontHighlightSmall")
            card.counts:SetPoint("BOTTOMRIGHT", -10, 8)
            card.topShade:SetHeight(36)
            card.topShade:SetColorTexture(0, 0, 0, 0.42)
        elseif view == "list" then
            -- one slim row: "LV 15-21", the name, then the quests at the right
            SetFont(card.meta, "ForeverDJ_GameFontHighlightSmall")
            card.meta:SetPoint("LEFT", 12, 0)
            SetFont(card.title, "ForeverDJ_GameFontNormal")
            card.title:SetPoint("LEFT", 74, 0)
            SetFont(card.counts, "ForeverDJ_GameFontHighlightSmall")
            card.counts:SetPoint("RIGHT", -12, 0)
            card.topShade:SetPoint("BOTTOMLEFT", 4, 4) -- (darker all over, for the text)
            card.topShade:SetPoint("BOTTOMRIGHT", -4, 4)
            card.topShade:SetColorTexture(0, 0, 0, 0.45)
        else
            SetFont(card.title, "ForeverDJ_GameFontNormalLarge")
            card.title:SetPoint("TOPLEFT", 16, -14)
            card.title:SetWidth(220)
            SetFont(card.meta, "ForeverDJ_GameFontHighlightSmall")
            card.meta:SetPoint("BOTTOMLEFT", 14, 10)
            card.meta:SetPoint("RIGHT", -16, 0)
            SetFont(card.counts, "ForeverDJ_GameFontHighlight")
            card.counts:SetPoint("TOPRIGHT", -14, -11)
            card.topShade:SetHeight(42)
            card.topShade:SetColorTexture(0, 0, 0, 0.42)
        end
        if card.meta.SetJustifyH then card.meta:SetJustifyH("LEFT") end
        if card.title.SetWordWrap then card.title:SetWordWrap(view ~= "list") end
        if card.hiddenText then SetFont(card.hiddenText, view == "list" and "ForeverDJ_GameFontNormalLarge" or "ForeverDJ_GameFontNormalHuge") end
        -- (a font object brings its own colour back)
        card.title:SetTextColor(1.00, 0.88, 0.24)
        card.meta:SetTextColor(1.00, 0.95, 0.82)
        card.counts:SetTextColor(0.97, 0.89, 0.54)
        if card.hiddenText then card.hiddenText:SetTextColor(1.00, 1.00, 1.00) end
    end
    -- ("Coming Soon" is made the first time a card shows such a dungeon)
    if card.comingSoon and card.comingSoon.fdjView ~= view then
        card.comingSoon.fdjView = view
        SetFont(card.comingSoon, view == "default" and "ForeverDJ_GameFontNormalHuge" or "ForeverDJ_GameFontNormalLarge")
        card.comingSoon:SetTextColor(1.00, 0.82, 0.20)
        card.comingSoon:ClearAllPoints()
        card.comingSoon:SetPoint("CENTER", 0, view == "list" and 0 or -6)
    end
    if view == "small" then
        card.title:SetWidth(math.max(60, (width or 177) - 20))
    elseif view == "list" then
        card.title:SetWidth(math.max(80, (width or 700) - 74 - 170))
        -- (the band some art has at its bottom: not on a row)
        if card.fdjBand then card.fdjBand:Hide() end
        if card.fdjBandFade then card.fdjBandFade:Hide() end
    end
    if view ~= "default" then CropArt(card, width, height) end
    if view == "list" then ApplyListText(card) else HideStrokes(card) end
    -- Reorder Dungeons: the card picked up glows gold; cards can be dragged
    local reorder = Reordering()
    local isPicked = reorder and picked ~= nil and card.dungeonName == picked
    if card.editOverlay then
        if isPicked then
            card.editOverlay:SetColorTexture(1.00, 0.82, 0.25, 0.30)
        else
            card.editOverlay:SetColorTexture(0.20, 0.78, 1.00, 0.18)
        end
    end
    if isPicked then card:SetBackdropBorderColor(1.00, 0.82, 0.25, 1) end
    if not card.fdjDragReady then
        card.fdjDragReady = true
        card:SetScript("OnDragStart", function(self) StartDrag(self) end)
        card:SetScript("OnDragStop", function() StopDrag(true) end)
    end
    -- (only while reordering: a normal click on a card must never turn into a drag)
    if reorder then card:RegisterForDrag("LeftButton") else card:RegisterForDrag() end
    if not (drag and drag.card == card) then card:SetAlpha(1) end
end

-- ------------------------------------------------------ the buttons
local bar, buttons, resetMenu, viewMenu, resetAsk
local TOOLS = {
    { key = "hide", label = "HIDE_DUNGEONS", tip = "HIDE_DUNGEONS_TIP" },
    { key = "reorder", label = "REORDER_DUNGEONS", tip = "REORDER_TIP", extra = "REORDER_RESET_TIP" },
    { key = "view", label = "VIEW_MODE", tip = "VIEW_MODE_TIP", caret = true },
    { key = "reset", label = "RESET_UI", tip = "RESET_UI_TIP", red = true },
}
local VIEW_CHOICES = {
    { mode = "default", label = "VIEW_DEFAULT" },
    { mode = "small", label = "VIEW_SMALL" },
    { mode = "list", label = "VIEW_LIST" },
}

local function Lit(b)
    if b.fdjKey == "view" then return viewMenu ~= nil and viewMenu:IsShown() end
    if b.fdjKey == "reset" then return false end
    return FDJ.HomeEditTool() == b.fdjKey
end

local function Paint(b)
    if b.fdjSpec.red then
        -- Reset: red
        b:SetBackdropColor(0.42, 0.05, 0.04, 0.98)
        b:SetBackdropBorderColor(0.78, 0.26, 0.18, 1)
        b.text:SetTextColor(1.00, 0.86, 0.80)
    elseif Lit(b) then
        b:SetBackdropColor(0.25, 0.19, 0.08, 0.98)
        b:SetBackdropBorderColor(1.00, 0.82, 0.30, 1)
        b.text:SetTextColor(1.00, 0.93, 0.62)
    else
        b:SetBackdropColor(0.12, 0.115, 0.105, 0.98)
        b:SetBackdropBorderColor(0.48, 0.40, 0.27, 1)
        b.text:SetTextColor(1.00, 0.82, 0.27)
    end
end
local function PaintAll()
    if buttons then for _, b in ipairs(buttons) do Paint(b) end end
end

-- A small menu box in the journal's dark and gold (as the icons' right-click menus).
local function MenuBox(name)
    local m = CreateFrame("Frame", name, UIParent, "BackdropTemplate")
    m:SetFrameStrata("FULLSCREEN_DIALOG")
    m:EnableMouse(true)
    m:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    m:SetBackdropColor(0.055, 0.05, 0.043, 0.98)
    m:SetBackdropBorderColor(0.57, 0.43, 0.20, 1)
    -- closes on its own once the mouse has been away from it and its button a moment
    m:SetScript("OnUpdate", function(self, elapsed)
        if self:IsMouseOver() or (self.fdjAnchor and self.fdjAnchor:IsMouseOver()) then
            self.fdjAway = 0
        else
            self.fdjAway = (self.fdjAway or 0) + elapsed
            if self.fdjAway > 0.6 then self:Hide() end
        end
    end)
    m:Hide()
    return m
end
local function MenuItem(menu, onClick)
    local item = CreateFrame("Button", nil, menu)
    item:SetHeight(20)
    item:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    item.text = item:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
    item.text:SetPoint("LEFT", 24, 0)
    item:SetScript("OnClick", onClick)
    return item
end
local function OpenMenu(menu, anchor)
    menu.fdjAnchor = anchor
    menu.fdjAway = 0
    menu:ClearAllPoints()
    menu:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -2)
    menu:Show()
    if GameTooltip then GameTooltip:Hide() end
end

local function ShowResetMenu(anchor)
    if not resetMenu then
        resetMenu = MenuBox("ForeverDungeonJournalOrderMenu")
        resetMenu.item = MenuItem(resetMenu, function()
            resetMenu:Hide()
            Sound()
            picked, pickedLabel = nil, nil
            FDJ.ResetHomeOrder()
        end)
        resetMenu.item:SetPoint("TOPLEFT", 5, -5)
        resetMenu.item:SetPoint("RIGHT", -5, 0)
        resetMenu.item.text:SetPoint("LEFT", 6, 0)
    end
    resetMenu.item.text:SetText(L("RESET_ORDER"))
    resetMenu:SetSize(math.max(110, (resetMenu.item.text:GetStringWidth() or 0) + 24), 30)
    OpenMenu(resetMenu, anchor)
    resetMenu:ClearAllPoints()
    resetMenu:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 4, -2)
end

-- View Mode: Default, Smaller Cards, List Mode, just below its button; the
-- one in use ticked.
local function ShowViewMenu(anchor)
    if not viewMenu then
        viewMenu = MenuBox("ForeverDungeonJournalViewMenu")
        viewMenu.items = {}
        for i, choice in ipairs(VIEW_CHOICES) do
            local item = MenuItem(viewMenu, function()
                viewMenu:Hide()
                Sound()
                FDJ.SetHomeViewMode(choice.mode)
            end)
            item:SetPoint("TOPLEFT", 5, -5 - (i - 1) * 22)
            item:SetPoint("RIGHT", -5, 0)
            item.check = item:CreateTexture(nil, "OVERLAY")
            item.check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
            item.check:SetSize(16, 16)
            item.check:SetPoint("LEFT", 4, 0)
            item.fdjMode = choice.mode
            item.fdjLabel = choice.label
            viewMenu.items[i] = item
        end
        viewMenu:HookScript("OnShow", PaintAll)
        viewMenu:HookScript("OnHide", PaintAll)
    end
    local current, widest = FDJ.HomeViewMode(), 0
    for _, item in ipairs(viewMenu.items) do
        item.text:SetText(L(item.fdjLabel))
        local on = item.fdjMode == current
        item.check:SetShown(on)
        item.text:SetTextColor(on and 1 or 0.95, on and 0.93 or 0.83, on and 0.62 or 0.53)
        widest = math.max(widest, item.text:GetStringWidth() or 0)
    end
    viewMenu:SetSize(math.max(anchor:GetWidth() or 120, math.ceil(widest + 44)), #viewMenu.items * 22 + 8)
    OpenMenu(viewMenu, anchor)
end

-- Reset: "Reset back to default UI?" Yes: this character's hidden dungeons
-- (and the ones shown although an option hides them) back to normal, the
-- original order, the Default view.
function FDJ.ResetHomeUI()
    local hidden = FDJ.HiddenDungeons and FDJ.HiddenDungeons()
    if type(hidden) == "table" then for k in pairs(hidden) do hidden[k] = nil end end
    local shown = FDJ.ShownDungeons and FDJ.ShownDungeons()
    if type(shown) == "table" then for k in pairs(shown) do shown[k] = nil end end
    local db = Store()
    db.homeOrder, db.homeView, db.homeGrid = nil, nil, nil
    picked, pickedLabel = nil, nil
    Refresh()
end
if StaticPopupDialogs then
    StaticPopupDialogs["FDJ_RESET_HOME_UI"] = {
        text = "%s",
        button1 = YES or "Yes",
        button2 = NO or "No",
        OnAccept = function() FDJ.ResetHomeUI() end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }
end
-- (with a controller connected, the journal's own window, as the tracker's
-- Reset does: the game's popup would taint controller input)
local function AskReset()
    if not (FDJ.ControllerConnected and FDJ.ControllerConnected()) and StaticPopup_Show and StaticPopupDialogs
        and StaticPopupDialogs.FDJ_RESET_HOME_UI then
        StaticPopup_Show("FDJ_RESET_HOME_UI", L("RESET_UI_CONFIRM"))
        return
    end
    if not resetAsk then
        resetAsk = CreateFrame("Frame", "ForeverDungeonJournalResetUIAsk", UIParent, "BackdropTemplate")
        resetAsk:SetSize(320, 90)
        resetAsk:SetFrameStrata("FULLSCREEN_DIALOG")
        resetAsk:SetToplevel(true)
        resetAsk:EnableMouse(true)
        resetAsk:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 },
        })
        resetAsk.text = resetAsk:CreateFontString(nil, "ARTWORK", "ForeverDJ_GameFontHighlight")
        resetAsk.text:SetPoint("TOP", 0, -20)
        resetAsk.text:SetWidth(280)
        resetAsk.text:SetJustifyH("CENTER")
        local yes = CreateFrame("Button", nil, resetAsk, "UIPanelButtonTemplate")
        if FDJ.OwnFonts then FDJ.OwnFonts(yes) end
        yes:SetSize(110, 22)
        yes:SetPoint("TOPRIGHT", resetAsk.text, "BOTTOM", -6, -10)
        yes:SetText(YES or "Yes")
        yes:SetScript("OnClick", function() resetAsk:Hide() FDJ.ResetHomeUI() end)
        local no = CreateFrame("Button", nil, resetAsk, "UIPanelButtonTemplate")
        if FDJ.OwnFonts then FDJ.OwnFonts(no) end
        no:SetSize(110, 22)
        no:SetPoint("TOPLEFT", resetAsk.text, "BOTTOM", 6, -10)
        no:SetText(NO or "No")
        no:SetScript("OnClick", function() resetAsk:Hide() end)
        resetAsk:Hide()
    end
    resetAsk.text:SetText(L("RESET_UI_CONFIRM"))
    resetAsk:SetHeight(math.floor((resetAsk.text:GetStringHeight() or 14) + 0.5) + 67)
    resetAsk:ClearAllPoints()
    resetAsk:SetPoint("TOP", UIParent, "TOP", 0, -135)
    resetAsk:Show()
end

local function Tooltip(b)
    if b.fdjKey == "view" and viewMenu and viewMenu:IsShown() then return end -- (its menu is open)
    GameTooltip:SetOwner(b, "ANCHOR_TOP") -- (above the button, M 24 Nov 2026)
    GameTooltip:SetText(L(b.fdjSpec.label), 1, 0.82, 0)
    GameTooltip:AddLine(L(b.fdjSpec.tip), 1, 1, 1, true)
    if b.fdjSpec.extra then GameTooltip:AddLine(L(b.fdjSpec.extra), 0.6, 0.6, 0.6) end
    GameTooltip:Show()
end

local function Build(frame)
    local home = frame.homePanel
    bar = CreateFrame("Frame", nil, home)
    bar:SetSize(10, 28)
    bar:SetFrameLevel(home:GetFrameLevel() + 6)
    buttons = {}
    for i, spec in ipairs(TOOLS) do
        local b = CreateFrame("Button", nil, home, "BackdropTemplate")
        b.fdjKey, b.fdjSpec = spec.key, spec
        b:SetHeight(28)
        b:SetFrameLevel(home:GetFrameLevel() + 6)
        b:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 4, right = 4, top = 4, bottom = 4 },
        })
        b:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
        b.text = b:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
        b.text:SetPoint("LEFT", 6, 0)
        b.text:SetPoint("RIGHT", spec.caret and -18 or -6, 0)
        b.text:SetJustifyH("CENTER")
        if b.text.SetWordWrap then b.text:SetWordWrap(false) end
        if spec.caret then
            -- the small down arrow of the language box: it opens a list
            b.caret = b:CreateTexture(nil, "OVERLAY")
            b.caret:SetTexture("Interface\\Buttons\\Arrow-Down-Up")
            b.caret:SetSize(12, 12)
            b.caret:SetPoint("RIGHT", b, "RIGHT", -7, -3)
        end
        b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        b:SetScript("OnClick", function(self, mouse)
            if self.fdjKey == "reorder" and mouse == "RightButton" then ShowResetMenu(self) return end
            if mouse == "RightButton" then return end
            Sound()
            GameTooltip:Hide()
            if self.fdjKey == "view" then
                if viewMenu and viewMenu:IsShown() then viewMenu:Hide() else ShowViewMenu(self) end
                return
            elseif self.fdjKey == "reset" then
                AskReset()
                return
            elseif FDJ.homeEditTool ~= self.fdjKey then
                picked, pickedLabel = nil, nil
                FDJ.homeEditTool = self.fdjKey
                Refresh()
            end
            if self:IsMouseOver() then Tooltip(self) end
        end)
        b:SetScript("OnEnter", Tooltip)
        b:SetScript("OnLeave", function() GameTooltip:Hide() end)
        b:Hide()
        buttons[i] = b
    end
    -- A tab opened in its place (Tier Sets...) hides the Edit Mode button:
    -- Edit Mode ends with it.
    bar:SetScript("OnUpdate", function(self, elapsed)
        self.fdjT = (self.fdjT or 0) + elapsed
        if self.fdjT < 0.25 then return end
        self.fdjT = 0
        local f = Journal()
        if EditOn() and f and f.currentView == "home" and not (f.hideDungeonsButton and f.hideDungeonsButton:IsShown()) then
            FDJ.SetHomeEditMode(false)
        end
    end)
    bar:Hide()
end

-- --------------------------- the icons and the Character Logs portrait
local away = {}   -- what Edit Mode hides -> was it shown
local hooked = {}
local function Hook(obj)
    if hooked[obj] then return end
    hooked[obj] = true
    local function Again(self)
        local f = Journal()
        if away[self] ~= nil and EditOn() and f and f.currentView == "home" then self:Hide() end
    end
    hooksecurefunc(obj, "Show", Again)
    hooksecurefunc(obj, "SetShown", function(self, shown) if shown then Again(self) end end)
end
local function PutAway(obj)
    if not obj then return end
    Hook(obj)
    if away[obj] == nil then away[obj] = obj:IsShown() and true or false end
    obj:Hide()
end

local function Icons(f)
    return { f.foreverFilterButton, f.foreverRaidButton, f.sleepingBagButton, f.onyxiaButton, f.tierButton, f.pvpButton }
end

-- Done (or the journal closing): everything back as it was; the home
-- page's next refresh places it all again anyway.
function FDJ.HomeEditLeft()
    picked, pickedLabel = nil, nil
    if drag then StopDrag(false) end
    if resetMenu then resetMenu:Hide() end
    if viewMenu then viewMenu:Hide() end
    if resetAsk then resetAsk:Hide() end
    if bar then bar:Hide() end
    if buttons then for _, b in ipairs(buttons) do b:Hide() end end
    local list = away
    away = {}
    for obj, was in pairs(list) do
        if was then obj:Show() end
    end
    local f = Journal()
    if f and f.runLogButton and FDJ.IsRunLogButtonHidden then f.runLogButton:SetShown(not FDJ.IsRunLogButtonHidden()) end
end

local function LeftEdge(f)
    local hl = f.homePanel:GetLeft()
    if not hl then return nil end
    local edge
    for _, b in ipairs({ f.rpgModeButton, f.favouritesButton, f.lootFilterButton, f.hideDungeonsButton }) do
        if b and b:IsShown() and b:GetLeft() then
            local x = b:GetLeft() - hl
            if not edge or x < edge then edge = x end
        end
    end
    return edge
end

-- The buttons in a row at the top left, where the icons were, level with
-- the header's buttons. When the row would run into the buttons on the
-- right (RPG Mode, long words), the RPG Mode button makes way too, and
-- then the buttons get the smaller font.
local LEFT, GAP = 22, 8
local function Widths(small)
    local total, w = 0, {}
    for i, b in ipairs(buttons) do
        SetFont(b.text, small and "ForeverDJ_GameFontHighlightSmall" or "ForeverDJ_GameFontHighlight")
        b.text:SetText(L(b.fdjSpec.label))
        local tw = (b.text:GetStringWidth() or 80) + (b.fdjSpec.caret and 14 or 0)
        local low = b.fdjSpec.red and 70 or (small and 80 or 90)
        w[i] = math.max(low, math.min(200, math.ceil(tw + (small and 20 or 26))))
        total = total + w[i]
    end
    return w, total + GAP * (#buttons - 1)
end

local function Layout(f)
    local home = f.homePanel
    local w, total = Widths(false)
    local room = LeftEdge(f)
    if room and LEFT + total > room - 12 and f.rpgModeButton and f.rpgModeButton:IsShown() then
        PutAway(f.rpgModeButton)
        room = LeftEdge(f)
    end
    if room and LEFT + total > room - 12 then
        w, total = Widths(true)
        if LEFT + total > room - 12 then
            -- (a very narrow window: they share what is left)
            local each = math.floor(((room - 12 - LEFT) - GAP * (#buttons - 1)) / #buttons)
            for i = 1, #w do w[i] = math.max(50, each) end
        end
    end
    -- level with the Edit Mode button (the header row)
    local y = -27
    local edit = f.hideDungeonsButton
    local _, ey = edit:GetCenter()
    local top = home:GetTop()
    if ey and top then y = math.floor(ey - top + 0.5) end
    local x = LEFT
    for i, b in ipairs(buttons) do
        b:SetWidth(w[i])
        b:ClearAllPoints()
        b:SetPoint("LEFT", home, "TOPLEFT", x, y)
        x = x + w[i] + GAP
        Paint(b)
        b:Show()
    end
end

-- tickline (M 24 Nov 2026: "the checkmark is not aligned in list mode ... they
-- should be clean under the same line"): in List the quest counts all get
-- the width of the widest, right-aligned, so the green ticks in front of
-- them sit in one column.
local function AlignListCounts()
    local list = FDJ.HomeViewMode() == "list"
    local cards, widest = Cards(), 0
    for _, card in ipairs(cards) do
        if card.counts then
            if list then
                card.counts:SetWidth(0)
                widest = math.max(widest, card.counts:GetStringWidth() or 0)
            elseif card.fdjCountsAligned then
                card.fdjCountsAligned = nil
                card.counts:SetWidth(0)
            end
        end
    end
    if not list then return end
    for _, card in ipairs(cards) do
        if card.counts then
            card.counts:SetJustifyH("RIGHT")
            card.counts:SetWidth(math.ceil(widest) + 2)
            card.fdjCountsAligned = true
        end
    end
end

-- editnote (2.1.5, M 24 Nov 2026: "a popup in our usual popup style that
-- points to the Edit Mode button when someone updates, ofc only 1 time per
-- account and install/update. it should say: You can now change how you view
-- your dungeons"): the resize notes' look (black box, its edge and a golden
-- glow flashing, the red arrow breathing, an OK), right of the Edit Mode
-- button, the arrow pointing left at it (standing still: notestill), the
-- button's border flashing with it, the text on two
-- lines (M 24 Nov 2026: "the popup needs to point while being to the right
-- of the edit mode, so pointing left to it. and it needs to be 2 lines, one
-- line like this is too long"). The first time the dungeon
-- list is seen after installing or updating, once per account
-- (ForeverDungeonJournalDB.editModeNoteSeen); it goes with OK, with a click
-- on Edit Mode, or when the journal closes.
local note
local function NoteSeen()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    ForeverDungeonJournalDB.editModeNoteSeen = true
end
local function HideNote()
    if note and note:IsShown() then note:Hide() end
end
-- exportlater (2.1.5): the export note waits while this one is up (Systems/RunLogUI.lua)
function FDJ.EditModeNoteUp() return note ~= nil and note:IsShown() end
local function ShowNote(f)
    local edit = f.hideDungeonsButton
    if not note then
        note = CreateFrame("Frame", nil, f.homePanel, "BackdropTemplate")
        note:EnableMouse(true)
        note:SetClampedToScreen(true)
        note:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
        note:SetBackdropColor(0, 0, 0, 1)
        note:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
        note.arrow = note:CreateTexture(nil, "OVERLAY")
        note.arrow:SetTexture("Interface\\AddOns\\ForeverDungeonJournal\\Media\\QuestPrevArrow") -- (pointing left)
        note.arrow:SetSize(20, 20)
        note.arrow:SetPoint("LEFT", 6, 0)
        note.text = note:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
        note.text:SetTextColor(1, 1, 1)
        note.text:SetShadowColor(0, 0, 0, 1)
        note.text:SetShadowOffset(1, -1)
        note.text:SetPoint("LEFT", 30, 0) -- [arrow] text [OK]
        note.text:SetJustifyH("LEFT")
        if note.text.SetWordWrap then note.text:SetWordWrap(true) end
        note.ok = CreateFrame("Button", nil, note, "UIPanelButtonTemplate")
        if FDJ.OwnFonts then FDJ.OwnFonts(note.ok) end
        note.ok:SetSize(40, 18)
        note.ok:SetNormalFontObject("ForeverDJ_GameFontNormalSmall")
        note.ok:SetHighlightFontObject("ForeverDJ_GameFontHighlightSmall")
        note.ok:SetText(OKAY or "OK")
        note.ok:SetPoint("LEFT", note.text, "RIGHT", 8, 0)
        note.ok:SetScript("OnClick", function() Sound() note:Hide() end)
        note.glow = note:CreateTexture(nil, "BACKGROUND", nil, -8)
        note.glow:SetTexture("Interface\\AddOns\\ForeverDungeonJournal\\Media\\TickGlow")
        note.glow:SetBlendMode("ADD")
        note.glow:SetVertexColor(1, 0.78, 0.2)
        note.glow:SetPoint("TOPLEFT", -16, 14)
        note.glow:SetPoint("BOTTOMRIGHT", 16, -14)
        note:SetScript("OnUpdate", function(self, elapsed)
            local j = Journal()
            local btn = j and j.hideDungeonsButton
            -- (Edit Mode on, or another tab in the list's place: gone)
            if EditOn() or not (btn and btn:IsVisible()) then self:Hide() return end
            self.t = (self.t or 0) + elapsed
            local t = self.t
            -- notestill (2.1.5, M 24 Nov 2026: "Don't make it bouncy, just
            -- make it standing still, and also highlight the edit mode, just
            -- the borders"): it stays where it is put; the Edit Mode
            -- button's border flashes gold with the note's
            local fl = 0.5 + 0.5 * math.sin(t * 6)
            self:SetBackdropBorderColor(0.6 + 0.4 * fl, 0.6 + 0.22 * fl, 0.6 - 0.6 * fl, 1)
            self.glow:SetAlpha(0.25 + 0.6 * fl)
            self.arrow:SetAlpha(0.55 + 0.45 * math.sin(t * 4))
            local k = 0.55 + 0.45 * fl
            btn:SetBackdropBorderColor(0.48 + 0.52 * k, 0.40 + 0.42 * k, 0.27 - 0.17 * k, 1)
        end)
        -- gone: the Edit Mode button's own border again
        note:SetScript("OnHide", function() if FDJ.UpdateEditModeButton then pcall(FDJ.UpdateEditModeButton) end end)
        -- the journal closing ends it (it was seen)
        if f.HookScript then f:HookScript("OnHide", HideNote) end
        if edit.HookScript then edit:HookScript("OnClick", HideNote) end
        note:Hide()
    end
    note:SetFrameLevel((f.homePanel:GetFrameLevel() or 1) + 60)
    -- two lines: the text a little more than half as wide as on one
    note.text:SetWidth(0)
    note.text:SetText(L("EDIT_MODE_NEW"))
    local full = note.text:GetStringWidth() or 280
    local w = math.ceil(full * 0.56)
    note.text:SetWidth(w)
    local h = note.text:GetStringHeight() or 28
    note:SetSize(30 + w + 8 + 40 + 10, math.max(34, math.ceil(h) + 16))
    note.t = 0
    note:ClearAllPoints()
    note:SetPoint("LEFT", edit, "RIGHT", 2, 0)
    note:Show()
    NoteSeen()
end

-- The note again, whenever wanted (the dev command /dj pop): the journal
-- opens on the dungeon list (Edit Mode off) and the note shows.
function FDJ.ShowEditModeNote()
    local f = Journal()
    if not (f and f:IsShown()) and FDJ.ToggleJournal then pcall(FDJ.ToggleJournal) end
    f = Journal()
    if not (f and f.homePanel and f.hideDungeonsButton) then return end
    if EditOn() then FDJ.SetHomeEditMode(false) end
    if FDJ.ActiveHomeTab and FDJ.ActiveHomeTab() ~= "dungeons" and FDJ.ShowDungeonsTab then pcall(FDJ.ShowDungeonsTab) end
    if f.currentView ~= "home" and f.backButton and f.backButton.Click then pcall(f.backButton.Click, f.backButton) end
    if f.hideDungeonsButton:IsVisible() then pcall(ShowNote, f) end
end

-- Core/Journal.lua calls this after every refresh of the home page.
function FDJ.ApplyHomeEditChrome(f)
    f = f or Journal()
    if not (f and f.homePanel and f.hideDungeonsButton) then return end
    pcall(AlignListCounts)
    local edit = f.hideDungeonsButton
    if not edit.fdjEditTip then
        -- Edit Mode's tooltip (Done needs none)
        edit.fdjEditTip = true
        edit:HookScript("OnEnter", function(self)
            if EditOn() then return end
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText(L("EDIT_MODE"), 1, 0.82, 0)
            GameTooltip:AddLine(L("EDIT_MODE_TIP"), 1, 1, 1, true)
            GameTooltip:Show()
        end)
        edit:HookScript("OnLeave", function() GameTooltip:Hide() end)
        edit:HookScript("OnClick", function() GameTooltip:Hide() end)
    end
    local on = EditOn() and f.currentView == "home" and edit:IsShown()
    if not on then
        if bar then bar:Hide() end
        if buttons then for _, b in ipairs(buttons) do b:Hide() end end
        -- editnote: once per account, the first time the list is seen
        if not (ForeverDungeonJournalDB and ForeverDungeonJournalDB.editModeNoteSeen) and f.currentView == "home"
            and edit:IsVisible() and not (note and note:IsShown()) then
            pcall(ShowNote, f)
        end
        return
    end
    HideNote()
    if not bar then Build(f) end
    for _, icon in ipairs(Icons(f)) do PutAway(icon) end
    PutAway(f.favouritesButton)
    PutAway(f.lootFilterButton)
    local hadLog = f.runLogButton and f.runLogButton:IsShown()
    PutAway(f.runLogButton)
    -- the RPG Mode button sat left of the portrait: it moves up beside Favourites
    if hadLog and f.rpgModeButton and f.rpgModeButton:IsShown() and FDJ.UpdateRPGHeader then
        pcall(FDJ.UpdateRPGHeader, f)
        for _, icon in ipairs(Icons(f)) do PutAway(icon) end
    end
    bar:Show()
    Layout(f)
    -- (sizes are only known once the frame has been drawn)
    if C_Timer and C_Timer.After and not f.fdjEditRelayout then
        f.fdjEditRelayout = true
        C_Timer.After(0, function()
            f.fdjEditRelayout = nil
            if EditOn() and bar and bar:IsShown() then pcall(Layout, f) end
        end)
    end
end
