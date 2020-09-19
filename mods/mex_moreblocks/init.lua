minetest.register_node("mex_moreblocks:adobe", {
    description = "Adobe",
    tiles = {"mex_moreblocks_adobe.png"},
    groups = {crumbly=3},
    sounds = default.node_sound_sand_defaults(),
})

minetest.register_craft({
    output = "mex_moreblocks:adobe 4",
    recipe = {
        {"default:sand","default:sand"},
        {"default:clay_lump","farming:straw"},
    }
})

minetest.register_node("mex_moreblocks:basalt_cobble", {
    description = "Basalt Cobble",
    tiles = {"mex_moreblocks_basalt_cobble.png"},
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("basalt_cobble", "mex_moreblocks:basalt_cobble",
    {cracky=3},
    {"mex_moreblocks_basalt_cobble.png"},
    "Basalt Cobble Stair",
    "Basalt Cobble Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:basalt", {
    description = "Basalt",
    tiles = {"mex_moreblocks_basalt.png"},
    is_ground_content = true,
    drop = "mex_moreblocks:basalt_cobble",
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("basalt", "mex_moreblocks:basalt",
    {cracky=2},
    {"mex_moreblocks_basalt.png"},
    "Basalt Stair",
    "Basalt Slab",
    default.node_sound_stone_defaults()
)

minetest.register_craft({
    type = "cooking",
    output = "mex_moreblocks:basalt",
    recipe = "mex_moreblocks:basalt_cobble",
})

minetest.register_node("mex_moreblocks:basalt_brick", {
    description = "Basalt Brick",
    tiles = {"mex_moreblocks_basalt_brick.png"},
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults()
})


minetest.register_craft({
    output = "mex_moreblocks:basalt_brick 4",
    recipe = {
        {"mex_moreblocks:basalt","mex_moreblocks:basalt"},
        {"mex_moreblocks:basalt","mex_moreblocks:basalt"},
    }
})

stairs.register_stair_and_slab("basalt_brick", "mex_moreblocks:basalt_brick",
    {cracky=3},
    {"mex_moreblocks_basalt_brick.png"},
    "Basalt Brick Stair",
    "Basalt Brick Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:box", {
    description = "Box",
    tiles = { "mex_moreblocks_box_top.png","mex_moreblocks_box_top.png","mex_moreblocks_box.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    walkable = true,
    groups = { snappy = 3 },
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
            "size[8,9]" ..
            "list[current_name;main;0,0.3;8,4;]" ..
            "list[current_player;main;0,4.85;8,1;]" ..
            "list[current_player;main;0,6.08;8,3;8]" ..
            "listring[current_name;main]" ..
            "listring[current_player;main]" ..
            default.get_hotbar_bg(0,4.85)
        )
        meta:set_string("infotext", "Box")
        local inv = meta:get_inventory()
        inv:set_size("main", 32)
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



minetest.register_craftitem("mex_moreblocks:chalk_powder", {
	description = "Chalk Powder",
	inventory_image = "mex_moreblocks_chalk_powder.png",
})

minetest.register_node("mex_moreblocks:chalk", {
    description = "Chalk",
    tiles = {"mex_moreblocks_chalk.png"},
    is_ground_content = true,
    drop = "mex_moreblocks:chalk_powder 4",
    groups = {crumbly=2,cracky=2},
    sounds = default.node_sound_stone_defaults()
})

minetest.register_craft({
    output = "mex_moreblocks:chalk_powder 4",
    recipe = {
        {"mex_moreblocks:chalk"},
    }
})

minetest.register_craft({
    output = "mex_moreblocks:chalk",
    recipe = {
        {"mex_moreblocks:chalk_powder","mex_moreblocks:chalk_powder"},
        {"mex_moreblocks:chalk_powder","mex_moreblocks:chalk_powder"},
    }
})

stairs.register_stair_and_slab("chalk", "mex_moreblocks:chalk",
    {crumbly=2,cracky=2},
    {"mex_moreblocks_chalk.png"},
    "Chalk Stair",
    "Chalk Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:marble", {
    description = "Marble",
    tiles = {"mex_moreblocks_marble.png"},
    is_ground_content = true,
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("marble", "mex_moreblocks:marble",
    {cracky=3},
    {"mex_moreblocks_marble.png"},
    "Marble Stair",
    "Marble Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:marble_tile", {
    description = "Marble Tile",
    tiles = {"mex_moreblocks_marble_tile.png"},
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults()
})

minetest.register_craft({
    output = "mex_moreblocks:marble_tile 4",
    recipe = {
        {"mex_moreblocks:marble","mex_moreblocks:marble"},
        {"mex_moreblocks:marble","mex_moreblocks:marble"}
    }
})

stairs.register_stair_and_slab("marble_tile", "mex_moreblocks:marble_tile",
    {cracky=2},
    {"mex_moreblocks_marble_tile.png"},
    "Marble Tile Stair",
    "Marble Tile Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:lamp", {
    description = "Lamp",
    tiles = {"mex_moreblocks_lamp.png"},
    paramtype = "light",
    light_source = 14,
    groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,flammable=1},
    sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
    output = "mex_moreblocks:lamp",
    recipe = {
        {"group:stick","default:glass","group:stick"},
        {"default:glass","default:torch","default:glass"},
        {"group:stick","default:glass","group:stick"},
    }
})

minetest.register_node("mex_moreblocks:lantern_f", {
  description = "Lantern",
  drawtype = "mesh",
  mesh = "mex_moreblocks_lantern_f.obj",
  tiles = {"mex_moreblocks_lantern.png", "mex_moreblocks_metal_dark_32.png"},
  collision_box = {
    type = "fixed",
    fixed = {-3/16, -1/2, -3/16, 3/16, 1/16, 3/16}
  },
  selection_box = {
    type = "fixed",
    fixed = {-3/16, -1/2, -3/16, 3/16, 1/16, 3/16}
  },
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),

  on_place = function(itemstack, placer, pointed_thing)
		local wdir = minetest.dir_to_wallmounted(
      vector.subtract(pointed_thing.under, pointed_thing.above))
		local fakestack = itemstack

		if wdir == 0 then
			fakestack:set_name("mex_moreblocks:lantern_c")
		elseif wdir == 1 then
			fakestack:set_name("mex_moreblocks:lantern_f")
		else
			fakestack:set_name("mex_moreblocks:lantern_w")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("mex_moreblocks:lantern_f")

		return itemstack
	end,
})

minetest.register_node("mex_moreblocks:lantern_c", {
  drawtype = "mesh",
  mesh = "mex_moreblocks_lantern_c.obj",
  tiles = {"mex_moreblocks_lantern.png", "mex_moreblocks_metal_dark_32.png"},
  collision_box = {
    type = "fixed",
    fixed = {-3/16, -1/16, -3/16, 3/16, 1/2, 3/16}
  },
  selection_box = {
    type = "fixed",
    fixed = {-3/16, 0, -3/16, 3/16, 1/2, 3/16}
  },
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3,
    not_in_creative_inventory = 1},
  sounds = default.node_sound_glass_defaults(),
  drop = "mex_moreblocks:lantern_f",
})

minetest.register_node("mex_moreblocks:lantern_w", {
  drawtype = "mesh",
  mesh = "mex_moreblocks_lantern_w.obj",
  tiles = {"mex_moreblocks_lantern.png", "mex_moreblocks_metal_dark_32.png"},
  collision_box = {
    type = "fixed",
    fixed = {-3/16, -1/4, -5/16, 3/16, 1/8, 3/16}
  },
  selection_box = {
    type = "wallmounted",
    wall_bottom = {-3/16, -1/4, -5/16, 3/16, 1/8, 3/16},
    wall_side = {-1/4, -5/16, -3/16, 1/8, 3/16, 3/16},
    wall_top = {-3/16, -1/8, -5/16, 3/16, 1/4, 3/16}
  },
  paramtype = "light",
  paramtype2 = "wallmounted",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3,
    not_in_creative_inventory = 1},
  sounds = default.node_sound_glass_defaults(),
  drop = "mex_moreblocks:lantern_f",
})

minetest.register_craft({
  output = "mex_moreblocks:lantern_f",
  recipe = {
    {"", "default:steel_ingot", ""},
    {"xpanes:pane_flat", "default:torch", "xpanes:pane_flat"},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_node("mex_moreblocks:serpentine", {
    description = "Serpentine",
    tiles = {"mex_moreblocks_serpentine.png"},
    is_ground_content = true,
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("serpentine", "mex_moreblocks:serpentine",
    {cracky=3},
    {"mex_moreblocks_serpentine.png"},
    "Serpentine Stair",
    "Serpentine Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:shale", {
    description = "Shale",
    tiles = {"mex_moreblocks_shale.png","mex_moreblocks_shale.png","mex_moreblocks_shale_side.png"},
    is_ground_content = true,
    groups = {crumbly=2,cracky=2},
    sounds = default.node_sound_stone_defaults()
})

minetest.register_craftitem("mex_moreblocks:silt_lump", {
	description = "Silt Lump",
	inventory_image = "mex_moreblocks_silt_lump.png",
})

minetest.register_node("mex_moreblocks:silt", {
    description = "Silt",
    tiles = {"mex_moreblocks_silt.png"},
    is_ground_content = true,
    groups = {crumbly=3},
    drop = "mex_moreblocks:silt_lump 4",
    sounds = default.node_sound_dirt_defaults({
        footstep = "",
    }),
})

minetest.register_craft({
    output = "mex_moreblocks:silt 3",
    recipe = {
        {"default:sand","default:sand"},
        {"default:clay_lump","default:clay_lump"},
    }
})

minetest.register_craft({
    output = "mex_moreblocks:silt",
    recipe = {
        {"mex_moreblocks:silt_lump","mex_moreblocks:silt_lump"},
        {"mex_moreblocks:silt_lump","mex_moreblocks:silt_lump"},
    }
})

minetest.register_craft({
    output = "mex_moreblocks:silt_lump 4",
        recipe = {
        {"mex_moreblocks:silt"},
    }
})

minetest.register_node("mex_moreblocks:slate_cobble", {
    description = "Slate Cobble",
    tiles = {"mex_moreblocks_slate_cobble.png"},
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("slate_cobble", "mex_moreblocks:slate_cobble",
    {cracky=2},
    {"mex_moreblocks_slate_cobble.png"},
    "Slate Cobble Stair",
    "Slate Cobble Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:slate", {
    description = "Slate",
    tiles = {"mex_moreblocks_slate.png","mex_moreblocks_slate.png","mex_moreblocks_slate_side.png"},
    is_ground_content = true,
    drop = "mex_moreblocks:slate_cobble",
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults()
})

minetest.register_craft({
    type = "cooking",
    output = "mex_moreblocks:slate",
    recipe = "mex_moreblocks:shale",
})

minetest.register_craft({
    type = "cooking",
    output = "mex_moreblocks:slate",
    recipe = "mex_moreblocks:slate_cobble",
})

stairs.register_stair_and_slab("slate", "mex_moreblocks:slate",
    {cracky=2},
    {"mex_moreblocks_slate.png"},
    "Slate Stair",
    "Slate Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:slate_brick", {
    description = "Slate Brick",
    tiles = {"mex_moreblocks_slate_brick.png"},
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults()
})

stairs.register_stair_and_slab("slate_brick", "mex_moreblocks:slate_brick",
    {cracky=2},
    {"mex_moreblocks_slate_brick.png"},
    "Slate Brick Stair",
    "Slate Brick Slab",
    default.node_sound_stone_defaults()
)

minetest.register_node("mex_moreblocks:slate_tile", {
    description = "Slate Tile",
    tiles = {"mex_moreblocks_slate_tile.png"},
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults()
})

minetest.register_craft({
    output = "mex_moreblocks:slate_tile 4",
    recipe = {
        {"mex_moreblocks:slate","mex_moreblocks:slate"},
        {"mex_moreblocks:slate","mex_moreblocks:slate"},
    }
})

stairs.register_stair_and_slab("slate_tile", "mex_moreblocks:slate_tile",
    {cracky=2},
    {"mex_moreblocks_slate_tile.png"},
    "Slate Tile Stair",
    "Slate Tile Slab",
    default.node_sound_stone_defaults()
)




















--
-- minetest.register_node("mex_moreblocks:wood_shelves", {
--     description = "Wooden Shelves",
--     tiles = { "mex_moreblocks_shelves.png","mex_moreblocks_shelves.png","mex_moreblocks_shelves.png",
--             "mex_moreblocks_shelves.png","mex_moreblocks_shelves.png","mex_moreblocks_shelves_front.png"},
--     paramtype = "light",
--     paramtype2 = "facedir",
--     walkable = true,
--     groups = {snappy = 3},
--     sounds = default.node_sound_wood_defaults(),
--     on_construct = function(pos)
--         local meta = minetest.get_meta(pos)
--         meta:set_string("formspec",
--                 "size[8,10]"..
--                 "list[context;up;0,0;8,3;]"..
--                 "list[context;down;0,3;8,3;]"..
--                 "list[current_player;main;0,6;8,4;]")
--         meta:set_string("infotext", "Wooden Shelves")
--         local inv = meta:get_inventory()
--         inv:set_size("up", 16)
--         inv:set_size("down", 16)
--     end,
--     can_dig = function(pos,player)
--         local meta = minetest.get_meta(pos);
--         local inv = meta:get_inventory()
--         return inv:is_empty("shape") and inv:is_empty("out") and inv:is_empty("water")
--     end,
--     on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
--         minetest.log("action", player:get_player_name()..
--                 " moves stuff in shelves at "..minetest.pos_to_string(pos))
--     end,
--     on_metadata_inventory_put = function(pos, listname, index, stack, player)
--         minetest.log("action", player:get_player_name()..
--                 " moves stuff to shelves at "..minetest.pos_to_string(pos))
--     end,
--     on_metadata_inventory_take = function(pos, listname, index, stack, player)
--         minetest.log("action", player:get_player_name()..
--                 " takes stuff from shelves at "..minetest.pos_to_string(pos))
--     end,
-- })
--
-- --
-- -- Glass / Glow Glass
-- --
--
-- minetest.register_node("mex_moreblocks:glass", {
--     description = "Medieval Glass",
--     drawtype = "glasslike",
--     tiles = {"mex_moreblocks_glass.png"},
--     paramtype = "light",
--     sunlight_propagates = true,
--     groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
--     sounds = default.node_sound_glass_defaults(),
-- })
--
-- minetest.register_node("mex_moreblocks:glow_glass", {
--     description = "Medieval Glow Glass",
--     drawtype = "glasslike",
--     tiles = {"mex_moreblocks_glass.png"},
--     paramtype = "light",
--     light_source = 14,
--     sunlight_propagates = true,
--     groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
--     sounds = default.node_sound_glass_defaults(),
-- })
--
-- --
-- -- Reinforced Wood
-- --
--
-- minetest.register_node("mex_moreblocks:reinforced_wood", {
--     description = "Reinforced Wood",
--     tiles = {"default_wood.png^mex_moreblocks_reinforce.png"},
--     groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
--     sounds = default.node_sound_wood_defaults()
-- })
--
-- minetest.register_node("mex_moreblocks:reinforced_wood_left", {
--     description = "Reinforced Wood Left",
--     tiles = {"mex_moreblocks_reinforced_wood_left.png"},
--     groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
--     sounds = default.node_sound_wood_defaults()
-- })
--
-- minetest.register_node("mex_moreblocks:reinforced_wood_right", {
--     description = "Reinforced Wood Right",
--     tiles = {"mex_moreblocks_reinforced_wood_right.png"},
--     groups = {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
--     sounds = default.node_sound_wood_defaults()
-- })
--
-- --
-- -- Wood based decoration items
-- --
--
-- minetest.register_node("mex_moreblocks:wood_bars", {
--     description = "Wooden Bars",
--     drawtype = "glasslike",
--     tiles = {"mex_moreblocks_wood_bars.png"},
--     inventory_image = "mex_moreblocks_wood_bars.png",
--     wield_image = "mex_moreblocks_wood_bars.png",
--     paramtype = "light",
--     sunlight_propagates = true,
--     groups = {snappy=1,choppy=2},
--     sounds = default.node_sound_stone_defaults()
-- })
--
-- minetest.register_node("mex_moreblocks:wood_grille", {
--     description = "Wooden Grille",
--     drawtype = "glasslike",
--     tiles = {"mex_moreblocks_wood_grille.png"},
--     inventory_image = "mex_moreblocks_wood_grille.png",
--     wield_image = "mex_moreblocks_wood_grille.png",
--     paramtype = "light",
--     sunlight_propagates = true,
--     groups = {snappy=1,choppy=2},
--     sounds = default.node_sound_stone_defaults()
-- })
--
-- minetest.register_node("mex_moreblocks:wood_frame", {
--     description = "Wooden Frame",
--     drawtype = "glasslike",
--     tiles = {"mex_moreblocks_wood_frame.png"},
--     inventory_image = "mex_moreblocks_wood_frame.png",
--     wield_image = "mex_moreblocks_wood_frame.png",
--     paramtype = "light",
--     sunlight_propagates = true,
--     groups = {snappy=1,choppy=2},
--     sounds = default.node_sound_stone_defaults()
-- })
--
-- --
-- -- Metal based decoration items
-- --
--
-- minetest.register_node("mex_moreblocks:chain", {
--     description = "Chain",
--     drawtype = "signlike",
--     tiles = {"mex_moreblocks_chain.png"},
--     inventory_image = "mex_moreblocks_chain.png",
--     wield_image = "mex_moreblocks_chain.png",
--     paramtype = "light",
--     paramtype2 = "wallmounted",
--     walkable = false,
--     climbable = true,
--     selection_box = {
--         type = "wallmounted",
--     },
--     groups = {snappy=1,cracky=2,oddly_breakable_by_hand=2},
--     legacy_wallmounted = true
-- })
--
-- minetest.register_node("mex_moreblocks:iron_bars", {
--     description = "Iron Bars",
--     drawtype = "glasslike",
--     tiles = {"mex_moreblocks_iron_bars.png"},
--     inventory_image = "mex_moreblocks_iron_bars.png",
--     wield_image = "mex_moreblocks_iron_bars.png",
--     paramtype = "light",
--     sunlight_propagates = true,
--     groups = {cracky=3},
--     sounds = default.node_sound_stone_defaults()
-- })
--
-- minetest.register_node("mex_moreblocks:iron_grille", {
--     description = "Iron Grille",
--     drawtype = "glasslike",
--     tiles = {"mex_moreblocks_iron_grille.png"},
--     inventory_image = "mex_moreblocks_iron_grille.png",
--     wield_image = "mex_moreblocks_iron_grille.png",
--     paramtype = "light",
--     sunlight_propagates = true,
--     groups = {cracky=3},
--     sounds = default.node_sound_stone_defaults()
-- })
--
--
--
--
--
--
--
--
-- --[[
-- mex_moreblocks
-- Originally written by GloopMaster
--
-- Maintained by VanessaE.
--
-- --]]
--
-- mex_moreblocks = {}
--
-- -- Load support for intllib.
-- local MP = minetest.get_modpath(minetest.get_current_modname())
-- local S, NS = dofile(MP.."/intllib.lua")
--
-- -- Nodes
--
-- minetest.register_node("mex_moreblocks:rainbow_block_diagonal", {
--     description = S("Diagonal Rainbow Block"),
--     tiles = {"mex_moreblocks_rainbow_block.png"},
--     is_ground_content = true,
--     groups = {cracky=3},
--     sounds = default.node_sound_defaults(),
-- })
-- minetest.register_alias("mex_moreblocks:rainbow_block", "mex_moreblocks:rainbow_block_diagonal")
--
-- minetest.register_node("mex_moreblocks:rainbow_block_horizontal", {
--     description = S("Horizontal Rainbow Block"),
--     tiles = {
--         "mex_moreblocks_rainbow_horizontal.png^[transformR90",
--         "mex_moreblocks_rainbow_horizontal.png^[transformR90",
--         "mex_moreblocks_rainbow_horizontal.png"
--     },
--     paramtype = "light",
--     light_source = default.LIGHT_MAX,
--     paramtype2 = "facedir",
--     groups = {cracky = 2},
--     is_ground_content = false,
--     sounds = default.node_sound_defaults(),
-- })
--
-- minetest.register_node("mex_moreblocks:evil_block", {
--     description = S("Evil Block"),
--     tiles = {"mex_moreblocks_evil_block.png"},
--     light_source = 5,
--     is_ground_content = true,
--     groups = {cracky=2},
--     sounds = default.node_sound_stone_defaults(),
-- })

-- minetest.register_node("mex_moreblocks:pumice", {
--     description = S("Pumice"),
--     tiles = {"mex_moreblocks_pumice.png"},
--     groups = {cracky=3},
--     sounds = default.node_sound_stone_defaults(),
-- })
--
--
-- minetest.register_node("mex_moreblocks:pavement", {
--     description = S("Pavement"),
--     tiles = {"mex_moreblocks_pavement.png"},
--     groups = {cracky=3, oddly_breakable_by_hand=3},
--     sounds = default.node_sound_stone_defaults(),
-- })
--
-- minetest.register_node("mex_moreblocks:oerkki_block", {
--     drawtype = "nodebox",
--     description = S("Oerkki Block"),
--     paramtype = "light",
--     paramtype2 = "facedir",
--     tiles = {
--         "mex_moreblocks_oerkkiblock_tb.png",
--         "mex_moreblocks_oerkkiblock_tb.png",
--         "mex_moreblocks_oerkkiblock_sides.png",
--         "mex_moreblocks_oerkkiblock_sides.png",
--         "mex_moreblocks_oerkkiblock_sides.png",
--         "mex_moreblocks_oerkkiblock_front.png"
--     },
--     groups = {cracky=3, oddly_breakable_by_hand=3},
--     sounds = default.node_sound_stone_defaults(),
--     selection_box = {
--         type = "fixed",
--         fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
--     },
--     node_box = {
--         type = "fixed",
--         fixed = {
--             {-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875}, -- NodeBox1
--             {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox2
--             {0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
--             {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox4
--             {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox5
--             {-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox6
--         }
--     }
-- })
--
-- minetest.register_node("mex_moreblocks:stone_brick_mossy", {
--     description = S("Mossy Stone Brick"),
--     tiles = {"mex_moreblocks_stone_brick_mossy.png"},
--     groups = {cracky=3, stone=1},
--     sounds = default.node_sound_stone_defaults(),
-- })
--
-- minetest.register_node("mex_moreblocks:stone_mossy", {
--     description = S("Mossy Stone"),
--     tiles = {"mex_moreblocks_stone_mossy.png"},
--     groups = {cracky=3, stone=1},
--     sounds = default.node_sound_stone_defaults(),
--     drop = "default:mossycobble"
-- })
--
-- minetest.register_node("mex_moreblocks:cobble_road", {
--     description = S("Cobblestone Road Bed"),
--     tiles = {"mex_moreblocks_cobble_road.png"},
--     groups = {cracky=3, stone=1},
--     sounds = default.node_sound_stone_defaults(),
-- })
--
-- minetest.register_node("mex_moreblocks:cobble_road_mossy", {
--     description = S("Mossy Cobblestone Road Bed"),
--     tiles = {"mex_moreblocks_cobble_road_mossy.png"},
--     groups = {cracky=3, stone=1},
--     sounds = default.node_sound_stone_defaults(),
-- })
--
-- minetest.register_node("mex_moreblocks:scaffolding", {
--     description = S("Wooden Scaffold"),
--     drawtype = "allfaces",
--     paramtype = "light",
--     sunlight_propagates = true,
--     tiles = {"mex_moreblocks_scaffold.png"},
--     groups = {choppy=3, oddly_breakable_by_hand=3},
--     sounds = default.node_sound_wood_defaults(),
-- })
--
-- minetest.register_alias("moreblocks:oerkkiblock", "mex_moreblocks:oerkki_block")
-- minetest.register_alias("mex_moreblocks:obsidian", "default:obsidian")
--
-- -- Nodes imported from Usesdirt ================================================================================
--
-- if not minetest.get_modpath("usesdirt") then
--
--     local dirt_brick_tex  = "default_dirt.png^mex_moreblocks_dirt_brick_overlay.png"
--     local dirt_cobble_tex = "default_cobble.png^(default_dirt.png^[mask:mex_moreblocks_dirt_cobble_mask.png)"
--     local dirt_stone_tex  = "default_stone.png^(default_dirt.png^[mask:mex_moreblocks_dirt_stone_mask.png)"
--
--     local dirt_ladder_tex = "(default_dirt.png^[mask:mex_moreblocks_ladder_mask.png)^mex_moreblocks_ladder_overlay.png"
--     local dirt_brick_ladder_tex = "(("..dirt_brick_tex..")^[mask:mex_moreblocks_ladder_mask.png)^mex_moreblocks_ladder_overlay.png"
--     local dirt_cobble_ladder_tex = "(("..dirt_cobble_tex..")^[mask:mex_moreblocks_ladder_mask.png)^mex_moreblocks_ladder_overlay.png"
--     local dirt_stone_ladder_tex = "(("..dirt_stone_tex..")^[mask:mex_moreblocks_ladder_mask.png)^mex_moreblocks_ladder_overlay.png"
--
--     minetest.register_node(":usesdirt:dirt_brick", {
--         tiles = { dirt_brick_tex },
--         description = "Dirt Brick",
--         groups = {snappy=2,choppy=1,oddly_breakable_by_hand=2},
--     })
--
--     minetest.register_node(":usesdirt:dirt_brick_ladder", {
--         description = "Dirt Brick Ladder",
--         drawtype = "signlike",
--         tiles = { dirt_brick_ladder_tex },
--         inventory_image = dirt_brick_ladder_tex,
--         wield_image     = dirt_brick_ladder_tex,
--         paramtype = "light",
--         paramtype2 = "wallmounted",
--         is_ground_content = true,
--         walkable = false,
--         climbable = true,
--         selection_box = {
--             type = "wallmounted",
--             --wall_top = = <default>
--             --wall_bottom = = <default>
--             --wall_side = = <default>
--         },
--         groups = {cracky=3, stone=2},
--         legacy_wallmounted = true,
--     })
--     minetest.register_craft({
--         output = 'usesdirt:dirt_brick_ladder 3',
--         recipe = {
--             {'usesdirt:dirt_brick', '', 'usesdirt:dirt_brick'},
--             {'usesdirt:dirt_brick', 'usesdirt:dirt_brick','usesdirt:dirt_brick'},
--             {'usesdirt:dirt_brick','','usesdirt:dirt_brick'},
--         }
--     })
--
--     default.register_fence(":usesdirt:dirt_brick_fence", {
--         description = "Dirt Brick Fence",
--         texture = dirt_brick_tex,
--         inventory_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
--         wield_image = "default_fence_overlay.png^("..dirt_brick_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
--         material = "usesdirt:dirt_brick",
--         groups = {cracky=3, stone=2},
--         sounds = default.node_sound_stone_defaults(),
--         check_for_pole = true
--     })
--
--     if minetest.get_modpath("moreblocks") then
--         minetest.register_craft({
--             output = 'usesdirt:dirt_brick 24',
--             recipe = {
--                 {'moreblocks:dirt_compressed', 'moreblocks:dirt_compressed', '' },
--                 {'moreblocks:dirt_compressed', 'moreblocks:dirt_compressed', '' }
--             }
--         })
--     else
--         minetest.register_craft({
--             output = 'usesdirt:dirt_brick 6',
--             recipe = {
--                 {'default:dirt', 'default:dirt', 'default:dirt'},
--                 {'default:dirt', 'default:dirt', 'default:dirt'},
--                 {'default:dirt', 'default:dirt', 'default:dirt'},
--             }
--         })
--     end
--
--     minetest.register_node(":usesdirt:dirt_ladder", {
--         description = "Dirt Ladder",
--         drawtype = "signlike",
--         tiles = { dirt_ladder_tex },
--         inventory_image = dirt_ladder_tex,
--         wield_image     = dirt_ladder_tex,
--         paramtype = "light",
--         paramtype2 = "wallmounted",
--         is_ground_content = true,
--         walkable = false,
--         climbable = true,
--         selection_box = {
--             type = "wallmounted",
--             --wall_top = = <default>
--             --wall_bottom = = <default>
--             --wall_side = = <default>
--         },
--         groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3},
--         legacy_wallmounted = true,
--     })
--     minetest.register_craft({
--         output = 'usesdirt:dirt_ladder 3',
--         recipe = {
--             {'usesdirt:dirt_brick', '', 'usesdirt:dirt_brick'},
--             {'usesdirt:dirt_brick', 'usesdirt:dirt_brick','usesdirt:dirt_brick'},
--             {'usesdirt:dirt_brick','','usesdirt:dirt_brick'},
--         }
--     })
--
--     default.register_fence(":usesdirt:dirt_fence", {
--         description = "Dirt Fence",
--         texture = "default_dirt.png",
--         inventory_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
--         wield_image = "default_fence_overlay.png^default_dirt.png^default_fence_overlay.png^[makealpha:255,126,126",
--         material = "default:dirt",
--         groups = {snappy=2,choppy=1,oddly_breakable_by_hand=3},
--         sounds = default.node_sound_dirt_defaults(),
--         check_for_pole = true
--     })
--
-- ----
--
--     minetest.register_node(":usesdirt:dirt_cobble_stone", {
--         tiles = { dirt_cobble_tex },
--         description = "Dirt Cobble Stone",
--         is_ground_content = true,
--         groups = {cracky=3, stone=2},
--     })
--     minetest.register_craft({
--         output = '"usesdirt:dirt_cobble_stone" 3',
--         recipe = {
--             {'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
--             {'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
--             {'usesdirt:dirt_brick', 'usesdirt:dirt_brick', 'usesdirt:dirt_brick'},
--         }
--     })
--
--     minetest.register_node(":usesdirt:dirt_cobble_stone_ladder", {
--         description = "Dirt Cobble Stone Ladder",
--         drawtype = "signlike",
--         tiles = { dirt_cobble_ladder_tex },
--         inventory_image = dirt_cobble_ladder_tex,
--         wield_image     = dirt_cobble_ladder_tex,
--         paramtype = "light",
--         paramtype2 = "wallmounted",
--         is_ground_content = true,
--         walkable = false,
--         climbable = true,
--         selection_box = {
--             type = "wallmounted",
--             --wall_top = = <default>
--             --wall_bottom = = <default>
--             --wall_side = = <default>
--         },
--         groups = {cracky=3, stone=2},
--         legacy_wallmounted = true,
--     })
--     minetest.register_craft({
--         output = 'usesdirt:dirt_cobble_stone_ladder 3',
--         recipe = {
--             {'usesdirt:dirt_cobble_stone', '', 'usesdirt:dirt_cobble_stone'},
--             {'usesdirt:dirt_cobble_stone', 'usesdirt:dirt_cobble_stone','usesdirt:dirt_cobble_stone'},
--             {'usesdirt:dirt_cobble_stone','','usesdirt:dirt_cobble_stone'},
--         }
--     })
--
--     default.register_fence(":usesdirt:dirt_cobble_stone_fence", {
--         description = "Dirt Cobble Stone Fence",
--         texture = dirt_cobble_tex,
--         inventory_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
--         wield_image = "default_fence_overlay.png^("..dirt_cobble_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
--         material = "usesdirt:dirt_cobble_stone",
--         groups = {cracky=3, stone=2},
--         sounds = default.node_sound_stone_defaults(),
--         check_for_pole = true
--     })
--
-- ----
--
--     minetest.register_node(":usesdirt:dirt_stone", {
--         tiles = { dirt_stone_tex },
--         description = "Dirt Stone",
--         is_ground_content = true,
--         groups = {cracky=3, stone=2},
--     })
--
--     minetest.register_node(":usesdirt:dirt_stone_ladder", {
--         description = "Dirt Stone Ladder",
--         drawtype = "signlike",
--         tiles = { dirt_stone_ladder_tex },
--         inventory_image = dirt_stone_ladder_tex,
--         wield_image     = dirt_stone_ladder_tex,
--         paramtype = "light",
--         paramtype2 = "wallmounted",
--         is_ground_content = true,
--         walkable = false,
--         climbable = true,
--         selection_box = {
--             type = "wallmounted",
--             --wall_top = = <default>
--             --wall_bottom = = <default>
--             --wall_side = = <default>
--         },
--         groups = {cracky=3, stone=2},
--         legacy_wallmounted = true,
--     })
--     minetest.register_craft({
--         output = 'usesdirt:dirt_stone_ladder 3',
--         recipe = {
--             {'usesdirt:dirt_stone', '', 'usesdirt:dirt_stone'},
--             {'usesdirt:dirt_stone', 'usesdirt:dirt_stone','usesdirt:dirt_stone'},
--             {'usesdirt:dirt_stone','','usesdirt:dirt_stone'},
--         }
--     })
--
--     default.register_fence(":usesdirt:dirt_stone_fence", {
--         description = "Dirt Stone Fence",
--         texture = dirt_stone_tex,
--         inventory_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
--         wield_image = "default_fence_overlay.png^("..dirt_stone_tex..")^default_fence_overlay.png^[makealpha:255,126,126",
--         material = "usesdirt:dirt_stone",
--         groups = {cracky=3, stone=2},
--         sounds = default.node_sound_stone_defaults(),
--         check_for_pole = true
--     })
-- end
--
-- -- Stairs/slabs defs, conversion of normal -> mossy items
--
-- if minetest.setting_getbool("mex_moreblocks_mossy_conversion") ~= false then
--
--     function mex_moreblocks_register_mossy_conversion(mossyobjects)
--         for i in ipairs(mossyobjects) do
--             minetest.register_abm({
--                 nodenames = { mossyobjects[i][1] },
--                 neighbors = {"default:water_source", "default:water_flowing"},
--                 interval = 120,
--                 chance = 50,
--                 action = function(pos, node)
--                     if minetest.find_node_near(pos, 2, "air") then
--                         local fdir = node.param2
--                         minetest.add_node(pos, {name = mossyobjects[i][2], param2 = fdir})
--                     end
--                 end,
--             })
--         end
--     end
-- end
--

--
--
--     stairs.register_stair_and_slab("stone_mossy", "mex_moreblocks:stone_mossy",
--         {cracky=3},
--         {"mex_moreblocks_stone_mossy.png"},
--         S("Mossy Stone Stair"),
--         S("Mossy Stone Slab"),
--         default.node_sound_stone_defaults())
--
--     -- stairs:xxxx_mossycobble
--     stairs.register_stair_and_slab("mossycobble", "default:mossycobble",
--         {cracky=3},
--         {"default_mossycobble.png"},
--         S("Mossy Cobble Stair"),
--         S("Mossy Cobble Slab"),
--         default.node_sound_stone_defaults())
--
--     -- stairs:xxxx_stone_brick_mossy
--     stairs.register_stair_and_slab("stone_brick_mossy", "mex_moreblocks:stone_brick_mossy",
--         {cracky=3},
--         {"mex_moreblocks_stone_brick_mossy.png"},
--         S("Mossy Stone Brick Stair"),
--         S("Mossy Stone Brick Slab"),
--         default.node_sound_stone_defaults())
--
--     -- stairs:xxxx_cobble_road
--     stairs.register_stair_and_slab("cobble_road", "mex_moreblocks:cobble_road",
--         {cracky=3},
--         {"mex_moreblocks_cobble_road.png"},
--         S("Cobble Roadbed Stair"),
--         S("Cobble Roadbed Slab"),
--         default.node_sound_stone_defaults())
--
--     -- stairs:xxxx_cobble_road_mossy
--     stairs.register_stair_and_slab("cobble_road_mossy", "mex_moreblocks:cobble_road_mossy",
--         {cracky=3},
--         {"mex_moreblocks_cobble_road_mossy.png"},
--         S("Mossy Cobble Roadbed Stair"),
--         S("Mossy Cobble Roadbed Slab"),
--         default.node_sound_stone_defaults())
--
--     -- stairs:xxxx_cement
--     stairs.register_stair_and_slab("cement", "mex_moreblocks:cement",
--         {cracky=2},
--         {"basic_materials_cement_block.png"},
--         S("Cement Stair"),
--         S("Cement Slab"),
--         default.node_sound_stone_defaults())
--
--     -- stairs:xxxx_pavement
--     stairs.register_stair_and_slab("pavement", "mex_moreblocks:pavement",
--         {cracky=3, oddly_breakable_by_hand=3},
--         {"mex_moreblocks_pavement.png"},
--         S("Pavement Stair"),
--         S("Pavement Slab"),
--         default.node_sound_stone_defaults())
--
--
--
--     stairs.register_stair_and_slab("pumice", "mex_moreblocks:pumice",
--         {cracky=3},
--         {"mex_moreblocks_pumice.png"},
--         S("Pumice Stair"),
--         S("Pumice Slab"),
--         default.node_sound_stone_defaults())
--
--     stairs.register_stair_and_slab("rainbow_block", "mex_moreblocks:rainbow_block",
--         {cracky=3},
--         {"mex_moreblocks_rainbow_block.png"},
--         S("Rainbow Block Stair"),
--         S("Rainbow Block Slab"),
--         default.node_sound_defaults())
--
-- -- define lava-cooling-based nodes and hook into the default lavacooling
-- -- functions to generate basalt, pumice, and obsidian
--
-- if minetest.setting_getbool("mex_moreblocks_lavacooling") ~= false then
--
--     minetest.register_node("mex_moreblocks:obsidian_cooled", {
--         description = S("Obsidian"),
--         tiles = {"default_obsidian.png"},
--         is_ground_content = true,
--         sounds = default.node_sound_stone_defaults(),
--         groups = {cracky=1, level=2, not_in_creative_inventory=1},
--         drop = "default:obsidian",
--         after_place_node = function(pos, placer, itemstack, pointed_thing)
--             minetest.add_node(pos, {name = "default:obsidian"})
--         end
--     })
--
--
--     minetest.register_node("mex_moreblocks:pumice_cooled", {
--         description = S("Pumice"),
--         tiles = {"mex_moreblocks_pumice.png"},
--         groups = {cracky=3, not_in_creative_inventory=1},
--         sounds = default.node_sound_stone_defaults(),
--         drop = "mex_moreblocks:pumice",
--         after_place_node = function(pos, placer, itemstack, pointed_thing)
--             minetest.add_node(pos, {name = "mex_moreblocks:pumice"})
--         end
--     })

-- minetest.register_node("mex_moreblocks:fence_steel", {
--     description = S("Steel Fence"),
--     drawtype = "fencelike",
--     tiles = {"default_steel_block.png"},
--     inventory_image = fence_texture,
--     wield_image = fence_texture,
--     paramtype = "light",
--     sunlight_propagates = true,
--     is_ground_content = false,
--     selection_box = {
--         type = "fixed",
--         fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
--     },
--     groups = {choppy = 2, oddly_breakable_by_hand = 2 },
--     sounds = default.node_sound_stone_defaults(),
-- })
--
--


--
-- stairs.register_stair_and_slab("straw", "mex_moreblocks:straw",
--     {snappy=3, flammable=2},
--     {"mex_moreblocks_straw.png"},
--     "Straw Stair",
--     "Straw Slab",
--     default.node_sound_stone_defaults()
-- )
--
-- stairs.register_stair_and_slab("straw_bale", "mex_moreblocks:straw_bale",
--     {snappy=2, flammable=2},
--     {"mex_moreblocks_straw_bale.png"},
--     "Straw Bale Stair",
--     "Straw Bale Slab",
--     default.node_sound_stone_defaults()
-- )
--

--
-- stairs.register_stair_and_slab("stone_brick", "mex_moreblocks:stone_brick",
--     {cracky=3},
--     {"mex_moreblocks_stone_brick.png"},
--     "Stone Brick Stair",
--     "Stone Brick Slab",
--     default.node_sound_stone_defaults()
-- )
--
-- stairs.register_stair_and_slab("glass", "mex_moreblocks:glass",
--     {snappy=2,cracky=3,oddly_breakable_by_hand=3},
--     {"mex_moreblocks_glass.png"},
--     "Medieval Glass Stair",
--     "Medieval Glass Slab",
--     default.node_sound_stone_defaults()
-- )
--
-- stairs.register_stair_and_slab("glow_glass", "mex_moreblocks:glow_glass",
--     {snappy=2,cracky=3,oddly_breakable_by_hand=3},
--     {"mex_moreblocks_glass.png"},
--     "Medieval Glow Glass Stair",
--     "Medieval Glow Glass Slab",
--     default.node_sound_stone_defaults()
-- )
--
-- stairs.register_stair_and_slab("reinforced_wood", "mex_moreblocks:reinforced_wood",
--     {snappy=2,choppy=3,oddly_breakable_by_hand=3,flammable=3},
--     {"default_wood.png^mex_moreblocks_reinforce.png"},
--     "Reinforced Wood Stair",
--     "Reinforced Wood Slab",
--     default.node_sound_stone_defaults()
-- )
--
--
--
--
-- minetest.register_craft({
--     output = "mex_moreblocks:scaffolding 12",
--         recipe = {
--         {"group:stick", "group:wood", "group:stick"},
--         {"", "group:stick", ""},
--         {"group:stick", "group:wood", "group:stick"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:pavement 5",
--     recipe = {
--         {"mex_moreblocks:basalt",    "mex_moreblocks:wet_cement","mex_moreblocks:basalt"},
--         {"mex_moreblocks:wet_cement","mex_moreblocks:basalt",    "mex_moreblocks:wet_cement"},
--         {"mex_moreblocks:basalt",    "mex_moreblocks:wet_cement","mex_moreblocks:basalt"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:pavement 5",
--     recipe = {
--         {"mex_moreblocks:wet_cement","mex_moreblocks:basalt",    "mex_moreblocks:wet_cement"},
--         {"mex_moreblocks:basalt",    "mex_moreblocks:wet_cement","mex_moreblocks:basalt"},
--         {"mex_moreblocks:wet_cement","mex_moreblocks:basalt",    "mex_moreblocks:wet_cement"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:oerkki_block 2",
--     recipe = {
--         {"default:iron_lump", "default:coal_lump", "default:iron_lump"},
--         {"default:coal_lump", "default:bookshelf", "default:coal_lump"},
--         {"default:iron_lump", "default:coal_lump", "default:iron_lump"},
--     },
--     replacements = { { "default:bookshelf", "default:book 3" } }
-- })
--
--
-- minetest.register_craft({
--     type = "shapeless",
--     output = "mex_moreblocks:cobble_road 5",
--     recipe = {
--         "default:cobble",
--         "default:cobble",
--         "default:cobble",
--         "default:cobble",
--         "mex_moreblocks:pavement"
--     }
-- })
--
--
-- if minetest.get_modpath("technic") then
--     technic.register_grinder_recipe({input={"mex_moreblocks:pumice"},output="default:sand"})
--     technic.register_grinder_recipe({input={"mex_moreblocks:basalt"},output="default:cobble"})
--     minetest.register_craft({
--         type = "shapeless",
--         output = "technic:concrete 3",
--         recipe = {
--             "mex_moreblocks:wet_cement",
--             "group:sand",
--             "default:gravel",
--         }
--     })
-- end
--
-- --
-- -- Naturally spawning blocks

-- minetest.register_craft({
--     output = "mex_moreblocks:mud",
--     recipe = {
--         {"mex_moreblocks:mud_lump","mex_moreblocks:mud_lump"},
--         {"mex_moreblocks:mud_lump","mex_moreblocks:mud_lump"},
--     }
-- })
--
--


--
-- --
-- -- Cobble
-- --
--
-- --
-- -- Other Blocks
-- --
--
-- minetest.register_craft({
--     output = "mex_moreblocks:straw 2",
--     recipe = {
--     {"default:dry_shrub","default:dry_shrub"},
--         {"default:dry_shrub","default:dry_shrub"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:straw 2",
--     recipe = {
--         {"mex_moreblocks:dry_leaves","mex_moreblocks:dry_leaves"},
--         {"mex_moreblocks:dry_leaves","mex_moreblocks:dry_leaves"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:straw_bale",
--     recipe = {
--         {"mex_moreblocks:straw","mex_moreblocks:straw"},
--         {"mex_moreblocks:straw","mex_moreblocks:straw"},
--     }
-- })
--
--

--
-- minetest.register_craft({
--     output = "mex_moreblocks:stone_brick 9",
--     recipe = {
--         {"default:cobble","default:cobble","default:cobble"},
--         {"default:cobble","default:cobble","default:cobble"},
--         {"default:cobble","default:cobble","default:cobble"},
--     }
-- })
--
--
--
--
--
--
--
-- minetest.register_craft({
--     output = "mex_moreblocks:darkdirt 4",
--     recipe = {
--         {"default:dirt","default:dirt"},
--         {"default:gravel","default:gravel"},
--     }
-- })
--
-- minetest.register_craft({
--     type = "cooking",
--     output = "mex_moreblocks:dry_leaves",
--     recipe = "default:leaves",
-- })
--
-- --
-- -- Storage blocks (boxes, shelves, ect.)
-- --
--
-- minetest.register_craft({
--     output = "mex_moreblocks:box",
--     recipe = {
--         {"default:wood","","default:wood"},
--         {"","",""},
--         {"default:wood","","default:wood"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:wood_shelves 2",
--     recipe = {
--         {"mex_moreblocks:box"},
--         {"mex_moreblocks:box"},
--     }
-- })
--
-- --
-- -- Glass / Glow Glass
-- --
--
-- minetest.register_craft({
--     output = "mex_moreblocks:glass",
--         recipe = {
--         {"mex_moreblocks:glow_glass"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:glass 8",
--     recipe = {
--         {"default:glass", "default:steel_ingot", "default:glass"},
--         {"default:steel_ingot", "default:glass", "default:steel_ingot"},
--         {"default:glass", "default:steel_ingot", "default:glass"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:glow_glass",
--     recipe = {
--         {"mex_moreblocks:glass"},
--         {"default:torch"},
--     }
-- })
--
-- --
-- -- Reinforced Wood
-- --
--
-- minetest.register_craft({
--     output = "mex_moreblocks:reinforced_wood",
--     recipe = {
--         {"group:stick","","group:stick"},
--         {"","default:wood",""},
--         {"group:stick","","group:stick"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:reinforced_wood_left",
--     recipe = {
--         {"default:stick","mex_moreblocks:reinforced_wood",""},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:reinforced_wood_right",
--     recipe = {
--         {"","mex_moreblocks:reinforced_wood","default:stick"},
--     }
-- })
--
-- --
-- -- Wood based decoration items
-- --
-- minetest.register_craft({
--     output = "mex_moreblocks:wood_bars 2",
--     recipe = {
--         {"default:stick","","default:stick"},
--         {"default:stick","","default:stick"},
--         {"default:stick","","default:stick"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:wood_grille 2",
--     recipe = {
--         {"","mex_moreblocks:wood_bars",""},
--         {"mex_moreblocks:wood_bars","","mex_moreblocks:wood_bars"},
--         {"","mex_moreblocks:wood_bars",""},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:wood_frame",
--     recipe = {
--         {"group:stick","","group:stick"},
--         {"","group:wood",""},
--         {"group:stick","","group:stick"},
--     }
-- })
--
-- --
-- -- Metal based decoration items
-- --
--
-- minetest.register_craft({
--     output = "mex_moreblocks:chain 2",
--     recipe = {
--         {"mex_moreblocks:iron_stick"},
--         {"mex_moreblocks:iron_stick"},
--         {"mex_moreblocks:iron_stick"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:iron_bars 2",
--     recipe = {
--         {"mex_moreblocks:iron_stick","","mex_moreblocks:iron_stick"},
--         {"mex_moreblocks:iron_stick","","mex_moreblocks:iron_stick"},
--         {"mex_moreblocks:iron_stick","","mex_moreblocks:iron_stick"},
--     }
-- })
--
-- minetest.register_craft({
--     output = "mex_moreblocks:iron_grille 2",
--     recipe = {
--         {"","mex_moreblocks:iron_bars",""},
--         {"mex_moreblocks:iron_bars","","mex_moreblocks:iron_bars"},
--         {"","mex_moreblocks:iron_bars",""},
--     }
-- })
--
-- --
-- -- Craft items
-- --
--
-- minetest.register_craft({
--     output = "mex_moreblocks:mud_lump 4",
--     recipe = {
--         {"mex_moreblocks:mud"},
--     }
-- })
--

--
-- minetest.register_craft({
--     output = "mex_moreblocks:iron_stick 3",
--     recipe = {
--         {"default:steel_ingot"},
--         {"default:steel_ingot"},
--         {"default:steel_ingot"},
--     }
-- })


dofile(minetest.get_modpath("mex_moreblocks").."/mapgen.lua")
