minetest.register_craftitem("emerald:emerald_crystal", {
	description = "Emerald Crystal",
	inventory_image = "emerald_crystal.png",
})


minetest.register_node("emerald:emerald_ore", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^emerald_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"emerald:emerald_crystal 2"},
            },
            {
                rarity = 2,
                items = {"emerald:emerald_crystal"},
            },
            {
                rarity = 4,
                items = {"emerald:emerald_crystal 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "emerald:emerald_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("emerald:block", {
	description = "Emerald Block",
	tiles = {"emerald_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "emerald:block",
	recipe = {
		{"emerald:emerald_crystal", "emerald:emerald_crystal"},
		{"emerald:emerald_crystal", "emerald:emerald_crystal"}
	}
})


stairs.register_stair_and_slab("emeraldblock", "emerald:block",
	{cracky=3, oddly_breakable_by_hand=1},
	{"emerald_block.png"},
	"Emerald Stair",
	"Emerald Slab",
	default.node_sound_glass_defaults()
)
