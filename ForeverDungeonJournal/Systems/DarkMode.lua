


















local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

do
    local strings = {
        enUS = { "Dark mode", "Darkens the journal. The quest pages turn from parchment to a dark page with light text, easier on the eyes." },
        deDE = { "Dunkler Modus", "Dunkelt das Journal ab. Die Questseiten werden vom Pergament zu einer dunklen Seite mit heller Schrift, angenehmer für die Augen." },
        frFR = { "Mode sombre", "Assombrit le journal. Les pages de quête passent du parchemin à une page sombre au texte clair, plus reposante pour les yeux." },
        esES = { "Modo oscuro", "Oscurece el diario. Las páginas de misiones pasan del pergamino a una página oscura con texto claro, más cómoda para la vista." },
        itIT = { "Modalità scura", "Scurisce il diario. Le pagine delle missioni passano dalla pergamena a una pagina scura con testo chiaro, più riposante per gli occhi." },
        ptBR = { "Modo escuro", "Escurece o diário. As páginas de missões passam do pergaminho para uma página escura com texto claro, mais confortável para os olhos." },
        ruRU = { "Тёмная тема", "Затемняет журнал. Страницы заданий вместо пергамента становятся тёмными со светлым текстом — так легче для глаз." },
        koKR = { "다크 모드", "도감을 어둡게 합니다. 퀘스트 페이지가 양피지 대신 밝은 글씨의 어두운 페이지로 바뀌어 눈이 덜 피로합니다." },
        zhCN = { "深色模式", "让日志变暗。任务页面从羊皮纸变为浅色文字的深色页面，看起来更护眼。" },
        zhTW = { "深色模式", "讓日誌變暗。任務頁面從羊皮紙變為淺色文字的深色頁面，看起來更護眼。" },
    }
    strings.esMX = strings.esES
    for locale, pair in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then
            if t.OPT_DARK_MODE == nil then t.OPT_DARK_MODE = pair[1] end
            if t.OPT_DARK_MODE_TIP == nil then t.OPT_DARK_MODE_TIP = pair[2] end
        end
    end
end

local function Store()
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    return ForeverDungeonJournalDB
end

function FDJ.IsDarkMode()
    return ForeverDungeonJournalDB ~= nil and ForeverDungeonJournalDB.darkMode == true
end

local function Lum(r, g, b)
    return 0.299 * r + 0.587 * g + 0.114 * b
end






FDJ.DARK_COLOR = FDJ.DARK_COLOR or { 0.22, 0.22, 0.23 }
local function Base()

    local dev = FDJ.DEV_DARK_PICKER and ForeverDungeonJournalDB and ForeverDungeonJournalDB.darkColorDev
    if type(dev) == "table" and tonumber(dev[1]) and tonumber(dev[2]) and tonumber(dev[3]) then return dev[1], dev[2], dev[3] end
    local c = FDJ.DARK_COLOR
    return c[1], c[2], c[3]
end
local function Shade(scale, plus)
    local r, g, b = Base()
    plus = plus or 0
    return math.min(1, r * scale + plus), math.min(1, g * scale + plus), math.min(1, b * scale + plus)
end

local PANELS = { frame = 0.42, content = 0.82, header = 0.92, left = 0.70, right = 0.74, row = 0.62, lootRow = 0.64 }
local function Mix(a, b, t)
    return { a[1] + (b[1] - a[1]) * t, a[2] + (b[2] - a[2]) * t, a[3] + (b[3] - a[3]) * t }
end
local function Darker(c, keep, scale)
    if type(c) ~= "table" or not c[1] then return c end
    local l = Lum(c[1], c[2], c[3])
    local out = {}
    for i = 1, 3 do out[i] = (l + (c[i] - l) * keep) * scale end
    out[4] = c[4]
    return out
end
local light
local function SwapThemes(dark)
    local themes = FDJ.THEMES
    if type(themes) ~= "table" then return end
    if dark then
        if light then return end
        light = {}
        for name, theme in pairs(themes) do
            if type(theme) == "table" then
                local keep = {}
                for key, value in pairs(theme) do keep[key] = value end
                light[name] = keep

                for key, scale in pairs(PANELS) do
                    local own = theme[key]
                    if type(own) == "table" and own[1] then
                        local c = Mix({ Shade(scale) }, Darker(own, 0.45, 1), 0.22)
                        c[4] = own[4]
                        theme[key] = c
                    end
                end
                local sel = theme.rowSelected
                if type(sel) == "table" and sel[1] then
                    local c = Mix({ Shade(1.15, 0.03) }, Darker(sel, 0.70, 0.95), 0.45)
                    c[4] = sel[4]
                    theme.rowSelected = c
                end
                local border = theme.border
                if type(border) == "table" and border[1] then
                    local c = Mix({ Shade(1.0, 0.16) }, Darker(border, 0.30, 0.80), 0.25)
                    c[4] = border[4]
                    theme.border = c
                end
            end
        end
    elseif light then
        for name, keep in pairs(light) do
            local theme = themes[name]
            if type(theme) == "table" then
                for key, value in pairs(keep) do theme[key] = value end
            end
        end
        light = nil
    end
end

function FDJ.DarkModeThemes()
    SwapThemes(FDJ.IsDarkMode())
end

function FDJ.DarkModeRetheme()
    SwapThemes(false)
    SwapThemes(FDJ.IsDarkMode())
    if FDJ.RefreshLook then pcall(FDJ.RefreshLook) end
end



local function LightInk(r, g, b)
    if b > r + 0.2 and b > g + 0.2 then return 0.52, 0.64, 1.00 end
    local k = 0.90 - Lum(r, g, b) * 0.55
    return k, k * 0.955, k * 0.86
