




































local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end

do
    local strings = {
        enUS = {
            PVP_BACK = "Back to Battlegrounds", PVP_HONOR_TITLE = "Honor & Ranks", PVP_HONOR_META = "Premier gear and rank rewards",
            PVP_STANDING_NOW = "Your standing: %s", PVP_QUARTERMASTER = "Quartermaster: %s",
            PVP_QUEST_REWARDS = "Quest rewards", PVP_MOUNTS = "Mounts", PVP_SUPPLIES = "Supplies", PVP_QUESTS = "Quests",
            PVP_LEVEL = "Level %s", PVP_CHOOSE_ONE = "Choose one: Hero of the battle (level 58)", PVP_FROM_QUEST = "From a quest at Exalted",
            PVP_HONOR = "Honor", PVP_COST = "%s Honor + %d %s", PVP_COST_HONOR = "%s Honor",
            PVP_PREMIER = "Premier gear",
            PVP_PREMIER_TEXT = "Level 55 rare pieces for Honor and battleground Marks; no PvP rank needed. At level 60, the matching Premier Emboldened Seal turns a piece into its epic version (right).",
            PVP_RANK = "Rank %d", PVP_SEAL_LINE = "Rank %d: %s + %s Honor", PVP_UPGRADE_WITH = "Made with %s and the rare piece.",
            PVP_RANK_REWARDS = "Rank rewards", PVP_MARKS = "Marks of Honor",
            PVP_MARKS_TEXT = "A battleground win gives 3 Marks, a loss 1. Marks pay for some Honor gear and are handed in through PvP quests; one of them takes 3 Marks from each of the four battlegrounds.",
            PVP_FIELD_TEXT = "Wizzik Dustfizz in Gadgetzan, level 60. The first three weeks give 300 Honor and 500 Rank Points each; weeks 4, 7 and 10 also give 1 Legacy Point each. Earlier weeks stay open to catch up.",
            PVP_LEGACY = "Legacy Points",
            PVP_LEGACY_TEXT = "12 PvP Legacy Points: 5 from reaching ranks 3, 7, 10, 13 and 14, 4 from Exalted with all four battleground factions of your side, and 3 from %s.",
            PVP_ARENA_TEXT = "Stranglethorn Vale: loot %s from the arena chest. Hand in 12 of them for %s.",
            PVP_ARENA = "Gurubashi Arena", PVP_HALL_A = "Champions' Hall", PVP_HALL_H = "Hall of Legends",

            PVP_STRIP_SHOW = "Click to show every level", PVP_STRIP_HIDE = "Click to hide the levels",

            PVP_BACK_REWARDS = "Back to the rewards",
            PVP_CLICK_QUEST = "Click to see the quest", PVP_SEARCH_BG = "Battleground",
            PVP_Q_INSIGNIA = "Hand in your %s to %s to receive the next rank's insignia.",
            PVP_Q_HERO = "Talk to %s and choose one of the rewards.", PVP_Q_XP = "%s XP",
            PVP_ZONE_1416 = "Alterac Mountains", PVP_ZONE_1459 = "Alterac Valley", PVP_ZONE_1453 = "Stormwind City",
        },
        deDE = {
            PVP_BACK = "Zurück zu den Schlachtfeldern", PVP_HONOR_TITLE = "Ehre & Ränge", PVP_HONOR_META = "Ehrenausrüstung und Rangbelohnungen",
            PVP_STANDING_NOW = "Dein Ruf: %s", PVP_QUARTERMASTER = "Rüstmeister: %s",
            PVP_QUEST_REWARDS = "Questbelohnungen", PVP_MOUNTS = "Reittiere", PVP_SUPPLIES = "Vorräte", PVP_QUESTS = "Quests",
            PVP_LEVEL = "Stufe %s", PVP_CHOOSE_ONE = "Eines zur Wahl: Held der Schlacht (Stufe 58)", PVP_FROM_QUEST = "Aus einer Quest bei Ehrfürchtig",
            PVP_HONOR = "Ehre", PVP_COST = "%s Ehre + %d %s", PVP_COST_HONOR = "%s Ehre",
            PVP_PREMIER = "Ehrenausrüstung",
            PVP_PREMIER_TEXT = "Seltene Teile der Stufe 55 für Ehre und Schlachtfeldmarken; kein PvP-Rang nötig. Ab Stufe 60 macht das passende Siegel aus einem Teil seine epische Fassung (rechts).",
            PVP_RANK = "Rang %d", PVP_SEAL_LINE = "Rang %d: %s + %s Ehre", PVP_UPGRADE_WITH = "Entsteht aus %s und dem seltenen Teil.",
            PVP_RANK_REWARDS = "Rangbelohnungen", PVP_MARKS = "Ehrenabzeichen",
            PVP_MARKS_TEXT = "Ein Sieg auf dem Schlachtfeld bringt 3 Abzeichen, eine Niederlage 1. Abzeichen bezahlen manche Ehrenausrüstung und werden über PvP-Quests abgegeben; eine davon verlangt 3 Abzeichen von jedem der vier Schlachtfelder.",
            PVP_FIELD_TEXT = "Wizzik Dustfizz in Gadgetzan, Stufe 60. Die ersten drei Wochen bringen je 300 Ehre und 500 Rangpunkte; die Wochen 4, 7 und 10 zusätzlich je 1 Vermächtnispunkt. Frühere Wochen bleiben zum Nachholen offen.",
            PVP_LEGACY = "Vermächtnispunkte",
            PVP_LEGACY_TEXT = "12 PvP-Vermächtnispunkte: 5 für die Ränge 3, 7, 10, 13 und 14, 4 für Ehrfürchtig bei allen vier Schlachtfeldfraktionen deiner Seite und 3 aus %s.",
            PVP_ARENA_TEXT = "Schlingendorntal: Plündere %s aus der Truhe der Arena. Gib 12 davon für %s ab.",
            PVP_ARENA = "Arena der Gurubashi", PVP_HALL_A = "Halle der Champions", PVP_HALL_H = "Halle der Legenden",

            PVP_STRIP_SHOW = "Klicken, um alle Stufen anzuzeigen", PVP_STRIP_HIDE = "Klicken, um die Stufen auszublenden",

            PVP_BACK_REWARDS = "Zurück zu den Belohnungen",
            PVP_CLICK_QUEST = "Klicken, um die Quest anzuzeigen", PVP_SEARCH_BG = "Schlachtfeld",
            PVP_Q_INSIGNIA = "Gib dein %s bei %s ab, um das Abzeichen des nächsten Rangs zu erhalten.",
            PVP_Q_HERO = "Sprich mit %s und wähle eine der Belohnungen.", PVP_Q_XP = "%s EP",
            PVP_ZONE_1416 = "Alteracgebirge", PVP_ZONE_1459 = "Alteractal", PVP_ZONE_1453 = "Sturmwind",
        },
        frFR = {
            PVP_BACK = "Retour aux champs de bataille", PVP_HONOR_TITLE = "Honneur et rangs", PVP_HONOR_META = "Équipement d'honneur et récompenses de rang",
            PVP_STANDING_NOW = "Votre réputation : %s", PVP_QUARTERMASTER = "Intendant : %s",
            PVP_QUEST_REWARDS = "Récompenses de quête", PVP_MOUNTS = "Montures", PVP_SUPPLIES = "Fournitures", PVP_QUESTS = "Quêtes",
            PVP_LEVEL = "Niveau %s", PVP_CHOOSE_ONE = "Au choix : héros de la bataille (niveau 58)", PVP_FROM_QUEST = "Récompense d'une quête à Exalté",
            PVP_HONOR = "Honneur", PVP_COST = "%s Honneur + %d %s", PVP_COST_HONOR = "%s Honneur",
            PVP_PREMIER = "Équipement d'honneur",
            PVP_PREMIER_TEXT = "Pièces rares de niveau 55 contre de l'Honneur et des marques de champ de bataille ; aucun rang JcJ requis. Au niveau 60, le sceau correspondant transforme une pièce en sa version épique (à droite).",
            PVP_RANK = "Rang %d", PVP_SEAL_LINE = "Rang %d : %s + %s Honneur", PVP_UPGRADE_WITH = "Obtenu avec %s et la pièce rare.",
            PVP_RANK_REWARDS = "Récompenses de rang", PVP_MARKS = "Marques d'honneur",
            PVP_MARKS_TEXT = "Une victoire en champ de bataille rapporte 3 marques, une défaite 1. Les marques paient une partie de l'équipement d'Honneur et se rendent via des quêtes JcJ ; l'une d'elles demande 3 marques de chacun des quatre champs de bataille.",
            PVP_FIELD_TEXT = "Wizzik Dustfizz à Gadgetzan, niveau 60. Les trois premières semaines rapportent chacune 300 Honneur et 500 points de rang ; les semaines 4, 7 et 10 donnent aussi 1 point d'héritage chacune. Les semaines précédentes restent ouvertes pour rattraper.",
            PVP_LEGACY = "Points d'héritage",
            PVP_LEGACY_TEXT = "12 points d'héritage JcJ : 5 en atteignant les rangs 3, 7, 10, 13 et 14, 4 en étant Exalté auprès des quatre factions de champ de bataille de votre camp, et 3 grâce à %s.",
            PVP_ARENA_TEXT = "Vallée de Strangleronce : récupérez %s dans le coffre de l'arène. Rendez-en 12 pour obtenir %s.",
            PVP_ARENA = "Arène des Gurubashi", PVP_HALL_A = "Hall des Champions", PVP_HALL_H = "Hall des Légendes",

            PVP_STRIP_SHOW = "Cliquez pour afficher tous les niveaux", PVP_STRIP_HIDE = "Cliquez pour masquer les niveaux",

            PVP_BACK_REWARDS = "Retour aux récompenses",
            PVP_CLICK_QUEST = "Cliquez pour voir la quête", PVP_SEARCH_BG = "Champ de bataille",
            PVP_Q_INSIGNIA = "Remettez votre %s à %s pour recevoir l'insigne du rang suivant.",
            PVP_Q_HERO = "Parlez à %s et choisissez l'une des récompenses.", PVP_Q_XP = "%s PX",
            PVP_ZONE_1416 = "Montagnes d'Alterac", PVP_ZONE_1459 = "Vallée d'Alterac", PVP_ZONE_1453 = "Hurlevent",
        },
        esES = {
            PVP_BACK = "Volver a los campos de batalla", PVP_HONOR_TITLE = "Honor y rangos", PVP_HONOR_META = "Equipo de honor y recompensas de rango",
            PVP_STANDING_NOW = "Tu reputación: %s", PVP_QUARTERMASTER = "Intendente: %s",
            PVP_QUEST_REWARDS = "Recompensas de misión", PVP_MOUNTS = "Monturas", PVP_SUPPLIES = "Suministros", PVP_QUESTS = "Misiones",
            PVP_LEVEL = "Nivel %s", PVP_CHOOSE_ONE = "A elegir uno: héroe de la batalla (nivel 58)", PVP_FROM_QUEST = "De una misión en Exaltado",
            PVP_HONOR = "Honor", PVP_COST = "%s Honor + %d %s", PVP_COST_HONOR = "%s Honor",
            PVP_PREMIER = "Equipo de honor",
            PVP_PREMIER_TEXT = "Piezas raras de nivel 55 por Honor y marcas de campo de batalla; no hace falta rango JcJ. Al nivel 60, el sello correspondiente convierte una pieza en su versión épica (a la derecha).",
            PVP_RANK = "Rango %d", PVP_SEAL_LINE = "Rango %d: %s + %s Honor", PVP_UPGRADE_WITH = "Se obtiene con %s y la pieza rara.",
            PVP_RANK_REWARDS = "Recompensas de rango", PVP_MARKS = "Marcas de Honor",
            PVP_MARKS_TEXT = "Una victoria en un campo de batalla da 3 marcas, una derrota 1. Las marcas pagan parte del equipo de Honor y se entregan en misiones JcJ; una de ellas pide 3 marcas de cada uno de los cuatro campos de batalla.",
            PVP_FIELD_TEXT = "Wizzik Dustfizz en Gadgetzan, nivel 60. Las tres primeras semanas dan 300 de Honor y 500 puntos de rango cada una; las semanas 4, 7 y 10 dan además 1 punto de legado cada una. Las semanas anteriores siguen abiertas para ponerse al día.",
            PVP_LEGACY = "Puntos de legado",
            PVP_LEGACY_TEXT = "12 puntos de legado JcJ: 5 al alcanzar los rangos 3, 7, 10, 13 y 14, 4 por Exaltado con las cuatro facciones de campo de batalla de tu bando y 3 de %s.",
            PVP_ARENA_TEXT = "Vega de Tuercespina: consigue %s del cofre de la arena. Entrega 12 para obtener %s.",
            PVP_ARENA = "Arena Gurubashi", PVP_HALL_A = "Sala de los Campeones", PVP_HALL_H = "Sala de las Leyendas",

            PVP_STRIP_SHOW = "Haz clic para ver todos los niveles", PVP_STRIP_HIDE = "Haz clic para ocultar los niveles",

            PVP_BACK_REWARDS = "Volver a las recompensas",
            PVP_CLICK_QUEST = "Haz clic para ver la misión", PVP_SEARCH_BG = "Campo de batalla",
            PVP_Q_INSIGNIA = "Entrega tu %s a %s para recibir la insignia del siguiente rango.",
            PVP_Q_HERO = "Habla con %s y elige una de las recompensas.", PVP_Q_XP = "%s PX",
            PVP_ZONE_1416 = "Montañas de Alterac", PVP_ZONE_1459 = "Valle de Alterac", PVP_ZONE_1453 = "Ventormenta",
        },
        itIT = {
            PVP_BACK = "Torna ai campi di battaglia", PVP_HONOR_TITLE = "Onore e gradi", PVP_HONOR_META = "Equipaggiamento d'onore e ricompense di grado",
            PVP_STANDING_NOW = "La tua reputazione: %s", PVP_QUARTERMASTER = "Furiere: %s",
            PVP_QUEST_REWARDS = "Ricompense delle missioni", PVP_MOUNTS = "Cavalcature", PVP_SUPPLIES = "Provviste", PVP_QUESTS = "Missioni",
            PVP_LEVEL = "Livello %s", PVP_CHOOSE_ONE = "Uno a scelta: eroe della battaglia (livello 58)", PVP_FROM_QUEST = "Da una missione a Osannato",
            PVP_HONOR = "Onore", PVP_COST = "%s Onore + %d %s", PVP_COST_HONOR = "%s Onore",
            PVP_PREMIER = "Equipaggiamento d'onore",
            PVP_PREMIER_TEXT = "Pezzi rari di livello 55 in cambio di Onore e marchi dei campi di battaglia; nessun grado PvP richiesto. Al livello 60, il sigillo corrispondente trasforma un pezzo nella sua versione epica (a destra).",
            PVP_RANK = "Grado %d", PVP_SEAL_LINE = "Grado %d: %s + %s Onore", PVP_UPGRADE_WITH = "Si ottiene con %s e il pezzo raro.",
            PVP_RANK_REWARDS = "Ricompense di grado", PVP_MARKS = "Marchi d'Onore",
            PVP_MARKS_TEXT = "Una vittoria in un campo di battaglia dà 3 marchi, una sconfitta 1. I marchi pagano parte dell'equipaggiamento d'Onore e si consegnano tramite missioni PvP; una di esse chiede 3 marchi da ciascuno dei quattro campi di battaglia.",
            PVP_FIELD_TEXT = "Wizzik Dustfizz a Meccania, livello 60. Le prime tre settimane danno 300 Onore e 500 punti grado ciascuna; le settimane 4, 7 e 10 danno anche 1 punto eredità ciascuna. Le settimane precedenti restano aperte per recuperare.",
            PVP_LEGACY = "Punti eredità",
            PVP_LEGACY_TEXT = "12 punti eredità PvP: 5 raggiungendo i gradi 3, 7, 10, 13 e 14, 4 per Osannato con tutte e quattro le fazioni dei campi di battaglia della tua parte e 3 da %s.",
            PVP_ARENA_TEXT = "Rovotorto: prendi %s dal forziere dell'arena. Consegnane 12 per ottenere %s.",
            PVP_ARENA = "Arena dei Gurubashi", PVP_HALL_A = "Sala dei Campioni", PVP_HALL_H = "Sala delle Leggende",

            PVP_STRIP_SHOW = "Clicca per mostrare tutti i livelli", PVP_STRIP_HIDE = "Clicca per nascondere i livelli",

            PVP_BACK_REWARDS = "Torna alle ricompense",
            PVP_CLICK_QUEST = "Clicca per vedere la missione", PVP_SEARCH_BG = "Campo di battaglia",
            PVP_Q_INSIGNIA = "Consegna il tuo %s a %s per ricevere l'insegna del grado successivo.",
            PVP_Q_HERO = "Parla con %s e scegli una delle ricompense.", PVP_Q_XP = "%s PE",
            PVP_ZONE_1416 = "Montagne di Alterac", PVP_ZONE_1459 = "Valle d'Alterac", PVP_ZONE_1453 = "Roccavento",
        },
        ptBR = {
            PVP_BACK = "Voltar aos campos de batalha", PVP_HONOR_TITLE = "Honra e patentes", PVP_HONOR_META = "Equipamento de Honra e recompensas de patente",
            PVP_STANDING_NOW = "Sua reputação: %s", PVP_QUARTERMASTER = "Intendente: %s",
            PVP_QUEST_REWARDS = "Recompensas de missão", PVP_MOUNTS = "Montarias", PVP_SUPPLIES = "Suprimentos", PVP_QUESTS = "Missões",
            PVP_LEVEL = "Nível %s", PVP_CHOOSE_ONE = "Escolha um: herói da batalha (nível 58)", PVP_FROM_QUEST = "De uma missão em Exaltado",
            PVP_HONOR = "Honra", PVP_COST = "%s Honra + %d %s", PVP_COST_HONOR = "%s Honra",
            PVP_PREMIER = "Equipamento de Honra",
            PVP_PREMIER_TEXT = "Peças raras de nível 55 por Honra e marcas de campo de batalha; nenhuma patente JxJ necessária. No nível 60, o selo correspondente transforma uma peça em sua versão épica (à direita).",
            PVP_RANK = "Patente %d", PVP_SEAL_LINE = "Patente %d: %s + %s Honra", PVP_UPGRADE_WITH = "Obtido com %s e a peça rara.",
            PVP_RANK_REWARDS = "Recompensas de patente", PVP_MARKS = "Marcas de Honra",
            PVP_MARKS_TEXT = "Uma vitória em campo de batalha dá 3 marcas, uma derrota 1. As marcas pagam parte do equipamento de Honra e são entregues em missões JxJ; uma delas pede 3 marcas de cada um dos quatro campos de batalha.",
            PVP_FIELD_TEXT = "Wizzik Dustfizz em Geringontzan, nível 60. As três primeiras semanas dão 300 de Honra e 500 pontos de patente cada; as semanas 4, 7 e 10 também dão 1 ponto de legado cada. As semanas anteriores continuam abertas para recuperar.",
            PVP_LEGACY = "Pontos de legado",
            PVP_LEGACY_TEXT = "12 pontos de legado JxJ: 5 ao alcançar as patentes 3, 7, 10, 13 e 14, 4 por Exaltado com as quatro facções de campo de batalha do seu lado e 3 de %s.",
            PVP_ARENA_TEXT = "Selva do Espinhaço: pegue %s no baú da arena. Entregue 12 deles para obter %s.",
            PVP_ARENA = "Arena de Gurubashi", PVP_HALL_A = "Salão dos Campeões", PVP_HALL_H = "Salão dos Lendários",

            PVP_STRIP_SHOW = "Clique para mostrar todos os níveis", PVP_STRIP_HIDE = "Clique para ocultar os níveis",

            PVP_BACK_REWARDS = "Voltar às recompensas",
            PVP_CLICK_QUEST = "Clique para ver a missão", PVP_SEARCH_BG = "Campo de batalha",
            PVP_Q_INSIGNIA = "Entregue seu %s a %s para receber a insígnia da próxima patente.",
            PVP_Q_HERO = "Fale com %s e escolha uma das recompensas.", PVP_Q_XP = "%s XP",
            PVP_ZONE_1416 = "Montanhas de Alterac", PVP_ZONE_1459 = "Vale Alterac", PVP_ZONE_1453 = "Ventobravo",
        },
        ruRU = {
            PVP_BACK = "Назад к полям боя", PVP_HONOR_TITLE = "Честь и звания", PVP_HONOR_META = "Снаряжение за честь и награды за звания",
            PVP_STANDING_NOW = "Ваша репутация: %s", PVP_QUARTERMASTER = "Интендант: %s",
            PVP_QUEST_REWARDS = "Награды за задания", PVP_MOUNTS = "Средства передвижения", PVP_SUPPLIES = "Припасы", PVP_QUESTS = "Задания",
            PVP_LEVEL = "Уровень %s", PVP_CHOOSE_ONE = "На выбор: герой битвы (58-й уровень)", PVP_FROM_QUEST = "Награда за задание при превознесении",
            PVP_HONOR = "Честь", PVP_COST = "%s чести + %d %s", PVP_COST_HONOR = "%s чести",
            PVP_PREMIER = "Снаряжение за честь",
            PVP_PREMIER_TEXT = "Редкие вещи 55-го уровня за честь и знаки полей боя; звание PvP не нужно. На 60-м уровне подходящая печать превращает вещь в ее эпическую версию (справа).",
            PVP_RANK = "Звание %d", PVP_SEAL_LINE = "Звание %d: %s + %s чести", PVP_UPGRADE_WITH = "Получается из: %s и редкой вещи.",
            PVP_RANK_REWARDS = "Награды за звания", PVP_MARKS = "Знаки отличия",
            PVP_MARKS_TEXT = "Победа на поле боя дает 3 знака, поражение — 1. Знаками оплачивается часть снаряжения за честь, их сдают в PvP-заданиях; одно из них требует по 3 знака с каждого из четырех полей боя.",
            PVP_FIELD_TEXT = "Wizzik Dustfizz в Прибамбасске, 60-й уровень. Первые три недели дают по 300 чести и 500 очков звания; недели 4, 7 и 10 дают еще по 1 очку наследия. Прошлые недели остаются открытыми, чтобы наверстать.",
            PVP_LEGACY = "Очки наследия",
            PVP_LEGACY_TEXT = "12 очков наследия PvP: 5 за звания 3, 7, 10, 13 и 14, 4 за превознесение у всех четырех фракций полей боя вашей стороны и 3 за %s.",
            PVP_ARENA_TEXT = "Тернистая долина: заберите %s из сундука арены. Сдайте 12 штук, чтобы получить %s.",
            PVP_ARENA = "Арена Гурубаши", PVP_HALL_A = "Зал Защитников", PVP_HALL_H = "Зал Легенд",

            PVP_STRIP_SHOW = "Щелкните, чтобы показать все уровни", PVP_STRIP_HIDE = "Щелкните, чтобы скрыть уровни",

            PVP_BACK_REWARDS = "Назад к наградам",
            PVP_CLICK_QUEST = "Щелкните, чтобы увидеть задание", PVP_SEARCH_BG = "Поле боя",
            PVP_Q_INSIGNIA = "Сдайте «%s» (%s), чтобы получить знак следующего ранга.",
            PVP_Q_HERO = "Поговорите: %s — и выберите одну из наград.", PVP_Q_XP = "%s опыта",
            PVP_ZONE_1416 = "Альтеракские горы", PVP_ZONE_1459 = "Альтеракская долина", PVP_ZONE_1453 = "Штормград",
        },
        koKR = {
            PVP_BACK = "전장으로 돌아가기", PVP_HONOR_TITLE = "명예와 계급", PVP_HONOR_META = "명예 장비와 계급 보상",
            PVP_STANDING_NOW = "내 평판: %s", PVP_QUARTERMASTER = "병참장교: %s",
            PVP_QUEST_REWARDS = "퀘스트 보상", PVP_MOUNTS = "탈것", PVP_SUPPLIES = "보급품", PVP_QUESTS = "퀘스트",
            PVP_LEVEL = "레벨 %s", PVP_CHOOSE_ONE = "하나 선택: 전투의 영웅 (58레벨)", PVP_FROM_QUEST = "확고한 동맹 퀘스트 보상",
            PVP_HONOR = "명예", PVP_COST = "명예 %s + %d %s", PVP_COST_HONOR = "명예 %s",
            PVP_PREMIER = "명예 장비",
            PVP_PREMIER_TEXT = "명예와 전장 증표로 사는 55레벨 희귀 장비이며 PvP 계급은 필요 없습니다. 60레벨에 알맞은 인장을 쓰면 장비가 영웅 등급(오른쪽)이 됩니다.",
            PVP_RANK = "%d계급", PVP_SEAL_LINE = "%d계급: %s + 명예 %s", PVP_UPGRADE_WITH = "%s 아이템과 희귀 장비로 만듭니다.",
            PVP_RANK_REWARDS = "계급 보상", PVP_MARKS = "명예의 증표",
            PVP_MARKS_TEXT = "전장에서 이기면 증표 3개, 지면 1개를 받습니다. 증표는 일부 명예 장비 구매에 쓰이고 PvP 퀘스트로 반납합니다. 그중 하나는 네 전장의 증표를 3개씩 요구합니다.",
            PVP_FIELD_TEXT = "가젯잔의 Wizzik Dustfizz, 60레벨. 처음 세 주는 각각 명예 300과 계급 점수 500을 줍니다. 4, 7, 10주차는 유산 점수 1점도 줍니다. 지난 주차도 따라잡을 수 있게 열려 있습니다.",
            PVP_LEGACY = "유산 점수",
            PVP_LEGACY_TEXT = "PvP 유산 점수 12점: 3, 7, 10, 13, 14계급 달성으로 5점, 내 진영 전장 세력 넷 모두와 확고한 동맹으로 4점, %s에서 3점.",
            PVP_ARENA_TEXT = "가시덤불 골짜기: 투기장 상자에서 %s 아이템을 얻으세요. 12개를 반납하면 %s 아이템을 받습니다.",
            PVP_ARENA = "구루바시 투기장", PVP_HALL_A = "용사의 전당", PVP_HALL_H = "전설의 전당",

            PVP_STRIP_SHOW = "클릭하여 모든 레벨 보기", PVP_STRIP_HIDE = "클릭하여 레벨 숨기기",

            PVP_BACK_REWARDS = "보상으로 돌아가기",
            PVP_CLICK_QUEST = "클릭하여 퀘스트 보기", PVP_SEARCH_BG = "전장",
            PVP_Q_INSIGNIA = "%s|1을;를; %s에게 건네고 다음 계급의 휘장을 받으세요.",
            PVP_Q_HERO = "%s|1과;와; 대화하고 보상 하나를 고르세요.", PVP_Q_XP = "경험치 %s",
            PVP_ZONE_1416 = "알터랙 산맥", PVP_ZONE_1459 = "알터랙 계곡", PVP_ZONE_1453 = "스톰윈드",
        },
        zhCN = {
            PVP_BACK = "返回战场", PVP_HONOR_TITLE = "荣誉与军衔", PVP_HONOR_META = "荣誉装备和军衔奖励",
            PVP_STANDING_NOW = "你的声望：%s", PVP_QUARTERMASTER = "军需官：%s",
            PVP_QUEST_REWARDS = "任务奖励", PVP_MOUNTS = "坐骑", PVP_SUPPLIES = "补给品", PVP_QUESTS = "任务",
            PVP_LEVEL = "等级%s", PVP_CHOOSE_ONE = "任选一件：战斗英雄（58级）", PVP_FROM_QUEST = "崇拜声望任务奖励",
            PVP_HONOR = "荣誉", PVP_COST = "%s荣誉 + %d %s", PVP_COST_HONOR = "%s荣誉",
            PVP_PREMIER = "荣誉装备",
            PVP_PREMIER_TEXT = "55级精良装备，用荣誉和战场徽章购买，无需PvP军衔。60级时，对应的徽记可将装备升级为史诗版本（右侧）。",
            PVP_RANK = "军衔%d", PVP_SEAL_LINE = "军衔%d：%s + %s荣誉", PVP_UPGRADE_WITH = "由%s和精良装备制成。",
            PVP_RANK_REWARDS = "军衔奖励", PVP_MARKS = "荣誉印记",
            PVP_MARKS_TEXT = "战场胜利获得3个印记，失败获得1个。印记可用于购买部分荣誉装备，也可在PvP任务中上交；其中一个任务需要四个战场各3个印记。",
            PVP_FIELD_TEXT = "加基森的Wizzik Dustfizz，60级。前三周每周给予300荣誉和500军衔点数；第4、7、10周另外各给予1点传承点数。之前的周次仍可补做。",
            PVP_LEGACY = "传承点数",
            PVP_LEGACY_TEXT = "12点PvP传承点数：达到军衔3、7、10、13和14共5点，与你阵营全部四个战场阵营达到崇拜共4点，%s共3点。",
            PVP_ARENA_TEXT = "荆棘谷：从竞技场宝箱中拾取%s。上交12个可换取%s。",
            PVP_ARENA = "古拉巴什竞技场", PVP_HALL_A = "勇士大厅", PVP_HALL_H = "传说大厅",

            PVP_STRIP_SHOW = "点击显示所有等级", PVP_STRIP_HIDE = "点击隐藏等级",

            PVP_BACK_REWARDS = "返回奖励",
            PVP_CLICK_QUEST = "点击查看任务", PVP_SEARCH_BG = "战场",
            PVP_Q_INSIGNIA = "把你的%s交给%s，领取下一级的徽章。",
            PVP_Q_HERO = "与%s交谈，选择一件奖励。", PVP_Q_XP = "%s点经验值",
            PVP_ZONE_1416 = "奥特兰克山脉", PVP_ZONE_1459 = "奥特兰克山谷", PVP_ZONE_1453 = "暴风城",
        },
        zhTW = {
            PVP_BACK = "返回戰場", PVP_HONOR_TITLE = "榮譽與軍階", PVP_HONOR_META = "榮譽裝備與軍階獎勵",
            PVP_STANDING_NOW = "你的聲望：%s", PVP_QUARTERMASTER = "軍需官：%s",
            PVP_QUEST_REWARDS = "任務獎勵", PVP_MOUNTS = "坐騎", PVP_SUPPLIES = "補給品", PVP_QUESTS = "任務",
            PVP_LEVEL = "等級%s", PVP_CHOOSE_ONE = "任選一件：戰鬥英雄（58級）", PVP_FROM_QUEST = "崇拜聲望任務獎勵",
            PVP_HONOR = "榮譽", PVP_COST = "%s榮譽 + %d %s", PVP_COST_HONOR = "%s榮譽",
            PVP_PREMIER = "榮譽裝備",
            PVP_PREMIER_TEXT = "55級精良裝備，以榮譽和戰場徽章購買，不需要PvP軍階。60級時，對應的徽印可將裝備升級為史詩版本（右側）。",
            PVP_RANK = "軍階%d", PVP_SEAL_LINE = "軍階%d：%s + %s榮譽", PVP_UPGRADE_WITH = "由%s和精良裝備製成。",
            PVP_RANK_REWARDS = "軍階獎勵", PVP_MARKS = "榮譽印記",
            PVP_MARKS_TEXT = "戰場勝利獲得3個印記，失敗獲得1個。印記可用來購買部分榮譽裝備，也可在PvP任務中繳交；其中一個任務需要四個戰場各3個印記。",
            PVP_FIELD_TEXT = "加基森的Wizzik Dustfizz，60級。前三週每週給予300榮譽和500軍階點數；第4、7、10週另外各給予1點傳承點數。先前的週次仍可補做。",
            PVP_LEGACY = "傳承點數",
            PVP_LEGACY_TEXT = "12點PvP傳承點數：達到軍階3、7、10、13和14共5點，與你陣營全部四個戰場陣營達到崇拜共4點，%s共3點。",
            PVP_ARENA_TEXT = "荊棘谷：從競技場寶箱拾取%s。繳交12個可換取%s。",
            PVP_ARENA = "古拉巴什競技場", PVP_HALL_A = "勇士大廳", PVP_HALL_H = "傳說大廳",

            PVP_STRIP_SHOW = "點擊顯示所有等級", PVP_STRIP_HIDE = "點擊隱藏等級",

            PVP_BACK_REWARDS = "返回獎勵",
            PVP_CLICK_QUEST = "點擊查看任務", PVP_SEARCH_BG = "戰場",
            PVP_Q_INSIGNIA = "把你的%s交給%s，領取下一級的徽章。",
            PVP_Q_HERO = "與%s交談，選擇一件獎勵。", PVP_Q_XP = "%s點經驗值",
            PVP_ZONE_1416 = "奧特蘭克山脈", PVP_ZONE_1459 = "奧特蘭克山谷", PVP_ZONE_1453 = "暴風城",
        },
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
local function Secret(v) return type(issecretvalue) == "function" and issecretvalue(v) end
local function ClientText()
    return not FDJ.CanUseClientLocalizedText or FDJ.CanUseClientLocalizedText()
end
local function Big(n)
    n = tonumber(n) or 0
    if type(BreakUpLargeNumbers) == "function" then
        local ok, s = pcall(BreakUpLargeNumbers, n)
        if ok and type(s) == "string" then return s end
    end
    return tostring(n)
end

local WHITE = "Interface\\Buttons\\WHITE8X8"
local EDGE = "Interface\\Tooltips\\UI-Tooltip-Border"
local QUEST_ICON = "Interface\\GossipFrame\\AvailableQuestIcon"
local DONE_TICK = "Interface\\RaidFrame\\ReadyCheck-Ready"
local CLASS_ICONS = "Interface\\GLUES\\CHARACTERCREATE\\UI-CharacterCreate-Classes"
local CLASS_ORDER = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" }
local ROW_H, ROW_GAP, COL_GAP = 46, 6, 10
local ROW_H_C = 28
local page






local function Compact()
    local db = type(ForeverDungeonJournalDB) == "table" and ForeverDungeonJournalDB or nil
    if page and page.key == "HONOR" then return db ~= nil and db.pvpCompact == true end
    return not (db and db.pvpBGDetailed == true)
end

local function Theme()
    local t = FDJ.THEMES and FDJ.THEMES["Hall of Thanes"]
    return t or { border = { 0.52, 0.36, 0.16, 1 }, lootRow = { 0.17, 0.11, 0.06, 0.94 }, rowSelected = { 0.36, 0.22, 0.08, 0.95 },
        title = { 1.00, 0.80, 0.34 }, text = { 0.93, 0.84, 0.66 }, muted = { 0.82, 0.74, 0.60 } }
end


local function ItemData(id)
    local getInfo = (C_Item and C_Item.GetItemInfo) or GetItemInfo
    if type(getInfo) ~= "function" then return nil end
    local ok, name, link, quality = pcall(getInfo, id)
    if not ok or Secret(name) then return nil end
    if type(name) ~= "string" or name == "" then
        if C_Item and type(C_Item.RequestLoadItemDataByID) == "function" then pcall(C_Item.RequestLoadItemDataByID, id) end
        return nil
    end
    return name, link, tonumber(quality)
end
local function ItemName(id)
    local name = ClientText() and ItemData(id) or nil
    return name or (FDJ.PVP_ITEM_NAMES and FDJ.PVP_ITEM_NAMES[id]) or ("item " .. tostring(id))
end
local function ItemIcon(id)
    local get = (C_Item and C_Item.GetItemIconByID) or GetItemIcon
    if type(get) == "function" then
        local ok, icon = pcall(get, id)
        if ok and icon then return icon end
    end
    return "Interface\\Icons\\INV_Misc_QuestionMark"
end
local function Inline(id) return "|T" .. tostring(ItemIcon(id)) .. ":14:14:0:0|t" end
local function QualityRGB(q)
    q = tonumber(q) or 1
    if C_Item and type(C_Item.GetItemQualityColor) == "function" then
        local ok, r, g, b = pcall(C_Item.GetItemQualityColor, q)
        if ok and tonumber(r) then return r, g, b end
    end
    if type(GetItemQualityColor) == "function" then
        local ok, r, g, b = pcall(GetItemQualityColor, q)
        if ok and tonumber(r) then return r, g, b end
    end
    local c = ({ [1] = { 1, 1, 1 }, [2] = { 0.12, 1, 0 }, [3] = { 0, 0.44, 0.87 }, [4] = { 0.64, 0.21, 0.93 } })[q] or { 1, 1, 1 }
    return c[1], c[2], c[3]
end

local function Level()
    if type(UnitLevel) ~= "function" then return 0 end
    local ok, v = pcall(UnitLevel, "player")
    if not ok or Secret(v) then return 0 end
    return tonumber(v) or 0
end
local function OwnSide()
    local side = FDJ.PlayerFaction and FDJ.PlayerFaction() or nil
    if side ~= "Alliance" and side ~= "Horde" and type(UnitFactionGroup) == "function" then
        local ok, f = pcall(UnitFactionGroup, "player")
        if ok and not Secret(f) then side = f end
    end
    return (side == "Horde") and "Horde" or "Alliance"
end
local function OwnClass()
    if type(UnitClass) ~= "function" then return "WARRIOR" end
    local ok, _, token = pcall(UnitClass, "player")
    if ok and type(token) == "string" and not Secret(token) then return token end
    return "WARRIOR"
end
local function ClassName(token)
    local t = type(LOCALIZED_CLASS_NAMES_MALE) == "table" and LOCALIZED_CLASS_NAMES_MALE[token]
    return (type(t) == "string" and t ~= "") and t or (token:sub(1, 1) .. token:sub(2):lower())
end
local STANDING_EN = { "Hated", "Hostile", "Unfriendly", "Neutral", "Friendly", "Honored", "Revered", "Exalted" }
local function StandingLabel(n)
    local sex = 2
    if type(UnitSex) == "function" then local ok, v = pcall(UnitSex, "player") if ok and tonumber(v) and not Secret(v) then sex = v end end
    if type(GetText) == "function" then
        local ok, text = pcall(GetText, "FACTION_STANDING_LABEL" .. n, sex)
        if ok and type(text) == "string" and text ~= "" and not text:find("^FACTION_STANDING") then return text end
    end
    local g = _G["FACTION_STANDING_LABEL" .. n]
    return (type(g) == "string" and g ~= "") and g or STANDING_EN[n] or "?"
end


local function Reputation(factionID, english)
    if C_Reputation and type(C_Reputation.GetFactionDataByID) == "function" then
        local ok, d = pcall(C_Reputation.GetFactionDataByID, factionID)
        if ok and type(d) == "table" and type(d.name) == "string" and not Secret(d.name) then
            local low, high, cur = tonumber(d.currentReactionThreshold) or 0, tonumber(d.nextReactionThreshold) or 0, tonumber(d.currentStanding) or 0
            if Secret(d.reaction) then return (ClientText() and d.name) or english, nil end
            return (ClientText() and d.name) or english, tonumber(d.reaction), cur - low, high - low
        end
    end
    if type(GetFactionInfoByID) == "function" then
        local ok, name, _, standing, low, high, value = pcall(GetFactionInfoByID, factionID)
        if ok and type(name) == "string" and not Secret(name) then
            if Secret(standing) then return (ClientText() and name) or english, nil end
            return (ClientText() and name) or english, tonumber(standing),
                (tonumber(value) or 0) - (tonumber(low) or 0), (tonumber(high) or 0) - (tonumber(low) or 0)
        end
    end
    return english, nil
end
local function QuestTitle(id, english)
    if ClientText() and C_QuestLog and type(C_QuestLog.GetTitleForQuestID) == "function" then
        local ok, t = pcall(C_QuestLog.GetTitleForQuestID, id)
        if ok and type(t) == "string" and t ~= "" and not Secret(t) then return t end
    end

    local own = FDJ.PVP_QUEST_NAMES and FDJ.PVP_QUEST_NAMES[id]
    if type(own) == "table" and FDJ.GetLanguage then
        local lang = FDJ.GetLanguage()
        own = own[lang == "esMX" and "esES" or lang]
        if own then return own end
    end
    if FDJ.LocalizeQuestField then return FDJ.LocalizeQuestField(id, "name", english) or english end
    return english
end
local function QuestDone(id)
    if FDJ.QuestTurnedIn then
        local ok, done = pcall(FDJ.QuestTurnedIn, id)
        if ok then return done and true or false end
    end
    if C_QuestLog and type(C_QuestLog.IsQuestFlaggedCompleted) == "function" then
        local ok, done = pcall(C_QuestLog.IsQuestFlaggedCompleted, id)
        return ok and done == true
    end
    return false
end

local function FieldName()
    local t = QuestTitle(96912, "Field of Honor: Week 1")
    return (t:match("^(.-)%s*[:：]") or t)
end
local function ZoneName(mapID, english)
    if ClientText() and C_Map and type(C_Map.GetMapInfo) == "function" then
        local ok, info = pcall(C_Map.GetMapInfo, mapID)
        if ok and type(info) == "table" and type(info.name) == "string" and info.name ~= "" then return info.name end
    end
    return english
end


local pools = { rows = {}, heads = {}, texts = {}, buttons = {}, classes = {}, icons = {}, seals = {}, arrows = {} }
local used = { rows = 0, heads = 0, texts = 0, buttons = 0, classes = 0, icons = 0, seals = 0, arrows = 0 }





local function SourceName()
    if not page then return "PvP" end
    if page.key == "HONOR" then return L("PVP_HONOR_TITLE") end
    return FDJ.PvPBattlegroundName and FDJ.PvPBattlegroundName(page.key) or tostring(page.key)
end
local function FavMenu(owner, quest)
    local id = owner and owner.fdjItemID
    if not (id and FDJ.ShowItemFavouriteMenu) then return end
    local slot
    if C_Item and type(C_Item.GetItemInfoInstant) == "function" then
        local ok, _, _, _, equipLoc = pcall(C_Item.GetItemInfoInstant, id)
        if ok and type(equipLoc) == "string" and equipLoc ~= "" and type(_G[equipLoc]) == "string" then slot = _G[equipLoc] end
    end
    if GameTooltip then GameTooltip:Hide() end
    if FDJ.HideJournalItemTooltip then FDJ.HideJournalItemTooltip() end
    FDJ.ShowItemFavouriteMenu(owner, { id, owner.fdjName, slot, owner.fdjQuality }, SourceName(), nil, quest)
end
FDJ.PvPFavouriteMenu = FavMenu
local function RowClick(self, button)
    local id = self.fdjItemID
    if not id then return end
    if button == "RightButton" then FavMenu(self) return end



    if self.fdjQuestJump and page and FDJ.OpenPvPQuests
        and not (IsModifiedClick and (IsModifiedClick("CHATLINK") or IsModifiedClick("DRESSUP"))) then
        if FDJ.CloseSetStrip then FDJ.CloseSetStrip(nil, true) end
        if FDJ.HideJournalItemTooltip then FDJ.HideJournalItemTooltip() end
        if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_ABILITY_PAGE_TURN) or 836) end
        FDJ.OpenPvPQuests(page.key, page.side, self.fdjQuestJump)
        return
    end

    if not (IsModifiedClick and (IsModifiedClick("CHATLINK") or IsModifiedClick("DRESSUP")))
        and FDJ.ToggleSetStrip and FDJ.ToggleSetStrip(self) then
        return
    end
    local _, link = ItemData(id)
    if link and IsModifiedClick and IsModifiedClick("CHATLINK") and ChatEdit_InsertLink then
        if ChatEdit_InsertLink(link) then return end
    end
    if link and IsModifiedClick and IsModifiedClick("DRESSUP") and DressUpItemLink then DressUpItemLink(link) end
