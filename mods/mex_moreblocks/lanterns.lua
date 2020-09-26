minetest.register_node("mex_moreblocks:lantern_f", {
  description = "Lantern",
  drawtype = "mesh",
  mesh = "mex_moreblocks_lantern_f.obj",
  tiles = {"mex_moreblocks_lantern.png", "mex_moreblocks_metal_dark_32.png"},
  collision_box = {
    type = "fixed",
    fixed = {-3/16, -1/2, -3/16, 3/16, 1/16, 3/16}
  },
  selection_box = {
    type = "fixed",
    fixed = {-3/16, -1/2, -3/16, 3/16, 1/16, 3/16}
  },
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),

  on_place = function(itemstack, placer, pointed_thing)
		local wdir = minetest.dir_to_wallmounted(
      vector.subtract(pointed_thing.under, pointed_thing.above))
		local fakestack = itemstack

		if wdir == 0 then
			fakestack:set_name("mex_moreblocks:lantern_c")
		elseif wdir == 1 then
			fakestack:set_name("mex_moreblocks:lantern_f")
		else
			fakestack:set_name("mex_moreblocks:lantern_w")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("mex_moreblocks:lantern_f")

		return itemstack
	end,
})

minetest.register_node("mex_moreblocks:lantern_c", {
  drawtype = "mesh",
  mesh = "mex_moreblocks_lantern_c.obj",
  tiles = {"mex_moreblocks_lantern.png", "mex_moreblocks_metal_dark_32.png"},
  collision_box = {
    type = "fixed",
    fixed = {-3/16, -1/16, -3/16, 3/16, 1/2, 3/16}
  },
  selection_box = {
    type = "fixed",
    fixed = {-3/16, 0, -3/16, 3/16, 1/2, 3/16}
  },
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3,
    not_in_creative_inventory = 1},
  sounds = default.node_sound_glass_defaults(),
  drop = "mex_moreblocks:lantern_f",
})

minetest.register_node("mex_moreblocks:lantern_w", {
  drawtype = "mesh",
  mesh = "mex_moreblocks_lantern_w.obj",
  tiles = {"mex_moreblocks_lantern.png", "mex_moreblocks_metal_dark_32.png"},
  collision_box = {
    type = "fixed",
    fixed = {-3/16, -1/4, -5/16, 3/16, 1/8, 3/16}
  },
  selection_box = {
    type = "wallmounted",
    wall_bottom = {-3/16, -1/4, -5/16, 3/16, 1/8, 3/16},
    wall_side = {-1/4, -5/16, -3/16, 1/8, 3/16, 3/16},
    wall_top = {-3/16, -1/8, -5/16, 3/16, 1/4, 3/16}
  },
  paramtype = "light",
  paramtype2 = "wallmounted",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3,
    not_in_creative_inventory = 1},
  sounds = default.node_sound_glass_defaults(),
  drop = "mex_moreblocks:lantern_f",
})

minetest.register_craft({
  output = "mex_moreblocks:lantern_f",
  recipe = {
    {"", "default:steel_ingot", ""},
    {"xpanes:pane_flat", "default:torch", "xpanes:pane_flat"},
    {"", "default:steel_ingot", ""}
  }
})
