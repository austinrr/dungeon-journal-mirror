-- pvpicon (2.0.13, M 18 Nov 2026: "I'm not really that convinced about the
-- extra card on the left of the journal. Let's just add PvP as an extra
-- button ... that's our style, we add buttons. The PvP button appears once
-- the player reaches level 10, because that's when they can start entering
-- battlegrounds. And it will show Warsong Gulch first. And then once you get
-- to level 20, it's gonna show Arathi Basin. And then once you get to level
-- 51, it's gonna add Alterac Valley. And then we're gonna have an option in
-- the panel called PvP that says show every battleground").
-- (pvptab, the first try the same day: a strip of tabs on the journal's left
-- side, PvP under the Dungeon Journal; gone.)
--
-- The home page gets a round icon, crossed swords, right of the Tier Sets
-- icon (of the Onyxia icon, the Sleeping Bag's or the Raids medallion when
-- those are hidden), the same size and soft golden glow; it is a tab like
-- them (lit with the gold ring while its page shows; clicked again: the
-- dungeon list). Its page is the home page's own, in place of the dungeon
-- list: the battlegrounds the character's level can enter, as cards like the
-- dungeons' (the loading screen with the logo cut off, the name, the level
-- range, the team size): Warsong Gulch at 10, Arathi Basin at 20, Darkspear
-- Islands at 30, Alterac Valley at 51. Options > Tabs > Show every
-- battleground shows them all at any level. A card clicked opens its page
-- (pvprewards, Systems/PvPRewards.lua), as does the Honor & Ranks card after
-- them.
-- Below level 10 the icon is hidden (Options > Hide PvP shows ticked;
-- unticking it shows it sooner). Right-click the icon: Hide.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