end
local function RowEnter(self)
    local t = Theme()
    self:SetBackdropColor(t.rowSelected[1], t.rowSelected[2], t.rowSelected[3], 1)
    if self.fdjItemID then
        if FDJ.ShowJournalItemTooltip then
            FDJ.ShowJournalItemTooltip(self, { self.fdjItemID, self.fdjName, nil, self.fdjQuality })
        end
    elseif self.fdjQuest then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(self.fdjName or "", 1.00, 0.82, 0.10)
        if self.fdjSub then GameTooltip:AddLine(self.fdjSub, 1, 1, 1, true) end
        GameTooltip:Show()
    end
end
local function RowLeave(self)
    local t = Theme()
    self:SetBackdropColor(t.lootRow[1], t.lootRow[2], t.lootRow[3], t.lootRow[4] or 1)




    if not (FDJ.SetStripKeep and FDJ.SetStripKeep(self)) then
        if FDJ.CloseSetStrip then FDJ.CloseSetStrip(self) end
        if FDJ.HideJournalItemTooltip then FDJ.HideJournalItemTooltip() end
        GameTooltip:Hide()
    end
end

local function MakeRow(parent)
    local row = CreateFrame("Button", nil, parent, "BackdropTemplate")
    row:SetHeight(ROW_H)
    row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    row:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 } })
    row.icon = row:CreateTexture(nil, "ARTWORK")
    row.icon:SetSize(34, 34)
    row.icon:SetPoint("LEFT", 8, 0)
    row.name = row:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
    row.name:SetPoint("TOPLEFT", row.icon, "TOPRIGHT", 9, -2)
    row.name:SetPoint("RIGHT", -28, 0)
    row.name:SetJustifyH("LEFT")
    row.name:SetWordWrap(false)
    row.sub = row:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
    row.sub:SetPoint("TOPLEFT", row.name, "BOTTOMLEFT", 0, -5)
    row.sub:SetPoint("RIGHT", -10, 0)
    row.sub:SetJustifyH("LEFT")
    row.sub:SetWordWrap(false)
    row.tick = row:CreateTexture(nil, "OVERLAY")
    row.tick:SetSize(18, 18)
    row.tick:SetPoint("RIGHT", -8, 0)
    row.tick:SetTexture(DONE_TICK)
    row.tick:Hide()
    row:SetScript("OnEnter", RowEnter)
    row:SetScript("OnLeave", RowLeave)
    row:SetScript("OnClick", RowClick)
    return row
