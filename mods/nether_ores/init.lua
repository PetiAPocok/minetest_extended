minetest.register_craftitem("nether_ores:vidore_lump", {
	description = "Vidore Lump",
	inventory_image = "nether_ores_vidore_lump.png",
})

minetest.register_node("nether_ores:vidore_ore", {
	description = "Vidore Ore",
	tiles = {"nether_rack.png^nether_ores_vidore_ore.png"},
	groups = {cracky = 3, level = 2},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"nether_ores:vidore_lump 2"},
            },
            {
                rarity = 2,
                items = {"nether_ores:vidore_lump"},
            },
            {
                rarity = 4,
                items = {"nether_ores:vidore_lump"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "nether_ores:vidore_ore",
	wherein = "nether:rack",
	clust_scarcity = 13*13*13,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -10000,
	y_max = -5000,
})
