minetest.register_craftitem("gems_topaz:topaz", {
	description = "Topaz",
	inventory_image = "topaz_crystal.png",
})


minetest.register_node("gems_topaz:topaz_ore", {
	description = "Topaz Ore",
	tiles = {"default_stone.png^topaz_ore.png"},
	groups = {cracky = 2},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"gems_topaz:topaz 2"},
            },
            {
                rarity = 2,
                items = {"gems_topaz:topaz"},
            },
            {
                rarity = 4,
                items = {"gems_topaz:topaz 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_topaz:topaz_ore",
	wherein = "default:stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 27,
	clust_size = 6,
	y_min = -1000,
	y_max = -64,
})


minetest.register_node("gems_topaz:block", {
	description = "topaz Block",
	tiles = {"topaz_block.png"},
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "gems_topaz:block",
	recipe = {
		{"gems_topaz:topaz", "gems_topaz:topaz"},
		{"gems_topaz:topaz", "gems_topaz:topaz"}
	}
})


stairs.register_stair_and_slab("topazblock", "gems_topaz:block",
	{cracky=3},
	{"topaz_block.png"},
	"Topaz Stair",
	"Topaz Slab",
	default.node_sound_glass_defaults()
)
