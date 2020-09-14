minetest.register_tool("orb_of_nature:orb_of_nature", {
    description = "Orb of Nature\nMana: 5",
    inventory_image = "orb_of_nature_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 5 then
            hbmana.set(name, players_mana - 5)

            if pointed_thing.type == "object" then

                if pointed_thing.ref:is_player() then
                    effects_hud.add_effect(pointed_thing.ref:get_player_name(), "poison", 3)
                elseif pointed_thing.ref then
                    pointed_thing.ref:get_luaentity().object:punch(player, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 1},
                    }, nil)
                end
            elseif pointed_thing.type == "node" then
                bones:on_use(pointed_thing.under, 1)
            else
                local pos = player:get_pos()
                local random_insect = math.random(1, 100)

                pos.x = pos.x + player:get_look_dir().x
                pos.y = pos.y + 1.5
                pos.z = pos.z + player:get_look_dir().z

                if random_insect < 25 then
                    minetest.set_node(pos, {name="butterflies:butterfly_white"})
                elseif random_insect < 50 then
                    minetest.set_node(pos, {name="butterflies:butterfly_red"})
                elseif random_insect < 75 then
                    minetest.set_node(pos, {name="butterflies:butterfly_violet"})
                elseif random_insect < 99 then
                    minetest.set_node(pos, {name="fireflies:firefly"})
                else
                    minetest.add_entity(pos, "mobs_animal:bee")
                end

            end

        end
    end
})

minetest.register_craft({
	output = "orb_of_nature:orb_of_nature",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "gems_emerald:emerald", "default:glass"},
		{"", "default:glass", ""},
	}
})
