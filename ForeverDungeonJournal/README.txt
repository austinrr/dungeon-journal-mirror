DungeonJournal 1.6.1

INSTALLATION
Exit WoW, then extract this ZIP so
Interface/AddOns/ForeverDungeonJournal/ForeverDungeonJournal.toc exists.
It replaces the previous version in the same folder.

SETTINGS
The addon folder, keybinding and saved-variable names are unchanged, so existing
preferences carry over. Character progress is read from the game.
Command: /dj.

CHANGES IN 1.6.1
- Item source on tooltips: an item that is in the journal gets one extra line
  at the bottom of its tooltip with the boss (or quest) and dungeon it comes
  from. This works when hovering gear while inspecting, in bags and on loot
  rolls, and on the window that opens when an item link in chat is clicked.
- Click that line on a chat-link window to open the journal on the boss or
  quest. For hover tooltips, bind "Open hovered item in Dungeon Journal" in the
  key bindings. /dj itemtip turns the line off.
- Options panel: right-click the minimap button (or type /dj options).
  UI: hide the journal line on item tooltips, hide the minimap button, and
  set a key to open the journal. Dungeon list: auto-hide dungeons you have
  outleveled, and dungeons whose quests you have all completed.
- Shared boss loot: the six shared leather helms (Brawler's, Trapper's,
  Defender's, Totemic, Stormrider's, Wisdom's) can drop from many bosses in
  Blackfathom Deeps, The Stockade, Razorfen Kraul and Scarlet Monastery:
  Graveyard. Those bosses get a folded "Show Shared Loot (N)" line below their
  loot; click it to see the helms.
- Boss loot lists too long to fit are shown in two columns, so far less scrolling
  is needed. Names too long for a column end in "...".
- Loot Filter: new Armor Filter button next to the minimum level. Tick one or
  more armor types (Cloth, Leather, Mail, Plate) to see only those; "All"
  clears the ticks. Weapons, shields, jewellery and cloaks always stay.
- Dungeon map: reopens on the floor you last looked at in each dungeon.
- Ruins of Lordaeron: Rotmender's Gloves added to Trash Drops (Stone Watcher).
- Test of Lore (Parqual Fintallas, Undercity) shows the answer: Ner'zhul.
- Smaller download: the two City of Dalaran maps were reduced in resolution,
  roughly halving the size of the addon.
- Gnomeregan map: level 2 ladder moved to the corridor below the Launch Bay;
  new level 3 ladder on the level 4 map.
- World map: the Dungeon Map / World Map button moves aside instead of sitting
  on top of other addons' map buttons (such as Questie's).
- Quest rewards: an item shown as a reward button is no longer repeated as
  text underneath it.
- Spanish: dungeon names now match the game (Salón de los Feudales, Minas de
  la Muerte, Mazmorras de Ventormenta).

CHANGES IN 1.6.0
- Favourites: right-click any boss loot or quest item to add it to Favourites;
  the Favourites button on the home page opens the list, grouped by dungeon.
  Left-click a favourite to jump to its boss or quest, right-click to remove it.
- Favourites: quest items show the quest icon and the quest they come from.
- Favourites: an item you own (bags, bank or equipped) gets the green
  "completed" frame and tick.
- Favourites: item types follow the journal language; the window can be closed
  with its X in combat and stays above the journal.
- Scarlet Monastery: the dungeon map on the M key now opens in both wings. The
  wing is recognised from the entrance you walked through, and two buttons on
  the map (Graveyard / Library) switch it by hand. /dj wing graveyard or
  /dj wing library does the same.
- Boss portraits no longer flash black, or show through other windows, while
  they load.
- City of Dalaran: Heart of Disruption and An Alarming Request are available
  from level 30; An Alarming Request has a start location and Show on Map.

CHANGES IN 1.5.2
- Show on Map: the quest marker pulse is smoother and no longer blinks when it restarts.
- The Treaty of Understanding: the Stone Tablet that starts the quest is shown as a
  button; hover it to see where it is.
- Gnomeregan: Nogg's Ring Redo and Gnome Improvement show the In Dungeon icon.
- Gnomeregan: removed a redundant note from the Grime-Encrusted Ring step.

CHANGES IN 1.5.0
- New dungeon: Scarlet Monastery: Library (bosses, loot, quests, map).
- Dungeon map on the M key: inside a journal dungeon the big map shows the
  dungeon map with boss pins; a button switches back to the world map.
  /dj worldmap turns this off.
- The window can be resized by dragging its bottom-right corner (right-click
  the corner to reset).
- Report button next to the language box, with the Discord link.
- Quests can be shift-clicked into chat.
- Scarlet Monastery: Graveyard: more quests; Library: Final Passage with the
  full Test of Lore chain and its rewards.
- An Unholy Alliance now shows its final quest and rewards.
- Blackfathom Villainy lists both Horde starting points.
- Loot Filter: results can show recipe drops only; option renamed to
  "Show recipes/patterns drops".
