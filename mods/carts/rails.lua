-- carts/rails.lua

-- support for MT game translation.
local S = carts.get_translator

carts:register_rail("carts:rail", {
	description = S("Rail"),
	tiles = {
		"carts_rail_straight.png", "carts_rail_curved.png",
		"carts_rail_t_junction.png", "carts_rail_crossing.png"
	},
	inventory_image = "carts_rail_straight.png",
	wield_image = "carts_rail_straight.png",
	groups = carts:get_rail_groups(),
}, {})

minetest.register_craft({
	output = "carts:rail 18",
	recipe = {
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
	}
})

minetest.register_alias("default:rail", "carts:rail")


carts:register_rail("carts:powerrail", {
	description = S("Powered Rail"),
	tiles = {
		"carts_rail_straight_pwr.png", "carts_rail_curved_pwr.png",
		"carts_rail_t_junction_pwr.png", "carts_rail_crossing_pwr.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = 5})

minetest.register_craft({
	output = "carts:powerrail 18",
	recipe = {
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
	}
})


carts:register_rail("carts:brakerail", {
	description = S("Brake Rail"),
	tiles = {
		"carts_rail_straight_brk.png", "carts_rail_curved_brk.png",
		"carts_rail_t_junction_brk.png", "carts_rail_crossing_brk.png"
	},
	groups = carts:get_rail_groups(),
}, {acceleration = -3})

minetest.register_craft({
	output = "carts:brakerail 18",
	recipe = {
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
		{"default:steel_ingot", "default:coal_lump", "default:steel_ingot"},
		{"default:steel_ingot", "group:wood", "default:steel_ingot"},
	}
})


function carts:turnoff_detector_rail(pos)
	local node = minetest.get_node(pos)
	if minetest.get_item_group(node.name, "detector_rail") == 1 then
		if node.name == "carts:detectorrail_on" then --has not been dug
			minetest.swap_node(pos, {name = "carts:detectorrail", param2=node.param2})
		end
		mesecon.receptor_off(pos, mesecon.rules.flat)
	end
end

function carts:signal_detector_rail(pos)
	local node = minetest.get_node(pos)
	if minetest.get_item_group(node.name, "detector_rail") ~= 1 then
		return
	end

	if node.name == "carts:detectorrail" then
		minetest.swap_node(pos, {name = "carts:detectorrail_on", param2=node.param2})
	end
	mesecon.receptor_on(pos, mesecon.rules.flat)
	minetest.after(0.5, carts.turnoff_detector_rail, carts, pos)
end

carts:register_rail("carts:detectorrail", {
	description = "Detector rail",
	tiles = {
		"carts_rail_straight_dtc.png", "carts_rail_curved_dtc.png",
		"carts_rail_t_junction_dtc.png", "carts_rail_crossing_dtc.png"
	},
	groups = carts:get_rail_groups({detector_rail = 1}),

	mesecons = {receptor = {state = "off", rules = mesecon.rules.flat}},
})

carts:register_rail("carts:detectorrail_on", {
	description = "Detector rail ON (you hacker you)",
	tiles = {
		"carts_rail_straight_dtc_on.png", "carts_rail_curved_dtc_on.png",
		"carts_rail_t_junction_dtc_on.png", "carts_rail_crossing_dtc_on.png"
	},
	groups = carts:get_rail_groups({
		detector_rail = 1, not_in_creative_inventory = 1
	}),
	drop = "carts:detectorrail",

	mesecons = {receptor = {state = "on", rules = mesecon.rules.flat}},
})

minetest.register_craft({
	output = "carts:detectorrail 12",
	recipe = {
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
		{"default:steel_ingot", "mesecons:wire_00000000_off", "default:steel_ingot"},
		{"default:steel_ingot", "group:stick", "default:steel_ingot"},
	},
})
