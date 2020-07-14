minetest.register_craftitem("gems_sapphire:sapphire", {
	description = "Sapphire",
	inventory_image = "sapphire_crystal.png",
})


minetest.register_node("gems_sapphire:sapphire_ore", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^sapphire_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"gems_sapphire:sapphire 2"},
            },
            {
                rarity = 2,
                items = {"gems_sapphire:sapphire"},
            },
            {
                rarity = 4,
                items = {"gems_sapphire:sapphire 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_sapphire:sapphire_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("gems_sapphire:block", {
	description = "Sapphire Block",
	tiles = {"sapphire_block.png"},
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "gems_sapphire:block",
	recipe = {
		{"gems_sapphire:sapphire", "gems_sapphire:sapphire"},
		{"gems_sapphire:sapphire", "gems_sapphire:sapphire"}
	}
})


stairs.register_stair_and_slab("sapphireblock", "gems_sapphire:block",
	{cracky=3},
	{"sapphire_block.png"},
	"Sapphire Stair",
	"Sapphire Slab",
	default.node_sound_glass_defaults()
)
