local players = {}

minetest.register_node("walking_light:light", {
    drawtype = "glasslike",
    tiles = {"walking_light.png"},
    inventory_image = minetest.inventorycube("walking_light.png"),
    paramtype = "light",
    walkable = false,
    is_ground_content = true,
    sunlight_propagates = true,
    light_source = 13,
    selection_box = {
        type = "fixed",
        fixed = {0, 0, 0, 0, 0, 0},
    },

    on_place = function(itemstack, placer, pointed_thing)
        minetest.item_place(itemstack, placer, pointed_thing)

        minetest.get_node_timer(pointed_thing.under):start(3)
    end,

    on_timer = function(pos, dtime)
        local has_owner = false
        for k,v in pairs(players) do
            if v["current_pos"] == pos then
                has_owner = true
            end
        end

        if not has_owner then
            minetest.remove_node(pos)
        end
    end
})

minetest.register_on_joinplayer(
    function(player)
        players[player:get_player_name()] = {}
        players[player:get_player_name()]["old_pos"] = {}
        players[player:get_player_name()]["current_pos"] = {}
    end
)

minetest.register_on_leaveplayer(
    function(player)
        players[player:get_player_name()] = nil
    end
)

minetest.register_globalstep(function(dtime)
    for k,v in pairs(players) do
        if minetest.get_player_by_name(k):get_wielded_item():get_definition().name == "default:torch" then
            v["current_pos"] = vector.round(minetest.get_player_by_name(k):get_pos())
            v["current_pos"]["y"] = v["current_pos"]["y"] + 2

            if v["old_pos"]["x"] ~= v["current_pos"]["x"] or v["old_pos"]["y"] ~= v["current_pos"]["y"] or v["old_pos"]["z"] ~= v["current_pos"]["z"] then
                if v["old_pos"]["y"] ~= nil  then
                    v["old_pos"]["y"] = v["old_pos"]["y"] - 1 -- For some reason the placed block "placing position" and "removing position" isn't the same...
                    minetest.remove_node(v["old_pos"])
                    v["old_pos"]["y"] = v["old_pos"]["y"] + 1
                end
                minetest.place_node(v["current_pos"], {name="walking_light:light"})
                v["old_pos"] = v["current_pos"]
            end
        else
            if v["old_pos"]["y"] ~= nil  then
                v["old_pos"]["y"] = v["old_pos"]["y"] - 1 -- For some reason the placed block "placing position" and "removing position" isn't the same...
                minetest.remove_node(v["old_pos"])
            end
            v["current_pos"] = {}
            v["old_pos"] = {}
        end
    end
end)
