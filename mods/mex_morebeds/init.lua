minetest.register_node("mex_morebeds:npc_bed", {
    description = "NPC's Bed",
    drawtype = "mesh",
    mesh = "mex_morebeds_npc_bed.obj",
    tiles = {"mex_morebeds_npc_bed.png"},
    selection_box = {
       type = "fixed",
       fixed = {
           {-0.5, -0.5, -1.5, 0.5, 0.1, 0.4},
           {-0.5, -0.5, 0.22, 0.5, 0.5, 0.4},
       },
   },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -1.5, 0.5, 0.1, 0.4},
            {-0.5, -0.5, 0.22, 0.5, 0.5, 0.4},
        },
    },
    paramtype2 = "facedir",
    groups = {oddly_breakable_by_hand = 1},

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        beds.on_rightclick(pos, clicker)
        return itemstack
    end,

    on_timer = function(pos, elapsed)
        if pos.y > 1000 then
            local beds_around = 0
            local npcs_around = 0
            local pos1 = table.copy(pos)
            local pos2 = table.copy(pos)

            pos1.x = pos1.x + 20
            pos1.y = pos1.y + 20
            pos1.z = pos1.z + 20

            pos2.x = pos2.x - 20
            pos2.y = pos2.y - 20
            pos2.z = pos2.z - 20

            local trash, process_it = minetest.find_nodes_in_area(pos1, pos2, "mex_morebeds:npc_bed")
            trash = nil
            beds_around = process_it["mex_morebeds:npc_bed"]
            process_it = nil

            process_it = minetest.get_objects_inside_radius(pos, 40)
            for _,object in pairs(process_it) do
                if not object:is_player() and object:get_luaentity() and object:get_luaentity().textures and object:get_luaentity().textures[1] then
                    if string.match(object:get_luaentity().textures[1], "mobs_trader") or
                       string.match(object:get_luaentity().textures[1], "mobs_npc") then
                        npcs_around = npcs_around + 1
                    end
                end
            end
            process_it = nil

            if npcs_around < beds_around then
                if math.random(1, 3) == 1 then
                    minetest.add_entity(pos, "mobs_npc:trader")
                else
                    minetest.add_entity(pos, "mobs_npc:npc")
                end
            end
        end
        return true -- to run the timer for another cycle with the same timeout
    end,

    on_construct = function(pos)
        if minetest.get_modpath("mobs_npc") then
            minetest.get_node_timer(pos):start(60)
        end
    end,
})

minetest.register_craft({
    output = "mex_morebeds:npc_bed",
    recipe = {
        {"wool:green","wool:dark_green","wool:dark_green"},
        {"default:wood","default:wood","default:wood"},
    }
})


minetest.register_node("mex_morebeds:aspen_bed", {
    description = "Aspen Bed",
    drawtype = "mesh",
    mesh = "mex_morebeds_aspen_bed.obj",
    tiles = {"mex_morebeds_aspen_bed.png"},
    selection_box = {
       type = "fixed",
       fixed = {
           {-0.5, -0.5, -1.24, 0.5, 0.0, 0.35},
           {-0.55, -0.5, 0.3, 0.55, 0.32, 0.4},
       },
   },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -1.24, 0.5, 0.0, 0.35},
            {-0.55, -0.5, 0.3, 0.55, 0.32, 0.4},
        },
    },
    paramtype2 = "facedir",
    groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        beds.on_rightclick(pos, clicker)
        return itemstack
    end,
})

minetest.register_craft({
    output = "mex_morebeds:aspen_bed",
    recipe = {
        {"wool:white","wool:white","wool:white"},
        {"default:aspen_wood","default:aspen_wood","default:aspen_wood"},
    }
})

minetest.register_node("mex_morebeds:jungle_bed", {
    description = "Jungle Bed",
    drawtype = "mesh",
    mesh = "mex_morebeds_jungle_bed.obj",
    tiles = {"mex_morebeds_jungle_bed.png"},
    selection_box = {
       type = "fixed",
       fixed = {
           {-0.5, -0.5, -1.24, 0.5, 0.0, 0.35},
           {-0.55, -0.5, 0.25, 0.55, 0.85, 0.4},
       },
   },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -1.5, 0.5, 0.1, 0.4},
            {-0.5, -0.5, 0.22, 0.5, 1.1, 0.4},
        },
    },
    paramtype2 = "facedir",
    groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        beds.on_rightclick(pos, clicker)
        return itemstack
    end,
})

minetest.register_craft({
    output = "mex_morebeds:jungle_bed",
    recipe = {
        {"wool:black","wool:black","wool:black"},
        {"default:junglewood","default:junglewood","default:junglewood"},
    }
})

minetest.register_node("mex_morebeds:hammock", {
    description = "Hammock",
    drawtype = "mesh",
    mesh = "mex_morebeds_hammock.obj",
    tiles = {"mex_morebeds_hammock.png"},
    selection_box = {
       type = "fixed",
       fixed = {
           {-1.5, -0.5, -0.5, 1.5, 0.4, 0.5},
       },
   },
    collision_box = {
        type = "fixed",
        fixed = {
            {-1.5, -0.5, -0.5, 1.5, 0.4, 0.5},
        },
    },
    paramtype2 = "facedir",
    groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},

    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        beds.on_rightclick(pos, clicker)
        return itemstack
    end,
})

minetest.register_craft({
    output = "mex_morebeds:hammock",
    recipe = {
        {"default:reed","wool:white","default:reed"},
        {"default:reed","","default:reed"},
    }
})
