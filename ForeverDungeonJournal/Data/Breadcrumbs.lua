local ADDON_NAME, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS

















FDJ.QUEST_BREADCRUMBS = {
    [96393] = { { id = 96408, name = "A Visitor to Dun Morogh" } },
    [914]   = { { id = 886, name = "The Barrens Oases" } },
    [2040]  = { { id = 2041, name = "Speak with Shoni" } },
    [1275]  = { { id = 3765, name = "The Corruption Abroad" } },
    [6563]  = { { id = 6562, name = "Trouble in the Deeps" } },
    [95647] = { { id = 95737, name = "Seeking Caitlin" } },
    [98815] = { { id = 469, name = "Daily Delivery" } },
    [95646] = { { id = 463, name = "The Greenwarden" } },
    [2922]  = { { id = 2923, name = "Tinkmaster Overspark" } },
    [2924]  = { { id = 2925, name = "Klockmort's Essentials" } },
    [2930]  = { { id = 2931, name = "Castpipe's Task" } },
    [2962]  = { { id = 2927, name = "The Day After" } },
    [1053]  = { { id = 6141, name = "Brother Anton" } },
    [704]   = { { id = 707, name = "Ironband Wants You!" } },
    [1956]  = { { id = 1953, name = "Return to the Marsh" } },
    [2770]  = { { id = 2769, name = "The Brassbolts Brothers" } },
    [2846]  = { { id = 2861, name = "Tabetha's Task" } },
    [2865]  = { { id = 2864, name = "Tran'rek" } },
    [9053]  = { { id = 9063, name = "Torwa Pathfinder" } },
    [8418]  = { { id = 8415, name = "Chillwind Point" } },
    [8236]  = { { id = 8233, name = "A Simple Request" } },
    [8425]  = { { id = 8417, name = "A Troubled Spirit" } },
    [4126]  = { { id = 4128, name = "Ragnar Thunderbrew" } },
    [4134]  = { { id = 4133, name = "Vivian Lagrave" } },
    [4136]  = { { id = 4324, name = "Yuka Screwspigot" } },
    [7489]  = { { id = 7492, name = "Camp Mojache" } },
    [7488]  = { { id = 7494, name = "Feathermoon Stronghold" } },
    [5247]  = { { id = 5249, name = "To Winterspring!" }, { id = 5250, name = "Starfall" } },
    [4764]  = { { id = 4766, name = "Mayara Brightwing" } },
    [4768]  = { { id = 4769, name = "Vivian Lagrave and the Darkstone Tablet" } },
}




