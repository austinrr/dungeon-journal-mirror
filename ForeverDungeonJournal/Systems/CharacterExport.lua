
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end





do
    local strings = {
        enUS = {EXPORT_TITLE = "Dungeon Journal - character code", EXPORT_COPY = "Ctrl+A then Ctrl+C, and paste it on the website.", EXPORT_HINT = "%s - %d quests done. Want to view your progress when logged off? Paste this on the website.", EXPORT_ERROR = "Could not build the character code."},
        deDE = {EXPORT_TITLE = "Dungeon Journal - Charaktercode", EXPORT_COPY = "Strg+A, dann Strg+C; auf der Website einfügen.", EXPORT_HINT = "%s - %d Quests erledigt. Willst du deinen Fortschritt auch sehen, wenn du nicht eingeloggt bist? Auf der Website einfügen.", EXPORT_ERROR = "Der Charaktercode konnte nicht erstellt werden."},
        frFR = {EXPORT_TITLE = "Dungeon Journal - code du personnage", EXPORT_COPY = "Ctrl+A puis Ctrl+C, et collez sur le site.", EXPORT_HINT = "%s - %d quêtes terminées. Envie de voir votre progression quand vous n'êtes pas connecté ? Collez ceci sur le site.", EXPORT_ERROR = "Impossible de créer le code du personnage."},
        esES = {EXPORT_TITLE = "Dungeon Journal - código del personaje", EXPORT_COPY = "Ctrl+A y luego Ctrl+C; pégalo en el sitio web.", EXPORT_HINT = "%s - %d misiones completadas. ¿Quieres ver tu progreso cuando no estás conectado? Pégalo en el sitio web.", EXPORT_ERROR = "No se pudo crear el código del personaje."},
        itIT = {EXPORT_TITLE = "Dungeon Journal - codice personaggio", EXPORT_COPY = "Ctrl+A, poi Ctrl+C; incolla sul sito web.", EXPORT_HINT = "%s - %d missioni completate. Vuoi vedere i tuoi progressi quando non sei connesso? Incolla questo sul sito.", EXPORT_ERROR = "Impossibile creare il codice del personaggio."},
        ptBR = {EXPORT_TITLE = "Dungeon Journal - código do personagem", EXPORT_COPY = "Ctrl+A e depois Ctrl+C; cole no site.", EXPORT_HINT = "%s - %d missões concluídas. Quer ver seu progresso quando não estiver conectado? Cole isto no site.", EXPORT_ERROR = "Não foi possível criar o código do personagem."},
        ruRU = {EXPORT_TITLE = "Dungeon Journal - код персонажа", EXPORT_COPY = "Нажмите Ctrl+A, затем Ctrl+C и вставьте код на сайте.", EXPORT_HINT = "%s - выполнено заданий: %d. Хотите видеть свой прогресс, когда вы не в игре? Вставьте код на сайте.", EXPORT_ERROR = "Не удалось создать код персонажа."},
        koKR = {EXPORT_TITLE = "Dungeon Journal - 캐릭터 코드", EXPORT_COPY = "Ctrl+A, Ctrl+C를 누른 후 웹사이트에 붙여넣으세요.", EXPORT_HINT = "%s - 완료한 퀘스트 %d개. 접속하지 않았을 때도 진행 상황을 보고 싶나요? 웹사이트에 붙여넣으세요.", EXPORT_ERROR = "캐릭터 코드를 만들 수 없습니다."},
        zhCN = {EXPORT_TITLE = "Dungeon Journal - 角色代码", EXPORT_COPY = "按 Ctrl+A，再按 Ctrl+C，然后粘贴到网站。", EXPORT_HINT = "%s - 已完成 %d 个任务。想在离线时查看你的进度？请粘贴到网站。", EXPORT_ERROR = "无法生成角色代码。"},
        zhTW = {EXPORT_TITLE = "Dungeon Journal - 角色代碼", EXPORT_COPY = "按 Ctrl+A，再按 Ctrl+C，然後貼到網站。", EXPORT_HINT = "%s - 已完成 %d 個任務。想在離線時查看你的進度？請貼到網站。", EXPORT_ERROR = "無法產生角色代碼。"},
        esMX = {EXPORT_TITLE = "Dungeon Journal - código del personaje", EXPORT_COPY = "Ctrl+A y luego Ctrl+C; pégalo en el sitio web.", EXPORT_HINT = "%s - %d misiones completadas. ¿Quieres ver tu progreso cuando no estás conectado? Pégalo en el sitio web.", EXPORT_ERROR = "No se pudo crear el código del personaje."},
    }
    for locale, values in pairs(strings) do
        if FDJ.Locales and FDJ.Locales[locale] then
            for key, value in pairs(values) do FDJ.Locales[locale][key] = value end
        end
    end
