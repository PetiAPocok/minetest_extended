minetest.register_craftitem("gems_bloodstone:bloodstone", {
	description = "Bloodstone",
	inventory_image = "bloodstone.png",
})


minetest.register_node("gems_bloodstone:bloodstone_ore", {
	description = "Bloodstone Ore",
	tiles = {"default_stone.png^bloodstone_ore.png"},
	groups = {cracky = 2},
    drop = {
        items = {
            {
                rarity = 1,
                items = {"gems_bloodstone:bloodstone 2"},
            },
            {
                rarity = 2,
                items = {"gems_bloodstone:bloodstone"},
            },
            {
                rarity = 4,
                items = {"gems_bloodstone:bloodstone 3"},
            }
        }
    },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "gems_bloodstone:bloodstone_ore",
	wherein = "default:stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 27,
	clust_size = 6,
	y_min = -31000,
	y_max = -64,
})


minetest.register_node("gems_bloodstone:block", {
	description = "Bloodstone Block",
	tiles = {"bloodstone_block.png"},
    use_texture_alpha = false,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "gems_bloodstone:block",
	recipe = {
		{"bloodstone:bloodstone", "bloodstone:bloodstone"},
		{"bloodstone:bloodstone", "bloodstone:bloodstone"}
	}
})


stairs.register_stair_and_slab("bloodstoneblock", "gems_bloodstone:block",
	{cracky=3},
	{"bloodstone_block.png"},
	"Bloodstone Stair",
	"Bloodstone Slab",
	default.node_sound_glass_defaults()
)
