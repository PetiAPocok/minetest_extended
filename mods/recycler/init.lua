minetest.register_node("recycler:recycler", {
    description = "Recycler",
    tiles = {
		"recycler_top.png", "recycler_side.png",
		"recycler_side.png", "recycler_side.png",
		"recycler_side.png", "recycler_side.png"
	},
	paramtype2 = "facedir",
    groups = {cracky = 1},

    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec", "size[8,9]"..
            "list[context;input;1,1;3,3;]"..
            "list[context;output;5,2;1,1;]"..
    		"list[current_player;main;0,5.15;8,1;]"..
    		"list[current_player;main;0,6.25;8,3;8]"..
    		"listring[context;output]"..
    		"listring[current_player;main]"..
    		"listring[context;input]"..
    		"listring[current_player;main]"..
    		default.get_hotbar_bg(0, 5.15)
        )
        local inv = meta:get_inventory()
        inv:set_size("input", 3*3)
        inv:set_size("output", 1*1)
	end,

    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        if minetest.is_protected(pos, player:get_player_name()) then
    		return 0
    	end

    	if listname == "input" then
    		return stack:get_count()
    	else
    		return 0
    	end
    end,

    allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        if to_list == "input" then
            return count
        else
            return 0
        end
    end,

    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
    	if minetest.is_protected(pos, player:get_player_name()) then
    		return 0
    	end
    	return stack:get_count()
    end,

    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in recycler at " .. minetest.pos_to_string(pos))
	end,

	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" puts stuff to recycler at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()
        local trash_count = 0

        for i=1,9 do
            trash_count = trash_count + inv:get_stack("input", i):get_count()
        end

        if trash_count >= 33 then
            inv:set_stack("output", 1, "default:mese_crystal_fragment " .. math.floor(trash_count / 33))
        end
	end,

	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from recycler at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()


        if listname == "input" then
            local trash_count = 0

            for i=1,9 do
                trash_count = trash_count + inv:get_stack("input", i):get_count()
            end

            inv:set_stack("output", 1, "default:mese_crystal_fragment " .. math.floor(trash_count / 33))
        elseif listname == "output" then
            local trash_to_remove = stack:get_count() * 33

            for i=1,9 do
                if trash_to_remove > 0 then
                    local current_stack = inv:get_stack("input", i)
                    local current_stack_count = current_stack:get_count()

                    if current_stack_count > 0 then
                        current_stack:set_count(current_stack_count - trash_to_remove)
                        trash_to_remove = trash_to_remove - current_stack_count
                        inv:set_stack("input", i, current_stack)
                    end
                end
            end
        end
	end,

    on_destruct = function(pos)
        local drop = ""
        local temp = {}

        default.get_inventory_drops(pos, "input", temp)

        for i,v in ipairs(temp) do
            drop = v.name .. " " .. v.count
            minetest.add_item(pos, drop)
        end
    end
})

minetest.register_craft({
	output = "recycler:recycler",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:mese_crystal", "", "default:mese_crystal"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
	}
})