local WHITE = "Interface\\Buttons\\WHITE8X8"
local EDGE = "Interface\\Tooltips\\UI-Tooltip-Border"
local MASK = "Interface\\CharacterFrame\\TempPortraitAlphaMask"
local GLOW = "Interface\\AddOns\\ForeverDungeonJournal\\Media\\TickGlow"
-- The crossed swords: the game's Battle Master icon (the minimap tracking
-- one) on a dark red disc; the dual-wield ability icon if this client has
-- no such file.
local PVP_ICON = "Interface\\Minimap\\Tracking\\BattleMaster"
local PVP_ICON_FALLBACK = "Interface\\Icons\\Ability_DualWield"
-- pvpsidetab (2.1.6, M 25 Nov 2026, the character window's PvP tab, the
-- gold fist on blue: "i want our pvp tab to use the real in game pvp tab ...
-- thats the alliance one"): the game's own icon for that tab, by faction, as
-- the Forever client sets it (Blizzard_UIPanels_Game/Camelot/CharacterFrame.lua,
-- SetupModeTabs), filling the round button; the swords above if the client
-- has neither.
local PVP_TAB_ICONS = {
    Alliance = "Interface\\ICONS\\INV_SideTab_Honor_Alliance_c60",
    Horde = "Interface\\ICONS\\INV_SideTab_Honor_Horde_c60",
}
local PVP_LEVEL = 10

-- The battlegrounds, by the level they open at (min). Loading screens by file
-- ID (the classic three: LoadScreenWarsongGulch, LoadScreenArathiBasin,
-- LoadScreenPvPBattleground = Alterac Valley; Darkspear Islands: Forever's
-- expansion0/main/loadscreen_darkspearislands), cut like the dungeon cards'
-- (the classic ones lose the logo at the top; the Forever one also loses the
-- dark letterbox bands its picture has at the top and bottom, and the same
-- share of each side so it isn't stretched). Level ranges and team sizes:
-- SOURCES.txt (pvptab).
local BGS = {
    { key = "WSG", min = 10, uiMap = 1460, art = 131883, crop = { 0.02, 0.98, 0.24, 0.82 }, level = "10-60", size = "10v10" },
    -- abfaces (2.1.6, M 25 Nov 2026: "the Arathi Basin loading screen shows
    -- the face of the characters ... push everything a little bit down so
    -- that the faces are seen"): cut higher, up to just under the game's logo
    -- between them (higher, the logo shows)
    -- abnologo (2.1.6, M 25 Nov 2026: "edit the Arathi Basin card and ...
    -- artificially get rid of" the piece of the logo): a little higher still,
    -- the logo's last bit covered with the parchment just under it (patch:
    -- that strip of the same picture, the pattern a little lower, its lower
    -- edge fading out)
    { key = "AB", min = 20, uiMap = 1461, art = 131820, crop = { 0.02, 0.98, 0.19, 0.77 }, level = "20-60", size = "15v15",
        patch = { 0.30, 0.70, 0.247, 0.06, 0.015 } }, -- (u from, u to, v down to, how much lower it is taken from, the fade)
    { key = "DI", min = 30, art = 8423398, crop = { 0.066, 0.934, 0.17, 0.83 }, level = "30-60", size = "15v15" },
    { key = "AV", min = 51, uiMap = 1459, art = 131861, crop = { 0.02, 0.98, 0.24, 0.82 }, level = "51-60", size = "40v40" },
}

-- The game's own names (C_Map) when the journal shows the client's language;
-- else these (the official names). Darkspear Islands: English only for now.
local NAMES = {
    enUS = { WSG = "Warsong Gulch", AB = "Arathi Basin", AV = "Alterac Valley", DI = "Darkspear Islands" },
    deDE = { WSG = "Kriegshymnenschlucht", AB = "Arathibecken", AV = "Alteractal" },
    frFR = { WSG = "Goulet des Chanteguerres", AB = "Bassin Arathi", AV = "Vallée d'Alterac" },
    esES = { WSG = "Garganta Grito de Guerra", AB = "Cuenca de Arathi", AV = "Valle de Alterac" },
    itIT = { WSG = "Forra dei Cantaguerra", AB = "Bacino d'Arathi", AV = "Valle d'Alterac" },
    ptBR = { WSG = "Ravina Brado Guerreiro", AB = "Bacia Arathi", AV = "Vale Alterac" },
    ruRU = { WSG = "Ущелье Песни Войны", AB = "Низина Арати", AV = "Альтеракская долина" },
    koKR = { WSG = "전쟁노래 협곡", AB = "아라시 분지", AV = "알터랙 계곡" },
    zhCN = { WSG = "战歌峡谷", AB = "阿拉希盆地", AV = "奥特兰克山谷" },
    zhTW = { WSG = "戰歌峽谷", AB = "阿拉希盆地", AV = "奧特蘭克山谷" },
}

do
    local strings = {
        enUS = { PVP_TITLE = "PvP", PVP_BATTLEGROUNDS = "Battlegrounds", PVP_ICON_TIP = "The battlegrounds you can enter at your level.",
            PVP_NONE_YET = "No battleground for your level yet: Warsong Gulch opens at level 10.\nOptions > Tabs > Show every battleground shows them all.",
            OPT_HIDE_PVP = "Hide PvP", OPT_HIDE_PVP_TIP = "Hides the PvP icon on the journal's home page. It stays hidden until level 10; untick this to show it sooner. You can also right-click the icon and pick Hide.",
            OPT_PVP = "PvP", OPT_PVP_SHOW_ALL = "Show every battleground", OPT_PVP_SHOW_ALL_TIP = "The PvP page shows every battleground, not only the ones your level can enter." },
        deDE = { PVP_TITLE = "PvP", PVP_BATTLEGROUNDS = "Schlachtfelder", PVP_ICON_TIP = "Die Schlachtfelder, die du auf deiner Stufe betreten kannst.",
            PVP_NONE_YET = "Noch kein Schlachtfeld für deine Stufe: die Kriegshymnenschlucht öffnet ab Stufe 10.\nOptionen > Reiter > Alle Schlachtfelder zeigen zeigt sie alle.",
            OPT_HIDE_PVP = "PvP ausblenden", OPT_HIDE_PVP_TIP = "Blendet das PvP-Symbol auf der Startseite des Journals aus. Bis Stufe 10 bleibt es ausgeblendet; entferne den Haken, um es früher zu zeigen. Geht auch per Rechtsklick auf das Symbol → Ausblenden.",
            OPT_PVP = "PvP", OPT_PVP_SHOW_ALL = "Alle Schlachtfelder zeigen", OPT_PVP_SHOW_ALL_TIP = "Die PvP-Seite zeigt alle Schlachtfelder, nicht nur die, die du auf deiner Stufe betreten kannst." },
        frFR = { PVP_TITLE = "JcJ", PVP_BATTLEGROUNDS = "Champs de bataille", PVP_ICON_TIP = "Les champs de bataille accessibles à votre niveau.",
            PVP_NONE_YET = "Aucun champ de bataille pour votre niveau : le Goulet des Chanteguerres ouvre au niveau 10.\nOptions > Onglets > Afficher tous les champs de bataille les affiche tous.",
            OPT_HIDE_PVP = "Masquer JcJ", OPT_HIDE_PVP_TIP = "Masque l'icône JcJ sur la page d'accueil du journal. Elle reste masquée jusqu'au niveau 10 ; décochez pour l'afficher plus tôt. Clic droit sur l'icône → Masquer fonctionne aussi.",
            OPT_PVP = "JcJ", OPT_PVP_SHOW_ALL = "Afficher tous les champs de bataille", OPT_PVP_SHOW_ALL_TIP = "La page JcJ affiche tous les champs de bataille, pas seulement ceux accessibles à votre niveau." },
        esES = { PVP_TITLE = "JcJ", PVP_BATTLEGROUNDS = "Campos de batalla", PVP_ICON_TIP = "Los campos de batalla a los que puedes entrar a tu nivel.",
            PVP_NONE_YET = "Aún no hay campo de batalla para tu nivel: la Garganta Grito de Guerra se abre al nivel 10.\nOpciones > Pestañas > Mostrar todos los campos de batalla los muestra todos.",
            OPT_HIDE_PVP = "Ocultar JcJ", OPT_HIDE_PVP_TIP = "Oculta el icono JcJ en la página de inicio del diario. Sigue oculto hasta el nivel 10; desmárcalo para mostrarlo antes. También puedes hacer clic derecho en el icono y elegir Ocultar.",
            OPT_PVP = "JcJ", OPT_PVP_SHOW_ALL = "Mostrar todos los campos de batalla", OPT_PVP_SHOW_ALL_TIP = "La página JcJ muestra todos los campos de batalla, no solo aquellos a los que puedes entrar a tu nivel." },
        itIT = { PVP_TITLE = "PvP", PVP_BATTLEGROUNDS = "Campi di battaglia", PVP_ICON_TIP = "I campi di battaglia in cui puoi entrare al tuo livello.",
            PVP_NONE_YET = "Ancora nessun campo di battaglia per il tuo livello: la Forra dei Cantaguerra apre al livello 10.\nOpzioni > Schede > Mostra tutti i campi di battaglia li mostra tutti.",
            OPT_HIDE_PVP = "Nascondi PvP", OPT_HIDE_PVP_TIP = "Nasconde l'icona PvP nella pagina iniziale del diario. Resta nascosta fino al livello 10; togli la spunta per mostrarla prima. Puoi anche fare clic destro sull'icona e scegliere Nascondi.",
            OPT_PVP = "PvP", OPT_PVP_SHOW_ALL = "Mostra tutti i campi di battaglia", OPT_PVP_SHOW_ALL_TIP = "La pagina PvP mostra tutti i campi di battaglia, non solo quelli in cui puoi entrare al tuo livello." },
        ptBR = { PVP_TITLE = "JxJ", PVP_BATTLEGROUNDS = "Campos de Batalha", PVP_ICON_TIP = "Os campos de batalha em que você pode entrar no seu nível.",
            PVP_NONE_YET = "Ainda não há campo de batalha para o seu nível: a Ravina Brado Guerreiro abre no nível 10.\nOpções > Abas > Mostrar todos os campos de batalha mostra todos.",
            OPT_HIDE_PVP = "Ocultar JxJ", OPT_HIDE_PVP_TIP = "Oculta o ícone JxJ na página inicial do diário. Fica oculto até o nível 10; desmarque para mostrá-lo antes. Você também pode clicar com o botão direito no ícone e escolher Ocultar.",
            OPT_PVP = "JxJ", OPT_PVP_SHOW_ALL = "Mostrar todos os campos de batalha", OPT_PVP_SHOW_ALL_TIP = "A página JxJ mostra todos os campos de batalha, não só aqueles em que você pode entrar no seu nível." },
        ruRU = { PVP_TITLE = "PvP", PVP_BATTLEGROUNDS = "Поля боя", PVP_ICON_TIP = "Поля боя, доступные на вашем уровне.",
            PVP_NONE_YET = "Для вашего уровня полей боя пока нет: Ущелье Песни Войны открывается с 10-го уровня.\nПараметры > Вкладки > Показать все поля боя показывает их все.",
            OPT_HIDE_PVP = "Скрыть PvP", OPT_HIDE_PVP_TIP = "Скрывает значок PvP на главной странице журнала. До 10-го уровня он скрыт; снимите галочку, чтобы показать его раньше. Также можно щелкнуть по значку правой кнопкой и выбрать «Скрыть».",
            OPT_PVP = "PvP", OPT_PVP_SHOW_ALL = "Показать все поля боя", OPT_PVP_SHOW_ALL_TIP = "Страница PvP показывает все поля боя, а не только доступные на вашем уровне." },
        koKR = { PVP_TITLE = "PvP", PVP_BATTLEGROUNDS = "전장", PVP_ICON_TIP = "현재 레벨에서 입장할 수 있는 전장입니다.",
            PVP_NONE_YET = "아직 레벨에 맞는 전장이 없습니다: 전쟁노래 협곡은 10레벨부터 열립니다.\n옵션 > 탭 > 모든 전장 표시로 모두 볼 수 있습니다.",
            OPT_HIDE_PVP = "PvP 숨기기", OPT_HIDE_PVP_TIP = "도감 첫 페이지의 PvP 아이콘을 숨깁니다. 10레벨까지는 숨겨져 있으며, 체크를 해제하면 더 일찍 표시됩니다. 아이콘을 우클릭하고 숨기기를 선택해도 됩니다.",
            OPT_PVP = "PvP", OPT_PVP_SHOW_ALL = "모든 전장 표시", OPT_PVP_SHOW_ALL_TIP = "PvP 페이지에 현재 레벨에서 입장할 수 있는 전장뿐 아니라 모든 전장을 표시합니다." },
        zhCN = { PVP_TITLE = "PvP", PVP_BATTLEGROUNDS = "战场", PVP_ICON_TIP = "你当前等级可以进入的战场。",
            PVP_NONE_YET = "你的等级暂时没有可进入的战场：战歌峡谷10级开放。\n选项 > 标签页 > 显示所有战场 可显示全部。",
            OPT_HIDE_PVP = "隐藏PvP", OPT_HIDE_PVP_TIP = "隐藏日志首页上的PvP图标。10级之前保持隐藏；取消勾选可提前显示。也可以右键点击图标并选择隐藏。",
            OPT_PVP = "PvP", OPT_PVP_SHOW_ALL = "显示所有战场", OPT_PVP_SHOW_ALL_TIP = "PvP页面显示所有战场，而不只是你当前等级可以进入的战场。" },
        zhTW = { PVP_TITLE = "PvP", PVP_BATTLEGROUNDS = "戰場", PVP_ICON_TIP = "你目前等級可以進入的戰場。",
            PVP_NONE_YET = "你的等級暫時沒有可進入的戰場：戰歌峽谷10級開放。\n選項 > 分頁 > 顯示所有戰場 可顯示全部。",
            OPT_HIDE_PVP = "隱藏PvP", OPT_HIDE_PVP_TIP = "隱藏日誌首頁上的PvP圖示。10級之前保持隱藏；取消勾選可提前顯示。也可以右鍵點擊圖示並選擇隱藏。",
            OPT_PVP = "PvP", OPT_PVP_SHOW_ALL = "顯示所有戰場", OPT_PVP_SHOW_ALL_TIP = "PvP頁面顯示所有戰場，而不只是你目前等級可以進入的戰場。" },
    }
    strings.esMX = strings.esES
    for locale, entries in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            for key, value in pairs(entries) do
                if t[key] == nil then t[key] = value end
            end
        end
    end
end

local function L(key, ...)
    if FDJ.L then return FDJ.L(key, ...) end
    return key
end
local function ClientText()
    return not FDJ.CanUseClientLocalizedText or FDJ.CanUseClientLocalizedText()
end
local function Num(v, default)
    v = tonumber(v)
    if not v or v <= 0 then return default end
    return v
end
local function Plain(v)
    if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
    return v
end

local function BGName(bg)
    if bg.uiMap and ClientText() and C_Map and C_Map.GetMapInfo then
        local ok, info = pcall(C_Map.GetMapInfo, bg.uiMap)
        if ok and type(info) == "table" and type(info.name) == "string" and info.name ~= "" then return info.name end
    end
    local lang = FDJ.GetLanguage and FDJ.GetLanguage() or "enUS"
    if lang == "esMX" then lang = "esES" end
    local t = NAMES[lang] or NAMES.enUS
    return t[bg.key] or NAMES.enUS[bg.key]
end

local function Journal() return _G.ForeverDungeonJournalFrame end

local levelNow -- PLAYER_LEVEL_UP's new level (UnitLevel can still say the old one)
local function Level()
    if levelNow then return levelNow end
    if type(UnitLevel) ~= "function" then return 0 end
    local ok, v = pcall(UnitLevel, "player")
    return ok and tonumber(Plain(v)) or 0
end

function FDJ.IsPvPShowAll()
    return ForeverDungeonJournalDB and ForeverDungeonJournalDB.pvpShowAll == true or false
end

-- ------------------------------------------------------------------ the page
local panel, cards = nil, {}
local HONOR_CARD = { key = "HONOR" } -- pvprewards (2.1.6): the Honor & Ranks card

-- pvprewards: the battleground's name by its key, for its page
function FDJ.PvPBattlegroundName(key)
    for _, bg in ipairs(BGS) do
        if bg.key == key then return BGName(bg) end
    end
    return key
end
-- pvpsearch (2.1.6): a battleground's English name, its card's picture and
-- how it is cut, for the search bar's results (Systems/PvPRewards.lua)
function FDJ.PvPBattlegroundInfo(key)
    for _, bg in ipairs(BGS) do
        if bg.key == key then return NAMES.enUS[bg.key], bg.art, bg.crop end
    end
    return nil
end
function FDJ.PvPBattlegroundKeys()
    local out = {}
    for _, bg in ipairs(BGS) do out[#out + 1] = bg.key end
    return out
end

local function MakeCard(parent)
    local c = CreateFrame("Button", nil, parent, "BackdropTemplate")
    c:SetSize(352, 126)
    c:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 } })
    c:SetBackdropColor(0.02, 0.02, 0.02, 0.45)
    c:SetBackdropBorderColor(0.34, 0.34, 0.34, 1)
    c.art = c:CreateTexture(nil, "ARTWORK", nil, 1)
    c.art:SetPoint("TOPLEFT", 4, -4)
    c.art:SetPoint("BOTTOMRIGHT", -4, 4)
    -- (abnologo: the patch over the picture at 2, under the dark band)
    c.patch = c:CreateTexture(nil, "ARTWORK", nil, 2)
    c.patch:Hide()
    c.patchFade = c:CreateTexture(nil, "ARTWORK", nil, 2)
    c.patchFade:Hide()
    c.topShade = c:CreateTexture(nil, "ARTWORK", nil, 3)
    c.topShade:SetPoint("TOPLEFT", 4, -4)
    c.topShade:SetPoint("TOPRIGHT", -4, -4)
    c.topShade:SetHeight(42)
    c.topShade:SetColorTexture(0, 0, 0, 0.42)
    c.fullShade = c:CreateTexture(nil, "ARTWORK", nil, 0)
    c.fullShade:SetPoint("TOPLEFT", 4, -4)
    c.fullShade:SetPoint("BOTTOMRIGHT", -4, 4)
    c.fullShade:SetColorTexture(0.02, 0.02, 0.02, 0.10)
    c.innerGlow = c:CreateTexture(nil, "ARTWORK", nil, 4)
    c.innerGlow:SetPoint("TOPLEFT", 4, -4)
    c.innerGlow:SetPoint("TOPRIGHT", -4, -4)
    c.innerGlow:SetHeight(1)
    c.innerGlow:SetColorTexture(1.0, 0.84, 0.25, 0.30)
    c.highlight = c:CreateTexture(nil, "HIGHLIGHT")
    c.highlight:SetPoint("TOPLEFT", 4, -4)
    c.highlight:SetPoint("BOTTOMRIGHT", -4, 4)
    c.highlight:SetColorTexture(1, 1, 1, 0.08)
    c.title = c:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalLarge")
    c.title:SetPoint("TOPLEFT", 16, -14)
    c.title:SetWidth(220)
    c.title:SetJustifyH("LEFT")
    c.title:SetTextColor(1.00, 0.88, 0.24)
    c.title:SetShadowColor(0, 0, 0, 1)
    c.title:SetShadowOffset(1, -1)
    c.meta = c:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
    c.meta:SetPoint("BOTTOMLEFT", 14, 10)
    c.meta:SetJustifyH("LEFT")
    c.meta:SetTextColor(1.00, 0.95, 0.82)
    c.meta:SetShadowColor(0, 0, 0, 1)
    c.meta:SetShadowOffset(1, -1)
    c.counts = c:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
    c.counts:SetPoint("TOPRIGHT", -14, -11)
    c.counts:SetJustifyH("RIGHT")
    c.counts:SetTextColor(0.97, 0.89, 0.54)
    c.counts:SetShadowColor(0, 0, 0, 1)
    c.counts:SetShadowOffset(1, -1)
    c:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(1.00, 0.76, 0.22, 1)
        self.fullShade:SetColorTexture(1, 0.82, 0.18, 0.08)
    end)
    c:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.34, 0.34, 0.34, 1)
        self.fullShade:SetColorTexture(0.02, 0.02, 0.02, 0.10)
    end)
    -- pvprewards (2.1.6): the card opens its page
    c.emblem = c:CreateTexture(nil, "ARTWORK", nil, 2)
    c.emblem:SetSize(78, 78)
    c.emblem:SetPoint("RIGHT", -22, -6)
    c.emblem:Hide()
    c:SetScript("OnClick", function(self)
        if self.fdjKey and FDJ.OpenPvPRewards then FDJ.OpenPvPRewards(self.fdjKey) end
    end)
    return c
