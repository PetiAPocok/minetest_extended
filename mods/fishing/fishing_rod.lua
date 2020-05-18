-- minetest.chat_send_all(dump())
local thrown_bobbers = {}
local catchables = {}

for k,v in pairs(minetest.registered_items) do
    if minetest.get_item_group(k, "fishing_catch") ~= 0 then
        table.insert(catchables, k)
    end
end

local function fishing(bobber, elapsed)
    bobber:get_luaentity()._since_bobber_in_water = bobber:get_luaentity()._since_bobber_in_water + elapsed

    -- Wait atleast 5 seconds
    if math.floor(bobber:get_luaentity()._since_bobber_in_water) > 5 then
        local pos = bobber:get_pos()

        if not bobber:get_luaentity()._there_is_fish_to_catch then
            bobber:get_luaentity()._there_is_fish_to_catch = math.random(1, 200) == 42
            if pos.y % 1 ~= 0.5 then
                pos.y = (pos.y - (pos.y % 1)) + 0.5
                bobber:move_to(pos)
                bobber:get_luaentity()._bobber_down = false
                bobber:get_luaentity()._bob_travel_time = 1
            end
        else
            bobber:get_luaentity()._the_fish_waited = bobber:get_luaentity()._the_fish_waited + elapsed

            -- Visualise the fish's presence
            -- Bob the bobber
            if bobber:get_luaentity()._bob_travel_time > 0 and not bobber:get_luaentity()._bobber_down then
                pos.y = pos.y - 0.02
                bobber:get_luaentity()._bob_travel_time = bobber:get_luaentity()._bob_travel_time - 0.1
                bobber:set_pos(pos)
            elseif bobber:get_luaentity()._bob_travel_time <= 0 and not bobber:get_luaentity()._bobber_down then
                bobber:get_luaentity()._bobber_down = true
            elseif bobber:get_luaentity()._bob_travel_time <= 1 and bobber:get_luaentity()._bobber_down then
                pos.y = pos.y + 0.02
                bobber:get_luaentity()._bob_travel_time = bobber:get_luaentity()._bob_travel_time + 0.1
                bobber:set_pos(pos)
            elseif bobber:get_luaentity()._bob_travel_time >= 1 and bobber:get_luaentity()._bobber_down then
                bobber:get_luaentity()._bobber_down = false
            end

            -- Spray bubbles
			minetest.add_particle({
				pos = {
                    x=pos.x + math.random(-1,1) * math.random() / 2,
                    y=pos.y + 0.1,
                    z=pos.z + math.random(-1,1) * math.random() / 2
                },
				velocity = {
                    x = 0,
                    y = 2,
                    z = 0
                },
				acceleration = {
                    x = 0,
                    y = -5,
                    z = 0},
				expirationtime = math.random(),
				size = math.random() + 0.5,
				collisiondetection = true,
				vertical = false,
				texture = "particles_bubble.png",
			})

            -- Play sound
            if bobber:get_luaentity()._bob_travel_time >= 0.4 and bobber:get_luaentity()._bob_travel_time <= 0.5 then
                minetest.sound_play("default_water_footstep", {
                    pos,
                    max_hear_distance = 100,
                    gain = 10.0,
                })
            end

            if bobber:get_luaentity()._the_fish_waited > 5 then
                bobber:get_luaentity()._there_is_fish_to_catch = false
                bobber:get_luaentity()._the_fish_waited = 0
            end
        end
    end
end