end
local function ExportText(key) return FDJ.L and FDJ.L(key) or key end



FDJ.SITE_CHARACTER_URL = "https://foreverjournal.pro/character"







do
    local strings = {
        enUS = { EXPORT_SITE = "Paste the code here:", RUNLOG_EXPORT = "Export", OPT_EXPORT = "Export to website", OPT_EXPORT_TIP = "Makes a code of this character to copy and paste on the website. You can also type /dj export." },
        deDE = { EXPORT_SITE = "Code hier einfügen:", RUNLOG_EXPORT = "Exportieren", OPT_EXPORT = "Auf die Website exportieren", OPT_EXPORT_TIP = "Erstellt einen Code dieses Charakters zum Kopieren und Einfügen auf der Website. Du kannst auch /dj export eingeben." },
        frFR = { EXPORT_SITE = "Collez le code ici :", RUNLOG_EXPORT = "Exporter", OPT_EXPORT = "Exporter vers le site", OPT_EXPORT_TIP = "Crée un code de ce personnage à copier et coller sur le site. Vous pouvez aussi taper /dj export." },
        esES = { EXPORT_SITE = "Pega el código aquí:", RUNLOG_EXPORT = "Exportar", OPT_EXPORT = "Exportar al sitio web", OPT_EXPORT_TIP = "Crea un código de este personaje para copiarlo y pegarlo en el sitio web. También puedes escribir /dj export." },
        itIT = { EXPORT_SITE = "Incolla il codice qui:", RUNLOG_EXPORT = "Esporta", OPT_EXPORT = "Esporta sul sito", OPT_EXPORT_TIP = "Crea un codice di questo personaggio da copiare e incollare sul sito. Puoi anche digitare /dj export." },
        ptBR = { EXPORT_SITE = "Cole o código aqui:", RUNLOG_EXPORT = "Exportar", OPT_EXPORT = "Exportar para o site", OPT_EXPORT_TIP = "Cria um código deste personagem para copiar e colar no site. Você também pode digitar /dj export." },
        ruRU = { EXPORT_SITE = "Вставьте код здесь:", RUNLOG_EXPORT = "Экспорт", OPT_EXPORT = "Экспорт на сайт", OPT_EXPORT_TIP = "Создаёт код этого персонажа, который нужно скопировать и вставить на сайте. Также можно ввести /dj export." },
        koKR = { EXPORT_SITE = "여기에 코드를 붙여넣으세요:", RUNLOG_EXPORT = "내보내기", OPT_EXPORT = "웹사이트로 내보내기", OPT_EXPORT_TIP = "이 캐릭터의 코드를 만들어 웹사이트에 복사해 붙여넣을 수 있게 합니다. /dj export를 입력해도 됩니다." },
        zhCN = { EXPORT_SITE = "在此粘贴代码：", RUNLOG_EXPORT = "导出", OPT_EXPORT = "导出到网站", OPT_EXPORT_TIP = "生成此角色的代码，复制后粘贴到网站。也可以输入 /dj export。" },
        zhTW = { EXPORT_SITE = "在此貼上代碼：", RUNLOG_EXPORT = "匯出", OPT_EXPORT = "匯出到網站", OPT_EXPORT_TIP = "產生此角色的代碼，複製後貼到網站。也可以輸入 /dj export。" },
    }
    strings.esMX = strings.esES
    for locale, values in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            for key, value in pairs(values) do
                if t[key] == nil then t[key] = value end
            end
        end
    end
end




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



