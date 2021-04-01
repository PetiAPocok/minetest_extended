# Fire Plus
[![Build status](https://github.com/Dumpster-Studios/fire_plus/workflows/build/badge.svg)](https://github.com/Dumpster-Studios/fire_plus/actions) 
[![ContentDB](https://content.minetest.net/packages/Lone_Wolf/fire_plus/shields/downloads/)](https://content.minetest.net/packages/Lone_Wolf/fire_plus/)
![GitHub](https://img.shields.io/github/license/Dumpster-Studios/fire_plus?color=blue)

Allows players to be lit on fire by various fire-related things.

Visuals include HUD effect and fire particles around player.
You can put yourself out by jumping into water/snow.

![Screenshot](screenshot.png)

## Credits
* Thanks to **TenPlus1** for 3d_armor support and some other things

## API

* `fire_plus.burn_player(player, burns, damage)`
  * Sets `player` on fire and burns them `burns` times with `damage` damage every second
* `fire_plus.tnt_explode_radius`
  * How close to a TNT node a player has to be to detonate it
* `fire_plus.ignition_nodes`
  * Nodes that set players on fire. See the init.lua for examples
* `fire_plus.extinguishers`
  * Nodes that put out burning players. See the init.lua for examples
* **Fire tools**
  * You can allow modders to make tools light punched players on fire
  * Just set `tool_capabilities.damage_groups.burns = <How much damage to do each burn>`
  * There's also `tool_capabilities.damage_groups.burn_time = <How many times to burn the player>`
