-- Set textures for the different cement types

local S = minetest.get_translator('cement')
local dry_cement = 'default_sand.png^(default_gravel.png^[opacity:128)'
local wet_cement = '('..dry_cement..')^[colorize:#000000:60'
local hard_cement = '('..wet_cement..')^[brighten'
local sanded_cement = '(default_sand.png^(default_sandstone.png^[opacity:128)^[brighten)'

-- Register dry cement and crafting recipe

minetest.register_node('cement:dry', {
    description = S('Dry Cement'),
    tiles = { dry_cement },
    groups = { falling_node = 1, crumbly = 2},
    is_ground_content = false,
    sounds = default.node_sound_gravel_defaults()
})

minetest.register_craft({
    output = 'cement:dry 2',
    type = 'shapeless',
    recipe = { 'group:sand', 'default:gravel' }
})

-- Register wet cement and crafting recipe

minetest.register_node('cement:wet', {
    description = S('Wet Cement'),
    tiles = { wet_cement },
    groups = { falling_node = 1, crumbly = 3},
    is_ground_content = false,
    sounds = default.node_sound_dirt_defaults()
})

minetest.register_craft({
    output = 'cement:wet 2',
    type = 'shapeless',
    recipe = { 'group:sand', 'default:gravel', 'bucket:bucket_water' },
    replacements = {{ 'bucket:bucket_water', 'bucket:bucket_empty' }}
})

minetest.register_craft({
    output = 'cement:wet',
    type = 'shapeless',
    recipe = { "cement:dry", 'bucket:bucket_water' },
    replacements = {{ 'bucket:bucket_water', 'bucket:bucket_empty' }}
})

-- Register hard cement

minetest.register_node('cement:hard', {
    description = S('Hard Cement'),
    tiles = { hard_cement },
    groups = { cracky = 2},
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),
    on_punch = function (pos, node, puncher, pointed_thing)
        colorize(pos, node, puncher, pointed_thing)
    end
})

-- Register ABM to convert dry cement to wet cement when a water source
-- is nearby

minetest.register_abm({
    label = 'Turn dry cement to wet cement',
    nodenames = { 'cement:dry' },
    neighbors = { 'default:water_source' },
    interval = 5,
    chance = 2,
    catch_up = true,
    action = function(pos, node)
        minetest.set_node(pos, { name = 'cement:wet'})
    end
})

-- Register ABM to convert wet cement to hard cement when there is no
-- water source nearby

minetest.register_abm({
    label = 'Wet cement to hard cement',
    nodenames = { 'cement:wet' },
    interval = 10,
    chance = 3,
    catch_up = true,
    action = function(pos, node)
        local n = minetest.find_node_near(pos, 1, { 'default:water_source'})
        if n == nil then minetest.set_node(pos, { name = 'cement:hard'}) end
    end
})
