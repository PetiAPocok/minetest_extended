fun_altar_games = {}

local mp = minetest.get_modpath("fun_altars")
dofile(mp .. "/talos_puzzle.lua")

local function get_fun_altar_formspec(game, power)
    local game_description = ItemStack({name = game}):get_description()
    return "size[3,3]"..
    "label[1,-0.1;Fun Altar]"..
    "label[0.4,1;Game in:]"..
    "button[0,1.5;2,1;play;".. game_description .."]"..
    "label[2.3,2.7;Power]"..
    "image[2.4,0.4;0.5,2.5;fun_altars_pw_bg.png^[lowpart:"..
    power ..":fun_altars_pw_fg.png]"..
    ""
end

minetest.register_node("fun_altars:fun_altar_off", {
    description = "Fun Altar",
    drawtype = "mesh",
    mesh = "fun_altars_altar.obj",
    tiles = {"fun_altars_altar_off.png"},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.38, -0.5, -0.38, 0.38, 0.72, 0.38},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.38, -0.5, -0.38, 0.38, 0.72, 0.38},
        },
    },
    paramtype2 = "facedir",
    groups = {cracky = 3},

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if itemstack:get_name() == "default:mese" then
            local meta = minetest.get_meta(pos)

            itemstack:take_item()
            minetest.swap_node(pos, {name = "fun_altars:fun_altar_on", param2 = node.param2})
            meta:set_int("power", 100)
        end
    end,
})

minetest.register_node("fun_altars:fun_altar_on", {
    description = "Fun Altar",
    drawtype = "mesh",
    mesh = "fun_altars_altar.obj",
    tiles = {"fun_altars_altar_on.png"},
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.38, -0.5, -0.38, 0.38, 0.72, 0.38},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.38, -0.5, -0.38, 0.38, 0.72, 0.38},
        },
    },
    paramtype2 = "facedir",
    groups = {cracky = 3, not_in_creative_inventory = 1},
    drop = "fun_altars:fun_altar_off",

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)

        if minetest.get_item_group(itemstack:get_name(), "fun_altar_game") == 1 and meta:get_string("game") == "" then
            meta:set_string("game", itemstack:get_name())
            itemstack:take_item()
        else
            minetest.show_formspec(clicker:get_player_name(), "fun_altar_gui", get_fun_altar_formspec(meta:get_string("game"), meta:get_int("power")))
            meta:set_int("power", meta:get_int("power") - 1)
            if meta:get_int("power") <= 0 then
                minetest.swap_node(pos, {name = "fun_altars:fun_altar_off", param2 = node.param2})
            end
        end
    end,

    on_punch = function(pos, node, puncher, pointed_thing)
        local meta = minetest.get_meta(pos)

        if puncher:is_player() and meta:get_string("game") ~= "" then
            if puncher:get_inventory():room_for_item("main", meta:get_string("game")) then
                puncher:get_inventory():add_item("main", meta:get_string("game"))
            else
                local pos_to_drop = table.copy(pos)
                pos_to_drop.y = pos_to_drop.y + 2
                minetest.add_item(pos_to_drop, meta:get_string("game"))
            end

            meta:set_string("game", "")
        end
    end,

    on_destruct = function(pos)
        local meta = minetest.get_meta(pos)
        minetest.add_item(pos, meta:get_string("game"))
    end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "fun_altar_gui" then
        if fields then
            local player_name = player:get_player_name()

            if fields.play then
                if fields.play == "Talos Puzzle" then
                    fun_altar_games.play_talos_puzzle()
                else
                    minetest.chat_send_player(player_name, "No game in fun altar")
                end
            end
        end
    end
end)
