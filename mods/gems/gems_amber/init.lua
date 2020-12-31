minetest.register_craftitem("gems_amber:amber", {
	description = "Amber",
	inventory_image = "amber_gem.png",
})


minetest.register_node("gems_amber:amber_ore", {
	description = "Amber Ore",
	tiles = {"default_stone.png^amber_ore.png"},
	groups = {cracky = 2},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"gems_amber:amber 2"},
            },
            {
                rarity = 2,
                items = {"gems_amber:amber"},
            },
            {
                rarity = 4,
                items = {"gems_amber:amber 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_amber:amber_ore",
	wherein = "default:stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 27,
	clust_size = 6,
	y_min = -1000,
	y_max = -64,
})
