# Minetest Extended

The extended default game bundled in the Minetest engine.  

## Description

This game mod is made to be an upgraded version of the original game, extended with many functions, packed into one complete game mode to be as easy to install as possible.

You can grow plants to make foods to keep you alive.  
Below 10 Satiation you won't be able to run. ("Special" key (default: E))
Below 10 Satiation you will start to lose health till you die.


## Installation

- Unzip the archive and place it in .. minetest/games/

- GNU/Linux: If you use a system-wide installation place
    it in ~/.minetest/games/.

    For further information or help, see:  
https://wiki.minetest.net/Installing_Mods

## Compatibility

Made for and tested on Minetest 5.2.0.

## Contained mods and modifications

- The Minetest game for base (modified) ([GitHub](https://github.com/minetest/minetest_game))  
  Added ice and snow melting by furnace .  
  Added max falling speed limitation to the default player_api.  
  Chests drop the items what are inside of it when broke.  
  Furnaces drop the items what are inside of it when broke.  
  Removed gold weapon and tools.  
  Added craft for green dye from cactus.  
  On mesecon signal the tnt starts to burn not explodes.
- Created effects_hud for player effect display. Used [hud_timers](https://repo.or.cz/minetest_hudbars.git) as template.
- Added Mana for magic. ([repo](https://repo.or.cz/minetest_mana.git))
  Renamed to hbmana.  
  Changed the starting mana.
<!-- - Added Flying carpet. ([repo](https://repo.or.cz/minetest_flying_carpet.git)) -->
- Added Hbhunger for hunger. ([repo](https://repo.or.cz/minetest_hbhunger.git))
  Added new foods.  
  "Reconfigured".
- Added Hbsprint for sprinting ability (modified) ([Github](https://github.com/minetest-mods/hbsprint))
- Added Hbarmor for armor stats ([repo](https://repo.or.cz/minetest_hbarmor.git))
- Added Mesecons for electricity like magic to the game ([Github](https://github.com/minetest-mods/mesecons))   
  Changed the torch's texture  
  Changed the switch's effective sides  
  Changed the ghostsone's and removesone's inventory icon
- The default carts mod has been replaced by boost_cart (modified) ([Github](https://github.com/SmallJoker/boost_cart))   
  Kept the original cart   
  The powered rail has been modified to work like in Minecraft
- Beds: the sipmle bed has been removed
- Added Crafting Guide to add, well, crafting guide ([Github](https://github.com/minetest-mods/craftguide))  
  Added support for the "packer".
- Added Mobs Redo (modified) ([NotABug](https://notabug.org/tenplus1/mobs_redo))
- Added Mobs Animal (modified) ([NotABug](https://notabug.org/tenplus1/mobs_animal))   
  Made the honey block a liquid with high viscosity.  
  Removed net. Use lasso.  
  Changed sheep's face.
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
- Added flower pot for decoration (modified) ([Github](https://github.com/minetest-mods/flowerpot))
- Added paintings for decoration (modified) ([Forum](https://forum.minetest.net/viewtopic.php?f=11&t=9635))
- Added frame for decoration ([Github](https://github.com/minetest-mods/frame))
- Created industrial_furnace based on default furnace.
- Added walking_light (modified) ([Forum](https://forum.minetest.net/viewtopic.php?f=11&t=2621&hilit=walking+light)  
  Removed mese pick
- Created fishing (own script)  
  Used Mossmanikin's fishing ([Github](https://github.com/Mossmanikin/fishing)) and Wuzzy's mcl_fishing ([Git](https://git.minetest.land/Wuzzy/MineClone2/src/branch/master/mods/ITEMS/mcl_fishing)) as template.
- Created Backpacks mod.
  <!-- - Created Gems mod based on Quartz ([Github](https://github.com/minetest-mods/quartz))-->

## Licensing

See `LICENSE.txt`

All the modifications and the tinkering is done by PetiAPocok (mmandna@gmail.com)
