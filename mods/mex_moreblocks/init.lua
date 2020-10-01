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

minetest.register_node("mex_moreblocks:andesite", {
    description = "Andesite",
    tiles = {"mex_moreblocks_andesite.png"},
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults(),
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
    on_destruct = function(pos)
        local drop = ""
        local temp = {}

        default.get_inventory_drops(pos, "main", temp)

        for i,v in ipairs(temp) do
            drop = v.name .. " " .. v.count
            minetest.add_item(pos, drop)
        end
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

minetest.register_craft({
    output = "mex_moreblocks:box",
    recipe = {
        {"group:wood","","group:wood"},
        {"","",""},
        {"group:wood","","group:wood"},
    }
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

minetest.register_node("mex_moreblocks:diorite", {
    description = "Diorite",
    tiles = {"mex_moreblocks_diorite.png"},
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mex_moreblocks:granite", {
    description = "Granite",
    tiles = {"mex_moreblocks_granite.png"},
    groups = {cracky=2},
    sounds = default.node_sound_stone_defaults(),
})

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

minetest.register_node("mex_moreblocks:pumice", {
    description = "Pumice",
    tiles = {"mex_moreblocks_pumice.png"},
    groups = {cracky=3},
    sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab("pumice", "mex_moreblocks:pumice",
    {cracky=3},
    {"mex_moreblocks_pumice.png"},
    "Pumice Stair",
    "Pumice Slab",
    default.node_sound_stone_defaults()
)

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

minetest.register_node("mex_moreblocks:wood_shelves", {
    description = "Wooden Shelves",
    tiles = { "mex_moreblocks_shelves.png","mex_moreblocks_shelves.png","mex_moreblocks_shelves.png",
            "mex_moreblocks_shelves.png","mex_moreblocks_shelves.png","mex_moreblocks_shelves_front.png"},
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
    on_destruct = function(pos)
        local drop = ""
        local temp = {}

        default.get_inventory_drops(pos, "main", temp)

        for i,v in ipairs(temp) do
            drop = v.name .. " " .. v.count
            minetest.add_item(pos, drop)
        end
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

minetest.register_craft({
    output = "mex_moreblocks:wood_shelves",
    recipe = {
        {"group:wood", "group:wood", "group:wood"},
        {"", "", ""},
        {"group:wood", "group:wood", "group:wood"},
    }
})

dofile(minetest.get_modpath("mex_moreblocks").."/lanterns.lua")
dofile(minetest.get_modpath("mex_moreblocks").."/gongs.lua")

dofile(minetest.get_modpath("mex_moreblocks").."/mapgen.lua")
