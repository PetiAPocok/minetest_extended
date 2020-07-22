minetest.register_craftitem("orb_of_healing:orb_of_healing", {
    description = "Orb of Healing\nMana: 10",
    inventory_image = "orb_of_healing_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 10 and pointed_thing.ref:get_luaentity().name ~= "__builtin:item" then
            hbmana.set(name, players_mana - 10)
            local pos = {}

            if pointed_thing.type == "object" then
                local pointed_entity = pointed_thing.ref:get_luaentity()
                pos = pointed_thing.ref:get_pos()

                if pointed_thing.ref:is_player() then
                    pointed_thing.ref:set_hp(pointed_thing.ref:get_hp() + 5)
                elseif pointed_entity.name ~= "__builtin:item" then
                    pointed_thing.ref:punch(player, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = -3},
                    }, nil)
                end
            else
                pos = player:get_pos()

                player:set_hp(player:get_hp() + 5)
            end

            minetest.add_particlespawner({
                amount = 150,
                time = 0.5,
                minpos = {
                    x = pos.x - 1,
                    y = pos.y,
                    z = pos.z - 1
                },
                maxpos = {
                    x = pos.x + 1,
                    y = pos.y + 2,
                    z = pos.z + 1
                },
                minexptime = 0.1,
                maxexptime = 0.2,
                minsize = 1,
                maxsize = 2,
                collisiondetection = false,
                vertical = false,
                texture = "orb_of_healing_particle.png",
            })
        end
    end
})

minetest.register_craft({
	output = "orb_of_freezing:orb_of_freezing",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "gems_amber:amber", "default:glass"},
		{"", "default:glass", ""},
	}
})
