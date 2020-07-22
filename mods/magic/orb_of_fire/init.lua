minetest.register_craftitem("orb_of_fire:orb_of_fire", {
    description = "Orb of Fire\nMana: 15",
    inventory_image = "orb_of_fire_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 15 then
            hbmana.set(name, players_mana - 15)

            local player_pos = player:get_pos()
            local dir = player:get_look_dir()

            obj = minetest.add_entity({
                x = player_pos.x,
                y = player_pos.y + 1.5,
                z = player_pos.z
            }, "orb_of_fire:fire_ball")

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
	output = "orb_of_fire:orb_of_fire",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "gems_ruby:ruby", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_entity("orb_of_fire:fire_ball", {
    physical = false,
    visual = "sprite",
    visual_size = {x=0.5, y=0.5},
    textures = {"orb_of_fire_fire_ball.png"},
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    timer = 0,
    _owner = "",
    on_step = function(self, dtime)
        self.timer = self.timer + dtime
        local pos = self.object:get_pos()

        if minetest.get_node(pos).name ~= "air" then
            local node_above_pos = {
                x = pos.x,
                y = pos.y + 1,
                z = pos.z
            }

            local node_next_to_pos_1 = {
                x = pos.x + 1,
                y = pos.y,
                z = pos.z
            }

            local node_next_to_pos_2 = {
                x = pos.x - 1,
                y = pos.y,
                z = pos.z
            }

            local node_next_to_pos_3 = {
                x = pos.x,
                y = pos.y,
                z = pos.z + 1
            }

            local node_next_to_pos_4 = {
                x = pos.x,
                y = pos.y,
                z = pos.z - 1
            }

            if minetest.get_node(node_above_pos).name == "air" then
                minetest.place_node(node_above_pos, {name="fire:basic_flame"})
            elseif minetest.get_node(node_next_to_pos_1).name == "air" then
                minetest.place_node(node_next_to_pos_1, {name="fire:basic_flame"})
            elseif minetest.get_node(node_next_to_pos_2).name == "air" then
                minetest.place_node(node_next_to_pos_2, {name="fire:basic_flame"})
            elseif minetest.get_node(node_next_to_pos_3).name == "air" then
                minetest.place_node(node_next_to_pos_3, {name="fire:basic_flame"})
            elseif minetest.get_node(node_next_to_pos_4).name == "air" then
                minetest.place_node(node_next_to_pos_4, {name="fire:basic_flame"})
            end

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
            texture = "orb_of_fire_particle.png",
        })

        if self.timer > 0.2 then
            local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
            for k, obj in pairs(objs) do
                if obj:get_luaentity() ~= nil then
                    if obj:get_luaentity().name ~= "orb_of_fire:fire_ball" and obj:get_luaentity().name ~= "__builtin:item" then
                        obj:punch(self.object, 1.0, {
                            full_punch_interval = 1.0,
                            damage_groups = {fleshy = 3},
                        }, nil)

                        self.object:remove()
                    end
                elseif obj:is_player() and obj:get_player_name() ~= self._owner  then
                    obj:punch(self.object, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 3},
                    }, nil)
                    self.object:remove()
                end
            end
            self.timer = 0
        end
    end
})