end

local function Take(kind, make)
    used[kind] = used[kind] + 1
    local o = pools[kind][used[kind]]
    if not o then
        o = make(page.content)
        pools[kind][used[kind]] = o
    end
    return o
end


local function MakeHead(parent)
    local h = CreateFrame("Frame", nil, parent)
    h:SetHeight(24)
    h.text = h:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalLarge")
    h.text:SetPoint("LEFT", 2, 1)
    h.text:SetJustifyH("LEFT")
    h.line = h:CreateTexture(nil, "ARTWORK")
    h.line:SetHeight(1)
    h.line:SetPoint("BOTTOMLEFT", 0, 0)
    h.line:SetPoint("BOTTOMRIGHT", 0, 0)
    return h
end
local function MakeText(parent)
    local fs = parent:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
    fs:SetJustifyH("LEFT")
    fs:SetJustifyV("TOP")
    fs:SetWordWrap(true)
    return fs
end
local function MakeButton(parent)
    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    if FDJ.OwnFonts then FDJ.OwnFonts(b) end
    b:SetHeight(22)
    return b
end
local function MakeClass(parent)
    local b = CreateFrame("Button", nil, parent, "BackdropTemplate")
    b:SetSize(34, 34)
    b:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 } })
    b.icon = b:CreateTexture(nil, "ARTWORK")
    b.icon:SetPoint("TOPLEFT", 4, -4)
    b.icon:SetPoint("BOTTOMRIGHT", -4, 4)
    b.icon:SetTexture(CLASS_ICONS)
    b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    b:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(ClassName(self.token))
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    b:SetScript("OnClick", function(self)
        page.cls = self.token
        if page.scroll.SetVerticalScroll then page.scroll:SetVerticalScroll(0) end
        if page.Refresh then page.Refresh() end
    end)
    return b
