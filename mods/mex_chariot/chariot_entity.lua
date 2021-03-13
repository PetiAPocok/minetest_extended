minetest.register_entity("mex_chariot:chariot_entity", {
    physical = true,
    collisionbox = {-1.5, -0.5, -1.5, 1.5, 2.5, 1.5},
    visual = "mesh",
    mesh = "mex_chariot.obj",
    textures = {"mex_chariot.png"},
    visual_size = {x=10, y=10, z=10},
    immortal = true,
    _driver = "",
    on_step = function(self, dtime)
        local pos = self.object:get_pos()
        local generator_positions = {
            {x=0, y=20003, z=11},
            {x=4, y=20003, z=7},
            {x=4, y=20003, z=15},
        }
        local fuel_amount = 0

        for _,v in ipairs(generator_positions) do
            local inv = minetest.get_meta(v):get_inventory()
            for _,v in ipairs(inv:get_list("input")) do
                fuel_amount = fuel_amount + v:get_count()
            end
        end

        mex_chariot_ms:set_int("fuel", fuel_amount)

        if pos then
            minetest.add_particlespawner({
                amount = 200,
                time = 0.20,
                minpos = {
                    x = pos.x - 2.5,
                    y = pos.y - 1.5,
                    z = pos.z - 2.5
                },
                maxpos = {
                    x = pos.x + 2.5,
                    y = pos.y + 3.5,
                    z = pos.z + 2.5
                },
                minexptime = 0.1,
                maxexptime = 0.2,
                minsize = 0.70,
                maxsize = 2.0,
                collisiondetection = false,
                vertical = true,
                texture = "orb_of_shadow_particle.png",
            })
        end

        if mex_chariot_ms:get_string("brake") == "Pulled" then
            self.object:remove()
        end
    end,

    on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, dir, damage)
        if self._driver == puncher:get_player_name() then
            puncher:set_detach()
            player_api.player_attached[puncher:get_player_name()] = nil
            puncher:set_pos({x=13, y=20002, z=2})
        end

        return true
    end,

    on_attach_child = function(self, child)
        self._driver = child:get_player_name()
    end,

    on_detach_child = function(self, child)
        self._driver = nil
        child:set_pos({x=13, y=20002, z=2})
    end,

    on_activate = function(self, staticdata, dtime_s)
        self.object:set_armor_groups({immortal = 1})
    end,

})
