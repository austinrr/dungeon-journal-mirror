-- Conservative wing signatures. IDs are Classic references; exact names also
-- work when Forever hides or replaces IDs. Never infer a wing from a prefix.
local FDJ = _G.ForeverDungeonJournal_NS
if not FDJ then return end
FDJ.RunLogWingTrash = {
    ["Dire Maul: East"] = {
        [13022] = "Whip Lasher",
        [13276] = "Wildspawn Imp",
        [11461] = "Warpwood Guardian",
        [11462] = "Warpwood Treant",
        [11464] = "Warpwood Tangler",
        [11465] = "Warpwood Stomper",
        [13021] = "Warpwood Crusher",
        [13196] = "Phase Lasher",
        [13197] = "Fel Lash",
        [11451] = "Wildspawn Satyr",
        [11452] = "Wildspawn Rogue",
        [11453] = "Wildspawn Trickster",
        [11454] = "Wildspawn Betrayer",
        [11455] = "Wildspawn Felsworn",
        [11456] = "Wildspawn Shadowstalker",
        [11457] = "Wildspawn Hellcaller",
    },
    ["Dire Maul: West"] = {
        [11458] = "Petrified Treant",
        [11459] = "Ironbark Protector",
        [11469] = "Eldreth Seether",
        [11470] = "Eldreth Sorcerer",
        [11471] = "Eldreth Apparition",
        [11472] = "Eldreth Spirit",
        [11473] = "Eldreth Spectre",
        [11475] = "Eldreth Phantasm",
        [11480] = "Arcane Aberration",
        [11483] = "Mana Remnant",
        [11484] = "Residual Monstrosity",
    },
    ["Dire Maul: North"] = {
        [11441] = "Gordok Brute",
        [11444] = "Gordok Mage-Lord",
        [11445] = "Gordok Captain",
        [11448] = "Gordok Warlock",
        [11450] = "Gordok Reaver",
        [13036] = "Gordok Mastiff",
    },
    ["Scarlet Monastery: Graveyard"] = {
        [4283] = "Scarlet Sentry",
        [4293] = "Scarlet Scryer",
        [4306] = "Scarlet Torturer",
        [4308] = "Unfettered Spirit",
        [6426] = "Anguished Dead",
        [6427] = "Haunting Phantasm",
    },
    ["Scarlet Monastery: Library"] = {
        [4287] = "Scarlet Gallant",
        [4288] = "Scarlet Beastmaster",
        [4291] = "Scarlet Diviner",
        [4296] = "Scarlet Adept",
        [4304] = "Scarlet Tracking Hound",
    },
    ["Scarlet Monastery: Armory"] = {
        [4286] = "Scarlet Soldier",
        [4289] = "Scarlet Evoker",
        [4290] = "Scarlet Guardsman",
        [4292] = "Scarlet Protector",
        [4297] = "Scarlet Conjuror",
    },
    ["Scarlet Monastery: Cathedral"] = {
        [4294] = "Scarlet Sorcerer",
        [4300] = "Scarlet Wizard",
        [4301] = "Scarlet Centurion",
        [4302] = "Scarlet Champion",
        [4303] = "Scarlet Abbot",
    },
    ["Upper Blackrock Spire"] = {
        [9096] = "Rage Talon Dragonspawn",
        [9818] = "Blackhand Summoner",
        [9819] = "Blackhand Veteran",
    },
    -- Stratholme had no signatures: a run (and the tracker) only started
    -- at the first boss kill unless an English room name matched. IDs and
    -- names checked on Wowhead (Nov 2026); mobs found on both sides
    -- (ghouls, skeletons, gargoyles, cadavers, banshees) are left out.
    ["Stratholme: Living"] = {
        [10418] = "Crimson Guardsman",
        [10419] = "Crimson Conjuror",
        [10420] = "Crimson Initiate",
        [10421] = "Crimson Defender",
        [10422] = "Crimson Sorcerer",
        [10423] = "Crimson Priest",
        [10424] = "Crimson Gallant",
        [10425] = "Crimson Battle Mage",
        [10426] = "Crimson Inquisitor",
        [11043] = "Crimson Monk",
        [11054] = "Crimson Rifleman",
        [11032] = "Malor the Zealous",
    },
    ["Stratholme: Undead"] = {
        [10394] = "Black Guard Sentry",
        [10399] = "Thuzadin Acolyte",
        [10412] = "Crypt Crawler",
        [10413] = "Crypt Beast",
        [10416] = "Bile Spewer",
        [10417] = "Venom Belcher",
    },
    ["Lower Blackrock Spire"] = {
        [9197] = "Spirestone Battle Mage",
        [9198] = "Spirestone Mystic",
        [9199] = "Spirestone Enforcer",
        [9200] = "Spirestone Reaver",
        [9201] = "Spirestone Ogre Magus",
        [9239] = "Smolderthorn Mystic",
        [9240] = "Smolderthorn Shadow Priest",
        [9241] = "Smolderthorn Headhunter",
        [9259] = "Firebrand Grunt",
        [9261] = "Firebrand Darkweaver",
        [9264] = "Firebrand Pyromancer",
        -- spiremobs (2.1.4, M 23 Nov 2026, a Discord report: in Lower
        -- Blackrock Spire the tracker only started at the first boss): more
        -- of the Lower side's own mobs, none of them in Upper Blackrock
        -- Spire: the Bloodaxe and Firebrand orcs of Hordemar City, the
        -- Smolderthorn trolls, the Spirestone Warlord, the Skitterweb spiders
        -- (SOURCES.txt, spiremobs).
        [9262] = "Firebrand Invoker",
        [9583] = "Bloodaxe Veteran",
        [9692] = "Bloodaxe Raider",
        [9693] = "Bloodaxe Evoker",
        [9696] = "Bloodaxe Worg",
        [9716] = "Bloodaxe Warmonger",
        [9717] = "Bloodaxe Summoner",
        [9265] = "Smolderthorn Shadow Hunter",
        [9266] = "Smolderthorn Witch Doctor",
        [9267] = "Smolderthorn Axe Thrower",
        [9268] = "Smolderthorn Berserker",
        [9269] = "Smolderthorn Seer",
        [9216] = "Spirestone Warlord",
        [10374] = "Spire Spider",
        [10375] = "Spire Spiderling",
    },
}
FDJ.RunLogWingGroups = {
    [429] = { "Dire Maul: East", "Dire Maul: West", "Dire Maul: North" },
    [189] = { "Scarlet Monastery: Graveyard", "Scarlet Monastery: Library", "Scarlet Monastery: Armory", "Scarlet Monastery: Cathedral" },
    [229] = { "Lower Blackrock Spire", "Upper Blackrock Spire" },
    [329] = { "Stratholme: Living", "Stratholme: Undead" },
}