local D = FDJ.QUEST_PREREQ_DETAILS
local NEW = {
    [96408] = { level = 13, requires = 9, faction = "Alliance",
        objective = "Investigate the campsite overlooking the Gol'Bolar Quarry.",
        pickup = "Beldin Steelgrill, Kharanos, Dun Morogh",
        turnin = "Earthseer Farsen, Gol'Bolar Quarry, Dun Morogh",
        map = { mapID = 1426, x = 0.5044, y = 0.4909, label = "Beldin Steelgrill — Kharanos", targetName = "Beldin Steelgrill" },
        turninMap = { mapID = 1426, x = 0.6487, y = 0.5847, label = "Earthseer Farsen — Gol'Bolar Quarry", targetName = "Earthseer Farsen" } },
    [886] = { level = 10, requires = 10, faction = "Horde",
        objective = "Speak with Tonga Runetotem at the Crossroads.",
        pickup = "Arch Druid Hamuul Runetotem, Elder Rise, Thunder Bluff",
        turnin = "Tonga Runetotem, The Crossroads",
        map = { mapID = 1456, x = 0.7862, y = 0.2856, label = "Arch Druid Hamuul Runetotem — Elder Rise", targetName = "Arch Druid Hamuul Runetotem" },
        turninMap = { mapID = 1413, x = 0.5226, y = 0.3193, label = "Tonga Runetotem — The Crossroads", targetName = "Tonga Runetotem" } },
    [95737] = { level = 31, requires = 24, faction = "Alliance",
        objective = "Speak with Caitlin Grassman in Menethil Harbor.",
        pickup = "Llana, Astranaar, Ashenvale",
        turnin = "Caitlin Grassman, Menethil Harbor, Wetlands",
        map = { mapID = 1440, x = 0.3498, y = 0.4846, label = "Llana — Astranaar", targetName = "Llana" },
        turninMap = { mapID = 1437, x = 0.1188, y = 0.5882, label = "Caitlin Grassman — Menethil Harbor", targetName = "Caitlin Grassman" } },
    [469] = { level = 21, requires = 18, faction = "Alliance",
        objective = "Deliver the Bundle of Crocolisk Skins to James Halloran, the tanner, in Menethil Harbor.",
        pickup = "Einar Stonegrip, Wetlands",
        turnin = "James Halloran, Menethil Harbor, Wetlands",
        map = { mapID = 1437, x = 0.4992, y = 0.3937, label = "Einar Stonegrip — Wetlands", targetName = "Einar Stonegrip" },
        turninMap = { mapID = 1437, x = 0.0855, y = 0.5574, label = "James Halloran — Menethil Harbor", targetName = "James Halloran" } },
    [2923] = { level = 26, requires = 20, faction = "Alliance",
        objective = "Speak with Tinkmaster Overspark in Ironforge.",
        pickup = "Brother Sarno, Cathedral Square, Stormwind",
        turnin = "Tinkmaster Overspark, Tinker Town, Ironforge",
        map = { mapID = 1453, x = 0.5105, y = 0.4839, label = "Brother Sarno — Cathedral Square", targetName = "Brother Sarno" },
        turninMap = { mapID = 1455, x = 0.6955, y = 0.5033, label = "Tinkmaster Overspark — Tinker Town", targetName = "Tinkmaster Overspark" } },
    [2925] = { level = 30, requires = 24, faction = "Alliance",
        objective = "Speak with Klockmort Spannerspan in Ironforge.",
        pickup = "Mathiel, Darnassus",
        turnin = "Klockmort Spannerspan, Tinker Town, Ironforge",
        map = { mapID = 1457, x = 0.5951, y = 0.4538, label = "Mathiel — Darnassus", targetName = "Mathiel" },
        turninMap = { mapID = 1455, x = 0.6792, y = 0.4610, label = "Klockmort Spannerspan — Tinker Town", targetName = "Klockmort Spannerspan" } },
    [2931] = { level = 28, requires = 25, faction = "Alliance",
        objective = "Speak with Master Mechanic Castpipe in Ironforge.",
        pickup = "Gaxim Rustfizzle, Stonetalon Mountains",
        turnin = "Master Mechanic Castpipe, Tinker Town, Ironforge",
        map = { mapID = 1442, x = 0.5952, y = 0.6715, label = "Gaxim Rustfizzle — Stonetalon Mountains", targetName = "Gaxim Rustfizzle" },
        turninMap = { mapID = 1455, x = 0.6983, y = 0.4810, label = "Master Mechanic Castpipe — Tinker Town", targetName = "Master Mechanic Castpipe" } },
    [2927] = { level = 27, requires = 20, faction = "Alliance",
        objective = "Speak with Ozzie Togglevolt in Kharanos.",
        pickup = "Gnoarn, Tinker Town, Ironforge",
        turnin = "Ozzie Togglevolt, Kharanos, Dun Morogh",
        map = { mapID = 1455, x = 0.6918, y = 0.5055, label = "Gnoarn — Tinker Town", targetName = "Gnoarn" },
        turninMap = { mapID = 1426, x = 0.4589, y = 0.4939, label = "Ozzie Togglevolt — Kharanos", targetName = "Ozzie Togglevolt" } },
    [1953] = { level = 40, requires = 35, classOnly = "MAGE",
        objective = "Speak with Tabetha.",
        pickup = "Your mage trainer in a capital city: Jennea Cannon (Stormwind), Bink (Ironforge), Deino (Orgrimmar), Ursyn Ghull (Thunder Bluff) or Anastasia Hartwell (Undercity)",
        pickupAlliance = "Your mage trainer in a capital city: Jennea Cannon (Stormwind) or Bink (Ironforge)",
        pickupHorde = "Your mage trainer in a capital city: Deino (Orgrimmar), Ursyn Ghull (Thunder Bluff) or Anastasia Hartwell (Undercity)",
        turnin = "Tabetha, Dustwallow Marsh",
        turninMap = { mapID = 1445, x = 0.460, y = 0.570, label = "Tabetha — Dustwallow Marsh", targetName = "Tabetha" } },
    [5249] = { level = 56, requires = 53, faction = "Alliance",
        objective = "Find Starfall Village in Winterspring and speak with Wynd Nightchaser.",
        pickup = "Ivy Leafrunner, Emerald Sanctuary, Felwood",
        turnin = "Wynd Nightchaser, Starfall Village, Winterspring",
        map = { mapID = 1448, x = 0.5096, y = 0.8158, label = "Ivy Leafrunner — Emerald Sanctuary", targetName = "Ivy Leafrunner" },
        turninMap = { mapID = 1452, x = 0.5197, y = 0.3039, label = "Wynd Nightchaser — Starfall Village", targetName = "Wynd Nightchaser" } },
}
for id, d in pairs(NEW) do
    if D[id] == nil then D[id] = d end
