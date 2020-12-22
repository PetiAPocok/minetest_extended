minetest.register_node("mex_moreblocks:candle", {
    description = "Candle",
    drawtype = "mesh",
    mesh = "mex_moreblocks_candle.obj",
    tiles = {"mex_moreblocks_candle.png"},
    -- inventory_image = 'mex_moreblocks_candle.png',
    -- wield_image = 'mex_moreblocks_candle.png',
    use_texture_alpha = true,
    paramtype = "light",
    light_source = 12,
    sunlight_propagates = true,
    selection_box = {
       type = "fixed",
       fixed = {
           {-0.2, -0.5, -0.2, 0.3, 0.1, 0.2},
       },
   },
    collision_box = {
        type = "fixed",
        fixed = {
            {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        },
    },
    paramtype2 = "facedir",
    groups = {oddly_breakable_by_hand = 1},
})

minetest.register_craft({
	output = "mex_moreblocks:candle",
	recipe = {
		{"foods:wax"},
		{"foods:wax"},
		{"default:steel_ingot"},
	},
})
