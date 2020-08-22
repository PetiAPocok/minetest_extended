local ms = minetest.get_mod_storage()
if not ms:contains("backpack_count") then
    ms:set_int("backpack_count", 0)
    minetest.log("info", "Created backpack_count variable...")
end

sfinv.register_page("backpack", {
    title = "Backpack",
    is_in_nav = function()
        return false
    end,
    get = function(self, player, context)
        return sfinv.make_formspec(player, context,
            "size[8,9]" ..
            "list[context;main;0,0.3;8,4;]" ..
            "listring[current_player;main]"..
            "listring[context;main]",
            true
        )
    end
})

local function find_bag(player)
    local pname = player:get_player_name()
    for i=1,6 do
        if minetest.get_inventory({type = "detached", name = pname .. "_armor"}):get_stack("armor", i):get_name() == "backpacks:backpack" then
            return i
        end
    end
end

minetest.register_tool("backpacks:backpack", {
    description = "Backpack",
    inventory_image = "backpacks_backpack_inv.png",
    stack_max = 1,
    armor_groups = {fleshy=0},
    groups = {armor_back=1, flammable=1},
    on_equip = function(player, inv_index, itemstack)
        local meta = itemstack:get_meta()
        local pname = player:get_player_name()
        local backpack_count = ms:get_int("backpack_count")
        -- minetest.chat_send_all(dump(meta))

        if meta:get_string("inv_name") == nil or meta:get_string("inv_name") == "" then
            local new_di = minetest.create_detached_inventory("backpack_" .. backpack_count, {
                on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
                    inv_index = find_bag(player)

                    meta:set_string(from_index, "")
                    meta:set_string(to_index, minetest.serialize(inv:get_stack("bag", to_index):to_table()))

                    minetest.get_inventory({type = "detached", name = pname .. "_armor"}):set_stack("armor", inv_index, itemstack)
                    armor:save_armor_inventory(player)
                end,
                on_put = function(inv, listname, index, stack, player)
                    inv_index = find_bag(player)

                    meta:set_string(index, minetest.serialize(stack:to_table()))
                    minetest.get_inventory({type = "detached", name = pname .. "_armor"}):set_stack("armor", inv_index, itemstack)
                    armor:save_armor_inventory(player)
                end,
                on_take = function(inv, listname, index, stack, player)
                    inv_index = find_bag(player)

                    meta:set_string(index, "")
                    minetest.get_inventory({type = "detached", name = pname .. "_armor"}):set_stack("armor", inv_index, itemstack)
                    armor:save_armor_inventory(player)
                end,
            })

            new_di:set_size("bag", 32)

            ms:set_int("backpack_count", backpack_count + 1)

            meta:set_string("inv_name", "backpack_" .. backpack_count)

            minetest.get_inventory({type = "detached", name = pname .. "_armor"}):set_stack("armor", inv_index, itemstack)

            sfinv.override_page("backpack", {
                is_in_nav = function()
                    return true
                end,
                get = function(self, player, context)
                    return sfinv.make_formspec(player, context,
                        "size[8,9]" ..
                        "list[detached:" .. meta:get_string("inv_name") .. ";bag;0,0.3;8,4;]" ..
                        "listring[current_player;main]"..
                        "listring[detached:" .. meta:get_string("inv_name") .. ";bag]",
                        true
                    )
                end
            })
        elseif minetest.get_inventory({type = "detached", name = meta:get_string("inv_name")}) == nil then
            local new_di = minetest.create_detached_inventory(meta:get_string("inv_name"), {
                on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
                    inv_index = find_bag(player)

                    meta:set_string(from_index, "")
                    meta:set_string(to_index, minetest.serialize(inv:get_stack("bag", to_index):to_table()))

                    minetest.get_inventory({type = "detached", name = pname .. "_armor"}):set_stack("armor", inv_index, itemstack)
                    armor:save_armor_inventory(player)
                end,
                on_put = function(inv, listname, index, stack, player)
                    inv_index = find_bag(player)

                    meta:set_string(index, minetest.serialize(stack:to_table()))
                    minetest.get_inventory({type = "detached", name = pname .. "_armor"}):set_stack("armor", inv_index, itemstack)
                    armor:save_armor_inventory(player)
                end,
                on_take = function(inv, listname, index, stack, player)
                    inv_index = find_bag(player)

                    meta:set_string(index, "")
                    minetest.get_inventory({type = "detached", name = pname .. "_armor"}):set_stack("armor", inv_index, itemstack)
                    armor:save_armor_inventory(player)
                end,
            })

            new_di:set_size("bag", 32)

            for i=1,32 do
                new_di:set_stack("bag", i,  minetest.deserialize(meta:get_string(i)))
            end

            sfinv.override_page("backpack", {
                is_in_nav = function()
                    return true
                end,
                get = function(self, player, context)
                    return sfinv.make_formspec(player, context,
                        "size[8,9]" ..
                        "list[detached:" .. meta:get_string("inv_name") .. ";bag;0,0.3;8,4;]" ..
                        "listring[current_player;main]"..
                        "listring[detached:" .. meta:get_string("inv_name") .. ";bag]",
                        true
                    )
                end
            })
        else
            sfinv.override_page("backpack", {
                is_in_nav = function()
                    return true
                end,
                get = function(self, player, context)
                    return sfinv.make_formspec(player, context,
                        "size[8,9]" ..
                        "list[detached:" .. meta:get_string("inv_name") .. ";bag;0,0.3;8,4;]" ..
                        "listring[current_player;main]"..
                        "listring[detached:" .. meta:get_string("inv_name") .. ";bag]",
                        true
                    )
                end
            })
        end
    end,
    on_unequip = function(player, inv_index, itemstack)
        sfinv.override_page("backpack", {
            is_in_nav = function()
                return false
            end
        })
    end,
})

minetest.register_craft({
	output = "backpacks:backpack",
	recipe = {
		{"farming:string", "mobs:leather", "farming:string"},
		{"farming:string", "mobs:leather", "farming:string"},
		{"farming:string", "mobs:leather", "farming:string"}
	}
})
