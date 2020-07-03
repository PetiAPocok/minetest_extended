minetest.register_craftitem("gems_amber:amber", {
	description = "Amber Gem",
	inventory_image = "amber_gem.png",
})


minetest.register_node("gems_amber:amber_ore", {
	description = "Amber Ore",
	tiles = {"default_stone.png^amber_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"amber:amber_gem 2"},
            },
            {
                rarity = 2,
                items = {"amber:amber_gem"},
            },
            {
                rarity = 4,
                items = {"amber:amber_gem 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_amber:amber_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 3,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})