-- spireroom (2.1.4, M 23 Nov 2026 on a stream in Hordemar City: "why
-- doesn't it start there directly when people kill a mob in Hordemar
-- City?"): the rooms (the minimap's sub-zone) only one side of Blackrock
-- Spire has. Until the run has a side, a kill in one of them starts it as
-- that side: a first guess, which a later kill of a mob or boss only the
-- other side has still moves (Systems/RunLog.lua). The Hall of Blackhand is
-- left out: both sides start in it (the open ways into Lower Blackrock
-- Spire on its south wall, Upper Blackrock Spire's door on its north wall),
-- and Upper Blackrock Spire has an upper level of it too. English names; in
-- another language the tracker learns the Lower side's rooms itself
-- (FDJ.RunLogRoomLearn).
FDJ.RunLogRoomWings = {
    [229] = {
        ["hordemar city"] = "Lower Blackrock Spire",
        ["mok'doom"] = "Lower Blackrock Spire",
        ["tazz'alaor"] = "Lower Blackrock Spire",
        ["tazz'alor"] = "Lower Blackrock Spire",
        ["skitterweb tunnels"] = "Lower Blackrock Spire",
        ["the storehouse"] = "Lower Blackrock Spire",
        ["halycon's lair"] = "Lower Blackrock Spire",
        ["chamber of battle"] = "Lower Blackrock Spire",
        ["dragonspire hall"] = "Upper Blackrock Spire",
        ["hall of binding"] = "Upper Blackrock Spire",
        ["the rookery"] = "Upper Blackrock Spire",
        ["blackrock stadium"] = "Upper Blackrock Spire",
        ["the furnace"] = "Upper Blackrock Spire",
        ["spire throne"] = "Upper Blackrock Spire",
        ["the beast's lair"] = "Upper Blackrock Spire",
    },
}
-- The side whose rooms are learned in any language: the room a kill of a mob
-- or boss only that side has happens in (a kill only the other side has in
-- such a room marks it as both sides', so it decides nothing). Only the
-- Lower side's: the Hall of Blackhand has none of its mobs, so it is never
-- learned; Upper Blackrock Spire's kills on its upper level would teach it.
FDJ.RunLogRoomLearn = {
    [229] = "Lower Blackrock Spire",
}

-- smwing (2.0.8, M 15 Nov 2026: in the Cathedral the tracker said Graveyard
-- until a Scarlet Wizard died; the Myrmidons killed first can't be in the
-- Graveyard): the wings each shared Scarlet mob lives in, the likeliest
-- first. Such a kill rules the other wings out (Systems/RunLog.lua): when
-- the tracker's wing is one of those, it moves to the likeliest left, and
-- still follows the first kill of a mob only one wing has. Cathedral first
-- for the Myrmidons and Defenders (its courtyard, the Chapel Gardens, is
-- full of them), Library first for the Chaplains and Monks.
FDJ.RunLogSharedWings = {
    [189] = {
        [4295] = { "Scarlet Monastery: Cathedral", "Scarlet Monastery: Armory" }, -- Scarlet Myrmidon
        [4298] = { "Scarlet Monastery: Cathedral", "Scarlet Monastery: Armory" }, -- Scarlet Defender
        [4299] = { "Scarlet Monastery: Library", "Scarlet Monastery: Cathedral" }, -- Scarlet Chaplain
        [4540] = { "Scarlet Monastery: Library", "Scarlet Monastery: Cathedral" }, -- Scarlet Monk
    },
}

-- Real trash, but shared by multiple wings: eligible kills, no wing vote.
FDJ.RunLogSharedTrash = {
    -- Entrance/Scarshield kills count, but never prove the group's route.
    [229] = {
        [9097] = "Scarshield Legionnaire",
        [9098] = "Scarshield Spellbinder",
        [9257] = "Scarshield Warlock",
        [9258] = "Scarshield Raider",
    },
    [189] = {
        [4295] = "Scarlet Myrmidon", -- Armory / Cathedral
        [4298] = "Scarlet Defender", -- Armory / Cathedral
        [4299] = "Scarlet Chaplain", -- Library / Cathedral
        [4540] = "Scarlet Monk", -- Library / Cathedral
    },
}

-- BEGIN wingnames
-- wingnames (2.1.5, M 23 Nov 2026, a Korean client in the Scarlet Monastery's
-- Cathedral with the tracker still on the Library until the first boss: "can't
-- we just research all these names? ... it's the client"): the names of the
-- mobs and rooms that tell a shared instance's wings apart, in each client
-- language, baked in. Before, only English names were known: on another
-- language's client the rooms told nothing and the mobs only once the game
-- had shown them (Systems/ClientNames.lua learns them, from the next login),
-- so a first run there could start late or as the wrong wing.
-- Mob names: the game's own; where two spellings are in use, both. Room
-- names: the game's area names. Italian clients: the rooms only (the mobs
-- are learned as before).
FDJ.RunLogMobNamesL10n = {
    [11451] = { deDE = "Satyr der Wildhufe", esES = "Sátiro Mala Hierba", esMX = "Sátiro Mala Hierba", frFR = "Satyre Follengeance", koKR = "야생혈족 사티로스", ptBR = "Sátiro Criasselvagem", ruRU = "Сатир из племени Исчадий Природы", zhCN = "荒野萨特", zhTW = "荒野薩特" }, -- Wildspawn Satyr
    [11452] = { deDE = "Schurke der Wildhufe", esES = "Pícaro Mala Hierba", esMX = "Pícaro Mala Hierba", frFR = "Voleur Follengeance", koKR = "야생혈족 도적", ptBR = "Ladino Criasselvagem", ruRU = "Разбойник из племени Исчадий Природы", zhCN = "荒野游荡者", zhTW = "荒野遊蕩者" }, -- Wildspawn Rogue
    [11453] = { deDE = "Schwindler der Wildhufe", esES = "Timador Mala Hierba", esMX = "Timador Mala Hierba", frFR = "Entourloupeur Follengeance", koKR = "야생혈족 요술사", ptBR = "Trapaceiro Criasselvagem", ruRU = "Плут из племени Исчадий Природы", zhCN = "荒野欺诈者", zhTW = "荒野欺詐者" }, -- Wildspawn Trickster
    [11454] = { deDE = "Verräter der Wildhufe", esES = "Traidor Mala Hierba", esMX = "Traidor Mala Hierba", frFR = "Traître Follengeance", koKR = "야생혈족 배반자", ptBR = "Traidor Criasselvagem", ruRU = "Предатель из племени Исчадий Природы", zhCN = "荒野背叛者", zhTW = "荒野背叛者" }, -- Wildspawn Betrayer
    [11455] = { deDE = "Teufelsanbeter der Wildhufe", esES = "Jurapenas Mala Hierba", esMX = "Jurapenas Mala Hierba", frFR = "Lige de la corruption Follengeance", koKR = "야생혈족 악마추종자", ptBR = "Devoto Vil Criasselvagem", ruRU = "Скверноподданный из племени Исчадий Природы", zhCN = "荒野魔仆", zhTW = "荒野魔僕" }, -- Wildspawn Felsworn
    [11456] = { deDE = "Schattenpirscher der Wildhufe", esES = "Acechasombras Mala Hierba", esMX = "Acechasombras Mala Hierba", frFR = "Traqueur des ombres Follengeance", koKR = "야생혈족 그림자추적자", ptBR = "Assombrante Criasselvagem", ruRU = "Тенелов из племени Исчадий Природы", zhCN = "荒野暗影行者", zhTW = { "荒野巡影者", "荒野暗影行者" } }, -- Wildspawn Shadowstalker
    [11457] = { deDE = "Höllenrufer der Wildhufe", esES = "Clamainferno Mala Hierba", esMX = "Clamainferno Mala Hierba", frFR = "Invocateur infernal Follengeance", koKR = "야생혈족 지옥소환사", ptBR = "Infernarauto Criasselvagem", ruRU = "Призыватель огня из племени Исчадий Природы", zhCN = "荒野唤魔者", zhTW = "荒野喚魔者" }, -- Wildspawn Hellcaller
    [11461] = { deDE = "Wucherborkenwächter", esES = "Guardián Combadera", esMX = "Guardián Combadera", frFR = "Gardien Crochebois", koKR = "수호의 굽이나무정령", ptBR = "Guardião de Lenhatorta", ruRU = "Страж-криводрев", zhCN = "扭木守护者", zhTW = "扭木守護者" }, -- Warpwood Guardian
    [11462] = { deDE = "Wucherborkentreant", esES = "Antárbol Combadera", esMX = "Antárbol Combadera", frFR = "Tréant Crochebois", koKR = "굽이나무정령", ptBR = "Arvoroso Lenhatorta", ruRU = "Древень-криводрев", zhCN = "扭木树人", zhTW = "扭木樹人" }, -- Warpwood Treant
    [11464] = { deDE = "Wucherborkengreifer", esES = "Enmarañador Combadera", esMX = "Enmarañador Combadera", frFR = "Noueur Crochebois", koKR = "뿌리의 굽이나무정령", ptBR = "Emaranhador Lenhatorta", ruRU = "Криводрев-ветвеплет", zhCN = "扭木纠缠者", zhTW = "扭木糾纏者" }, -- Warpwood Tangler
    [11465] = { deDE = "Wucherborkenstampfer", esES = "Vapuleador Combadera", esMX = "Vapuleador Combadera", frFR = "Ecraseur Crochebois", koKR = "우레의 굽이나무정령", ptBR = "Pisoteador Lenhatorta", ruRU = "Криводрев-топотун", zhCN = "扭木践踏者", zhTW = "扭木踐踏者" }, -- Warpwood Stomper
    [13021] = { deDE = "Wucherborkenzermalmer", esES = "Triturador Combadera", esMX = "Triturador Combadera", frFR = "Cogneur Crochebois", koKR = "분쇄의 굽이나무정령", ptBR = "Esmagador Lenhatorta", ruRU = "Криводрев Сокрушитель", zhCN = "扭木摧毁者", zhTW = "扭木摧毀者" }, -- Warpwood Crusher
    [13022] = { deDE = "Dornenpeitscher", esES = { "Fustigador", "Latigador" }, esMX = { "Fustigador", "Latigador" }, frFR = "Claque-fouet", koKR = "채찍덩굴손", ptBR = "Chicoteiro", ruRU = "Кнутохлест", zhCN = "抽笞者", zhTW = { "抽擊鞭笞者", "抽笞者" } }, -- Whip Lasher
    [13196] = { deDE = "Phasenpeitscher", esES = "Latigador de fase", esMX = "Latigador de fase", frFR = "Flagellant phasique", koKR = "차원의 덩굴손", ptBR = "Açoitador Dimensional", ruRU = "Фазовый плеточник", zhCN = "相位鞭笞者", zhTW = "相位鞭笞者" }, -- Phase Lasher
    [13197] = { deDE = "Teufelspeitscher", esES = "Latinefasto", esMX = "Latinefasto", frFR = "Gangrefouet", koKR = "악마의 덩굴손", ptBR = "Açoitador Vil", ruRU = "Плетник Скверны", zhCN = "魔鞭抽笞者", zhTW = "魔鞭抽笞者" }, -- Fel Lash
    [13276] = { deDE = "Wichtel der Wildhufe", esES = "Diablillo Mala Hierba", esMX = "Diablillo Mala Hierba", frFR = "Diablotin Follengeance", koKR = "야생혈족 임프", ptBR = "Diabrete Criasselvagem", ruRU = "Дикий бес из племени Исчадий Природы", zhCN = "荒野小鬼", zhTW = "荒野小鬼" }, -- Wildspawn Imp
    [11441] = { deDE = "Schläger der Gordok", esES = "Tosco Gordok", esMX = "Tosco Gordok", frFR = "Brute Gordok", koKR = "고르독일족 투사", ptBR = "Brutamontes Gordok", ruRU = "Громила из клана Гордок", zhCN = "戈多克蛮兵", zhTW = { "戈多克蠻卒", "戈多克蠻兵" } }, -- Gordok Brute
    [11444] = { deDE = "Magierlord der Gordok", esES = { "Señor de la magia Gordok", "Señor de la Magia Gordok" }, esMX = { "Señor de la magia Gordok", "Señor de la Magia Gordok" }, frFR = "Seigneur-mage Gordok", koKR = "고르독일족 대마법사", ptBR = "Lorde-mago Gordok", ruRU = "Маг-лорд из клана Гордок", zhCN = "戈多克大法师", zhTW = { "戈多克法師領主", "戈多克大法師" } }, -- Gordok Mage-Lord
    [11445] = { deDE = "Captain der Gordok", esES = "Capitán Gordok", esMX = "Capitán Gordok", frFR = "Capitaine Gordok", koKR = "고르독일족 전투대장", ptBR = "Capitão Gordok", ruRU = "Капитан из клана Гордок", zhCN = "戈多克领主", zhTW = "戈多克領主" }, -- Gordok Captain
    [11448] = { deDE = "Hexenmeister der Gordok", esES = "Brujo Gordok", esMX = "Brujo Gordok", frFR = "Démoniste Gordok", koKR = "고르독일족 흑마법사", ptBR = "Bruxo Gordok", ruRU = "Чернокнижник из клана Гордок", zhCN = "戈多克术士", zhTW = "戈多克術士" }, -- Gordok Warlock
    [11450] = { deDE = "Häscher der Gordok", esES = "Atracador Gordok", esMX = "Atracador Gordok", frFR = "Ravageur Gordok", koKR = "고르독일족 약탈자", ptBR = "Aniquilador Gordok", ruRU = "Разоритель из клана Гордок", zhCN = "戈多克掠夺者", zhTW = { "戈多克搶奪者", "戈多克掠奪者" } }, -- Gordok Reaver
    [13036] = { deDE = "Mastiff der Gordok", esES = { "Mastín Gordok", "Masadura Gordok" }, esMX = { "Mastín Gordok", "Masadura Gordok" }, frFR = "Mastiff Gordok", koKR = "덩치큰 고르독일족 하이에나", ptBR = "Mastim Gordok", ruRU = "Мастифф клана Гордок", zhCN = "戈多克驯狼", zhTW = "戈多克馴狼" }, -- Gordok Mastiff
    [11458] = { deDE = "Versteinerter Treant", esES = "Antárbol petrificado", esMX = "Antárbol petrificado", frFR = "Tréant pétrifié", koKR = "무쇠껍질 나무정령", ptBR = "Arvoroso Petrificado", ruRU = "Одеревеневший древень", zhCN = "僵化的树人", zhTW = "僵化的樹人" }, -- Petrified Treant
    [11459] = { deDE = "Beschützer von Eisenborke", esES = "Protector Cortezaférrea", esMX = "Protector Cortezaférrea", frFR = "Protecteur Ecorcefer", koKR = "무쇠껍질 수호정령", ptBR = "Protetor Cascaferro", ruRU = "Железнокор-заступник", zhCN = "埃隆巴克保护者", zhTW = { "埃隆巴克保衛者", "埃隆巴克保護者" } }, -- Ironbark Protector
    [11469] = { deDE = "Schnauber der Eldreth", esES = "Bullidor Eldreth", esMX = "Bullidor Eldreth", frFR = "Rongé Eldreth", koKR = "엘드레스 군중", ptBR = "Furiário Eldretiano", ruRU = "Огнечар Элдрета", zhCN = "艾德雷斯怨魂", zhTW = "艾德雷斯怨魂" }, -- Eldreth Seether
    [11470] = { deDE = "Zauberhexer der Eldreth", esES = "Hechicero Eldreth", esMX = "Hechicero Eldreth", frFR = "Sorcier Eldreth", koKR = "엘드레스 마술사", ptBR = "Feiticeiro Eldretiano", ruRU = "Элдретарский колдун", zhCN = "艾德雷斯巫师", zhTW = { "艾德雷斯巫士", "艾德雷斯巫師" } }, -- Eldreth Sorcerer
    [11471] = { deDE = "Erscheinung der Eldreth", esES = { "Aparecido Eldreth", "Aparición Eldreth" }, esMX = { "Aparecido Eldreth", "Aparición Eldreth" }, frFR = "Fantôme Eldreth", koKR = "엘드레스 유령", ptBR = "Aparição Eldretiana", ruRU = "Элдретарская тень", zhCN = "艾德雷斯鬼怪", zhTW = { "艾德雷斯亡魂", "艾德雷斯鬼怪" } }, -- Eldreth Apparition
    [11472] = { deDE = "Geist der Eldreth", esES = "Espíritu Eldreth", esMX = "Espíritu Eldreth", frFR = "Esprit Eldreth", koKR = "엘드레스 영혼", ptBR = "Espírito Eldretiano", ruRU = "Элдретарский дух", zhCN = "艾德雷斯鬼巫", zhTW = "艾德雷斯鬼巫" }, -- Eldreth Spirit
    [11473] = { deDE = "Schreckgespenst der Eldreth", esES = "Espectrasma Eldreth", esMX = "Espectrasma Eldreth", frFR = "Spectre Eldreth", koKR = "엘드레스 원혼", ptBR = "Espectro Eldretiano", ruRU = "Элдретарский призрак", zhCN = "艾德雷斯妖灵", zhTW = { "艾德雷斯幽靈", "艾德雷斯妖靈" } }, -- Eldreth Spectre
    [11475] = { deDE = "Trugbild der Eldreth", esES = "Fantasma Eldreth", esMX = "Fantasma Eldreth", frFR = "Fantasme Eldreth", koKR = "엘드레스 환영", ptBR = "Fantasma Eldretiano", ruRU = "Элдретарский фантазм", zhCN = "艾德雷斯幻像", zhTW = { "艾德雷斯魅靈", "艾德雷斯幻象" } }, -- Eldreth Phantasm
    [11480] = { deDE = "Arkane Entartung", esES = "Aberración Arcana", esMX = "Aberración Arcana", frFR = "Aberration des arcanes", koKR = "불가사의한 피조물", ptBR = "Aberração Arcana", ruRU = "Волшебная аберрация", zhCN = "奥术畸兽", zhTW = { "秘法畸獸", "祕法畸獸" } }, -- Arcane Aberration
    [11483] = { deDE = "Manarest", esES = "Despojos de maná", esMX = "Despojos de maná", frFR = "Restes de mana", koKR = "마나 파편", ptBR = "Vestígio de Mana", ruRU = "Клочок маны", zhCN = "法力残渣", zhTW = "法力殘渣" }, -- Mana Remnant
    [11484] = { deDE = "Verbleibender Monsterrest", esES = "Monstruosidad residual", esMX = "Monstruosidad residual", frFR = "Monstruosité résiduelle", koKR = "불가사의한 마력의 소용돌이", ptBR = "Monstruosidade Residual", ruRU = "Рудиментное чудовище", zhCN = "畸形残渣", zhTW = "畸形殘渣" }, -- Residual Monstrosity
    [9197] = { deDE = "Kampfmagier der Felsspitzoger", esES = "Mago de batalla Cumbrerroca", esMX = "Mago de batalla Cumbrerroca", frFR = "Mage de bataille Pierre-du-pic", koKR = "뾰족바위일족 전투마법사", ptBR = "Mago de Batalha Agulhapétrea", ruRU = "Боевой маг из клана Черной Вершины", zhCN = "尖石战斗法师", zhTW = "尖石戰鬥法師" }, -- Spirestone Battle Mage
    [9198] = { deDE = "Mystiker der Felsspitzoger", esES = "Místico Cumbrerroca", esMX = "Místico Cumbrerroca", frFR = "Mystique Pierre-du-pic", koKR = "뾰족바위일족 비술사", ptBR = "Místico Agulhapétrea", ruRU = "Мистик из клана Черной Вершины", zhCN = "尖石秘法师", zhTW = "尖石秘法師" }, -- Spirestone Mystic
    [9199] = { deDE = "Vollstrecker der Felsspitzoger", esES = "Déspota Cumbrerroca", esMX = "Déspota Cumbrerroca", frFR = "Massacreur Pierre-du-pic", koKR = "뾰족바위일족 집행자", ptBR = "Impositor Agulhapétrea", ruRU = "Головорез из клана Черной Вершины", zhCN = "尖石执行者", zhTW = "尖石執行者" }, -- Spirestone Enforcer
    [9200] = { deDE = "Häscher der Felsspitzoger", esES = "Atracador Cumbrerroca", esMX = "Atracador Cumbrerroca", frFR = "Ravageur Pierre-du-pic", koKR = "뾰족바위일족 약탈꾼", ptBR = "Aniquilador Agulhapétrea", ruRU = "Разоритель из клана Черной Вершины", zhCN = "尖石劫掠者", zhTW = { "尖石搶奪者", "尖石劫掠者" } }, -- Spirestone Reaver
    [9201] = { deDE = "Magus der Felsspitzoger", esES = "Ogro Magus Cumbrerroca", esMX = "Ogro Magus Cumbrerroca", frFR = "Ogre-magus Pierre-du-pic", koKR = "뾰족바위일족 오우거마법사", ptBR = "Ogro-mago Agulhapétrea", ruRU = "Огр-волхв из клана Черной Вершины", zhCN = "尖石食人魔法师", zhTW = { "尖石巨魔魔導師", "尖石巨魔法師" } }, -- Spirestone Ogre Magus
    [9216] = { deDE = "Kriegsherr der Felsspitzoger", esES = "Señor de la Guerra Cumbrerroca", esMX = "Señor de la Guerra Cumbrerroca", frFR = "Chef de guerre Pierre-du-pic", koKR = "뾰족바위일족 투사", ptBR = "Senhor da Guerra Agulhapétrea", ruRU = "Полководец из клана Черной Вершины", zhCN = "尖石军阀", zhTW = { "尖石督軍", "尖石軍閥" } }, -- Spirestone Warlord
    [9239] = { deDE = "Mystiker der Gluthauer", esES = "Místico Espina Ahumada", esMX = "Místico Espina Ahumada", frFR = "Mystique Smolderthorn", koKR = "가시불꽃부족 비술사", ptBR = "Místico Fumocardo", ruRU = "Мистик из племени Тлеющего Терновника", zhCN = "燃棘秘法师", zhTW = "燃棘秘法師" }, -- Smolderthorn Mystic
    [9240] = { deDE = "Schattenpriester der Gluthauer", esES = "Sacerdote de las Sombras Espina Ahumada", esMX = "Sacerdote de las Sombras Espina Ahumada", frFR = "Prêtre des ombres Smolderthorn", koKR = "가시불꽃부족 어둠의사제", ptBR = "Sacerdote Sombrio Fumocardo", ruRU = { "Жрец Тьмы из племени Тлеющего Терновника", "Жрец Тени из племени Тлеющего Терновника" }, zhCN = "燃棘暗影牧师", zhTW = "燃棘暗影牧師" }, -- Smolderthorn Shadow Priest
    [9241] = { deDE = "Kopfjäger der Gluthauer", esES = "Rebanacabezas Espina Ahumada", esMX = "Rebanacabezas Espina Ahumada", frFR = "Chasseur de têtes Smolderthorn", koKR = "가시불꽃부족 인간사냥꾼", ptBR = "Caçador de Cabeças Fumocardo", ruRU = "Охотник за головами из племени Тлеющего Терновника", zhCN = "燃棘猎头者", zhTW = "燃棘獵頭者" }, -- Smolderthorn Headhunter
    [9259] = { deDE = "Grunzer der Feuerbrand", esES = "Bruto Pirotigma", esMX = "Bruto Pirotigma", frFR = "Grunt de Brandefeu", koKR = "횃불부대 그런트", ptBR = "Bruto Temerário", ruRU = "Рубака из легиона Огненного Клейма", zhCN = "火印步兵", zhTW = { "火印蠻兵", "火印步兵" } }, -- Firebrand Grunt
    [9261] = { deDE = "Dunkelwirker der Feuerbrand", esES = "Tejeoscuro Pirotigma", esMX = "Tejeoscuro Pirotigma", frFR = "Tisseur d’ombre de Brandefeu", koKR = "횃불부대 흑마술사", ptBR = "Tecetrevas Temerário", ruRU = "Темнопряд из легиона Огненного Клейма", zhCN = "火印暗法师", zhTW = "火印暗法師" }, -- Firebrand Darkweaver
    [9262] = { deDE = "Herbeirufer der Feuerbrand", esES = "Conjurador Pirotigma", esMX = "Conjurador Pirotigma", frFR = "Invocateur de Brandefeu", koKR = "횃불부대 기원사", ptBR = "Invocador Temerário", ruRU = "Призыватель духов из легиона Огненного Клейма", zhCN = "火印祈求者", zhTW = { "火印塑能師", "火印祈求者" } }, -- Firebrand Invoker
    [9264] = { deDE = "Pyromant der Feuerbrand", esES = "Pirómano Pirotigma", esMX = "Pirómano Pirotigma", frFR = "Pyromancien de Brandefeu", koKR = "횃불부대 화염술사", ptBR = "Piromante Temerário", ruRU = "Пиромант из легиона Огненного Клейма", zhCN = "火印炎术师", zhTW = "火印炎術師" }, -- Firebrand Pyromancer
    [9265] = { deDE = "Schattenjäger der Gluthauer", esES = "Cazador de las Sombras Espina Ahumada", esMX = "Cazador de las Sombras Espina Ahumada", frFR = "Chasseur d'ombre Smolderthorn", koKR = "가시불꽃부족 어둠사냥꾼", ptBR = "Caçador Sombrio Fumocardo", ruRU = "Темный охотник из племени Тлеющего Терновника", zhCN = "燃棘暗影猎手", zhTW = "燃棘暗影獵手" }, -- Smolderthorn Shadow Hunter
    [9266] = { deDE = "Hexendoktor der Gluthauer", esES = "Médico Brujo Espina Ahumada", esMX = "Médico Brujo Espina Ahumada", frFR = "Sorcier-docteur Smolderthorn", koKR = "가시불꽃부족 의술사", ptBR = "Mandingueiro Fumocardo", ruRU = "Знахарь из племени Тлеющего Терновника", zhCN = "燃棘巫医", zhTW = "燃棘巫醫" }, -- Smolderthorn Witch Doctor
    [9267] = { deDE = "Axtwerfer der Gluthauer", esES = "Lanzahachas Espina Ahumada", esMX = "Lanzahachas Espina Ahumada", frFR = "Lanceur de haches Smolderthorn", koKR = "가시불꽃부족 도끼투척병", ptBR = "Arremessador de Machados Fumocardo", ruRU = "Метатель топоров из племени Тлеющего Терновника", zhCN = "燃棘掷斧者", zhTW = "燃棘擲斧者" }, -- Smolderthorn Axe Thrower
    [9268] = { deDE = "Berserker der Gluthauer", esES = "Rabioso Espina Ahumada", esMX = "Rabioso Espina Ahumada", frFR = "Berserker Smolderthorn", koKR = "가시불꽃부족 광전사", ptBR = "Berserker Fumocardo", ruRU = "Берсерк из племени Тлеющего Терновника", zhCN = "燃棘狂战士", zhTW = "燃棘狂戰士" }, -- Smolderthorn Berserker
    [9269] = { deDE = "Seher der Gluthauer", esES = "Profeta Espina Ahumada", esMX = "Profeta Espina Ahumada", frFR = "Prophète Smolderthorn", koKR = "가시불꽃부족 예언자", ptBR = "Vidente Fumocardo", ruRU = "Ясновидец из племени Тлеющего Терновника", zhCN = "燃棘先知", zhTW = "燃棘先知" }, -- Smolderthorn Seer
    [9583] = { deDE = "Veteran der Blutäxte", esES = "Veterano Hacha de Sangre", esMX = "Veterano Hacha de Sangre", frFR = "Vétéran Bloodaxe", koKR = "도끼부대 고참병", ptBR = "Veterano do Machado Sangrento", ruRU = "Ветеран из легиона Кровавого Топора", zhCN = "血斧精兵", zhTW = "血斧精兵" }, -- Bloodaxe Veteran
    [9692] = { deDE = "Räuber der Blutäxte", esES = "Asaltante Hacha de Sangre", esMX = "Asaltante Hacha de Sangre", frFR = "Ecumeur Bloodaxe", koKR = "도끼부대 공격대원", ptBR = "Saqueador do Machado Sangrento", ruRU = "Налетчик из легиона Кровавого Топора", zhCN = "血斧袭击者", zhTW = { "血斧劫掠者", "血斧襲擊者" } }, -- Bloodaxe Raider
    [9693] = { deDE = "Rufer der Blutäxte", esES = "Evocador Hacha de Sangre", esMX = "Evocador Hacha de Sangre", frFR = "Evocateur Bloodaxe", koKR = "도끼부대 기원사", ptBR = "Conjurador do Machado Sangrento", ruRU = "Вызыватель из легиона Кровавого Топора", zhCN = "血斧招魂师", zhTW = { "血斧塑能師", "血斧招魂師" } }, -- Bloodaxe Evoker
    [9696] = { deDE = "Worg der Blutäxte", esES = "Lupo Hacha de Sangre", esMX = "Lupo Hacha de Sangre", frFR = "Worg Bloodaxe", koKR = "도끼부대 검은늑대", ptBR = "Worg Machado Sangrento", ruRU = "Ворг легиона Кровавого Топора", zhCN = "血斧座狼", zhTW = "血斧座狼" }, -- Bloodaxe Worg
    [9716] = { deDE = "Kriegstreiber der Blutäxte", esES = "Belicista Hacha de Sangre", esMX = "Belicista Hacha de Sangre", frFR = "Combattant Bloodaxe", koKR = "도끼부대 전사", ptBR = "Fomentador da Guerra Machado Sangrento", ruRU = "Солдат-наемник из легиона Кровавого Топора", zhCN = "血斧好战者", zhTW = "血斧好戰者" }, -- Bloodaxe Warmonger
    [9717] = { deDE = "Beschwörer der Blutäxte", esES = "Invocador Hacha de Sangre", esMX = "Invocador Hacha de Sangre", frFR = "Invocateur Bloodaxe", koKR = "도끼부대 소환사", ptBR = "Evocador do Machado Sangrento", ruRU = "Призыватель из легиона Кровавого Топора", zhCN = "血斧召唤师", zhTW = "血斧召喚師" }, -- Bloodaxe Summoner
    [10374] = { deDE = "Spitzenspinne", esES = "Araña de la cumbre", esMX = "Araña de la cumbre", frFR = "Araignée du pic", koKR = "첨탑거미", ptBR = "Aranha do Pináculo", ruRU = "Скальный паук", zhCN = "尖塔蜘蛛", zhTW = "尖塔蜘蛛" }, -- Spire Spider
    [10375] = { deDE = "Spitzenspinnling", esES = "Arañita de la cumbre", esMX = "Arañita de la cumbre", frFR = "Jeune araignée du pic", koKR = "새끼 첨탑거미", ptBR = "Filhote de Aranha do Pináculo", ruRU = "Скальный паучонок", zhCN = "尖塔小蜘蛛", zhTW = "尖塔小蜘蛛" }, -- Spire Spiderling
    [4286] = { deDE = "Scharlachroter Soldat", esES = "Soldado Escarlata", esMX = "Soldado Escarlata", frFR = "Soldat écarlate", koKR = "붉은십자군 병사", ptBR = "Soldado Escarlate", ruRU = "Солдат из Алого ордена", zhCN = "血色士兵", zhTW = "血色士兵" }, -- Scarlet Soldier
    [4289] = { deDE = "Scharlachroter Rufer", esES = "Evocador Escarlata", esMX = "Evocador Escarlata", frFR = "Evocateur écarlate", koKR = "붉은십자군 강령사", ptBR = "Evocador Escarlate", ruRU = "Вызыватель из Алого ордена", zhCN = "血色招魂师", zhTW = { "血色塑能師", "血色招魂師" } }, -- Scarlet Evoker
    [4290] = { deDE = "Scharlachroter Gardist", esES = "Custodio Escarlata", esMX = "Custodio Escarlata", frFR = "Gardien écarlate", koKR = "붉은십자군 보초", ptBR = "Guarda Escarlate", ruRU = "Охранник из Алого ордена", zhCN = "血色卫兵", zhTW = "血色衛兵" }, -- Scarlet Guardsman
    [4292] = { deDE = "Scharlachroter Beschützer", esES = "Protector Escarlata", esMX = "Protector Escarlata", frFR = "Protecteur écarlate", koKR = "붉은십자군 수호병", ptBR = "Protetor Escarlate", ruRU = "Заступник из Алого ордена", zhCN = "血色保卫者", zhTW = "血色保衛者" }, -- Scarlet Protector
    [4297] = { deDE = "Scharlachroter Herbeizauberer", esES = "Conjurador Escarlata", esMX = "Conjurador Escarlata", frFR = "Conjurateur écarlate", koKR = "붉은십자군 요술사", ptBR = "Conjurador Escarlate", ruRU = "Окудник из Алого ордена", zhCN = "血色咒术师", zhTW = "血色咒術師" }, -- Scarlet Conjuror
    [4294] = { deDE = "Scharlachroter Zauberhexer", esES = "Hechicero Escarlata", esMX = "Hechicero Escarlata", frFR = "Ensorceleur écarlate", koKR = "붉은십자군 빙술사", ptBR = "Feiticeiro Escarlate", ruRU = "Колдун из Алого ордена", zhCN = "血色魔术师", zhTW = { "血色巫士", "血色魔術師" } }, -- Scarlet Sorcerer
    [4300] = { deDE = "Scharlachroter Hexer", esES = "Zahorí Escarlata", esMX = "Zahorí Escarlata", frFR = "Sorcier écarlate", koKR = "붉은십자군 마술사", ptBR = "Teurgo Escarlate", ruRU = "Волшебник из Алого ордена", zhCN = "血色巫师", zhTW = "血色巫師" }, -- Scarlet Wizard
    [4301] = { deDE = "Scharlachroter Zenturio", esES = "Centurión Escarlata", esMX = "Centurión Escarlata", frFR = "Centurion écarlate", koKR = "붉은십자군 백인대장", ptBR = "Centurião Escarlate", ruRU = "Центурион из Алого ордена", zhCN = "血色百夫长", zhTW = "血色百夫長" }, -- Scarlet Centurion
    [4302] = { deDE = "Scharlachroter Held", esES = "Campeón Escarlata", esMX = "Campeón Escarlata", frFR = "Champion écarlate", koKR = "붉은십자군 용사", ptBR = "Campeão Escarlate", ruRU = "Воитель из Алого ордена", zhCN = "血色勇士", zhTW = "血色勇士" }, -- Scarlet Champion
    [4303] = { deDE = "Scharlachroter Abt", esES = "Abad Escarlata", esMX = "Abad Escarlata", frFR = "Abbé écarlate", koKR = "붉은십자군 대수도원장", ptBR = "Abade Escarlate", ruRU = "Аббат из Алого ордена", zhCN = "血色修士", zhTW = "血色修士" }, -- Scarlet Abbot
    [4283] = { deDE = "Scharlachroter Wachposten", esES = { "Avizor Escarlata", "Argos Escarlata" }, esMX = { "Avizor Escarlata", "Argos Escarlata" }, frFR = "Sentinelle écarlate", koKR = "붉은십자군 파수병", ptBR = "Sentinela Escarlate", ruRU = "Караульный из Алого ордена", zhCN = "血色哨兵", zhTW = "血色哨兵" }, -- Scarlet Sentry
    [4293] = { deDE = "Scharlachroter Wahrsager", esES = "Arúspice Escarlata", esMX = "Arúspice Escarlata", frFR = "Clairvoyant écarlate", koKR = "붉은십자군 점술사", ptBR = "Áugure Escarlate", ruRU = "Провидец из Алого ордена", zhCN = "血色占卜师", zhTW = { "血色占卜者", "血色占卜師" } }, -- Scarlet Scryer
    [4306] = { deDE = "Scharlachroter Folterknecht", esES = "Torturador Escarlata", esMX = "Torturador Escarlata", frFR = "Tortionnaire écarlate", koKR = "붉은십자군 고문관", ptBR = "Torturador Escarlate", ruRU = "Истязатель из Алого ордена", zhCN = "血色拷问者", zhTW = "血色拷問者" }, -- Scarlet Torturer
    [4308] = { deDE = "Ungefesselter Geist", esES = { "Espíritu sin grilletes", "Espíritu encadenado" }, esMX = { "Espíritu sin grilletes", "Espíritu encadenado" }, frFR = "Esprit libéré", koKR = "해방된 영혼", ptBR = "Espírito Desopresso", ruRU = "Освобожденный дух", zhCN = "自由的幽魂", zhTW = "自由的幽魂" }, -- Unfettered Spirit
    [6426] = { deDE = "Gequälter Toter", esES = { "Muerto angustiado", "Muerto angustioso" }, esMX = { "Muerto angustiado", "Muerto angustioso" }, frFR = "Mort angoissé", koKR = "고통받는 망자", ptBR = "Morto Agonizante", ruRU = "Тоскующий мертвец", zhCN = "痛苦的死者", zhTW = "痛苦的死者" }, -- Anguished Dead
    [6427] = { deDE = "Spuktrugbild", esES = "Fantasma encantado", esMX = "Fantasma encantado", frFR = "Illusion spectrale", koKR = "절규하는 환영", ptBR = "Fantasma Vingador", ruRU = "Блуждающий фантазм", zhCN = "鬼魅幻影", zhTW = { "冤魂魅靈", "鬼魅幻影" } }, -- Haunting Phantasm
    [4287] = { deDE = "Scharlachroter Kavalier", esES = { "Gallardo Escarlata", "Galante Escarlata" }, esMX = { "Gallardo Escarlata", "Galante Escarlata" }, frFR = "Vaillant écarlate", koKR = "붉은십자군 수행원", ptBR = "Nobre Escarlate", ruRU = "Орденоносец из Алого ордена", zhCN = "血色豪侠", zhTW = "血色豪俠" }, -- Scarlet Gallant
    [4288] = { deDE = "Scharlachroter Bestienmeister", esES = "Maestro de bestias Escarlata", esMX = "Maestro de bestias Escarlata", frFR = "Belluaire écarlate", koKR = "붉은십자군 조련사", ptBR = "Senhor das Feras Escarlate", ruRU = "Зверолов из Алого ордена", zhCN = "血色驯兽员", zhTW = "血色馴獸員" }, -- Scarlet Beastmaster
    [4291] = { deDE = "Scharlachroter Rutengänger", esES = "Adivinador Escarlata", esMX = "Adivinador Escarlata", frFR = "Devin écarlate", koKR = "붉은십자군 풍수사", ptBR = "Vaticinador Escarlate", ruRU = "Гадатель из Алого ордена", zhCN = "血色教士", zhTW = { "血色預言師", "血色教士" } }, -- Scarlet Diviner
    [4296] = { deDE = "Scharlachroter Adept", esES = "Adepto Escarlata", esMX = "Adepto Escarlata", frFR = "Adepte écarlate", koKR = "붉은십자군 상급사제", ptBR = "Adepto Escarlate", ruRU = "Адепт из Алого ордена", zhCN = "血色老兵", zhTW = "血色老兵" }, -- Scarlet Adept
    [4304] = { deDE = "Scharlachroter Fährtenleserhund", esES = "Sabueso Escarlata", esMX = "Sabueso Escarlata", frFR = "Chien de chasse écarlate", koKR = "붉은십자군 추적용 하이에나", ptBR = "Cão Farejador Escarlate", ruRU = "Ищейка из Алого ордена", zhCN = "血色捕猎犬", zhTW = "血色捕獵犬" }, -- Scarlet Tracking Hound
    [10418] = { deDE = "Purpurroter Gardist", esES = { "Custodio carmesí", "Custodio Carmesí" }, esMX = { "Custodio carmesí", "Custodio Carmesí" }, frFR = "Gardien cramoisi", koKR = "진홍십자군 보초", ptBR = "Guarda Carmesim", ruRU = "Кровавый охранник", zhCN = "红衣卫兵", zhTW = "紅衣衛兵" }, -- Crimson Guardsman
    [10419] = { deDE = "Purpurroter Herbeizauberer", esES = { "Conjurador carmesí", "Conjurador Carmesí" }, esMX = { "Conjurador carmesí", "Conjurador Carmesí" }, frFR = "Conjurateur cramoisi", koKR = "진홍십자군 요술사", ptBR = "Conjurador Carmesim", ruRU = "Окудник из Багрового Легиона", zhCN = "红衣魔术师", zhTW = { "紅衣咒術師", "紅衣魔術師" } }, -- Crimson Conjuror
    [10420] = { deDE = "Purpurroter Initiand", esES = { "Iniciado carmesí", "Iniciado Carmesí" }, esMX = { "Iniciado carmesí", "Iniciado Carmesí" }, frFR = "Initié cramoisi", koKR = "진홍십자군 신입회원", ptBR = "Iniciado Carmesim", ruRU = "Посвященный из Багрового Легиона", zhCN = "红衣新兵", zhTW = "紅衣新兵" }, -- Crimson Initiate
    [10421] = { deDE = "Purpurroter Verteidiger", esES = { "Defensor carmesí", "Defensor Carmesí" }, esMX = { "Defensor carmesí", "Defensor Carmesí" }, frFR = "Défenseur cramoisi", koKR = "진홍십자군 파수병", ptBR = "Defensor Carmesim", ruRU = "Защитник из Багрового Легиона", zhCN = "红衣防御者", zhTW = { "紅衣防衛者", "紅衣防禦者" } }, -- Crimson Defender
    [10422] = { deDE = "Purpurroter Zauberhexer", esES = { "Hechicero carmesí", "Hechicero Carmesí" }, esMX = { "Hechicero carmesí", "Hechicero Carmesí" }, frFR = "Ensorceleur cramoisi", koKR = "진홍십자군 사술사", ptBR = "Feiticeiro Carmesim", ruRU = "Багровый колдун", zhCN = "红衣法术师", zhTW = { "紅衣巫士", "紅衣法術師" } }, -- Crimson Sorcerer
    [10423] = { deDE = "Purpurroter Priester", esES = { "Sacerdote carmesí", "Sacerdote Carmesí" }, esMX = { "Sacerdote carmesí", "Sacerdote Carmesí" }, frFR = "Prêtre cramoisi", koKR = "진홍십자군 사제", ptBR = "Sacerdote Carmesim", ruRU = "Жрец из Багрового Легиона", zhCN = "红衣牧师", zhTW = "紅衣牧師" }, -- Crimson Priest
    [10424] = { deDE = "Purpurroter Kavalier", esES = { "Gallardo carmesí", "Gallardo Carmesí" }, esMX = { "Gallardo carmesí", "Gallardo Carmesí" }, frFR = "Vaillant cramoisi", koKR = "진홍십자군 수행원", ptBR = "Nobre Carmesim", ruRU = "Кавалер из Багрового Легиона", zhCN = "红衣豪侠", zhTW = "紅衣豪俠" }, -- Crimson Gallant
    [10425] = { deDE = "Purpurroter Kampfmagier", esES = { "Mago de batalla carmesí", "Mago de batalla Carmesí" }, esMX = { "Mago de batalla carmesí", "Mago de batalla Carmesí" }, frFR = "Mage de bataille cramoisi", koKR = "진홍십자군 전투마법사", ptBR = "Mago de Batalha Carmesim", ruRU = "Боевой маг из Багрового Легиона", zhCN = "红衣战斗法师", zhTW = "紅衣戰鬥法師" }, -- Crimson Battle Mage
    [10426] = { deDE = "Purpurroter Inquisitor", esES = { "Inquisidor carmesí", "Inquisidor Carmesí" }, esMX = { "Inquisidor carmesí", "Inquisidor Carmesí" }, frFR = "Inquisiteur cramoisi", koKR = "진홍십자군 종교재판관", ptBR = "Inquisidor Carmesim", ruRU = "Инквизитор из Багрового Легиона", zhCN = "红衣审查者", zhTW = { "紅衣審判官", "紅衣審查者" } }, -- Crimson Inquisitor
    [11032] = { deDE = "Malor der Eifrige", esES = { "Malor el Fanático", "Malor el Entusiasta" }, esMX = { "Malor el Fanático", "Malor el Entusiasta" }, frFR = "Malor le Zélé", koKR = "광신자 말로", ptBR = "Malor, o Zeloso", ruRU = "Малор Ревностный", zhCN = "狂热的玛洛尔", zhTW = "狂熱的瑪洛爾" }, -- Malor the Zealous
    [11043] = { deDE = "Purpurroter Mönch", esES = { "Monje carmesí", "Monje Carmesí" }, esMX = { "Monje carmesí", "Monje Carmesí" }, frFR = "Moine cramoisi", koKR = "진홍십자군 수도사", ptBR = "Monge Carmesim", ruRU = "Монах из Багрового Легиона", zhCN = "红衣僧侣", zhTW = "紅衣僧侶" }, -- Crimson Monk
    [11054] = { deDE = "Scharlachroter Scharfschütze", esES = "Fusilero Carmesí", esMX = "Fusilero Carmesí", frFR = "Fusillier cramoisi", koKR = "진홍십자군 소총병", ptBR = "Carabineiro Carmesim", ruRU = "Багровый ружейник", zhCN = "红衣火枪手", zhTW = "紅衣火槍手" }, -- Crimson Rifleman
    [10394] = { deDE = "Wachposten der schwarzen Wache", esES = "Argos Guardia Negra", esMX = "Argos Guardia Negra", frFR = "Sentinelle de la Garde noire", koKR = "검은호위대 보초병", ptBR = "Sentinela da Guarda Negra", ruRU = "Караульный Черной Стражи", zhCN = "黑衣守卫斥候", zhTW = { "黑衣守衛哨兵", "黑衣守衛斥候" } }, -- Black Guard Sentry
    [10399] = { deDE = "Thuzadinakolyt", esES = "Acólito Thuzadin", esMX = "Acólito Thuzadin", frFR = "Acolyte Thuzadin", koKR = "투자딘 수행사제", ptBR = "Acólito Thuzadin", ruRU = "Тузадинский послушник", zhCN = "图萨丁侍僧", zhTW = "圖薩丁侍僧" }, -- Thuzadin Acolyte
    [10412] = { deDE = "Gruftkriecher", esES = "Reptador de la cripta", esMX = "Reptador de la cripta", frFR = "Rampant des cryptes", koKR = "갈퀴발 지하마귀", ptBR = "Rastejante da Cripta", ruRU = "Некрорахнид-ползун", zhCN = "地穴爬行者", zhTW = "地穴爬行者" }, -- Crypt Crawler
    [10413] = { deDE = "Gruftbestie", esES = "Bestia de la cripta", esMX = "Bestia de la cripta", frFR = "Bête des cryptes", koKR = "흉포한 지하마귀", ptBR = "Fera da Cripta", ruRU = "Некрорахнид-живоглот", zhCN = "地穴兽", zhTW = "地穴獸" }, -- Crypt Beast
    [10416] = { deDE = "Gallspucker", esES = "Vomitón bílico", esMX = "Vomitón bílico", frFR = "Cracheur de bile", koKR = "썩은담즙 누더기골렘", ptBR = "Cospebile", ruRU = "Желчеплюй", zhCN = "喷胆者", zhTW = "噴膽者" }, -- Bile Spewer
    [10417] = { deDE = "Giftrülpser", esES = "Eructaveneno", esMX = "Eructaveneno", frFR = "Crache venin", koKR = "독고름 누더기골렘", ptBR = "Arrota-peçonha", ruRU = "Изрыгатель яда", zhCN = "泼毒者", zhTW = "潑毒者" }, -- Venom Belcher
    [9096] = { deDE = "Drachenbrut der Zornkrallen", esES = "Dragauro Garra de Furia", esMX = "Dragauro Garra de Furia", frFR = "Draconide de la Griffe enragée", koKR = "성난발톱용혈족", ptBR = "Dragomorfo Garra Furiosa", ruRU = "Драконид Яростного Когтя", zhCN = "狂爪龙人", zhTW = { "狂爪龍裔", "狂爪龍人" } }, -- Rage Talon Dragonspawn
    [9818] = { deDE = "Blackhand-Beschwörer", esES = "Invocador Puño Negro", esMX = "Invocador Puño Negro", frFR = "Invocateur Blackhand", koKR = "검은손부대 소환사", ptBR = "Evocador da Mão Negra", ruRU = "Призыватель из легиона Чернорука", zhCN = "黑手召唤师", zhTW = "黑手召喚師" }, -- Blackhand Summoner
    [9819] = { deDE = "Blackhand-Veteran", esES = "Veterano Puño Negro", esMX = "Veterano Puño Negro", frFR = "Vétéran Blackhand", koKR = "검은손부대 고참병", ptBR = "Veterano da Mão Negra", ruRU = "Ветеран легиона Чернорука", zhCN = "黑手老兵", zhTW = "黑手老兵" }, -- Blackhand Veteran
    [4295] = { deDE = "Scharlachroter Myrmidone", esES = { "Mirmidón Escarlata", "Myrmidón Escarlata" }, esMX = { "Mirmidón Escarlata", "Myrmidón Escarlata" }, frFR = "Myrmidon écarlate", koKR = "붉은십자군 정예병", ptBR = "Mirmidão Escarlate", ruRU = "Мирмидон из Алого ордена", zhCN = "血色仆从", zhTW = "血色僕從" }, -- Scarlet Myrmidon
    [4298] = { deDE = "Scharlachroter Verteidiger", esES = "Defensor Escarlata", esMX = "Defensor Escarlata", frFR = "Défenseur écarlate", koKR = "붉은십자군 호위병", ptBR = "Defensor Escarlate", ruRU = "Защитник из Алого ордена", zhCN = "血色防御者", zhTW = { "血色防衛者", "血色防禦者" } }, -- Scarlet Defender
    [4299] = { deDE = "Scharlachroter Kaplan", esES = "Capellán Escarlata", esMX = "Capellán Escarlata", frFR = "Chapelain écarlate", koKR = "붉은십자군 전도사", ptBR = "Capelão Escarlate", ruRU = "Капеллан из Алого ордена", zhCN = "血色牧师", zhTW = "血色牧師" }, -- Scarlet Chaplain
    [4540] = { deDE = "Scharlachroter Mönch", esES = "Monje Escarlata", esMX = "Monje Escarlata", frFR = "Moine écarlate", koKR = "붉은십자군 수도사", ptBR = "Monge Escarlate", ruRU = "Монах из Алого ордена", zhCN = "血色僧侣", zhTW = "血色僧侶" }, -- Scarlet Monk
    [9097] = { deDE = "Legionär der Schmetterschilde", esES = "Legionario Escudo del Estigma", esMX = "Legionario Escudo del Estigma", frFR = "Légionnaire du Bouclier balafré", koKR = "방패부대 부대원", ptBR = "Legionário do Escudo Marcado", ruRU = "Легионер из легиона Изрубленного Щита", zhCN = "裂盾军团战士", zhTW = "裂盾軍團戰士" }, -- Scarshield Legionnaire
    [9098] = { deDE = "Zauberbinder der Schmetterschilde", esES = "Vinculador de hechizo Escudo del Estigma", esMX = "Vinculador de hechizo Escudo del Estigma", frFR = "Lieur de sort du Bouclier balafré", koKR = "방패부대 역술사", ptBR = "Mesmerizador do Escudo Marcado", ruRU = "Чароплет из легиона Изрубленного Щита", zhCN = "裂盾缚法师", zhTW = "裂盾縛法師" }, -- Scarshield Spellbinder
    [9257] = { deDE = "Hexenmeister der Schmetterschilde", esES = "Brujo Escudo del Estigma", esMX = "Brujo Escudo del Estigma", frFR = "Démoniste du Bouclier balafré", koKR = "방패부대 흑마법사", ptBR = "Bruxo do Escudo Marcado", ruRU = "Чернокнижник из легиона Изрубленного Щита", zhCN = "裂盾术士", zhTW = "裂盾術士" }, -- Scarshield Warlock
    [9258] = { deDE = "Räuber der Schmetterschilde", esES = "Asaltante Escudo del Estigma", esMX = "Asaltante Escudo del Estigma", frFR = "Ecumeur du Bouclier balafré", koKR = "방패부대 공격대원", ptBR = "Saqueador do Escudo Marcado", ruRU = "Налетчик из легиона Изрубленного Щита", zhCN = "裂盾袭击者", zhTW = { "裂盾劫掠者", "裂盾襲擊者" } }, -- Scarshield Raider
}
FDJ.RunLogRoomNamesL10n = {
    ["athenaeum"] = { deDE = "Das Athenaeum", esES = "El Athenaeum", esMX = "El Athenaeum", frFR = "Athenaeum", itIT = "Ateneo", koKR = "도서관", ptBR = "Ateneu", ruRU = "Читальня", zhCN = "图书馆", zhTW = "圖書館" },
    ["blackrock stadium"] = { deDE = "Schwarzfelsstadion", esES = "Estadio de Roca Negra", esMX = "Estadio de Roca Negra", frFR = "Stade Rochenoire", itIT = "Stadio di Roccianera", koKR = "검은바위 투기장", ptBR = "Estádio Rocha Negra", ruRU = "Стадион Черной горы", zhCN = "黑石竞技场", zhTW = "黑石競技場" },
    ["capital gardens"] = { deDE = "Hauptstadtgärten", esES = "Jardines de la Capital", esMX = "Jardines de la Capital", frFR = "Grands jardins", itIT = "Giardini della Capitale", koKR = "수도 정원", ptBR = "Jardins Capitais", ruRU = "Центральный сад", zhCN = "中心花园", zhTW = "中心花園" },
    ["chamber of atonement"] = { deDE = "Kammer der Buße", esES = "Cámara Expiatoria", esMX = "Cámara Expiatoria", frFR = "Chambre de l'expiation", itIT = "Stanza dell'Espiazione", koKR = "속죄의 방", ptBR = "Câmara da Redenção", ruRU = "Чертог Искупления", zhCN = "忏悔室", zhTW = "懺悔室" },
    ["chamber of battle"] = { deDE = "Kammer der Schlachten", esES = "Sala de la Batalla", esMX = "Sala de la Batalla", frFR = "Chambre de guerre", itIT = "Stanza della Guerra", koKR = "전투의 방", ptBR = "Câmara de Batalha", ruRU = "Чертог Битвы", zhCN = "战斗之厅", zhTW = "戰鬥之廳" },
    ["chapel gardens"] = { deDE = "Kapellengarten", esES = "Jardines de la Capilla", esMX = "Jardines de la Capilla", frFR = "Jardins de la Chapelle", itIT = "Giardini della Cappella", koKR = "예배당 정원", ptBR = "Jardins da Capela", ruRU = "Церковные сады", zhCN = "教堂花园", zhTW = "教堂花園" },
    ["court of the highborne"] = { deDE = "Hof der Hochgeborenen", esES = "Corte de los Altonato", esMX = "Corte de los Altonato", frFR = "Cour des Bien-nés", itIT = "Corte degli Alti Nobili", koKR = "명가의 궁정", ptBR = "A Corte dos Altaneiros", ruRU = "Двор высокорожденных", zhCN = "上层精灵庭院", zhTW = "精靈貴族庭院" },
    ["crusader's armory"] = { deDE = "Waffenkammer der Kreuzzügler", esES = "Arsenal de los Cruzados", esMX = "Arsenal de los Cruzados", frFR = "Armurerie des Croisés", itIT = "Armeria dei Crociati", koKR = "십자군 무기고", ptBR = "Armaria do Cruzado", ruRU = "Оружейная рыцарей", zhCN = "十字军武器库", zhTW = "十字軍軍械庫" },
    ["crusader's chapel"] = { deDE = "Kapelle der Kreuzzügler", esES = "Capilla de los Cruzados", esMX = "Capilla de los Cruzados", frFR = "Chapelle des Croisés", itIT = "Cappella dei Crociati", koKR = "십자군 예배당", ptBR = "Capela do Cruzado", ruRU = "Часовня Ордена", zhCN = "十字军礼拜堂", zhTW = "十字軍禮拜堂" },
    ["crusaders' square"] = { deDE = "Kreuzzüglerplatz", esES = "Plaza de los Cruzados", esMX = "Plaza de los Cruzados", frFR = "Place des croisés", itIT = "Piazza dei Crociati", koKR = "십자군 광장", ptBR = "Praça dos Cruzados", ruRU = "Площадь рыцарей", zhCN = "十字军广场", zhTW = "十字軍廣場" },
    ["dragonspire hall"] = { deDE = "Drachenspitzhalle", esES = "Sala Dracopico", esMX = "Sala Dracopico", frFR = "Hall de la Flèche des dragons", itIT = "Bastione dei Draghi", koKR = "용첨탑 전당", ptBR = "Salão do Espinodrago", ruRU = "Зал Драконов", zhCN = "龙塔大厅", zhTW = "龍塔大廳" },
    ["elders' square"] = { deDE = "Ältestenplatz", esES = "Plaza de los Ancestros", esMX = "Plaza de los Ancestros", frFR = "Place des Anciens", itIT = "Piazza degli Anziani", koKR = "장로의 광장", ptBR = "Praça dos Anciãos", ruRU = "Площадь Старейшин", zhCN = "长者广场", zhTW = "長者廣場" },
    ["festival lane"] = { deDE = "Feststraße", esES = "Calle del Festival", esMX = "Calle del Festival", frFR = "Allée du festival", itIT = "Viale della Commemorazione", koKR = "축제의 거리", ptBR = "Alameda do Festival", ruRU = "Праздничная улица", zhCN = "节日小道", zhTW = "節慶巷道" },
    ["footman's armory"] = { deDE = "Waffenkammer des Fußsoldaten", esES = "Arsenal de los Soldados", esMX = "Arsenal de los Soldados", frFR = "Armurerie des fantassins", itIT = "Armeria dei Fanti", koKR = "보병 무기고", ptBR = "Armaria do Soldado", ruRU = "Оружейная пехотинцев", zhCN = "步兵武器库", zhTW = "步卒軍械庫" },
    ["forlorn cloister"] = { deDE = "Unglückseliger Kreuzgang", esES = "Claustro Abandonado", esMX = "Claustro Abandonado", frFR = "Cloître solitaire", itIT = "Chiostro Infausto", koKR = "쓸쓸한 회랑", ptBR = "Claustro Esquecido", ruRU = "Покинутый двор", zhCN = "遗忘回廊", zhTW = "孤寂迴廊" },
    ["gallery of treasures"] = { deDE = "Galerie der Schätze", esES = "Galería de los Tesoros", esMX = "Galería de los Tesoros", frFR = "Galerie des trésors", itIT = "Galleria d'Arte", koKR = "보물 전시실", ptBR = "Galeria dos Tesouros", ruRU = "Сокровищница", zhCN = "珍宝陈列室", zhTW = "珍寶陳列室" },
    ["gordok commons"] = {  },
    ["hall of binding"] = { deDE = "Halle der Bindung", esES = "Sala de Vínculos", esMX = "Sala de Vínculos", frFR = "Hall des liens", itIT = "Sala del Vincolo", koKR = "속박의 전당", ptBR = "Salão da Vinculação", ruRU = "Зал Оков", zhCN = "禁锢之厅", zhTW = "禁錮大廳" },
    ["hall of blackhand"] = { deDE = "Schwarzfausthalle", esES = "Sala de Puño Negro", esMX = "Sala de Puño Negro", frFR = "Salle de Main-Noire", itIT = "Sala di Manonera", koKR = "검은손 전당", ptBR = "Salão do Mão Negra", ruRU = "Зал Чернорука", zhCN = "黑手大厅", zhTW = "黑手大廳" },
    ["hall of champions"] = { deDE = "Halle der Helden", esES = "Sala de los Campeones", esMX = "Sala de los Campeones", frFR = "Hall des Champions", itIT = "Salone dei Campioni", koKR = "용사의 전당", ptBR = "Salão dos Campeões", ruRU = "Чертог защитников", zhCN = "勇士大厅", zhTW = "勇士大廳" },
    ["halls of destruction"] = { deDE = "Hallen der Zerstörung", esES = "Salas de la Destrucción", esMX = "Salas de la Destrucción", frFR = "Halls de la Destruction", itIT = "Sale della Distruzione", koKR = "파괴의 전당", ptBR = "Salões da Destruição", ruRU = "Гибельные залы", zhCN = "毁灭大厅", zhTW = "毀滅大廳" },
    ["halycon's lair"] = { deDE = "Halycons Hort", esES = "Guarida de Halycon", esMX = "Guarida de Halycon", frFR = "Antre d'Halycon", itIT = "Tana di Halycon", koKR = "할리콘의 둥지", ptBR = "Covil de Halycon", ruRU = "Логово Халикон", zhCN = "哈雷肯之巢", zhTW = "哈雷肯之巢" },
    ["honor's tomb"] = { deDE = "Ehrengrabmal", esES = "Tumba del Honor", esMX = "Tumba del Honor", frFR = "Tombe de l’Honneur", itIT = "Cripta dell'Onore", koKR = "명예의 무덤", ptBR = "Tumba de Honra", ruRU = "Гробница Доблести", zhCN = "荣耀之墓", zhTW = "榮耀之墓" },
    ["hordemar city"] = { deDE = "Hordemar", esES = "Ciudad Hordemar", esMX = "Ciudad Hordemar", frFR = "Cité d'Hordemar", itIT = "Ordamar", koKR = "호드마르 도시", ptBR = "Hordamar", ruRU = "Ордамар", zhCN = "霍德玛尔城", zhTW = "霍德瑪爾城" },
    ["huntsman's cloister"] = { deDE = "Kreuzgang des Jägers", esES = "Claustro del Cazador", esMX = "Claustro del Cazador", frFR = "Cloître du veneur", itIT = "Chiostro dei Cacciatori", koKR = "사냥꾼의 회랑", ptBR = "Claustro do Guarda-caça", ruRU = "Двор охотника", zhCN = "猎手回廊", zhTW = "獵手迴廊" },
    ["king's square"] = { deDE = "Königsplatz", esES = "Plaza del Rey", esMX = "Plaza del Rey", frFR = "Place du Roi", itIT = "Piazza del Re", koKR = "왕의 광장", ptBR = "Praça Real", ruRU = "Королевская площадь", zhCN = "国王广场", zhTW = "國王廣場" },
    ["market row"] = { deDE = "Marktgasse", esES = "Fila del Mercado", esMX = "Fila del Mercado", frFR = "Allée du marché", itIT = "Strada del Mercato", koKR = "상가", ptBR = "Travessa do Comércio", ruRU = "Торговый ряд", zhCN = "市场区", zhTW = "市場區" },
    ["mok'doom"] = { deDE = "Mok'Doom", esES = "Mok'Doom", esMX = "Mok'Doom", frFR = "Mok’Deuil", itIT = "Presidio di Omokk", koKR = "모크둠", ptBR = "Mok'Doom", ruRU = "Мок'Дум", zhCN = "摩多姆", zhTW = "摩多姆" },
    ["prison of immol'thar"] = { deDE = "Das Gefängnis von Immol'thar", esES = "Prisión de Immol'thar", esMX = "Prisión de Immol'thar", frFR = "Prison d'Immol'thar", itIT = "Prigione di Immol'thar", koKR = "이몰타르의 감옥", ptBR = "Prisão de Immol'thar", ruRU = "Тюрьма Бессмер'тера", zhCN = "伊莫塔尔的牢笼", zhTW = "伊莫塔爾的牢籠" },
    ["skitterweb tunnels"] = { deDE = "Listspinnertunnel", esES = "Túneles de Arácnidas", esMX = "Túneles de Arácnidas", frFR = "Tunnels de Toile-grouillante", itIT = "Tunnel dei Filatela", koKR = "그물걸이 통로", ptBR = "Túneis Tremeteia", ruRU = "Паучий лабиринт", zhCN = "蛛网隧道", zhTW = "蛛網隧道" },
    ["slaughter square"] = { deDE = "Schlächterplatz", esES = "Plaza Degolladero", esMX = "Plaza Degolladero", frFR = "Place du Massacre", itIT = "Piazza del Mattatoio", koKR = "학살의 광장", ptBR = "Praça do Massacre", ruRU = "Площадь Живодерни", zhCN = "屠杀广场", zhTW = "屠殺廣場" },
    ["spire throne"] = { deDE = "Spitzenthron", esES = "Trono Espiral", esMX = "Trono Espiral", frFR = "Trône du Pic", itIT = "Trono dei Bastioni", koKR = "첨탑 사령실", ptBR = "Trono da Espícula", ruRU = "Верховный трон", zhCN = "尖塔王座", zhTW = "尖塔王座" },
    ["tazz'alaor"] = { deDE = "Tazz'Alaor", esES = "Tazz'Alor", esMX = "Tazz'Alaor", frFR = "Tazz’Alaor", itIT = "Tazz'Alaor", koKR = "타즈알라올", ptBR = "Tazz'Alaor", ruRU = "Тазз'Алаор", zhCN = "塔萨洛尔", zhTW = "塔薩洛爾" },
    ["tazz'alor"] = { deDE = "Tazz'Alor", esES = "Tazz'Alor", esMX = "Tazz'Alor", frFR = "Tazz’Alor", itIT = "Tazz'Alaor", koKR = "타즈알로", ptBR = "Tazz'Alor", ruRU = "Тазз'Алор", zhCN = "塔萨洛尔", zhTW = "塔薩洛爾" },
    ["the athenaeum"] = { deDE = "Das Athenaeum", esES = "El Athenaeum", esMX = "El Athenaeum", frFR = "L'Athenaeum", itIT = "Ateneo", koKR = "도서관", ptBR = "O Ateneu", ruRU = "Читальня", zhCN = "图书馆", zhTW = "圖書館" },
    ["the beast's lair"] = {  },
    ["the burning shrine"] = {  },
    ["the conservatory"] = { deDE = "Das Konservatorium", esES = "El Vivero", esMX = "El Vivero", frFR = "Le jardin d'hiver", itIT = "Bioparco", koKR = "고요의 정원", ptBR = "O Conservatório", ruRU = "Зимний сад", zhCN = "温室", zhTW = "大溫室" },
    ["the crimson throne"] = { deDE = "Der Purpurthron", esES = "El Trono Carmesí", esMX = "El Trono Carmesí", frFR = "Le Trône cramoisi", itIT = "Trono Cremisi", koKR = "진홍십자군 사령실", ptBR = "O Trono Carmesim", ruRU = "Кровавый трон", zhCN = "赤色王座", zhTW = "赤色王座" },
    ["the furnace"] = { deDE = "Der Schmelzofen", esES = "El Horno", esMX = "El Horno", frFR = "La Fournaise", itIT = "Fornace Ardente", koKR = "용광로", ptBR = "A Fornalha", ruRU = "Горн", zhCN = "熔炉", zhTW = "熔爐" },
    ["the gauntlet"] = { deDE = "Der Spießrutenlauf", esES = "El Guantelete", esMX = "El Guantelete", frFR = "Le Défi", itIT = "Piazza della Sfida", koKR = "투쟁의 거리", ptBR = "Forquilha", ruRU = "Улица Испытаний", zhCN = "街巷", zhTW = "街巷" },
    ["the gordok commons"] = {  },
    ["the hall of lights"] = { deDE = "Die Halle der Lichter", esES = "La Sala de las Luces", esMX = "La Sala de las Luces", frFR = "Hall des lumières", itIT = "Sala delle Luci", koKR = "빛의 회랑", ptBR = "O Salão das Luzes", ruRU = "Зал Света", zhCN = "圣光大厅", zhTW = "聖光大廳" },
    ["the hidden reach"] = { deDE = "Der Versteckte Zugang", esES = "El Tramo Oculto", esMX = "El Tramo Oculto", frFR = "La voie cachée", itIT = "Percorso Nascosto", koKR = "비밀 장소", ptBR = "Confins Ocultos", ruRU = "Потайной проход", zhCN = "密径", zhTW = "密徑" },
    ["the hoard"] = { deDE = "Der Hort", esES = "El Tesoro Oculto", esMX = "El Tesoro Oculto", frFR = "Le Trésor", itIT = "Armeria", koKR = "병참부", ptBR = "O Cofre", ruRU = "Арсенал", zhCN = "步兵武器库", zhTW = "物資庫" },
    ["the rookery"] = { deDE = "Die Brutstätte", esES = "El Grajero", esMX = "El Corvento", frFR = "La colonie", itIT = "Corveria", koKR = "부화장", ptBR = "O Viveiro", ruRU = "Гнездовье", zhCN = "驭雷栖巢", zhTW = "培育所" },
    ["the scarlet bastion"] = { deDE = "Die Scharlachrote Bastion", esES = "El Bastión Escarlata", esMX = "El Bastión Escarlata", frFR = "Le Bastion écarlate", itIT = "Bastione Scarlatto", koKR = "붉은십자군 성채", ptBR = "O Bastião Escarlate", ruRU = "Бастион Алого ордена", zhCN = "血色十字军堡垒", zhTW = "血色十字軍堡壘" },
    ["the shrine of eldretharr"] = { deDE = "Der Schrein von Eldretharr", esES = "Santuario de Eldretharr", esMX = "Santuario de Eldretharr", frFR = "Le sanctuaire d'Eldretharr", itIT = "Santuario di Eldretharr", koKR = "엘드레사르 제단", ptBR = "Altar de Eldretharr", ruRU = "Святилище Элдретарра", zhCN = "艾德雷斯神殿", zhTW = "艾德雷斯神殿" },
    ["the slaughter house"] = { deDE = "Das Schlachthaus", esES = "El Degolladero", esMX = "El Degolladero", frFR = "L'Abattoir", itIT = "Mattatoio", koKR = "도살장", ptBR = "O Matadouro", ruRU = "Живодерня", zhCN = "屠宰房", zhTW = "屠宰房" },
    ["the storehouse"] = { deDE = "Das Lagerhaus", esES = "Almacén", esMX = "Almacén", frFR = "L'entrepôt", itIT = "Magazzino", koKR = "창고", ptBR = "O Armazém", ruRU = "Кладовая", zhCN = "仓库", zhTW = "倉庫" },
    ["training grounds"] = { deDE = "Ausbildungsgelände", esES = "Campo de Entrenamiento", esMX = "Campo de Entrenamiento", frFR = "Terrain d’entraînement", itIT = "Cortile d'Addestramento", koKR = "훈련장", ptBR = "Campo de Treinamento", ruRU = "Тренировочная площадка", zhCN = "训练场", zhTW = "訓練場" },
    ["warpwood quarter"] = { deDE = "Wucherborkenviertel", esES = "Barrio Alabeo", esMX = "Barrio Alabeo", frFR = "Quartier de Crochebois", itIT = "Quartiere di Legnotorto", koKR = "굽이나무 지구", ptBR = "Distrito Lenhatorta", ruRU = "Квартал Криводревов", zhCN = "扭木广场", zhTW = "扭木廣場" },
}
-- The client language's names of an English room key (nil: none known).
function FDJ.RunLogRoomNames(english)
    local loc = (type(GetLocale) == "function" and GetLocale()) or "enUS"
    local row = FDJ.RunLogRoomNamesL10n[english]
    local name = row and (row[loc] or (loc == "esMX" and row.esES)) or nil
    if type(name) ~= "string" or name == "" then return nil end
    return name
end
-- Lower Blackrock Spire / Upper Blackrock Spire rooms in the client's language
-- (keys as the tracker reads the room: lower case, ' for the curly apostrophe)
do
    for map, rooms in pairs(FDJ.RunLogRoomWings) do
        local add = {}
        for english, wing in pairs(rooms) do
            local name = FDJ.RunLogRoomNames(english)
            if name then add[(name:lower():gsub("\226\128\153", "'"))] = wing end
        end
        for key, wing in pairs(add) do
            if rooms[key] == nil then rooms[key] = wing end
        end
    end
end
-- END wingnames
