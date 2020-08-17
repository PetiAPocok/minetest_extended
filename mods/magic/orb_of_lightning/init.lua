local ray_count = 0
local rays = {}

minetest.register_craftitem("orb_of_lightning:orb_of_lightning", {
    description = "Orb of Lightning\nMana: 10",
    inventory_image = "orb_of_lightning_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 10 then
            hbmana.set(name, players_mana - 10)

            local player_pos = player:get_pos()
            local dir = player:get_look_dir()
            local objs = {}
            local loop_counter = 1

            while loop_counter <= 200 do
                local clear = true

                local entity_pos = {
                    x = player_pos.x + loop_counter * dir.x / 14.5,
                    y = player_pos.y + 1.4 + loop_counter * dir.y / 14.5,
                    z = player_pos.z + loop_counter * dir.z / 14.5
                }

                local objs = minetest.get_objects_inside_radius(entity_pos, 1.5)

                for k, obj in pairs(objs) do
                    if obj:get_luaentity() and obj:get_luaentity().name ~= "orb_of_lightning:lightning" and obj:get_luaentity().name ~= "__builtin:item" then
                        clear = false
                    end
                end

                if minetest.get_node(entity_pos).name == "air" and clear then
                    objs[loop_counter] = minetest.add_entity(entity_pos, "orb_of_lightning:lightning")

                    objs[loop_counter]:set_rotation({
                        x = -player:get_look_vertical(),
                        y = player:get_look_horizontal(),
                        z = math.random(0, 100)
                    })

                    objs[loop_counter]:get_luaentity()._id = ray_count
                    objs[loop_counter]:get_luaentity()._owner = name
                else
                    loop_counter = 200
                end

                loop_counter = loop_counter + 1
            end

            rays[ray_count] = objs
            ray_count = ray_count + 1
        end
    end
})

minetest.register_craft({
	output = "orb_of_lightning:orb_of_lightning",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "default:mese_crystal", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_entity("orb_of_lightning:lightning", {
    physical = false,
    visual = "mesh",
    mesh = "orb_of_lightning_lightning.obj",
    textures = {"orb_of_lightning_lightning.png"},
    collisionbox = {-0.01,-0.01,-0.07,0.01,0.01,0.01},
    pointable = false,
    visual_size = {x=1, y=1, z=1},
    _timer = 0,
    _id = 0,
    _owner = "",
    on_step = function(self, dtime)
        self._timer = self._timer + dtime
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        if node.name ~= "air" then
            self.object:remove()
        end

        local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)
        for k, obj in pairs(objs) do
            if obj:get_luaentity() ~= nil then
                if obj:get_luaentity().name ~= "orb_of_lightning:lightning" and obj:get_luaentity().name ~= "__builtin:item" then
                    obj:punch(self.object, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 3},
                    }, nil)
                end
            elseif obj:is_player() and obj:get_player_name() ~= self._owner then
                obj:punch(self.object, 1.0, {
                    full_punch_interval = 1.0,
                    damage_groups = {fleshy = 3},
                }, nil)
            end
        end

        if self._timer > 0.5 then
            self.object:remove()
        end
    end
})
