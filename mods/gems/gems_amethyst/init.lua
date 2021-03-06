minetest.register_craftitem("gems_amethyst:amethyst", {
	description = "Amethyst",
	inventory_image = "amethyst_crystal.png",
})


minetest.register_node("gems_amethyst:amethyst_ore", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^amethyst_ore.png"},
	groups = {cracky = 2},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"gems_amethyst:amethyst 2"},
            },
            {
                rarity = 2,
                items = {"gems_amethyst:amethyst"},
            },
            {
                rarity = 4,
                items = {"gems_amethyst:amethyst 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_amethyst:amethyst_ore",
	wherein = "default:stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 27,
	clust_size = 6,
	y_min = -1000,
	y_max = -64,
})


minetest.register_node("gems_amethyst:block", {
	description = "Amethyst Block",
	tiles = {"amethyst_block.png"},
    use_texture_alpha = false,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "gems_amethyst:block",
	recipe = {
		{"amethyst:amethyst", "amethyst:amethyst"},
		{"amethyst:amethyst", "amethyst:amethyst"}
	}
})


stairs.register_stair_and_slab("amethystblock", "gems_amethyst:block",
	{cracky=3},
	{"amethyst_block.png"},
	"Amethyst Stair",
	"Amethyst Slab",
	default.node_sound_glass_defaults()
)
