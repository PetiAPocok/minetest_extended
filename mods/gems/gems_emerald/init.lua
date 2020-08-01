minetest.register_craftitem("gems_emerald:emerald", {
	description = "Emerald",
	inventory_image = "emerald_crystal.png",
})


minetest.register_node("gems_emerald:emerald_ore", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^emerald_ore.png"},
	groups = {cracky = 2},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"gems_emerald:emerald 2"},
            },
            {
                rarity = 2,
                items = {"gems_emerald:emerald"},
            },
            {
                rarity = 4,
                items = {"gems_emerald:emerald 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_emerald:emerald_ore",
	wherein = "default:stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 27,
	clust_size = 6,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("gems_emerald:block", {
	description = "Emerald Block",
	tiles = {"emerald_block.png"},
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "emerald:block",
	recipe = {
		{"gems_emerald:emerald", "gems_emerald:emerald"},
		{"gems_emerald:emerald", "gems_emerald:emerald"}
	}
})


stairs.register_stair_and_slab("emeraldblock", "gems_emerald:block",
	{cracky=3},
	{"emerald_block.png"},
	"Emerald Stair",
	"Emerald Slab",
	default.node_sound_glass_defaults()
)
