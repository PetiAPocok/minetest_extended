minetest.register_node("mex_moreblocks:rope", {
	description = "Rope",
    drawtype = "mesh",
    mesh = "mex_moreblocks_rope.obj",
    tiles = {"mex_moreblocks_rope.png"},
    selection_box = {
           type = "fixed",
           fixed = {
               {-0.1, -0.5, -0.1, 0.1, 0.5, 0.1},
           },
       },
	paramtype = "light",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},

    on_place = function(itemstack, placer, pointed_thing)
        if minetest.get_node(pointed_thing.under).name == "mex_moreblocks:rope" then
            local pos = pointed_thing.under
            pos.y = pos.y - 1
            local length = 10
            local placed = false
            local blocked = false

            while length > 0 and not placed and not blocked do
                local node_name = minetest.get_node(pos).name

                if node_name == "air" then
                    minetest.set_node(pos, {name = "mex_moreblocks:rope"})

                    if not minetest.is_creative_enabled(placer:get_player_name()) then
                        itemstack:take_item()
                    end

                    placed = true
                elseif node_name ~= "mex_moreblocks:rope" then
                    blocked = true
                end

                pos.y = pos.y - 1
                length = length - 1
            end
        elseif minetest.get_node(pointed_thing.above).name == "air" then
            minetest.set_node(pointed_thing.above, {name = "mex_moreblocks:rope"})

            if not minetest.is_creative_enabled(placer:get_player_name()) then
                itemstack:take_item()
            end
        end

        return itemstack
    end,
})

minetest.register_craft({
	output = "mex_moreblocks:rope",
	recipe = {
        {"farming:string", "farming:string"},
		{"farming:string", "farming:string"},
		{"farming:string", "farming:string"},
	},
})