end



local function MakePortrait(parent, size)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(size, size)
    b.disc = b:CreateTexture(nil, "BACKGROUND")
    b.disc:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask")
    b.disc:SetPoint("CENTER")
    b.disc:SetSize(size + 4, size + 4)
    b.disc:SetVertexColor(0.62, 0.46, 0.16, 1)
    b.tex = b:CreateTexture(nil, "ARTWORK")
    b.tex:SetAllPoints()
    b.hl = b:CreateTexture(nil, "HIGHLIGHT")
    b.hl:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask")
    b.hl:SetBlendMode("ADD")
    b.hl:SetAlpha(0.25)
    b.hl:SetAllPoints()
    b:SetScript("OnEnter", function(self)
        local loc = self.fdjLoc
        if not loc then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(loc.targetName or loc.label or "", 1.00, 0.82, 0.10)
        GameTooltip:AddLine(L("SHOW_LOCATION"), 1, 1, 1)
        GameTooltip:AddLine(L("ITEM_CLICK_MAP"), 0.35, 1.00, 0.35, true)
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    b:SetScript("OnClick", function(self)
        local loc = self.fdjLoc
        if loc and FDJ.MapMarkers and FDJ.MapMarkers.ShowRecordedLocationOnMap then
            FDJ.MapMarkers.ShowRecordedLocationOnMap(loc, loc.label)
        end
    end)
    return b
end
local function SetPortrait(b, loc)
    b.fdjLoc = loc
    if not loc then b:Hide() return end
    if FDJ.DrawMobPortrait and tonumber(loc.display) then
        FDJ.DrawMobPortrait(b.tex, loc.display)
    else
        b.tex:SetTexture("Interface\\CharacterFrame\\TempPortrait")
    end
    b:Show()
end


local W, Y
local function Head(text, met)
    if page.firstLine == nil then page.firstLine, page.firstKind = Y, "head" end
    local h = Take("heads", MakeHead)
    local t = Theme()
    h:ClearAllPoints()
    h:SetPoint("TOPLEFT", page.content, "TOPLEFT", 0, -Y)
    h:SetWidth(W)
    h.text:SetText(text)
    if met then h.text:SetTextColor(0.35, 1.00, 0.35) else h.text:SetTextColor(t.title[1], t.title[2], t.title[3]) end
    h.line:SetColorTexture(t.border[1], t.border[2], t.border[3], 0.8)
    h:Show()
    Y = Y + 30
end
local function Text(text, small)
    local fs = Take("texts", MakeText)
    fs:SetFontObject(small and "ForeverDJ_GameFontHighlightSmall" or "ForeverDJ_GameFontHighlight")
    fs:ClearAllPoints()
    fs:SetPoint("TOPLEFT", page.content, "TOPLEFT", 2, -Y)
    fs:SetWidth(W - 4)
    fs:SetText(text)
    local t = Theme()
    fs:SetTextColor(t.text[1], t.text[2], t.text[3])
    fs:Show()
    Y = Y + math.ceil(fs:GetStringHeight() or 14) + 10
end
local function MapButton(loc)
    local b = Take("buttons", function(parent)
        local o = MakePortrait(parent, 36)
        o.text = o:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
        o.text:SetPoint("LEFT", o, "RIGHT", 10, 0)
        o.text:SetJustifyH("LEFT")
        return o
    end)
    b:ClearAllPoints()
    b:SetPoint("TOPLEFT", page.content, "TOPLEFT", 4, -Y)
    SetPortrait(b, loc)
    b.text:SetText(FDJ.LocalizeFreeText and FDJ.LocalizeFreeText(loc.label) or loc.label)
    Y = Y + 44
end



local function QuestJump(owner, id)
    local quest = page and page.key ~= "HONOR" and id and FDJ.PvPQuestForItem and FDJ.PvPQuestForItem(page.key, page.side, id) or nil
    owner.fdjQuestJump = quest
    owner.fdjClickHint = quest and L("PVP_CLICK_QUEST") or nil
end
local function FillRow(row, spec)
    local t = Theme()
    row:SetBackdropColor(t.lootRow[1], t.lootRow[2], t.lootRow[3], t.lootRow[4] or 1)
    row:SetBackdropBorderColor(t.border[1], t.border[2], t.border[3], 1)
    row.fdjItemID, row.fdjQuest = spec.id, spec.quest
    row.fdjName, row.fdjQuality, row.fdjSub = spec.name, spec.quality, spec.sub
    row.fdjSourceText = spec.source

    row.fdjStrip = (not spec.quest) and spec.strip or nil
    row.fdjSetClick = row.fdjStrip ~= nil or nil
    row.item = spec.id and { spec.id, spec.name, nil, spec.quality } or nil
    QuestJump(row, (not spec.quest) and spec.id or nil)

    local compact = Compact()
    row:SetHeight(compact and ROW_H_C or ROW_H)
    row.icon:SetSize(compact and 20 or 34, compact and 20 or 34)
    row.icon:ClearAllPoints()
    row.icon:SetPoint("LEFT", compact and 5 or 8, 0)
    row.name:ClearAllPoints()
    if compact then
        row.name:SetPoint("LEFT", row.icon, "RIGHT", 7, 0)
    else
        row.name:SetPoint("TOPLEFT", row.icon, "TOPRIGHT", 9, -2)
    end
    row.name:SetPoint("RIGHT", -28, 0)
    row.name:SetFontObject(compact and "ForeverDJ_GameFontNormalSmall" or "ForeverDJ_GameFontNormal")
    row.sub:SetShown(not compact)
    if spec.quest then
        row.icon:SetTexture(QUEST_ICON)
        row.icon:SetTexCoord(0, 1, 0, 1)
        row.name:SetText(spec.name or "")
        row.name:SetTextColor(1.00, 0.82, 0.10)
    else
        row.icon:SetTexture(ItemIcon(spec.id))
        row.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        local name, _, q = ItemData(spec.id)
        name = (ClientText() and name) or spec.name or ItemName(spec.id)
        row.fdjName = name
        row.name:SetText(name)
        row.name:SetTextColor(QualityRGB(q or spec.quality))
    end

    if spec.id and FDJ.UpdateFavouriteIndicator then FDJ.UpdateFavouriteIndicator(row, spec.id)
    elseif row.fdjFavouriteStar then row.fdjFavouriteItemID = nil row.fdjFavouriteStar:Hide() end
    row.sub:SetText(spec.sub or "")
    row.sub:SetTextColor(t.muted[1], t.muted[2], t.muted[3])
    row.tick:SetShown(spec.done == true)
end
local function Rows(list)
    local colW = math.floor((W - COL_GAP) / 2)
    local rowH = Compact() and ROW_H_C or ROW_H
    local gap = Compact() and 4 or ROW_GAP
    for i, spec in ipairs(list) do
        if spec then
            local row = Take("rows", MakeRow)
            local col, line = (i - 1) % 2, math.floor((i - 1) / 2)
            row:ClearAllPoints()
            row:SetPoint("TOPLEFT", page.content, "TOPLEFT", col * (colW + COL_GAP), -(Y + line * (rowH + gap)))
            row:SetWidth(colW)
            FillRow(row, spec)
            row:Show()
        end
    end
    local lines = math.ceil(#list / 2)
    Y = Y + lines * (rowH + gap) + (lines > 0 and 8 or 0)
end








local ICON_C, ICON_GAP_C, LABEL_W_C = 34, 4, 132
local function IconEnter(self)
    self:SetBackdropBorderColor(1.00, 0.82, 0.10, 1)
    if self.fdjItemID and FDJ.ShowJournalItemTooltip then
        FDJ.ShowJournalItemTooltip(self, { self.fdjItemID, self.fdjName, nil, self.fdjQuality })
    end
end
local function IconLeave(self)
    local r, g, b = QualityRGB(self.fdjQ or 1)
    self:SetBackdropBorderColor(r, g, b, 1)

    if not (FDJ.SetStripKeep and FDJ.SetStripKeep(self)) then
        if FDJ.CloseSetStrip then FDJ.CloseSetStrip(self) end
        if FDJ.HideJournalItemTooltip then FDJ.HideJournalItemTooltip() end
        if GameTooltip then GameTooltip:Hide() end
    end
end
local function MakeIcon(parent)
    local b = CreateFrame("Button", nil, parent, "BackdropTemplate")
    b:SetSize(ICON_C, ICON_C)
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    b:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 } })
    b.icon = b:CreateTexture(nil, "ARTWORK")
    b.icon:SetPoint("TOPLEFT", 3, -3)
    b.icon:SetPoint("BOTTOMRIGHT", -3, 3)
    b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")


    b.glow = b:CreateTexture(nil, "OVERLAY")
    b.glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    b.glow:SetBlendMode("ADD")
    b.glow:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.glow:SetSize(math.floor(ICON_C * 1.85), math.floor(ICON_C * 1.85))
    b:SetScript("OnEnter", IconEnter)
    b:SetScript("OnLeave", IconLeave)
    b:SetScript("OnClick", RowClick)
    b.fdjStripAbove = true
    return b
end


