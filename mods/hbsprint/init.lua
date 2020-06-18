-- Vars

local function setting_get(name, default)
    return minetest.settings:get(name) or default
end

local speed         = tonumber(setting_get("sprint_speed", "2"))
local jump          = tonumber(setting_get("sprint_jump", "1.1"))
local dir           = minetest.is_yes(setting_get("sprint_forward_only", "false"))
local particles     = tonumber(setting_get("sprint_particles", "2"))
local breath        = minetest.is_yes(setting_get("sprint_breath", "true"))
local breath_drain  = tonumber(setting_get("sprint_breath_drain", "1"))
local autohide      = minetest.is_yes(setting_get("hudbars_autohide_stamina", "true"))

local sprint_timer_step = 0.5
local sprint_timer = 0
local sprinting = {}
local breath_timer = {}

local food_drain  = 0.01

-- Functions

local function start_sprint(player)
    local name = player:get_player_name()

    if not sprinting[name] then
        player:set_physics_override({speed = speed, jump = jump})
        sprinting[name] = true
    end
end

local function stop_sprint(player)
    local name = player:get_player_name()
    if sprinting[name] then
        player:set_physics_override({speed = 1, jump = 1})
        sprinting[name] = false
    end
end

local function drain_hunger(name)
    hbhunger.hunger[name] = hbhunger.hunger[name] - food_drain
end

local function drain_breath(player)
    local player_breath = player:get_breath()
    if player_breath < player:get_properties().breath_max then
        player_breath = math.max(0, player_breath - breath_drain)
        player:set_breath(player_breath)
    end
end

local function is_walkable(ground)
    local ground_def = minetest.registered_nodes[ground.name]
    return ground_def and (ground_def.walkable and ground_def.liquidtype == "none")
end

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

-- Registrations

local function sprint_step(player, dtime)
    local name = player:get_player_name()

    if breath then
        breath_timer[name] = (breath_timer[name] or 0) + dtime
    end

    local ctrl = player:get_player_control()
    local key_press
    if dir then
        key_press = ctrl.aux1 and ctrl.up and not ctrl.left and not ctrl.right
    else
        key_press = ctrl.aux1 and (ctrl.up or ctrl.left or ctrl.right or ctrl.down)
    end

    if not key_press then
        stop_sprint(player)
        return
    end

    local ground_pos = player:get_pos()
    ground_pos.y = math.floor(ground_pos.y)
    -- check if player is reasonably near a walkable node
    local ground
    for _, y_off in ipairs({0, -1, -2}) do
        local testpos = vector.add(ground_pos, {x=0, y=y_off, z=0})
        local testnode = minetest.get_node_or_nil(testpos)
        if testnode ~= nil and is_walkable(testnode) then
            ground = testnode
            break
        end
    end

    local starving = false
    if minetest.is_yes(minetest.settings:get('enable_damage')) then
        starving = hbhunger.hunger[name] < 10
    end

    if not starving and ground then
        start_sprint(player)
        drain_hunger(name)
        if breath and breath_timer[name] >= 2 then
            drain_breath(player)
            breath_timer[name] = 0
        end
        if particles then
            create_particles(player, name, ground)
        end
    else
        stop_sprint(player)
    end
end

minetest.register_globalstep(function(dtime)
    sprint_timer = sprint_timer + dtime
    if sprint_timer >= sprint_timer_step then
        for _, player in ipairs(minetest.get_connected_players()) do
            sprint_step(player, sprint_timer)
        end
        sprint_timer = 0
    end
end)
