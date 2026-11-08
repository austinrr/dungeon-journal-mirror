-- CharacterExport: "/dj export" builds a short code for the website, so a
-- character's progress can be read there without the addon.
--
-- Quest completion is never saved to disk - the journal asks the game for it
-- every time it draws - so the code carries a snapshot taken at export time.
-- Cleared dungeons come from rpgKills, which is saved per character.
--
-- The code is one base64url token so it survives a paste into a chat box or a
-- URL. Inside it is plain text, which keeps it readable while debugging:
--
--   FDJ2|name|realm|race|class|level|faction|quests|dungeons|time|checksum
--
-- "quests" is the completed journal quest IDs, sorted, each stored as the gap
-- from the one before it in base 36; gaps are far shorter than the IDs. The
-- website keeps its own quest list, so an ID it does not know is ignored and a
-- newer addon never breaks an older site.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

-- FDJ2 added the race. The website still reads FDJ1 codes, which have no
-- race field, so an older export keeps working.
local FORMAT = "FDJ2"

-- ------------------------------------------------------------------ encoding

local B36 = "0123456789abcdefghijklmnopqrstuvwxyz"

local function Base36(n)
    n = math.floor(tonumber(n) or 0)
    local sign = ""
    if n < 0 then
        sign, n = "-", -n
    end
    if n == 0 then return "0" end
    local out = ""
    while n > 0 do
        local d = n % 36
        out = B36:sub(d + 1, d + 1) .. out
        n = math.floor(n / 36)
    end
    return sign .. out
end

local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"

