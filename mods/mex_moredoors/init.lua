doors.register( "door_woodpanel1", {
	-- Colonial Style (6 panel)
	tiles = { { name = "doors_door_woodpanel1.png", backface_culling = true } },
	description = "Wooden Colonial Door",
	inventory_image = "doors_item_woodpanel1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "default:stick" },
		{ "group:wood", "group:wood", "default:stick" },
		{ "group:wood", "group:wood", "default:stick" },
	}
} )

doors.register( "door_woodglass1", {
	-- Cambridge Style (2 panel)
	tiles = { { name = "doors_door_woodglass1.png", backface_culling = true } },
	description = "Wooden Single-Lite Door",
	inventory_image = "doors_item_woodglass1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "default:glass", "default:glass", "default:stick" },
		{ "group:wood", "group:wood", "" },
		{ "group:wood", "group:wood", "" },
	}
} )

doors.register( "door_woodglass2", {
	-- Atherton Style (4 panel)
	tiles = { { name = "doors_door_woodglass2.png", backface_culling = true } },
	description = "Wooden Double-Lite Door",
	inventory_image = "doors_item_woodglass2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "default:glass", "default:glass", "default:stick" },
		{ "group:wood", "group:wood", "default:stick" },
		{ "group:wood", "group:wood", "" },
	}
} )

doors.register( "door_french", {
	tiles = { { name = "doors_door_french.png", backface_culling = true } },
	description = "French Door",
	inventory_image = "doors_item_french.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "default:glass", "group:wood", "default:stick" },
		{ "default:glass", "group:wood", "default:stick" },
		{ "default:glass", "group:wood", "default:stick" },
	}
} )

doors.register( "door_cottage2", {
	tiles = { { name = "doors_door_cottage2.png", backface_culling = true } },
	description = "Cottage Exterior Door",
	inventory_image = "doors_item_cottage2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "default:glass", "default:glass" },
		{ "default:stick", "default:stick" },
		{ "group:wood", "group:wood" },
	}
} )

doors.register( "door_castle1", {
	tiles = { { name = "doors_door_castle1.png", backface_culling = true } },
	description = "Castle Interior Door",
	inventory_image = "doors_item_castle1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "default:stick", "group:wood", "group:wood" },
		{ "", "group:wood", "group:wood" },
		{ "default:stick", "group:wood", "group:wood" },
	}
} )

doors.register( "door_mansion1", {
	tiles = { { name = "doors_door_mansion1.png", backface_culling = true } },
	description = "Mansion Interior Door",
	inventory_image = "doors_item_mansion1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "dye:white" },
		{ "group:wood", "group:wood", "dye:yellow" },
		{ "group:wood", "group:wood", "dye:white" },
	}
} )

doors.register( "door_mansion2", {
	tiles = { { name = "doors_door_mansion2.png", backface_culling = true } },
	description = "Mansion Exterior Door ",
	inventory_image = "doors_item_mansion2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "dye:black" },
		{ "group:wood", "group:wood", "dye:yellow" },
		{ "group:wood", "group:wood", "dye:black" },
	}
} )

doors.register( "door_steelglass1", {
	tiles = { { name = "doors_door_steelglass1.png", backface_culling = true } },
	description = "Steel Single-Lite Door",
	inventory_image = "doors_item_steelglass1.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_metal_defaults( ),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "default:glass", "default:glass", "default:steel_rod" },
		{ "default:steel_ingot", "default:steel_ingot", "" },
		{ "default:steel_ingot", "default:steel_ingot", "" },
	}
} )
--
doors.register( "door_steelglass2", {
	tiles = { { name = "doors_door_steelglass2.png", backface_culling = true } },
	description = "Steel Double-Lite Door",
	inventory_image = "doors_item_steelglass2.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_metal_defaults( ),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "default:glass", "default:glass", "default:steel_rod" },
		{ "default:steel_ingot", "default:steel_ingot", "default:steel_rod" },
		{ "default:steel_ingot", "default:steel_ingot", "" },
	}
} )
--
-- minetest.register_craft( {
-- 	type = "fuel",
-- 	recipe = "doors:door_barn1",
-- 	burntime = 14,
-- } )
--
-- minetest.register_craft( {
-- 	type = "fuel",
-- 	recipe = "doors:door_barn2",
-- 	burntime = 16,
-- } )
--
-- minetest.register_craft( {
-- 	type = "fuel",
-- 	recipe = "doors:door_castle1",
-- 	burntime = 8,
-- } )
--
-- minetest.register_craft( {
-- 	type = "fuel",
-- 	recipe = "doors:door_castle2",
-- 	burntime = 12,
-- } )

--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--

doors.register("old3_locked", {
    tiles = {{ name = "mydoors_old3.png", backface_culling = true }},
	description = "Old Door 3 Locked",
	inventory_image = "mydoors_old3_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_grey", ""},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", "default:steel_ingot"},
		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
    }
})

doors.register("old1_locked", {
    tiles = {{ name = "mydoors_old1.png", backface_culling = true }},
	description = "Old Door 1 Locked",
	inventory_image = "mydoors_old1_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})

doors.register("castle1_locked", {
    tiles = {{ name = "mydoors_door1.png", backface_culling = true }},
	description = "Castle Door 1 Locked",
	inventory_image = "mydoors_door1_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})

doors.register("cottage1_locked", {
    tiles = {{ name = "mycdoors_door1.png", backface_culling = true }},
	description = "Cottage Door 1 Locked",
	inventory_image = "mycdoors_door1_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})

doors.register("misc2_locked", {
    tiles = {{ name = "mymdoors_door2.png", backface_culling = true }},
	description = "Misc Door 2 Locked",
	inventory_image = "mymdoors_door2_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})

doors.register("castle8_locked", {
    tiles = {{ name = "mydoors_door8.png", backface_culling = true }},
	description = "Castle Door 8 Locked",
	inventory_image = "mydoors_door8_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})

doors.register("castle13_locked", {
    tiles = {{ name = "mydoors_door13.png", backface_culling = true }},
	description = "Castle Door 13 Locked",
	inventory_image = "mydoors_door13_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})

doors.register("castle7_locked", {
    tiles = {{ name = "mydoors_door7.png", backface_culling = true }},
	description = "Castle Door 7 Locked",
	inventory_image = "mydoors_door7_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})

doors.register("fancy4_locked", {
    tiles = {{ name = "myfdoors_door4.png", backface_culling = true }},
	description = "Fancy Door 4 Locked",
	inventory_image = "myfdoors_door4_inv.png",
    protected = true,
	groups = {choppy=2,cracky=2,door=1},
    recipe = {
        {"default:glass", "my_door_wood:wood_yellow", ""},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
        {"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
    }
})
