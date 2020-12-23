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

            while length > 0 and not placed do
                if minetest.get_node(pos).name == "air" then
                    minetest.set_node(pos, {name = "mex_moreblocks:rope"})
                    placed = true
                end
                pos.y = pos.y - 1
                length = length - 1
            end
        else
            minetest.set_node(pointed_thing.above, {name = "mex_moreblocks:rope"})
        end
        return itemstack
    end,
})