end




do
    local hidden = {}
    for _, dungeon in pairs(FDJ.DB or {}) do
        for _, q in ipairs((type(dungeon) == "table" and dungeon.quests) or {}) do
            if type(q) == "table" and q.id and not hidden[q.id] then hidden[q.id] = q end
        end
    end
    for _, list in pairs(FDJ.QUEST_BREADCRUMBS) do
        for _, crumb in ipairs(list) do
            local q = hidden[crumb.id]
            if D[crumb.id] == nil and q then
                D[crumb.id] = {
                    level = q.level, requires = q.requires, faction = q.faction, classOnly = q.classOnly,
                    objective = q.objective, pickup = q.pickup, turnin = q.turnin,
                    startItem = q.startItem, startObject = q.startObject,
                    map = FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[crumb.id] or nil,
                }
            end
            if D[crumb.id] then D[crumb.id].dungeonStep = false end
        end
    end
end



do
    local NAMES = {
        deDE = {
            [96408] = { "Ein Besucher in Dun Morogh", "Untersucht das Lager über dem Steinbruch Gol'Bolar." },
            [886] = { "Die Oasen des Brachlandes", "Sprecht in Crossroads mit Tonga Runetotem." },
            [95737] = { "Suche nach Caitlin", "Sprecht mit Caitlin Grassman im Hafen von Menethil." },
            [469] = { "Tägliche Lieferung", "Liefert das Bündel Krokiliskenhäute bei dem Gerber James Halloran im Hafen von Menethil ab." },
            [2923] = { "Tüftlermeister Overspark", "Sprecht mit Tüftlermeister Overspark in Ironforge." },
            [2925] = { "Klockmorts Grundlagen", "Sprecht mit Klockmort Spannerspan in Ironforge." },
            [2931] = { "Castpipes Auftrag", "Sprecht mit Mechanikermeister Castpipe in Ironforge." },
            [2927] = { "Der Tag danach", "Sprecht mit Ozzie Togglevolt in Kharanos." },
            [1953] = { "Rückkehr in die Marschen", "Sprecht mit Tabetha." },
            [5249] = { "Nach Winterspring!", "Sucht Starfall in Winterspring und sprecht mit Wynd Nightchaser." },
        },
        frFR = {
            [96408] = { "Une visite à Dun Morogh", "Inspectez le campement qui domine la carrière de Gol’Bolar." },
            [886] = { "Les oasis des Tarides", "Parler à Tonga Runetotem à la Croisée." },
            [95737] = { "À la recherche de Caitlin", "Parlez à Caitlin Grassman au port de Menethil." },
            [469] = { "Livraison quotidienne", "Apporter le Lot de peaux de crocilisques à James Halloran, le tanneur, au port de Menethil." },
            [2923] = { "Maître-artisan Overspark", "Parler au maître-artisan Overspark à Forgefer." },
            [2925] = { "Les cerveaux mécaniques de Klockmort", "Parler à Klockmort Spannerspan à Forgefer." },
            [2931] = { "Du travail pour Castpipe", "Parler au Maître mécanicien Castpipe, à Forgefer." },
            [2927] = { "Le jour d'après", "Parler à Ozzie Togglevolt à Kharanos." },
            [1953] = { "Retourner dans le Marais", "Aller voir Tabetha." },
            [5249] = { "Au Berceau-de-l'Hiver", "Trouver le village de Pluie-d'Etoiles dans le Berceau-de-l'Hiver, et parler à Wynd Nightchaser." },
        },
        esES = {
            [96408] = { "Un visitante en Dun Morogh", "Investiga el campamento sobre la Cantera de Gol'Bolar." },
            [886] = { "El oasis de Los Baldíos", "Habla con Tonga Runatótem en El Cruce." },
            [95737] = { "En busca de Caitlin", "Habla con Caitlin Pastal en el Puerto de Menethil." },
            [469] = { "Entrega cotidiana", "Entrega el fardo de pieles de crocolisco a James Halloran, el peletero, en Puerto de Menethil." },
            [2923] = { "Maestro manitas Sobrechispa", "Habla con el maestro manitas Sobrechispa en Forjaz." },
            [2925] = { "Klockmort Palmalicate", "Habla con Klockmort Palmalicate en Forjaz." },
            [2931] = { "Trabajar para Funditubo", "Habla con el maestro mecánico Funditubo en Forjaz." },
            [2927] = { "Al día siguiente", "Ve a hablar con Ozzie Voltiflop en Kharanos." },
            [1953] = { "Regreso al pantano", "Habla con Tabetha." },
            [5249] = { "¡A la Cuna del Invierno!", "Encuentra la Aldea Estrella Fugaz en Cuna del Invierno y habla con Wynd Cazanoche." },
        },
        ptBR = {
            [96408] = { "Um visitante em Dun Morogh", "Investigue o acampamento acima da Pedreira Gol'Bolar." },
            [886] = { "Oásis nos Sertões", "Fale com Tonga Runa Totem na Encruzilhada." },
            [95737] = { "Procurando Tina", "Fale com Tina Pastofino no Porto de Menethil." },
            [469] = { "Entrega diária", "Entregue o Pacote de Peles de Crocolisco a Iago Halberque, o curtumeiro, no Porto de Menethil." },
            [2923] = { "Mestre-faz-tudo Superchispa", "Fale com o Mestre-faz-tudo Superchispa em Altaforja." },
            [2925] = { "Os artifícios do Cronomorfus", "Fale com Cronomorfus Espanafuso em Altaforja." },
            [2931] = { "A tarefa do Fundecano", "Fale com o Mestre Mecânico Fundecano em Altaforja." },
            [2927] = { "O dia seguinte", "Fale com Ozzie Mudavolt em Kharanos." },
            [1953] = { "Retorno ao pântano", "Fale com Tabetha." },
            [5249] = { "Rumo a Hibérnia!", "Encontre a Aldeia Chuva Estelar, em Hibérnia, e fale com Eol Correnoite." },
        },
        ruRU = {
            [96408] = { "Гость Дун Морога", "Исследуйте лагерь с видом на каменоломню Гол'Болар." },
            [886] = { "Оазисы Степей", "Поговорите на Перекрестке с Тонгой Руническим Тотемом." },
            [95737] = { "В поисках Кейтлин", "Поговорите с Кейтлин Грассман в Гавани Менетилов." },
            [469] = { "Ежедневная доставка", "Отнесите стопку кроколисковых шкур кожевнику Джеймсу Халлорану в Гавань Менетилов." },
            [2923] = { "Мехмастер Замыкалец", "Поговорите с механомастером Большой Искрой." },
            [2925] = { "Базовые элементы Клацморта", "Поговорите с Клацмортом Гайкокрутом в Стальгорне." },
            [2931] = { "Поручение Чугонотрубза", "Поговорите с главным механиком Чугунотрубзом в Стальгорне." },
            [2927] = { "На другой день", "Поговорите с Оззи Триггервольтом в Караносе." },
            [1953] = { "Назад в болото", "Поговорите с Табетой." },
            [5249] = { "В Зимние Ключи!", "Найдите в Зимних Ключах деревню Звездопада и поговорите там с Вундом Ночным Охотником." },
        },
        koKR = {
            [96408] = { "던 모로의 방문객", "골볼라 채석장이 내려다보이는 야영지를 조사해야 합니다." },
            [886] = { "불모의 땅 오아시스", "크로스로드에 있는 통가 룬토템과 대화해야 합니다." },
            [95737] = { "케이틀린을 찾아서", "메네실 항구에서 케이틀린 그라스만과 대화해야 합니다." },
            [469] = { "가죽 배달", "메네실 항구의 무두장이 제임스 할로란에게 악어 가죽 한 묶음을 전달해야 합니다." },
            [2923] = { "수석땜장이 오버스파크", "아이언포지에 있는 수석땜장이 오버스파크와 대화하십시오." },
            [2925] = { "클락몰트에게 꼭 필요한 것", "아이언포지에 있는 클락몰트 스패너스판과 대화하십시오." },
            [2931] = { "캐스트파이프의 임무", "아이언포지에 있는 수석수리공 캐스트파이프와 대화하십시오." },
            [2927] = { "그날 이후", "카라노스에 있는 오지 토글볼트와 대화하십시오." },
            [1953] = { "다시 습지대로", "타베사와 대화하십시오." },
            [5249] = { "여명의 설원으로!", "여명의 설원에 있는 별똥별 마을에서 윈드 나이트체이서와 대화하십시오." },
        },
        zhCN = {
            [96408] = { "丹莫罗的访客", "调查俯瞰古博拉采掘场的营地。" },
            [886] = { "贫瘠之地的绿洲", "和十字路口的图加·符文图腾谈一谈。" },
            [95737] = { "寻访凯特林", "与米奈希尔港的凯特林·格拉斯曼谈一谈。" },
            [469] = { "日常供货", "将这捆鳄鱼皮带给米奈希尔港的皮匠詹姆斯·哈洛兰。" },
            [2923] = { "工匠大师欧沃斯巴克", "与铁炉堡的工匠大师欧沃斯巴克谈一谈。" },
            [2925] = { "帮助科劳莫特", "与铁炉堡的科劳莫特·钢尺谈一谈。" },
            [2931] = { "卡斯派普的任务", "与铁炉堡的大机械师卡斯派普谈一谈。" },
            [2927] = { "灾难之后", "与卡拉诺斯的奥齐·电环谈一谈。" },
            [1953] = { "返回沼泽", "和塔贝萨谈一谈。" },
            [5249] = { "前往冬泉谷！", "找到冬泉谷的坠星村，在那里与维恩德·夜风谈一谈。" },
        },
        zhTW = {
            [96408] = { "來丹莫洛的訪客", "調查瞭望古博拉採掘場的營地。" },
            [886] = { "貧瘠之地的綠洲", "和十字路口的圖加·符文圖騰談話。" },
            [95737] = { "尋找凱特林", "與米奈希爾港的凱特林‧格拉斯曼交談。" },
            [469] = { "日常供貨", "將這捆鱷魚皮帶給米奈希爾港的皮匠詹姆士·哈洛倫。" },
            [2923] = { "工匠大師歐沃斯巴克", "與鐵爐堡的工匠大師歐沃斯巴克談話。" },
            [2925] = { "幫助科勞莫特", "與鐵爐堡的科勞莫特·鋼尺談話。" },
            [2931] = { "卡斯派普的任務", "與鐵爐堡的大機械師卡斯派普談話。" },
            [2927] = { "災難之後", "與卡拉諾斯的奧齊·電環談話。" },
            [1953] = { "返回沼澤", "和塔貝薩談話。" },
            [5249] = { "前往冬泉谷！", "找到冬泉谷的墜星村，在那裏與維恩德·夜風談壹談。" },
        },
        itIT = {
            [96408] = { "Un visitatore a Dun Morogh", "Indaga sull'accampamento che domina la Cava di Gol'Bolar." },
            [886] = { "Le oasi delle Savane", "Parla con Tonga Runetotem al Crocevia." },
            [95737] = { "Alla ricerca di Caitlin", "Parla con Caitlin Grassman al Porto di Menethil." },
            [469] = { "Consegna quotidiana", "Consegna il fagotto di pelli di crocolisco a James Halloran, il conciatore, al Porto di Menethil." },
            [2923] = { "Mastro inventore Overspark", "Parla con il mastro inventore Overspark a Forgiardente." },
            [2925] = { "Gli essenziali di Klockmort", "Parla con Klockmort Spannerspan a Forgiardente." },
            [2931] = { "L'incarico di Castpipe", "Parla con il capomeccanico Castpipe a Forgiardente." },
            [2927] = { "Il giorno dopo", "Parla con Ozzie Togglevolt a Kharanos." },
            [1953] = { "Ritorno alla palude", "Parla con Tabetha." },
            [5249] = { "A Fontefredda!", "Trova il Villaggio di Starfall a Fontefredda e parla con Wynd Nightchaser." },
        },
    }
    for lang, list in pairs(NAMES) do
        local content = FDJ.ContentLocales and FDJ.ContentLocales[lang]
        if content then
            content.quests = content.quests or {}
            for id, t in pairs(list) do
                local q = content.quests[id] or {}
                content.quests[id] = q
                if q.name == nil then q.name = t[1] end
                if q.objective == nil then q.objective = t[2] end
            end
        end
    end
