minetest.register_craftitem("sapphire:sapphire_crystal", {
	description = "Sapphire Crystal",
	inventory_image = "sapphire_crystal.png",
})


minetest.register_node("sapphire:sapphire_ore", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^sapphire_ore.png"},
	groups = {cracky=3, stone=1},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"sapphire:sapphire_crystal 2"},
            },
            {
                rarity = 2,
                items = {"sapphire:sapphire_crystal"},
            },
            {
                rarity = 4,
                items = {"sapphire:sapphire_crystal 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "sapphire:sapphire_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("sapphire:block", {
	description = "Sapphire Block",
	tiles = {"sapphire_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "sapphire:block",
	recipe = {
		{"sapphire:sapphire_crystal", "sapphire:sapphire_crystal"},
		{"sapphire:sapphire_crystal", "sapphire:sapphire_crystal"}
	}
})


stairs.register_stair_and_slab("sapphireblock", "sapphire:block",
	{cracky=3, oddly_breakable_by_hand=1},
	{"sapphire_block.png"},
	"Sapphire Stair",
	"Sapphire Slab",
	default.node_sound_glass_defaults()
)