local function PutIcon(spec, x, y)
    local b = Take("icons", MakeIcon)
    b:ClearAllPoints()
    b:SetPoint("TOPLEFT", page.content, "TOPLEFT", x, -y)
    local name, _, q = ItemData(spec.id)
    b.fdjItemID, b.fdjQuality, b.fdjQ = spec.id, spec.quality, q or spec.quality
    b.fdjName = (ClientText() and name) or spec.name or ItemName(spec.id)
    local tip = {}
    if spec.sub and spec.sub ~= "" then tip[#tip + 1] = spec.sub end
    if spec.source and spec.source ~= "" then tip[#tip + 1] = spec.source end
    b.fdjSourceText = #tip > 0 and table.concat(tip, "\n") or nil
    b.fdjStrip = spec.strip
    b.fdjSetClick = spec.strip ~= nil or nil
    b.item = { spec.id, b.fdjName, nil, spec.quality }
    QuestJump(b, spec.id)
    b.icon:SetTexture(ItemIcon(spec.id))
    local r, g, bl = QualityRGB(b.fdjQ or 1)
    b:SetBackdropColor(0, 0, 0, 0.75)
    b:SetBackdropBorderColor(r, g, bl, 1)

    local quality = tonumber(b.fdjQ) or 1
    b.glow:SetVertexColor(r, g, bl)
    b.glow:SetAlpha(quality >= 4 and 0.95 or 0.8)
    b.glow:SetShown(quality >= 2)
    if FDJ.UpdateFavouriteIndicator then
        FDJ.UpdateFavouriteIndicator(b, spec.id)
        if b.fdjFavouriteStar then
            b.fdjFavouriteStar:ClearAllPoints()
            b.fdjFavouriteStar:SetSize(13, 13)
            b.fdjFavouriteStar:SetPoint("TOPRIGHT", b, "TOPRIGHT", 4, 4)
        end
    end
    b:Show()
    return b
end
local function LineLabel(label, met)
    if page.firstLine == nil then page.firstLine, page.firstKind = Y, "icons" end
    local t = Theme()
    local fs = Take("texts", MakeText)
    fs:SetFontObject("ForeverDJ_GameFontNormal")
    fs:ClearAllPoints()
    fs:SetPoint("TOPLEFT", page.content, "TOPLEFT", 2, -(Y + 9))
    fs:SetWidth(LABEL_W_C - 10)
    fs:SetText(label)
    if met then fs:SetTextColor(0.35, 1.00, 0.35) else fs:SetTextColor(t.title[1], t.title[2], t.title[3]) end
    fs:Show()
    return fs
end
local function IconLine(label, list, met)
    local fs = LineLabel(label, met)
    local step = ICON_C + ICON_GAP_C
    local per = math.max(1, math.floor((W - LABEL_W_C + ICON_GAP_C) / step))
    local n = 0
    for _, spec in ipairs(list) do
        if spec and spec.id then
            local col, line = n % per, math.floor(n / per)
            PutIcon(spec, LABEL_W_C + col * step, Y + line * step)
            n = n + 1
        end
    end
    local lines = math.max(1, math.ceil(n / per))
    Y = Y + math.max(lines * step, math.ceil(fs:GetStringHeight() or 14) + 12) + 6
end











local SEAL_C, ARROW_H = 22, 50
local ARROW_TEX = "Interface\\TalentFrame\\TalentFrame-Parts"
local function MakeArrow(parent)
    local f = CreateFrame("Frame", nil, parent)
    f:SetSize(ICON_C, ARROW_H)
    f.line = f:CreateTexture(nil, "ARTWORK")
    f.line:SetColorTexture(1.00, 0.82, 0.27, 0.55)
    f.line:SetWidth(2)
    f.line:SetPoint("TOP", f, "TOP", 0, 0)
    f.line:SetPoint("BOTTOM", f, "BOTTOM", 0, 7)
    f.head = f:CreateTexture(nil, "ARTWORK", nil, 1)
    f.head:SetTexture(ARROW_TEX)
    f.head:SetTexCoord(0.78515625, 0.99218750, 0.54687500, 0.58789063)
    f.head:SetSize(20, 8)
    f.head:SetPoint("BOTTOM", f, "BOTTOM", 0, 0)
    return f
end
local function MakeSeal(parent)
    local b = CreateFrame("Button", nil, parent, "BackdropTemplate")
    b:SetSize(SEAL_C, SEAL_C)
    b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    b:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 } })
    b.icon = b:CreateTexture(nil, "ARTWORK")
    b.icon:SetPoint("TOPLEFT", 3, -3)
    b.icon:SetPoint("BOTTOMRIGHT", -3, 3)
    b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    b:SetScript("OnEnter", IconEnter)
    b:SetScript("OnLeave", IconLeave)
    b:SetScript("OnClick", RowClick)
    return b
end

