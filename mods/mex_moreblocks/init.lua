
--
-- Naturally spawning blocks
--

minetest.register_node("darkage:chalk", {
	description = "Chalk",
	tiles = {"darkage_chalk.png"},
	is_ground_content = true,
	drop = "darkage:chalk_powder 4",
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:marble", {
	description = "Marble",
	tiles = {"darkage_marble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:serpentine", {
	description = "Serpentine",
	tiles = {"darkage_serpentine.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:mud", {
	description = "Mud",
	tiles = {"darkage_mud_top.png", "darkage_mud.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	drop = "darkage:mud_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("darkage:schist", {
	description = "Schist",
	tiles = {"darkage_schist.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:shale", {
	description = "Shale",
	tiles = {"darkage_shale.png","darkage_shale.png","darkage_shale_side.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:silt", {
	description = "Silt",
	tiles = {"darkage_silt.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	drop = "darkage:silt_lump 4",
	sounds = default.node_sound_dirt_defaults({
		footstep = "",
	}),
})

minetest.register_node("darkage:slate", {
	description = "Slate",
	tiles = {"darkage_slate.png","darkage_slate.png","darkage_slate_side.png"},
	is_ground_content = true,
	drop = "darkage:slate_cobble",
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:ors", {
	description = "Old Red Sandstone",
	tiles = {"darkage_ors.png"},
	is_ground_content = true,
	drop = "darkage:ors_cobble",
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:gneiss", {
	description = "Gneiss",
	tiles = {"darkage_gneiss.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = "darkage:gneiss_cobble",
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:basalt", {
	description = "Basalt",
	tiles = {"darkage_basalt.png"},
	is_ground_content = true,
	drop = "darkage:basalt_cobble",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

--
-- Cobble
--

minetest.register_node("darkage:slate_cobble", {
	description = "Slate Cobble",
	tiles = {"darkage_slate_cobble.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:ors_cobble", {
	description = "Old Red Sandstone Cobble",
	tiles = {"darkage_ors_cobble.png"},
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:gneiss_cobble", {
	description = "Gneiss Cobble",
	tiles = {"darkage_gneiss_cobble.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:basalt_cobble", {
	description = "Basalt Cobble",
	tiles = {"darkage_basalt_cobble.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

--
-- Brick
--

minetest.register_node("darkage:slate_brick", {
	description = "Slate Brick",
	tiles = {"darkage_slate_brick.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:ors_brick", {
	description = "Old Red Sandstone Brick",
	tiles = {"darkage_ors_brick.png"},
	groups = {crumbly=2,cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:gneiss_brick", {
	description = "Gneiss Brick",
	tiles = {"darkage_gneiss_brick.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:basalt_brick", {
	description = "Basalt Brick",
	tiles = {"darkage_basalt_brick.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:stone_brick", {
	description = "Stone Brick",
	tiles = {"darkage_stone_brick.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

--
-- Other Blocks
--

minetest.register_node("darkage:straw", {
	description = "Straw",
	tiles = {"darkage_straw.png"},
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("darkage:straw_bale", {
	description = "Straw Bale",
	tiles = {"darkage_straw_bale.png"},
	drop = "darkage:straw 4",
	groups = {snappy=2, flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("darkage:slate_tile", {
	description = "Slate Tile",
	tiles = {"darkage_slate_tile.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:marble_tile", {
	description = "Marble Tile",
	tiles = {"darkage_marble_tile.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:reinforced_chalk", {
	description = "Reinforced Chalk",
	tiles = {"darkage_chalk.png^darkage_reinforce.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:adobe", {
	description = "Adobe",
	tiles = {"darkage_adobe.png"},
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("darkage:lamp", {
	description = "Lamp",
	tiles = {"darkage_lamp.png"},
	paramtype = "light",
	light_source = 14,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,flammable=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("darkage:cobble_with_plaster", {
	description = "Cobblestone With Plaster",
	tiles = {"darkage_cobble_with_plaster_D.png", "darkage_cobble_with_plaster_B.png", "darkage_cobble_with_plaster_C.png",
		"darkage_cobble_with_plaster_A.png", "default_cobble.png", "darkage_chalk.png"},
	paramtype2 = "facedir",
	drop = "default:cobble",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("darkage:darkdirt", {
	description = "Dark Dirt",
	tiles = {"darkage_darkdirt.png"},
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("darkage:dry_leaves", {
	description = "Dry Leaves",
	tiles = {"darkage_dry_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, flammable=2},
	sounds = default.node_sound_leaves_defaults()
})

--
-- Storage blocks (boxes, shelves, ect.)
--

minetest.register_node("darkage:box", {
	description = "Box",
	tiles = { "darkage_box_top.png","darkage_box_top.png","darkage_box.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,8]"..
				"list[current_name;main;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", "Box")
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in box at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to box at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from box at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_node("darkage:wood_shelves", {
	description = "Wooden Shelves",
	tiles = { "darkage_shelves.png","darkage_shelves.png","darkage_shelves.png",
			"darkage_shelves.png","darkage_shelves.png","darkage_shelves_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = {snappy = 3},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,10]"..
				"list[context;up;0,0;8,3;]"..
				"list[context;down;0,3;8,3;]"..
				"list[current_player;main;0,6;8,4;]")
		meta:set_string("infotext", "Wooden Shelves")
		local inv = meta:get_inventory()
		inv:set_size("up", 16)
		inv:set_size("down", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("shape") and inv:is_empty("out") and inv:is_empty("water")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in shelves at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to shelves at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from shelves at "..minetest.pos_to_string(pos))
	end,
})

--
-- Glass / Glow Glass
--

minetest.register_node("darkage:glass", {
	description = "Medieval Glass",
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("darkage:glow_glass", {
	description = "Medieval Glow Glass",
	drawtype = "glasslike",
	tiles = {"darkage_glass.png"},
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

--
-- Reinforced Wood
--

minetest.register_node("darkage:reinforced_wood", {
	description = "Reinforced Wood",
	tiles = {"default_wood.png^darkage_reinforce.png"},
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:reinforced_wood_left", {
	description = "Reinforced Wood Left",
	tiles = {"darkage_reinforced_wood_left.png"},
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("darkage:reinforced_wood_right", {
	description = "Reinforced Wood Right",
	tiles = {"darkage_reinforced_wood_right.png"},
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
	sounds = default.node_sound_wood_defaults()
})

--
-- Wood based decoration items
--

minetest.register_node("darkage:wood_bars", {
	description = "Wooden Bars",
	drawtype = "glasslike",
	tiles = {"darkage_wood_bars.png"},
	inventory_image = "darkage_wood_bars.png",
	wield_image = "darkage_wood_bars.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:wood_grille", {
	description = "Wooden Grille",
	drawtype = "glasslike",
	tiles = {"darkage_wood_grille.png"},
	inventory_image = "darkage_wood_grille.png",
	wield_image = "darkage_wood_grille.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:wood_frame", {
	description = "Wooden Frame",
	drawtype = "glasslike",
	tiles = {"darkage_wood_frame.png"},
	inventory_image = "darkage_wood_frame.png",
	wield_image = "darkage_wood_frame.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,choppy=2},
	sounds = default.node_sound_stone_defaults()
})

--
-- Metal based decoration items
--

minetest.register_node("darkage:chain", {
	description = "Chain",
	drawtype = "signlike",
	tiles = {"darkage_chain.png"},
	inventory_image = "darkage_chain.png",
	wield_image = "darkage_chain.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	selection_box = {
		type = "wallmounted",
	},
	groups = {snappy=1,cracky=2,oddly_breakable_by_hand=2},
	legacy_wallmounted = true
})

minetest.register_node("darkage:iron_bars", {
	description = "Iron Bars",
	drawtype = "glasslike",
	tiles = {"darkage_iron_bars.png"},
	inventory_image = "darkage_iron_bars.png",
	wield_image = "darkage_iron_bars.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("darkage:iron_grille", {
	description = "Iron Grille",
	drawtype = "glasslike",
	tiles = {"darkage_iron_grille.png"},
	inventory_image = "darkage_iron_grille.png",
	wield_image = "darkage_iron_grille.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})








--[[
GloopBlocks
Originally written by GloopMaster

Maintained by VanessaE.

--]]

gloopblocks = {}

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

-- Nodes

minetest.register_node("gloopblocks:rainbow_block_diagonal", {
	description = S("Diagonal Rainbow Block"),
	tiles = {"gloopblocks_rainbow_block.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_defaults(),
})
minetest.register_alias("gloopblocks:rainbow_block", "gloopblocks:rainbow_block_diagonal")

minetest.register_node("gloopblocks:rainbow_block_horizontal", {
	description = S("Horizontal Rainbow Block"),
	tiles = {
		"gloopblocks_rainbow_horizontal.png^[transformR90",
		"gloopblocks_rainbow_horizontal.png^[transformR90",
		"gloopblocks_rainbow_horizontal.png"
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("gloopblocks:evil_block", {
	description = S("Evil Block"),
	tiles = {"gloopblocks_evil_block.png"},
	light_source = 5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:basalt", {
	description = S("Basalt"),
	tiles = {"gloopblocks_basalt.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:pumice", {
	description = S("Pumice"),
	tiles = {"gloopblocks_pumice.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("gloopblocks:pavement", {
	description = S("Pavement"),
	tiles = {"gloopblocks_pavement.png"},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:oerkki_block", {
	drawtype = "nodebox",
	description = S("Oerkki Block"),
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_tb.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_sides.png",
		"gloopblocks_oerkkiblock_front.png"
	},
	groups = {cracky=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox2
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox5
			{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox6
		}
	}
})

minetest.register_node("gloopblocks:stone_brick_mossy", {
	description = S("Mossy Stone Brick"),
	tiles = {"gloopblocks_stone_brick_mossy.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:stone_mossy", {
	description = S("Mossy Stone"),
	tiles = {"gloopblocks_stone_mossy.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "default:mossycobble"
})

minetest.register_node("gloopblocks:cobble_road", {
	description = S("Cobblestone Road Bed"),
	tiles = {"gloopblocks_cobble_road.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:cobble_road_mossy", {
	description = S("Mossy Cobblestone Road Bed"),
	tiles = {"gloopblocks_cobble_road_mossy.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gloopblocks:scaffolding", {
	description = S("Wooden Scaffold"),
	drawtype = "allfaces",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"gloopblocks_scaffold.png"},
	groups = {choppy=3, oddly_breakable_by_hand=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_alias("moreblocks:oerkkiblock", "gloopblocks:oerkki_block")
minetest.register_alias("gloopblocks:obsidian", "default:obsidian")

-- Nodes imported from Usesdirt ================================================================================

if not minetest.get_modpath("usesdirt") then

	local dirt_brick_tex  = "default_dirt.png^gloopblocks_dirt_brick_overlay.png"
	local dirt_cobble_tex = "default_cobble.png^(default_dirt.png^[mask:gloopblocks_dirt_cobble_mask.png)"
	local dirt_stone_tex  = "default_stone.png^(default_dirt.png^[mask:gloopblocks_dirt_stone_mask.png)"

	local dirt_ladder_tex = "(default_dirt.png^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_brick_ladder_tex = "(("..dirt_brick_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_cobble_ladder_tex = "(("..dirt_cobble_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"
	local dirt_stone_ladder_tex = "(("..dirt_stone_tex..")^[mask:gloopblocks_ladder_mask.png)^gloopblocks_ladder_overlay.png"

	minetest.register_node(":usesdirt:dirt_brick", {
		tiles = { dirt_brick_tex },
		description = "Dirt Brick",
		groups = {snappy=2,choppy=1,oddly_breakable_by_hand=2},
	})

	minetest.register_node(":usesdirt:dirt_brick_ladder", {
		description = "Dirt Brick Ladder",
		drawtype = "signlike",
		tiles = { dirt_brick_ladder_tex },
		inventory_image = dirt_brick_ladder_tex,
		wield_image     = dirt_brick_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {cracky=3, stone=2},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_brick_ladder 3',
		recipe = {
			{'usesdirt:dirt_brick', '', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick','usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick','','usesdirt:dirt_brick'},
		}
	})

	default.register_fence(":usesdirt:dirt_brick_fence", {
		description = "Dirt Brick Fence",
		texture = dirt_brick_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_brick",
		groups = {cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})

	if minetest.get_modpath("moreblocks") then
		minetest.register_craft({
			output = 'usesdirt:dirt_brick 24',
			recipe = {
				{'moreblocks:dirt_compressed', 'moreblocks:dirt_compressed', '' },
				{'moreblocks:dirt_compressed', 'moreblocks:dirt_compressed', '' }
			}
		})
	else
		minetest.register_craft({
			output = 'usesdirt:dirt_brick 6',
			recipe = {
				{'default:dirt', 'default:dirt', 'default:dirt'},
				{'default:dirt', 'default:dirt', 'default:dirt'},
				{'default:dirt', 'default:dirt', 'default:dirt'},
			}
		})
	end

	minetest.register_node(":usesdirt:dirt_ladder", {
		description = "Dirt Ladder",
		drawtype = "signlike",
		tiles = { dirt_ladder_tex },
		inventory_image = dirt_ladder_tex,
		wield_image     = dirt_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_ladder 3',
		recipe = {
			{'usesdirt:dirt_brick', '', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick','usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick','','usesdirt:dirt_brick'},
		}
	})

	default.register_fence(":usesdirt:dirt_fence", {
		description = "Dirt Fence",
		texture = "default_dirt.png",
		inventory_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
		material = "default:dirt",
		groups = {snappy=2,choppy=1,oddly_breakable_by_hand=3},
		sounds = default.node_sound_dirt_defaults(),
		check_for_pole = true
	})

----

	minetest.register_node(":usesdirt:dirt_cobble_stone", {
		tiles = { dirt_cobble_tex },
		description = "Dirt Cobble Stone",
		is_ground_content = true,
		groups = {cracky=3, stone=2},
	})
	minetest.register_craft({
		output = '"usesdirt:dirt_cobble_stone" 3',
		recipe = {
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
			{'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
		}
	})

	minetest.register_node(":usesdirt:dirt_cobble_stone_ladder", {
		description = "Dirt Cobble Stone Ladder",
		drawtype = "signlike",
		tiles = { dirt_cobble_ladder_tex },
		inventory_image = dirt_cobble_ladder_tex,
		wield_image     = dirt_cobble_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {cracky=3, stone=2},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_cobble_stone_ladder 3',
		recipe = {
			{'usesdirt:dirt_cobble_stone', '', 'usesdirt:dirt_cobble_stone'},
			{'usesdirt:dirt_cobble_stone', 'usesdirt:dirt_cobble_stone','usesdirt:dirt_cobble_stone'},
			{'usesdirt:dirt_cobble_stone','','usesdirt:dirt_cobble_stone'},
		}
	})

	default.register_fence(":usesdirt:dirt_cobble_stone_fence", {
		description = "Dirt Cobble Stone Fence",
		texture = dirt_cobble_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_cobble_stone",
		groups = {cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})

----

	minetest.register_node(":usesdirt:dirt_stone", {
		tiles = { dirt_stone_tex },
		description = "Dirt Stone",
		is_ground_content = true,
		groups = {cracky=3, stone=2},
	})

	minetest.register_node(":usesdirt:dirt_stone_ladder", {
		description = "Dirt Stone Ladder",
		drawtype = "signlike",
		tiles = { dirt_stone_ladder_tex },
		inventory_image = dirt_stone_ladder_tex,
		wield_image     = dirt_stone_ladder_tex,
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = true,
		walkable = false,
		climbable = true,
		selection_box = {
			type = "wallmounted",
			--wall_top = = <default>
			--wall_bottom = = <default>
			--wall_side = = <default>
		},
		groups = {cracky=3, stone=2},
		legacy_wallmounted = true,
	})
	minetest.register_craft({
		output = 'usesdirt:dirt_stone_ladder 3',
		recipe = {
			{'usesdirt:dirt_stone', '', 'usesdirt:dirt_stone'},
			{'usesdirt:dirt_stone', 'usesdirt:dirt_stone','usesdirt:dirt_stone'},
			{'usesdirt:dirt_stone','','usesdirt:dirt_stone'},
		}
	})

	default.register_fence(":usesdirt:dirt_stone_fence", {
		description = "Dirt Stone Fence",
		texture = dirt_stone_tex,
		inventory_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
		material = "usesdirt:dirt_stone",
		groups = {cracky=3, stone=2},
		sounds = default.node_sound_stone_defaults(),
		check_for_pole = true
	})
end

-- Stairs/slabs defs, conversion of normal -> mossy items

if minetest.setting_getbool("gloopblocks_mossy_conversion") ~= false then

	function gloopblocks_register_mossy_conversion(mossyobjects)
		for i in ipairs(mossyobjects) do
			minetest.register_abm({
				nodenames = { mossyobjects[i][1] },
				neighbors = {"default:water_source", "default:water_flowing"},
				interval = 120,
				chance = 50,
				action = function(pos, node)
					if minetest.find_node_near(pos, 2, "air") then
						local fdir = node.param2
						minetest.add_node(pos, {name = mossyobjects[i][2], param2 = fdir})
					end
				end,
			})
		end
	end
end

if minetest.get_modpath("moreblocks") then

	stairsplus:register_all("gloopblocks", "oerkki_block", "gloopblocks:oerkki_block", {
		description = S("Oerkki Block"),
		tiles = {
			"gloopblocks_oerkkiblock_tb.png",
			"gloopblocks_oerkkiblock_tb.png",
			"gloopblocks_oerkkiblock_sides.png",
			"gloopblocks_oerkkiblock_sides.png",
			"gloopblocks_oerkkiblock_sides.png",
			"gloopblocks_oerkkiblock_front.png"
		},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "stone_brick_mossy", "gloopblocks:stone_brick_mossy", {
		description = S("Mossy Stone Brick"),
		tiles = {"gloopblocks_stone_brick_mossy.png"},
		groups = {cracky=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "stone_mossy", "gloopblocks:stone_mossy", {
		description = S("Mossy Stone"),
		tiles = {"gloopblocks_stone_mossy.png"},
		groups = {cracky=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "cobble_road", "gloopblocks:cobble_road", {
		description = S("Cobblestone Roadbed"),
		tiles = {"gloopblocks_cobble_road.png"},
		groups = {cracky=3, stone=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "cobble_road_mossy", "gloopblocks:cobble_road_mossy", {
		description = S("Mossy Cobblestone Roadbed"),
		tiles = {"gloopblocks_cobble_road_mossy.png"},
		groups = {cracky=3, stone=1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "pavement", "gloopblocks:pavement", {
		description = S("Pavement"),
		tiles = {"gloopblocks_pavement.png"},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "rainbow_block", "gloopblocks:rainbow_block", {
		description = S("Rainbow Block"),
		tiles = {"gloopblocks_rainbow_block.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "evil_block", "gloopblocks:evil_block", {
		description = S("Evil Block"),
		tiles = {"gloopblocks_evil_block.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_defaults(),
		light_source = 5,
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "basalt", "gloopblocks:basalt", {
		description = S("Basalt"),
		tiles = {"gloopblocks_basalt.png"},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "pumice", "gloopblocks:pumice", {
		description = S("Pumice"),
		tiles = {"gloopblocks_pumice.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = true,
	})

	stairsplus:register_all("gloopblocks", "gravel", "default:gravel", {
		description = S("Gravel"),
		tiles = {"default_gravel.png"},
		groups = {crumbly = 2, falling_node = 1, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		sunlight_propagates = false,
	})

	if minetest.get_modpath("caverealms") then
		stairsplus:register_all("caverealms", "glow_crystal", "caverealms:glow_crystal", {
			description = S("Glow Crystal"),
			tiles = {"caverealms_glow_crystal.png"},
			groups = {cracky=3, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
			light_source = 12,
			use_texture_alpha = true,
			paramtype="light",
			sunlight_propagates = true,
		})

		stairsplus:register_all("caverealms", "glow_emerald", "caverealms:glow_emerald", {
			description = S("Glow Emerald"),
			tiles = {"caverealms_glow_emerald.png"},
			groups = {cracky=3, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
			light_source = 12,
			use_texture_alpha = true,
			paramtype="light",
			sunlight_propagates = true,
		})

		stairsplus:register_all("caverealms", "glow_mese", "caverealms:glow_mese", {
			description = S("Glow Mese"),
			tiles = {"caverealms_glow_mese.png"},
			groups = {cracky=3, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
			light_source = 12,
			use_texture_alpha = true,
			paramtype="light",
			sunlight_propagates = true,
		})
	end

	-- ABMs for mossy objects

	if minetest.setting_getbool("gloopblocks_mossy_conversion") ~= false then

		gloopblocks_register_mossy_conversion({
			{ "moreblocks:stair_cobble", 				"moreblocks:stair_mossycobble" },
			{ "moreblocks:stair_cobble_inner", 			"moreblocks:stair_mossycobble_inner" },
			{ "moreblocks:stair_cobble_outer", 			"moreblocks:stair_mossycobble_outer" },
			{ "moreblocks:stair_cobble_half", 			"moreblocks:stair_mossycobble_half" },
			{ "moreblocks:slab_cobble_quarter", 		"moreblocks:slab_mossycobble_quarter" },
			{ "moreblocks:slab_cobble", 				"moreblocks:slab_mossycobble" },
			{ "moreblocks:slab_cobble_three_quarter", 	"moreblocks:slab_mossycobble_three_quarter" },
			{ "moreblocks:panel_cobble", 				"moreblocks:panel_mossycobble" },
			{ "moreblocks:micro_cobble", 				"moreblocks:micro_mossycobble" },
			{ "moreblocks:stair_cobble_alt", 			"moreblocks:stair_mossycobble_alt" },

			{ "gloopblocks:cobble_road", 				"gloopblocks:cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road", 			"gloopblocks:stair_cobble_road_mossy" },
			{ "gloopblocks:slab_cobble_road", 			"gloopblocks:slab_cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road", 			"gloopblocks:stair_cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road_inner", 	"gloopblocks:stair_cobble_road_mossy_inner" },
			{ "gloopblocks:stair_cobble_road_outer", 	"gloopblocks:stair_cobble_road_mossy_outer" },
			{ "gloopblocks:stair_cobble_road_half", 	"gloopblocks:stair_cobble_road_mossy_half" },
			{ "gloopblocks:slab_cobble_road_quarter", 	"gloopblocks:slab_cobble_road_mossy_quarter" },
			{ "gloopblocks:slab_cobble_road", 			"gloopblocks:slab_cobble_road_mossy" },
			{ "gloopblocks:slab_cobble_road_three_quarter",	"gloopblocks:slab_cobble_road_mossy_three_quarter" },
			{ "gloopblocks:panel_cobble_road", 			"gloopblocks:panel_cobble_road_mossy" },
			{ "gloopblocks:micro_cobble_road", 			"gloopblocks:micro_cobble_road_mossy" },
			{ "gloopblocks:stair_cobble_road_alt", 		"gloopblocks:stair_cobble_road_mossy_alt" },

			{ "default:stonebrick", 					"gloopblocks:stone_brick_mossy" },
			{ "default:stair_stonebrick", 				"gloopblocks:stair_stone_brick_mossy" },
			{ "default:slab_stonebrick", 				"gloopblocks:slab_stone_brick_mossy" },
			{ "moreblocks:stair_stonebrick", 			"gloopblocks:stair_stone_brick_mossy" },
			{ "moreblocks:stair_stonebrick_inner", 		"gloopblocks:stair_stone_brick_mossy_inner" },
			{ "moreblocks:stair_stonebrick_outer", 		"gloopblocks:stair_stone_brick_mossy_outer" },
			{ "moreblocks:stair_stonebrick_half", 		"gloopblocks:stair_stone_brick_mossy_half" },
			{ "moreblocks:slab_stonebrick_quarter", 	"gloopblocks:slab_stone_brick_mossy_quarter" },
			{ "moreblocks:slab_stonebrick", 			"gloopblocks:slab_stone_brick_mossy" },
			{ "moreblocks:slab_stonebrick_three_quarter", "gloopblocks:slab_stone_brick_mossy_three_quarter" },
			{ "moreblocks:panel_stonebrick", 			"gloopblocks:panel_stone_brick_mossy" },
			{ "moreblocks:micro_stonebrick", 			"gloopblocks:micro_stone_brick_mossy" },
			{ "moreblocks:stair_stonebrick_alt", 		"gloopblocks:stair_stone_brick_mossy_alt" },

			{ "default:stone", 							"gloopblocks:stone_mossy" },
			{ "default:stair_stone", 					"gloopblocks:stair_stone_mossy" },
			{ "default:slab_stone", 					"gloopblocks:slab_stone_mossy" },
			{ "moreblocks:stair_stone", 				"gloopblocks:stair_stone_mossy" },
			{ "moreblocks:stair_stone_inner", 			"gloopblocks:stair_stone_mossy_inner" },
			{ "moreblocks:stair_stone_outer", 			"gloopblocks:stair_stone_mossy_outer" },
			{ "moreblocks:stair_stone_half", 			"gloopblocks:stair_stone_mossy_half" },

			{ "moreblocks:slab_stone_quarter", 			"gloopblocks:slab_stone_mossy_quarter" },
			{ "moreblocks:slab_stone", 					"gloopblocks:slab_stone_mossy" },
			{ "moreblocks:slab_stone_three_quarter",	"gloopblocks:slab_stone_mossy_three_quarter" },
			{ "moreblocks:panel_stone", 				"gloopblocks:panel_stone_mossy" },
			{ "moreblocks:micro_stone", 				"gloopblocks:micro_stone_mossy" },
			{ "moreblocks:stair_stone_alt", 			"gloopblocks:stair_stone_mossy_alt" },
		})
	end

elseif minetest.get_modpath("stairs") then

	--stairs.register_stair(subname, recipeitem, groups, images, description, sounds)

	-- stairs:xxxx_stone_mossy ; xxxx = stair or slab
	stairs.register_stair_and_slab("stone_mossy", "gloopblocks:stone_mossy",
		{cracky=3},
		{"gloopblocks_stone_mossy.png"},
		S("Mossy Stone Stair"),
		S("Mossy Stone Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_mossycobble
	stairs.register_stair_and_slab("mossycobble", "default:mossycobble",
		{cracky=3},
		{"default_mossycobble.png"},
		S("Mossy Cobble Stair"),
		S("Mossy Cobble Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_stone_brick_mossy
	stairs.register_stair_and_slab("stone_brick_mossy", "gloopblocks:stone_brick_mossy",
		{cracky=3},
		{"gloopblocks_stone_brick_mossy.png"},
		S("Mossy Stone Brick Stair"),
		S("Mossy Stone Brick Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road
	stairs.register_stair_and_slab("cobble_road", "gloopblocks:cobble_road",
		{cracky=3},
		{"gloopblocks_cobble_road.png"},
		S("Cobble Roadbed Stair"),
		S("Cobble Roadbed Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cobble_road_mossy
	stairs.register_stair_and_slab("cobble_road_mossy", "gloopblocks:cobble_road_mossy",
		{cracky=3},
		{"gloopblocks_cobble_road_mossy.png"},
		S("Mossy Cobble Roadbed Stair"),
		S("Mossy Cobble Roadbed Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_cement
	stairs.register_stair_and_slab("cement", "gloopblocks:cement",
		{cracky=2},
		{"basic_materials_cement_block.png"},
		S("Cement Stair"),
		S("Cement Slab"),
		default.node_sound_stone_defaults())

	-- stairs:xxxx_pavement
	stairs.register_stair_and_slab("pavement", "gloopblocks:pavement",
		{cracky=3, oddly_breakable_by_hand=3},
		{"gloopblocks_pavement.png"},
		S("Pavement Stair"),
		S("Pavement Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("basalt", "gloopblocks:basalt",
		{cracky=2},
		{"gloopblocks_basalt.png"},
		S("Basalt Stair"),
		S("Basalt Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("pumice", "gloopblocks:pumice",
		{cracky=3},
		{"gloopblocks_pumice.png"},
		S("Pumice Stair"),
		S("Pumice Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("rainbow_block", "gloopblocks:rainbow_block",
		{cracky=3},
		{"gloopblocks_rainbow_block.png"},
		S("Rainbow Block Stair"),
		S("Rainbow Block Slab"),
		default.node_sound_defaults())

	if minetest.setting_getbool("gloopblocks_mossy_conversion") ~= false then

		gloopblocks_register_mossy_conversion({
			{ "default:cobble", 					"default:mossycobble" },
			{ "stairs:stair_cobble", 				"stairs:stair_mossycobble" },
			{ "stairs:slab_cobble", 				"stairs:slab_mossycobble" },
			{ "gloopblocks:cobble_road", 			"gloopblocks:cobble_road_mossy" },
			{ "stairs:stair_cobble_road", 			"stairs:stair_cobble_road_mossy" },
			{ "stairs:slab_cobble_road", 			"stairs:slab_cobble_road_mossy" },
			{ "default:stonebrick", 				"gloopblocks:stone_brick_mossy" },
			{ "stairs:stair_stonebrick", 			"stairs:stair_stone_brick_mossy" },
			{ "stairs:slab_stonebrick", 			"stairs:slab_stone_brick_mossy" },
			{ "default:stone", 						"gloopblocks:stone_mossy" },
			{ "stairs:stair_stone", 				"stairs:stair_stone_mossy" },
			{ "stairs:slab_stone", 					"stairs:slab_stone_mossy" },
		})
	end

	minetest.register_alias("default:stair_mossycobble", "stairs:stair_mossycobble")
	minetest.register_alias("default:slab_mossycobble", "stairs:slab_mossycobble")
	minetest.register_alias("gloopblocks:stair_cobble_road", "stairs:stair_cobble_road")
	minetest.register_alias("gloopblocks:slab_cobble_road", "stairs:slab_cobble_road")
	minetest.register_alias("gloopblocks:stair_cobble_road_mossy", "stairs:stair_cobble_road_mossy")
	minetest.register_alias("gloopblocks:slab_cobble_road_mossy", "stairs:slab_cobble_road_mossy")
	minetest.register_alias("gloopblocks:stair_stone_brick_mossy", "stairs:stair_stone_brick_mossy")
	minetest.register_alias("gloopblocks:slab_stone_brick_mossy", "stairs:slab_stone_brick_mossy")
	minetest.register_alias("gloopblocks:stair_stone_mossy", "stairs:stair_stone_mossy")
	minetest.register_alias("gloopblocks:slab_stone_mossy", "stairs:slab_stone_mossy")
	minetest.register_alias("gloopblocks:stair_cement", "stairs:stair_cement")
	minetest.register_alias("gloopblocks:slab_cement", "stairs:slab_cement")
	minetest.register_alias("gloopblocks:stair_pavement", "stairs:stair_pavement")
	minetest.register_alias("gloopblocks:slab_pavement", "stairs:slab_pavement")
	minetest.register_alias("gloopblocks:stair_pumice", "stairs:stair_pumice")
	minetest.register_alias("gloopblocks:slab_pumice", "stairs:slab_pumice")
	minetest.register_alias("gloopblocks:stair_basalt", "stairs:stair_basalt")
	minetest.register_alias("gloopblocks:slab_basalt", "stairs:slab_basalt")
	minetest.register_alias("gloopblocks:stair_rainbow_block", "stairs:stair_rainbow_block")
	minetest.register_alias("gloopblocks:slab_rainbow_block", "stairs:slab_rainbow_block")
end

-- Tools

minetest.register_tool("gloopblocks:pick_cement", {
	description = S("Cement Pickaxe"),
	inventory_image = "gloopblocks_cement_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=3.50, [2]=1.40, [3]=0.90}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:shovel_cement", {
	description = S("Cement Shovel"),
	inventory_image = "gloopblocks_cement_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.50, [2]=0.60, [3]=0.45}, uses=25, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:axe_cement", {
	description = S("Cement Axe"),
	inventory_image = "gloopblocks_cement_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.00, [2]=1.30, [3]=0.80}, uses=25, maxlevel=2},
			fleshy={times={[2]=1.20, [3]=0.65}, uses=30, maxlevel=1}
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("gloopblocks:sword_cement", {
	description = S("Cement Sword"),
	inventory_image = "gloopblocks_cement_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=1.60, [2]=0.80, [3]=0.40}, uses=15, maxlevel=2},
			snappy={times={[2]=0.75, [3]=0.35}, uses=30, maxlevel=1},
			choppy={times={[3]=0.80}, uses=30, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("gloopblocks:pick_evil", {
	description = S("Evil Pickaxe"),
	inventory_image = "gloopblocks_evil_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.10, [2]=0.10, [3]=0.10}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:shovel_evil", {
	description = S("Evil Shovel"),
	inventory_image = "gloopblocks_evil_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=0.05, [2]=0.05, [3]=0.05}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:axe_evil", {
	description = S("Evil Axe"),
	inventory_image = "gloopblocks_evil_axe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2},
			fleshy={times={[1]=0.15, [2]=0.15, [3]=0.15}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=6},
	},
})

minetest.register_tool("gloopblocks:sword_evil", {
	description = S("Evil Sword"),
	inventory_image = "gloopblocks_evil_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			snappy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2},
			choppy={times={[1]=0.20, [2]=0.20, [3]=0.20}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=8},
	}
})

-- Other items

minetest.register_craftitem("gloopblocks:evil_stick", {
	description = S("Evil Stick"),
	inventory_image = "gloopblocks_evil_stick.png",
})

-- define lava-cooling-based nodes and hook into the default lavacooling
-- functions to generate basalt, pumice, and obsidian

if minetest.setting_getbool("gloopblocks_lavacooling") ~= false then

	minetest.register_node("gloopblocks:obsidian_cooled", {
		description = S("Obsidian"),
		tiles = {"default_obsidian.png"},
		is_ground_content = true,
		sounds = default.node_sound_stone_defaults(),
		groups = {cracky=1, level=2, not_in_creative_inventory=1},
		drop = "default:obsidian",
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			minetest.add_node(pos, {name = "default:obsidian"})
		end
	})

	minetest.register_node("gloopblocks:basalt_cooled", {
		description = S("Basalt"),
		tiles = {"gloopblocks_basalt.png"},
		groups = {cracky=2, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		drop = "gloopblocks:basalt",
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			minetest.add_node(pos, {name = "gloopblocks:basalt"})
		end
	})

	minetest.register_node("gloopblocks:pumice_cooled", {
		description = S("Pumice"),
		tiles = {"gloopblocks_pumice.png"},
		groups = {cracky=3, not_in_creative_inventory=1},
		sounds = default.node_sound_stone_defaults(),
		drop = "gloopblocks:pumice",
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			minetest.add_node(pos, {name = "gloopblocks:pumice"})
		end
	})

	local gloopblocks_search_nearby_nodes = function(pos, node)
		if minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name == node then return true end
		if minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name == node then return true end
		return false
	end

	default.cool_lava = function(pos, node)
		if node.name == "default:lava_source" then
			if gloopblocks_search_nearby_nodes(pos,"default:water_source")
			or gloopblocks_search_nearby_nodes(pos,"default:water_flowing") then
				minetest.set_node(pos, {name="gloopblocks:obsidian_cooled"})
			end
		else -- Lava flowing
			if gloopblocks_search_nearby_nodes(pos,"default:water_source") then
				minetest.set_node(pos, {name="gloopblocks:basalt_cooled"})
			elseif gloopblocks_search_nearby_nodes(pos,"default:water_flowing") then
				minetest.set_node(pos, {name="gloopblocks:pumice_cooled"})
			end
		end
	end
end

local fence_texture =
	"default_fence_overlay.png^default_steel_block.png^default_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("gloopblocks:fence_steel", {
	description = S("Steel Fence"),
	drawtype = "fencelike",
	tiles = {"default_steel_block.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 2 },
	sounds = default.node_sound_stone_defaults(),
})

if minetest.get_modpath("worldedit") then
	function gloopblocks.liquid_ungrief(pos1, pos2, name)
		local count
		local p1to2 = minetest.pos_to_string(pos1).." and "..minetest.pos_to_string(pos2)
		local volume = worldedit.volume(pos1, pos2)
		minetest.chat_send_player(name, "Cleaning-up lava/water griefing between "..p1to2.."...")
		if volume > 1000000 then
			minetest.chat_send_player(name, "This operation could affect up to "..volume.." nodes.  It may take a while.")
		end
		minetest.log("action", name.." performs lava/water greifing cleanup between "..p1to2..".")
		count = worldedit.replace(pos1, pos2, "default:lava_source", "air")
		count = worldedit.replace(pos1, pos2, "default:lava_flowing", "air")
		count = worldedit.replace(pos1, pos2, "default:water_source", "air")
		count = worldedit.replace(pos1, pos2, "default:water_flowing", "air")
		count = worldedit.replace(pos1, pos2, "default:river_water_source", "air")
		count = worldedit.replace(pos1, pos2, "default:river_water_flowing", "air")
		count = worldedit.replace(pos1, pos2, "gloopblocks:pumice_cooled", "air")
		count = worldedit.replace(pos1, pos2, "gloopblocks:basalt_cooled", "air")
		count = worldedit.replace(pos1, pos2, "gloopblocks:obsidian_cooled", "air")
		count = worldedit.fixlight(pos1, pos2)
		minetest.chat_send_player(name, "Operation completed.")
	end

	minetest.register_chatcommand("/liquid_ungrief", {
		params = "[size]",
		privs = {worldedit = true},
		description = "Repairs greifing caused by spilling lava and water (and their \"cooling\" results)",
		func = function(name, params)
			local pos1 = worldedit.pos1[name]
			local pos2 = worldedit.pos2[name]
			if not pos1 or not pos2 then return end
			gloopblocks.liquid_ungrief(pos1, pos2, name)
		end
	})
end

dofile(minetest.get_modpath("gloopblocks").."/crafts.lua")

minetest.register_alias("nyancat:nyancat_rainbow", "gloopblocks:rainbow_block_horizontal")
minetest.register_alias("default:nyancat_rainbow", "gloopblocks:rainbow_block_horizontal")

print(S("Gloopblocks Loaded!"))



stairs.register_stair_and_slab("basalt", "darkage:basalt",
    {cracky=3},
    {"darkage_basalt.png"},
    "Basalt Stair",
    "Basalt Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("marble", "darkage:marble",
    {cracky=3},
    {"darkage_marble.png"},
    "Marble Stair",
    "Marble Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("marble", "darkage:serpentine",
    {cracky=3},
    {"darkage_serpentine.png"},
    "Serpentine Stair",
    "Serpentine Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("ors", "darkage:ors",
    {crumbly=2,cracky=2},
    {"darkage_ors.png"},
    "Old Red Sandstone Stair",
    "Old Red Sandstone Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("schist", "darkage:schist",
    {cracky=3},
    {"darkage_schist.png"},
    "Schist Stair",
    "Schist Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("slate", "darkage:slate",
    {cracky=2},
    {"darkage_slate.png"},
    "Slate Stair",
    "Slate Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("gneiss", "darkage:gneiss",
    {cracky=3},
    {"darkage_gneiss.png"},
    "Gneiss Stair",
    "Gneiss Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("chalk", "darkage:chalk",
    {crumbly=2,cracky=2},
    {"darkage_chalk.png"},
    "Chalk Stair",
    "Chalk Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("slate_cobble", "darkage:slate_cobble",
    {cracky=2},
    {"darkage_slate_cobble.png"},
    "Slate Cobble Stair",
    "Slate Cobble Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("slate_brick", "darkage:slate_brick",
    {cracky=2},
    {"darkage_slate_brick.png"},
    "Slate Brick Stair",
    "Slate Brick Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("ors_cobble", "darkage:ors_cobble",
    {crumbly=2,cracky=2},
    {"darkage_ors_cobble.png"},
    "Old Red Sandstone Cobble Stair",
    "Old Red Sandstone Cobble Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("ors_brick", "darkage:ors_brick",
    {crumbly=2,cracky=2},
    {"darkage_ors_brick.png"},
    "Old Red Sandstone Brick Stair",
    "Old Red Sandstone Brick Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("gneiss_cobble", "darkage:gneiss_cobble",
    {crumbly=2,cracky=2},
    {"darkage_gneiss_cobble.png"},
    "Gneiss Cobble Stair",
    "Gneiss Cobble Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("gneiss_brick", "darkage:gneiss_brick",
    {crumbly=2,cracky=2},
    {"darkage_gneiss_brick.png"},
    "Gneiss Brick Stair",
    "Gneiss Brick Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("basalt_cobble", "darkage:basalt_cobble",
    {cracky=3},
    {"darkage_basalt_cobble.png"},
    "Basalt Cobble Stair",
    "Basalt Cobble Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("basalt_brick", "darkage:basalt_brick",
    {cracky=3},
    {"darkage_basalt_brick.png"},
    "Basalt Brick Stair",
    "Basalt Brick Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("straw", "darkage:straw",
    {snappy=3, flammable=2},
    {"darkage_straw.png"},
    "Straw Stair",
    "Straw Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("straw_bale", "darkage:straw_bale",
    {snappy=2, flammable=2},
    {"darkage_straw_bale.png"},
    "Straw Bale Stair",
    "Straw Bale Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("slate_tile", "darkage:slate_tile",
    {cracky=2},
    {"darkage_slate_tile.png"},
    "Slate Tile Stair",
    "Slate Tile Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("marble_tile", "darkage:marble_tile",
    {cracky=2},
    {"darkage_marble_tile.png"},
    "Marble Tile Stair",
    "Marble Tile Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("stone_brick", "darkage:stone_brick",
    {cracky=3},
    {"darkage_stone_brick.png"},
    "Stone Brick Stair",
    "Stone Brick Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("reinforced_chalk", "darkage:reinforced_chalk",
    {cracky=3},
    {"darkage_chalk.png^darkage_reinforce.png"},
    "Reinforced Chalk Stair",
    "Reinforced Chalk Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("glass", "darkage:glass",
    {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    {"darkage_glass.png"},
    "Medieval Glass Stair",
    "Medieval Glass Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("glow_glass", "darkage:glow_glass",
    {snappy=2,cracky=3,oddly_breakable_by_hand=3},
    {"darkage_glass.png"},
    "Medieval Glow Glass Stair",
    "Medieval Glow Glass Slab",
    default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab("reinforced_wood", "darkage:reinforced_wood",
    {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
    {"default_wood.png^darkage_reinforce.png"},
    "Reinforced Wood Stair",
    "Reinforced Wood Slab",
    default.node_sound_stone_defaults()
)



-- Various crafts

minetest.register_craft( {
	type = "shapeless",
	output = "gloopblocks:rainbow_block",
	recipe = {
		"group:dye,color_red",
		"group:dye,color_orange",
		"group:dye,color_yellow",
		"group:dye,color_green",
		"group:dye,color_blue",
		"group:dye,color_violet",
		"default:stone",
		"default:mese_crystal",
	},
})


minetest.register_craft({
	type = "shapeless",
	output = "default:nyancat_rainbow",
	recipe = {
		"gloopblocks:rainbow_block",
		"default:diamondblock",
		"default:steelblock",
		"default:copperblock",
		"default:bronzeblock",
		"default:goldblock",
		"default:mese",
		"moreores:silver_block",
		"moreores:mithril_block"
	}
})

minetest.register_craft({
	output = "default:nyancat",
	recipe = {
		{"gloopblocks:rainbow_block", "gloopblocks:rainbow_block", "gloopblocks:rainbow_block"},
		{"gloopblocks:rainbow_block", "gloopblocks:rainbow_block", "gloopblocks:rainbow_block"},
		{"gloopblocks:rainbow_block", "gloopblocks:rainbow_block", "gloopblocks:rainbow_block"},
	}
})

if minetest.get_modpath("glooptest") then

	minetest.register_craft({
		type = "shapeless",
		output = "gloopblocks:evil_stick",
		recipe = {
			"glooptest:kalite_lump",
			"default:gold_ingot",
			"default:coal_lump",
			"group:stick"
		}
	})

	minetest.register_craft({
		output = "gloopblocks:evil_block",
		recipe = {
			{"gloopblocks:evil_stick", "gloopblocks:evil_stick"},
			{"gloopblocks:evil_stick", "gloopblocks:evil_stick"},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:evil_stick 4",
		recipe = {
			{"gloopblocks:evil_block"}
		}
	})

	minetest.register_craft({
		output = "gloopblocks:pick_evil",
		recipe = {
			{"gloopblocks:evil_block", "gloopblocks:evil_block", "gloopblocks:evil_block"},
			{"", "gloopblocks:evil_stick", ""},
			{"", "gloopblocks:evil_stick", ""},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:axe_evil",
		recipe = {
			{"gloopblocks:evil_block", "gloopblocks:evil_block"},
			{"gloopblocks:evil_block", "gloopblocks:evil_stick"},
			{"", "gloopblocks:evil_stick"},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:axe_evil",
		recipe = {
			{"gloopblocks:evil_block", "gloopblocks:evil_block"},
			{"gloopblocks:evil_stick", "gloopblocks:evil_block"},
			{"gloopblocks:evil_stick", ""},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:shovel_evil",
		recipe = {
			{"gloopblocks:evil_block"},
			{"gloopblocks:evil_stick"},
			{"gloopblocks:evil_stick"},
		}
	})

	minetest.register_craft({
		output = "gloopblocks:sword_evil",
		recipe = {
			{"gloopblocks:evil_block"},
			{"gloopblocks:evil_block"},
			{"gloopblocks:evil_stick"},
		}
	})
end

minetest.register_craft({
	output = "gloopblocks:scaffolding 12",
		recipe = {
		{"group:stick", "group:wood", "group:stick"},
		{"", "group:stick", ""},
		{"group:stick", "group:wood", "group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:pick_cement",
	recipe = {
		{"gloopblocks:cement", "gloopblocks:cement", "gloopblocks:cement"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "gloopblocks:axe_cement",
	recipe = {
		{"gloopblocks:cement", "gloopblocks:cement"},
		{"gloopblocks:cement", "group:stick"},
		{"", "group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:axe_cement",
	recipe = {
		{"gloopblocks:cement", "gloopblocks:cement"},
		{"group:stick", "gloopblocks:cement"},
		{"group:stick", ""},
	}
})

minetest.register_craft({
	output = "gloopblocks:shovel_cement",
	recipe = {
		{"gloopblocks:cement"},
		{"group:stick"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:sword_cement",
	recipe = {
		{"gloopblocks:cement"},
		{"gloopblocks:cement"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "gloopblocks:pavement 5",
	recipe = {
		{"gloopblocks:basalt",    "gloopblocks:wet_cement","gloopblocks:basalt"},
		{"gloopblocks:wet_cement","gloopblocks:basalt",    "gloopblocks:wet_cement"},
		{"gloopblocks:basalt",    "gloopblocks:wet_cement","gloopblocks:basalt"},
	}
})

minetest.register_craft({
	output = "gloopblocks:pavement 5",
	recipe = {
		{"gloopblocks:wet_cement","gloopblocks:basalt",    "gloopblocks:wet_cement"},
		{"gloopblocks:basalt",    "gloopblocks:wet_cement","gloopblocks:basalt"},
		{"gloopblocks:wet_cement","gloopblocks:basalt",    "gloopblocks:wet_cement"},
	}
})

minetest.register_craft({
	output = "gloopblocks:oerkki_block 2",
	recipe = {
		{"default:iron_lump", "default:coal_lump", "default:iron_lump"},
		{"default:coal_lump", "default:bookshelf", "default:coal_lump"},
		{"default:iron_lump", "default:coal_lump", "default:iron_lump"},
	},
	replacements = { { "default:bookshelf", "default:book 3" } }
})

minetest.register_craft({
	output = "gloopblocks:oerkki_block 2",
	recipe = {
		{"default:coal_lump", "default:iron_lump", "default:coal_lump"},
		{"default:iron_lump", "default:bookshelf", "default:iron_lump"},
		{"default:coal_lump", "default:iron_lump", "default:coal_lump"},
	},
	replacements = { { "default:bookshelf", "default:book 3" } }
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_brick_mossy 2",
	recipe = {
		"default:stonebrick",
		"default:stonebrick",
		"default:junglegrass",
		"default:junglegrass"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_brick_mossy 2",
	recipe = {
		"default:stonebrick",
		"default:stonebrick",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1"
	}
})

minetest.register_craft({
	type = "cooking",
	output = "gloopblocks:stonebrick",
	recipe = "default:stone_brick_mossy",
	cooktime = 6
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:cobble_road 5",
	recipe = {
		"default:cobble",
		"default:cobble",
		"default:cobble",
		"default:cobble",
		"gloopblocks:pavement"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:cobble_road_mossy 2",
	recipe = {
		"gloopblocks:cobble_road",
		"gloopblocks:cobble_road",
		"default:junglegrass",
		"default:junglegrass"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:cobble_road_mossy 2",
	recipe = {
		"gloopblocks:cobble_road",
		"gloopblocks:cobble_road",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_mossy 2",
	recipe = {
		"default:stone",
		"default:stone",
		"default:junglegrass",
		"default:junglegrass"
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "gloopblocks:stone_mossy 2",
	recipe = {
		"default:stone",
		"default:stone",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1",
		"default:grass_1"
	}
})

minetest.register_craft({
	output = "gloopblocks:fence_steel 1",
	recipe = {
		{"xpanes:bar", "xpanes:bar", "xpanes:bar"},
		{"xpanes:bar", "xpanes:bar", "xpanes:bar"},
	},
})

if minetest.get_modpath("technic") then
	technic.register_grinder_recipe({input={"gloopblocks:pumice"},output="default:sand"})
	technic.register_grinder_recipe({input={"gloopblocks:basalt"},output="default:cobble"})
	minetest.register_craft({
		type = "shapeless",
		output = "technic:concrete 3",
		recipe = {
			"gloopblocks:wet_cement",
			"group:sand",
			"default:gravel",
		}
	})
end

--
-- Naturally spawning blocks
--
minetest.register_craft({
	output = "darkage:chalk",
	recipe = {
		{"darkage:chalk_powder","darkage:chalk_powder"},
		{"darkage:chalk_powder","darkage:chalk_powder"},
	}
})

minetest.register_craft({
	output = "darkage:mud",
	recipe = {
		{"darkage:mud_lump","darkage:mud_lump"},
		{"darkage:mud_lump","darkage:mud_lump"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:shale",
	recipe = "darkage:mud",
})

minetest.register_craft({
	output = "darkage:silt 3",
	recipe = {
		{"default:sand","default:sand"},
		{"default:clay_lump","default:clay_lump"},
	}
})

minetest.register_craft({
	output = "darkage:silt",
	recipe = {
		{"darkage:silt_lump","darkage:silt_lump"},
		{"darkage:silt_lump","darkage:silt_lump"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:gneiss",
	recipe = "darkage:schist",
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:slate",
	recipe = "darkage:shale",
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:mud 5",
	recipe = "darkage:silt",
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:slate",
	recipe = "darkage:slate_cobble",
})

minetest.register_craft({
	output = "darkage:ors 4",
	recipe = {
		{"default:sandstone","default:sandstone"},
		{"default:iron_lump","default:sandstone"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:ors",
	recipe = "darkage:ors_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:gneiss",
	recipe = "darkage:gneiss_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:basalt",
	recipe = "darkage:basalt_cobble",
})

--
-- Cobble
--

--
-- Other Blocks
--

minetest.register_craft({
	output = "darkage:straw 2",
	recipe = {
	{"default:dry_shrub","default:dry_shrub"},
		{"default:dry_shrub","default:dry_shrub"},
	}
})

minetest.register_craft({
	output = "darkage:straw 2",
	recipe = {
		{"darkage:dry_leaves","darkage:dry_leaves"},
		{"darkage:dry_leaves","darkage:dry_leaves"},
	}
})

minetest.register_craft({
	output = "darkage:straw_bale",
	recipe = {
		{"darkage:straw","darkage:straw"},
		{"darkage:straw","darkage:straw"},
	}
})

minetest.register_craft({
	output = "darkage:slate_tile 4",
	recipe = {
		{"darkage:slate","darkage:slate"},
		{"darkage:slate","darkage:slate"},
		{"darkage:adobe","darkage:adobe"},
	}
})

minetest.register_craft({
	output = "darkage:marble_tile 4",
	recipe = {
		{"darkage:marble","darkage:marble"},
		{"darkage:marble","darkage:marble"},
		{"darkage:adobe","darkage:adobe"},
	}
})

minetest.register_craft({
	output = "darkage:stone_brick 9",
	recipe = {
		{"default:cobble","default:cobble","default:cobble"},
		{"default:cobble","default:cobble","default:cobble"},
		{"default:cobble","default:cobble","default:cobble"},
	}
})

minetest.register_craft({
	output = "darkage:reinforced_chalk",
	recipe = {
		{"group:stick","","group:stick"},
		{"","darkage:chalk",""},
		{"group:stick","","group:stick"},
	}
})

minetest.register_craft({
	output = "darkage:adobe 4",
	recipe = {
		{"default:sand","default:sand"},
		{"default:clay_lump","darkage:straw"},
	}
})

minetest.register_craft({
	output = "darkage:lamp",
	recipe = {
		{"group:stick","","group:stick"},
		{"","default:torch",""},
		{"group:stick","","group:stick"},
	}
})

minetest.register_craft({
	output = "darkage:cobble_with_plaster 2",
	recipe = {
		{"default:cobble","darkage:chalk_powder"},
		{"default:cobble","darkage:chalk_powder"},
	}
})

minetest.register_craft({
	output = "darkage:cobble_with_plaster 2",
	recipe = {
		{"darkage:chalk_powder","default:cobble"},
		{"darkage:chalk_powder","default:cobble"},
	}
})

minetest.register_craft({
	output = "darkage:darkdirt 4",
	recipe = {
		{"default:dirt","default:dirt"},
		{"default:gravel","default:gravel"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "darkage:dry_leaves",
	recipe = "default:leaves",
})

--
-- Storage blocks (boxes, shelves, ect.)
--

minetest.register_craft({
	output = "darkage:box",
	recipe = {
		{"default:wood","","default:wood"},
		{"","",""},
		{"default:wood","","default:wood"},
	}
})

minetest.register_craft({
	output = "darkage:wood_shelves 2",
	recipe = {
		{"darkage:box"},
		{"darkage:box"},
	}
})

--
-- Glass / Glow Glass
--

minetest.register_craft({
	output = "darkage:glass",
		recipe = {
		{"darkage:glow_glass"},
	}
})

minetest.register_craft({
	output = "darkage:glass 8",
	recipe = {
		{"default:glass", "default:steel_ingot", "default:glass"},
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"default:glass", "default:steel_ingot", "default:glass"},
	}
})

minetest.register_craft({
	output = "darkage:glow_glass",
	recipe = {
		{"darkage:glass"},
		{"default:torch"},
	}
})

--
-- Reinforced Wood
--

minetest.register_craft({
	output = "darkage:reinforced_wood",
	recipe = {
		{"group:stick","","group:stick"},
		{"","default:wood",""},
		{"group:stick","","group:stick"},
	}
})

minetest.register_craft({
	output = "darkage:reinforced_wood_left",
	recipe = {
		{"default:stick","darkage:reinforced_wood",""},
	}
})

minetest.register_craft({
	output = "darkage:reinforced_wood_right",
	recipe = {
		{"","darkage:reinforced_wood","default:stick"},
	}
})

--
-- Wood based decoration items
--
minetest.register_craft({
	output = "darkage:wood_bars 2",
	recipe = {
		{"default:stick","","default:stick"},
		{"default:stick","","default:stick"},
		{"default:stick","","default:stick"},
	}
})

minetest.register_craft({
	output = "darkage:wood_grille 2",
	recipe = {
		{"","darkage:wood_bars",""},
		{"darkage:wood_bars","","darkage:wood_bars"},
		{"","darkage:wood_bars",""},
	}
})

minetest.register_craft({
	output = "darkage:wood_frame",
	recipe = {
		{"group:stick","","group:stick"},
		{"","group:wood",""},
		{"group:stick","","group:stick"},
	}
})

--
-- Metal based decoration items
--

minetest.register_craft({
	output = "darkage:chain 2",
	recipe = {
		{"darkage:iron_stick"},
		{"darkage:iron_stick"},
		{"darkage:iron_stick"},
	}
})

minetest.register_craft({
	output = "darkage:iron_bars 2",
	recipe = {
		{"darkage:iron_stick","","darkage:iron_stick"},
		{"darkage:iron_stick","","darkage:iron_stick"},
		{"darkage:iron_stick","","darkage:iron_stick"},
	}
})

minetest.register_craft({
	output = "darkage:iron_grille 2",
	recipe = {
		{"","darkage:iron_bars",""},
		{"darkage:iron_bars","","darkage:iron_bars"},
		{"","darkage:iron_bars",""},
	}
})

--
-- Craft items
--

minetest.register_craft({
	output = "darkage:chalk_powder 4",
	recipe = {
		{"darkage:chalk"},
	}
})

minetest.register_craft({
	output = "darkage:mud_lump 4",
	recipe = {
		{"darkage:mud"},
	}
})

minetest.register_craft({
	output = "darkage:silt_lump 4",
		recipe = {
		{"darkage:silt"},
	}
})

minetest.register_craft({
	output = "darkage:iron_stick 3",
	recipe = {
		{"default:steel_ingot"},
		{"default:steel_ingot"},
		{"default:steel_ingot"},
	}
})
