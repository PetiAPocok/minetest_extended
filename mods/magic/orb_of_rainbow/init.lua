minetest.register_tool("orb_of_rainbow:orb_of_rainbow", {
    description = "Orb of Rainbow\nMana: 70",
    inventory_image = "orb_of_rainbow_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 70 then
            hbmana.set(name, players_mana - 70)

            local player_pos = player:get_pos()
            local dir = player:get_look_dir()
            local objs = {}
            local loop_counter = 1

            while loop_counter < 30 do
                local entity_pos = {
                    x = player_pos.x + loop_counter * dir.x / 4,
                    y = player_pos.y + 1.4 + loop_counter * dir.y / 4,
                    z = player_pos.z + loop_counter * dir.z / 4
                }

                if minetest.get_node(entity_pos).name == "air" then
                    objs[loop_counter] = minetest.add_entity(entity_pos, "orb_of_rainbow:ray_of_rainbow")

                    objs[loop_counter]:set_rotation({
                        x = -player:get_look_vertical(),
                        y = player:get_look_horizontal(),
                        z = 0
                    })

                    objs[loop_counter]:get_luaentity()._owner = name
                else
                    loop_counter = 30
                end

                loop_counter = loop_counter + 1
            end
        end
    end
})

minetest.register_craft({
	output = "orb_of_rainbow:orb_of_rainbow",
	recipe = {
		{"gems_topaz:topaz", "default:glass", "gems_emerald:emerald"},
		{"default:glass", "default:diamond", "default:glass"},
		{"gems_sapphire:sapphire", "default:glass", "gems_ruby:ruby"},
	}
})

minetest.register_entity("orb_of_rainbow:ray_of_rainbow", {
    physical = false,
    visual = "mesh",
    mesh = "orb_of_rainbow_ray_of_rainbow.obj",
    textures = {"orb_of_rainbow_ray_of_rainbow.png"},
    visual_size = {x=1, y=1, z=2},
    -- use_texture_alpha = true,
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    _ttl = 0,
    _tta = 0,
    _owner = "",
    on_step = function(self, dtime)
        self._ttl = self._ttl + dtime
        self._tta = self._tta + dtime
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        if node.name ~= "air" then
            self.object:remove()
        end

        if self._tta > 0.5 then
            local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)
            for k, obj in pairs(objs) do
                if obj:get_luaentity() ~= nil then
                    if obj:get_luaentity().name ~= "orb_of_rainbow:ray_of_rainbow" and obj:get_luaentity().name ~= "__builtin:item" then
                        obj:punch(self.object, 1.0, {
                            full_punch_interval = 1.0,
                            damage_groups = {fleshy = 5},
                        }, nil)
                    end
                elseif obj:is_player() and obj:get_player_name() ~= self._owner then
                    obj:punch(self.object, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 5},
                    }, nil)
                end
                self._tta = 0
            end
        end

        if self._ttl > 5 then
            self.object:remove()
        end
    end
})