end




do
    local MORE = {
        itIT = {
            [2769] = { "I fratelli Brassbolts", "Parla con Wizzle Brassbolts a Shimmering Flats, a Millepicchi." },
            [4128] = { "Ragnar Thunderbrew", "Parla con Ragnar Thunderbrew." },
            [4133] = { "Vivian Lagrave", "Parla con la maga dell'ombra Vivian Lagrave a Kargath." },
            [6141] = { "Fratello Anton", "Parla con fratello Anton a Desolanda." },
            [8417] = { "Uno spirito inquieto", "Parla con l'Eroe Caduto dell'Orda all'ingresso delle Terre Devastate." },
            [4766] = { "Mayara Brightwing", "Parla con Mayara Brightwing nelle Steppe Ardenti." },
            [9063] = { "Torwa Pathfinder", "Parla con Torwa Pathfinder nel Cratere di Un'Goro." },
            [5250] = { "Starfall", "Trova Starfall a Fontefredda e parla con Wynd Nightchaser." },
            [4324] = { "Yuka Screwspigot", "Parla con Yuka Screwspigot nelle Steppe Ardenti." },
            [7492] = { "Campo Mojache", "Parla con Talo Thornhoof al Campo Mojache, a Feralas." },
            [7494] = { "Roccaforte di Feathermoon", "Parla con Latronicus Moonspear alla Roccaforte di Feathermoon, a Feralas." },
            [4769] = { "Vivian Lagrave e la Tavoletta di Darkstone", "Parla con la maga dell'ombra Vivian Lagrave." },
            [8233] = { "Una semplice richiesta", "Parla con lord Jorach Ravenholdt al Maniero di Ravenholdt." },
            [8415] = { "Chillwind Point", "Parla con il comandante Ashlam Valorfist a Chillwind Point." },
            [2864] = { "Tran'rek", "Parla con Tran'rek a Gadgetzan." },
            [2861] = { "L'incarico di Tabetha", "Parla con Tabetha ad Acquemorte." },
            [707] = { "Ironband ti vuole!", "Parla con il prospettore Ironband al sito di scavo di Ironband, a Loch Modan." },
        },
        zhTW = {
            [6562] = { nil, "與梣谷的耶努薩克雷談話。" },
            [2041] = { nil, "去暴風城和舒尼談話。" },
            [6141] = { nil, "與淒涼之地的安東修士談話。" },
            [3765] = { nil, "到奧伯丁的戈沙拉·夜語那兒去。" },
            [5250] = { nil, "找到冬泉谷的墜星村，在那裏與維恩德·夜風談壹談。" },
        },
    }
    for lang, list in pairs(MORE) do
        local content = FDJ.ContentLocales and FDJ.ContentLocales[lang]
        if content then
            content.quests = content.quests or {}
            for id, t in pairs(list) do
                local q = content.quests[id] or {}
                content.quests[id] = q
                if q.name == nil and t[1] then q.name = t[1] end
                if q.objective == nil and t[2] then q.objective = t[2] end
            end
        end
    end

    local PLACES = {
        ["Gol'Bolar Quarry"] = { deDE = "Steinbruch Gol'Bolar", frFR = "Carrière de Gol'Bolar", esES = "Cantera de Gol'Bolar", itIT = "Cava di Gol'Bolar",
            ptBR = "Pedreira Gol'Bolar", ruRU = "Карьер Гол'Болар", koKR = "골볼라 채석장", zhCN = "古博拉采掘场", zhTW = "古博拉採掘場" },
        ["Emerald Sanctuary"] = { frFR = "Sanctuaire d'Émeraude", esES = "Santuario Esmeralda", itIT = "Santuario di Smeraldo",
            ptBR = "Santuário Esmeralda", ruRU = "Изумрудное святилище", koKR = "에메랄드 성소", zhCN = "翡翠圣地", zhTW = "翡翠聖地" },
        ["Starfall Village"] = { deDE = "Starfall", frFR = "Pluie-d'Etoiles", esES = "Aldea Estrella Fugaz", itIT = "Villaggio di Starfall",
            ptBR = "Aldeia Chuva Estelar", ruRU = "Деревня Звездопада", koKR = "별똥별 마을", zhCN = "坠星村", zhTW = "墜星村" },
        ["Winterspring"] = { deDE = "Winterquell", frFR = "Berceau-de-l'Hiver", esES = "Cuna del Invierno", itIT = "Fontefredda",
            ptBR = "Hibérnia", ruRU = "Зимние Ключи", koKR = "여명의 설원", zhCN = "冬泉谷", zhTW = "冬泉谷" },
        ["Dustwallow Marsh"] = { deDE = "Düstermarschen", frFR = "Marécage d'Âprefange", esES = "Marjal Revolcafango", itIT = "Acquemorte",
            ptBR = "Pântano Vadeoso", ruRU = "Пылевые топи", koKR = "먼지진흙 습지대", zhCN = "尘泥沼泽", zhTW = "塵泥沼澤" },
        ["The Crossroads"] = { koKR = "크로스로드", zhCN = "十字路口", zhTW = "十字路口" },
        ["Astranaar"] = { ruRU = "Астранаар", koKR = "아스트라나르", zhCN = "阿斯特兰纳", zhTW = "阿斯特蘭納" },
        ["Tinker Town"] = { koKR = "땜장이 마을", zhCN = "侏儒区", zhTW = "地精區" },

        ["Mage trainers (mages only)"] = { deDE = "Magierlehrer (nur Magier)", frFR = "Maîtres des mages (mages uniquement)", esES = "Instructores de magos (solo magos)",
            itIT = "Istruttori dei maghi (solo maghi)", ptBR = "Instrutores de magos (somente magos)", ruRU = "Наставники магов (только для магов)",
            koKR = "마법사 상급 교관 (마법사 전용)", zhCN = "法师训练师（仅限法师）", zhTW = "法師訓練師（僅限法師）" },
        ["Druid trainers"] = { deDE = "Druidenlehrer", frFR = "Maîtres des druides", esES = "Instructores de druidas", itIT = "Istruttori dei druidi",
            ptBR = "Instrutores de druidas", ruRU = "Наставники друидов", koKR = "드루이드 상급 교관", zhCN = "德鲁伊训练师", zhTW = "德魯伊訓練師" },
        ["Rogue trainers"] = { deDE = "Schurkenlehrer", frFR = "Maîtres des voleurs", esES = "Instructores de pícaros", itIT = "Istruttori dei ladri",
            ptBR = "Instrutores de ladinos", ruRU = "Наставники разбойников", koKR = "도적 상급 교관", zhCN = "潜行者训练师", zhTW = "盜賊訓練師" },
        ["Warrior trainers"] = { deDE = "Kriegerlehrer", frFR = "Maîtres des guerriers", esES = "Instructores de guerreros", itIT = "Istruttori dei guerrieri",
            ptBR = "Instrutores de guerreiros", ruRU = "Наставники воинов", koKR = "전사 상급 교관", zhCN = "战士训练师", zhTW = "戰士訓練師" },
    }
    for english, texts in pairs(PLACES) do
        for lang, text in pairs(texts) do
            local content = FDJ.ContentLocales and FDJ.ContentLocales[lang]
            if content then
                content.places = content.places or {}
                if content.places[english] == nil then content.places[english] = text end
            end
        end
    end


    for _, content in pairs(FDJ.ContentLocales or {}) do
        local from = type(content) == "table" and content.quests and content.quests[1947]
        if type(from) == "table" then
            local q = content.quests[1953] or {}
            content.quests[1953] = q
            for _, f in ipairs({ "pickup", "pickupAlliance", "pickupHorde" }) do
                if q[f] == nil then q[f] = from[f] end
            end
        end
    end
