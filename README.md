# Minetest Extended

The extended default game bundled in the Minetest engine.  

## Description

This game mod is made to be an upgraded version of the original game, extended with many functions, packed into one complete game mode to be as easy to install as possible.

You can grow plants and keep livestock to make foods and save you from starvation.    
Below 10 satiation you will start to lose health till you die and you won't be able to run. ("Special" key (default: E))  
You can brew potions to improve your stats or to give you temporary buffs.  
Craft magic items to make your life easier.  
Explore the Underworld and the Floating Islands.  

## Installation

- Unzip the archive and place it in .. minetest/games/

- GNU/Linux:
    If you use a system-wide installation place it in ~/.minetest/games/.

- macOS:
    ~/Library/Application Support/minetest/games/

- Windows:
    In your unzipped minetest[version]/games/ folder.

    For further information or help, see:  
https://wiki.minetest.net/Installing_Mods

## Compatibility

Made for and tested on Minetest 5.3.0.

## Contained mods and modifications

- The Minetest game for base (modified) ([GitHub](https://github.com/minetest/minetest_game))  
  Added ice and snow melting by furnace.  
  Added max falling speed limitation to the default player_api.  
  Chests drop the items what are inside of it when broke.  
  Furnaces drop the items what are inside of it when broke.  
  Removed gold weapon and tools.  
  Added craft for green dye from cactus.  
  If you punch a butterfly/firefly it dies.  
  You can't hit the cart from inside.  
  Created handcar.  
  Added detector rail from [boost_cart](https://github.com/SmallJoker/boost_cart)
- Created effects_hud for player effect display. Used [hud_timers](https://repo.or.cz/minetest_hudbars.git) as template.
- Added Mesecons for electricity like magic to the game ([Github](https://github.com/minetest-mods/mesecons))   
  Changed the torch's texture.  
  Changed the switch's effective sides.  
  Changed the ghostsone's and removesone's inventory icon.  
  On mesecon signal the tnt starts to burn, no longer explodes.  
  Removed the luacontroller, microcontroller, blinkyplant and the powerplant
- Beds: the simple bed has been removed
- Added Crafting Guide to add, well, crafting guide ([Github](https://github.com/minetest-mods/craftguide))  
- Added Mobs Redo (modified) ([NotABug](https://notabug.org/tenplus1/mobs_redo))
- Added Mobs Animal (modified) ([NotABug](https://notabug.org/tenplus1/mobs_animal))   
  Made the honey block a liquid with high viscosity.  
  Removed net. Use lasso.  
  Changed sheep's face.  
  Milk bucket no longer drinkable.
- Added Mobs Monster ([NotABug](https://notabug.org/tenplus1/mobs_monster))  
  Modified the mese monster's texture.
- 3D Armor to add armors (modified) ([Github](https://github.com/minetest-mods/3d_armor))  
  Removed gold and cactus armor.
- Added SkinsDB to add skin management ([Github](https://github.com/minetest-mods/skinsdb))
- Created item_info to show "weapons" damage (own script)
- The default weather (if I understand it correctly) mod is basicly just changes the coluds according to the biome (player's position). So renamed it to clouds.
- Added Throwing Redo mod to get bows. (modified) ([Github](https://github.com/minetest-mods/throwing))  
  Added new shooting sound.
  Changed arrows craft.
- Added ts_furniture so I can sit down after all the mod customizing... ([Github](https://github.com/minetest-mods/ts_furniture))
- Merged the default farming with TenPlus1's Farming Redo ([NotABug](https://notabug.org/TenPlus1/Farming)), JBB's Aggriculture ([Github](https://github.com/JBBgameich/agriculture)) and sofar's crops ([Github](https://github.com/minetest-mods/crops))  
  Renamed the papyrus to reed.  
  Added new plants  
  (My friend(s)) Drawn a "few" new textures.  
  Created the packer.
- Merged the default bones mod with TenPlus1's Bonemeal mod ([NotABug](https://notabug.org/TenPlus1/bonemeal))  
  Added more plants' support for the bonemeal mod.  
  Added white dye craft to bonemeal.
- Created snowball to make "snow" throwable. (own script, used mobs' chicken egg as a template)
- Added fire_plus for player burning ([Github](https://github.com/LoneWolfHT/fire_plus))
- Vessels: empty glass's texture changed.  
  Added jar.
- Added Worldedit ([Github](https://github.com/Uberi/Minetest-WorldEdit))
- Added frame for decoration (modified) ([Github](https://github.com/minetest-mods/frame))
- Created industrial_furnace based on default furnace.
- Added walking_light (rewritten) ([Forum](https://forum.minetest.net/viewtopic.php?f=11&t=2621&hilit=walking+light)  
  Removed mese pick
- Created fishing (own script)  
  Used Mossmanikin's fishing ([Github](https://github.com/Mossmanikin/fishing)) and Wuzzy's mcl_fishing ([Git](https://git.minetest.land/Wuzzy/MineClone2/src/branch/master/mods/ITEMS/mcl_fishing)) as template.
### 1.1
- Added Mana for magic. ([repo](https://repo.or.cz/minetest_mana.git))
  Renamed to hbmana.  
  Changed the starting mana.
- Added Hbhunger for hunger. (rewritten) ([repo](https://repo.or.cz/minetest_hbhunger.git))
- Added Hbsprint for sprinting ability (modified) ([Github](https://github.com/minetest-mods/hbsprint))
- Added Hbarmor for armor stats ([repo](https://repo.or.cz/minetest_hbarmor.git))
- Added flower pot for decoration (modified) ([Github](https://github.com/minetest-mods/flowerpot))
- Added paintings for decoration (modified) ([Forum](https://forum.minetest.net/viewtopic.php?f=11&t=9635))
- Created Backpacks mod.
- Created health_adjuster mod.
- Created Alchemy mod.
- Created Gems mod. Used Quartz mod's textures ([Github](https://github.com/minetest-mods/quartz))
- Created Magic mod. Used some of veNext's magic_mod's code. ([Github](https://github.com/veNext/magic_mod))
- Created Death announce.
- Xpanes: added reverse craft
### 1.2
- Renamed and redo Backpacks mod as Void Bags
- Added Hangglider (modified texture)([NotABug](https://notabug.org/Piezo_/minetest-hangglider))
- Added Mobs Water ([NotABug](https://notabug.org/TenPlus1/mobs_water))
- Added Mobs Horse ([NotABug](https://notabug.org/TenPlus1/mob_horse))
- Created slingshot.
- Created Flying carpet. Used the Minetest Game's boats as template.
- Created void_bags. Used [inventorybags] (https://github.com/cx384/inventorybags) as base.
- Created hungry mana.
- Created teleports.
- Added bakedclay ([NotABug](https://notabug.org/tenplus1/bakedclay))
- Added cement mod (modified) ([gitlab](https://gitlab.com/4w/cement))
- Created mex_moreblocks from a bunch of mods. See license.txt
- Created orb of digging.
- Added Beacon (modified) ([NotABug](https://notabug.org/SpaghettiToastBook/beacons))
- Created mex_moredoors from a bunch of mods. See license.txt
- Added Nether (modified)([Github](https://github.com/minetest-mods/nether))
- Created mobs_nether.
- Added tsm_pyramids ([repo](https://repo.or.cz/minetest_pyramids/tsm_pyramids.git))
- Created mese_miner.
- Created interdimensional_altars.
- Created recycler.
- Created floating_islands.
- Added mobs_npc (modified)([NotABug](https://notabug.org/TenPlus1/mobs_npc))
- Created mex_morebeds.
- Created mex_tales.
- Created ghost_ship.
- Created mex_chariot.

## Licensing

See `LICENSE.txt`

All the modifications and the tinkering is done by PetiAPocok (mmandna@gmail.com)