end
local INK_LIMIT = 0.30
local CODES = {
    ["|cff6e5c40"] = "|cffa69e8c",
    ["|cffc41414"] = "|cffff4a3a",
}






local followed = setmetatable({}, { __mode = "k" })
local function FixColor(fs, r, g, b, a, set)
    if not r or Lum(r, g, b) >= INK_LIMIT then


        if set then fs.fdjDarkInk = nil end
        return
    end
    fs.fdjDarkInk = { r, g, b, a }
    fs.fdjDarkBusy = true
    local lr, lg, lb = LightInk(r, g, b)
    pcall(fs.SetTextColor, fs, lr, lg, lb, a or 1)
    fs.fdjDarkBusy = nil
end
local function FixText(fs, text)
    if type(text) ~= "string" or not text:find("|c", 1, true) then return end
    local swapped = text
    for from, to in pairs(CODES) do
        if swapped:find(from, 1, true) then swapped = swapped:gsub(from:gsub("|", "%%|"), to) end
    end
    if swapped == text then return end
    fs.fdjDarkBusy = true
    pcall(fs.SetText, fs, swapped)
    fs.fdjDarkBusy = nil
end
local function Follow(fs)
    if followed[fs] then return end
    followed[fs] = true
    if not hooksecurefunc then return end
    hooksecurefunc(fs, "SetTextColor", function(self, r, g, b, a)
        if self.fdjDarkBusy then return end
        if FDJ.IsDarkMode() then FixColor(self, r, g, b, a, true) else self.fdjDarkInk = nil end
    end)
    hooksecurefunc(fs, "SetText", function(self, text)
        if self.fdjDarkBusy or not FDJ.IsDarkMode() then return end
        FixText(self, text)
    end)
end
local function Sweep(root)
    if not root or not root.GetRegions then return end
    for _, region in ipairs({ root:GetRegions() }) do
        if region and region.GetObjectType and region:GetObjectType() == "FontString" then
            Follow(region)
            if FDJ.IsDarkMode() then
                local okC, r, g, b, a = pcall(region.GetTextColor, region)
                if okC then FixColor(region, r, g, b, a) end
                local okT, text = pcall(region.GetText, region)
                if okT then FixText(region, text) end
            end
        end
    end
    if root.GetChildren then
        for _, child in ipairs({ root:GetChildren() }) do Sweep(child) end
    end
end


local pending = false
local function SweepSoon(frame)
    if pending then return end
    pending = true
    local run = function()
        pending = false
        if frame and frame.questTextInset then Sweep(frame.questTextInset) end
    end
    if C_Timer and C_Timer.After then C_Timer.After(0, run) else run() end
end


local function Home(frame)
    if not frame or not frame.homePanel then return end
    if FDJ.IsForeverOnly and FDJ.IsForeverOnly() then return end
    local r, g, b = Shade(0.80)
    frame.homePanel:SetBackdropColor(r, g, b, 0.97)
    r, g, b = Shade(1.0, 0.16)
    frame.homePanel:SetBackdropBorderColor(r, g, b, 1)
    if frame.homeParchment then frame.homeParchment:SetAlpha(0.06) end
end


function FDJ.ApplyDarkHome(frame)
    if FDJ.IsDarkMode() then Home(frame) end
end

local hooked
function FDJ.ApplyDarkMode(frame)
    if not frame then return end
    if not hooked then
        hooked = true
        for _, fs in ipairs({ frame.questDetailText, frame.noQuestMessage, frame.selectedQuestName }) do
            if fs and hooksecurefunc then
                hooksecurefunc(fs, "SetText", function() if FDJ.IsDarkMode() then SweepSoon(frame) end end)
            end
        end
        if frame.questTextInset then Sweep(frame.questTextInset) end
    end
    if not FDJ.IsDarkMode() then
        if frame.questParchment and frame.questParchment.SetDesaturated then frame.questParchment:SetDesaturated(false) end
        return
    end
    Home(frame)
    for _, key in ipairs({ "contentParchment", "headerParchment", "leftParchment", "rightParchment", "questLeftParchment", "questRightParchment" }) do
        if frame[key] then frame[key]:SetAlpha(0.04) end
    end
    if frame.questTextInset then
        local r, g, b = Shade(0.75)
        frame.questTextInset:SetBackdropColor(r, g, b, 1)
        r, g, b = Shade(1.0, 0.16)
        frame.questTextInset:SetBackdropBorderColor(r, g, b, 1)
    end
    if frame.questParchment then


        if frame.questParchment.SetDesaturated then frame.questParchment:SetDesaturated(true) end
        local r, g, b = Shade(1 / 0.78)
        frame.questParchment:SetVertexColor(r, g, b, 1)
        frame.questParchment:SetAlpha(1)
    end
    for _, edge in ipairs(frame.questInsetEdges or {}) do
        local r, g, b = Shade(1.0, 0.09)
        edge:SetColorTexture(r, g, b, 0.95)
    end
    if frame.dungeonBackgroundArt then frame.dungeonBackgroundArt:SetAlpha(0.10) end
    if frame.questTextInset then Sweep(frame.questTextInset) end
end


function FDJ.SetDarkMode(on)
    Store().darkMode = on and true or nil
    SwapThemes(on and true or false)
    if not on then

        for fs in pairs(followed) do
            local ink = fs.fdjDarkInk
            if ink then
                fs.fdjDarkInk = nil
                fs.fdjDarkBusy = true
                pcall(fs.SetTextColor, fs, ink[1], ink[2], ink[3], ink[4] or 1)
                fs.fdjDarkBusy = nil
            end
        end
    end
    if FDJ.RefreshLook then pcall(FDJ.RefreshLook) end
end
