minetest.register_entity("slingshot:projectile", {
    physical = false,
    visual = "sprite",
    visual_size = {x=0.5, y=0.5},
    textures = {"default_flint.png"},
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    _owner = "",
    on_step = function(self, dtime)
        local pos = self.object:get_pos()
        local node = minetest.get_node(pos)

        if node.name ~= "air" then
            self.object:remove()
        end

        local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)
        for k, obj in pairs(objs) do
            if obj:get_luaentity() ~= nil then
                local obj_name = obj:get_luaentity().name
                if obj_name ~= "slingshot:projectile" and obj_name ~= "__builtin:item" and obj_name ~= "mobs_monster:mese_arrow" and obj_name ~= "mobs_monster:fireball" then
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

minetest.register_tool("slingshot:slingshot", {
    description = "Slingshot\nUses flint as projectile.",
    inventory_image = "slingshot_slingshot.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local player_inv = player:get_inventory()

        if player_inv:contains_item("main", "default:flint") then
            if not minetest.settings:get_bool("creative_mode") then
                player_inv:remove_item("main", "default:flint")
            end

            local player_pos = player:get_pos()
            local dir = player:get_look_dir()

            obj = minetest.add_entity({
                x = player_pos.x,
                y = player_pos.y + 1.5,
                z = player_pos.z
            }, "slingshot:projectile")

            obj:setvelocity({
                x = dir.x * 20,
                y = dir.y * 20,
                z = dir.z * 20
            })

            obj:set_acceleration({
                x = dir.x * -3,
                y = -6,
                z = dir.z * -3
            })

            obj:get_luaentity()._owner = name
        end
    end
})

minetest.register_craft({
	output = "slingshot:slingshot",
	recipe = {
		{"", "farming:string", ""},
		{"default:stick", "", ""},
	}
})
