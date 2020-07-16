local ray_count = 0
local rays = {}

minetest.register_craftitem("orb_of_light:orb_of_light", {
    description = "Orb of Light\nMana: 30",
    inventory_image = "orb_of_light_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana > 30 then
            hbmana.set(name, players_mana - 30)

            local player_pos = player:get_pos()
            local dir = player:get_look_dir()
            local objs = {}

            for i=3,30 do
                objs[i] = minetest.add_entity({
                    x = player_pos.x + i * dir.x / 4,
                    y = player_pos.y + 1.4 + i * dir.y / 4,
                    z = player_pos.z + i * dir.z / 4
                }, "orb_of_light:ray_of_light")

                objs[i]:set_rotation({
                    x = -player:get_look_vertical(),
                    y = player:get_look_horizontal(),
                    z = 0
                })

                objs[i]:get_luaentity()._id = ray_count
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

local function remove_light(pos)
    local area = {
        {x=pos.x-1,y=pos.y-1,z=pos.z-1},
        {x=pos.x-1,y=pos.y-1,z=pos.z},
        {x=pos.x-1,y=pos.y-1,z=pos.z+1},
        {x=pos.x-1,y=pos.y,z=pos.z-1},
        {x=pos.x-1,y=pos.y,z=pos.z},
        {x=pos.x-1,y=pos.y,z=pos.z+1},
        {x=pos.x-1,y=pos.y+1,z=pos.z-1},
        {x=pos.x-1,y=pos.y+1,z=pos.z},
        {x=pos.x-1,y=pos.y+1,z=pos.z+1},
        {x=pos.x,y=pos.y-1,z=pos.z-1},
        {x=pos.x,y=pos.y-1,z=pos.z},
        {x=pos.x,y=pos.y-1,z=pos.z+1},
        {x=pos.x,y=pos.y,z=pos.z-1},
        {x=pos.x,y=pos.y,z=pos.z},
        {x=pos.x,y=pos.y,z=pos.z+1},
        {x=pos.x,y=pos.y+1,z=pos.z-1},
        {x=pos.x,y=pos.y+1,z=pos.z},
        {x=pos.x,y=pos.y+1,z=pos.z+1},
        {x=pos.x+1,y=pos.y-1,z=pos.z-1},
        {x=pos.x+1,y=pos.y-1,z=pos.z},
        {x=pos.x+1,y=pos.y-1,z=pos.z+1},
        {x=pos.x+1,y=pos.y,z=pos.z-1},
        {x=pos.x+1,y=pos.y,z=pos.z},
        {x=pos.x+1,y=pos.y,z=pos.z+1},
        {x=pos.x+1,y=pos.y+1,z=pos.z-1},
        {x=pos.x+1,y=pos.y+1,z=pos.z},
        {x=pos.x+1,y=pos.y+1,z=pos.z+1}
    }

    for _,v in ipairs(area) do
        if minetest.get_node(v).name == "walking_light:light" then
            minetest.remove_node(v)
        end
    end
end

local function remove_ray(obj)
    if rays ~= {} then
        for k,v in pairs(rays[obj._id]) do
            local pos = v:get_pos()
            remove_light(pos)

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
    on_step = function(self, dtime)
        self._timer = self._timer + dtime
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        if rays[self._id] == nil then
            -- delete the vagabond rays
            remove_light(pos)
            self.object:remove()
        end

        if node.name == "air" then
            minetest.place_node(pos, {name="walking_light:light"})
        elseif node.name == "walking_light:light" then
            -- Do nothings
        else
            remove_ray(self)
        end

        if self._timer > 0.2 then
            local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)
            for k, obj in pairs(objs) do
                if obj:get_luaentity() ~= nil then
                    if obj:get_luaentity().name ~= "orb_of_light:ray_of_light" and obj:get_luaentity().name ~= "__builtin:item" then
                        obj:punch(self.object, 1.0, {
                            full_punch_interval = 1.0,
                            damage_groups = {fleshy = 3},
                        }, nil)

                        remove_ray(self)
                    end
                elseif obj:is_player() then
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