end

-- pvprankcard (2.1.6, M 25 Nov 2026: "Can you somehow fit the official page
-- of the player in the honor and ranks? Like as an image for honor and
-- ranks, we can use what the player has. And that's gonna change always if
-- the player improves or not"): the Honor & Ranks card shows the character's
-- own rank as the Character pane's Player vs. Player tab does (the game's
-- PVPRankFrame, Blizzard_UIPanels_Game/Camelot/PVPRankFrame.lua and .xml):
-- the ring that fills with the Rank Points, the faction's crest (the rank's
-- insignia once ranked) in it, the rank number under it; beside it the
-- season, the rank and the Rank Points, in the game's own words. Its art and
-- data: the game's (C_MajorFactions, the Rank Points faction 2800); kept up
-- to date while the page is open. Without them: the PvP icon as before.
local RANK_FACTION = 2800
local function RankInfo()
    if not (C_MajorFactions and type(C_MajorFactions.GetMajorFactionProgressionInfo) == "function") then return nil end
    local ok, info = pcall(C_MajorFactions.GetMajorFactionProgressionInfo, RANK_FACTION)
    if not ok or type(info) ~= "table" then return nil end
    local level = tonumber(Plain(info.renownLevel))
    if not level then return nil end
    return level, tonumber(Plain(info.renownReputationEarned)) or 0, tonumber(Plain(info.renownLevelThreshold)) or 0
