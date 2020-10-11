doors.register("door_acacia_1", {
	-- Colonial Style (6 panel)
	tiles = { { name = "doors_door_acacia_1.png", backface_culling = true } },
	description = "Acacia Wooden Door",
	inventory_image = "doors_item_acacia_1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{"default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_acacia_1",
	burntime = 14,
})

doors.register("door_acacia_2", {
	-- Cambridge Style (2 panel)
	tiles = { { name = "doors_door_acacia_2.png", backface_culling = true } },
	description = "Acacia Single-Lite Door",
	inventory_image = "doors_item_acacia_2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{"default:glass", "default:glass"},
		{"default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_acacia_2",
	burntime = 14,
})

doors.register("door_acacia_3", {
	-- Atherton Style (4 panel)
	tiles = { { name = "doors_door_acacia_3.png", backface_culling = true } },
	description = "Acacia Double-Lite Door",
	inventory_image = "doors_item_acacia_3.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{"default:glass", "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_acacia_3",
	burntime = 14,
})

doors.register("door_acacia_4", {
	tiles = { { name = "doors_door_acacia_4.png", backface_culling = true } },
	description = "Acacia Glass Door",
	inventory_image = "doors_item_acacia_4.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{"default:glass", "default:glass"},
		{"default:acacia_wood", "default:acacia_wood"},
		{"default:glass", "default:glass"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_acacia_1",
	burntime = 14,
})

doors.register("door_aspen_1", {
    tiles = {{ name = "doors_door_aspen_1.png", backface_culling = true }},
	description = "Aspen Wooden Door",
	inventory_image = "doors_item_aspen_1.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:aspen_wood", "default:aspen_wood"},
        {"default:aspen_wood", "default:aspen_wood"},
        {"default:aspen_wood", "default:aspen_wood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_aspen_1",
	burntime = 14,
})

doors.register("door_aspen_2", {
	tiles = { { name = "doors_door_aspen_2.png", backface_culling = true } },
	description = "Aspen Single-Lite Door",
	inventory_image = "doors_item_aspen_2.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	recipe = {
		{"default:glass", "default:glass"},
		{"default:aspen_wood", "default:aspen_wood"},
        {"default:aspen_wood", "default:aspen_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_aspen_2",
	burntime = 14,
})

doors.register("door_aspen_3", {
	tiles = { { name = "doors_door_aspen_3.png", backface_culling = true } },
	description = "Aspen Double-Lite Door",
	inventory_image = "doors_item_aspen_3.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	recipe = {
        {"default:glass", "default:aspen_wood"},
		{"default:aspen_wood", "default:aspen_wood"},
		{"default:aspen_wood", "default:aspen_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_aspen_3",
	burntime = 14,
})

doors.register("door_aspen_4", {
	tiles = { { name = "doors_door_aspen_4.png", backface_culling = true } },
	description = "Aspen Decorated Door 1",
	inventory_image = "doors_item_aspen_4.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{"default:aspen_wood", "default:aspen_wood"},
        {"default:aspen_wood", "default:gold_lump"},
		{"default:aspen_wood", "default:aspen_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_aspen_4",
	burntime = 14,
})

doors.register("door_aspen_5", {
    tiles = {{ name = "doors_door_aspen_5.png", backface_culling = true }},
	description = "Aspen Moon Door",
	inventory_image = "doors_item_aspen_5.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:aspen_wood", "dye:dark_grey"},
        {"default:aspen_wood", "default:aspen_wood"},
		{"default:aspen_wood", "default:aspen_wood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_aspen_5",
	burntime = 14,
})

doors.register("door_aspen_6", {
	tiles = { { name = "doors_door_aspen_6.png", backface_culling = true } },
	description = "Aspen Decorated Door 2",
	inventory_image = "doors_item_aspen_6.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	recipe = {
        {"default:aspen_wood", "dye:dark_grey"},
        {"default:aspen_wood", "default:gold_lump"},
		{"default:aspen_wood", "default:aspen_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_aspen_6",
	burntime = 14,
})

doors.register("door_aspen_7", {
	tiles = { { name = "doors_door_aspen_7.png", backface_culling = true } },
	description = "Aspen Windowed Door",
	inventory_image = "doors_item_aspen_7.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	recipe = {
        {"default:glass", "dye:dark_grey"},
        {"default:aspen_wood", "default:aspen_wood"},
		{"default:aspen_wood", "default:aspen_wood"},
	}
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_aspen_7",
	burntime = 14,
})

minetest.override_item("doors:door_steel", {
    tiles = {{name = "doors_door_steel_new.png", backface_culling = true}},
    inventory_image = "doors_item_steel_new.png",
})

doors.register("door_jungle_1", {
    tiles = {{ name = "doors_door_jungle_1.png", backface_culling = true }},
	description = "Jungle Door 1",
	inventory_image = "doors_item_jungle_1.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:junglewood", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_jungle_1",
	burntime = 14,
})

doors.register("door_jungle_2", {
    tiles = { { name = "doors_door_jungle_2.png", backface_culling = true } },
    description = "Jungle Door 2",
    inventory_image = "doors_item_jungle_2.png",
    groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
    recipe = {
        {"default:junglewood", "default:steel_ingot"},
        {"default:junglewood", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_jungle_2",
	burntime = 14,
})

doors.register("door_jungle_3", {
    tiles = {{ name = "doors_door_jungle_3.png", backface_culling = true }},
	description = "Jungle Door 3",
	inventory_image = "doors_item_jungle_3.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:steel_ingot", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_jungle_3",
	burntime = 14,
})

doors.register("door_jungle_4", {
    tiles = {{ name = "doors_door_jungle_4.png", backface_culling = true }},
	description = "Jungle Door 4",
	inventory_image = "doors_item_jungle_4.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:glass", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_jungle_4",
	burntime = 14,
})

doors.register("door_jungle_5", {
    tiles = {{ name = "doors_door_jungle_5.png", backface_culling = true }},
	description = "Jungle Door 5",
	inventory_image = "doors_item_jungle_5.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:junglewood", "dye:red"},
        {"default:junglewood", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_jungle_5",
	burntime = 14,
})

doors.register("door_jungle_6", {
    tiles = {{ name = "doors_door_jungle_6.png", backface_culling = true }},
	description = "Jungle Door 6",
	inventory_image = "doors_item_jungle_6.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:steel_ingot", "dye:red"},
        {"default:junglewood", "default:junglewood"},
        {"default:junglewood", "default:junglewood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_jungle_6",
	burntime = 14,
})

doors.register("door_pine", {
    tiles = {{name = "doors_door_pine.png", backface_culling = true }},
	description = "Pine Door",
	inventory_image = "doors_item_pine.png",
    groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
    recipe = {
        {"default:glass", "dye:grey"},
        {"default:pine_wood", "default:pine_wood"},
        {"default:pine_wood", "default:pine_wood"},
    }
})

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_pine",
	burntime = 14,
})
