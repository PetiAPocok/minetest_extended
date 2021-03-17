local placed = mex_chariot_ms:get_string("placed")
local schematic_path =  minetest.get_modpath(minetest.get_current_modname()) .. "/schematics/chariot_interior.mts"

minetest.register_node("mex_chariot:chariot_node", {
    description = "Chariot Node",
    drawtype = "mesh",
    mesh = "mex_chariot.obj",
    tiles = {"mex_chariot.png"},
    groups = {not_in_creative_inventory = 1},
    diggable = false,
    walakable = true,
    selection_box = {
        type = "fixed",
        fixed = {
            {-1.5, -0.5, -1.5, 1.5, 2.5, 1.5},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-1.5, -0.5, -1.5, 1.5, 2.5, 1.5},
        },
    },

    on_construct = function(pos)
        if placed ~= "true" then
            --minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
            minetest.place_schematic({x=0, y=20000, z=0}, schematic_path, "0", nil, true)

            local generator_positions = {
                {x=0, y=20002, z=5},
                {x=0, y=20002, z=9},
            }
            for i,v in ipairs(generator_positions) do
                minetest.set_node(v, {name = "mex_chariot:generator"})
            end

            local lamp_positions = {
                {x=7, y=20004, z=1},
                {x=1, y=20004, z=7},
                {x=13, y=20004, z=7},
                {x=7, y=20004, z=13},
                {x=10, y=20005, z=4},
                {x=4, y=20005, z=4},
                {x=4, y=20005, z=10},
                {x=10, y=20005, z=10},
                {x=9, y=20006, z=7},
                {x=7, y=20006, z=5},
                {x=5, y=20006, z=7},
                {x=7, y=20006, z=9},
            }

            for i,v in ipairs(lamp_positions) do
                minetest.set_node(v, {name = "mesecons_lightstone:lightstone_white_on"})
            end
        end
    end,

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if mex_chariot_ms:get_string("brake") == "Pulled" then
            if mex_chariot_ms:get_string("lock") == "Locked" then
                if clicker:get_player_name() == mex_chariot_ms:get_string("owner") or
                   itemstack:get_name() == "mex_chariot:key" then
                       clicker:set_pos({x=1, y=20001, z=7})
                else
                    minetest.chat_send_player(clicker:get_player_name(), "Locked chariot. Use key to enter.")
                end
            else
                clicker:set_pos({x=1, y=20001, z=7})
            end
        else
            minetest.chat_send_player(clicker:get_player_name(), "Chariot in motion. Pull break.")
        end
    end,

    on_timer = function(pos, elapsed)
        local particle_pos = table.copy(pos)
        particle_pos.x = particle_pos.x + math.random(-3, 3)
        particle_pos.y = particle_pos.y + math.random(-3, 3)
        particle_pos.z = particle_pos.z + math.random(-3, 3)

        minetest.add_particle({
            pos = particle_pos,
            velocity = {x=0, y=4, z=0},
            acceleration = {x=0, y=0, z=0},
            expirationtime = 5,
            size = 5,
            texture = "orb_of_shadow_particle.png",
            glow = 3
        })
        return true -- for repeat
    end,
})

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name ~= "singlenode" then
    minetest.register_on_generated(function(minp, maxp, seed)
        if placed ~= "true" and minp.y <= -5100 and
           minp.x <= 42 and maxp.x >= 42 and
           minp.z <= 42 and maxp.z >= 42 then
            local pos = {x=42, y=-5420, z=42}
            for i=-4,4 do
                for j=-4,4 do
                    for k=-4,4 do
                        pos.x = pos.x + i
                        pos.y = pos.y + j
                        pos.z = pos.z + k
                        minetest.set_node(pos, {name = "air"})
                        pos.x = pos.x - i
                        pos.y = pos.y - j
                        pos.z = pos.z - k
                    end
                end
            end
            minetest.set_node(pos, {name = "mex_chariot:chariot_node"})
            mex_chariot_ms:set_string("chariot_pos", minetest.serialize(pos))
            placed = "true"
            mex_chariot_ms:set_string("placed", "true")
            mex_chariot_ms:set_string("brake", "Pulled")
        end
    end)
end