end




do
    local PAGES = {
        ["The Deadmines"] = { 2041 },
        ["Excavation Site: Wetlands"] = { 95737 },
        ["Gnomeregan"] = { 2923, 2925, 2931 },
    }
    local NAME = {}
    for _, list in pairs(FDJ.QUEST_BREADCRUMBS) do
        for _, crumb in ipairs(list) do NAME[crumb.id] = crumb.name end
    end
    for dungeonName, ids in pairs(PAGES) do
        local dungeon = FDJ.DB and FDJ.DB[dungeonName]
        if type(dungeon) == "table" and type(dungeon.quests) == "table" then
            local have = {}
            for _, q in ipairs(dungeon.quests) do if type(q) == "table" and q.id then have[q.id] = true end end
            for _, id in ipairs(ids) do
                local d = D[id]
                if d and not have[id] then
                    dungeon.quests[#dungeon.quests + 1] = {
                        id = id, name = NAME[id], level = d.level, requires = d.requires, faction = d.faction or "Alliance",
                        objective = d.objective, pickup = d.pickup, turnin = d.turnin,
                        hideFromMainList = true, dungeonStep = false,
                    }
                end
                if d and d.map and FDJ.QUEST_START_MAPS and FDJ.QUEST_START_MAPS[id] == nil then FDJ.QUEST_START_MAPS[id] = d.map end
            end
        end
    end
