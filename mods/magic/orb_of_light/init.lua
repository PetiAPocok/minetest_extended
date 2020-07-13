minetest.register_craftitem("orb_of_light:orb_of_light", {
    description = "Orb of Light\nMana: 10",
    inventory_image = "orb_of_light_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana > 10 then
            hbmana.set(name, players_mana - 10)

            local player_pos = player:get_pos()
            local pointed_pos = pointed_thing.under
            local dir = player:get_look_dir()
            local objs = {}


            for i=3,20 do
                objs[i] = minetest.add_entity({
                    x = player_pos.x + i / 10,
                    y = player_pos.y + 1.5 + i / 10,
                    z = player_pos.z + i / 10
                }, "orb_of_light:ray_of_light")

                objs[i]:set_rotation({
                    x = -player:get_look_vertical(),
                    y = player:get_look_horizontal(),
                    z = 0
                })
            end
        end
    end
})

minetest.register_craft({
	output = "orb_of_light:orb_of_light",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "default:diamond", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_entity("orb_of_light:ray_of_light", {
    physical = false,
    visual = "mesh",
    mesh = "orb_of_light_ray_of_light.obj",
    textures = {"orb_of_light_ray_of_light.png"},
    use_texture_alpha = true,
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    timer = 0,
    old_pos = {};
    on_step = function(self, dtime)
        self.timer = self.timer + dtime
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        if self.old_pos ~= pos then
            if self.old_pos.x ~= nil then
                self.old_pos.y = self.old_pos.y - 1
                if minetest.get_node(self.old_pos).name == "walking_light:lights" then
                    minetest.remove_node(self.old_pos)
                end
            end

            if node.name == "air" then
                minetest.place_node(pos, {name="walking_light:light"})
                self.old_pos = pos
            end
        end

        if node.name ~= "air" and node.name ~= "walking_light:light" then
            if minetest.get_node(self.old_pos).name == "walking_light:lights" then
                minetest.remove_node(self.old_pos)
            end
            self.object:remove()
        end

        if self.timer > 0.2 then
            local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
            for k, obj in pairs(objs) do
                if obj:get_luaentity() ~= nil then
                    if obj:get_luaentity().name ~= "orb_of_light:ray_of_light" and obj:get_luaentity().name ~= "__builtin:item" then
                        obj:punch(self.object, 1.0, {
                            full_punch_interval = 1.0,
                            damage_groups = {fleshy = 3},
                        }, nil)

                        if minetest.get_node(self.old_pos).name == "walking_light:lights" then
                            minetest.remove_node(self.old_pos)
                        end
                        self.object:remove()
                    end
                elseif obj:is_player() then
                    obj:punch(self.object, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 3},
                    }, nil)

                    if minetest.get_node(self.old_pos).name == "walking_light:lights" then
                        minetest.remove_node(self.old_pos)
                    end
                    self.object:remove()
                end
            end
        end
    end
})