end
local function Global(name) local v = _G[name] return (type(v) == "string" and v ~= "") and v or nil end
-- "Civilian", "Rank 3: Sergeant" (the game's GetPVPRankText)
local function RankText(level)
    if not level or level <= 0 then return Global("PVP_RANK_0_NAME") or "Civilian" end
    local base = Enum and Enum.PvPRanks and tonumber(Enum.PvPRanks.Rank_1)
    local title
    if base and type(GetText) == "function" then
        local okS, sex = pcall(UnitSex, "player")
        local okF, faction = pcall(UnitFactionGroup, "player")
        local key = "PVP_RANK_" .. tostring(base + level - 1) .. "_" .. ((okF and Plain(faction) == "Alliance") and 1 or 0)
        local ok, text = pcall(GetText, key, okS and Plain(sex) or 2)
        if ok and type(text) == "string" and text ~= "" and text ~= key then title = text end
    end
    local both = Global("PVP_RANK_NUMBER_AND_TITLE")
    if title and both then
        local ok, text = pcall(string.format, both, level, title)
        if ok then return text end
    end
    if title then return title end
    local num = Global("PVP_RANK_NUMBER") -- ("Rank 3")
    local ok, text = false, nil
    if num then ok, text = pcall(string.format, num, level) end
    return ok and text or tostring(level)
end
local function SeasonText()
    local season = type(GetCurrentArenaSeason) == "function" and tonumber(Plain(select(2, pcall(GetCurrentArenaSeason)))) or nil
    if not season or season <= 0 then return nil end
    local f = Global("EXPANSION_SEASON_NAME")
    if f then
        local ok, text = pcall(string.format, f, "", season)
        if ok then return (text:gsub("^%s+", "")) end
    end
    return "Season " .. season
end
local function Atlas(tex, name, useSize)
    if not (tex and tex.SetAtlas) then return false end
    local ok, done = pcall(tex.SetAtlas, tex, name, useSize)
    return ok and done ~= false
end
local function BuildRankBadge(c)
    if c.rankBadge then return c.rankBadge end
    -- (as wide as the card's right end; the glow kept inside the card)
    local holder = CreateFrame("Frame", nil, c)
    holder:SetPoint("TOPRIGHT", c, "TOPRIGHT", -6, -5)
    holder:SetPoint("BOTTOMRIGHT", c, "BOTTOMRIGHT", -6, 5)
    holder:SetWidth(150)
    if holder.SetClipsChildren then holder:SetClipsChildren(true) end
    local d = CreateFrame("Cooldown", nil, holder)
    d:SetSize(154, 154)
    -- pvprankband (M 25 Nov 2026: "move the faction crest rank a little bit
    -- below the red line as well"): under the dark top band too (about 12
    -- of the card's pixels down, in the half-size frame's own units)
    d:SetPoint("CENTER", holder, "CENTER", 0, -23)
    d:SetScale(0.52) -- (the game's page at about half its size)
    if d.SetReverse then d:SetReverse(true) end
    if d.SetHideCountdownNumbers then d:SetHideCountdownNumbers(true) end
    if d.SetRotation then pcall(d.SetRotation, d, math.pi) end
    if d.SetDrawEdge then d:SetDrawEdge(false) end
    if d.SetDrawBling then d:SetDrawBling(false) end
    if d.SetSwipeTexture then pcall(d.SetSwipeTexture, d, "Interface\\PVPFrame\\pvpqueue-sidebar-honorbar-fill", 1, 1, 1, 1) end
    d.glow = d:CreateTexture(nil, "BACKGROUND", nil, -1)
    d.glow:SetSize(275, 295)
    d.glow:SetPoint("CENTER")
    Atlas(d.glow, "UI-Character-Info-Honor-Bar-BG-Glow")
    d.bg = d:CreateTexture(nil, "BACKGROUND", nil, 0)
    d.bg:SetSize(115, 115)
    d.bg:SetPoint("CENTER")
    d.bar = d:CreateTexture(nil, "BORDER")
    d.bar:SetSize(235, 209)
    d.bar:SetPoint("CENTER", 0, -1)
    Atlas(d.bar, "UI-Character-Info-Honor-Bar")
    d.badge = d:CreateTexture(nil, "ARTWORK")
    d.badge:SetSize(72, 84)
    d.badge:SetPoint("CENTER")
    -- the rank number in its gold ring, at the bottom
    local n = CreateFrame("Frame", nil, d)
    n:SetSize(36, 36)
    n:SetPoint("BOTTOM", d, "BOTTOM", 0, -1)
    n:SetFrameLevel((d:GetFrameLevel() or 1) + 2)
    n.cover = n:CreateTexture(nil, "BACKGROUND", nil, 1)
    n.cover:SetSize(36, 36)
    n.cover:SetPoint("CENTER")
    n.cover:SetColorTexture(0.1, 0.1, 0.1, 1)
    if n.CreateMaskTexture then
        local mask = n:CreateMaskTexture()
        mask:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        mask:SetSize(36, 36)
        mask:SetPoint("CENTER")
        n.cover:AddMaskTexture(mask)
    end
    n.ring = n:CreateTexture(nil, "BORDER")
    n.ring:SetSize(48, 48)
    n.ring:SetPoint("CENTER")
    Atlas(n.ring, "UI-Character-Info-Honor-RewardRing")
    n.label = n:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    n.label:SetPoint("CENTER")
    n.label:SetJustifyH("CENTER")
    d.number = n
    holder.display = d
    -- the season, the rank and the Rank Points under the card's name
    -- (one under the other, as on the game's page: season, rank, points)
    local function Line(font)
        local fs = c:CreateFontString(nil, "OVERLAY", font)
        fs:SetJustifyH("LEFT")
        fs:SetWordWrap(false)
        fs:SetShadowColor(0, 0, 0, 1)
        fs:SetShadowOffset(1, -1)
        return fs
    end
    c.rankSeason = Line("ForeverDJ_GameFontNormal")
    c.rankName = Line("ForeverDJ_GameFontHighlight")
    c.rankPoints = Line("ForeverDJ_GameFontNormal")
    -- kept up to date while it is shown
    for _, event in ipairs({ "UPDATE_FACTION", "MAJOR_FACTION_RENOWN_LEVEL_CHANGED", "PLAYER_ENTERING_WORLD" }) do
        pcall(holder.RegisterEvent, holder, event)
    end
    holder:SetScript("OnEvent", function(self)
        if self:IsVisible() and c.fdjUpdateRank then pcall(c.fdjUpdateRank) end
    end)
    c.rankBadge = holder
    return holder
end
local function ShowRankParts(c, show)
    for _, part in ipairs({ c.rankBadge, c.rankSeason, c.rankName, c.rankPoints }) do
        if part then part:SetShown(show) end
    end
end
-- the card's rank, now; false when the game gives none
local function UpdateRankCard(c)
    local level, points, need = RankInfo()
    if not level then
        ShowRankParts(c, false)
        return false
    end
    local holder = BuildRankBadge(c)
    local d = holder.display
    local okF, faction = pcall(UnitFactionGroup, "player")
    faction = okF and Plain(faction) or "Alliance"
    local side = (faction == "Horde") and "Horde" or "Alliance"
    Atlas(d.bg, "UI-Character-Info-Honor-Bar-BG-" .. side, true)
    if level <= 0 or not Atlas(d.badge, "UI-Character-Info-Honor-Icon-" .. level, true) then
        Atlas(d.badge, "UI-Character-Info-Honor-Icon-" .. side, true)
    end
    -- the ring filled as far as the Rank Points go towards the next rank
    local pct = 1
    if need > 0 then pct = math.max(0, math.min(1, points / need)) end
    if type(CooldownFrame_SetDisplayAsPercentage) == "function" then
        pcall(CooldownFrame_SetDisplayAsPercentage, d, pct)
    elseif d.Pause and d.SetCooldown and type(GetTime) == "function" then
        pcall(d.Pause, d)
        pcall(d.SetCooldown, d, GetTime() - 100 * pct, 100)
    end
    d.number.label:SetText(level)
    local season = SeasonText()
    local width = math.max(120, math.floor((c:GetWidth() or 352) - 16 - 160))
    -- pvprankband (2.1.6, M 25 Nov 2026: "make it so that the season one
    -- text and below starts from below the black line ... only honor and
    -- ranks should be on the black line"): under the card's dark top band
    c.rankSeason:SetText(season or "")
    c.rankSeason:ClearAllPoints()
    c.rankSeason:SetPoint("TOPLEFT", c.topShade, "BOTTOMLEFT", 12, -6)
    c.rankName:ClearAllPoints()
    if season then
        c.rankName:SetPoint("TOPLEFT", c.rankSeason, "BOTTOMLEFT", 0, -2)
    else
        c.rankName:SetPoint("TOPLEFT", c.topShade, "BOTTOMLEFT", 12, -6)
    end
    c.rankName:SetText(RankText(level))
    c.rankPoints:ClearAllPoints()
    c.rankPoints:SetPoint("TOPLEFT", c.rankName, "BOTTOMLEFT", 0, -2)
    for _, fs in ipairs({ c.rankSeason, c.rankName, c.rankPoints }) do fs:SetWidth(width) end
    local f = Global("PVP_RANK_CURRENT_PROGRESS")
    local ok, text = false, nil
    if f then ok, text = pcall(string.format, f, points, need) end
    c.rankPoints:SetText(ok and text or (points .. " / " .. need))
    ShowRankParts(c, true)
    return true
end

-- The battlegrounds this character's level can enter (all of them with
-- Show every battleground).
local function Shown()
    local all, level, out = FDJ.IsPvPShowAll(), Level(), {}
    for _, bg in ipairs(BGS) do
        if all or level >= bg.min then out[#out + 1] = bg end
    end
    return out
end
-- pvpjump (2.1.6): the keys of the battlegrounds on the cards, in their order
function FDJ.PvPShownKeys()
    local out = {}
    for _, bg in ipairs(Shown()) do out[#out + 1] = bg.key end
    return out
end

local function Layout()
    if not panel then return end
    -- pvpnotitle (2.1.6, M 25 Nov 2026: "get rid of battlegrounds text in
    -- this page ... It's obvious already"): no heading; the cards go up
    panel.title:SetText("")
    panel.title:Hide()
    local list = Shown()
    -- As the home page's cards: two columns, more in a wider window.
    local f = Journal()
    local gap, rowStep = 12, 138
    local homeW = Num(f and f.homePanel and f.homePanel:GetWidth(), 814)
    local cols = math.max(2, math.floor((homeW - 51 + gap) / (383 + gap)))
    local width = Num(panel.cards:GetWidth(), homeW - 33)
    local cardW = math.floor((width - gap * (cols - 1)) / cols)
    -- pvprewards (2.1.6): Honor & Ranks after the battlegrounds
    local shown = {}
    for _, bg in ipairs(list) do shown[#shown + 1] = bg end
    if FDJ.PVP_HONOR then shown[#shown + 1] = HONOR_CARD end
    for i, bg in ipairs(shown) do
        local c = cards[i] or MakeCard(panel.cards)
        cards[i] = c
        local col, row = (i - 1) % cols, math.floor((i - 1) / cols)
        c:SetWidth(cardW)
        c:ClearAllPoints()
        c:SetPoint("TOPLEFT", panel.cards, "TOPLEFT", col * (cardW + gap), -row * rowStep)
        c.fdjKey = bg.key
        c.emblem:Hide()
        ShowRankParts(c, false) -- (pvprankcard: the Honor & Ranks card's only)
        c.fdjUpdateRank = nil
        if bg == HONOR_CARD then
            c.art:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
            c.art:SetTexCoord(0, 1, 0, 1)
            c.art:SetVertexColor(0.42, 0.33, 0.22, 1)
            -- pvprankcard: the character's own rank; without it, the PvP icon
            local okR, ranked = pcall(UpdateRankCard, c)
            if okR and ranked then
                c.fdjUpdateRank = function() UpdateRankCard(c) end
            else
                ShowRankParts(c, false)
                local okF, faction = pcall(UnitFactionGroup, "player")
                if c.emblem:SetTexture(okF and PVP_TAB_ICONS[faction] or PVP_ICON) ~= false then
                    c.emblem:SetTexCoord(0.08, 0.92, 0.08, 0.92)
                    c.emblem:Show()
                end
            end
            c.title:SetText(L("PVP_HONOR_TITLE"))
            c.meta:SetText(L("PVP_HONOR_META"))
            c.counts:SetText("")
        elseif c.art:SetTexture(bg.art) == false then
            c.art:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
            c.art:SetTexCoord(0, 1, 0, 1)
            c.art:SetVertexColor(0.42, 0.36, 0.28, 1)
        else
            c.art:SetTexCoord(bg.crop[1], bg.crop[2], bg.crop[3], bg.crop[4])
            c.art:SetVertexColor(1, 1, 1, 1)
        end
        -- abnologo: the logo's bit covered (the card's picture is 8 narrower and lower)
        local patch = bg ~= HONOR_CARD and bg.patch
        if patch then
            local u0, u1, v1, shift, fade = patch[1], patch[2], patch[3], patch[4], patch[5]
            local crop, artW, artH = bg.crop, cardW - 8, 126 - 8
            local function X(u) return (u - crop[1]) / (crop[2] - crop[1]) * artW end
            local function Yv(v) return (v - crop[3]) / (crop[4] - crop[3]) * artH end
            c.patch:SetTexture(bg.art)
            c.patch:SetTexCoord(u0, u1, crop[3] + shift, v1 + shift)
            c.patch:ClearAllPoints()
            c.patch:SetPoint("TOPLEFT", c.art, "TOPLEFT", X(u0), 0)
            c.patch:SetSize(X(u1) - X(u0), Yv(v1))
            c.patch:Show()
            c.patchFade:SetTexture(bg.art)
            c.patchFade:SetTexCoord(u0, u1, v1 + shift, v1 + fade + shift)
            c.patchFade:ClearAllPoints()
            c.patchFade:SetPoint("TOPLEFT", c.patch, "BOTTOMLEFT", 0, 0)
            c.patchFade:SetSize(X(u1) - X(u0), math.max(1, Yv(v1 + fade) - Yv(v1)))
            -- (its lower edge fades into the picture)
            local faded = false
            if c.patchFade.SetGradient and type(CreateColor) == "function" then
                faded = pcall(c.patchFade.SetGradient, c.patchFade, "VERTICAL", CreateColor(1, 1, 1, 0), CreateColor(1, 1, 1, 1))
            end
            if not faded and c.patchFade.SetGradientAlpha then
                faded = pcall(c.patchFade.SetGradientAlpha, c.patchFade, "VERTICAL", 1, 1, 1, 0, 1, 1, 1, 1)
            end
            c.patchFade:SetShown(faded)
        else
            c.patch:Hide()
            c.patchFade:Hide()
        end
        if bg ~= HONOR_CARD then
            c.title:SetText(BGName(bg))
            c.meta:SetText(FDJ.HomeLevelText and FDJ.HomeLevelText(bg.level) or ("LV " .. bg.level))
            c.counts:SetText(bg.size)
        end
        c:Show()
    end
    for i = #shown + 1, #cards do cards[i]:Hide() end
    panel.empty:SetText(L("PVP_NONE_YET"))
    panel.empty:SetShown(#list == 0)
end

-- The home page's dungeon list (and what goes with it), hidden while the
-- PvP page is shown in its place (as the Tier Sets page does).
FDJ.PvPLayout = function() Layout() end -- pvprewards: the cards again, back from a page

local function HideList(f)
    for _, part in ipairs({ f.homeScroll, f.homeEmptyText, f.homeShowAllButton, f.hideDungeonsButton }) do
        if part then part:Hide() end
    end
    -- tiertop (2.1.6): the top right (Character Logs, Favourites, Loot Filter) goes too, as on the other tabs
    if FDJ.HideHomeTop then pcall(FDJ.HideHomeTop, f) end
end

local function Build(f)
    if panel then return panel end
    local home = f.homePanel
    panel = CreateFrame("Frame", "ForeverDungeonJournalPvPPanel", home)
    panel:SetPoint("TOPLEFT", home, "TOPLEFT", 14, -62)
    panel:SetPoint("BOTTOMRIGHT", home, "BOTTOMRIGHT", -14, 12)
    panel:SetFrameLevel((tonumber(home:GetFrameLevel()) or 1) + 6)
    panel:EnableMouse(true)
    panel.title = panel:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalLarge")
    panel.title:SetPoint("TOPLEFT", 6, -4)
    panel.title:SetTextColor(1.00, 0.82, 0.27)
    -- the cards line up with the dungeon list's
    panel.cards = CreateFrame("Frame", nil, panel)
    panel.cards:SetPoint("TOPLEFT", 4, -6) -- (pvpnotitle)
    panel.cards:SetPoint("BOTTOMRIGHT", -1, 0)
    panel.empty = panel:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightLarge")
    panel.empty:SetPoint("CENTER", 0, 10)
    panel.empty:SetWidth(560)
    panel.empty:SetJustifyH("CENTER")
    panel.empty:SetTextColor(0.75, 0.72, 0.66)
    panel.empty:Hide()
    panel:SetScript("OnSizeChanged", function(self) if self:IsShown() then Layout() end end)
    panel:SetScript("OnShow", function()
        HideList(f)
        if FDJ.PaintHomeTabs then pcall(FDJ.PaintHomeTabs) end
    end)
    -- Back to the dungeon list: the list as it was.
    panel:SetScript("OnHide", function()
        if f.homeScroll then f.homeScroll:Show() end
        if f.hideDungeonsButton then f.hideDungeonsButton:Show() end
        if FDJ.ShowHomeTop then pcall(FDJ.ShowHomeTop, f) end -- (tiertop)
        if home:IsShown() and FDJ.RefreshHomeCards then pcall(FDJ.RefreshHomeCards) end
        if FDJ.PaintHomeTabs then pcall(FDJ.PaintHomeTabs) end
    end)
    -- Leaving the home page (a dungeon page, a search...) closes it.
    home:HookScript("OnHide", function() panel:Hide() end)
    panel:Hide()
    return panel
end

function FDJ.IsPvPPageShown()
    local f = Journal()
    return panel ~= nil and panel:IsShown() and f ~= nil and f.currentView == "home"
end

function FDJ.HidePvPPage()
    if panel and panel:IsShown() then panel:Hide() end
end

local function ClickBack(f)
    if f and f.currentView ~= "home" and f.backButton then
        local back = f.backButton:GetScript("OnClick")
        if back then pcall(back, f.backButton) end
    end
end

function FDJ.OpenPvPPage()
    local f = Journal()
    if FDJ.ToggleJournal and not (f and f:IsShown()) then pcall(FDJ.ToggleJournal) end
    f = Journal()
    if not (f and f.homePanel) then return end
    ClickBack(f)
    Build(f)
    local tier = _G.ForeverDungeonJournalTierPanel
    if tier and tier:IsShown() then tier:Hide() end
    panel:Show()
    HideList(f)
    Layout()
    if FDJ.PaintHomeTabs then pcall(FDJ.PaintHomeTabs) end
end

-- The home page's tabs (Systems/TierSets.lua): "pvp" while this page shows.
local activeBefore = FDJ.ActiveHomeTab
FDJ.ActiveHomeTab = function(...)
    if FDJ.IsPvPPageShown() then return "pvp" end
    if activeBefore then return activeBefore(...) end
    return "dungeons"
end
-- The Tier Sets page opened: this one closes first.
local tierBefore = FDJ.OpenTierPage
if tierBefore then
    FDJ.OpenTierPage = function(...)
        FDJ.HidePvPPage()
        return tierBefore(...)
    end
end

-- -------------------------------------------------------------- the icon
function FDJ.IsPvPIconHidden()
    local choice = ForeverDungeonJournalDB and ForeverDungeonJournalDB.hidePvP
    if choice == true then return true end
    if choice == false then return false end
    return Level() < PVP_LEVEL
end

local placed -- frame, raids medallion, size: the last placement
local Place
local function Replace()
    if placed then pcall(Place, placed[1], placed[2], placed[3]) end
end

function FDJ.SetPvPIconHidden(hidden)
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    ForeverDungeonJournalDB.hidePvP = hidden and true or false
    if hidden and FDJ.IsPvPPageShown() and FDJ.ShowDungeonsTab then FDJ.ShowDungeonsTab() end
    Replace()
    if FDJ.RefreshSettingsChecks then pcall(FDJ.RefreshSettingsChecks) end
end

function FDJ.SetPvPShowAll(on)
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    ForeverDungeonJournalDB.pvpShowAll = on and true or nil
    if panel and panel:IsShown() then Layout() end
    if FDJ.RefreshSettingsChecks then pcall(FDJ.RefreshSettingsChecks) end
end

-- Hide (right-click), as the other icons.
local menu
local function ShowHideMenu(anchor)
    if not menu then
        menu = CreateFrame("Frame", "ForeverDungeonJournalPvPMenu", UIParent, "BackdropTemplate")
        menu:SetFrameStrata("FULLSCREEN_DIALOG")
        menu:EnableMouse(true)
        menu:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, edgeSize = 12, insets = { left = 3, right = 3, top = 3, bottom = 3 } })
        menu:SetBackdropColor(0.055, 0.05, 0.043, 0.98)
        menu:SetBackdropBorderColor(0.57, 0.43, 0.20, 1)
        local item = CreateFrame("Button", nil, menu)
        item:SetPoint("TOPLEFT", 5, -5)
        item:SetPoint("RIGHT", -5, 0)
        item:SetHeight(20)
        item:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
        item.text = item:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
        item.text:SetPoint("LEFT", 6, 0)
        item:SetScript("OnClick", function()
            menu:Hide()
            FDJ.SetPvPIconHidden(true)
            if FDJ.OpenSettingsAt then FDJ.OpenSettingsAt("OPT_SHOW_PVP") end
        end)
        menu.hide = item
        menu:SetScript("OnUpdate", function(self, elapsed)
            if self:IsMouseOver() or (self.fdjAnchor and self.fdjAnchor:IsMouseOver()) then
                self.fdjAway = 0
            else
                self.fdjAway = (self.fdjAway or 0) + elapsed
                if self.fdjAway > 0.6 then self:Hide() end
            end
        end)
    end
    menu.hide.text:SetText(L("TIER_HIDE"))
    menu:SetSize(math.max(110, Num(menu.hide.text:GetStringWidth(), 60) + 24), 30)
    menu.fdjAnchor = anchor
    menu.fdjAway = 0
    menu:ClearAllPoints()
    menu:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 4, -2)
    menu:Show()
    if GameTooltip then GameTooltip:Hide() end
end

local function Masked(owner, tex)
    if owner.CreateMaskTexture and tex.AddMaskTexture then
        local mask = owner:CreateMaskTexture()
        mask:SetTexture(MASK, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
        mask:SetAllPoints(tex)
        tex:AddMaskTexture(mask)
    end
end

local function BuildButton(frame)
    local home = frame.homePanel
    local b = CreateFrame("Button", nil, home)
    frame.pvpButton = b
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    b:SetSize(36, 36)
    b:SetFrameLevel((tonumber(home:GetFrameLevel()) or 1) + 5)
    -- the same soft golden glow as the Tier Sets icon's
    b.halo = b:CreateTexture(nil, "BACKGROUND", nil, -1)
    b.halo:SetTexture(GLOW)
    b.halo:SetBlendMode("ADD")
    b.halo:SetVertexColor(1, 0.82, 0.35)
    b.halo:SetAlpha(0.75)
    b.halo:SetPoint("CENTER")
    -- a dark red disc, the crossed swords on it
    b.disc = b:CreateTexture(nil, "ARTWORK", nil, 0)
    b.disc:SetPoint("CENTER")
    b.disc:SetColorTexture(0.17, 0.04, 0.03, 1)
    Masked(b, b.disc)
    b.icon = b:CreateTexture(nil, "ARTWORK", nil, 1)
    b.icon:SetPoint("CENTER")
    local okF, faction = pcall(UnitFactionGroup, "player")
    local tabIcon = okF and PVP_TAB_ICONS[faction] or nil -- (pvpsidetab)
    if tabIcon and b.icon:SetTexture(tabIcon) ~= false then
        b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        Masked(b, b.icon)
        b.fdjFullIcon = true
    elseif b.icon:SetTexture(PVP_ICON) == false then
        b.icon:SetTexture(PVP_ICON_FALLBACK)
        b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        Masked(b, b.icon)
        b.fdjFullIcon = true
    end
    b.hl = b:CreateTexture(nil, "HIGHLIGHT")
    b.hl:SetTexture(MASK)
    b.hl:SetBlendMode("ADD")
    b.hl:SetAlpha(0.25)
    b.hl:SetPoint("CENTER")
    b:SetScript("OnMouseDown", function(self, button)
        if button ~= "LeftButton" then return end
        self.icon:ClearAllPoints()
        self.icon:SetPoint("CENTER", 1, -1)
    end)
    b:SetScript("OnMouseUp", function(self)
        self.icon:ClearAllPoints()
        self.icon:SetPoint("CENTER")
    end)
    b:SetScript("OnClick", function(self, button)
        if button == "RightButton" then ShowHideMenu(self) return end
        if GameTooltip then GameTooltip:Hide() end
        if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_ABILITY_PAGE_TURN) or 836) end -- (tabsound: the journal's page sound)
        if FDJ.ActiveHomeTab() ~= "pvp" then
            FDJ.OpenPvPPage()
        elseif FDJ.ClosePvPRewards then
            -- pvptabagain (2.1.6, M 25 Nov 2026: "if I click on the PVP tab
            -- again ... I'm on Alterac Valley and I'm watching items ... I
            -- should go back to the PVP tab, showing everything"): from a
            -- battleground's page, back to the cards (on the cards: stays)
            FDJ.ClosePvPRewards()
        end
    end)
    b:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L("PVP_TITLE"), 1, 0.82, 0)
        GameTooltip:AddLine(L("PVP_ICON_TIP"), 1, 1, 1, true)
        GameTooltip:AddLine(L("TIER_HIDE_TIP"), 0.6, 0.6, 0.6)
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    return b
end

-- Right of the Tier Sets icon when it shows, else of the Onyxia icon, the
-- Sleeping Bag's or the Raids medallion; the same size as theirs.
Place = function(frame, raid, size)
    if not frame or not frame.homePanel or not raid then return end
    placed = { frame, raid, size }
    local b = frame.pvpButton or BuildButton(frame)
    size = size or 40
    local inner = math.floor(size * 0.9 + 0.5)
    b:SetSize(inner, inner)
    b.disc:SetSize(inner, inner)
    if b.fdjFullIcon then b.icon:SetSize(inner, inner) else
        local swords = math.floor(inner * 0.78 + 0.5)
        b.icon:SetSize(swords, swords)
    end
    b.hl:SetSize(inner, inner)
    local glow = math.floor(inner * 1.92 + 0.5)
    b.halo:SetSize(glow, glow)
    local anchor = raid
    for _, other in ipairs({ frame.tierButton or false, frame.onyxiaButton or false, frame.sleepingBagButton or false }) do
        if other and other:IsShown() then anchor = other break end
    end
    b:ClearAllPoints()
    b:SetPoint("LEFT", anchor, "RIGHT", size >= 40 and 12 or (size >= 30 and 10 or 8), 0)
    b:SetShown(not FDJ.IsPvPIconHidden())
    -- The icons before it shown or hidden later: move along.
    for _, other in ipairs({ frame.tierButton or false, frame.onyxiaButton or false, frame.sleepingBagButton or false }) do
        if other and not other.fdjPvPHooked then
            other.fdjPvPHooked = true
            other:HookScript("OnShow", Replace)
            other:HookScript("OnHide", Replace)
        end
    end
end

-- Systems/ForeverFilter.lua places the Sleeping Bag's icon after the Raids
-- medallion on every refresh of the home page, and the Onyxia and Tier Sets
-- icons follow it (Systems/OnyxiaAttunement.lua, Systems/TierSets.lua); the
-- PvP icon comes last.
local PlaceBefore = FDJ.PlaceSleepingBagButton
FDJ.PlaceSleepingBagButton = function(frame, raid, size, ...)
    if PlaceBefore then pcall(PlaceBefore, frame, raid, size, ...) end
    pcall(Place, frame, raid, size)
    if FDJ.PaintHomeTabs then pcall(FDJ.PaintHomeTabs) end
end

-- Level 10: the icon comes; 20, 30, 51: the page gets the next battleground.
do
    local events = CreateFrame("Frame")
    events:RegisterEvent("PLAYER_LEVEL_UP")
    events:SetScript("OnEvent", function(_, _, level)
        levelNow = tonumber(level)
        Replace()
        if panel and panel:IsShown() then Layout() end
        if FDJ.RefreshSettingsChecks then pcall(FDJ.RefreshSettingsChecks) end
    end)
end
