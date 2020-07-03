minetest.register_craftitem("amethyst:amethyst_crystal", {
	description = "Amethyst Crystal",
	inventory_image = "amethyst_crystal.png",
})


minetest.register_node("amethyst:amethyst_ore", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^amethyst_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"amethyst:amethyst_crystal 2"},
            },
            {
                rarity = 2,
                items = {"amethyst:amethyst_crystal"},
            },
            {
                rarity = 4,
                items = {"amethyst:amethyst_crystal 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "amethyst:amethyst_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("amethyst:block", {
	description = "Amethyst Block",
	tiles = {"amethyst_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "amethyst:block",
	recipe = {
		{"amethyst:amethyst_crystal", "amethyst:amethyst_crystal"},
		{"amethyst:amethyst_crystal", "amethyst:amethyst_crystal"}
	}
})


stairs.register_stair_and_slab("amethystblock", "amethyst:block",
	{cracky=3, oddly_breakable_by_hand=1},
	{"amethyst_block.png"},
	"Amethyst Stair",
	"Amethyst Slab",
	default.node_sound_glass_defaults()
)
