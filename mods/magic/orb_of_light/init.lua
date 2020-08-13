local ray_count = 0
local rays = {}

minetest.register_craftitem("orb_of_light:orb_of_light", {
    description = "Orb of Light\nMana: 30",
    inventory_image = "orb_of_light_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 30 then
            hbmana.set(name, players_mana - 30)

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
                    objs[loop_counter] = minetest.add_entity(entity_pos, "orb_of_light:ray_of_light")

                    objs[loop_counter]:set_rotation({
                        x = -player:get_look_vertical(),
                        y = player:get_look_horizontal(),
                        z = 0
                    })

                    objs[loop_counter]:get_luaentity()._id = ray_count
                    objs[loop_counter]:get_luaentity()._owner = name
                else
                    loop_counter = 30
                end

                loop_counter = loop_counter + 1
            end

            rays[ray_count] = objs
            ray_count = ray_count + 1
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

local function remove_ray(obj)
    if rays ~= {} then
        for k,v in pairs(rays[obj._id]) do
            local pos = v:get_pos()
            if pos ~= nil then
                walking_light.remove_light(pos)
            end

            v:remove()
        end
    end
end

minetest.register_entity("orb_of_light:ray_of_light", {
    physical = false,
    visual = "mesh",
    mesh = "orb_of_light_ray_of_light.obj",
    textures = {"orb_of_light_ray_of_light.png"},
    visual_size = {x=1, y=1, z=2},
    -- use_texture_alpha = true,
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    _timer = 0,
    _id = 0,
    _owner = "",
    on_step = function(self, dtime)
        self._timer = self._timer + dtime
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        if rays[self._id] == nil then
            -- delete the vagabond rays
            walking_light.remove_light(pos)
            self.object:remove()
        end

        if self._timer > 0.2 then

            if node.name == "air" then
                minetest.place_node(pos, {name="walking_light:light"})
            elseif node.name == "walking_light:light" then
                -- Do nothing
            else
                self.object:remove()
            end

            local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)
            for k, obj in pairs(objs) do
                if obj:get_luaentity() ~= nil then
                    local obj_name = obj:get_luaentity().name
                    if obj_name ~= "orb_of_light:ray_of_light" and obj_name ~= "__builtin:item" and obj_name ~= "mobs_monster:mese_arrow" and obj_name ~= "mobs_monster:fireball" then
                        obj:punch(self.object, 1.0, {
                            full_punch_interval = 1.0,
                            damage_groups = {fleshy = 3},
                        }, nil)

                        remove_ray(self)
                    end
                elseif obj:is_player() and obj:get_player_name() ~= self._owner then
                    obj:punch(self.object, 1.0, {
                        full_punch_interval = 1.0,
                        damage_groups = {fleshy = 3},
                    }, nil)

                    remove_ray(self)
                end
            end
        end

        if self._timer > 2 then
            remove_ray(self)
        end
    end
})
