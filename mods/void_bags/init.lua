local mod_storage = minetest.get_mod_storage()

local function inv_to_table(inv)
	local t = {}
	for listname, list in pairs(inv:get_lists()) do
		local size = inv:get_size(listname)
		if size then
			t[listname] = {}
			for i = 1, size, 1 do
				t[listname][i] = inv:get_stack(listname, i):to_table()
			end
		end
	end
	return t
end

local function table_to_inv(inv, t)
	for listname, list in pairs(t) do
		for i, stack in pairs(list) do
			inv:set_stack(listname, i, stack)
		end
	end
end

local function save_bag_inv_itemstack(inv, stack)
	local meta = stack:get_meta()
	meta:set_string("void_bags_inv_content", minetest.serialize(inv_to_table(inv)))
	return stack
end

local function save_bag_inv(inv, player)
	local playerinv = minetest.get_inventory{type="player", name=player:get_player_name()}
	local bag_id = inv:get_location().name
	local listname = "main"
	local size = playerinv:get_size(listname)
	for i = 1, size, 1 do
		local stack = playerinv:get_stack(listname, i)
		local meta = stack:get_meta()
		if meta:get_string("void_bags_bag_identity") == bag_id then
			stack = save_bag_inv_itemstack(inv, stack)
			playerinv:set_stack(listname, i, stack)
		end
	end
end

local function create_invname(itemstack)
	local counter = mod_storage:get_int("counter", value) or 0
	counter = counter + 1
	mod_storage:set_int("counter", counter)
	return itemstack:get_name().."_C_"..counter
end

local function get_formspec(name, width, height)
	local sizewidth = 8
	local txpos = (sizewidth-width)/2
	if width >= 8 then
		sizewidth = width
		txpos = 0
	end
	local bag_formspec =
		"size[".. sizewidth ..",".. height+5 .."]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"list[detached:"..name..";main;".. txpos ..",0;".. width ..",".. height ..";]"..
		"list[current_player;main;".. (sizewidth-8)/2 ..",".. height+0.85 ..";8,1;]" ..
		"list[current_player;main;".. (sizewidth-8)/2 ..",".. height+2.08 ..";8,3;8]" ..
		"listring[detached:"..name..";main]"..
		"listring[current_player;main]" ..
		default.get_hotbar_bg((sizewidth-8)/2,height+0.85)
	return bag_formspec
end

minetest.register_craftitem("void_bags:bag", {
    description = "Void Bag",
    inventory_image = "void_bags_bag.png",

	on_use = function(itemstack, user, pointed_thing)
        local allow_bag_input = false
        if minetest.get_item_group(itemstack:get_name(), "bag_bag") > 0 then
            allow_bag_input = true
        end
        local meta = itemstack:get_meta()
        local playername = user:get_player_name()
        local invname = meta:get_string("void_bags_bag_identity")

        -- bag identity
        if invname == "" then
            local item_count = itemstack:get_count()

            if item_count > 1 then
                local newitemstack = itemstack:take_item(item_count-1)
                minetest.after(0.01,
                    function(stack, player)
                    	local payerinv = player:get_inventory()

                    	if payerinv:room_for_item("main", stack) then
                    		payerinv:add_item("main", stack)
                    	else
                    		minetest.item_drop(stack, player, player:get_pos())
                    	end
                    end,
                newitemstack,
                user)
            end

            invname = create_invname(itemstack)

            meta:set_string("void_bags_bag_identity", invname)
        end

        meta:set_int("void_bags_width", 8)
        meta:set_int("void_bags_height", 4)

        local inv = minetest.create_detached_inventory(invname, {
            allow_put = function(inv, listname, index, stack, player)
                if allow_bag_input then
                    if minetest.get_item_group(stack:get_name(), "bag_bag") > 0 then
                        return 0
                    end
                else
                    if minetest.get_item_group(stack:get_name(), "bag") > 0 then
                        return 0
                    end
                end
                return stack:get_count()
            end,

            on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
                save_bag_inv(inv, player)
            end,

            on_put = function(inv, listname, index, stack, player)
                save_bag_inv(inv, player)
            end,

            on_take = function(inv, listname, index, stack, player)
                -- fix swap bug
                local size = inv:get_size(listname)
                for i = 1, size, 1 do
                    local stack = inv:get_stack(listname, i)
                    local remove_stack = false
                    if allow_bag_input then
                        if minetest.get_item_group(stack:get_name(), "bag_bag") > 0 then
                            remove_stack = true
                        end
                    else
                        if minetest.get_item_group(stack:get_name(), "bag") > 0 then
                            remove_stack = true
                        end
                    end
                    if remove_stack == true then
                        inv:set_stack(listname, i, "")
                        local playerinv = player:get_inventory()
                        if playerinv:room_for_item("main", stack) then
                            playerinv:add_item("main", stack)
                        else
                            minetest.item_drop(save_bag_inv_itemstack(inv, stack), player, player:get_pos())
                            minetest.close_formspec(player:get_player_name(), inv:get_location().name)
                        end
                    end
                end
                save_bag_inv(inv, player)
            end,
        }, playername)

        inv:set_size("main", 32)
        local invmetastring = meta:get_string("void_bags_inv_content")
        if invmetastring ~= "" then
            table_to_inv(inv, minetest.deserialize(invmetastring))

            save_bag_inv_itemstack(inv, itemstack)
        end

        minetest.sound_play("void_bags_bag", {gain = 0.8, object = user, max_hear_distance = 5})
        minetest.show_formspec(playername, invname, get_formspec(invname, 8, 4))
        return itemstack
    end
})

minetest.register_craft({
	output = "void_bags:bag",
	recipe = {
		{"gems_topaz:topaz", "gems_topaz:topaz", "gems_topaz:topaz"},
		{"gems_topaz:topaz", "default:mese_crystal", "gems_topaz:topaz"},
		{"gems_topaz:topaz", "gems_topaz:topaz", "gems_topaz:topaz"},
	}
})
