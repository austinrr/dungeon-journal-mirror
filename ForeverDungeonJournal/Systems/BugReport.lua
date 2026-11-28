

local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

FDJ.DISCORD_LINK = "https://discord.gg/Hu3YYaS8vz"

local function L(key, ...)
    if FDJ.L then return FDJ.L(key, ...) end
    return key
end

local BACKDROP = {
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 12,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
}




do
    local strings = {
        enUS = { OPT_HIDE_EXPORT = "Hide Export button on main page", OPT_HIDE_EXPORT_TIP = "Hides the Export button at the top of the journal, left of Report. The Options' Export tab still has your character code." },
        deDE = { OPT_HIDE_EXPORT = "Schaltfläche Exportieren auf der Hauptseite ausblenden", OPT_HIDE_EXPORT_TIP = "Blendet die Schaltfläche Exportieren oben im Journal (links von Melden) aus. Der Reiter Exportieren in den Optionen hat deinen Charaktercode weiterhin." },
        frFR = { OPT_HIDE_EXPORT = "Masquer le bouton Exporter sur la page principale", OPT_HIDE_EXPORT_TIP = "Masque le bouton Exporter en haut du journal, à gauche de Signaler. L'onglet Exporter des options contient toujours le code de votre personnage." },
        esES = { OPT_HIDE_EXPORT = "Ocultar el botón Exportar en la página principal", OPT_HIDE_EXPORT_TIP = "Oculta el botón Exportar en la parte superior del diario, a la izquierda de Informar. La pestaña Exportar de las opciones sigue teniendo el código de tu personaje." },
        itIT = { OPT_HIDE_EXPORT = "Nascondi il pulsante Esporta nella pagina principale", OPT_HIDE_EXPORT_TIP = "Nasconde il pulsante Esporta in alto nel diario, a sinistra di Segnala. La scheda Esporta delle opzioni ha comunque il codice del tuo personaggio." },
        ptBR = { OPT_HIDE_EXPORT = "Ocultar o botão Exportar na página principal", OPT_HIDE_EXPORT_TIP = "Oculta o botão Exportar no topo do diário, à esquerda de Reportar. A aba Exportar das opções continua com o código do seu personagem." },
        ruRU = { OPT_HIDE_EXPORT = "Скрыть кнопку «Экспорт» на главной странице", OPT_HIDE_EXPORT_TIP = "Скрывает кнопку «Экспорт» вверху журнала, слева от «Сообщить». Вкладка «Экспорт» в настройках по-прежнему содержит код вашего персонажа." },
        koKR = { OPT_HIDE_EXPORT = "메인 페이지의 내보내기 버튼 숨기기", OPT_HIDE_EXPORT_TIP = "도감 상단, 제보 왼쪽에 있는 내보내기 버튼을 숨깁니다. 설정의 내보내기 탭에서 캐릭터 코드를 계속 볼 수 있습니다." },
        zhCN = { OPT_HIDE_EXPORT = "隐藏主页面上的导出按钮", OPT_HIDE_EXPORT_TIP = "隐藏手册顶部、报告左侧的导出按钮。选项中的导出标签页仍有你的角色代码。" },
        zhTW = { OPT_HIDE_EXPORT = "隱藏主頁面上的匯出按鈕", OPT_HIDE_EXPORT_TIP = "隱藏手冊頂部、回報左側的匯出按鈕。選項中的匯出分頁仍有你的角色代碼。" },
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

function FDJ.IsExportButtonHidden()
    return type(ForeverDungeonJournalDB) == "table" and ForeverDungeonJournalDB.hideExportButton == true or false
end




local function PlaceTitleButtons(frame)
    if not frame then return end
    local cog, export, report = frame.optionsCogButton, frame.exportButton, frame.bugReportButton
    if cog and report then
        cog:ClearAllPoints()
        cog:SetPoint("RIGHT", (export and export:IsShown()) and export or report, "LEFT", -8, 0)
    end
    local title = frame.mainTitle
    local leftmost = cog or (export and export:IsShown() and export) or report
    if not (title and leftmost) then return end
    title:ClearAllPoints()
    title:SetPoint("TOP", 0, -18)
    local fl, ll, fw = frame:GetLeft(), leftmost:GetLeft(), frame:GetWidth()
    if not (fl and ll and fw) then return end
    local titleRight = fw / 2 + (title:GetStringWidth() or 0) / 2
    local room = (ll - fl) - titleRight - 12
    if room < 0 then
        title:ClearAllPoints()
        title:SetPoint("TOP", room, -18)
    end
end
FDJ.PlaceTitleButtons = PlaceTitleButtons

function FDJ.SetExportButtonHidden(hidden)
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    ForeverDungeonJournalDB.hideExportButton = hidden and true or nil
    local frame = _G.ForeverDungeonJournalFrame
    if frame and frame.exportButton then
        frame.exportButton:SetShown(not hidden)
        PlaceTitleButtons(frame)
    end
end







local function RelocalizeButton(frame)
    if not frame or not frame.bugReportButtonText then return end
    frame.bugReportButtonText:SetText(L("BUG_REPORT_SHORT"))
    local width = math.max(60, math.ceil((frame.bugReportButtonText:GetStringWidth() or 40) + 36))
    if frame.exportButtonText then
        frame.exportButtonText:SetText(L("RUNLOG_EXPORT"))
        width = math.max(width, math.ceil((frame.exportButtonText:GetStringWidth() or 40) + 36))
        if frame.exportButton:GetWidth() ~= width then frame.exportButton:SetWidth(width) end
    end
    if frame.bugReportButton:GetWidth() ~= width then frame.bugReportButton:SetWidth(width) end
    PlaceTitleButtons(frame)
end


local function RelocalizeWindow(frame)
    if not frame then return end
    local w = frame.bugReportWindow
    if w then
        w.title:SetText(L("BUG_REPORT"))
        w.body:SetText(L("BUG_REPORT_TEXT"))
        w.discordLabel:SetText("Discord:")
        w.link:SetText(FDJ.DISCORD_LINK)
        w.close:SetText(L("LF_OK"))
        w:SetHeight(math.max(190, (w.body:GetStringHeight() or 40) + 150))
    end
end

local function Relocalize(frame)
    RelocalizeButton(frame)
    RelocalizeWindow(frame)
end

local function BuildWindow(frame)
    local w = CreateFrame("Frame", nil, frame, "BackdropTemplate")
    frame.bugReportWindow = w
    w:SetSize(400, 200)
    w:SetPoint("CENTER", frame, "CENTER", 0, 20)
    w:SetFrameStrata("TOOLTIP")
    w:SetFrameLevel(200)
    w:SetBackdrop(BACKDROP)
    w:SetBackdropColor(0.07, 0.065, 0.06, 1)
    w:SetBackdropBorderColor(0.48, 0.40, 0.27, 1)
    w:EnableMouse(true)

    w.title = w:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalLarge")
    w.title:SetPoint("TOP", 0, -16)
    w.title:SetTextColor(1.00, 0.82, 0.27)

    w.body = w:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
    w.body:SetPoint("TOPLEFT", 22, -48)
    w.body:SetPoint("TOPRIGHT", -22, -48)
    w.body:SetJustifyH("CENTER")
    w.body:SetSpacing(3)

    w.discordLabel = w:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
    w.discordLabel:SetPoint("TOP", w.body, "BOTTOM", 0, -14)


    local link = CreateFrame("EditBox", nil, w, "InputBoxTemplate")
    w.link = link
    link:SetSize(300, 22)
    link:SetPoint("TOP", w.discordLabel, "BOTTOM", 0, -6)
    link:SetAutoFocus(false)
    link:SetJustifyH("CENTER")
    link:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    link:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
    link:SetScript("OnTextChanged", function(self, user)
        if user then self:SetText(FDJ.DISCORD_LINK); self:HighlightText() end
    end)

    w.close = CreateFrame("Button", nil, w, "UIPanelButtonTemplate")
    FDJ.OwnFonts(w.close)
    w.close:SetSize(110, 24)
    w.close:SetPoint("BOTTOM", 0, 14)
    w.close:SetScript("OnClick", function() w:Hide() end)
    w:Hide()
    return w
end

function FDJ.ToggleBugReportWindow(frame)
    local w = frame.bugReportWindow or BuildWindow(frame)
    if w:IsShown() then w:Hide() return end
    RelocalizeWindow(frame)
    w:Show()
end

function FDJ.CreateBugReportButton(frame, home, anchorButton)
    if not anchorButton then return end
    local button = CreateFrame("Button", nil, home, "BackdropTemplate")
    frame.bugReportButton = button

    button:SetSize(80, 24)
    button:SetPoint("RIGHT", anchorButton, "LEFT", -6, 0)
    button:SetBackdrop(BACKDROP)
    button:SetBackdropColor(0.12, 0.115, 0.105, 0.98)
    button:SetBackdropBorderColor(0.48, 0.40, 0.27, 1)
    local icon = button:CreateTexture(nil, "ARTWORK")


    icon:SetTexture("Interface\\HelpFrame\\HelpIcon-Bug")
    icon:SetSize(26, 26)
    icon:SetPoint("LEFT", button, "LEFT", 1, 0)
    local label = button:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
    frame.bugReportButtonText = label
    label:SetPoint("LEFT", icon, "RIGHT", 0, 0)
    label:SetTextColor(1.00, 0.82, 0.27)
    if not icon:GetTexture() then
        icon:SetTexture("Interface\\Icons\\Spell_Nature_InsectSwarm")
        icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    end
    icon:SetAlpha(0.85)
    button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    button:SetScript("OnEnter", function(self)
        icon:SetAlpha(1)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:SetText(L("BUG_REPORT"), 1, 0.82, 0.27)
        GameTooltip:AddLine(L("BUG_REPORT_TEXT"), 1, 1, 1, true)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        icon:SetAlpha(0.85)
        GameTooltip:Hide()
    end)
    button:SetScript("OnClick", function()
        if PlaySound and SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON then pcall(PlaySound, SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
        FDJ.ToggleBugReportWindow(frame)
    end)

    if FDJ.CreateExportButton then FDJ.CreateExportButton(frame, home, button) end
    Relocalize(frame)



    button:SetScript("OnShow", function() RelocalizeButton(frame) end)
end










function FDJ.CreateExportButton(frame, home, anchorButton)
    if not anchorButton or frame.exportButton then return end
    local button = CreateFrame("Button", nil, home, "BackdropTemplate")
    frame.exportButton = button
    button:SetSize(80, 24)
    button:SetPoint("RIGHT", anchorButton, "LEFT", -6, 0)
    button:SetBackdrop(BACKDROP)
    button:SetBackdropColor(0.12, 0.115, 0.105, 0.98)
    button:SetBackdropBorderColor(0.48, 0.40, 0.27, 1)
    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:SetSize(24, 24)
    icon:SetPoint("LEFT", button, "LEFT", 3, 0)
    icon:SetTexture("Interface\\AddOns\\ForeverDungeonJournal\\Media\\QuestNextArrow")
    icon:SetVertexColor(1, 0.12, 0.08)
    icon:SetAlpha(0.85)
    local label = button:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
    frame.exportButtonText = label
    label:SetPoint("LEFT", button, "LEFT", 27, 0)
    label:SetTextColor(1.00, 0.82, 0.27)
    label:SetText(L("RUNLOG_EXPORT"))
    button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    button:SetScript("OnEnter", function(self)
        icon:SetAlpha(1)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:SetText(L("OPT_EXPORT"), 1, 0.82, 0.27)
        GameTooltip:AddLine(L("OPT_EXPORT_TIP"), 1, 1, 1, true)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        icon:SetAlpha(0.85)
        GameTooltip:Hide()
    end)
    button:SetScript("OnClick", function()
        if PlaySound and SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON then pcall(PlaySound, SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
        GameTooltip:Hide()
        if FDJ.OpenExportTab then FDJ.OpenExportTab()
        elseif FDJ.ShowExportDialog then FDJ.ShowExportDialog() end
    end)
    button:SetShown(not FDJ.IsExportButtonHidden())
    if FDJ.AttachExportHint then FDJ.AttachExportHint(button, frame) end
end





function FDJ.CreateOptionsCogButton(frame, home, anchorButton)
    if not anchorButton or frame.optionsCogButton then return end
    local button = CreateFrame("Button", nil, home)
    frame.optionsCogButton = button
    button:SetSize(16, 16)
    button:SetPoint("RIGHT", anchorButton, "LEFT", -8, 0)
    PlaceTitleButtons(frame)
    button:RegisterForClicks("LeftButtonUp")
    local icon = button:CreateTexture(nil, "ARTWORK")
    button.Icon = icon
    icon:SetAllPoints()
    local ok = icon.SetAtlas and pcall(icon.SetAtlas, icon, "OptionsIcon-Brown", false)
    if not ok or not icon:GetTexture() and not (icon.GetAtlas and icon:GetAtlas()) then
        icon:SetTexture("Interface\\Buttons\\UI-OptionsButton")
    end
    icon:SetAlpha(0.8)
    button:SetScript("OnEnter", function(self)
        icon:SetAlpha(1)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:SetText(L("OPT_TAB_OPTIONS"), 1, 0.82, 0.27)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        icon:SetAlpha(0.8)
        GameTooltip:Hide()
    end)
    button:SetScript("OnMouseDown", function()
        icon:ClearAllPoints()
        icon:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -1)
        icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 1, -1)
    end)
    button:SetScript("OnMouseUp", function()
        icon:ClearAllPoints()
        icon:SetAllPoints()
    end)
    button:SetScript("OnClick", function()
        if PlaySound and SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON then pcall(PlaySound, SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) end
        if FDJ.ToggleSettingsPanel then
            FDJ.ToggleSettingsPanel()
        elseif SlashCmdList and SlashCmdList.FOREVERDUNGEONJOURNAL then
            SlashCmdList.FOREVERDUNGEONJOURNAL("options")
        end
    end)
end


local previous = FDJ.RelocalizeLootFilter
function FDJ.RelocalizeLootFilter(frame)
    if previous then previous(frame) end
    Relocalize(frame)
end
