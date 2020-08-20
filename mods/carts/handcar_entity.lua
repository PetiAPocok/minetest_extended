minetest.register_entity("carts:handcar", {
    	physical = false,
    	collisionbox = {-0.5, -0.45, -0.5, 0.5, 0.7, 0.5},
    	visual = "mesh",
    	mesh = "carts_handcar.obj",
    	visual_size = {x=1, y=1},
    	textures = {"carts_handcar_texture.png"},

    	passengers = "",
        on_activate = function(self, staticdata, dtime_s)
        	self.object:set_armor_groups({immortal=1})
        end,

        on_rightclick = function(self, clicker)
        	local player_name = clicker:get_player_name()
            local is_player_on = false
            local passenger_count = 0

            for passenger_name in string.gmatch(self.passengers, "%a+") do
                if passenger_name == player_name then
                    is_player_on = true
                end
                passenger_count = passenger_count + 1
            end

            -- Only 2 passengers are allowed
            if not is_player_on and passenger_count >= 2 then
                return
            end

            if not is_player_on then
                self.passengers = self.passengers .. player_name .. ";"
                default.player_attached[player_name] = self.object
                local y_pos = self.old_player_model and 6 or -4
                if clicker:get_properties().visual == "upright_sprite" then
                    y_pos = -4
                end
                clicker:set_attach(self.object, "", {x=0, y=y_pos, z=0}, {x=0, y=0, z=0})
                clicker:set_eye_offset({x=0, y=-4, z=0},{x=0, y=-4, z=0})
            else
                self.passengers = string.gsub(self.passengers, player_name .. ";", "")
                clicker:set_detach()
                clicker:set_eye_offset({x=0, y=0, z=0},{x=0, y=0, z=0})
                clicker:set_properties({})
            end
        end,

        on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, direction)
            if puncher:get_player_control().sneak and not self.passengers[1] then
                if not minetest.settings:get_bool("creative_mode") then
                    if puncher:get_inventory():room_for_item("main", {name="carts:handcar"}) then
                        puncher:get_inventory():add_item("main", "carts:handcar")
                    else
                        minetest.add_item(self.object:get_pos(), "carts:handcar")
                    end
        		end
        		self.object:remove()
        	end
        end,

        on_step = function(self, dtime)
            for passenger_name in string.gmatch(self.passengers, "%a+") do
                local player = minetest.get_player_by_name(passenger_name)
                local ctrl = player:get_player_control()

                if ctrl.up then

                elseif ctrl.down then

                else

                end
            end

            
        end
})

minetest.register_craftitem("carts:handcar", {
	description = "Handcar (Sneak+Click to pick up)",
	inventory_image = "carts_handcar.png",
	wield_image = "carts_handcar.png",
	on_place = function(itemstack, placer, pointed_thing)
		if not pointed_thing.type == "node" then
			return
		end
		if carts:is_rail(pointed_thing.under) then
			minetest.add_entity(pointed_thing.under, "carts:handcar")
		elseif carts:is_rail(pointed_thing.above) then
			minetest.add_entity(pointed_thing.above, "carts:handcar")
		else
			return
		end

		if not minetest.settings:get_bool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})

minetest.register_craft({
	output = "carts:handcar",
	recipe = {
        {"","default:steel_ingot", ""},
		{"","default:steel_ingot", ""},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	},
})
