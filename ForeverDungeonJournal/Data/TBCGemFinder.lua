-- Socketable Burning Crusade gems, with IDs and socket bonuses from Wowhead TBC.
-- Item IDs refer to the CUT gem, never the design or raw uncut stone.
-- Source: https://www.wowhead.com/tbc/guide/gems-colors-stats-burning-crusade-classic
-- Format: item ID | English name | stat=value (multiple separated by spaces).
-- All numeric properties below are per gem, not socket bonuses.
local _, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS
if not FDJ then return end

FDJ.GEM_FINDER_DATA = {}
local gems = FDJ.GEM_FINDER_DATA
local statLabels = {
    str = 'Strength', agi = 'Agility', sta = 'Stamina', int = 'Intellect', spi = 'Spirit',
    sp = 'Spell Damage', heal = 'Healing', mp5 = 'Mana per 5 sec', ap = 'Attack Power',
    crit = 'Crit Rating', hit = 'Hit Rating', spellhit = 'Spell Hit Rating',
    spellcrit = 'Spell Crit Rating', haste = 'Spell Haste Rating', def = 'Defense Rating',
    dodge = 'Dodge Rating', parry = 'Parry Rating', resil = 'Resilience Rating',
    pen = 'Spell Penetration', resist = 'Resist All', block = 'Shield Block Value',
    speed = 'Run Speed', stun = 'Stun Resist', reflect = 'Spell Reflect',
}
FDJ.GEM_FINDER_STAT_LABELS = statLabels
local function Add(color, source, quality, packed)
    for line in packed:gmatch('[^\n]+') do
        local id, name, raw, special = line:match('^%s*(%d+)%s*|%s*([^|]+)%s*|%s*([^|]*)%s*|?%s*(.-)%s*$')
        if id and name then
            name = name:gsub('%s+$', '')
            local entry = { id = tonumber(id), name = name, color = color, source = source,
                quality = quality, stats = {}, special = (special ~= '' and special) or nil }
            for key, amount in (raw or ''):gmatch('([%a%d]+)=([%d%.]+)') do
                entry.stats[key] = tonumber(amount)
            end
            gems[#gems + 1] = entry
        end
    end
end

-- Regular Jewelcrafting cuts. Normal socket colors: R/B/Y; hybrids: O/P/G.
Add('Red', 'Jewelcrafting', 2, [[
23094|Teardrop Blood Garnet|heal=13 sp=5
23097|Delicate Blood Garnet|agi=6
23096|Runed Blood Garnet|sp=7
23095|Bold Blood Garnet|str=6
28595|Bright Blood Garnet|ap=12
]])
Add('Red', 'Jewelcrafting', 3, [[
24029|Teardrop Living Ruby|heal=18 sp=6
24028|Delicate Living Ruby|agi=8
24030|Runed Living Ruby|sp=9
24027|Bold Living Ruby|str=8
24031|Bright Living Ruby|ap=16
24032|Subtle Living Ruby|dodge=8
24036|Flashing Living Ruby|parry=8
]])
Add('Red', 'Jewelcrafting', 4, [[
32195|Teardrop Crimson Spinel|heal=22 sp=8
32194|Delicate Crimson Spinel|agi=10
32196|Runed Crimson Spinel|sp=12
32193|Bold Crimson Spinel|str=10
32197|Bright Crimson Spinel|ap=20
32198|Subtle Crimson Spinel|dodge=10
32199|Flashing Crimson Spinel|parry=10
]])
Add('Red', 'Jewelcrafting (unique)', 4, [[
33134|Kailee's Rose|heal=26 sp=9
33133|Don Julio's Heart|sp=14
33131|Crimson Sun|ap=24
]])
Add('Yellow', 'Jewelcrafting', 2, [[
28290|Smooth Golden Draenite|crit=6
23116|Rigid Golden Draenite|hit=6
31860|Great Golden Draenite|spellhit=6
23114|Gleaming Golden Draenite|spellcrit=6
23115|Thick Golden Draenite|def=6
23113|Brilliant Golden Draenite|int=6
]])
Add('Yellow', 'Jewelcrafting', 3, [[
24048|Smooth Dawnstone|crit=8
24051|Rigid Dawnstone|hit=8
31861|Great Dawnstone|spellhit=8
24050|Gleaming Dawnstone|spellcrit=8
24052|Thick Dawnstone|def=8
24047|Brilliant Dawnstone|int=8
24053|Mystic Dawnstone|resil=8
35315|Quick Dawnstone|haste=8
]])
Add('Yellow', 'Jewelcrafting', 4, [[
32205|Smooth Lionseye|crit=10
32206|Rigid Lionseye|hit=10
32210|Great Lionseye|spellhit=10
32207|Gleaming Lionseye|spellcrit=10
32208|Thick Lionseye|def=10
32204|Brilliant Lionseye|int=10
32209|Mystic Lionseye|resil=10
35761|Quick Lionseye|haste=10
]])
Add('Yellow', 'Jewelcrafting (unique)', 4, [[
33143|Stone of Blades|crit=12
33140|Blood of Amber|spellcrit=12
33144|Facet of Eternity|def=12
]])
Add('Blue', 'Jewelcrafting', 2, [[
23118|Solid Azure Moonstone|sta=9
23119|Sparkling Azure Moonstone|spi=6
23121|Lustrous Azure Moonstone|mp5=2
23120|Stormy Azure Moonstone|pen=8
]])
Add('Blue', 'Jewelcrafting', 3, [[
24033|Solid Star of Elune|sta=12
24035|Sparkling Star of Elune|spi=8
24037|Lustrous Star of Elune|mp5=3
24039|Stormy Star of Elune|pen=10
]])
Add('Blue', 'Jewelcrafting', 4, [[
32200|Solid Empyrean Sapphire|sta=15
32201|Sparkling Empyrean Sapphire|spi=10
32202|Lustrous Empyrean Sapphire|mp5=4
32203|Stormy Empyrean Sapphire|pen=13
]])
Add('Blue', 'Jewelcrafting (unique)', 4, [[
33135|Falling Star|sta=18
]])
Add('Orange', 'Jewelcrafting', 2, [[
31869|Wicked Flame Spessarite|crit=3 ap=6
23099|Luminous Flame Spessarite|heal=7 sp=3 int=3
31866|Veiled Flame Spessarite|spellhit=3 sp=4
23098|Inscribed Flame Spessarite|crit=3 str=3
23101|Potent Flame Spessarite|spellcrit=3 sp=4
23100|Glinting Flame Spessarite|hit=3 agi=3
]])
Add('Orange', 'Jewelcrafting', 3, [[
31868|Wicked Noble Topaz|crit=4 ap=8
24060|Luminous Noble Topaz|heal=9 sp=3 int=4
31867|Veiled Noble Topaz|spellhit=4 sp=5
24058|Inscribed Noble Topaz|crit=4 str=4
24059|Potent Noble Topaz|spellcrit=4 sp=5
24061|Glinting Noble Topaz|hit=4 agi=4
35316|Reckless Noble Topaz|haste=4 sp=5
]])
Add('Orange', 'Jewelcrafting', 4, [[
32222|Wicked Pyrestone|crit=5 ap=10
32219|Luminous Pyrestone|heal=11 sp=4 int=5
32221|Veiled Pyrestone|spellhit=5 sp=6
32217|Inscribed Pyrestone|crit=5 str=5
32218|Potent Pyrestone|spellcrit=5 sp=6
32220|Glinting Pyrestone|hit=5 agi=5
35760|Reckless Pyrestone|haste=5 sp=6
]])
Add('Purple', 'Jewelcrafting', 2, [[
31864|Infused Shadow Draenite|ap=6 mp5=1
23110|Shifting Shadow Draenite|agi=3 sta=4
31862|Balanced Shadow Draenite|ap=6 sta=4
23109|Royal Shadow Draenite|heal=7 sp=3 mp5=1
23111|Sovereign Shadow Draenite|str=3 sta=4
23108|Glowing Shadow Draenite|sp=4 sta=4
32833|Purified Jaggal Pearl|heal=7 sp=3 spi=3
]])
Add('Purple', 'Jewelcrafting', 3, [[
31865|Infused Nightseye|ap=8 mp5=2
24055|Shifting Nightseye|agi=4 sta=6
31863|Balanced Nightseye|ap=8 sta=6
24057|Royal Nightseye|heal=9 sp=3 mp5=2
24054|Sovereign Nightseye|str=4 sta=6
24056|Glowing Nightseye|sp=5 sta=6
35707|Regal Nightseye|dodge=4 sta=6
32836|Purified Shadow Pearl|heal=9 sp=3 spi=4
]])
Add('Purple', 'Jewelcrafting', 4, [[
32214|Infused Shadowsong Amethyst|ap=10 mp5=2
32212|Shifting Shadowsong Amethyst|agi=5 sta=7
32213|Balanced Shadowsong Amethyst|ap=10 sta=7
32216|Royal Shadowsong Amethyst|heal=11 sp=3 mp5=2
32211|Sovereign Shadowsong Amethyst|str=5 sta=7
32215|Glowing Shadowsong Amethyst|sp=6 sta=7
37503|Purified Shadowsong Amethyst|heal=11 sp=4 spi=5
]])
Add('Green', 'Jewelcrafting', 2, [[
23105|Enduring Deep Peridot|def=3 sta=4
23104|Jagged Deep Peridot|crit=3 sta=4
23103|Radiant Deep Peridot|spellcrit=3 pen=4
23106|Dazzling Deep Peridot|int=3 mp5=1
]])
Add('Green', 'Jewelcrafting', 3, [[
24062|Enduring Talasite|def=4 sta=6
24067|Jagged Talasite|crit=4 sta=6
24066|Radiant Talasite|spellcrit=4 pen=5
24065|Dazzling Talasite|int=4 mp5=2
33782|Steady Talasite|resil=4 sta=6
35318|Forceful Talasite|haste=4 sta=6
]])
Add('Green', 'Jewelcrafting', 4, [[
32223|Enduring Seaspray Emerald|def=5 sta=7
32226|Jagged Seaspray Emerald|crit=5 sta=7
32224|Radiant Seaspray Emerald|spellcrit=5 pen=6
32225|Dazzling Seaspray Emerald|int=5 mp5=2
35758|Steady Seaspray Emerald|resil=5 sta=7
35759|Forceful Seaspray Emerald|haste=5 sta=7
]])
Add('Meta', 'Jewelcrafting (meta)', 3, [[
35503|Ember Skyfire Diamond|sp=14 int=2
32410|Thundering Skyfire Diamond||Chance to increase melee/ranged speed
34220|Chaotic Skyfire Diamond|spellcrit=12|+3% Critical Damage
25894|Swift Skyfire Diamond|ap=24 speed=1|Minor Run Speed Increase
25893|Mystical Skyfire Diamond||Chance to increase spell cast speed
25895|Enigmatic Skyfire Diamond|crit=12|+5% Snare/Root Resist
25890|Destructive Skyfire Diamond|spellcrit=14 reflect=1|1% Spell Reflect
35501|Eternal Earthstorm Diamond|def=12 block=10
32409|Relentless Earthstorm Diamond|agi=12|+3% Critical Damage
25898|Tenacious Earthstorm Diamond|def=12|Chance to restore health on hit
25896|Powerful Earthstorm Diamond|sta=18 stun=5|+5% Stun Resist
25901|Insightful Earthstorm Diamond|int=12|Chance to restore mana on spellcast
25899|Brutal Earthstorm Diamond||+3 Melee Damage; Chance to stun target
25897|Bracing Earthstorm Diamond|heal=26 sp=9|2% Reduced Threat
]])
-- All named heroic instance gem drops.
Add('Orange', 'Heroic Hellfire Ramparts', 3, [[30593|Iridescent Fire Opal|heal=11 sp=4 spellcrit=4]])
Add('Orange', 'Heroic Blood Furnace', 3, [[30601|Beaming Fire Opal|dodge=5 resil=4]])
Add('Orange', 'Heroic Shattered Halls', 3, [[30547|Luminous Fire Opal|heal=11 sp=4 int=4]])
Add('Orange', 'Heroic Mana-Tombs', 3, [[
30584|Enscribed Fire Opal|str=5 crit=4
30585|Glistening Fire Opal|agi=4 def=5
]])
Add('Orange', 'Heroic Auchenai Crypts', 3, [[
30587|Champion's Fire Opal|str=5 def=4
30588|Potent Fire Opal|sp=6 spellcrit=4
]])
Add('Orange', 'Heroic Sethekk Halls', 3, [[
30553|Pristine Fire Opal|ap=10 hit=4
30554|Stalwart Fire Opal|def=5 dodge=4
]])
Add('Orange', 'Heroic Shadow Labyrinth', 3, [[30559|Etched Fire Opal|str=5 hit=4]])
Add('Orange', 'Heroic Slave Pens', 3, [[30604|Resplendent Fire Opal|str=5 resil=4]])
Add('Orange', 'Heroic Underbog', 3, [[30607|Splendid Fire Opal|parry=5 resil=4]])
Add('Orange', 'Heroic Steamvault', 3, [[30551|Infused Fire Opal|sp=6 int=4]])
Add('Orange', 'Heroic Old Hillsbrad', 3, [[30591|Empowered Fire Opal|ap=8 resil=5]])
Add('Orange', 'Heroic Black Morass', 3, [[
30558|Glimmering Fire Opal|parry=5 def=4
30556|Glinting Fire Opal|agi=5 hit=4
]])
Add('Orange', 'Heroic Arcatraz', 3, [[
30582|Deadly Fire Opal|ap=8 crit=5
30575|Nimble Fire Opal|dodge=5 hit=4
30581|Durable Fire Opal|heal=11 sp=4 resil=4
]])
Add('Orange', 'Heroic Botanica', 3, [[30573|Mysterious Fire Opal|sp=6 pen=5]])
Add('Orange', 'Heroic Mechanar', 3, [[
30565|Assassin's Fire Opal|crit=6 dodge=5
30564|Shining Fire Opal|sp=6 spellhit=5
]])
Add('Purple', 'Heroic Blood Furnace', 3, [[30600|Fluorescent Tanzanite|sp=6 spi=4]])
Add('Purple', 'Heroic Shattered Halls', 3, [[30546|Sovereign Tanzanite|str=5 sta=6]])
Add('Purple', 'Heroic Sethekk Halls', 3, [[30552|Blessed Tanzanite|heal=11 sp=4 sta=6]])
Add('Purple', 'Heroic Shadow Labyrinth', 3, [[30563|Regal Tanzanite|dodge=5 sta=6]])
Add('Purple', 'Heroic Slave Pens', 3, [[30603|Royal Tanzanite|heal=11 sp=4 mp5=2]])
Add('Purple', 'Heroic Steamvault', 3, [[30549|Shifting Tanzanite|agi=5 sta=6]])
Add('Purple', 'Heroic Black Morass', 3, [[30555|Glowing Tanzanite|sp=6 sta=6]])
Add('Purple', 'Heroic Botanica', 3, [[
30574|Brutal Tanzanite|ap=10 sta=6
30572|Imperial Tanzanite|spi=5 heal=9 sp=3
]])
Add('Purple', 'Heroic Mechanar', 3, [[30566|Defender's Tanzanite|parry=5 sta=6]])
Add('Green', 'Heroic Hellfire Ramparts', 3, [[
30594|Effulgent Chrysoprase|def=5 mp5=2
30592|Steady Chrysoprase|sta=6 resil=5
]])
Add('Green', 'Heroic Blood Furnace', 3, [[30602|Jagged Chrysoprase|sta=6 crit=5]])
Add('Green', 'Heroic Shattered Halls', 3, [[30548|Polished Chrysoprase|sta=6 spellcrit=5]])
Add('Green', 'Heroic Mana-Tombs', 3, [[30583|Timeless Chrysoprase|int=5 sta=6]])
Add('Green', 'Heroic Auchenai Crypts', 3, [[30586|Seer's Chrysoprase|int=4 spi=5]])
Add('Green', 'Heroic Shadow Labyrinth', 3, [[30560|Rune Covered Chrysoprase|spellcrit=5 mp5=2]])
Add('Green', 'Heroic Slave Pens', 3, [[30605|Vivid Chrysoprase|spellhit=5 sta=6]])
Add('Green', 'Heroic Underbog', 3, [[
30606|Lambent Chrysoprase|spellhit=5 mp5=2
30608|Radiant Chrysoprase|spellcrit=5 pen=5
]])
Add('Green', 'Heroic Steamvault', 3, [[30550|Sundered Chrysoprase|crit=5 mp5=2]])
Add('Green', 'Heroic Old Hillsbrad', 3, [[
30589|Dazzling Chrysoprase|int=5 mp5=2
30590|Enduring Chrysoprase|sta=6 def=5
]])
-- Inexpensive socketed gems from NPC vendors.
Add('Red', 'Vendor', 1, [[
28458|Bold Tourmaline|str=4
28460|Teardrop Tourmaline|heal=9 sp=3
28459|Delicate Tourmaline|agi=4
28461|Runed Tourmaline|sp=5
]])
Add('Yellow', 'Vendor', 1, [[
28468|Rigid Amber|hit=4
28470|Thick Amber|def=4
28467|Smooth Amber|crit=4
28469|Gleaming Amber|spellcrit=4
28466|Brilliant Amber|int=4
]])
Add('Blue', 'Vendor', 1, [[
28465|Lustrous Zircon|mp5=1
28463|Solid Zircon|sta=6
28464|Sparkling Zircon|spi=4
]])
Add('Red', 'PvP Vendor', 3, [[28118|Runed Ornate Ruby|sp=12]])
Add('Blue', 'Zul\'Aman quest reward', 3, [[34256|Charmed Amani Jewel|sta=15]])
Add('Purple', 'Nightbane quest reward', 3, [[
31116|Infused Amethyst|sp=6 sta=6
31117|Soothing Amethyst|heal=11 sp=4 sta=6
]])
Add('Prismatic', 'Enchanting', 2, [[
22460|Prismatic Sphere|resist=3
22459|Void Sphere|resist=4
]])
-- Vendor-only, reputation, PvP and Halaa/Ogri'la gems (same name can have
-- different item IDs for opposing factions, with distinct valid records).
Add('Red', 'Halaa vendor', 3, [[
30571|Don Rodrigo's Heart|str=8
30598|Don Amancio's Heart|str=8
]])
Add('Red', 'Hellfire PvP vendor', 2, [[
27812|Stark Blood Garnet|sp=8
27777|Stark Blood Garnet|sp=8
28361|Mighty Blood Garnet|ap=14
28360|Mighty Blood Garnet|ap=14
]])
Add('Red', 'Honor vendor', 3, [[28362|Bold Ornate Ruby|ap=20]])
Add('Yellow', 'Halaa vendor', 3, [[27679|Sublime Mystic Dawnstone|resil=10]])
Add('Yellow', 'Honor vendor', 3, [[
28119|Smooth Ornate Dawnstone|crit=10
28120|Gleaming Ornate Dawnstone|spellcrit=10
]])
Add('Orange', 'Ogri\'la vendor', 3, [[
32638|Unstable Topaz|sp=5 int=4
32637|Unstable Citrine|ap=8 crit=4
]])
Add('Orange', 'Honor vendor', 3, [[
28123|Potent Ornate Topaz|sp=6 spellcrit=5
28363|Inscribed Ornate Topaz|ap=10 crit=5
]])
Add('Purple', 'Ogri\'la vendor', 3, [[
32634|Unstable Amethyst|ap=8 sta=6
32636|Unstable Sapphire|heal=9 sp=3 spi=4
]])
Add('Purple', 'Nightbane quest reward', 3, [[31118|Pulsing Amethyst|ap=10 sta=6]])
Add('Green', 'Ogri\'la vendor', 3, [[
32639|Unstable Talasite|sta=4 spellcrit=4
32635|Unstable Peridot|int=4 sta=6
]])
Add('Green', 'Hellfire PvP vendor', 2, [[
27809|Barbed Deep Peridot|sta=3 crit=4
27820|Notched Deep Peridot|sta=3 spellcrit=4
]])
Add('Meta', 'Terokkar spirit vendor', 3, [[
28556|Swift Windfire Diamond|ap=20 speed=1|Minor Run Speed Increase
28557|Swift Starfire Diamond|sp=12 speed=1|Minor Run Speed Increase
]])
-- Explicitly do not include uncuts, designs, non-socket items or guessed IDs.