minetest.register_entity("fishing:bobber_entity", {
    textures = {"fishing_bobber.png"},
    visual_size = {x=0.5, y=0.5},
    pointable = false,
    walkable = false,
    physical = false,
    collisionbox = {-0.1, -0.5, -0.1, 0.1, 0.3, 0.1},
    _owner = "",
    _since_bobber_in_water = 0,
    _there_is_fish_to_catch = false,
    _the_fish_waited = 0,
    _bob_travel_time = 1,
    _bobber_down = false,

    on_step = function(self, elapsed)
        local pos = self.object:get_pos()
        pos.y = math.floor(pos.y)
        local node = minetest.get_node(pos).name
        local owner = minetest.get_player_by_name(self.object:get_luaentity()._owner)

        -- Stop the bobber if collides with node
        if (node ~= "air") and (self.object:get_luaentity()._since_bobber_in_water == 0) then
            self.object:set_acceleration({x=0,y=0,z=0})
            self.object:set_velocity({x=0,y=0,z=0})
            -- correcting the bobber's position so it is halfway submerged in the water
            pos.y = pos.y + 0.5
            self.object:move_to(pos)
        end

        if owner then
            --If the player is too far from the bobber remove it
            if owner:get_pos().x > (pos.x + 15) or owner:get_pos().x < (pos.x - 15) or
            owner:get_pos().y > (pos.y + 15) or owner:get_pos().y < (pos.y - 15) or
            owner:get_pos().z > (pos.z + 15) or owner:get_pos().z < (pos.z - 15) then
                self.object:remove()
                thrown_bobbers[owner:get_player_name()] = nil
                return
            end

            -- If the player puts away the rod remove the bobber
            if owner:get_wielded_item():get_name() ~= "fishing:fishing_rod" then
                self.object:remove()
                thrown_bobbers[owner:get_player_name()] = nil
                return
            end

            -- the process of fishing
            if node == "default:water_source" then
                fishing(self.object, elapsed)
            end
        else
            --If the bobber doesn't have an owner remove it
            self.object:remove()
            return
        end

    end,
})

-- Remove bobber if player leaves the game
minetest.register_on_leaveplayer(function(player)
    local player_name = player:get_player_name()

    if thrown_bobbers[player_name] then
        thrown_bobbers[player_name]:remove()
        thrown_bobbers[player_name] = nil
    end
end)

-- Remove bobber if player dies
minetest.register_on_dieplayer(function(player)
    local player_name = player:get_player_name()

    if thrown_bobbers[player_name] then
        thrown_bobbers[player_name]:remove()
        thrown_bobbers[player_name] = nil
    end
end)

local function cast_fishing_rod(itemstack, player, pointing_at)
    local bobber_gravity = 6
    local bobber_velocity = 10

    local player_name = player:get_player_name()
    local player_inv = player:get_inventory()
    local pos = player:getpos()
    local dir = player:get_look_dir()

    -- Bobber starting position correction.
    -- pos.x = pos.x + (dir.x) + (1 - dir.x)
    pos.y = pos.y + 1.5
    -- pos.z = pos.z - (dir.z)

    if not thrown_bobbers[player_name] then
        thrown_bobbers[player_name] = minetest.add_entity(pos, "fishing:bobber_entity")
        thrown_bobbers[player_name]:get_luaentity()._owner = player_name

        thrown_bobbers[player_name]:set_velocity({
            x = dir.x * bobber_velocity,
            y = dir.y * bobber_velocity,
            z = dir.z * bobber_velocity
        })

        thrown_bobbers[player_name]:set_acceleration({
            x = dir.x * -3,
            y = -bobber_gravity,
            z = dir.z * -3
        })
    else
        if thrown_bobbers[player_name]:get_luaentity()._there_is_fish_to_catch then
            local rand_loot = math.random(1, table.getn(catchables))
            local catch = catchables[rand_loot]

            if player_inv:room_for_item("main", catch) then
                player_inv:add_item("main", catch)
            else
                minetest.add_item(pos, catch)
            end
        end

        thrown_bobbers[player_name]:remove()
        thrown_bobbers[player_name] = nil

        if not minetest.settings:get_bool("creative_mode") then
			local idef = itemstack:get_definition()

			itemstack:add_wear(65536/100)

			if itemstack:get_count() == 0 and idef.sound and idef.sound.breaks then
				minetest.sound_play(idef.sound.breaks, {pos=player:get_pos(), gain=0.5}, true)
			end
		end
        return itemstack
    end
  end


minetest.register_tool("fishing:fishing_rod", {
	description = "Fishing Rod",
	groups = { tool=1 },
	inventory_image = "fishing_fishing_rod.png",
	wield_image = "fishing_fishing_rod.png^[transformR270",
	wield_scale = { x = 1.5, y = 1.5, z = 1 },
	stack_max = 1,
    on_use = cast_fishing_rod,
	sound = { breaks = "default_tool_breaks" },
})

minetest.register_craft({
	output = "fishing:fishing_rod",
	recipe = {
		{"","","group:stick"},
		{"","group:stick","farming:string"},
		{"group:stick","","farming:string"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "fishing:fishing_rod",
	burntime = 15,
})