-- base64url, no padding. Arithmetic rather than the bit library, which is not
-- present on every client this addon runs on.
local function Base64Url(s)
    local out, n = {}, #s
    for i = 1, n, 3 do
        local b1 = s:byte(i)
        local b2 = s:byte(i + 1)
        local b3 = s:byte(i + 2)
        local v = b1 * 65536 + (b2 or 0) * 256 + (b3 or 0)
        local c1 = math.floor(v / 262144) % 64
        local c2 = math.floor(v / 4096) % 64
        local c3 = math.floor(v / 64) % 64
        local c4 = v % 64
        out[#out + 1] = B64:sub(c1 + 1, c1 + 1) .. B64:sub(c2 + 1, c2 + 1)
        if b2 then out[#out + 1] = B64:sub(c3 + 1, c3 + 1) end
        if b3 then out[#out + 1] = B64:sub(c4 + 1, c4 + 1) end
    end
    return table.concat(out)
end

-- Adler-32: catches a truncated or mistyped paste. Its running sums stay well
-- inside the range a double holds exactly, so there is no overflow to handle.
local function Checksum(s)
    local a, b = 1, 0
    for i = 1, #s do
        a = (a + s:byte(i)) % 65521
        b = (b + a) % 65521
    end
    return b * 65536 + a
end

-- The website's slug for a dungeon. Must match its slugify(): lower case,
-- apostrophes dropped, every other run of non-alphanumerics becomes one dash.
local function Slug(name)
    local s = tostring(name or ""):lower()
    s = s:gsub("\226\128\153", "")   -- the curly apostrophe, as UTF-8 bytes
    s = s:gsub("'", "")
    s = s:gsub("[^a-z0-9]+", "-")
    s = s:gsub("^%-+", "")
    s = s:gsub("%-+$", "")
    return s
end

-- ------------------------------------------------------------------- payload

-- Every quest the journal lists, deduplicated: a quest can appear under more
-- than one dungeon, and the code should only ever carry it once.
local function JournalQuestIDs()
    local seen, ids = {}, {}
    for _, dungeonName in ipairs(FDJ.ORDER or {}) do
        local dungeon = FDJ.DB and FDJ.DB[dungeonName]
        local quests = type(dungeon) == "table" and dungeon.quests
        if type(quests) == "table" then
            for _, q in ipairs(quests) do
                local id = type(q) == "table" and tonumber(q.id)
                if id and not seen[id] then
                    seen[id] = true
                    ids[#ids + 1] = id
                end
            end
        end
    end
    table.sort(ids)
    return ids
end

local function CompletedQuests()
    local done = {}
    if type(FDJ.IsQuestFinished) ~= "function" then return done end
    for _, id in ipairs(JournalQuestIDs()) do
        local ok, finished = pcall(FDJ.IsQuestFinished, id)
        if ok and finished == true then done[#done + 1] = id end
    end
    return done
end

local function ClearedDungeons()
    local out = {}
    local db = _G.ForeverDungeonJournalCharacterDB
    local kills = type(db) == "table" and db.rpgKills
    if type(kills) ~= "table" then return out end
    for _, dungeonName in ipairs(FDJ.ORDER or {}) do
        if kills[dungeonName] == true then out[#out + 1] = Slug(dungeonName) end
    end
    return out
end

-- Sorted IDs as gaps: the first is itself, each one after it is the step up
-- from the last. Only the first can be negative, so only it can carry a sign.
local function DeltaEncode(ids)
    local out, last = {}, 0
    for i, id in ipairs(ids) do
        out[i] = Base36(id - last)
        last = id
    end
    return table.concat(out, ",")
end

FDJ.BuildExportCode = function()
    local name = UnitName("player") or "?"
    local realm = (GetRealmName and GetRealmName()) or ""
    -- Second return of each is the language-independent token, so a French
    -- client and an English one export the same code.
    local _, race = UnitRace("player")
    local _, class = UnitClass("player")
    local level = UnitLevel("player") or 0
    local faction = (UnitFactionGroup and UnitFactionGroup("player")) or ""

    local quests = CompletedQuests()
    local body = table.concat({
        FORMAT,
        name,
        realm,
        race or "",
        class or "",
        tostring(level),
        faction:sub(1, 1),                      -- "A", "H", or empty
        DeltaEncode(quests),
        table.concat(ClearedDungeons(), ","),
        tostring(time and time() or 0),
    }, "|")

    local code = Base64Url(body .. "|" .. Base36(Checksum(body)))
    return code, #quests, name
end

-- ------------------------------------------------------------------------ UI

local dialog

local function BuildDialog()
    local f = CreateFrame("Frame", "FDJExportFrame", UIParent, "BackdropTemplate")
    f:SetSize(520, 190)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    if f.SetBackdrop then
        f:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
        f:SetBackdropColor(0.02, 0.02, 0.02, 0.95)
        f:SetBackdropBorderColor(0.34, 0.34, 0.34, 1)
    end

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -14)
    title:SetText("Dungeon Journal - character code")

    f.hint = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    f.hint:SetPoint("TOP", title, "BOTTOM", 0, -6)

    -- A read-only looking box the player can select all of and copy.
    local box = CreateFrame("EditBox", nil, f)
    box:SetMultiLine(true)
    box:SetFontObject("GameFontHighlightSmall")
    box:SetPoint("TOPLEFT", 18, -62)
    box:SetPoint("BOTTOMRIGHT", -18, 46)
    box:SetAutoFocus(false)
    box:SetTextInsets(6, 6, 4, 4)
    box:SetScript("OnEscapePressed", function() f:Hide() end)
    -- Typing into it would only corrupt the code, so put it straight back.
    box:SetScript("OnTextChanged", function(self, byUser)
        if byUser then
            self:SetText(f.code or "")
            self:HighlightText()
        end
    end)
    f.box = box

    local bg = CreateFrame("Frame", nil, f, "BackdropTemplate")
    bg:SetPoint("TOPLEFT", box, -6, 6)
    bg:SetPoint("BOTTOMRIGHT", box, 6, -6)
    bg:SetFrameLevel(box:GetFrameLevel() - 1)
    if bg.SetBackdrop then
        bg:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 10,
            insets = { left = 2, right = 2, top = 2, bottom = 2 },
        })
        bg:SetBackdropColor(0, 0, 0, 0.6)
        bg:SetBackdropBorderColor(0.28, 0.28, 0.28, 1)
    end

    local foot = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    foot:SetPoint("BOTTOMLEFT", 18, 20)
    foot:SetText("Ctrl+A then Ctrl+C, and paste it on the website.")

    local close = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    close:SetSize(80, 22)
    close:SetPoint("BOTTOMRIGHT", -16, 14)
    close:SetText(CLOSE or "Close")
    close:SetScript("OnClick", function() f:Hide() end)

    tinsert(UISpecialFrames, "FDJExportFrame")  -- Escape closes it
    return f
end

FDJ.ShowExportDialog = function()
    local ok, code, questCount, name = pcall(FDJ.BuildExportCode)
    if not ok or type(code) ~= "string" then
        print("|cffd8a83cDungeon Journal:|r could not build the character code.")
        return
    end
    dialog = dialog or BuildDialog()
    dialog.code = code
    dialog.hint:SetText(string.format("%s - %d quests done. Paste this on the website.",
        name or "?", questCount or 0))
    dialog.box:SetText(code)
    dialog:Show()
    dialog.box:SetFocus()
    dialog.box:HighlightText()
end

-- /dj export, chained onto the journal's own handler the way the other
-- Systems modules extend it.
local base = SlashCmdList and SlashCmdList.FOREVERDUNGEONJOURNAL
if base then
    SlashCmdList.FOREVERDUNGEONJOURNAL = function(msg, ...)
        local cmd = tostring(msg or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
        if cmd == "export" then
            FDJ.ShowExportDialog()
            return
        end
        return base(msg, ...)
    end
end