- The journal reopens on the map if it was closed on the map, and changing
  language keeps the current page, quest faction and map floor.
- Language box: arrows replaced by a single drop-down arrow.
- Map fixes: world-map dungeon entrance positions; boss pins in Ruins of
  Lordaeron and Wailing Caverns; Arcanist Doan added to the Library map.
- Wailing Caverns map shows its original title and markings again.
- New card art for both Scarlet Monastery wings.
- Right-clicking the minimap button asks before hiding it.
- New Scarlet Monastery quests are translated in all languages.

CHANGES IN 1.4.4
- Includes eight currently recorded City of Dalaran quests, including the Horde attunement prerequisite chain.
- Power Overwhelming: target wording matches Arcanic Enigma; confirmed reward
  choices are Violet Sash or Runebound Gloves, plus 1 gold.
- The Fury Runs Deep: three reward choices, with rare Magistrate's Pantaloons;
  observed XP fallback updated to 5,750.
- Archmage Arugal: level corrected to 24.
- City of Dalaran: Alliance quest givers Shylamiir and High Sorcerer Andromath
  now show at their correct Stormwind positions on the map.
- Excavation Site: Elder Knowledge is no longer listed twice; it now appears only
  as the prerequisite step of Earthen Echo. Its turn-in and the Earthen Echo quest
  giver are Bashana Runetotem on Elder Rise, Thunder Bluff.
- Excavation Site: removed the red "Full Items Data TBD" note.
- Razorfen Kraul: Roogug added to the dungeon map.
- The Stockade: added Demolition Girdle (Kam Deepfury), Repurposed Rack (Hamhock),
  Graverobber's Shovel and Boneslicer (Dextren Ward); Kam's Walking Stick is rare,
  not epic. Removed the red "Full Items Data TBD" note.
- Boss levels: Mekgineer Thermaplugg 34; Fel Steed / Shadow Charger 19-21.
- Update alert: the addon tells you in chat when a guild or group member runs a
  newer version. Addons cannot check the internet, so this only works once
  another player with the newer version is in your guild, party or raid.
- Boss portraits for every dungeon now appear immediately on a fresh install
  instead of showing question marks while they load.
- Boss names are shown in the client language (German, French, Spanish,
  Portuguese, Russian, Korean, Simplified and Traditional Chinese).
- Shadowfang Keep map rebuilt on the four levels the game uses; Springvale,
  Razorclaw, Odo, Fenrus, Nandos and Arugal moved to their correct rooms.
- Added the paladin chain The Test of Righteousness (Verigan's Fist) to The
  Deadmines, Shadowfang Keep and Blackfathom Deeps, with all earlier steps.
- Scarlet Monastery: Graveyard: Trapper's Leather Helm now listed on both
  Interrogator Vishas and Fallen Champion.
- Fixed the quest page jumping back to the top while scrolled down to the
  rewards.
- Quest chain steps can list their required and provided items as item buttons;
  hovering one shows where it comes from (used by The Test of Righteousness).
- Trash drops: added a list for Ruins of Lordaeron (Death Bindings, Sword of the
  Fallen, Rotmender's Garb and Sash) and Razorfen Kraul, and filled in missing
  trash drops for The Deadmines and Scarlet Monastery: Graveyard.
- Trash drop lists now show rare and better items only.
- New dungeon: Scarlet Monastery: Library (Houndmaster Loksey, Arcanist Doan), with its quests.
- Boss loot now includes the profession recipes and blueprints they can drop.
- New Loot Filter button on the home page (left of Hide Dungeons): show or hide
  recipes (hidden by default), show only loot your class can use, or only items
  with the stats you tick.
  Its Show button lists every boss, in every dungeon, that drops matching loot.

PREVIOUS CHANGES
- Excavation: filled missing IDs, corrected quest levels, kill counts, item starts
  and turn-ins; added Lost in the Thicket Things, Fallen in the Fen,
  Prehistoric Prism and Earthen Echo with rewards and supported chain links.
- Added eight recorded City of Dalaran quests, including Horde attunement prerequisites. This does not assert dungeon access.
- Razorfen Kraul: added Sentinel's Boots, resolved Boar Signet's item ID,
  and added the guaranteed Quilboar Blaster reward for A Vengeful Fate.
- Stockade: filled Town Clerk's Mittens and Magistrate's Pantaloons rewards.
- Added Goblin Transponder as an item reward and corrected Edward's Knife spelling.
- Live XP now wins over stored rewards, including prerequisite quest pages.
  Superseded pre-hotfix multipliers use cached base XP offline. Recent observed
  Excavation values are retained only as offline fallbacks, not forced over live XP.

DATA LIMITS
Beta cache XP can differ from server turn-in XP and player-level adjustments.
Unverified quest givers and optional breadcrumbs are not presented as confirmed
required chains. Existing quests absent from the partial public cache are retained.
Two Opportunistic Education rewards resolve their names from the game by item ID.
New or corrected text without a translation falls back to English.