local function PairLines(label, list)
    local fs = LineLabel(label)
    local step = ICON_C + ICON_GAP_C
    local per = math.max(1, math.floor((W - LABEL_W_C + ICON_GAP_C) / step))
    local block = ICON_C * 2 + ARROW_H + 10
    for i, pair in ipairs(list) do
        local col, line = (i - 1) % per, math.floor((i - 1) / per)
        local x, y = LABEL_W_C + col * step, Y + line * block
        if pair.rare and pair.rare.id then PutIcon(pair.rare, x, y) end
        if pair.epic and pair.epic.id then PutIcon(pair.epic, x, y + ICON_C + ARROW_H) end
        local a = Take("arrows", MakeArrow)
        a:ClearAllPoints()
        a:SetPoint("TOPLEFT", page.content, "TOPLEFT", x, -(y + ICON_C))
        a:Show()
        local seal = pair.seal
        if seal and seal.id then
            local b = Take("seals", MakeSeal)
            b:ClearAllPoints()
            b:SetPoint("CENTER", a, "CENTER", 0, 3)
            b:SetFrameLevel((a:GetFrameLevel() or 1) + 3)
            local name, _, q = ItemData(seal.id)
            b.fdjItemID, b.fdjQuality, b.fdjQ = seal.id, seal.quality, q or seal.quality
            b.fdjName = (ClientText() and name) or ItemName(seal.id)
            b.fdjSourceText = seal.sub
            b.fdjStrip, b.fdjSetClick, b.fdjQuestJump, b.fdjClickHint = nil, nil, nil, nil
            b.item = { seal.id, b.fdjName, nil, seal.quality }
            b.icon:SetTexture(ItemIcon(seal.id))
            local r, g, bl = QualityRGB(b.fdjQ or 1)
            b:SetBackdropColor(0, 0, 0, 0.85)
            b:SetBackdropBorderColor(r, g, bl, 1)
            b:Show()
        end
    end
    local lines = math.max(1, math.ceil(#list / per))
    Y = Y + math.max(lines * block - 10, math.ceil(fs:GetStringHeight() or 14) + 12) + 6
end

local function Section(label, list, met)
    if Compact() then
        IconLine(label, list, met)
    else
        Head(label, met)
        Rows(list)
    end
end






local LEVEL_GRAY, LEVEL_GREEN, LEVEL_RED = { 0.62, 0.62, 0.62 }, { 0.25, 1.00, 0.25 }, { 1.00, 0.27, 0.27 }
local function Hex(c) return string.format("|cff%02x%02x%02x", math.floor(c[1] * 255), math.floor(c[2] * 255), math.floor(c[3] * 255)) end
local function Pick(entry)
    local level, best, bestLevel, levels = Level(), nil, nil, {}
    for i = 3, #entry, 2 do
        local id, lv = entry[i], tonumber(entry[i + 1]) or 0
        levels[#levels + 1] = { id, lv }
        if lv <= level and (not bestLevel or lv >= bestLevel) then best, bestLevel = id, lv end
    end
    local fits = best ~= nil
    if not best then best, bestLevel = levels[1][1], levels[1][2] end
    local line, strip
    if #levels > 1 or (levels[1][2] or 0) > 0 then
        local parts, ids, labels = {}, {}, {}
        for _, v in ipairs(levels) do
            local c = (v[2] > level and LEVEL_RED) or ((fits and v[1] == best) and LEVEL_GREEN) or LEVEL_GRAY
            parts[#parts + 1] = Hex(c) .. v[2] .. "|r"
            ids[#ids + 1] = v[1]
            labels[#labels + 1] = { tostring(v[2]), c[1], c[2], c[3] }
        end
        line = L("PVP_LEVEL", table.concat(parts, " \194\183 "))
        if #ids > 1 then strip = { ids = ids, labels = labels, show = "PVP_STRIP_SHOW", hide = "PVP_STRIP_HIDE" } end
    end
    return best, line, strip
end

local function EntrySpecs(list, extra)
    local out = {}
    for _, entry in ipairs(list or {}) do
        local id, line, strip = Pick(entry)
        local sub = line
        if entry.quest then sub = L("PVP_FROM_QUEST") end
        if entry.choice then sub = L("PVP_CHOOSE_ONE") end
        if extra and extra.sub then sub = (sub and (sub .. "  \194\183  ") or "") .. extra.sub end
        out[#out + 1] = { id = id, name = (FDJ.PVP_ITEM_NAMES and FDJ.PVP_ITEM_NAMES[id]) or entry[1], quality = entry[2], sub = sub,
            strip = strip, source = extra and extra.source or nil }
    end
    return out
end
local function CostText(honor, mark, marks)
    if mark and marks then return L("PVP_COST", Big(honor), marks, Inline(mark)) end
    return L("PVP_COST_HONOR", Big(honor))
end








local function FillBattleground(key)
    local bg = FDJ.PVP_REWARDS and FDJ.PVP_REWARDS[key]
    local side = bg and bg[page.side]
    if not side then return end
    local name, standing, value, size = Reputation(side.faction, side.factionName)
    page.info:SetText(name)
    page.mapLoc = side.vendor
    page.where:SetText(L("PVP_QUARTERMASTER", FDJ.LocalizeFreeText and FDJ.LocalizeFreeText(side.vendor.label) or side.vendor.label))


    if page.side == OwnSide() then
        if not standing then standing, value, size = 4, 0, 3000 end
        page.ShowRep(standing, value, size)
    else
        page.repBar:Hide()
        standing = nil
    end
    for n = 5, 8 do
        if side[n] and #side[n] > 0 then
            Section(StandingLabel(n), EntrySpecs(side[n]), standing ~= nil and standing >= n)
        end
    end
    if side.questRewards then Section(L("PVP_QUEST_REWARDS"), EntrySpecs(side.questRewards)) end
    if side.mounts and #side.mounts > 0 then Section(L("PVP_MOUNTS"), EntrySpecs(side.mounts)) end
    if side.supplies and #side.supplies > 0 then Section(L("PVP_SUPPLIES"), EntrySpecs(side.supplies)) end

end












local SET_SPEC = {
    Chevalier = "PALADIN_RET", Scaled = "PALADIN_RET", Luminous = "PALADIN_HOLY", Lamellar = "PALADIN_HOLY",
    Mooncloth = "PRIEST_HOLY", Silken = "PRIEST_HOLY", Voidcloth = "PRIEST_SHADOW", Satin = "PRIEST_SHADOW",
    Flatmail = "SHAMAN_ENH", Linked = "SHAMAN_ENH", Scalemail = "SHAMAN_ELE", Mail = "SHAMAN_ELE", Linkmail = "SHAMAN_RESTO", Ringmail = "SHAMAN_RESTO",
    Beasthide = "DRUID_FERAL", Dragonhide = "DRUID_FERAL", Lunarhide = "DRUID_BALANCE", Wyrmhide = "DRUID_BALANCE", Dreamhide = "DRUID_RESTO", Kodohide = "DRUID_RESTO",
}
local SPECS = {
    PALADIN_HOLY = { 65, "Interface\\Icons\\Spell_Holy_HolyBolt" }, PALADIN_RET = { 70, "Interface\\Icons\\Spell_Holy_AuraOfLight" },
    PRIEST_HOLY = { 257, "Interface\\Icons\\Spell_Holy_GuardianSpirit" }, PRIEST_SHADOW = { 258, "Interface\\Icons\\Spell_Shadow_ShadowWordPain" },
    SHAMAN_ELE = { 262, "Interface\\Icons\\Spell_Nature_Lightning" }, SHAMAN_ENH = { 263, "Interface\\Icons\\Spell_Nature_LightningShield" },
    SHAMAN_RESTO = { 264, "Interface\\Icons\\Spell_Nature_MagicImmunity" },
    DRUID_BALANCE = { 102, "Interface\\Icons\\Spell_Nature_StarFall" }, DRUID_FERAL = { 103, "Interface\\Icons\\Ability_Racial_BearForm" },
    DRUID_RESTO = { 105, "Interface\\Icons\\Spell_Nature_HealingTouch" },
}

local function SpecLook(key)
    local spec = SPECS[key]
    if not spec then return nil, nil end
    if type(GetSpecializationInfoByID) == "function" then
        local ok, id, name, _, icon = pcall(GetSpecializationInfoByID, spec[1])
        if ok and id and type(name) == "string" and name ~= "" and not Secret(name) and icon then return name, icon end
    end
    return nil, spec[2]
end








local SPEC_ALSO = { [104] = 103 }
local function PlayerSpecID()
    local csi = C_SpecializationInfo
    local index
    if csi and csi.GetSpecialization then local ok, v = pcall(csi.GetSpecialization) if ok then index = v end end
    if index == nil and type(GetSpecialization) == "function" then local ok, v = pcall(GetSpecialization) if ok then index = v end end
    if type(index) ~= "number" or Secret(index) or index < 1 then return nil end
    local id
    if csi and csi.GetSpecializationInfo then local ok, v = pcall(csi.GetSpecializationInfo, index) if ok then id = v end end
    if id == nil and type(GetSpecializationInfo) == "function" then local ok, v = pcall(GetSpecializationInfo, index) if ok then id = v end end
    if type(id) ~= "number" or Secret(id) or id <= 0 then return nil end
    return SPEC_ALSO[id] or id
end
local function SpecOf(set) local spec = SPECS[SET_SPEC[set] or ""] return spec and spec[1] end
local function PickStore()
    if type(ForeverDungeonJournalCharacterDB) ~= "table" then ForeverDungeonJournalCharacterDB = {} end
    local db = ForeverDungeonJournalCharacterDB
    db.pvpSpecsOff = nil
    db.pvpSpecPick = type(db.pvpSpecPick) == "table" and db.pvpSpecPick or {}
    return db.pvpSpecPick
end

local function SpecsOff(token, all)
    local off = {}
    all = all or {}
    local pick = PickStore()[token]
    if type(pick) == "table" then
        for _, set in ipairs(all) do if pick[set] == false then off[set] = true end end
    else
        local okC, _, mine = pcall(UnitClass, "player")
        local id = okC and mine == token and PlayerSpecID() or nil
        local match = false
        if id then for _, set in ipairs(all) do if SpecOf(set) == id then match = true end end end
        if match then
            for _, set in ipairs(all) do if SpecOf(set) ~= id then off[set] = true end end
        end
    end
    local shown = false
    for _, set in ipairs(all) do if not off[set] then shown = true end end
    if not shown then off = {} end
    return off
end
local SPEC_C, SPEC_GAP = 26, 6
local function MakeSpec(parent)
    local b = CreateFrame("Button", nil, parent, "BackdropTemplate")



    b:SetSize(SPEC_C, SPEC_C)
    b:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 } })
    b.halo = b:CreateTexture(nil, "BACKGROUND", nil, -1)
    b.halo:SetTexture("Interface\\AddOns\\ForeverDungeonJournal\\Media\\TickGlow")
    b.halo:SetBlendMode("ADD")
    b.halo:SetVertexColor(1, 0.82, 0.35)
    b.halo:SetSize(math.floor(SPEC_C * 1.85 + 0.5), math.floor(SPEC_C * 1.85 + 0.5))
    b.halo:SetPoint("CENTER")
    b.icon = b:CreateTexture(nil, "ARTWORK")
    b.icon:SetPoint("TOPLEFT", 3, -3)
    b.icon:SetPoint("BOTTOMRIGHT", -3, 3)
    b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    b.glow = b:CreateTexture(nil, "OVERLAY")
    b.glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    b.glow:SetBlendMode("ADD")
    b.glow:SetVertexColor(1, 0.82, 0.3, 0.95)
    b.glow:SetSize(math.floor(SPEC_C * 1.92 + 0.5), math.floor(SPEC_C * 1.92 + 0.5))
    b.glow:SetPoint("CENTER")
    b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    b:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(self.fdjName or "", 1, 0.82, 0)
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    b:SetScript("OnClick", function(self)
        local all = self.fdjAll or {}
        local off = SpecsOff(self.fdjClass, all)
        if not off[self.fdjSet] then

            local shown = 0
            for _, set in ipairs(all) do if not off[set] then shown = shown + 1 end end
            if shown <= 1 then return end
        end

        local pick = {}
        for _, set in ipairs(all) do pick[set] = not off[set] end
        pick[self.fdjSet] = off[self.fdjSet] and true or false
        PickStore()[self.fdjClass] = pick
        GameTooltip:Hide()
        if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) or 856) end
        if FDJ.CloseSetStrip then FDJ.CloseSetStrip(nil, true) end
        if page and page.Refresh then page.Refresh() end
    end)
    return b
end

local function PlaceSpecs(lines)
    page.specs = page.specs or {}
    local n = 0
    local all = {}
    for _, line in ipairs(lines or {}) do all[#all + 1] = line[1] end
    if #all > 1 and page.compact then
        local off = SpecsOff(page.cls, all)
        local total = #all * SPEC_C + (#all - 1) * SPEC_GAP
        for i, line in ipairs(lines) do
            local key = SET_SPEC[line[1]]
            local name, icon = SpecLook(key)
            local chest
            for k = 2, #line do if line[k][1] == 5 then chest = line[k][3] or line[k][2] end end
            n = n + 1
            local b = page.specs[n] or MakeSpec(page.content)
            page.specs[n] = b
            b.fdjClass, b.fdjSet, b.fdjAll = page.cls, line[1], all
            b.fdjName = name or ItemName(chest or line[2][2])
            b.icon:SetTexture(icon or ItemIcon(chest or line[2][2]))
            local on = not off[line[1]]
            b.icon:SetDesaturated(not on)
            b.icon:SetAlpha(on and 1 or 0.45)
            b.halo:SetShown(on)
            b.glow:SetShown(on)
            if on then
                b:SetBackdropColor(0.45, 0.32, 0.08, 1)
                b:SetBackdropBorderColor(1.00, 0.82, 0.27, 1)
            else
                b:SetBackdropColor(0.10, 0.08, 0.06, 1)
                b:SetBackdropBorderColor(0.35, 0.30, 0.25, 1)
            end
            b:ClearAllPoints()
            b:SetPoint("TOPLEFT", page.compact, "BOTTOMRIGHT", -total + (i - 1) * (SPEC_C + SPEC_GAP), -8)
            b:SetFrameLevel((page.compact:GetFrameLevel() or 1) + 1)
            b:Show()
        end
    end
    for i = n + 1, #page.specs do page.specs[i]:Hide() end
end
local function Gap() Y = Y + 16 end

local function FillHonor()
    local H = FDJ.PVP_HONOR
    if not H then return end
    local side = page.side
    local hall = H.vendors[side]
    page.info:SetText(L(side == "Horde" and "PVP_HALL_H" or "PVP_HALL_A") .. ", " .. ZoneName(hall.mapID, side == "Horde" and "Orgrimmar" or "Stormwind City"))
    page.mapLoc = hall
    page.where:SetText(hall.targetName or "")
    page.repBar:Hide()







    Head(L("PVP_PREMIER"))
    local sets = H.sets[side] or {}
    if not page.cls or not sets[page.cls] then
        page.cls = sets[OwnClass()] and OwnClass() or nil
        if not page.cls then for _, t in ipairs(CLASS_ORDER) do if sets[t] then page.cls = t break end end end
    end
    local x = 0
    for _, token in ipairs(page.classMenu and {} or CLASS_ORDER) do
        if sets[token] then
            local b = Take("classes", MakeClass)
            b.token = token
            local c = type(CLASS_ICON_TCOORDS) == "table" and CLASS_ICON_TCOORDS[token]
            if type(c) == "table" and tonumber(c[1]) then b.icon:SetTexCoord(c[1], c[2], c[3], c[4]) end
            local t = Theme()
            if token == page.cls then
                b:SetBackdropColor(0.45, 0.32, 0.08, 1)
                b:SetBackdropBorderColor(1.00, 0.82, 0.27, 1)
                b.icon:SetDesaturated(false)
            else
                b:SetBackdropColor(t.lootRow[1], t.lootRow[2], t.lootRow[3], 1)
                b:SetBackdropBorderColor(t.border[1], t.border[2], t.border[3], 1)
                b.icon:SetDesaturated(true)
            end
            b:ClearAllPoints()
            b:SetPoint("TOPLEFT", page.content, "TOPLEFT", x, -Y)
            b:Show()
            x = x + 40
        end
    end
    if x > 0 then Y = Y + 44 end
    page.fdjSpecLines = sets[page.cls]
    local allSets = {}
    for _, line in ipairs(sets[page.cls] or {}) do allSets[#allSets + 1] = line[1] end
    local off = SpecsOff(page.cls, allSets)
    for _, line in ipairs(sets[page.cls] or {}) do
      if not off[line[1]] then
        local chest
        for i = 2, #line do if line[i][1] == 5 then chest = line[i][2] end end
        local setName = ClassName(page.cls) .. "  \194\183  " .. ItemName(chest or line[2][2])
        if not Compact() then
            local fs = Take("texts", MakeText)
            fs:SetFontObject("ForeverDJ_GameFontNormal")
            fs:ClearAllPoints()
            fs:SetPoint("TOPLEFT", page.content, "TOPLEFT", 2, -Y)
            fs:SetWidth(W - 4)
            fs:SetText(setName)
            fs:SetTextColor(1.00, 0.82, 0.27)
            fs:Show()
            Y = Y + 22
        end
        local list, twins = {}, {}
        for i = 2, #line do
            local slot, rare, epic = line[i][1], line[i][2], line[i][3]
            local cost = H.slotCost[slot]
            local seal = H.seals[slot]
            local rareSpec = { id = rare, quality = 3, sub = cost and CostText(cost[1], cost[2], cost[3]) or nil }
            local epicSpec = { id = epic, quality = 4, sub = seal and L("PVP_SEAL_LINE", seal[2], Inline(seal[1]), Big(seal[3])) or nil,
                source = seal and L("PVP_UPGRADE_WITH", ItemName(seal[1])) or nil }
            list[#list + 1] = rareSpec
            list[#list + 1] = epicSpec

            twins[#twins + 1] = { rare = rareSpec, epic = epicSpec,
                seal = seal and { id = seal[1], quality = 3, sub = L("PVP_RANK", seal[2]) .. "  \194\183  " .. CostText(seal[3]) } or nil }
        end
        if Compact() then PairLines(ItemName(chest or line[2][2]), twins) else Rows(list) end
      end
    end


    local byRank = {}
    for rank, items in pairs(H.ranks[side] or {}) do
        for _, it in ipairs(items) do byRank[#byRank + 1] = { rank, it[1], it[2], it[3], it[4] } end
    end
    for slot, seal in pairs(H.seals) do byRank[#byRank + 1] = { seal[2], seal[1], seal[3], nil, nil, slot } end
    for _, w in ipairs(H.weapons[side] or {}) do byRank[#byRank + 1] = { 14, w[1], w[2], w[3], w[4] } end
    table.sort(byRank, function(a, b)
        if a[1] ~= b[1] then return a[1] < b[1] end
        return a[2] < b[2]
    end)
    local list = {}
    for _, r in ipairs(byRank) do
        local sub = L("PVP_RANK", r[1])
        if r[3] then sub = sub .. "  \194\183  " .. CostText(r[3], r[4], r[5]) end
        list[#list + 1] = { id = r[2], sub = sub }
    end
    if Compact() then Gap() end
    Section(L("PVP_RANK_REWARDS"), list)


    if not Compact() then
        Head(L("PVP_MARKS"))
        Text(L("PVP_MARKS_TEXT"))
    end
    local marks, keys = {}, { [20558] = "WSG", [20559] = "AB", [274895] = "DI", [20560] = "AV" }
    for _, id in ipairs(H.marks) do
        marks[#marks + 1] = { id = id, quality = 1, sub = FDJ.PvPBattlegroundName and FDJ.PvPBattlegroundName(keys[id]) or nil }
    end
    if Compact() then
        Gap()
        IconLine(L("PVP_MARKS"), marks)
        Text(L("PVP_MARKS_TEXT"), true)
    else
        Rows(marks)
    end


    Head(FieldName())
    Text(L("PVP_FIELD_TEXT"))
    MapButton(H.fieldOfHonor)


    Head(L("PVP_LEGACY"))
    Text(L("PVP_LEGACY_TEXT", FieldName()))



end


local function HideAll()
    for kind, list in pairs(pools) do
        for i = 1, #list do
            list[i]:Hide()
            if list[i].fdjFound then list[i].fdjFound:Hide() end
        end
        used[kind] = 0
    end
end









local MARKS = { WSG = 20558, AB = 20559, DI = 274895, AV = 20560 }


















local GENERALS = { Horde = 11946, Alliance = 11948 }
FDJ.PVP_PORTRAIT_NPCS = { ["Drek'Thar"] = 11946, ["Vanndar Stormpike"] = 11948 }
if FDJ.STATIC_DISPLAY_IDS then
    FDJ.STATIC_DISPLAY_IDS[11946] = FDJ.STATIC_DISPLAY_IDS[11946] or 11894
    FDJ.STATIC_DISPLAY_IDS[11948] = FDJ.STATIC_DISPLAY_IDS[11948] or 11896
end
local JUMP_ART = {
    AB = { "Interface\\Icons\\Achievement_BG_winAB" },
    DI = { "Interface\\Icons\\Achievement_Character_Troll_Male", "Interface\\Icons\\INV_Misc_Head_Troll_01" },
}
local JUMP_C, JUMP_GAP = 30, 10
local function TryTexture(tex, list)
    for _, path in ipairs(list or {}) do
        local ok, done = pcall(tex.SetTexture, tex, path)
        if ok and done ~= false then return true end
    end
    return false
end
local function TryAtlas(tex, name)
    if not tex.SetAtlas then return false end
    local ok, done = pcall(tex.SetAtlas, tex, name)
    return ok and done ~= false
end


local function DrawFace(b, display)
    display = tonumber(display)
    if not display then return false end
    b.face:SetVertexColor(1, 1, 1, 1)
    if FDJ.SetBakedPortrait and FDJ.SetBakedPortrait(b.face, display) then return true end
    if type(SetPortraitTextureFromCreatureDisplayID) ~= "function" then return false end
    b.face:SetTexture(nil)
    pcall(SetPortraitTextureFromCreatureDisplayID, b.face, display)
    local t = b.face:GetTexture()
    return t ~= nil and t ~= 0 and t ~= ""
end
local JumpIcon
JumpIcon = function(b, key)
    local side = (page and page.side == "Horde") and "Horde" or "Alliance"
    for _, part in ipairs({ b.icon, b.crest, b.flag, b.face, b.badge }) do part:Hide() end
    b.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    if key == "HONOR" then

        if TryAtlas(b.badge, "UI-Character-Info-Honor-Bar-BG-" .. side) and TryAtlas(b.crest, "UI-Character-Info-Honor-Icon-" .. side) then
            b.badge:Show()
            b.crest:Show()
            return
        end
        if TryTexture(b.icon, { side == "Horde" and "Interface\\ICONS\\INV_SideTab_Honor_Horde_c60" or "Interface\\ICONS\\INV_SideTab_Honor_Alliance_c60" }) then b.icon:Show() end
        return
    end
    if key == "WSG" and TryTexture(b.flag, { "Interface\\WorldStateFrame\\" .. side .. "Flag" }) then
        b.flag:Show()
        return
    end




    if key == "AB" then
        local bg = FDJ.PVP_REWARDS and FDJ.PVP_REWARDS.AB
        local vendor = bg and bg[side] and bg[side].vendor
        if vendor and DrawFace(b, vendor.display) then
            b.face:Show()
            return
        end
    end
    if key == "AV" then
        local npc = GENERALS[side]
        local display = (FDJ.STATIC_DISPLAY_IDS and FDJ.STATIC_DISPLAY_IDS[npc]) or (FDJ.MobDisplay and FDJ.MobDisplay(npc))
        if display then
            if DrawFace(b, display) then
                b.face:Show()
                return
            end
        elseif FDJ.ResolveMobDisplays and not b.fdjFaceWait then

            pcall(FDJ.ResolveMobDisplays, { npc })
            b.fdjFaceWait = true
            local tries = 0
            local function Check()
                tries = tries + 1
                if FDJ.MobDisplay and FDJ.MobDisplay(npc) then
                    b.fdjFaceWait = nil
                    if b:IsShown() and b.fdjKey == "AV" then JumpIcon(b, "AV") end
                elseif tries < 90 and C_Timer and C_Timer.After then
                    C_Timer.After(0.5, Check)
                else
                    b.fdjFaceWait = nil
                end
            end
            if C_Timer and C_Timer.After then C_Timer.After(0.5, Check) else b.fdjFaceWait = nil end
        end
    end
    if JUMP_ART[key] and TryTexture(b.icon, JUMP_ART[key]) then
        b.icon:Show()
        return
    end
    b.icon:SetTexture(ItemIcon(MARKS[key]))
    b.icon:Show()
end
local function MakeJump(parent)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(JUMP_C, JUMP_C)
    local MASK_FILE = "Interface\\CharacterFrame\\TempPortraitAlphaMask"
    local function Masked(tex)
        if b.CreateMaskTexture and tex.AddMaskTexture then
            local mask = b:CreateMaskTexture()
            mask:SetTexture(MASK_FILE, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
            mask:SetPoint("CENTER", b, "CENTER", 0, 0)
            mask:SetSize(JUMP_C, JUMP_C)
            tex:AddMaskTexture(mask)
        end
    end




    b.ring = b:CreateTexture(nil, "ARTWORK", nil, 0)
    b.ring:SetTexture(MASK_FILE)
    b.ring:SetSize(JUMP_C + 4, JUMP_C + 4)
    b.ring:SetPoint("CENTER")
    b.ring:SetVertexColor(0.62, 0.46, 0.16, 1)


    b.halo = b:CreateTexture(nil, "BACKGROUND", nil, -1)
    b.halo:SetTexture("Interface\\AddOns\\ForeverDungeonJournal\\Media\\TickGlow")
    b.halo:SetBlendMode("ADD")
    b.halo:SetVertexColor(1, 0.82, 0.35)
    b.halo:SetSize(math.floor(JUMP_C * 2.15 + 0.5), math.floor(JUMP_C * 2.15 + 0.5))
    b.halo:SetPoint("CENTER")
    b.halo:Hide()
    b.lit = b:CreateTexture(nil, "BACKGROUND")
    b.lit:SetTexture("Interface\\AddOns\\ForeverDungeonJournal\\Media\\TabRing")
    b.lit:SetBlendMode("ADD")
    b.lit:SetVertexColor(1, 0.82, 0.3, 0.95)
    b.lit:SetSize(math.floor(JUMP_C * 1.92 + 0.5), math.floor(JUMP_C * 1.92 + 0.5))
    b.lit:SetPoint("CENTER")
    b.lit:Hide()
    b.disc = b:CreateTexture(nil, "ARTWORK", nil, 1)
    b.disc:SetSize(JUMP_C, JUMP_C)
    b.disc:SetPoint("CENTER")
    b.disc:SetColorTexture(0.08, 0.06, 0.04, 1)
    Masked(b.disc)
    b.icon = b:CreateTexture(nil, "ARTWORK", nil, 2)
    b.icon:SetSize(JUMP_C, JUMP_C)
    b.icon:SetPoint("CENTER")
    Masked(b.icon)
    b.face = b:CreateTexture(nil, "ARTWORK", nil, 2)
    b.face:SetSize(JUMP_C, JUMP_C)
    b.face:SetPoint("CENTER")
    Masked(b.face)
    b.badge = b:CreateTexture(nil, "ARTWORK", nil, 2)
    b.badge:SetSize(JUMP_C, JUMP_C)
    b.badge:SetPoint("CENTER")
    b.crest = b:CreateTexture(nil, "ARTWORK", nil, 3)
    b.crest:SetSize(JUMP_C * 0.62, JUMP_C * 0.72)
    b.crest:SetPoint("CENTER")
    b.flag = b:CreateTexture(nil, "ARTWORK", nil, 3)
    b.flag:SetSize(JUMP_C * 0.9, JUMP_C * 0.9)
    b.flag:SetPoint("CENTER")
    b.hl = b:CreateTexture(nil, "HIGHLIGHT")
    b.hl:SetTexture(MASK_FILE)
    b.hl:SetBlendMode("ADD")
    b.hl:SetAlpha(0.25)
    b.hl:SetAllPoints()
    b:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        local name = self.fdjKey == "HONOR" and L("PVP_HONOR_TITLE")
            or (FDJ.PvPBattlegroundName and FDJ.PvPBattlegroundName(self.fdjKey)) or tostring(self.fdjKey)
        GameTooltip:SetText(name, 1, 0.82, 0)
        GameTooltip:Show()
    end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    b:SetScript("OnClick", function(self)
        GameTooltip:Hide()
        if FDJ.CloseSetStrip then FDJ.CloseSetStrip(nil, true) end
        if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_ABILITY_PAGE_TURN) or 836) end
        if self.fdjKey and page and self.fdjKey ~= page.key then FDJ.OpenPvPRewards(self.fdjKey, page.side) end
    end)
    return b
end
local function PlaceJumps()
    page.jumps = page.jumps or {}






    local keys, have = {}, {}
    for _, key in ipairs(FDJ.PvPShownKeys and FDJ.PvPShownKeys() or {}) do
        if MARKS[key] then keys[#keys + 1] = key have[key] = true end
    end
    if page.key ~= "HONOR" and MARKS[page.key] and not have[page.key] then

        local all = FDJ.PvPBattlegroundKeys and FDJ.PvPBattlegroundKeys() or {}
        local order = {}
        for i, key in ipairs(all) do order[key] = i end
        keys[#keys + 1] = page.key
        table.sort(keys, function(a, b) return (order[a] or 99) < (order[b] or 99) end)
    end
    if FDJ.PVP_HONOR then keys[#keys + 1] = "HONOR" end
    local total = #keys * JUMP_C + math.max(0, #keys - 1) * JUMP_GAP
    local center = math.floor((page:GetWidth() or 800) * 0.64)
    for i, key in ipairs(keys) do
        local b = page.jumps[i]
        if not b then
            b = MakeJump(page)
            page.jumps[i] = b
        end
        if b.fdjKey ~= key or b.fdjSide ~= page.side then
            b.fdjKey, b.fdjSide = key, page.side
            JumpIcon(b, key)
        end
        local on = key == page.key
        b.lit:SetShown(on)
        b.halo:SetShown(on)
        b:ClearAllPoints()
        b:SetPoint("TOPLEFT", page, "TOPLEFT", center - total / 2 + (i - 1) * (JUMP_C + JUMP_GAP), -2)
        b:Show()
    end
    for i = #keys + 1, #page.jumps do page.jumps[i]:Hide() end



    if page.quests then
        page.quests:ClearAllPoints()
        page.quests:SetPoint("TOP", page, "TOPLEFT", center, -2 - JUMP_C - 8)
    end
end

local function Refresh()
    if not (page and page:IsShown()) then return end
    HideAll()
    page.firstLine, page.firstKind = nil, nil


    local bgData = page.key ~= "HONOR" and FDJ.PVP_REWARDS and FDJ.PVP_REWARDS[page.key]
    local sideData = bgData and bgData[page.side]
    local hasQuests = type(sideData) == "table" and type(sideData.quests) == "table" and #sideData.quests > 0
        and FDJ.PVP_QUEST_PAGES ~= nil and FDJ.PVP_QUEST_PAGES[page.key] ~= nil
    W = math.max(400, math.floor((page.scroll:GetWidth() or 760) - 4))
    Y = 4
    page.content:SetWidth(W)
    if page.key == "HONOR" then
        page.title:SetText(L("PVP_HONOR_TITLE"))
        FillHonor()
    else
        page.title:SetText(FDJ.PvPBattlegroundName and FDJ.PvPBattlegroundName(page.key) or page.key)
        FillBattleground(page.key)
    end

    local t = Theme()
    for faction, b in pairs(page.crests) do
        if faction == page.side then
            b:SetBackdropColor(t.rowSelected[1], t.rowSelected[2], t.rowSelected[3], t.rowSelected[4] or 1)
            b:SetBackdropBorderColor(t.title[1], t.title[2], t.title[3], 1)
            b.icon:SetAlpha(1)
        else
            b:SetBackdropColor(t.row and t.row[1] or 0.14, t.row and t.row[2] or 0.09, t.row and t.row[3] or 0.045, 0.92)
            b:SetBackdropBorderColor(t.border[1], t.border[2], t.border[3], 1)
            b.icon:SetAlpha(0.55)
        end
    end
    SetPortrait(page.portrait, page.mapLoc)
    pcall(PlaceJumps)

    local menuButton = page.classMenu
    if menuButton then
        local H = FDJ.PVP_HONOR
        local sets = page.key == "HONOR" and H and H.sets and H.sets[page.side] or nil
        if sets and page.cls and sets[page.cls] then
            local c = type(CLASS_ICON_TCOORDS) == "table" and CLASS_ICON_TCOORDS[page.cls]
            if type(c) == "table" and tonumber(c[1]) then menuButton.icon:SetTexCoord(c[1], c[2], c[3], c[4]) end
            menuButton.text:SetText(ClassName(page.cls))
            menuButton:ClearAllPoints()
            menuButton:SetPoint("BOTTOMRIGHT", page.scroll, "TOPRIGHT", -2, 4)
            local n = 0
            for _, o in ipairs(menuButton.menu.options) do
                if sets[o.token] then
                    n = n + 1
                    o:ClearAllPoints()
                    o:SetPoint("TOPLEFT", menuButton.menu, "TOPLEFT", 6, -5 - (n - 1) * 22)
                    o:SetPoint("TOPRIGHT", menuButton.menu, "TOPRIGHT", -6, -5 - (n - 1) * 22)
                    o.text:SetText(ClassName(o.token))
                    o.check:SetShown(o.token == page.cls)
                    o:Show()
                else
                    o:Hide()
                end
            end
            menuButton.menu:SetSize(170, n * 22 + 10)
            menuButton:Show()
        else
            menuButton:Hide()
        end
    end
    page.compact.text:SetText(L(Compact() and "LOOT_DETAILED" or "LOOT_COMPACT"))
    page.compact:SetWidth(math.max(104, math.ceil((page.compact.text:GetStringWidth() or 80) + 20)))

    page.quests:SetShown(hasQuests)
    page.quests.text:SetText(L("QUESTS"))
    page.quests:SetWidth(math.max(110, math.ceil((page.quests.text:GetStringWidth() or 60) + 46)))
    page.quests:SetBackdropColor(0.12, 0.10, 0.08, 0.95)
    page.quests:SetBackdropBorderColor(0.52, 0.33, 0.11, 1)



    if page.compact:GetParent() ~= page.content then
        page.compact:SetParent(page.content)
        page.compact:SetFrameLevel((page.content:GetFrameLevel() or 1) + 20)
    end
    page.compact:ClearAllPoints()
    page.compact:SetPoint("TOPRIGHT", page.content, "TOPRIGHT", -2, -((page.firstLine or 4) + (page.firstKind == "icons" and 7 or 2)))
    page.compact:Show()
    page.scroll:Show()
    pcall(PlaceSpecs, page.key == "HONOR" and page.fdjSpecLines or nil)
    page.content:SetHeight(math.max(1, Y))
    local bar = rawget(page.scroll, "ScrollBar") or _G["ForeverDungeonJournalPvPRewardsScrollScrollBar"]
    if type(bar) == "table" and bar.SetShown then bar:SetShown(Y > (page.scroll:GetHeight() or 0) + 1) end
end

local function ShowCards(show)
    local panel = _G.ForeverDungeonJournalPvPPanel
    if not panel then return end
    for _, part in ipairs({ panel.title, panel.cards }) do
        if part then part:SetShown(show) end
    end
    if not show and panel.empty then panel.empty:Hide() end
end

local function Build(panel)
    if page then return page end
    page = CreateFrame("Frame", "ForeverDungeonJournalPvPRewardsPage", panel)
    page:SetAllPoints(panel)
    page:SetFrameLevel((tonumber(panel:GetFrameLevel()) or 1) + 4)
    page:EnableMouse(true)

    page.arrow = CreateFrame("Button", nil, page)
    page.arrow:SetSize(26, 26)
    page.arrow:SetPoint("TOPLEFT", 0, 0)
    page.arrow:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
    page.arrow:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
    page.arrow:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
    page.arrow:SetScript("OnClick", function() page:Hide() end)
    page.arrow:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L("PVP_BACK"))
        GameTooltip:Show()
    end)
    page.arrow:SetScript("OnLeave", function() GameTooltip:Hide() end)
    page.title = page:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalLarge")
    page.title:SetPoint("LEFT", page.arrow, "RIGHT", 4, 1)
    page.title:SetTextColor(1.00, 0.82, 0.27)

    page.crests = {}
    for i, faction in ipairs({ "Horde", "Alliance" }) do
        local b = CreateFrame("Button", nil, page, "BackdropTemplate")
        b:SetSize(50, 38)
        b:SetPoint("TOPRIGHT", page, "TOPRIGHT", (i == 1) and -6 or -62, 2)
        b:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 8,
            insets = { left = 2, right = 2, top = 2, bottom = 2 } })
        b.icon = b:CreateTexture(nil, "ARTWORK")
        b.icon:SetSize(31, 31)
        b.icon:SetPoint("CENTER")
        b.icon:SetTexture("Interface\\AddOns\\ForeverDungeonJournal\\Media\\" .. faction .. ".tga")
        b.icon:SetTexCoord(0.06, 0.94, 0.06, 0.94)
        b:SetScript("OnClick", function()
            if page.side == faction then return end
            page.side = faction
            page.cls = nil
            if page.scroll.SetVerticalScroll then page.scroll:SetVerticalScroll(0) end
            Refresh()
        end)
        b:SetScript("OnEnter", function(self)
            local word = _G["FACTION_" .. faction:upper()]
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText((type(word) == "string" and word ~= "") and word or faction)
            GameTooltip:Show()
        end)
        b:SetScript("OnLeave", function() GameTooltip:Hide() end)
        page.crests[faction] = b
    end

    page.compact = CreateFrame("Button", nil, page, "BackdropTemplate")
    page.compact:SetSize(104, 20)
    page.compact:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 9,
        insets = { left = 2, right = 2, top = 2, bottom = 2 } })
    page.compact:SetBackdropColor(0.12, 0.10, 0.08, 0.95)
    page.compact:SetBackdropBorderColor(0.52, 0.33, 0.11, 1)
    page.compact.text = page.compact:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormalSmall")
    page.compact.text:SetPoint("CENTER")
    page.compact:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")


    page.quests = CreateFrame("Button", nil, page, "BackdropTemplate")
    page.quests:SetSize(118, 28)
    page.quests:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, tile = true, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 } })
    page.quests.icon = page.quests:CreateTexture(nil, "ARTWORK")
    page.quests.icon:SetSize(20, 20)
    page.quests.icon:SetPoint("LEFT", 9, 0)
    page.quests.icon:SetTexture("Interface\\GossipFrame\\AvailableQuestIcon")
    page.quests.text = page.quests:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
    page.quests.text:SetPoint("LEFT", page.quests.icon, "RIGHT", 6, 0)
    page.quests:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    page.quests:SetPoint("RIGHT", page.crests.Alliance, "LEFT", -12, 0)
    page.quests:SetScript("OnClick", function()
        if FDJ.CloseSetStrip then FDJ.CloseSetStrip(nil, true) end

        if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_ABILITY_PAGE_TURN) or 836) end
        GameTooltip:Hide()
        if FDJ.OpenPvPQuests then FDJ.OpenPvPQuests(page.key, page.side) end
    end)
    page.compact:SetScript("OnClick", function()
        if type(ForeverDungeonJournalDB) ~= "table" then ForeverDungeonJournalDB = {} end
        if page.key == "HONOR" then
            ForeverDungeonJournalDB.pvpCompact = not Compact() or nil
        else
            ForeverDungeonJournalDB.pvpBGDetailed = Compact() or nil
        end
        if FDJ.CloseSetStrip then FDJ.CloseSetStrip(nil, true) end
        if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) or 856) end
        Refresh()
    end)



    do
        local b = CreateFrame("Button", nil, page, "UIPanelButtonTemplate")
        if FDJ.OwnFonts then FDJ.OwnFonts(b) end
        page.classMenu = b
        b:SetSize(150, 22)
        b:SetText("")
        local caret = b:CreateTexture(nil, "OVERLAY")
        caret:SetTexture("Interface\\Buttons\\Arrow-Down-Up")
        caret:SetSize(12, 12)
        caret:SetPoint("RIGHT", b, "RIGHT", -7, -3)
        b.icon = b:CreateTexture(nil, "OVERLAY")
        b.icon:SetSize(16, 16)
        b.icon:SetPoint("LEFT", b, "LEFT", 8, 0)
        b.icon:SetTexture(CLASS_ICONS)
        b.text = b:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
        b.text:SetPoint("LEFT", b.icon, "RIGHT", 5, 0)
        b.text:SetPoint("RIGHT", caret, "LEFT", -2, 0)
        b.text:SetJustifyH("LEFT")
        b.text:SetWordWrap(false)
        local menu = CreateFrame("Frame", nil, b, "BackdropTemplate")
        b.menu = menu
        menu:SetPoint("TOPRIGHT", b, "BOTTOMRIGHT", 4, -4)
        menu:SetFrameStrata("TOOLTIP")
        menu:SetBackdrop({ bgFile = WHITE, edgeFile = EDGE, edgeSize = 12, insets = { left = 3, right = 3, top = 3, bottom = 3 } })
        menu:SetBackdropColor(0.055, 0.05, 0.043, 0.99)
        menu:SetBackdropBorderColor(0.57, 0.43, 0.20, 1)
        menu:Hide()
        menu.options = {}
        for i, token in ipairs(CLASS_ORDER) do
            local o = CreateFrame("Button", nil, menu)
            o:SetPoint("TOPLEFT", 6, -5 - (i - 1) * 22)
            o:SetPoint("TOPRIGHT", -6, -5 - (i - 1) * 22)
            o:SetHeight(21)
            o:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
            o.token = token
            o.check = o:CreateTexture(nil, "OVERLAY")
            o.check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
            o.check:SetSize(18, 18)
            o.check:SetPoint("LEFT", 2, 0)
            o.icon = o:CreateTexture(nil, "ARTWORK")
            o.icon:SetSize(16, 16)
            o.icon:SetPoint("LEFT", 24, 0)
            o.icon:SetTexture(CLASS_ICONS)
            local c = type(CLASS_ICON_TCOORDS) == "table" and CLASS_ICON_TCOORDS[token]
            if type(c) == "table" and tonumber(c[1]) then o.icon:SetTexCoord(c[1], c[2], c[3], c[4]) end
            o.text = o:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlight")
            o.text:SetPoint("LEFT", o.icon, "RIGHT", 5, 0)
            o:SetScript("OnClick", function(self)
                menu:Hide()
                if page.cls == self.token then return end
                page.cls = self.token
                if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) or 856) end
                if FDJ.CloseSetStrip then FDJ.CloseSetStrip(nil, true) end
                if page.scroll.SetVerticalScroll then page.scroll:SetVerticalScroll(0) end
                if page.Refresh then page.Refresh() end
            end)
            menu.options[i] = o
        end
        b:SetScript("OnClick", function()
            menu:SetShown(not menu:IsShown())
            if PlaySound then pcall(PlaySound, (SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION) or 852) end
        end)
        b:SetScript("OnHide", function() menu:Hide() end)
        b:Hide()
    end

    page.portrait = MakePortrait(page, 44)
    page.portrait:SetPoint("TOPLEFT", page, "TOPLEFT", 8, -34)
    page.info = page:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontNormal")
    page.info:SetPoint("TOPLEFT", page.portrait, "TOPRIGHT", 12, 0)
    page.info:SetJustifyH("LEFT")
    page.info:SetTextColor(1.00, 0.88, 0.55)
    local bar = CreateFrame("StatusBar", nil, page)
    bar:SetSize(240, 15)
    bar:SetPoint("TOPLEFT", page.info, "BOTTOMLEFT", 1, -4)
    bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    bar:SetMinMaxValues(0, 1)
    bar.bg = bar:CreateTexture(nil, "BACKGROUND")
    bar.bg:SetAllPoints()
    bar.bg:SetColorTexture(0, 0, 0, 0.55)
    for _, edge in ipairs({ { "TOPLEFT", "TOPRIGHT", 0, 1 }, { "BOTTOMLEFT", "BOTTOMRIGHT", 0, -1 } }) do
        local line = bar:CreateTexture(nil, "BORDER")
        line:SetColorTexture(0.12, 0.08, 0.03, 1)
        line:SetPoint(edge[1], bar, edge[1], -1, edge[4])
        line:SetPoint(edge[2], bar, edge[2], 1, edge[4])
        line:SetHeight(1)
    end
    for _, edge in ipairs({ { "TOPLEFT", "BOTTOMLEFT", -1 }, { "TOPRIGHT", "BOTTOMRIGHT", 1 } }) do
        local line = bar:CreateTexture(nil, "BORDER")
        line:SetColorTexture(0.12, 0.08, 0.03, 1)
        line:SetPoint(edge[1], bar, edge[1], edge[3], 1)
        line:SetPoint(edge[2], bar, edge[2], edge[3], -1)
        line:SetWidth(1)
    end
    bar.label = bar:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
    bar.label:SetPoint("CENTER", bar, "CENTER", 0, 0)
    bar:Hide()
    page.repBar = bar
    function page.ShowRep(standing, value, size)
        local c = type(FACTION_BAR_COLORS) == "table" and FACTION_BAR_COLORS[standing]
        if type(c) == "table" and tonumber(c.r) then bar:SetStatusBarColor(c.r, c.g, c.b)
        else bar:SetStatusBarColor(standing >= 5 and 0 or 0.9, standing >= 5 and 0.6 or 0.7, standing >= 5 and 0.1 or 0) end
        if size and size > 0 then
            bar:SetValue(math.max(0, math.min(1, (value or 0) / size)))
            bar.label:SetText(StandingLabel(standing) .. "  " .. Big(math.floor(value or 0)) .. " / " .. Big(math.floor(size)))
        else
            bar:SetValue(1)
            bar.label:SetText(StandingLabel(standing))
        end
        bar:Show()
    end
    page.where = page:CreateFontString(nil, "OVERLAY", "ForeverDJ_GameFontHighlightSmall")
    page.where:SetPoint("TOPLEFT", bar, "BOTTOMLEFT", -1, -4)
    page.where:SetJustifyH("LEFT")
    page.scroll = CreateFrame("ScrollFrame", "ForeverDungeonJournalPvPRewardsScroll", page, "UIPanelScrollFrameTemplate")
    page.scroll:SetPoint("TOPLEFT", 4, -90)
    page.scroll:SetPoint("BOTTOMRIGHT", -22, 2)
    page.content = CreateFrame("Frame", nil, page.scroll)
    page.content:SetSize(700, 1)
    page.scroll:SetScrollChild(page.content)
    page.Refresh = Refresh
    page:SetScript("OnSizeChanged", function(self) if self:IsShown() then Refresh() end end)
    page:SetScript("OnHide", function()
        ShowCards(true)
        if FDJ.PvPLayout then pcall(FDJ.PvPLayout) end
    end)

    panel:HookScript("OnHide", function() page:Hide() end)

    local pending
    for _, event in ipairs({ "GET_ITEM_INFO_RECEIVED", "UPDATE_FACTION", "QUEST_TURNED_IN", "QUEST_DATA_LOAD_RESULT", "PLAYER_LEVEL_UP", "QUEST_ACCEPTED", "QUEST_REMOVED", "QUEST_LOG_UPDATE" }) do
        pcall(page.RegisterEvent, page, event)
    end
    page:SetScript("OnEvent", function(self)
        if pending or not self:IsVisible() then return end
        pending = true
        local function redraw()
            pending = nil
            if self:IsVisible() then Refresh() end
        end
        if C_Timer and C_Timer.After then C_Timer.After(0.3, redraw) else redraw() end
    end)
    page:Hide()
    return page
