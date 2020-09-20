local function create_particles(player, name, ground)
    local def = minetest.registered_nodes[ground.name]
    local tile = def.tiles[1] or def.inventory_image
    if type(tile) == "table" then
        tile = tile.name
    end
    if not tile then
        return
    end

    local pos = player:get_pos()
    local rand = function() return math.random(-1,1) * math.random() / 2 end
    for i = 1, particles do
        minetest.add_particle({
            pos = {x = pos.x + rand(), y = pos.y + 0.1, z = pos.z + rand()},
            velocity = {x = 0, y = 5, z = 0},
            acceleration = {x = 0, y = -13, z = 0},
            expirationtime = math.random(),
            size = math.random() + 0.5,
            vertical = false,
            texture = tile,
        })
    end
end




minetest.register_tool("orb_of_digging:orb_of_digging", {
    description = "Orb of Digging\nMana: 15",
    inventory_image = "orb_of_digging_orb.png",
    on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        local players_mana = hbmana.get(name)

        if players_mana >= 15 then
            hbmana.set(name, players_mana - 15)

            local player_pos = player:get_pos()
            local dir = player:get_look_dir()

            obj = minetest.add_entity({
                x = player_pos.x,
                y = player_pos.y + 1.5,
                z = player_pos.z
            }, "orb_of_digging:digging_ball")

            obj:setvelocity({
                x = dir.x * 15,
                y = dir.y * 15,
                z = dir.z * 15
            })

            obj:get_luaentity()._owner = name
        end
    end
})

minetest.register_craft({
	output = "orb_of_digging:orb_of_digging",
	recipe = {
		{"", "default:glass", ""},
		{"default:glass", "gems_topaz:topaz", "default:glass"},
		{"", "default:glass", ""},
	}
})

minetest.register_entity("orb_of_digging:digging_ball", {
    physical = false,
    visual = "sprite",
    visual_size = {x=0.5, y=0.5},
    textures = {"orb_of_digging_digging_ball.png"},
    collisionbox = {-0.1,-0.1,-0.1,0.1,0.1,0.1},
    pointable = false,
    _timer = 0,
    on_step = function(self, dtime)
        self._timer = self._timer + dtime
        local pos = self.object:get_pos()
        local node_name = minetest.get_node(pos).name

        if node_name == "default:stone" or
        node_name == "default:dirt" or
        node_name == "default:dirt_with_grass" or
        node_name == "default:dirt_with_rainforest_litter" or
        node_name == "default:dirt_with_snow" or
        node_name == "default:dirt_with_coniferous_litter" or
        node_name == "default:dirt_with_dry_grass" or
        node_name == "default:gravel" or
        node_name == "default:silver_sand" or
        node_name == "default:sand" then
            minetest.dig_node(pos)
        end

        minetest.add_particlespawner({
            amount = 30,
            time = 0.10,
            minpos = {
                x = pos.x - 0.1,
                y = pos.y - 0.1,
                z = pos.z - 0.1
            },
            maxpos = {
                x = pos.x + 0.1,
                y = pos.y + 0.1,
                z = pos.z + 0.1
            },
            minexptime = 0.1,
            maxexptime = 0.2,
            minsize = 0.50,
            maxsize = 0.50,
            collisiondetection = false,
            vertical = false,
            texture = "orb_of_digging_particle.png",
        })

        if self._timer > 1 then
            self.object:remove()
        end

    end
})
