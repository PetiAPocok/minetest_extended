minetest.register_craftitem("topaz:topaz_crystal", {
	description = "Topaz Crystal",
	inventory_image = "topaz_crystal.png",
})


minetest.register_node("topaz:topaz_ore", {
	description = "Topaz Ore",
	tiles = {"default_stone.png^topaz_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"topaz:topaz_crystal 2"},
            },
            {
                rarity = 2,
                items = {"topaz:topaz_crystal"},
            },
            {
                rarity = 4,
                items = {"topaz:topaz_crystal 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "topaz:topaz_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("topaz:block", {
	description = "topaz Block",
	tiles = {"topaz_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "topaz:block",
	recipe = {
		{"topaz:topaz_crystal", "topaz:topaz_crystal"},
		{"topaz:topaz_crystal", "topaz:topaz_crystal"}
	}
})


stairs.register_stair_and_slab("topazblock", "topaz:block",
	{cracky=3, oddly_breakable_by_hand=1},
	{"topaz_block.png"},
	"Topaz Stair",
	"Topaz Slab",
	default.node_sound_glass_defaults()
)
