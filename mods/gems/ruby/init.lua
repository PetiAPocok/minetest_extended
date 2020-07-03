minetest.register_craftitem("ruby:ruby_crystal", {
	description = "Ruby Crystal",
	inventory_image = "ruby_crystal.png",
})


minetest.register_node("ruby:ruby_ore", {
	description = "Ruby Ore",
	tiles = {"default_stone.png^ruby_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"ruby:ruby_crystal 2"},
            },
            {
                rarity = 2,
                items = {"ruby:ruby_crystal"},
            },
            {
                rarity = 4,
                items = {"ruby:ruby_crystal 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "ruby:ruby_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("ruby:block", {
	description = "Ruby Block",
	tiles = {"ruby_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "ruby:block",
	recipe = {
		{"ruby:ruby_crystal", "ruby:ruby_crystal"},
		{"ruby:ruby_crystal", "ruby:ruby_crystal"}
	}
})


stairs.register_stair_and_slab("rubyblock", "ruby:block",
	{cracky=3, oddly_breakable_by_hand=1},
	{"ruby_block.png"},
	"Ruby Stair",
	"Ruby Slab",
	default.node_sound_glass_defaults()
)
