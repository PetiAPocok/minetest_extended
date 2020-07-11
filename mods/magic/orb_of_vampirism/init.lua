minetest.register_craftitem("orb_of_vampirism:orb_of_vampirism", {
    description = "Orb of Vampirism\nMana: 10",
    inventory_image = "orb_of_vampirism_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana > 10 then
            hbmana.set(name, players_mana - 10)

            local player_pos = player:get_pos()

            if pointed_thing.type == "object" then
                local pointed_pos = pointed_thing.ref:get_pos()
                pointed_pos.y = pointed_pos.y + 0.5

                local dir = {
                    x = ((math.atan((player_pos.x - pointed_pos.x ) / (player_pos.y - pointed_pos.y)) * 180) / math.pi) / 90,
                    y = math.fmod((player_pos.y + 0.5) - pointed_pos.y, 1),
                    z = math.fmod(player_pos.z - pointed_pos.z, 1)
                }

                minetest.chat_send_all(dump(dir))

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

minetest.register_entity("orb_of_vampirism:health_particles", {
    physical = false,
    visual = "sprite",
    visual_size = {x=0.1, y=0.1},
    textures = {"orb_of_vampirism_particle.png"},
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
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

        -- if self.timer > 0.2 then
        --     local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
        --     for k, obj in pairs(objs) do
        --         if obj:get_luaentity() ~= nil then
        --             if obj:get_luaentity().name ~= "orb_of_vampirism:health_particles" and obj:get_luaentity().name ~= "__builtin:item" then
        --                 obj:punch(self.object, 1.0, {
        --                     full_punch_interval = 1.0,
        --                     damage_groups = {fleshy = 3},
        --                 }, nil)
        --
        --                 self.object:remove()
        --             end
        --         elseif obj:is_player() then
        --             obj:punch(self.object, 1.0, {
        --                 full_punch_interval = 1.0,
        --                 damage_groups = {fleshy = 3},
        --             }, nil)
        --             self.object:remove()
        --         end
        --     end
        -- end
    end
})
