local ms = minetest.get_mod_storage()
local accesories_detached_inventories = {}

local function save_inventories()
    minetest.log(dump(accesories_detached_inventories))
end

local function manage_effects(event, player, item_stack)
    local item_name = item_stack:get_name()

    if item_name == "binoculars:binoculars" then
        if event == "put" then
            if player:get_properties().zoom_fov ~= 10 then
                player:set_properties({zoom_fov = 10})
            end
        elseif event == "take" then
            if player:get_properties().zoom_fov ~= 0 then
                player:set_properties({zoom_fov = 0})
            end
        end
    end
end

minetest.register_on_joinplayer(function(player, last_login)
    local player_name = player:get_player_name()

    table.insert(accesories_detached_inventories,
        minetest.create_detached_inventory("accesories_" .. player_name, {
            on_put = function(inv, listname, index, stack, player)
                save_inventories()
                manage_effects("put", player, stack)
            end,

            on_take = function(inv, listname, index, stack, player)
                save_inventories()
                manage_effects("take", player, stack)
            end,

            on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
                save_inventories()
            end,

            allow_put = function(inv, listname, index, put_stack, player)
                if listname == "left" then
                    if index == 2 then
                        if minetest.get_item_group(put_stack:get_name(), "earring") == 1 then
                            return 1
                        end
                    elseif index == 4 then
                        if minetest.get_item_group(put_stack:get_name(), "braclet") == 1 then
                            return 1
                        end
                    elseif index == 6 or index == 8 then
                        if minetest.get_item_group(put_stack:get_name(), "ring") == 1 then
                            return 1
                        end
                    else
                        if minetest.get_item_group(put_stack:get_name(), "pocket") == 1 then
                            return 1
                        end
                    end
                elseif listname == "familiar" then
                    if minetest.get_item_group(put_stack:get_name(), "familiar") == 1 then
                        return 1
                    end
                elseif listname == "neck" then
                    if minetest.get_item_group(put_stack:get_name(), "necklace") == 1 then
                        return 1
                    end
                elseif listname == "back" then
                    if minetest.get_item_group(put_stack:get_name(), "back") == 1 then
                        return 1
                    end
                elseif listname == "right" then
                    if index == 1 then
                        if minetest.get_item_group(put_stack:get_name(), "earring") == 1 then
                            return 1
                        end
                    elseif index == 3 then
                        if minetest.get_item_group(put_stack:get_name(), "braclet") == 1 then
                            return 1
                        end
                    elseif index == 5 or index == 7 then
                        if minetest.get_item_group(put_stack:get_name(), "ring") == 1 then
                            return 1
                        end
                    else
                        if minetest.get_item_group(put_stack:get_name(), "pocket") == 1 then
                            return 1
                        end
                    end
                end
                return 0
            end,

            allow_take = function(inv, listname, index, stack, player)
                return 1
            end,

            allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
                if ((from_list == "left" and from_index % 2 == 1) or
                    (from_list == "right" and from_index % 2 == 0)) and
                    ((to_list == "left" and to_index % 2 == 1) or
                    (to_list == "right" and to_index % 2 == 0)) then
                        return 1
                elseif ((from_list == "left" and from_index == 2) or
                    (from_list == "right" and from_index == 1)) and
                    ((to_list == "right" and to_index == 1) or
                    (to_list == "left" and to_index == 2)) then
                        return 1
                elseif ((from_list == "left" and from_index == 4) or
                    (from_list == "right" and from_index == 3)) and
                    ((to_list == "right" and to_index == 3) or
                    (to_list == "left" and to_index == 4)) then
                        return 1
                elseif ((from_list == "left" and (from_index == 6 or from_index == 8)) or
                    (from_list == "right" and (from_index == 5 or from_index == 7))) and
                    ((to_list == "right" and (to_index == 5 or to_index == 7)) or
                    (to_list == "left" and (to_index == 6 or to_index == 8))) then
                        return 1
                end
                return 0
            end,
        }, player_name)
    )

    accesories_detached_inventories[#accesories_detached_inventories]:set_size("left", 8)
    accesories_detached_inventories[#accesories_detached_inventories]:set_size("familiar", 1)
    accesories_detached_inventories[#accesories_detached_inventories]:set_size("neck", 1)
    accesories_detached_inventories[#accesories_detached_inventories]:set_size("back", 1)
    accesories_detached_inventories[#accesories_detached_inventories]:set_size("right", 8)
end)


local function get_formspec(player_name)
    return ""..
    "list[detached:accesories_" .. player_name .. ";left;0,0.5;2,4;]"..
    "list[detached:accesories_" .. player_name .. ";familiar;2.25,1.5;1,1;]"..
    "list[detached:accesories_" .. player_name .. ";neck;3.5,0.5;1,1;]"..
    "list[detached:accesories_" .. player_name .. ";back;4.75,1.5;1,1;]"..
    "list[detached:accesories_" .. player_name .. ";right;6,0.5;2,4;]"..
    "image[1,1.5;1,1;accessories_braclet_gold.png^[opacity:128]"..
    "image[6,1.5;1,1;accessories_braclet_gold.png^[opacity:128]"..
    "image[1,0.5;1,1;accessories_earring_gold.png^[opacity:128]"..
    "image[6,0.5;1,1;accessories_earring_gold.png^[opacity:128]"..
    "image[2.25,1.5;1,1;accessories_familiar_voodoo_doll.png^[opacity:128]"..
    "image[3.5,0.5;1,1;accessories_necklace_gold.png^[opacity:128]"..
    "image[1,2.5;1,1;accessories_ring_gold.png^[opacity:128]"..
    "image[1,3.5;1,1;accessories_ring_gold.png^[opacity:128]"..
    "image[6,2.5;1,1;accessories_ring_gold.png^[opacity:128]"..
    "image[6,3.5;1,1;accessories_ring_gold.png^[opacity:128]"..
    "image[4.75,1.5;1,1;accessories_wing_angel.png^[opacity:128]"..
    "list[current_player;main;0,5.20;8,1;]"..
    "list[current_player;main;0,6.35;8,3;8]"..
    "listring[current_player;main]"..
    "listring[detached:accesories_" .. player_name .. ";neck]"..
    "listring[current_player;main]"..
    "listring[detached:accesories_" .. player_name .. ";left]"..
    "listring[current_player;main]"..
    "listring[detached:accesories_" .. player_name .. ";familiar]"..
    "listring[current_player;main]"..
    "listring[detached:accesories_" .. player_name .. ";back]"..
    "listring[current_player;main]"..
    "listring[detached:accesories_" .. player_name .. ";right]"..
    "listring[current_player;main]"..
    default.get_hotbar_bg(0, 5.20)
end

sfinv.register_page("accesories:accesories", {
    title = "Accesories",
    get = function(self, player, context)
        local player_name = player:get_player_name()
        return sfinv.make_formspec(player, context, get_formspec(player_name), false)
    end
})

local modpath = minetest.get_modpath("accessories")
dofile(modpath .. "/items.lua")
