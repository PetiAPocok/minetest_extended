minetest.register_craftitem("orb_of_wind:orb_of_wind", {
    description = "Orb of wind\nMana: 10",
    inventory_image = "orb_of_wind_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 10 then
            hbmana.set(name, players_mana - 10)

            local player_pos = player:get_pos()
            local pointed_pos = pointed_thing.under
            local dir = player:get_look_dir()

            obj = minetest.add_entity({
                x = player_pos.x,
                y = player_pos.y + 1.5,
                z = player_pos.z
            }, "orb_of_wind:wind_ball")

            obj:setvelocity({
                x = dir.x * 15,
                y = dir.y * 15,
                z = dir.z * 15
            })

            obj:get_luaentity()._owner = name
        end
    end
})

minetest.register_craft({
	output = "orb_of_wind:orb_of_wind",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "gems_quartz:quartz", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_entity("orb_of_wind:wind_ball", {
    physical = false,
    visual = "sprite",
    visual_size = {x=0.1, y=0.1},
    textures = {"orb_of_wind_particle.png"},
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    timer = 0,
    _owner = "",
    on_step = function(self, dtime)
        self.timer = self.timer + dtime
        local pos = self.object:get_pos()

        if minetest.get_node(pos).name ~= "air" then
            self.object:remove()
        end

        minetest.add_particlespawner({
            amount = 30,
            time = 0.10,
            minpos = {
                x = pos.x - 0.1,
                y = pos.y - 0.1,
                z = pos.z - 0.1
            },
            maxpos = {
                x = pos.x + 0.1,
                y = pos.y + 0.1,
                z = pos.z + 0.1
            },
            minexptime = 0.1,
            maxexptime = 0.2,
            minsize = 0.50,
            maxsize = 0.50,
            collisiondetection = false,
            vertical = false,
            texture = "orb_of_wind_particle.png",
        })

        if self.timer > 0.2 then
            local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
            for k, obj in pairs(objs) do
                if obj:get_luaentity() ~= nil then
                    if obj:get_luaentity().name ~= "orb_of_wind:wind_ball" and obj:get_luaentity().name ~= "__builtin:item" then
                        obj:punch(self.object, 1.0, {
                            full_punch_interval = 1.0,
                            damage_groups = {fleshy = 1},
                        }, nil)

                        self.object:remove()
                    end
                elseif obj:is_player() and obj:get_player_name() ~= self._owner  then
                    obj:punch(self.object, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 1},
                    }, nil)

                    self.object:remove()
                end
            end
            self.timer = 0
        end
    end
})
