minetest.register_node("mex_moreblocks:gong", {
    description = "Gong",
    drawtype = "mesh",
    mesh = "mex_moreblocks_gong.obj",
    tiles = {"mex_moreblocks_gong.png"},
    selection_box = {
           type = "fixed",
           fixed = {
               {-0.1, -0.5, -0.5, 0.1, 0.4, 0.5},
           },
       },
    inventory_image = 'mex_moreblocks_gong.png',
    wield_image = 'mex_moreblocks_gong.png',
    groups = {oddly_breakable_by_hand = 1},

    on_punch = function (pos, node, puncher)
        local owner = minetest.get_meta(pos):get_string("owner")
        minetest.sound_play( "mex_moreblocks_gong",
            {pos = pos, gain = 1.5, max_hear_distance = 50})
        if owner then
            minetest.chat_send_player(owner, puncher:get_player_name() .. " has rung your gong!")
        else
            minetest.chat_send_all(puncher:get_player_name() .. " has rung the gong at " .. dump(pos) .. "!")
        end
	end,

    after_place_node = function(pos, placer, itemstack, pointed_thing)
        minetest.get_meta(pos):set_string("owner", placer:get_player_name())
    end,
})

minetest.register_craft({
	output = "mex_moreblocks:gong",
	recipe = {
		{"default:stick", "default:stick", "default:stick" },
		{"default:stick", "default:gold_ingot", "default:stick"},
		{"default:stick", "", "default:stick"},
	},
})