end



function FDJ.OpenPvPRewards(key, side)
    local panel = _G.ForeverDungeonJournalPvPPanel
    if not (panel and key) then return end
    Build(panel)
    page.key = key
    page.side = (side == "Alliance" or side == "Horde") and side or OwnSide()
    page.mapLoc = nil
    ShowCards(false)
    page:Show()
    if page.scroll.SetVerticalScroll then page.scroll:SetVerticalScroll(0) end
    Refresh()
end

function FDJ.IsPvPRewardsShown()
    return page ~= nil and page:IsShown()
end


function FDJ.ClosePvPRewards()
    if page and page:IsShown() then page:Hide() end
end








local function ShownItem(id)
    for _, kind in ipairs({ "icons", "rows" }) do
        for i = 1, used[kind] or 0 do
            local b = pools[kind][i]
            if b and b:IsShown() and b.fdjItemID == id then return b end
        end
    end
    return nil
end
local function Flash(b)
    if not b.fdjFound then
        b.fdjFound = b:CreateTexture(nil, "OVERLAY", nil, 7)
        b.fdjFound:SetAllPoints()
        b.fdjFound:SetColorTexture(1.00, 0.82, 0.10, 0.35)
        b.fdjFound:SetBlendMode("ADD")
    end
    b.fdjFound:Show()
    local token = {}
    b.fdjFoundToken = token
    if C_Timer and C_Timer.After then
        C_Timer.After(2.5, function() if b.fdjFoundToken == token and b.fdjFound then b.fdjFound:Hide() end end)
    end
