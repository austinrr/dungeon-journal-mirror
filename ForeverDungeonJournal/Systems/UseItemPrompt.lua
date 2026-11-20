-- useprompt (2.1.1, M 20 Nov 2026 at the conduit in Twilight's Shroud, A
-- Small Favor: "it should say use Amberhall's Soulstone when he's weak ... a
-- little separate pop-up that pops up once it's weak, so people don't forget
-- to use the thing"): a quest item that only works on a weakened mob. Once
-- that mob is down to 20% health, "Use <item> now!" pops up over the
-- character with the item's own button, glowing, to click.
--
-- The game lets an addon show a button that uses an item only out of combat,
-- so the button is put in place, faded, as the player reaches the spot (or
-- targets the mob) and lights up when the mob is weak; out of combat again,
-- it goes away once it is no longer needed. Options > Hide Quest Item
-- Reminders turns it off.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

-- quest: in the log and not done; item: the quest item (in the bags);
-- npc: the mob it is used on; below: its health share that counts as weak;
-- spot / near: where the button is put in place (yards).
FDJ.USE_ITEM_PROMPTS = {
    { quest = 94907, item = 268646, itemName = "Amberhall's Soulstone", npc = 258652, below = 0.20,
      spot = { mapID = 2548, x = 0.266, y = 0.473 }, near = 90 }, -- A Small Favor: the Twilight Thrall
}

do
    local strings = {
        enUS = { USEITEM_NOW = "Use %s now!", OPT_HIDE_USEITEM = "Hide Quest Item Reminders", OPT_HIDE_USEITEM_TIP = "No \"Use ... now!\" pop-up with the item's button when a quest item has to be used on a weakened enemy." },
        deDE = { USEITEM_NOW = "Benutzt jetzt %s!", OPT_HIDE_USEITEM = "Questgegenstand-Hinweise ausblenden", OPT_HIDE_USEITEM_TIP = "Kein Hinweis \"Benutzt jetzt ...!\" mit dem Knopf des Gegenstands, wenn ein Questgegenstand an einem geschwächten Gegner benutzt werden muss." },
        frFR = { USEITEM_NOW = "Utilisez %s maintenant !", OPT_HIDE_USEITEM = "Masquer les rappels d'objets de quête", OPT_HIDE_USEITEM_TIP = "Pas de fenêtre « Utilisez ... maintenant ! » avec le bouton de l'objet quand un objet de quête doit être utilisé sur un ennemi affaibli." },
        esES = { USEITEM_NOW = "¡Usa %s ahora!", OPT_HIDE_USEITEM = "Ocultar avisos de objetos de misión", OPT_HIDE_USEITEM_TIP = "Sin el aviso \"¡Usa ... ahora!\" con el botón del objeto cuando hay que usar un objeto de misión en un enemigo debilitado." },
        itIT = { USEITEM_NOW = "Usa %s ora!", OPT_HIDE_USEITEM = "Nascondi promemoria oggetti missione", OPT_HIDE_USEITEM_TIP = "Nessun avviso \"Usa ... ora!\" con il pulsante dell'oggetto quando un oggetto di missione va usato su un nemico indebolito." },
        ptBR = { USEITEM_NOW = "Use %s agora!", OPT_HIDE_USEITEM = "Ocultar lembretes de itens de missão", OPT_HIDE_USEITEM_TIP = "Sem o aviso \"Use ... agora!\" com o botão do item quando um item de missão precisa ser usado em um inimigo enfraquecido." },
        ruRU = { USEITEM_NOW = "Используйте %s сейчас!", OPT_HIDE_USEITEM = "Скрыть напоминания о предметах заданий", OPT_HIDE_USEITEM_TIP = "Без окна «Используйте ... сейчас!» с кнопкой предмета, когда предмет задания нужно применить к ослабленному противнику." },
        koKR = { USEITEM_NOW = "지금 %s 사용하세요!", OPT_HIDE_USEITEM = "퀘스트 아이템 알림 숨기기", OPT_HIDE_USEITEM_TIP = "약해진 적에게 퀘스트 아이템을 사용해야 할 때 아이템 버튼과 함께 \"지금 ... 사용하세요!\" 알림을 표시하지 않습니다." },
        zhCN = { USEITEM_NOW = "立即使用%s！", OPT_HIDE_USEITEM = "隐藏任务物品提醒", OPT_HIDE_USEITEM_TIP = "当需要对虚弱的敌人使用任务物品时，不显示带物品按钮的“立即使用……！”提示。" },
        zhTW = { USEITEM_NOW = "立即使用%s！", OPT_HIDE_USEITEM = "隱藏任務物品提醒", OPT_HIDE_USEITEM_TIP = "當需要對虛弱的敵人使用任務物品時，不顯示帶物品按鈕的「立即使用……！」提示。" },
    }
    strings.esMX = strings.esES
    for locale, values in pairs(strings) do
        local t = FDJ.Locales and FDJ.Locales[locale]
        if t then for key, value in pairs(values) do if t[key] == nil then t[key] = value end end end
    end
end

function FDJ.UseItemPromptHidden()
    -- (its Hide option is gone, M 20 Nov 2026: an old saved choice no longer hides it)
    return false
end
function FDJ.SetUseItemPromptHidden(hidden)
    ForeverDungeonJournalDB = ForeverDungeonJournalDB or {}
    ForeverDungeonJournalDB.hideUseItemPrompt = hidden and true or nil
    if FDJ.UpdateUseItemPrompt then FDJ.UpdateUseItemPrompt() end
end

local function L(key, ...) return (FDJ.L and FDJ.L(key, ...)) or key end
local function Plain(v)
    if v == nil then return nil end
    if type(issecretvalue) == "function" and issecretvalue(v) then return nil end
    return v
end

local function ItemCount(itemID)
    local get = (C_Item and C_Item.GetItemCount) or GetItemCount
    if type(get) ~= "function" then return 0 end
    local ok, n = pcall(get, itemID)
    return ok and tonumber(Plain(n)) or 0
end
local function ItemIcon(itemID)
    local get = (C_Item and C_Item.GetItemIconByID) or GetItemIcon
    if type(get) ~= "function" then return nil end
    local ok, icon = pcall(get, itemID)
    return ok and icon or nil
end
local function ItemName(p)
    local get = (C_Item and C_Item.GetItemNameByID) or (GetItemInfo and function(id) return (GetItemInfo(id)) end)
    if type(get) == "function" then
        local ok, name = pcall(get, p.item)
        name = ok and Plain(name) or nil
        if type(name) == "string" and name ~= "" then return name end
    end
    return p.itemName
end

local function OnQuest(questID)
    if not (C_QuestLog and C_QuestLog.GetLogIndexForQuestID) then return false end
    local ok, index = pcall(C_QuestLog.GetLogIndexForQuestID, questID)
    if not (ok and Plain(index)) then return false end
    if C_QuestLog.IsComplete then
        local okDone, done = pcall(C_QuestLog.IsComplete, questID)
        if okDone and Plain(done) then return false end
    end
    return true
end

local function Near(p)
    local spot = p.spot
    if not (spot and C_Map and C_Map.GetBestMapForUnit and C_Map.GetPlayerMapPosition) then return false end
    local okMap, mapID = pcall(C_Map.GetBestMapForUnit, "player")
    if not okMap or Plain(mapID) ~= spot.mapID then return false end
    local okPos, pos = pcall(C_Map.GetPlayerMapPosition, spot.mapID, "player")
    if not (okPos and pos) then return false end
    local x, y = pos.x, pos.y
    if (x == nil or y == nil) and pos.GetXY then x, y = pos:GetXY() end
    x, y = Plain(x), Plain(y)
    if not (x and y) then return false end
    local w, h = 1000, 1000
    if C_Map.GetMapWorldSize then
        local okSize, mw, mh = pcall(C_Map.GetMapWorldSize, spot.mapID)
        if okSize and tonumber(Plain(mw)) and tonumber(Plain(mh)) then w, h = mw, mh end
    end
    local dx, dy = (x - spot.x) * w, (y - spot.y) * h
    return math.sqrt(dx * dx + dy * dy) <= (p.near or 80)
end

-- The target is the prompt's mob: true / false; its health share or nil.
local function TargetIs(p)
    if not (UnitExists and UnitExists("target")) then return false end
    local okGuid, guid = pcall(UnitGUID, "target")
    guid = okGuid and Plain(guid) or nil
    if type(guid) == "string" then
        local npc = tonumber(guid:match("^%a+%-%d+%-%d+%-%d+%-%d+%-(%d+)"))
        if npc ~= p.npc then return false end
    else
        return false
    end
    if UnitIsDead and UnitIsDead("target") then return false end
    local okH, hp = pcall(UnitHealth, "target")
    local okM, max = pcall(UnitHealthMax, "target")
    hp, max = okH and tonumber(Plain(hp)) or nil, okM and tonumber(Plain(max)) or nil
    if hp and max and max > 0 then return true, hp / max end
    return true, nil
end

local button, pop
local function Build()
    if button or (InCombatLockdown and InCombatLockdown()) then return end
    local ok, b = pcall(CreateFrame, "Button", "ForeverDungeonJournalUseItemButton", UIParent, "SecureActionButtonTemplate")
    if not ok or not b then return end
    button = b
    b:SetSize(46, 46)
    b:SetPoint("CENTER", UIParent, "CENTER", 0, 120)
    b:SetFrameStrata("HIGH")
    b:RegisterForClicks("LeftButtonUp")
    b:SetAttribute("useOnKeyDown", false)
    b:SetAttribute("type", "item")
    b.icon = b:CreateTexture(nil, "ARTWORK")
    b.icon:SetAllPoints()
    b.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    b.border = b:CreateTexture(nil, "OVERLAY")
    b.border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    b.border:SetBlendMode("ADD")
    b.border:SetVertexColor(1, 0.82, 0.2)
    b.border:SetPoint("CENTER")
    b.border:SetSize(84, 84)
    b.border:Hide()
    local lit = b:CreateTexture(nil, "HIGHLIGHT")
    lit:SetAllPoints()
    lit:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
    lit:SetBlendMode("ADD")
    b:SetScript("OnEnter", function(self)
        if not GameTooltip or not self.itemID then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if GameTooltip.SetItemByID then GameTooltip:SetItemByID(self.itemID) end
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    b:Hide()

    -- The words over it: an ordinary frame (shown and hidden in combat too).
    pop = CreateFrame("Frame", nil, UIParent)
    pop:SetSize(320, 30)
    pop:SetPoint("BOTTOM", UIParent, "CENTER", 0, 148)
    pop:SetFrameStrata("HIGH")
    pop.text = pop:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    pop.text:SetPoint("CENTER")
    pop.text:SetTextColor(0.35, 1, 0.35)
    pop.text:SetShadowColor(0, 0, 0, 1)
    pop.text:SetShadowOffset(2, -2)
    local pulse = pop:CreateAnimationGroup()
    pulse:SetLooping("BOUNCE")
    local fade = pulse:CreateAnimation("Alpha")
    fade:SetFromAlpha(1)
    fade:SetToAlpha(0.45)
    fade:SetDuration(0.5)
    pop.pulse = pulse
    pop:Hide()
end

local function Active()
    if FDJ.UseItemPromptHidden() then return nil end
    for _, p in ipairs(FDJ.USE_ITEM_PROMPTS) do
        if OnQuest(p.quest) and ItemCount(p.item) > 0 then return p end
    end
end

function FDJ.UpdateUseItemPrompt()
    Build()
    if not button then return end
    local p = Active()
    local isMob, share = false, nil
    if p then isMob, share = TargetIs(p) end
    local weak = isMob and share ~= nil and share <= (p.below or 0.2)
    local inCombat = InCombatLockdown and InCombatLockdown()
    -- The button: put in place / taken away only out of combat.
    if not inCombat then
        local want = p and (isMob or Near(p)) or false
        if want and button.itemID ~= p.item then
            button.itemID = p.item
            button:SetAttribute("item", "item:" .. p.item)
            button.icon:SetTexture(ItemIcon(p.item) or "Interface\\Icons\\INV_Misc_QuestionMark")
        end
        button:SetShown(want and true or false)
    end
    -- Faded until the mob is weak, then lit (alpha is allowed in combat).
    button:SetAlpha(weak and 1 or 0.45)
    button.border:SetShown(weak and true or false)
    if weak then
        pop.text:SetText(L("USEITEM_NOW", ItemName(p)))
        if not pop:IsShown() then pop:Show() pop.pulse:Play() end
    elseif pop:IsShown() then
        pop.pulse:Stop()
        pop:Hide()
    end
end

local watch = CreateFrame("Frame")
for _, event in ipairs({ "PLAYER_LOGIN", "PLAYER_TARGET_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED",
    "QUEST_LOG_UPDATE", "BAG_UPDATE_DELAYED", "ZONE_CHANGED", "ZONE_CHANGED_NEW_AREA" }) do
    watch:RegisterEvent(event)
end
pcall(watch.RegisterUnitEvent, watch, "UNIT_HEALTH", "target")
watch:SetScript("OnEvent", function() pcall(FDJ.UpdateUseItemPrompt) end)
-- (walking up to the spot: a look twice a second)
local wait = 0
watch:SetScript("OnUpdate", function(_, elapsed)
    wait = wait - (elapsed or 0)
    if wait > 0 then return end
    wait = 0.5
    pcall(FDJ.UpdateUseItemPrompt)
end)
