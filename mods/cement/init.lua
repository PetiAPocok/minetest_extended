-- Set textures for the different cement types

local S = minetest.get_translator('cement')
local dry_cement = 'default_sand.png^(default_gravel.png^[opacity:128)'
local wet_cement = '('..dry_cement..')^[colorize:#000000:60'
local hard_cement = '('..wet_cement..')^[brighten'
local sanded_cement = '(default_sand.png^(default_sandstone.png^[opacity:128)^[brighten)'


-- Conversion table for dye name -> palette index
local colors = {
    ['dye:white']      = 0,
    ['dye:grey']       = 1,
    ['dye:dark_grey']  = 2,
    ['dye:black']      = 3,
    ['dye:blue']       = 4,
    ['dye:cyan']       = 5,
    ['dye:green']      = 6,
    ['dye:dark_green'] = 7,
    ['dye:yellow']     = 8,
    ['dye:orange']     = 9,
    ['dye:brown']      = 10,
    ['dye:red']        = 11,
    ['dye:pink']       = 12,
    ['dye:magenta']    = 13,
    ['dye:violet']     = 14,
    ['dye:white']      = 15 -- double with 1
}



-- Colorizing function used for hard cement types

local colorize = function(pos, node, puncher, pointed_thing)
    local name = puncher:get_wielded_item():get_name()
    local player_name = puncher:get_player_name()

    if minetest.is_protected(pos, player_name) then
        minetest.record_protection_violation(pos, player_name)
        return
    end

    if minetest.registered_items[name].groups.dye ~= nil then
        local color = colors[name] or false
        if color ~= false then
            local node = minetest.get_node(pos)
            node.param2 = color
            minetest.set_node(pos, node)
        end
    end
end



-- Register sanding tool and recipe

minetest.register_tool('cement:sanding_tool', {
    description = S('Sanding Tool'),
    inventory_image = 'cement_sanding_tool.png',
    wield_image = 'cement_sanding_tool.png^[transformR270',
    sound = { breaks = 'default_tool_breaks' },
    -- Currently most of this gets ignored because Minetest struggles hard on
    -- cusom on_use and after_use functions.
    tool_capabilities = {
        full_punch_interval = 0.2,
        groupcaps = {
            cracky = { times = { [1]=0.2, [2]=0.2, [3]=0.2 }, uses = 100 }
        }
    },
    -- It seems not to be possible to have a custom on_use function and trigger
    -- the default after_use function (properly add wear, etc.). And the other
    -- way round it seems not to be possible to use the default on_use function
    -- (node digging animation, correct timings according to groupcaps, etc.)
    -- and get the just digged node position in a custom after_use function.
    on_use = function (itemstack, user, pointed_thing)
        local node = minetest.get_node(pointed_thing.under).name
        local player_name = user:get_player_name()
        local node_pos = pointed_thing.under

        if node ~= 'cement:hard' then return end

        if minetest.is_protected(node_pos, player_name) then
            minetest.record_protection_violation(node_pos, player_name)
            return
        end

        minetest.set_node(pointed_thing.under, { name = 'cement:sanded' })

        -- Manually determined by testing with custom after_use function
        -- printing the value. (218 is valid for 0.2 for all times and 100 for
        -- the `uses` value).
        itemstack:add_wear(218)

        return itemstack
    end
})

minetest.register_craft({
    output = 'cement:sanding_tool 1',
    recipe = {
        { 'default:steel_ingot', 'group:stick',   'dye:blue'   },
        { 'default:paper',       'default:paper', 'group:wood' },
        { 'group:sand',          'group:sand',    ''           }
    }
})



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



-- Register hard cement

minetest.register_node('cement:hard', {
    description = S('Hard Cement'),
    tiles = { hard_cement },
    groups = { cracky = 2},
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),
    paramtype2 = 'color',
    drawtype = 'color',
    palette = 'cement_palette.png',
    on_punch = function (pos, node, puncher, pointed_thing)
        colorize(pos, node, puncher, pointed_thing)
    end
})



-- Register sanded cement

minetest.register_node('cement:sanded', {
    description = S('Sanded Cement'),
    tiles = { sanded_cement },
    groups = { cracky = 2},
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),
    paramtype2 = 'color',
    drawtype = 'color',
    palette = 'cement_palette.png',
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
