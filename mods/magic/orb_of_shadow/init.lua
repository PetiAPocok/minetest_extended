minetest.register_tool("orb_of_shadow:orb_of_shadow", {
    description = "Orb of Shadow\nMana: 20",
    inventory_image = "orb_of_shadow_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 20 then
            hbmana.set(name, players_mana - 20)

            local player_pos = player:get_pos()
            local dir = player:get_look_dir()

            obj = minetest.add_entity({
                x = player_pos.x,
                y = player_pos.y + 1.5,
                z = player_pos.z
            }, "orb_of_shadow:shadow_ball")

            obj:setvelocity({
                x = dir.x * 30,
                y = dir.y * 30,
                z = dir.z * 30
            })

            obj:get_luaentity()._owner = name
        end
    end
})

minetest.register_craft({
	output = "orb_of_shadow:orb_of_shadow",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "gems_amethyst:amethyst", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_entity("orb_of_shadow:shadow_ball", {
    physical = false,
    visual = "sprite",
    visual_size = {x=0.5, y=0.5},
    textures = {"orb_of_shadow_shadow_ball.png"},
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    _owner = "",
    on_step = function(self, dtime)
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        if node.name ~= "air" then
            self.object:remove()
        end

        minetest.add_particlespawner({
            amount = 10,
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
            texture = "orb_of_shadow_particle.png",
        })

        local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)
        for k, obj in pairs(objs) do
            if obj:get_luaentity() ~= nil then
                local obj_name = obj:get_luaentity().name
                if obj_name ~= "orb_of_shadow:shadow_ball" and obj_name ~= "__builtin:item" and obj_name ~= "mobs_monster:mese_arrow" and obj_name ~= "mobs_monster:fireball" then
                    obj:punch(self.object, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 3},
                    }, nil)

                    self.object:remove()
                end
            elseif obj:is_player() and obj:get_player_name() ~= self._owner  then
                obj:punch(self.object, 1.0, {
                    full_punch_interval = 1.0,
                    damage_groups = {fleshy = 5},
                }, nil)
                self.object:remove()
            end
        end
    end
})
