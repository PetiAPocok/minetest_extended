
-- Baked Clay by TenPlus1

local clay = {
    {"white", "White"},
    {"grey", "Grey"},
    {"black", "Black"},
    {"red", "Red"},
    {"yellow", "Yellow"},
    {"green", "Green"},
    {"cyan", "Cyan"},
    {"blue", "Blue"},
    {"magenta", "Magenta"},
    {"orange", "Orange"},
    {"violet", "Violet"},
    {"brown", "Brown"},
    {"pink", "Pink"},
    {"dark_grey", "Dark Grey"},
    {"dark_green", "Dark Green"},
}

local stairs_mod = minetest.get_modpath("stairs")

for _, clay in pairs(clay) do

    -- node definition
    minetest.register_node("bakedclay:" .. clay[1], {
        description = clay[2] .. " Baked Clay",
        tiles = {"baked_clay_" .. clay[1] ..".png"},
        groups = {cracky = 3, bakedclay = 1},
        sounds = default.node_sound_stone_defaults(),
    })

    -- craft from dye and any baked clay
    minetest.register_craft({
        output = "bakedclay:" .. clay[1] .. " 8",
        recipe = {
            {"group:bakedclay", "group:bakedclay", "group:bakedclay"},
            {"group:bakedclay", "dye:" .. clay[1], "group:bakedclay"},
            {"group:bakedclay", "group:bakedclay", "group:bakedclay"}
        },
    })

    -- register stair and slab using default stairs
    stairs.register_stair_and_slab("bakedclay_".. clay[1], "bakedclay:".. clay[1],
        {cracky = 3},
        {"baked_clay_" .. clay[1] .. ".png"},
        clay[2] .. " Baked Clay Stair",
        clay[2] .. " Baked Clay Slab",
        default.node_sound_stone_defaults())
end

-- cook clay block into white baked clay

minetest.register_craft({
    type = "cooking",
    output = "bakedclay:white",
    recipe = "default:clay",
})

-- register a few extra dye colour options

minetest.register_craft( {
    type = "shapeless",
    output = "dye:dark_grey 3",
    recipe = {"dye:black", "dye:black", "dye:white"}
})

minetest.register_craft( {
    type = "shapeless",
    output = "dye:grey 3",
    recipe = {"dye:black", "dye:white", "dye:white"}
})

minetest.register_craft( {
    type = "shapeless",
    output = "dye:green 4",
    recipe = {"default:cactus"}
})

minetest.register_craft( {
    type = "shapeless",
    output = "dye:black 4",
    recipe = {"default:coal_lump"}
})

minetest.register_craft( {
    type = "shapeless",
    output = "dye:brown 4",
    recipe = {"default:dry_shrub"}
})

-- 2x2 red bakedclay makes 16x clay brick
minetest.register_craft( {
    output = "default:clay_brick 16",
    recipe = {
        {"bakedclay:red", "bakedclay:red"},
        {"bakedclay:red", "bakedclay:red"},
    }
})

print ("[MOD] Baked Clay loaded")
