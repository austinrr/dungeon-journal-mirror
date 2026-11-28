local ADDON_NAME, FDJ = ...


if type(FDJ) ~= "table" then
    FDJ = _G.ForeverDungeonJournal_NS or {}
end
_G.ForeverDungeonJournal_NS = FDJ

FDJ.ADDON_NAME = ADDON_NAME



FDJ.OwnFonts = FDJ.OwnFonts or function(object) return object end
FDJ.Constants = FDJ.Constants or {}
FDJ.Constants.ALBA_FAIRMOON_LOCATION = "Alba Fairmoon, Sentinel Hill inn, Westfall"








function FDJ.ChatLine(text)
    local db = _G.ForeverDungeonJournalDB
    if type(db) == "table" and db.hideChatLines then return end
    print(text)
end

ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}



FDJ.bootDB = ForeverDungeonJournalDB



local bindingLocale = GetLocale and GetLocale() or "enUS"
local bindingNames = {
    deDE = "Dungeonjournal öffnen/schließen",
    frFR = "Ouvrir/Fermer le journal des donjons",
    esES = "Abrir/Cerrar el diario de mazmorras",
    esMX = "Abrir/Cerrar el diario de mazmorras",
    itIT = "Apri/Chiudi il diario delle spedizioni",
    ptBR = "Abrir/Fechar o diário de masmorras",
    ruRU = "Открыть/Закрыть журнал подземелий",
    koKR = "던전 도감 열기/닫기",
    zhCN = "打开/关闭地下城手册",
    zhTW = "開啟/關閉地城手冊",
}
BINDING_NAME_FOREVERDUNGEONJOURNAL_TOGGLE = bindingNames[bindingLocale] or "Open/Close Dungeon Journal"







local NOTICE_ID = "dj-command-v1"

local function ShowUpdateNotice(force)
    local db = ForeverDungeonJournalDB
    if type(db) ~= "table" then return end
    db.seenNotices = db.seenNotices or {}
    if db.seenNotices[NOTICE_ID] and not force then return end
    if _G.ForeverDungeonJournalNotice then
        _G.ForeverDungeonJournalNotice:Show()
        return
    end

    local L = FDJ.L or function(key) return key end

    local f = CreateFrame("Frame", "ForeverDungeonJournalNotice", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil)
    f:SetSize(380, 170)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 120)
    f:SetFrameStrata("DIALOG")
    f:SetToplevel(true)
    f:EnableMouse(true)
    f:SetMovable(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    if f.SetBackdrop then
        f:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 },
        })
    end


    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    icon:SetSize(30, 30)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

    local title = f:CreateFontString(nil, "ARTWORK", "ForeverDJ_GameFontNormalLarge")
    title:SetText(L("DUNGEON_JOURNAL"))


    local titleWidth = (title:GetStringWidth() or 150) + 30 + 8
    icon:SetPoint("TOPLEFT", f, "TOP", -titleWidth / 2, -22)
    title:SetPoint("LEFT", icon, "RIGHT", 8, 0)

    local body = f:CreateFontString(nil, "ARTWORK", "ForeverDJ_GameFontHighlight")
    body:SetPoint("TOPLEFT", f, "TOPLEFT", 26, -64)
    body:SetPoint("TOPRIGHT", f, "TOPRIGHT", -26, -64)
    body:SetJustifyH("CENTER")
    body:SetJustifyV("TOP")
    if body.SetWordWrap then body:SetWordWrap(true) end
    body:SetText(L("NOTICE_RESIZE"))

    local ok = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    FDJ.OwnFonts(ok)
    ok:SetSize(110, 24)
    ok:SetPoint("BOTTOM", f, "BOTTOM", 0, 20)
    ok:SetText(OKAY or "OK")
    ok:SetScript("OnClick", function()
        db.seenNotices[NOTICE_ID] = true
        f:Hide()
    end)


    f:SetHeight(64 + (body:GetStringHeight() or 30) + 14 + 24 + 20)

    if PlaySound and SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPEN then
        pcall(PlaySound, SOUNDKIT.IG_MAINMENU_OPEN)
    end
    f:Show()
end

FDJ.ShowUpdateNotice = ShowUpdateNotice

















