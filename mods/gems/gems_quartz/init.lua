minetest.register_craftitem("gems_quartz:quartz_crystal", {
	description = "Quartz Crystal",
	inventory_image = "quartz_crystal.png",
})


minetest.register_node("gems_quartz:quartz_ore", {
	description = "Quartz Ore",
	tiles = {"default_stone.png^quartz_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"gems_quartz:quartz_crystal 2"},
            },
            {
                rarity = 2,
                items = {"gems_quartz:quartz_crystal"},
            },
            {
                rarity = 4,
                items = {"gems_quartz:quartz_crystal 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_quartz:quartz_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("gems_quartz:block", {
	description = "Quartz Block",
	tiles = {"quartz_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "gems_quartz:block",
	recipe = {
		{"gems_quartz:quartz_crystal", "gems_quartz:quartz_crystal"},
		{"gems_quartz:quartz_crystal", "gems_quartz:quartz_crystal"}
	}
})


stairs.register_stair_and_slab("quartzblock", "gems_quartz:block",
	{cracky=3, oddly_breakable_by_hand=1},
	{"quartz_block.png"},
	"Quartz Stair",
	"Quartz Slab",
	default.node_sound_glass_defaults()
)
