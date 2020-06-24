# Minetest mod: Flying Carpet
by Wuzzy

Version: 1.0.0

## Introduction
Quickly explore the vast terrain with the magical flying carpet. But only the skilled users can master its speed, the fools will crash and hurt themselves.

The carpet flies fast horizontally, but very slowly is it able to move vertically. It constantly reduces your mana resources (if Mana mod is enabled) and will wear out over time.

## Dependencies
The mod does not depend on anything but it adds some features if certain mods
are available:

* `default` and `wool` (in Minetest Game): Adds a crafting recipe
* `mana`: Using the flying carpet costs mana
* `doc_items`: Adds in-game help for the flying carpet
* `doc_identifier`: Support for the lookup tool

Obtaining
---------
In Minetest Game (and most similar games), you can craft the flying carpet using the
following recipe:

    Red Wool,     Yellow Wool, Red Wool
    Yellow Wool,  Red Wool,    Yellow Wool
    Mese Crystal, Gold Block,  Mese Crystal

In MineClone 2, replace the mese cystals with redstone blocks.

Games other than Minetest Game *might* work if they have been forked from it.
If you use an entirely different game, you might be able to obtain it in a different
way provided by the game. If all else fails, you can obtain it by “cheating”, using
the server command “`/giveme flying_carpet:carpet`” (requires “`give`” privilege).

## How to use
Look to the desired initial flight direction and place the carpet on any flat surface which is not inside a liquid. Make sure it has enough space (3×2×3), then place it.

Right-click the carpet to sit on it and depart. Note you can not enter the flying carpet if you are currently in any other vehicle (e.g. boat).
You can also not enter a flying carpet if it is going fast.

The flying carpet has a basic movement speed which the flying carpet is aiming to reach; thus, the carpet flies without your intervention. Use the speed keys to change the speed for a while; they apply only for as long as you hold down the keys. As soon as you release the keys, the carpet will go back to its basic speed again.

Flying the carpet is a bit tricky, because it flies fast, you can't fully brake and the turning speed is rather low. Be careful not to crash into the landscape!

If the carpet is under a certain critical speed, it loses its magic and just drops on the ground.
There is a short “grace period” at the beginning of the flight where this minimum speed limit does not apply.
You can tell by the color of the particles emitted by the flying carpet whether you are critically slow. If the particles are yellow, everything is okay,
but if they become red this means the carpet is going dangerously slow and you should speed up; if you slow down even more you might risk for the flying carpet
to fail.

The flying carpet also fails immediately if you crash into the landscape.
If you crash while being fast, you may also take damage. There is also fall damage, but with the carpet it is greatly reduced compared to a “normal” drop.
Your carpet will also stop working if your mana resources are depleted (only if Mana mod is installed and active).
When your carpet stopped working, you have to collect the carpet (punch it) and place it again.

If you fly directly down onto a flat solid ground, your flying carpet will come to a halt quickly due to
friction.

Your carpet can not fly into liquids from above, but it can fly into them from the side or even below.
But the speed in liquids is greatly reduced and your carpet will likely fail.

## Long-term usage
Your carpet is not indestructible! Long flights, scratching and crashes will wear out the carpet over
time and it might get destroyed eventually.

Crash-landing at high speeds will deal major damage, so you should avoid crashing at all costs.
Sliding on the surface will deal a minor wear but it is often negligible.

A constant wear is also caused by flying, but very slowly.

If you always fly perfectly, you could use a single flying carpet for about 12 hours. Fly safe to make
the most of your flying carpet!

On high wear levels, the carpet will emit black particles behind it which will increase in number
with its wear. As long there are only a few black particles, you're still good as long as you don't
crash-land. You should get a replacement soon. If the number of black particles is about the
same as the yellow/red particles, the wear has reached a very high level.

On a critical wear level, the carpet will emit a very annoying loud noise while flying. This is the final
warning, you will have roughly five minutes worth of flight until the carpet finally disintegrates under
your feet! You should land as soon as possible.

Additionally, a flying carpet will disintegrate and is lost forever if it stands still and has no user
for 1 minute.

## Controls
* Up: Hold down to speed up
* Down: Hold down to slow down
* Left: Turn left
* Right: Turn right
* Jump: Ascend
* Sneak: Descend
* Right click carpet: Sit on carpet / Get off the carpet
* Punch carpet:
    * While flying: Stop flying immediately
    * While not flying: Take it

Note: Collecting and entering a flying carpet is not possible while it is moving fast.

## Licenses
This mod free software.

### License of source code
MIT License

### Authors and licenses of media files
- `flying_carpet_model.obj`: Wuzzy, MIT License
- `flying_carpet_flight.ogg`: MIT License
- `flying_carpet_out_of_energy.ogg`: by p0ss, CC BY-SA 3.0
- `flying_carpet_almost_dead.ogg`: by John, MIT License
- `flying_carpet_place.ogg`: Unknown authors and Wuzzy (compilation of Public Domain sounds), MIT License
- `flying_carpet_take.ogg`: Julien Matthey, modified by Wuzzy, MIT License
- `flying_carpet_surface.png`: Roman Zacharij and Wuzzy, MIT License
- `flying_carpet_wield.png`: Roman Zacharij and Wuzzy, MIT License
- `flying_carpet_inventory.png`: Roman Zacharij and Wuzzy, MIT License
- `flying_carpet_slide.ogg`: crcavol, MIT License
- `flying_carpet_magic_smoke.png`: Wuzzy, MIT License
- `flying_carpet_smoke.png.png`: Wuzzy. MIT License
- `flying_carpet_star.png`: Wuzzy, MIT License
- `flying_carpet_star_warning.png`: Wuzzy, MIT License
- `flying_carpet_star_death_warning.png`: Wuzzy, MIT License
- `flying_carpet_death.png`: Wuzzy, MIT License

### License references
* [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/)
