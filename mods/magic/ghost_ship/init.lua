local function calculate_velocity(speed, yaw, elevation)
    local x = -math.sin(yaw) * speed
    local z =  math.cos(yaw) * speed
    return {x = x, y = elevation, z = z}
end

local function table_contains(table, name)
    for _,v in ipairs(table) do
        if v == name then
            return true
        end
    end
    return false
end

local function table_find(table, name)
    for i,v in ipairs(table) do
        if v == name then
            return i
        end
    end
    return false
end

minetest.register_entity("ghost_ship:ship", {
    physical = true,
    collisionbox = {-2, -1, -7.5, 2, 2.5, 7.5},
    visual = "mesh",
    mesh = "ghost_ship.obj",
    textures = {"ghost_ship_surface.png"},
    use_texture_alpha = true,
    immortal = true,
    _owner = "",
    _passengers = {},
    _mana_timer = 0,
    _speed = 0,

    on_rightclick = function(self, clicker)
        if not clicker or not clicker:is_player() then
            return
        end

        local name = clicker:get_player_name()

        if self._owner == "" then
            self._owner = name
        end

        if table_contains(self._passengers, name) then
            clicker:set_detach()
            table.remove(self._passengers, table_find(self._passengers, name))
            player_api.player_attached[name] = false
            player_api.set_animation(clicker, "stand" , 30)
            clicker:set_eye_offset({x=0, y=0, z=0}, {x=0, y=0, z=0})
        else
            clicker:set_attach(self.object, "", {x=0, y=0, z=0}, {x=0, y=0, z=0})
            table.insert(self._passengers, name)
            player_api.player_attached[name] = true
            player_api.set_animation(clicker, "sit" , 30)
            clicker:set_eye_offset({x=0, y=10, z=75}, {x=0, y=100, z=-1000})
            clicker:set_look_horizontal(self.object:get_yaw())
        end
    end,

    on_activate = function(self, staticdata, dtime_s)
        self.object:set_armor_groups({immortal = 1})
    end,
    --
    on_punch = function(self, puncher)
        if (puncher and puncher:is_player() and self._owner == puncher:get_player_name() and puncher:get_wielded_item():get_name() == "ghost_ship:ship_in_bottle") or self._owner == "" then
            self.object:remove()
        end
    end,

    on_step = function(self, dtime)
        local pos = self.object:get_pos()
        local elevation = 0
        self._mana_timer = self._mana_timer + dtime

        minetest.add_particlespawner({
            amount = 30,
            time = 0.10,
            minpos = {
                x = pos.x - 2,
                y = pos.y - 1,
                z = pos.z - 7.5
            },
            maxpos = {
                x = pos.x + 2,
                y = pos.y + 2.5,
                z = pos.z + 7.5
            },
            minacc = {x=0, y=1, z=0},
            maxacc = {x=0, y=2, z=0},
            minexptime = 0.5,
            maxexptime = 1.0,
            minsize = 0.50,
            maxsize = 1.0,
            collisiondetection = false,
            vertical = false,
            texture = "bonemeal_particle.png",
        })

        local owner_id = table_find(self._passengers, self._owner)

        if owner_id then
            local player = minetest.get_player_by_name(self._owner)
            if player then
                local ctrl = player:get_player_control()
                local mana = 0
                local mana_giver_id = 1

                for i,v in ipairs(self._passengers) do
                    mana = mana + hbmana.get(v)
                end

                if (ctrl.up or ctrl.down) and mana >= 4 then
                    if self._mana_timer > 0.2 then
                        local mana_to_substract = 2
                        if ctrl.aux1 then
                            mana_to_substract = mana_to_substract + 2
                        end

                        if mana_giver_id > #self._passengers then
                            mana_giver_id = 1
                        end

                        if hbmana.get(self._passengers[mana_giver_id]) >= 4 then
                            hbmana.set(self._passengers[mana_giver_id], mana - mana_to_substract)
                        else
                            mana_giver_id = mana_giver_id + 1
                        end

                        self._mana_timer = 0
                    end

                    if ctrl.up and ctrl.aux1 and self._speed < 100 then
                        self._speed = self._speed + 1
                    elseif ctrl.up and self._speed < 50 then
                        self._speed = self._speed + 0.5
                    elseif ctrl.down and ctrl.aux1 and self._speed > 0 then
                        self._speed = self._speed - 1
                    elseif ctrl.down and self._speed > -20 then
                        self._speed = self._speed - 0.5
                    end
                else
                    if self._speed > 0.05 then
                        self._speed = self._speed - 0.5
                    elseif self._speed < -0.05 then
                        self._speed = self._speed + 0.5
                    else
                        self._speed = 0
                    end
                end

                if ctrl.left then
                    self.object:set_yaw(self.object:get_yaw() + dtime * 0.9)
                    player:set_look_horizontal(self.object:get_yaw())
                elseif ctrl.right then
                    self.object:set_yaw(self.object:get_yaw() - dtime * 0.9)
                    player:set_look_horizontal(self.object:get_yaw())
                end

                if ctrl.jump then
                    elevation = 2
                elseif ctrl.sneak then
                    elevation = -2
                else
                    elevation = 0
                end
            end
        end

        self.object:set_velocity(calculate_velocity(self._speed, self.object:get_yaw(), elevation))
    end,
})


minetest.register_craftitem("ghost_ship:ship_in_bottle", {
    description = "Ship in Bottle\n50 mana to summon",
    inventory_image = "ghost_ship_inventory.png",
    liquids_pointable = true,

    on_place = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 50 then
            hbmana.set(name, players_mana - 50)

            obj = minetest.add_entity({
                x = pointed_thing.under.x,
                y = pointed_thing.under.y + 1.5,
                z = pointed_thing.under.z
            }, "ghost_ship:ship")

            obj:get_luaentity()._owner = name
        end
    end})
