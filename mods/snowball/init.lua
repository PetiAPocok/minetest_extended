local snowball_GRAVITY = 9
local snowball_VELOCITY = 19

-- get node but use fallback for nil or unknown
local node_ok = function(pos, fallback)

	fallback = fallback or mobs.fallback_node

	local node = minetest.get_node_or_nil(pos)

	if node and minetest.registered_nodes[node.name] then
		return node
	end

	return minetest.registered_nodes[fallback]
end

-- register snowball for shoot attack
minetest.register_entity("snowball:snowball_entity", {

    physical = false,
    visual = "sprite",
    visual_size = {x=.5, y=.5},
    textures = {"snowball.png"},
    velocity = 6,
    
    hit_player = function(self, player)
        player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
            full_punch_interval = 1.0,
            damage_groups = {fleshy = 0.1},
        }, nil)
    end,
    
    hit_mob = function(self, player)
        player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
            full_punch_interval = 1.0,
            damage_groups = {fleshy = 0.1},
        }, nil)
    end,
    
    drop = false, -- drops arrow as registered item when true
    collisionbox = {0, 0, 0, 0, 0, 0},
    timer = 0,
    switch = 0,

    on_punch = function(self, hitter, tflp, tool_capabilities, dir)
    end,

    on_step = function(self, dtime)

        self.timer = self.timer + 1

        local pos = self.object:get_pos()

        if self.switch == 0
        or self.timer > 150 then

            self.object:remove() ; -- print ("removed arrow")

            return
        end

        if self.hit_node then

            local node = node_ok(pos).name

            if minetest.registered_nodes[node].walkable then

                self:hit_node(pos, node)

                if self.drop == true then

                    pos.y = pos.y + 1

                    self.lastpos = (self.lastpos or pos)

                    minetest.add_item(self.lastpos, self.object:get_luaentity().name)
                end

                self.object:remove() ; -- print ("hit node")

                return
            end
        end

        if self.hit_player or self.hit_mob then

            for _,player in pairs(minetest.get_objects_inside_radius(pos, 1.0)) do

                if self.hit_player
                and player:is_player() then

                    self:hit_player(player)
                    self.object:remove() ; -- print ("hit player")
                    return
                end

                local entity = player:get_luaentity()

                if entity
                and self.hit_mob
                and entity._cmi_is_mob == true
                and tostring(player) ~= self.owner_id
                and entity.name ~= self.object:get_luaentity().name then

                    self:hit_mob(player)

                    self.object:remove() ;  --print ("hit mob")

                    return
                end
            end
        end

        self.lastpos = pos
    end
})

-- shoot snowball
local shoot_snowball = function (item, player, pointed_thing)

	local playerpos = player:get_pos()

	minetest.sound_play("default_place_node_hard", {
		pos = playerpos,
		gain = 1.0,
		max_hear_distance = 5,
	})

	local obj = minetest.add_entity({
		x = playerpos.x,
		y = playerpos.y +1.5,
		z = playerpos.z
	}, "snowball:snowball_entity")

	local ent = obj:get_luaentity()
	local dir = player:get_look_dir()

	ent.velocity = snowball_VELOCITY -- needed for api internal timing
	ent.switch = 1 -- needed so that egg doesn't despawn straight away

	obj:setvelocity({
		x = dir.x * snowball_VELOCITY,
		y = dir.y * snowball_VELOCITY,
		z = dir.z * snowball_VELOCITY
	})

	obj:setacceleration({
		x = dir.x * -3,
		y = -snowball_GRAVITY,
		z = dir.z * -3
	})

	-- pass player name to snowball for ownership
	local ent2 = obj:get_luaentity()
	ent2.playername = player:get_player_name()

    -- take item if not in creative
	if not is_creative(player:get_player_name()) then
		itemstack:take_item()
	end
    
	--item:take_item()

	return item
end

minetest.override_item("default:snow", {
    description = "Snowball",
    on_use = shoot_snowball
})
