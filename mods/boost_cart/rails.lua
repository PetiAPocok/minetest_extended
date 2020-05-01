-- Common rail registrations

-- (Steel) rail
boost_cart:register_rail("boost_cart:rail", {
	description = "Rail",
	tiles = {
		"carts_rail_straight.png", "carts_rail_curved.png",
		"carts_rail_t_junction.png", "carts_rail_crossing.png"
	},
	groups = boost_cart:get_rail_groups()
})

minetest.register_craft({
	output = "boost_cart:rail 12",
	recipe = {
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
	}
})

minetest.register_alias("default:rail", "carts:rail")

-- Copper rail
boost_cart:register_rail("boost_cart:copperrail", {
	description = "Copper rail",
	tiles = {
		"carts_rail_straight_cp.png", "carts_rail_curved_cp.png",
		"carts_rail_t_junction_cp.png", "carts_rail_crossing_cp.png"
	},
	groups = boost_cart:get_rail_groups()
})

minetest.register_craft({
	output = "boost_cart:copperrail 12",
	recipe = {
		{"default:copper_ingot", "group:stick", "default:copper_ingot"},
		{"default:copper_ingot", "", "default:copper_ingot"},
		{"default:copper_ingot", "group:stick", "default:copper_ingot"},
	}
})
