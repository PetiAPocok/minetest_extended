-- flying_carpet/init.lua

-- Load support for MT game translation.
local S = minetest.get_translator("flying_carpet")

--
-- Helper functions

local function get_velocity(v, yaw, y)
    local x = -math.sin(yaw) * v
    local z =  math.cos(yaw) * v
    return {x = x, y = y, z = z}
end

local function get_v(v)
    return math.sqrt(v.x ^ 2 + v.z ^ 2)
end

minetest.register_entity("flying_carpet:carpet", {
    physical = true,
    collisionbox = {-0.5, -0.35, -0.5, 0.5, 0.3, 0.5},
    visual = "mesh",
    mesh = "flying_carpet_carpet.obj",
    textures = {"flying_carpet_surface.png"},
    _driver = nil,
    _speed = 0,
    _timer_mana = 0,
    _timer_sound = 0,

    on_rightclick = function(self, clicker)
        if not clicker or not clicker:is_player() then
            return
        end
        local name = clicker:get_player_name()
        if self._driver and name == self._driver then
            self._driver = nil
            clicker:set_detach()
            player_api.player_attached[name] = false
            player_api.set_animation(clicker, "stand" , 30)
            local pos = clicker:get_pos()
            pos = {x = pos.x, y = pos.y + 0.2, z = pos.z}
            minetest.after(0.1, function()
                clicker:set_pos(pos)
            end)
        elseif not self._driver then
            local attach = clicker:get_attach()
            if attach and attach:get_luaentity() then
                local luaentity = attach:get_luaentity()
                if luaentity.driver then
                    luaentity.driver = nil
                end
                clicker:set_detach()
            end
            self._driver = name
            clicker:set_attach(self.object, "",
                {x = 0.5, y = 1, z = -3}, {x = 0, y = 0, z = 0})
            player_api.player_attached[name] = true
            minetest.after(0.2, function()
                player_api.set_animation(clicker, "sit" , 30)
            end)
            clicker:set_look_horizontal(self.object:get_yaw())
        end
    end,

    -- If driver leaves server while driving carpet
    on_detach_child = function(self, child)
        self._driver = nil
    end,

    on_activate = function(self, staticdata, dtime_s)
        self.object:set_armor_groups({immortal = 1})
    end,

    on_punch = function(self, puncher)
        if not puncher or not puncher:is_player() or self._removed then
            return
        end

        local name = puncher:get_player_name()
        if self._driver and name == self._driver then
            self._driver = nil
            puncher:set_detach()
            player_api.player_attached[name] = false
        end
        if not self._driver then
            local inv = puncher:get_inventory()
            if not (creative and creative.is_enabled_for
                    and creative.is_enabled_for(name))
                    or not inv:contains_item("main", "flying_carpet:carpet") then
                local leftover = inv:add_item("main", "flying_carpet:carpet")
                -- if no room in inventory add a replacement carpet to the world
                if not leftover:is_empty() then
                    minetest.add_item(self.object:get_pos(), leftover)
                end
            end
            -- delay remove to ensure player is detached
            minetest.after(0.1, function()
                minetest.sound_play("flying_carpet_place", {pos = self.object:get_pos(), gain = 1}, true)
                self.object:remove()
            end)
        end
    end,

    on_step = function(self, dtime)
        self._timer_mana = self._timer_mana + dtime
        self._timer_sound = self._timer_sound + dtime

        if self._speed > 0 or self._speed < 0 then
            if self._timer_sound > 0.5 then
                minetest.sound_play("flying_carpet_flight", {pos = pos, gain = 0.2}, true)
                local pos = self.object:get_pos()
                local pos_a = self.object:get_pos()
                pos_a.y = pos_a.y + 2

                local pos_u = self.object:get_pos()
                pos_u.y = pos_u.y - 0.5

                if minetest.get_node(pos_a).name ~= "air" or minetest.get_node(pos_u).name ~= "air" then
                    minetest.sound_play("flying_carpet_slide", {pos = pos, gain = 0.5}, true)
                end

                minetest.add_particlespawner({
                    amount = 30,
                    time = 0.10,
                    minpos = {
                        x = pos.x - 0.5,
                        y = pos.y - 0.5,
                        z = pos.z - 0.5
                    },
                    maxpos = {
                        x = pos.x + 0.5,
                        y = pos.y + 0.5,
                        z = pos.z + 0.5
                    },
                    minexptime = 0.5,
                    maxexptime = 1.0,
                    minsize = 0.50,
                    maxsize = 1.0,
                    collisiondetection = false,
                    vertical = false,
                    texture = "flying_carpet_magic_smoke.png",
                })

                self._timer_sound = 0
            end
        end

        if self._driver then
    		local player = minetest.get_player_by_name(self._driver)
    		if player then
    			local ctrl = player:get_player_control()
                local mana = hbmana.get(self._driver)

                if (ctrl.up or ctrl.down) and mana >= 1 then
                    if self._timer_mana > 0.3 then
                        local mana_to_substract = 1
                        if ctrl.aux1 then
                            mana_to_substract = mana_to_substract + 1
                        end
                        hbmana.set(self._driver, mana - mana_to_substract)
                        self._timer_mana = 0
                    end

                    if ctrl.up and ctrl.aux1 and self._speed < 50 then
                        self._speed = self._speed + 0.5
                    elseif ctrl.up and self._speed < 20 then
                        self._speed = self._speed + 0.1
                    elseif ctrl.down and ctrl.aux1 and self._speed > 0 then
                        self._speed = self._speed - 0.5
        			elseif ctrl.down and self._speed > -20 then
                        self._speed = self._speed - 0.1
                    end
                else
                    if self._speed > 0.05 then
                        self._speed = self._speed - 0.1
                    elseif self._speed < -0.05 then
                        self._speed = self._speed + 0.1
                    else
                        self._speed = 0
                    end
    			end

    			if ctrl.left then
    				if self._speed < -0.001 then
    					self.object:set_yaw(self.object:get_yaw() - dtime * 0.9)
    				else
    					self.object:set_yaw(self.object:get_yaw() + dtime * 0.9)
    				end
    			elseif ctrl.right then
    				if self._speed < -0.001 then
    					self.object:set_yaw(self.object:get_yaw() + dtime * 0.9)
    				else
    					self.object:set_yaw(self.object:get_yaw() - dtime * 0.9)
    				end
    			end

                if ctrl.jump or ctrl.sneak then
                    local pos = self.object:get_pos()
                    local future_pos = self.object:get_pos()

                    if ctrl.jump then
                        future_pos.y = future_pos.y + 2

                        if minetest.get_node(future_pos).name == "air" then
                            pos.y = pos.y + 0.05
                        end
                    elseif ctrl.sneak then
                        future_pos.y = future_pos.y - 0.5

                        if minetest.get_node(future_pos).name == "air" then
                            pos.y = pos.y - 0.05
                        end
                    end


                    self.object:set_pos(pos)
                end
    		end
        else
            if self._speed > 0.05 then
                self._speed = self._speed - 0.01
            elseif self._speed < -0.05 then
                self._speed = self._speed + 0.01
            else
                self._speed = 0
            end
        end

        if self._speed ~= 0 then
            self.object:set_velocity(get_velocity(self._speed, self.object:get_yaw(), 0))
        end
    end})


minetest.register_craftitem("flying_carpet:carpet", {
    description = S("carpet"),
    inventory_image = "flying_carpet_inventory.png",
    wield_scale = {x = 2, y = 2, z = 1},
    liquids_pointable = true,
    groups = {flammable = 2},

    on_place = function(itemstack, placer, pointed_thing)
        pointed_thing.under.y = pointed_thing.under.y + 1
        local carpet = minetest.add_entity(pointed_thing.under, "flying_carpet:carpet")

        if carpet then
            if placer then
                carpet:set_yaw(placer:get_look_horizontal())
            end
            local player_name = placer and placer:get_player_name() or ""
            if not (creative and creative.is_enabled_for and
                    creative.is_enabled_for(player_name)) then
                itemstack:take_item()
            end
        end

        minetest.sound_play("flying_carpet_place", {pos = pointed_thing.under, gain = 1}, true)
        return itemstack
    end})


minetest.register_craft({
    output = "flying_carpet:carpet",
    recipe = {
        {"",           "",           ""          },
        {"group:wood", "",           "group:wood"},
        {"group:wood", "group:wood", "group:wood"},
    },
})

minetest.register_craft({
    type = "fuel",
    recipe = "flying_carpet:carpet",
    burntime = 20,
})
