minetest.register_craftitem("orb_of_vampirism:orb_of_vampirism", {
    description = "Orb of Vampirism\nMana: 10",
    inventory_image = "orb_of_vampirism_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana > 10 then
            hbmana.set(name, players_mana - 10)

            local player_pos = player:get_pos()
            player_pos.y = player_pos.y + 1

            if pointed_thing.type == "object" then
                pointed_thing.ref:punch(player, 1.0, {
                    full_punch_interval = 1.0,
                    damage_groups = {fleshy = 1},
                }, nil)

                local pointed_pos = pointed_thing.ref:get_pos()
                local ppfe = { --player's position from entity
                    x = player_pos.x - pointed_pos.x,
                    y = player_pos.y - pointed_pos.y,
                    z = player_pos.z - pointed_pos.z
                }

                local dir = {
                    x = 0,
                    y = 0,
                    z = 0
                }

                local pdfe = math.sqrt(math.pow(ppfe.x, 2) + math.pow(ppfe.y, 2) + math.pow(ppfe.z, 2)) --player's distance from entity

                if ppfe.x > 0 and ppfe.z > 0 then
                    dir.x = math.atan(ppfe.x / ppfe.z) * 180 / math.pi / 90
                    dir.z = 1 - math.atan(ppfe.x / ppfe.z) * 180 / math.pi / 90
                elseif ppfe.x > 0 and ppfe.z < 0 then
                    dir.x = -1 * math.atan(ppfe.x / ppfe.z) * 180 / math.pi / 90
                    dir.z = -1 * (math.atan(ppfe.x / ppfe.z) * 180 / math.pi + 90) / 90
                elseif ppfe.x < 0 and ppfe.z > 0 then
                    dir.x = math.atan(ppfe.x / ppfe.z) * 180 / math.pi / 90
                    dir.z = (math.atan(ppfe.x / ppfe.z) * 180 / math.pi + 90) / 90
                elseif ppfe.x < 0 and ppfe.z < 0 then
                    dir.x = -1 * math.atan(ppfe.x / ppfe.z) * 180 / math.pi / 90
                    dir.z = -1 * (1 - math.atan(ppfe.x / ppfe.z) * 180 / math.pi / 90)
                elseif ppfe.x == 0 and ppfe.z < 0 then
                    dir.z = 1
                    dir.x = 0
                elseif ppfe.x == 0 and ppfe.z > 0 then
                    dir.z = -1
                    dir.x = 0
                elseif ppfe.x > 0 and ppfe.z == 0 then
                    dir.x = 1
                    dir.z = 0
                elseif ppfe.x < 0 and ppfe.z == 0 then
                    dir.x = -1
                    dir.z = 0
                end

                dir.y = math.asin(ppfe.y / pdfe) * 180 / math.pi / 90
                dir.x = dir.x * (1 - math.abs(dir.y))
                dir.z = dir.z * (1 - math.abs(dir.y))

                obj = minetest.add_entity(pointed_pos, "orb_of_vampirism:health_particles")

                obj:setvelocity({
                    x = dir.x * 10,
                    y = dir.y * 10,
                    z = dir.z * 10
                })
            end
        end
    end
})

minetest.register_craft({
	output = "orb_of_vampirism:orb_of_vampirism",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "gems_bloodstone:bloodstone", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_entity("orb_of_vampirism:health_particles", {
    physical = false,
    visual = "sprite",
    visual_size = {x=0.1, y=0.1},
    textures = {"orb_of_vampirism_particle.png"},
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    timer = 0,
    on_step = function(self, dtime)
        self.timer = self.timer + dtime
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        minetest.add_particlespawner({
            amount = 10,
            time = 0.10,
            minpos = {
                x = pos.x - 0.2,
                y = pos.y - 0.2,
                z = pos.z - 0.2
            },
            maxpos = {
                x = pos.x + 0.2,
                y = pos.y + 0.2,
                z = pos.z + 0.2
            },
            minexptime = 0.1,
            maxexptime = 0.2,
            minsize = 0.50,
            maxsize = 0.50,
            collisiondetection = false,
            vertical = false,
            texture = "orb_of_vampirism_particle.png",
        })

        if self.timer > 0.2 then
            local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
            for k, obj in pairs(objs) do
                if obj:is_player() then
                    obj:set_hp(obj:get_hp() + 1)
                    self.object:remove()
                end
            end
        end
    end
})