local function Checksum(s)
    local a, b = 1, 0
    for i = 1, #s do
        a = (a + s:byte(i)) % 65521
        b = (b + a) % 65521
    end
    return b * 65536 + a
end


FDJ.BuildExportCode = function()
    local snapshot = FDJ.BuildCharacterSnapshot()
    local body = FDJ.ExportJSON(snapshot)
    local lib = (LibStub and LibStub:GetLibrary("LibDeflate", true)) or _G.FDJLibDeflate
    assert(lib, "LibDeflate unavailable")




    local code = "FDJ3." .. Base64Url(lib:CompressDeflate(body, {level = 5})) .. "." .. Base36(Checksum(body))
    return code, #snapshot.completed, snapshot.name
end



local dialog

local function BuildDialog()
    local f = CreateFrame("Frame", "FDJExportFrame", UIParent, "BackdropTemplate")
    f:SetSize(520, 186)
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

    local title = f:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalLarge")
    title:SetPoint("TOP", 0, -14)
    title:SetText(ExportText("EXPORT_TITLE"))

    f.hint = f:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
    f.hint:SetPoint("TOP", title, "BOTTOM", 0, -6)
    f.hint:SetWidth(470)





    local box = CreateFrame("EditBox", nil, f)
    box:SetMultiLine(false)
    box:SetMaxLetters(0)
    box:SetFontObject("ForeverDJ_GameFontHighlightSmall")
    box:SetPoint("TOPLEFT", 24, -64)
    box:SetPoint("TOPRIGHT", -24, -64)
    box:SetHeight(22)
    box:SetAutoFocus(false)
    box:SetTextInsets(4, 4, 0, 0)
    if box.SetClipsChildren then box:SetClipsChildren(true) end

    box:SetScript("OnMouseUp", function(self) self:HighlightText() end)
    box:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
    box:SetScript("OnEscapePressed", function() f:Hide() end)

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



    local siteLabel = f:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
    siteLabel:SetPoint("TOPLEFT", 24, -104)
    siteLabel:SetText(ExportText("EXPORT_SITE"))
    local site = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    FDJ.OwnFonts(site)
    site:SetSize(250, 22)
    site:SetPoint("LEFT", siteLabel, "RIGHT", 12, 0)
    site:SetAutoFocus(false)
    site:SetText(FDJ.SITE_CHARACTER_URL)
    site:SetCursorPosition(0)
    site:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
    site:SetScript("OnMouseUp", function(self) self:HighlightText() end)
    site:SetScript("OnEditFocusLost", function(self) self:HighlightText(0, 0) end)
    site:SetScript("OnEscapePressed", function() f:Hide() end)
    site:SetScript("OnTextChanged", function(self, byUser)
        if byUser then
            self:SetText(FDJ.SITE_CHARACTER_URL)
            self:HighlightText()
        end
    end)
    f.site = site

    local foot = f:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontDisableSmall")
    foot:SetPoint("BOTTOMLEFT", 18, 20)
    foot:SetText(ExportText("EXPORT_COPY"))

    local close = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    FDJ.OwnFonts(close)
    close:SetSize(80, 22)
    close:SetPoint("BOTTOMRIGHT", -16, 14)
    close:SetText(CLOSE or "Close")
    close:SetScript("OnClick", function() f:Hide() end)

    tinsert(UISpecialFrames, "FDJExportFrame")
    return f
end

FDJ.ShowExportDialog = function()
    local ok, code, questCount, name = pcall(FDJ.BuildExportCode)
    if not ok or type(code) ~= "string" then
        FDJ.ChatLine("|cffd8a83cDungeon Journal:|r " .. ExportText("EXPORT_ERROR"))
        return
    end
    dialog = dialog or BuildDialog()
    dialog.code = code
    dialog.hint:SetText(string.format(ExportText("EXPORT_HINT"),
        name or "?", questCount or 0))
    dialog.box:SetText(code)


    dialog:SetFrameStrata("FULLSCREEN_DIALOG")
    dialog:SetToplevel(true)
    dialog:Show()
    dialog:Raise()
    dialog.box:SetFocus()
    if dialog.box.SetCursorPosition then dialog.box:SetCursorPosition(0) end
    dialog.box:HighlightText()
end



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
