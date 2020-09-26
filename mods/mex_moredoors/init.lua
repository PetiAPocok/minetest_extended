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

doors.register( "door_japanese", {
	tiles = { { name = "doors_door_japanese.png", backface_culling = true } },
	description = "Japanese Door",
	inventory_image = "doors_item_japanese.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "default:paper", "group:wood", "default:stick" },
		{ "default:paper", "group:wood", "default:stick" },
		{ "default:paper", "group:wood", "default:stick" },
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

doors.register( "door_cottage1", {
	tiles = { { name = "doors_door_cottage1.png", backface_culling = true } },
	description = "Cottage Interior Door",
	inventory_image = "doors_item_cottage1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood" },
		{ "default:stick", "default:stick" },
		{ "group:wood", "group:wood" },
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

doors.register( "door_barn1", {
	tiles = { { name = "doors_door_barn1.png", backface_culling = true } },
	description = "Barn Interior Door",
	inventory_image = "doors_item_barn1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "default:stick", "default:stick", "default:stick" },
		{ "group:wood", "group:wood", "group:wood" },
	}
} )

doors.register( "door_barn2", {
	tiles = { { name = "doors_door_barn2.png", backface_culling = true } },
	description = "Barn Exterior Door",
	inventory_image = "doors_item_barn2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "default:steel_rod", "default:steel_rod", "default:steel_rod" },
		{ "group:wood", "group:wood", "group:wood" },
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

doors.register( "door_castle2", {
	tiles = { { name = "doors_door_castle2.png", backface_culling = true } },
	description = "Castle Exterior Door",
	inventory_image = "doors_item_castle2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "default:steel_rod", "group:wood", "group:wood" },
		{ "", "group:wood", "group:wood" },
		{ "default:steel_rod", "group:wood", "group:wood" },
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

doors.register("door_dungeon1", {
	tiles = { { name = "doors_door_dungeon1.png", backface_culling = true } },
	description = "Dungeon Interior Door",
	inventory_image = "doors_item_dungeon1.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_metal_defaults( ),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "default:steel_ingot", "default:steel_rod", "default:steel_ingot" },
		{ "default:steel_rod", "default:steel_rod", "default:steel_rod" },
		{ "default:steel_ingot", "default:steel_rod", "default:steel_ingot" },
	}
} )

doors.register( "door_dungeon2", {
	tiles = { { name = "doors_door_dungeon2.png", backface_culling = true } },
	description = "Dungeon Exterior Door",
	inventory_image = "doors_item_dungeon2.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_metal_defaults( ),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "default:steel_rod", "default:steel_rod", "default:steel_rod" },
		{ "default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
		{ "default:steel_ingot", "default:steel_ingot", "default:steel_ingot" },
	}
} )

doors.register( "door_steelpanel1", {
	tiles = { { name = "doors_door_steelpanel.png", backface_culling = true } },
	description = "Steel Colonial Door",
	inventory_image = "doors_item_steelpanel1.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_metal_defaults( ),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "default:steel_ingot", "default:steel_ingot", "default:steel_rod" },
		{ "default:steel_ingot", "default:steel_ingot", "default:steel_rod" },
		{ "default:steel_ingot", "default:steel_ingot", "default:steel_rod" },
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

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_barn1",
	burntime = 14,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_barn2",
	burntime = 16,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_castle1",
	burntime = 8,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_castle2",
	burntime = 12,
} )

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
-- local cdoor_list = {   --Number , Description , Inven Image , Image
-- 	{"Castle Door 1" , "door1"},
-- 	{"Castle Door 2" , "door2"},
-- --	{"Castle Door 3" , "door3"},
-- --	{"Castle Door 4" , "door4"},
-- --	{"Castle Door 5" , "door5"},
-- 	{"Castle Door 6" , "door6"},
-- 	{"Castle Door 7" , "door7"},
-- 	{"Castle Door 8" , "door8"},
-- --	{"Castle Door 9" , "door9"},
-- --	{"Castle Door 10" , "door10"},
-- --	{"Castle Door 11" , "door11"},
-- --	{"Castle Door 12" , "door12"},
-- --	{"Castle Door 13" , "door13"},
-- }
--
--
-- for i in ipairs(cdoor_list) do
-- 	local desc = cdoor_list[i][1]
-- 	local img = cdoor_list[i][2]
--
--
-- doors.register("my_castle_doors:"..img.."_locked", {
-- 	description = desc.." Locked",
-- 	inventory_image = "mydoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{ name = "mydoors_"..img..".png", backface_culling = true }},
-- 	protected = true,
-- })
-- end
--
-- ---[[ Crafts
--
-- minetest.register_craft({
-- 	output = "my_castle_doors:door1_locked 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:glass", ""},
-- 		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", "default:steel_ingot"},
-- 		{"my_door_wood:wood_dark_grey", "default:steel_ingot", ""}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_castle_doors:door2_locked 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:glass", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "default:steel_ingot", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door3_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door4_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door5_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door6_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "default:steel_ingot", "default:steel_ingot"},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door7_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "default:steel_ingot", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door8_locked 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", "default:steel_ingot"},
-- 		{"default:steel_ingot", "default:steel_ingot", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door9_locked 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door10_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door11_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door12_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_brown", "default:steel_ingot"},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door13_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"}
-- 	}
-- })
--
--
-- --]]
--
--
--
--
--
--
-- local cdoor_list = {   --Number , Description , Inven Image , Image
-- 	{"Cottage Door 1" , "door1"},
-- --	{"Cottage Door 2" , "door2"},
-- }
--
--
-- for i in ipairs(cdoor_list) do
-- 	local desc = cdoor_list[i][1]
-- 	local img = cdoor_list[i][2]
--
--
-- doors.register_door("my_cottage_doors:"..img.."_locked", {
-- 	description = desc.." Locked",
-- 	inventory_image = "mycdoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{name="mycdoors_"..img..".png", backface_culling = true}},
-- 	protected = true,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_cottage_doors:door1_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_cottage_doors:door2_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
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
-- local mdoor_list = {   --Number , Description , Inven Image , Image
-- --	{"Misc Door 1" , "door1"},
-- --	{"Misc Door 2" , "door2"},
-- 	{"Misc Door 3" , "door3"},
-- 	{"Misc Door 4" , "door4"},
-- --	{"Misc Door 5" , "door5"},
-- }
--
--
-- for i in ipairs(mdoor_list) do
-- 	local desc = mdoor_list[i][1]
-- 	local img = mdoor_list[i][2]
--
--
-- doors.register_door("my_misc_doors:"..img.."_locked", {
-- 	description = desc.." Locked",
-- 	inventory_image = "mymdoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{name="mymdoors_"..img..".png", backface_culling = true }},
-- 	protected = true,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_misc_doors:door1_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_misc_doors:door2_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", "default:steel_ingot"},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door3_locked 1",
-- 	recipe = {
-- 		{"default:stone", "default:stone", ""},
-- 		{"default:stone", "default:stone", "default:steel_ingot"},
-- 		{"default:stone", "default:stone", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door4_locked 1",
-- 	recipe = {
-- 		{"default:cobble", "default:cobble", ""},
-- 		{"default:cobble", "default:cobble", "default:steel_ingot"},
-- 		{"default:cobble", "default:cobble", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door5_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "wool:red", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
-- 		{"my_door_wood:wood_white", "wool:red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door6_locked 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:iron_lump", ""},
-- 		{"default:steel_ingot", "default:iron_lump", "default:steel_ingot"},
-- 		{"default:steel_ingot", "default:iron_lump", ""}
-- 	}
-- })
--
--
--
--
--
--
--
--
--
-- local mdoor_list = {   --Number , Description , Inven Image , Image
-- --	{"Misc Door 1" , "door1"},
-- --	{"Misc Door 2" , "door2"},
-- 	{"Misc Door 3" , "door3"},
-- 	{"Misc Door 4" , "door4"},
-- --	{"Misc Door 5" , "door5"},
-- }
--
--
-- for i in ipairs(mdoor_list) do
-- 	local desc = mdoor_list[i][1]
-- 	local img = mdoor_list[i][2]
--
--
-- doors.register_door("my_misc_doors:"..img.."_locked", {
-- 	description = desc.." Locked",
-- 	inventory_image = "mymdoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{name="mymdoors_"..img..".png", backface_culling = true }},
-- 	protected = true,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_misc_doors:door1_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_misc_doors:door2_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", "default:steel_ingot"},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door3_locked 1",
-- 	recipe = {
-- 		{"default:stone", "default:stone", ""},
-- 		{"default:stone", "default:stone", "default:steel_ingot"},
-- 		{"default:stone", "default:stone", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door4_locked 1",
-- 	recipe = {
-- 		{"default:cobble", "default:cobble", ""},
-- 		{"default:cobble", "default:cobble", "default:steel_ingot"},
-- 		{"default:cobble", "default:cobble", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door5_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "wool:red", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
-- 		{"my_door_wood:wood_white", "wool:red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door6_locked 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:iron_lump", ""},
-- 		{"default:steel_ingot", "default:iron_lump", "default:steel_ingot"},
-- 		{"default:steel_ingot", "default:iron_lump", ""}
-- 	}
-- })
--
--
--
--
--
--
--
-- local cdoor_list = {   --Number , Description , Inven Image , Image
-- 	{ "1", "Old Door 1" , "old1"},
-- 	{ "2", "Old Door 2" , "old2"},
-- 	{ "3", "Old Door 3" , "old3"},
-- 	{ "4", "Old Door 4" , "old4"},
-- }
-- for i in ipairs(cdoor_list) do
-- 	local num = cdoor_list[i][1]
-- 	local desc = cdoor_list[i][2]
-- 	local img = cdoor_list[i][3]
--
--
-- doors.register_door("my_old_doors:door"..num.."_locked", {
-- 	description = desc.." Locked",
-- 	inventory_image = "mydoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{ name = "mydoors_"..img..".png", backface_culling = true }},
-- 	protected = true,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_old_doors:door1_locked 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_old_doors:door2_locked 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_old_doors:door3_locked 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", "default:steel_ingot"},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_old_doors:door4_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "dye:black", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
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
-- local fdoor_list = {   --Number , Description , Inven Image , Image
-- 	{"Fancy Door 1" , "door1"},
-- --	{"Fancy Door 2" , "door2"},
-- --	{"Fancy Door 3" , "door3"},
-- 	{"Fancy Door 4" , "door4"},
-- 	{"Fancy Door 5" , "door5"},
-- 	{"Fancy Door 6" , "door6"},
-- 	{"Fancy Door 7" , "door7"},
-- 	{"Fancy Door 8" , "door8"},
-- }
--
--
-- for i in ipairs(fdoor_list) do
-- 	local desc = fdoor_list[i][1]
-- 	local img = fdoor_list[i][2]
--
--
-- doors.register_door("my_fancy_doors:"..img.."_locked", {
-- 	description = desc.." Locked",
-- 	inventory_image = "myfdoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{ name = "myfdoors_"..img..".png", backface_culling = true }},
-- 	protected = true,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door1_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:glass", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "default:glass", ""}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door2_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:glass", ""},
-- 		{"my_door_wood:wood_yellow", "default:steel_ingot", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "default:glass", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door3_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "default:glass", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", "default:steel_ingot"},
-- 		{"my_door_wood:wood_white", "default:glass", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door4_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_dark_grey", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_dark_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door5_locked 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "default:glass", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door6_locked 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "default:glass", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door7_locked 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "default:glass", ""},
-- 		{"my_door_wood:wood_red", "default:glass", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door7_locked 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_red", ""},
-- 		{"default:glass", "my_door_wood:wood_red", "default:steel_ingot"},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
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
-- minetest.register_node("my_misc_doors:door2a", {
-- 	description = "Sliding Door",
-- 	inventory_image = "mydoors_bars.png",
-- 	tiles = {
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky = 3},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.4375, -0.5, -0.0625, -0.3125, 0.5, 0.0625},
-- 			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
-- 			{0.3125, -0.5, -0.0625, 0.4375, 0.5, 0.0625},
-- 			{0.125, -0.5, -0.0625, 0.25, 0.5, 0.0625},
-- 			{-0.25, -0.5, -0.0625, -0.125, 0.5, 0.0625},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.4375, -0.5, -0.0625, 0.4375, 1.5, 0.0625},
-- 		}
-- 	},
--
-- on_place = function(itemstack, placer, pointed_thing)
-- 	local pos1 = pointed_thing.above
-- 	local pos2 = {x=pos1.x, y=pos1.y, z=pos1.z}
-- 	      pos2.y = pos2.y+1
-- 	if
-- 	not minetest.registered_nodes[minetest.get_node(pos1).name].buildable_to or
-- 	not minetest.registered_nodes[minetest.get_node(pos2).name].buildable_to or
-- 	not placer or
-- 	not placer:is_player() then
-- 	return
-- 	end
-- 			local pt = pointed_thing.above
-- 			local pt2 = {x=pt.x, y=pt.y, z=pt.z}
-- 			pt2.y = pt2.y+1
-- 			local p2 = minetest.dir_to_facedir(placer:get_look_dir())
-- 			local pt3 = {x=pt.x, y=pt.y, z=pt.z}
-- 			local p4 = 0
-- 			if p2 == 0 then
-- 				pt3.x = pt3.x-1
-- 				p4 = 2
-- 			elseif p2 == 1 then
-- 				pt3.z = pt3.z+1
-- 				p4 = 3
-- 			elseif p2 == 2 then
-- 				pt3.x = pt3.x+1
-- 				p4 = 0
-- 			elseif p2 == 3 then
-- 				pt3.z = pt3.z-1
-- 				p4 = 1
-- 			end
-- 			if minetest.get_node(pt3).name == "my_misc_doors:door2a" then
-- 				minetest.set_node(pt, {name="my_misc_doors:door2a", param2=p4})
-- 				minetest.set_node(pt2, {name="my_misc_doors:door2b", param2=p4})
-- 			else
-- 				minetest.set_node(pt, {name="my_misc_doors:door2a", param2=p2})
-- 				minetest.set_node(pt2, {name="my_misc_doors:door2b", param2=p2})
-- 			end
-- end,
-- after_destruct = function(pos, oldnode)
-- 	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
-- end,
-- on_rightclick = function(pos, node, player, itemstack, pointed_thing)
-- 	local timer = minetest.get_node_timer(pos)
-- 	local a = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1})
-- 	local b = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1})
-- 	local c = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z})
-- 	local d = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z})
-- 		minetest.set_node(pos, {name="my_misc_doors:door2c", param2=node.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name="my_misc_doors:door2d", param2=node.param2})
--
-- 	     if a.name == "my_misc_doors:door2a" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name="my_misc_doors:door2c", param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name="my_misc_doors:door2d", param2=a.param2})
-- 		end
-- 	     if b.name == "my_misc_doors:door2a" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name="my_misc_doors:door2c", param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name="my_misc_doors:door2d", param2=b.param2})
-- 		end
-- 	     if c.name == "my_misc_doors:door2a" then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name="my_misc_doors:door2c", param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name="my_misc_doors:door2d", param2=c.param2})
-- 		end
-- 	     if d.name == "my_misc_doors:door2a" then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name="my_misc_doors:door2c", param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name="my_misc_doors:door2d", param2=d.param2})
-- 		end
--
-- 	   timer:start(3)
--
-- end,
-- })
-- minetest.register_node("my_misc_doors:door2b", {
-- 	tiles = {
-- 		"mydoors_bars.png",
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.4375, -0.5, -0.0625, -0.3125, 0.5, 0.0625},
-- 			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
-- 			{0.3125, -0.5, -0.0625, 0.4375, 0.5, 0.0625},
-- 			{0.125, -0.5, -0.0625, 0.25, 0.5, 0.0625},
-- 			{-0.25, -0.5, -0.0625, -0.125, 0.5, 0.0625},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0},
-- 		}
-- 	},
-- })
-- minetest.register_node("my_misc_doors:door2c", {
-- 	tiles = {
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png^[transformFX",
-- 		"mydoors_bars.png",
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.4375, -0.375, -0.0625, -0.3125, -0.5, 0.0625},
-- 			{-0.0625, -0.375, -0.0625, 0.0625, -0.5, 0.0625},
-- 			{0.3125, -0.375, -0.0625, 0.4375, -0.5, 0.0625},
-- 			{0.125, -0.375, -0.0625, 0.25, -0.5, 0.0625},
-- 			{-0.25, -0.375, -0.0625, -0.125, -0.5, 0.0625},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0},
-- 		}
-- 	},
-- after_place_node = function(pos, placer, itemstack, pointed_thing)
-- 	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="my_misc_doors:door2d",param2=nodeu.param2})
-- end,
-- after_destruct = function(pos, oldnode)
-- 	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
-- end,
-- on_timer = function(pos, elapsed)
-- 	local node = minetest.get_node(pos)
-- 	local a = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1})
-- 	local b = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1})
-- 	local c = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z})
-- 	local d = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z})
-- 		minetest.set_node(pos, {name="my_misc_doors:door2a", param2=node.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name="my_misc_doors:door2b", param2=node.param2})
--
-- 	     if a.name == "my_misc_doors:door2c" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name="my_misc_doors:door2a", param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name="my_misc_doors:door2b", param2=a.param2})
-- 		end
-- 	     if b.name == "my_misc_doors:door2c" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name="my_misc_doors:door2a", param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name="my_misc_doors:door2b", param2=b.param2})
-- 		end
-- 	     if c.name == "my_misc_doors:door2c" then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name="my_misc_doors:door2a", param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name="my_misc_doors:door2b", param2=c.param2})
-- 		end
-- 	     if d.name == "my_misc_doors:door2c" then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name="my_misc_doors:door2a", param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name="my_misc_doors:door2b", param2=d.param2})
-- 		end
--
-- end,
-- })
-- minetest.register_node("my_misc_doors:door2d", {
-- 	tiles = {
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png",
-- 		"mydoors_bars.png^[transformFX",
-- 		"mydoors_bars.png",
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.4375, 0.375, -0.0625, -0.3125, 0.5, 0.0625},
-- 			{-0.0625, 0.375, -0.0625, 0.0625, 0.5, 0.0625},
-- 			{0.3125, 0.375, -0.0625, 0.4375, 0.5, 0.0625},
-- 			{0.125, 0.375, -0.0625, 0.25, 0.5, 0.0625},
-- 			{-0.25, 0.375, -0.0625, -0.125, 0.5, 0.0625},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0},
-- 		}
-- 	},
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door2a 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:steelblock", ""},
-- 		{"default:steel_ingot", "default:steel_ingot", ""},
-- 		{"default:steelblock", "default:steel_ingot", ""}
-- 	}
-- })
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
-- local cdoor_list = {   --Number , Description , Inven Image , Image
-- --	{"Castle Door 1" , "door1"},
-- --	{"Castle Door 2" , "door2"},
-- 	{"Castle Door 3" , "door3"},
-- 	{"Castle Door 4" , "door4"},
-- 	{"Castle Door 5" , "door5"},
-- --	{"Castle Door 6" , "door6"},
-- --	{"Castle Door 7" , "door7"},
-- --	{"Castle Door 8" , "door8"},
-- 	{"Castle Door 9" , "door9"},
-- 	{"Castle Door 10" , "door10"},
-- 	{"Castle Door 11" , "door11"},
-- 	{"Castle Door 12" , "door12"},
-- 	{"Castle Door 13" , "door13"},
-- }
--
--
-- for i in ipairs(cdoor_list) do
-- 	local desc = cdoor_list[i][1]
-- 	local img = cdoor_list[i][2]
--
--
-- doors.register_door("my_castle_doors:"..img, {
-- 	description = desc,
-- 	inventory_image = "mydoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{name="mydoors_"..img..".png", backface_culling = true}},
-- 	protected = false,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_castle_doors:door1 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:glass", ""},
-- 		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""},
-- 		{"my_door_wood:wood_dark_grey", "default:steel_ingot", ""}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_castle_doors:door2 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:glass", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "default:steel_ingot", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door3 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door4 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door5 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door6 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door7 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door8 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_dark_grey", "my_door_wood:wood_dark_grey", ""},
-- 		{"default:steel_ingot", "default:steel_ingot", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door9 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door10 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door11 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door12 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_brown", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_castle_doors:door13 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", ""},
-- 		{"my_door_wood:wood_brown", "my_door_wood:wood_brown", "default:steel_ingot"}
-- 	}
-- })
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
-- local cdoor_list = {   --Number , Description , Inven Image , Image
-- --	{"Cottage Door 1" , "door1"},
-- 	{"Cottage Door 2" , "door2"},
-- }
--
--
-- for i in ipairs(cdoor_list) do
-- 	local desc = cdoor_list[i][1]
-- 	local img = cdoor_list[i][2]
--
--
-- doors.register_door("my_cottage_doors:"..img, {
-- 	description = desc,
-- 	inventory_image = "mycdoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{name="mycdoors_"..img..".png", backface_culling = true}},
-- 	protected = false,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_cottage_doors:door1 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", "default:steel_ingot"}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_cottage_doors:door2 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
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
-- local mdoor_list = {   --Number , Description , Inven Image , Image
-- 	{"Misc Door 1" , "door1"},
-- 	{"Misc Door 2" , "door2"},
-- --	{"Misc Door 3" , "door3"},
-- --	{"Misc Door 4" , "door4"},
-- 	{"Misc Door 5" , "door5"},
-- }
--
--
-- for i in ipairs(mdoor_list) do
-- 	local desc = mdoor_list[i][1]
-- 	local img = mdoor_list[i][2]
--
--
-- doors.register_door("my_misc_doors:"..img, {
-- 	description = desc,
-- 	inventory_image = "mymdoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{name="mymdoors_"..img..".png", backface_culling = true }},
-- 	protected = false,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_misc_doors:door1 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_misc_doors:door2 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door3 1",
-- 	recipe = {
-- 		{"default:stone", "default:stone", ""},
-- 		{"default:stone", "default:stone", ""},
-- 		{"default:stone", "default:stone", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door4 1",
-- 	recipe = {
-- 		{"default:cobble", "default:cobble", ""},
-- 		{"default:cobble", "default:cobble", ""},
-- 		{"default:cobble", "default:cobble", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door5 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "wool:red", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
-- 		{"my_door_wood:wood_white", "wool:red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_misc_doors:door6 1",
-- 	recipe = {
-- 		{"default:steel_ingot", "default:iron_lump", ""},
-- 		{"default:steel_ingot", "default:iron_lump", ""},
-- 		{"default:steel_ingot", "default:iron_lump", ""}
-- 	}
-- })
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
-- local fdoor_list = {   --Number , Description , Inven Image , Image
-- --	{"Fancy Door 1" , "door1"},
-- 	{"Fancy Door 2" , "door2"},
-- 	{"Fancy Door 3" , "door3"},
-- --	{"Fancy Door 4" , "door4"},
-- --	{"Fancy Door 5" , "door5"},
-- --	{"Fancy Door 6" , "door6"},
-- --	{"Fancy Door 7" , "door7"},
-- --	{"Fancy Door 8" , "door8"},
-- }
--
--
-- for i in ipairs(fdoor_list) do
-- 	local desc = fdoor_list[i][1]
-- 	local img = fdoor_list[i][2]
--
--
-- doors.register_door("my_fancy_doors:"..img, {
-- 	description = desc,
-- 	inventory_image = "myfdoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{ name = "myfdoors_"..img..".png", backface_culling = true }},
-- 	protected = false,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door1 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:glass", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "default:glass", ""}
-- 	}
-- })
--
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door2 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_yellow", "default:glass", ""},
-- 		{"my_door_wood:wood_yellow", "default:steel_ingot", ""},
-- 		{"my_door_wood:wood_yellow", "default:glass", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door3 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_white", "default:glass", ""},
-- 		{"my_door_wood:wood_white", "my_door_wood:wood_white", ""},
-- 		{"my_door_wood:wood_white", "default:glass", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_fancy_doors:door4 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_dark_grey", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_dark_grey", ""}
-- 	}
-- })
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
-- local cdoor_list = {   --Number , Description , Inven Image , Image
-- --	{ "1", "Old Door 1" , "old1"},
-- --	{ "2", "Old Door 2" , "old2"},
-- --	{ "3", "Old Door 3" , "old3"},
-- --	{ "4", "Old Door 4" , "old4"},
-- }
-- for i in ipairs(cdoor_list) do
-- 	local num = cdoor_list[i][1]
-- 	local desc = cdoor_list[i][2]
-- 	local img = cdoor_list[i][3]
--
-- doors.register_door("my_old_doors:door"..num, {
-- 	description = desc,
-- 	inventory_image = "mydoors_"..img.."_inv.png",
-- 	groups = {choppy=2,cracky=2,door=1},
-- 	tiles = {{ name = "mydoors_"..img..".png", backface_culling = true }},
-- 	protected = true,
-- })
-- end
--
-- -- Crafts
--
-- minetest.register_craft({
-- 	output = "my_old_doors:door1 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""},
-- 		{"my_door_wood:wood_yellow", "my_door_wood:wood_yellow", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_old_doors:door2 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_old_doors:door3 1",
-- 	recipe = {
-- 		{"default:glass", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""},
-- 		{"my_door_wood:wood_grey", "my_door_wood:wood_grey", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "my_old_doors:door4 1",
-- 	recipe = {
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""},
-- 		{"my_door_wood:wood_red", "dye:black", ""},
-- 		{"my_door_wood:wood_red", "my_door_wood:wood_red", ""}
-- 	}
-- })
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
-- local doors = {
-- 	{"my_sliding_doors:door1a","my_sliding_doors:door1b","my_sliding_doors:door1c","my_sliding_doors:door1d","1","White"},
-- 	{"my_sliding_doors:door2a","my_sliding_doors:door2b","my_sliding_doors:door2c","my_sliding_doors:door2d","2","Flower"},
-- 	{"my_sliding_doors:door3a","my_sliding_doors:door3b","my_sliding_doors:door3c","my_sliding_doors:door3d","3","Framed"},
-- 	}
-- for i in ipairs (doors) do
-- local doora = doors[i][1]
-- local doorb = doors[i][2]
-- local doorc = doors[i][3]
-- local doord = doors[i][4]
-- local num = doors[i][5]
-- local des = doors[i][6]
--
-- function onplace(itemstack, placer, pointed_thing)
--
-- 	local pos1 = pointed_thing.above
-- 	local pos = pos1
-- 	local pos2 = minetest.find_node_near(pos1, 1, {doora})
-- 	local par = minetest.dir_to_facedir(placer:get_look_dir())
-- 	local par2 = par + 2
--
-- 		if par2 == 4 then par2 = 0 end
-- 		if par2 == 5 then par2 = 1 end
-- 		if pos2 == nil then
-- 			minetest.set_node(pos, {name=doora,param2=par})
-- 			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb,param2=par})
-- 		else
-- 			minetest.set_node(pos, {name=doora.."2",param2=par2})
-- 			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb.."2",param2=par2})
-- 		end
--
-- end
--
-- function afterdestruct(pos, oldnode)
-- 	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
-- end
--
-- function rightclick(pos, node, player, itemstack, pointed_thing)
--
-- 	local a = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1})
-- 	local b = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1})
-- 	local c = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z})
-- 	local d = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z})
-- 		if node.name == doora then
-- 		minetest.set_node(pos, {name=doorc, param2=node.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doord, param2=node.param2})
-- 		elseif node.name == doorc then
-- 		minetest.set_node(pos, {name=doora, param2=node.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb, param2=node.param2})
-- 		end
--
-- 	     if a.name == doora then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doorc, param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doord, param2=a.param2})
-- 		end
-- 	     if b.name == doora then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doorc, param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doord, param2=b.param2})
-- 		end
-- 	     if c.name == doora then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doorc, param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doord, param2=c.param2})
-- 		end
-- 	     if d.name == doora then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doorc, param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doord, param2=d.param2})
-- 		end
--
-- 	     if a.name == doora.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doorc.."2", param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doord.."2", param2=a.param2})
-- 		end
-- 	     if b.name == doora.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doorc.."2", param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doord.."2", param2=b.param2})
-- 		end
-- 	     if c.name == doora.."2" then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doorc.."2", param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=c.param2})
-- 		end
-- 	     if d.name == doora.."2" then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doorc.."2", param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=d.param2})
-- 		end
-- 	     if a.name == doorc then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doora, param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doorb, param2=a.param2})
-- 		end
-- 	     if b.name == doorc then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doora, param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doorb, param2=b.param2})
-- 		end
-- 	     if c.name == doorc then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doora, param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doorb, param2=c.param2})
-- 		end
-- 	     if d.name == doorc then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doora, param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doorb, param2=d.param2})
-- 		end
--
-- 	     if a.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doora.."2", param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doorb.."2", param2=a.param2})
-- 		end
-- 	     if b.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doora.."2", param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doorb.."2", param2=b.param2})
-- 		end
-- 	     if c.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doora.."2", param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=c.param2})
-- 		end
-- 	     if d.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doora.."2", param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=d.param2})
-- 		end
--
-- end
--
-- function afterplace(pos, placer, itemstack, pointed_thing)
-- 	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name=doord,param2=nodeu.param2})
-- end
--
-- minetest.register_node(doora, {
-- 	description = des.." Sliding Door",
-- 	inventory_image = "myjdoors_door"..num.."a_inv.png",
-- 	wield_image = "myjdoors_door"..num.."a_inv.png",
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_bottom.png^[transformFX",
-- 		"myjdoors_door"..num.."a_bottom.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 3},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0.375, -0.5, 0.1875, 0.5, 0.5, 0.0625},
-- 			{-0.5, -0.5, 0.1875, -0.375, 0.5, 0.0625},
--
-- 			{-0.5, -0.5, 0.1875, 0.5, -0.375, 0.0625},
-- 			{-0.5, -0.5, 0.125, 0.5, 0.5, 0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {type = "fixed",fixed = {{-1.5, -0.5, -0.0625, -0.5, 1.5, 0.0625},{-0.5, -0.5, 0.0625, 0.5, 1.5, 0.1875}}},
--
-- on_place = onplace,
--
-- after_destruct = afterdestruct,
--
-- on_rightclick = rightclick,
-- })
-- minetest.register_node(doorb, {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_top.png^[transformFX",
-- 		"myjdoors_door"..num.."a_top.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0.375, -0.5, 0.1875, 0.5, 0.5, 0.0625},
-- 			{-0.5, -0.5, 0.1875, -0.375, 0.5, 0.0625},
--
-- 			{-0.5, 0.5, 0.1875, 0.5, 0.375, 0.0625},
-- 			{-0.5, -0.5, 0.125, 0.5, 0.5, 0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		0.5,	-0.0625,	-0.5,   0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0},
-- 		}
-- 	},
-- })minetest.register_node(doorc, {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_bottom.png^[transformFX",
-- 		"myjdoors_door"..num.."a_bottom.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	drop = doora,
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.625, -0.5, 0.1875, -0.5, 0.5, 0.0625},
-- 			{-1.5, -0.5, 0.1875, -1.375, 0.5, 0.0625},
--
-- 			{-1.5, -0.5, 0.1875, -0.5, -0.375, 0.0625},
-- 			{-1.5, -0.5, 0.125, -0.5, 0.5, 0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-1.5, -0.5, -0.0625, -0.5, 1.5, 0.1875}
-- 		}
-- 	},
-- after_place_node = afterplace,
-- after_destruct = afterdestruct,
-- on_rightclick = rightclick,
-- })
-- minetest.register_node(doord, {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_top.png^[transformFX",
-- 		"myjdoors_door"..num.."a_top.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.625, -0.5, 0.1875, -0.5, 0.5, 0.0625},
-- 			{-1.5, -0.5, 0.1875, -1.375, 0.5, 0.0625},
--
-- 			{-1.5, 0.5, 0.1875, -0.5, 0.375, 0.0625},
-- 			{-1.5, -0.5, 0.125, -0.5, 0.5, 0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		0.5,	-0.0625,	-0.5,   0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0},
-- 		}
-- 	},
-- })
-- minetest.register_node("my_sliding_doors:jpanel"..num, {
-- 	description = des.." Panel",
-- 	inventory_image = "myjdoors_panel"..num.."_inv.png",
-- 	wield_image = "myjdoors_panel"..num.."_inv.png",
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_bottom.png",
-- 		"myjdoors_door"..num.."a_bottom.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 3},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0.375, -0.5, -0.0625, 0.5, 0.5, 0.0625},
-- 			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
-- 			{-0.5, -0.5, -0.0625, 0.5, -0.375, 0.0625},
-- 			{-0.4375, -0.5, 0, 0.4375, 0.5, 0.02},
-- 		}
-- 	},
-- 	selection_box = {type = "fixed",fixed = {{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625}}},
-- 	collision_box = {type = "fixed",fixed = {{-0.5, -0.5, -0.0625, 0.5, 1.5, 0.0625}}},
--
-- 	on_place = function(itemstack, placer, pointed_thing)
-- 	local p2 = minetest.dir_to_facedir(placer:get_look_dir())
-- 	local pos = pointed_thing.above
-- 	local na = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
-- 	if na.name == "air" then
-- 		minetest.set_node(pos,{name = "my_sliding_doors:jpanel"..num, param2 = p2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name = "my_sliding_doors:jpanel_top"..num, param2 = p2})
-- 	else
-- 		return
-- 	end
-- 	end,
-- 	on_destruct = function(pos)
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
-- 	end,
-- })
-- minetest.register_node("my_sliding_doors:jpanel_top"..num, {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_top.png",
-- 		"myjdoors_door"..num.."a_top.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	drop = "",
-- 	groups = {cracky = 3},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0.375, -0.5, -0.0625, 0.5, 0.5, 0.0625},
-- 			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
-- 			{-0.5, 0.5, -0.0625, 0.5, 0.375, 0.0625},
-- 			{-0.4375, -0.5, 0, 0.4375, 0.5, 0.02},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0}
-- 		}
-- 	},
-- })
-- minetest.register_node("my_sliding_doors:jpanel_corner_"..num, {
-- 	description = des.." Panel Corner",
-- 	inventory_image = "myjdoors_panel"..num.."_corner_inv.png",
-- 	wield_image = "myjdoors_panel"..num.."_corner_inv.png",
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_bottom.png",
-- 		"myjdoors_door"..num.."a_bottom.png",
-- 		"myjdoors_door"..num.."a_bottom.png",
-- 		"myjdoors_door"..num.."a_bottom.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 3},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.0625, -0.5, -0.5, 0.0625001, 0.5, -0.375},
-- 			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
-- 			{-0.5, -0.5, -0.0625, 0.0624999, -0.375, 0.0625},
-- 			{-0.5, -0.5, 0, 0, 0.5, 0.02},
-- 			{-0.0625, -0.5, -0.5, 0.0625, -0.375, 0.0625},
-- 			{0.02, -0.5, -0.5, 0, 0.5, 0},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.0625, -0.5, -0.5, 0.0625, 1.5, 0},
-- 			{-0.5, -0.5, -0.0625, 0, 1.5, 0.0625},
-- 		}
-- 	},
-- 	on_place = function(itemstack, placer, pointed_thing)
-- 	local p2 = minetest.dir_to_facedir(placer:get_look_dir())
-- 	local pos = pointed_thing.above
-- 	local na = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
-- 	if na.name == "air" then
-- 		minetest.set_node(pos,{name = "my_sliding_doors:jpanel_corner_"..num, param2 = p2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name = "my_sliding_doors:jpanel_corner_top"..num, param2 = p2})
-- 	else
-- 		return
-- 	end
-- 	end,
-- 	on_destruct = function(pos)
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
-- 	end,
-- })
-- minetest.register_node("my_sliding_doors:jpanel_corner_top"..num, {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_top.png",
-- 		"myjdoors_door"..num.."a_top.png",
-- 		"myjdoors_door"..num.."a_top.png",
-- 		"myjdoors_door"..num.."a_top.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	drop = "",
-- 	groups = {cracky = 3},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.0625, -0.5, -0.5, 0.0625001, 0.5, -0.375},
-- 			{-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625},
-- 			{-0.5, 0.375, -0.0625, 0.0625, 0.5, 0.0625},
-- 			{-0.5, -0.5, 0, 0, 0.5, 0.02},
-- 			{-0.0625, 0.375, -0.5, 0.0625, 0.5, 0.0625},
-- 			{0.02, -0.5, -0.5, 0, 0.5, 0},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0}
-- 		}
-- 	},
-- })
-- end
--
--
--
--
--
--
--
--
-- local doors = {
-- 	{"my_sliding_doors:door1a","my_sliding_doors:door1b","my_sliding_doors:door1c","my_sliding_doors:door1d","1","White Right"},
-- 	{"my_sliding_doors:door2a","my_sliding_doors:door2b","my_sliding_doors:door2c","my_sliding_doors:door2d","2","Flower Right"},
-- 	{"my_sliding_doors:door3a","my_sliding_doors:door3b","my_sliding_doors:door3c","my_sliding_doors:door3d","3","Framed Right"},
-- 	}
-- for i in ipairs (doors) do
-- local doora = doors[i][1]
-- local doorb = doors[i][2]
-- local doorc = doors[i][3]
-- local doord = doors[i][4]
-- local num = doors[i][5]
-- --local des = doors[i][6]
--
-- function onplace(itemstack, placer, pointed_thing)
-- 	local pos1 = pointed_thing.above
-- 	local pos2 = {x=pos1.x, y=pos1.y + 1, z=pos1.z}
-- 	if
-- 			not minetest.registered_nodes[minetest.get_node(pos1).name].buildable_to or
-- 			not minetest.registered_nodes[minetest.get_node(pos2).name].buildable_to or
-- 			not placer or not placer:is_player() then
-- 		return
-- 	end
--
-- 	local pt = pointed_thing.above
-- 	local pt2 = {x=pt.x, y=pt.y, z=pt.z}
-- 		pt2.y = pt2.y+1
-- 	local p2 = minetest.dir_to_facedir(placer:get_look_dir())
-- 	local pt3 = {x=pt.x, y=pt.y, z=pt.z}
-- 	if p2 == 0 then
-- 		pt3.x = pt3.x-1
-- 	elseif p2 == 1 then
-- 		pt3.z = pt3.z+1
-- 	elseif p2 == 2 then
-- 		pt3.x = pt3.x+1
-- 	elseif p2 == 3 then
-- 		pt3.z = pt3.z-1
-- 	end
-- 	if minetest.get_node(pt3).name ~= "air" then
-- 		minetest.chat_send_player(placer:get_player_name(),"Not enough room")
-- 		return
-- 	end
-- 	if minetest.get_node(pt3).name == doora then
-- 		minetest.set_node(pt, {name=doora.."2", param2=p2})
-- 		minetest.set_node(pt2, {name=doorb.."2", param2=p2})
-- 	else
-- 		minetest.set_node(pt, {name=doora.."2", param2=p2})
-- 		minetest.set_node(pt2, {name=doorb.."2", param2=p2})
-- 	end
-- end
--
-- function afterdestruct(pos, oldnode)
-- 	minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name="air"})
-- end
--
-- function rightclick(pos, node, player, itemstack, pointed_thing)
-- 	local a = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1})
-- 	local b = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1})
-- 	local c = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z})
-- 	local d = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z})
--
-- 	if node.name == doora.."2" then
-- 		minetest.set_node(pos, {name=doorc.."2", param2=node.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=node.param2})
-- 	elseif node.name == doorc.."2" then
-- 		minetest.set_node(pos, {name=doora.."2", param2=node.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=node.param2})
-- 	end
--
-- 	if a.name == doora then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doorc, param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doord, param2=a.param2})
-- 	end
-- 	if b.name == doora then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doorc, param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doord, param2=b.param2})
-- 	end
-- 	if c.name == doora then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doorc, param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doord, param2=c.param2})
-- 	end
-- 	if d.name == doora then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doorc, param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doord, param2=d.param2})
-- 	end
--
-- 	if a.name == doora.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doorc.."2", param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doord.."2", param2=a.param2})
-- 	end
-- 	if b.name == doora.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doorc.."2", param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doord.."2", param2=b.param2})
-- 	end
-- 	if c.name == doora.."2" then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doorc.."2", param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=c.param2})
-- 	end
-- 	if d.name == doora.."2" then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doorc.."2", param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doord.."2", param2=d.param2})
-- 	end
-- 	if a.name == doorc then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doora, param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doorb, param2=a.param2})
-- 	end
-- 	if b.name == doorc then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doora, param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doorb, param2=b.param2})
-- 	end
-- 	if c.name == doorc then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doora, param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doorb, param2=c.param2})
-- 	end
-- 	if d.name == doorc then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doora, param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doorb, param2=d.param2})
-- 	end
--
-- 	if a.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name=doora.."2", param2=a.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name=doorb.."2", param2=a.param2})
-- 	end
-- 	if b.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name=doora.."2", param2=b.param2})
-- 		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name=doorb.."2", param2=b.param2})
-- 	end
-- 	if c.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name=doora.."2", param2=c.param2})
-- 		minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=c.param2})
-- 	end
-- 	if d.name == doorc.."2" then
-- 		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name=doora.."2", param2=d.param2})
-- 		minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name=doorb.."2", param2=d.param2})
-- 	end
--
-- end
--
-- function afterplace(pos, placer, itemstack, pointed_thing)
-- 	   minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name=doord,param2=nodeu.param2})
-- end
--
--
-- minetest.register_node(doora.."2", {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_bottom.png^[transformFX",
-- 		"myjdoors_door"..num.."a_bottom.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	drop = doora,
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 3},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0.375, -0.5, -0.1875, 0.5, 0.5, -0.0625},
-- 			{-0.5, -0.5, -0.1875, -0.375, 0.5, -0.0625},
--
-- 			{-0.5, -0.5, -0.1875, 0.5, -0.375, -0.0625},
-- 			{-0.5, -0.5, -0.125, 0.5, 0.5, -0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {type = "fixed",fixed = {{-1.5, -0.5, -0.0625, -0.5, 1.5, 0.0625},{-0.5, -0.5, -0.0625, 0.5, 1.5, -0.1875}}},
--
-- on_place = onplace,
--
-- after_destruct = afterdestruct,
--
-- on_rightclick = rightclick,
-- })
-- minetest.register_node(doorb.."2", {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_top.png^[transformFX",
-- 		"myjdoors_door"..num.."a_top.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0.375, -0.5, -0.1875, 0.5, 0.5, -0.0625},
-- 			{-0.5, -0.5, -0.1875, -0.375, 0.5, -0.0625},
--
-- 			{-0.5, 0.5, -0.1875, 0.5, 0.375, -0.0625},
-- 			{-0.5, -0.5, -0.125, 0.5, 0.5, -0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		0.5,	-0.0625,	-0.5,   0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0},
-- 		}
-- 	},
-- })minetest.register_node(doorc.."2", {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_bottom.png^[transformFX",
-- 		"myjdoors_door"..num.."a_bottom.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	drop = doora,
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.625, -0.5, -0.1875, -0.5, 0.5, -0.0625},
-- 			{-1.5, -0.5, -0.1875, -1.375, 0.5, -0.0625},
--
-- 			{-1.5, -0.5, -0.1875, -0.5, -0.375, -0.0625},
-- 			{-1.5, -0.5, -0.125, -0.5, 0.5, -0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		-0.5,	-0.0625,	-0.5,   -0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-1.5, -0.5, 0.0625, -0.5, 1.5, -0.1875}
-- 		}
-- 	},
-- after_place_node = afterplace,
-- after_destruct = afterdestruct,
-- on_rightclick = rightclick,
-- })
-- minetest.register_node(doord.."2", {
-- 	tiles = {
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_edge.png",
-- 		"myjdoors_door"..num.."a_top.png^[transformFX",
-- 		"myjdoors_door"..num.."a_top.png"
-- 	},
-- 	drawtype = "nodebox",
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	sunlight_propagates = true,
-- 	groups = {cracky = 1},
-- 	node_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{-0.625, -0.5, -0.1875, -0.5, 0.5, -0.0625},
-- 			{-1.5, -0.5, -0.1875, -1.375, 0.5, -0.0625},
--
-- 			{-1.5, 0.5, -0.1875, -0.5, 0.375, -0.0625},
-- 			{-1.5, -0.5, -0.125, -0.5, 0.5, -0.145},
--
-- 			{-0.625,	-0.5,	-0.0625,	 -0.5,	 0.5,	0.0625},
-- 			{-1.5,		-0.5,	-0.0625,	-1.375,  0.5,	0.0625},
--
-- 			{-1.5,		0.5,	-0.0625,	-0.5,   0.375, 0.0625},
-- 			{-1.5,		-0.5,	 0,		-0.5,	 0.5,	0.02},
-- 		}
-- 	},
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {
-- 			{0, 0, 0, 0, 0, 0},
-- 		}
-- 	},
-- })
-- end