end


FDJ.BREADCRUMB_ICON_ITEM = 4540

do
    local lines = {
        BREADCRUMB_NOTE = {
            enUS = "This is a breadcrumb quest. It is optional: you do not need to pick it up.",
            deDE = "Dies ist eine Hinführungsquest. Sie ist optional: Ihr müsst sie nicht annehmen.",
            frFR = "Ceci est une quête d'introduction. Elle est facultative : vous n'avez pas besoin de la prendre.",
            esES = "Esta es una misión de introducción. Es opcional: no necesitas aceptarla.",
            itIT = "Questa è una missione introduttiva. È facoltativa: non serve prenderla.",
            ptBR = "Esta é uma missão introdutória. Ela é opcional: você não precisa pegá-la.",
            ruRU = "Это вводное задание. Оно необязательное: брать его не нужно.",
            koKR = "이 퀘스트는 안내 퀘스트입니다. 선택 사항이므로 받지 않아도 됩니다.",
            zhCN = "这是一个引导任务。它是可选的：你不需要接取它。",
            zhTW = "這是一個引導任務。它是可選的：你不需要接取它。",
        },
        BREADCRUMB_LABEL = {
            enUS = "Breadcrumb quest (optional)",
            deDE = "Hinführungsquest (optional)",
            frFR = "Quête d'introduction (facultative)",
            esES = "Misión de introducción (opcional)",
            itIT = "Missione introduttiva (facoltativa)",
            ptBR = "Missão introdutória (opcional)",
            ruRU = "Вводное задание (необязательно)",
            koKR = "안내 퀘스트 (선택)",
            zhCN = "引导任务（可选）",
            zhTW = "引導任務（可選）",
        },
        BREADCRUMB_SHOW = {
            enUS = "Show Breadcrumb Quests (%d)",
            deDE = "Hinführungsquests anzeigen (%d)",
            frFR = "Afficher les quêtes d'introduction (%d)",
            esES = "Mostrar misiones de introducción (%d)",
            itIT = "Mostra missioni introduttive (%d)",
            ptBR = "Mostrar missões introdutórias (%d)",
            ruRU = "Показать вводные задания (%d)",
            koKR = "안내 퀘스트 보기 (%d)",
            zhCN = "显示引导任务 (%d)",
            zhTW = "顯示引導任務 (%d)",
        },
        BREADCRUMB_HIDE = {
            enUS = "Hide Breadcrumb Quests (%d)",
            deDE = "Hinführungsquests ausblenden (%d)",
            frFR = "Masquer les quêtes d'introduction (%d)",
            esES = "Ocultar misiones de introducción (%d)",
            itIT = "Nascondi missioni introduttive (%d)",
            ptBR = "Ocultar missões introdutórias (%d)",
            ruRU = "Скрыть вводные задания (%d)",
            koKR = "안내 퀘스트 숨기기 (%d)",
            zhCN = "隐藏引导任务 (%d)",
            zhTW = "隱藏引導任務 (%d)",
        },
    }
    for key, texts in pairs(lines) do
        texts.esMX = texts.esES
        for locale, text in pairs(texts) do
            local t = FDJ.Locales and FDJ.Locales[locale]
            if t and t[key] == nil then t[key] = text end
        end
    end
end