end
local function FocusItem(id)
    local function apply()
        if not (page and page:IsShown()) then return end
        local b = ShownItem(id)
        if not b then return end
        local top, listTop = b:GetTop(), page.content:GetTop()
        if top and listTop and page.scroll.SetVerticalScroll then
            local view = page.scroll:GetHeight() or 0
            local most = math.max(0, (page.content:GetHeight() or 0) - view)
            page.scroll:SetVerticalScroll(math.max(0, math.min(most, (listTop - top) - view * 0.3)))
        end
        Flash(b)
    end
    if C_Timer and C_Timer.After then C_Timer.After(0.05, apply) else apply() end
end
local function OpenFromSearch(key, side, id)
    if FDJ.OpenPvPPage then FDJ.OpenPvPPage() end
    FDJ.OpenPvPRewards(key, side)
    if id then FocusItem(id) end
end
local SHORT = { WSG = { "wsg" }, AB = { "ab" }, AV = { "av" }, DI = { "di", "dsi" } }
FDJ.SEARCH_PROVIDERS = FDJ.SEARCH_PROVIDERS or {}
table.insert(FDJ.SEARCH_PROVIDERS, function(query, Score, DisplayName)
    if not (FDJ.PVP_REWARDS and FDJ.PvPBattlegroundKeys and FDJ.PvPBattlegroundInfo) then return nil end
    if FDJ.IsPvPIconHidden and FDJ.IsPvPIconHidden() then return nil end
    local out = {}
    for _, key in ipairs(FDJ.PvPBattlegroundKeys()) do
        local name = FDJ.PvPBattlegroundName and FDJ.PvPBattlegroundName(key) or key
        local english, art, crop = FDJ.PvPBattlegroundInfo(key)



        local short = SHORT[key] or {}
        local score = Score(query, name, english, short[1], short[2])
        if score then
            out[#out + 1] = {
                kind = "dungeon", dungeonName = "PvP:" .. key, displayName = name, subText = L("PVP_SEARCH_BG"),
                icon = art, texCoord = crop, score = score - 30,
                open = function() OpenFromSearch(key) end,
            }
        end
        local bg = FDJ.PVP_REWARDS[key]
        if type(bg) == "table" and #query >= 2 then
            for _, side in ipairs({ "Alliance", "Horde" }) do
                local s = bg[side]
                if type(s) == "table" then
                    local parts = {}
                    for n = 5, 8 do
                        if type(s[n]) == "table" then parts[#parts + 1] = { s[n], StandingLabel(n) } end
                    end
                    if type(s.questRewards) == "table" then parts[#parts + 1] = { s.questRewards, L("PVP_QUEST_REWARDS") } end
                    if type(s.mounts) == "table" then parts[#parts + 1] = { s.mounts, L("PVP_MOUNTS") } end
                    if type(s.supplies) == "table" then parts[#parts + 1] = { s.supplies, L("PVP_SUPPLIES") } end
                    for _, part in ipairs(parts) do
                        for _, entry in ipairs(part[1]) do
                            local id = type(entry) == "table" and Pick(entry) or nil
                            if id then
                                local english = (FDJ.PVP_ITEM_NAMES and FDJ.PVP_ITEM_NAMES[id]) or entry[1]
                                local shown = DisplayName({ id, english })
                                local matched = Score(query, shown, english, entry[1])
                                if matched then
                                    out[#out + 1] = {
                                        kind = "item", mode = "pvp", dungeonName = "PvP:" .. key .. ":" .. side,
                                        itemID = id, iconID = id, faction = side,
                                        displayName = shown, subText = name .. "  -  " .. tostring(part[2] or ""),
                                        score = matched + 2,
                                        open = function() OpenFromSearch(key, side, id) end,
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return out
end)
