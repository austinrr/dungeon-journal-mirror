-- TBC Anniversary raid loot IDs (normal 10/25-player raids, phases 1-5).
-- Factual item IDs crosschecked with AtlasLootClassic TBC raid tables.
-- Native C_Item cache supplies localized item names and rarity at runtime.
local _, FDJ = ...
FDJ = FDJ or _G.ForeverDungeonJournal_NS
if not FDJ or not FDJ.IS_TBC_ANNIVERSARY then return end
local DB = FDJ.DB
FDJ.RAID_ITEM_NAMES = {
  [22559] = "Formula: Enchant Weapon - Mongoose",
  [22560] = "Formula: Enchant Weapon - Sunfire",
  [22561] = "Formula: Enchant Weapon - Soulfrost",
  [28528] = "Moroes' Lucky Pocket Watch",
  [28604] = "Nightstaff of the Everliving",
  [28773] = "Gorehowl",
  [28785] = "The Lightning Capacitor",
  [28789] = "Eye of Magtheridon",
  [28830] = "Dragonspine Trophy",
  [29434] = "Badge of Justice",
  [29756] = "Gloves of the Fallen Hero",
  [29757] = "Gloves of the Fallen Champion",
  [29758] = "Gloves of the Fallen Defender",
  [29759] = "Helm of the Fallen Hero",
  [29760] = "Helm of the Fallen Champion",
  [29761] = "Helm of the Fallen Defender",
  [29762] = "Pauldrons of the Fallen Hero",
  [29763] = "Pauldrons of the Fallen Champion",
  [29764] = "Pauldrons of the Fallen Defender",
  [29765] = "Leggings of the Fallen Hero",
  [29766] = "Leggings of the Fallen Champion",
  [29767] = "Leggings of the Fallen Defender",
  [30183] = "Nether Vortex",
  [30236] = "Chestguard of the Vanquished Champion",
  [30237] = "Chestguard of the Vanquished Defender",
  [30238] = "Chestguard of the Vanquished Hero",
  [30239] = "Gloves of the Vanquished Champion",
  [30240] = "Gloves of the Vanquished Defender",
  [30241] = "Gloves of the Vanquished Hero",
  [30242] = "Helm of the Vanquished Champion",
  [30243] = "Helm of the Vanquished Defender",
  [30244] = "Helm of the Vanquished Hero",
  [30245] = "Leggings of the Vanquished Champion",
  [30246] = "Leggings of the Vanquished Defender",
  [30247] = "Leggings of the Vanquished Hero",
  [30248] = "Pauldrons of the Vanquished Champion",
  [30249] = "Pauldrons of the Vanquished Defender",
  [30250] = "Pauldrons of the Vanquished Hero",
  [30311] = "Warp Slicer",
  [30312] = "Infinity Blade",
  [30313] = "Staff of Disintegration",
  [30314] = "Phaseshift Bulwark",
  [30316] = "Devastation",
  [30317] = "Cosmic Infuser",
  [30318] = "Netherstrand Longbow",
  [30319] = "Nether Spike",
  [30480] = "Fiery Warhorse's Reins",
  [31089] = "Chestguard of the Forgotten Conqueror",
  [31090] = "Chestguard of the Forgotten Vanquisher",
  [31091] = "Chestguard of the Forgotten Protector",
  [31092] = "Gloves of the Forgotten Conqueror",
  [31093] = "Gloves of the Forgotten Vanquisher",
  [31094] = "Gloves of the Forgotten Protector",
  [31095] = "Helm of the Forgotten Protector",
  [31096] = "Helm of the Forgotten Vanquisher",
  [31097] = "Helm of the Forgotten Conqueror",
  [31098] = "Leggings of the Forgotten Conqueror",
  [31099] = "Leggings of the Forgotten Vanquisher",
  [31100] = "Leggings of the Forgotten Protector",
  [31101] = "Pauldrons of the Forgotten Conqueror",
  [31102] = "Pauldrons of the Forgotten Vanquisher",
  [31103] = "Pauldrons of the Forgotten Protector",
  [32235] = "Cursed Vision of Sargeras",
  [32385] = "Magtheridon's Head",
  [32428] = "Heart of Darkness",
  [32458] = "Ashes of Al'ar",
  [32483] = "The Skull of Gul'dan",
  [32837] = "Warglaive of Azzinoth (Main Hand)",
  [32838] = "Warglaive of Azzinoth (Off Hand)",
  [32897] = "Mark of the Illidari",
  [33809] = "Amani War Bear",
  [33829] = "Hex Shrunken Head",
  [33831] = "Berserker's Call",
  [34334] = "Thori'dal, the Stars' Fury",
  [34427] = "Blackened Naaru Sliver",
  [34428] = "Steely Naaru Sliver",
  [34429] = "Shifting Naaru Sliver",
  [34430] = "Glimmering Naaru Sliver",
  [34664] = "Sunmote",
  [34848] = "Bracers of the Forgotten Conqueror",
  [34851] = "Bracers of the Forgotten Protector",
  [34852] = "Bracers of the Forgotten Vanquisher",
  [34853] = "Belt of the Forgotten Conqueror",
  [34854] = "Belt of the Forgotten Protector",
  [34855] = "Belt of the Forgotten Vanquisher",
  [34856] = "Boots of the Forgotten Conqueror",
  [34857] = "Boots of the Forgotten Protector",
  [34858] = "Boots of the Forgotten Vanquisher",
}
do
  local d = DB["Karazhan"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    -- Servants' Quarters has three independent rare spawn bosses.
    for index = #d.bosses, 1, -1 do
      if d.bosses[index].name == "Servants' Quarters" then table.remove(d.bosses, index) end
    end
    byName["Rokad the Ravager"] = {name="Rokad the Ravager", npcID=16181, displayID=16054, rare=true}
    byName["Shadikith the Glider"] = {name="Shadikith the Glider", npcID=16180, displayID=16053, rare=true}
    byName["Hyakiss the Lurker"] = {name="Hyakiss the Lurker", npcID=16179, displayID=15938, rare=true}
    table.insert(d.bosses, 2, byName["Rokad the Ravager"])
    table.insert(d.bosses, 3, byName["Shadikith the Glider"])
    table.insert(d.bosses, 4, byName["Hyakiss the Lurker"])
    FDJ.BOSS_LEVELS["Karazhan"]["Rokad the Ravager"] = "??"
    FDJ.BOSS_LEVELS["Karazhan"]["Shadikith the Glider"] = "??"
    FDJ.BOSS_LEVELS["Karazhan"]["Hyakiss the Lurker"] = "??"
    if byName["Attumen the Huntsman"] then
      byName["Attumen the Huntsman"].npcID = 16152
      byName["Attumen the Huntsman"].displayID = 16040
    end
    local boss = byName["Attumen the Huntsman"]
    if boss then
      local items = { 28477, 28507, 28508, 28453, 28506, 28503, 28454, 28502, 28505, 28509, 28510, 28504, 30480, 23809 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Moroes"]
    if boss then
      local items = { 28529, 28570, 28565, 28545, 28567, 28566, 28569, 28530, 28528, 28525, 28568, 28524, 22559 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Maiden of Virtue"]
    if boss then
      local items = { 28511, 28515, 28517, 28514, 28521, 28520, 28519, 28512, 28518, 28516, 28523, 28522 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Opera Event"]
    if boss then
      local items = { 28586, 28585, 28587, 28588, 28582, 28583, 28584, 28581, 28578, 28579, 28572, 28573, 28594, 28591, 28589, 28593, 28590, 28592 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["The Curator"]
    if boss then
      local items = { 28612, 28647, 28631, 28621, 28649, 28633, 29757, 29758, 29756 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Terestian Illhoof"]
    if boss then
      local items = { 28660, 28653, 28652, 28654, 28655, 28656, 28662, 28661, 28785, 28657, 28658, 28659, 22561 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Shade of Aran"]
    if boss then
      local items = { 28672, 28726, 28670, 28663, 28669, 28671, 28666, 23933, 28674, 28675, 28727, 28728, 28673, 22560 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Netherspite"]
    if boss then
      local items = { 28744, 28742, 28732, 28741, 28735, 28740, 28743, 28733, 28731, 28730, 28734, 28729 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Chess Event"]
    if boss then
      local items = { 28756, 28755, 28750, 28752, 28751, 28746, 28748, 28747, 28745, 28753, 28749, 28754 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Prince Malchezaar"]
    if boss then
      local items = { 28765, 28766, 28764, 28762, 28763, 28757, 28770, 28768, 28767, 28773, 28771, 28772, 29760, 29761, 29759 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Nightbane"]
    if boss then
      local items = { 28602, 28600, 28601, 28599, 28610, 28597, 28608, 31751, 24139, 28609, 28603, 28604, 28611, 28606 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Rokad the Ravager"]
    if boss then
      local items = { 30684, 30685, 30686, 30687 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Shadikith the Glider"]
    if boss then
      local items = { 30680, 30681, 30682, 30683 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Hyakiss the Lurker"]
    if boss then
      local items = { 30675, 30676, 30677, 30678 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Raid Trash", customIcon="Interface\\AddOns\\ForeverDungeonJournal\\Media\\TrashDropsIcon", trash=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 30642, 30668, 30673, 30644, 30674, 30643, 30641, 23857, 23864, 23862, 23865, 21882, 30666, 30667, 21903, 21904, 22545 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end
do
  local d = DB["Gruul's Lair"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    local boss = byName["High King Maulgar"]
    if boss then
      local items = { 28797, 28799, 28796, 28801, 28795, 28800, 29763, 29764, 29762 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Gruul the Dragonkiller"]
    if boss then
      local items = { 28804, 28803, 28828, 28827, 28810, 28824, 28822, 28823, 28830, 31750, 29766, 29767, 29765, 28802, 28794, 28825, 28826 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end
do
  local d = DB["Magtheridon's Lair"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    local boss = byName["Magtheridon"]
    if boss then
      local items = { 28777, 28780, 28776, 28778, 28775, 28779, 28789, 28781, 28774, 28782, 29458, 28783, 29754, 29753, 29755, 32385, 34845, 34846 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end
do
  local d = DB["Serpentshrine Cavern"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    local boss = byName["Hydross the Unstable"]
    if boss then
      local items = { 30056, 32516, 30050, 30055, 30047, 30054, 30048, 30053, 30052, 33055, 30664, 30629, 30049, 30051 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["The Lurker Below"]
    if boss then
      local items = { 30064, 30067, 30062, 30060, 30066, 30065, 30057, 30059, 30061, 33054, 30665, 30063, 30058 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Leotheras the Blind"]
    if boss then
      local items = { 30092, 30097, 30091, 30096, 30627, 30095, 30239, 30240, 30241 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Fathom-Lord Karathress"]
    if boss then
      local items = { 30100, 30101, 30099, 30663, 30626, 30090, 30245, 30246, 30247 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Morogrim Tidewalker"]
    if boss then
      local items = { 30098, 30079, 30075, 30085, 30068, 30084, 30081, 30008, 30083, 33058, 30720, 30082, 30080 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Lady Vashj"]
    if boss then
      local items = { 30107, 30111, 30106, 30104, 30102, 30112, 30109, 30110, 30621, 30103, 30108, 30105, 30242, 30243, 30244, 29906 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Raid Trash", customIcon="Interface\\AddOns\\ForeverDungeonJournal\\Media\\TrashDropsIcon", trash=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 30027, 30022, 30620, 30023, 30021, 30025, 30324, 30322, 30323, 30321, 30280, 30282, 30283, 30281, 30308, 30304, 30305, 30307, 30306, 30301, 30303, 30302, 30183, 32897 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end
do
  local d = DB["Tempest Keep: The Eye"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    local boss = byName["Al'ar"]
    if boss then
      local items = { 29925, 29918, 29947, 29921, 29922, 29920, 30448, 30447, 29923, 32944, 29948, 29924, 29949 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Void Reaver"]
    if boss then
      local items = { 29986, 29984, 29985, 29983, 32515, 30619, 30450, 30248, 30249, 30250 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["High Astromancer Solarian"]
    if boss then
      local items = { 29977, 29972, 29966, 29976, 29951, 29965, 29950, 32267, 30446, 30449, 29962, 29981, 29982 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Kael'thas Sunstrider"]
    if boss then
      local items = { 29992, 29989, 29994, 29990, 29987, 29995, 29991, 29998, 29997, 29993, 29996, 29988, 30236, 30237, 30238, 32458, 32405, 29905 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Raid Trash", customIcon="Interface\\AddOns\\ForeverDungeonJournal\\Media\\TrashDropsIcon", trash=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 30024, 30020, 30029, 30026, 30030, 30028, 30324, 30322, 30323, 30321, 30280, 30282, 30283, 30281, 30308, 30304, 30305, 30307, 30306, 30301, 30303, 30302, 30183, 32897 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end
do
  local d = DB["Battle for Mount Hyjal"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    local boss = byName["Rage Winterchill"]
    if boss then
      local items = { 30871, 30870, 30863, 30868, 30864, 30869, 30873, 30866, 30862, 30861, 30865, 30872, 32459 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Anetheron"]
    if boss then
      local items = { 30884, 30888, 30885, 30879, 30886, 30887, 30880, 30878, 30874, 30881, 30883, 30882 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Kaz'rogal"]
    if boss then
      local items = { 30895, 30916, 30894, 30917, 30914, 30891, 30892, 30919, 30893, 30915, 30918, 30889 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Azgalor"]
    if boss then
      local items = { 30899, 30898, 30900, 30896, 30897, 30901, 31092, 31094, 31093 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Archimonde"]
    if boss then
      local items = { 30913, 30912, 30905, 30907, 30904, 30903, 30911, 30910, 30902, 30908, 30909, 30906, 31097, 31095, 31096 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Raid Trash", customIcon="Interface\\AddOns\\ForeverDungeonJournal\\Media\\TrashDropsIcon", trash=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 32590, 34010, 32609, 32592, 32591, 32589, 34009, 32946, 32945, 32428, 32897, 32285, 32296, 32303, 32295, 32298, 32297, 32289, 32307 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end
do
  local d = DB["Black Temple"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    if byName["Reliquary of Souls"] then byName["Reliquary of Souls"].npcID = 22856; byName["Reliquary of Souls"].displayID = 21146 end
    local boss = byName["High Warlord Naj'entus"]
    if boss then
      local items = { 32239, 32240, 32377, 32241, 32234, 32242, 32232, 32243, 32245, 32238, 32247, 32237, 32236, 32248 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Supremus"]
    if boss then
      local items = { 32256, 32252, 32259, 32251, 32258, 32250, 32260, 32261, 32257, 32254, 32262, 32255, 32253 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Shade of Akama"]
    if boss then
      local items = { 32273, 32270, 32513, 32265, 32271, 32264, 32275, 32276, 32279, 32278, 32263, 32268, 32266, 32361 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Teron Gorefiend"]
    if boss then
      local items = { 32323, 32329, 32327, 32324, 32328, 32510, 32280, 32512, 32330, 32348, 32326, 32325 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Reliquary of Souls"]
    if boss then
      local items = { 32353, 32351, 32347, 32352, 32517, 32346, 32354, 32345, 32349, 32362, 32350, 32332, 32363 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Gurtogg Bloodboil"]
    if boss then
      local items = { 32337, 32338, 32340, 32339, 32334, 32342, 32333, 32341, 32335, 32501, 32269, 32344, 32343 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Mother Shahraz"]
    if boss then
      local items = { 32367, 32366, 32365, 32370, 32368, 32369, 31101, 31103, 31102 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Illidari Council"]
    if boss then
      local items = { 32331, 32519, 32518, 32376, 32373, 32505, 31098, 31100, 31099 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Illidan Stormrage"]
    if boss then
      local items = { 32524, 32525, 32235, 32521, 32497, 32483, 32496, 32837, 32838, 31089, 31091, 31090, 32471, 32500, 32374, 32375, 32336 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Raid Trash", customIcon="Interface\\AddOns\\ForeverDungeonJournal\\Media\\TrashDropsIcon", trash=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 32590, 34012, 32609, 32593, 32592, 32608, 32606, 32591, 32589, 32526, 32528, 32527, 34009, 32943, 34011, 32228, 32231, 32229, 32249, 32230, 32227, 32428, 32897, 32738, 32739, 32736, 32737, 32748, 32744, 32750, 32751, 32749, 32745, 32746, 32747, 32754, 32755, 32753, 32752 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end
do
  local d = DB["Zul'Aman"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    local boss = byName["Akil'zon"]
    if boss then
      local items = { 33286, 33215, 33216, 33281, 33293, 33214, 33283, 33307 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Nalorakk"]
    if boss then
      local items = { 33203, 33285, 33211, 33206, 33327, 33191, 33640, 33307 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Jan'alai"]
    if boss then
      local items = { 33357, 33356, 33329, 33328, 33354, 33326, 33332, 33307 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Halazzi"]
    if boss then
      local items = { 33317, 33300, 33322, 33533, 33299, 33303, 33297, 33307 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Hex Lord Malacrass"]
    if boss then
      local items = { 33592, 33453, 33463, 33432, 33464, 33421, 33446, 33307, 33829, 34029, 33828, 33389, 33298, 33388, 33465 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Zul'jin"]
    if boss then
      local items = { 33471, 33479, 33469, 33473, 33466, 33830, 33831, 33307, 33467, 33478, 33476, 33468, 33474, 33102 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Timed Reward Chest", customIcon="Interface\\Icons\\INV_Box_01", treasureChest=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 33590, 33591, 33489, 33480, 33483, 33971, 33805, 33481, 33497, 33500, 33496, 33499, 33498, 33495, 33493, 33492, 33490, 33494, 33491, 33809 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Raid Trash", customIcon="Interface\\AddOns\\ForeverDungeonJournal\\Media\\TrashDropsIcon", trash=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 33993, 33865, 33930, 33932, 33931, 33933 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    for _, boss in ipairs(d.bosses) do if boss.npcID then table.insert(boss.loot, 1, {29434, "Badge of Justice", "Item", 3}) end end
  end
end
do
  local d = DB["Sunwell Plateau"]
  if d then
    local byName = {}
    for _, boss in ipairs(d.bosses) do byName[boss.name] = boss end
    local boss = byName["Kalecgos"]
    if boss then
      local items = { 34170, 34169, 34168, 34167, 34166, 34848, 34851, 34852, 34165, 34164 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Brutallus"]
    if boss then
      local items = { 34181, 34180, 34178, 34177, 34853, 34854, 34855, 34176, 34179 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Felmyst"]
    if boss then
      local items = { 34352, 34188, 34186, 34184, 34856, 34857, 34858, 34182, 34185 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Eredar Twins"]
    if boss then
      local items = { 34205, 34190, 34210, 34202, 34209, 34195, 34194, 34208, 34192, 34193, 35290, 35291, 35292, 34204, 34189, 34206, 34197, 34199, 34203, 34198, 34196 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["M'uru"]
    if boss then
      local items = { 34232, 34233, 34212, 34211, 34234, 34229, 34228, 34215, 34240, 34216, 34213, 34230, 35282, 35283, 35284, 34427, 34430, 34429, 34428, 34214, 34231 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = byName["Kil'jaeden"]
    if boss then
      local items = { 34241, 34242, 34339, 34340, 34342, 34344, 34244, 34245, 34333, 34332, 34343, 34243, 34345, 34341, 34334, 34329, 34247, 34335, 34331, 34336, 34337 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
    local boss = {name="Raid Trash", customIcon="Interface\\AddOns\\ForeverDungeonJournal\\Media\\TrashDropsIcon", trash=true, loot={}}
    d.bosses[#d.bosses + 1] = boss
    if boss then
      local items = { 34351, 34350, 35733, 34183, 34346, 34349, 34348, 34347, 35273, 34664, 32228, 32231, 32229, 32249, 32230, 32227, 35208, 35210, 35209, 35211, 35212, 35216, 35213, 35217, 35214, 35218, 35215, 35219, 35204, 35206, 35205, 35207, 35198, 35201, 35199, 35202, 35200, 35203, 35186, 35187, 35189, 35190, 35191, 35192, 35193, 35194, 35195, 35196, 35197 }
      boss.loot = {}
      for _, id in ipairs(items) do
        local cached = FDJ.RAID_ITEM_NAMES and FDJ.RAID_ITEM_NAMES[id]
        boss.loot[#boss.loot+1] = {id, cached or ("Item #" .. id), "Item", (id==32837 or id==32838 or id==34334) and 5 or 4}
      end
    end
  end
end

-- Classify TBC raid profession scrolls even before the WoW item cache loads.
-- This lets the existing Recipes & Patterns grouping work on a fresh installation,
-- including Sunwell Engineering schematics and the raid trash crafting patterns.
local raidRecipeKinds = {}
local function SetRaidRecipeKind(kind, ids)
    for _, id in ipairs(ids) do raidRecipeKinds[id] = kind end
end
SetRaidRecipeKind("Enchanting", {22559, 22560, 22561, 22545, 33307})
SetRaidRecipeKind("Blacksmithing", {
    30321, 30322, 30323, 30324,
    35208, 35209, 35210, 35211,
})
SetRaidRecipeKind("Tailoring", {
    21903, 21904, 30280, 30281, 30282, 30283,
    35204, 35205, 35206, 35207,
})
SetRaidRecipeKind("Leatherworking", {
    30301, 30302, 30303, 30304, 30305, 30306, 30307, 30308,
    35212, 35213, 35214, 35215, 35216, 35217, 35218, 35219,
})
SetRaidRecipeKind("Engineering", {
    35186, 35187, 35189, 35190, 35191, 35192,
    35193, 35194, 35195, 35196, 35197,
})
-- Other raid craftable recipes can be classified in the generic profession
-- section until their specific skill requirement is read from the WoW tooltip.
SetRaidRecipeKind("Crafting", {
    35198, 35199, 35200, 35201, 35202, 35203,
    32285, 32296, 32303, 32295, 32298, 32297, 32289, 32307,
    32738, 32739, 32736, 32737, 32748, 32744, 32750, 32751,
    32749, 32745, 32746, 32747, 32754, 32755, 32753, 32752,
})
for _, raidName in ipairs({
    "Karazhan", "Gruul's Lair", "Magtheridon's Lair",
    "Serpentshrine Cavern", "Tempest Keep: The Eye",
    "Battle for Mount Hyjal", "Black Temple", "Zul'Aman",
    "Sunwell Plateau"
}) do
    local raid = DB[raidName]
    if raid then
        for _, boss in ipairs(raid.bosses or {}) do
            for _, item in ipairs(boss.loot or {}) do
                local profession = raidRecipeKinds[item[1]]
                if profession then
                    item[3] = "Recipe, " .. profession
                    if type(item[2]) == "string" and item[2]:find("^Item #") then
                        item[2] = "Recipe #" .. item[1]
                    end
                end
            end
        end
    end
end
