local S = minetest.get_translator("hbhunger")

if minetest.settings:get_bool("enable_damage") then
local mod_storage = minetest.get_mod_storage()
hbhunger = {}
hbhunger.food = {}

hbhunger.players = {}

-- HUD item ids
local hunger_hud = {}

hbhunger.HUD_TICK = 0.1

hbhunger.max_reachable_satiation = 50 -- the top reachable maximum satiation
hbhunger.start_max_satiation = 20 -- the reachable maximum satiation for new players
hbhunger.start_satiation = 20 -- the starting hunger
hbhunger.hunger_tick = 120 -- time in seconds after that 1 hunger point is taken
hbhunger.exhaust_dig = 0.01  -- how many hunger point is taken after digged node
hbhunger.exhaust_place = 0.007 -- how many hunger point is taken after placed
hbhunger.exhaust_move = 0.005 -- how many hunger point is taken if player movement detected
hbhunger.healing_limit = 10 -- how many hunger point is needed to start healing

-- Load palyers' saved data
if mod_storage:get_string("data") ~= nil and mod_storage:get_string("data") ~= "return nil" then
    hbhunger.players = minetest.deserialize(mod_storage:get_string("data"))
    minetest.log("info", "hbhunger: Previously saved data loaded.")
end

--load custom settings
local max_reachable = tonumber(minetest.settings:get("hbhunger_max_satiation"))
if max_reachable ~= nil then
    hbhunger.max_reachable_satiation = max_reachable
end

local start_max_satiation = tonumber(minetest.settings:get("hbhunger_start_max_satiation"))
if start_max_satiation ~= nil then
    hbhunger.start_max_satiation = start_max_satiation
end

local start_satiation = tonumber(minetest.settings:get("hbhunger_start_satiation"))
if start_satiation ~= nil then
    hbhunger.start_satiation = start_satiation
end

local healing_limit = tonumber(minetest.settings:get("hbhunger_healing_limit"))
if healing_limit ~= nil then
    hbhunger.healing_limit = healing_limit
end

local function save_players_data()
    mod_storage:set_string("data", minetest.serialize(hbhunger.players))
end

local function custom_hud(player)
    hb.init_hudbar(player, "satiation", hbhunger.players[player:get_player_name()].hunger, hbhunger.players[player:get_player_name()].satiation)
end

-- wrapper for minetest.item_eat (this way we make sure other mods can't break this one)
local org_eat = core.do_item_eat
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)
    local name = user:get_player_name()
    if hbhunger.players[name].hunger < (hbhunger.players[name].satiation - 1) then -- Don't overeat
    	local old_itemstack = itemstack
    	itemstack = hbhunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)

            for _, callback in pairs(core.registered_on_item_eats) do
                local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing, old_itemstack)
                if result then
                    return result
                end
            end
        return itemstack
    end
end

-- food functions
local food = hbhunger.food

function hbhunger.register_food(name, hunger_change, replace_with_item, poisen, heal, sound)
	food[name] = {}
	food[name].saturation = hunger_change	-- hunger points added
	food[name].replace = replace_with_item	-- what item is given back after eating
	food[name].poisen = poisen				-- time its poisening
	food[name].healing = heal				-- amount of HP
	food[name].sound = sound				-- special sound that is played when eating
end

function hbhunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	local item = itemstack:get_name()
	local def = food[item]
	if not def then
		def = {}
		if type(hp_change) ~= "number" then
			hp_change = 1
			minetest.log("error", "Wrong on_use() definition for item '" .. item .. "'")
		end
		def.saturation = hp_change * 1.3
		def.replace = replace_with_item
	end
	local func = hbhunger.item_eat(def.saturation, def.replace, def.poisen, def.healing, def.sound)
	return func(itemstack, user, pointed_thing)
end

function hbhunger.item_eat(hunger_change, replace_with_item, poisen, heal, sound)
	return function(itemstack, user, pointed_thing)
		if itemstack:take_item() ~= nil and user ~= nil then
			local name = user:get_player_name()
			local h = tonumber(hbhunger.players[name].hunger)
			local hp = user:get_hp()
			if h == nil or hp == nil then
				return
			end
			minetest.sound_play({name = sound or "hbhunger_eat_generic", gain = 1}, {pos=user:getpos(), max_hear_distance = 16})

			-- Saturation
			if h < hbhunger.players[name].satiation and hunger_change then
				h = h + hunger_change
				if h > hbhunger.players[name].satiation then h = hbhunger.players[name].satiation end
				hbhunger.players[name].hunger = h
			end
			-- Healing
			if hp < 20 and heal then
				hp = hp + heal
				if hp > 20 then hp = 20 end
				user:set_hp(hp)
			end
			-- Poison
			if poisen then
				-- Set poison bar
				hb.change_hudbar(user, "health", nil, nil, "hbhunger_icon_health_poison.png", nil, "hbhunger_bar_health_poison.png")
				effects_hud.add_effect(name, "poison", poisen)
			end

			if itemstack:get_count() == 0 then
				itemstack:add_item(replace_with_item)
			else
				local inv = user:get_inventory()
				if inv:room_for_item("main", replace_with_item) then
					inv:add_item("main", replace_with_item)
				else
					minetest.add_item(user:getpos(), replace_with_item)
				end
			end
		end
		return itemstack
	end
end

dofile(minetest.get_modpath("hbhunger").."/foods.lua")

-- register satiation hudbar
hb.register_hudbar("satiation", 0xFFFFFF, S("Satiation"), { icon = "hbhunger_icon.png", bgicon = "hbhunger_bgicon.png",  bar = "hbhunger_bar.png" }, 20, 20, false, nil, { format_value = "%.1f", format_max_value = "%d" })

-- update hud elemtens if value has changed
local function update_hud(player)
    local name = player:get_player_name()
 --hunger
    local h_out = hbhunger.players[name].hunger_out
    local h = hbhunger.players[name].hunger
    local max = hbhunger.players[name].satiation
    if h_out ~= h then
        hbhunger.players[name].hunger_out = h
        hb.change_hudbar(player, "satiation", h, max)
    end
end

minetest.register_on_joinplayer(function(player)
    local name = player:get_player_name()

    if hbhunger.players[name] == nil then
        hbhunger.players[name] = {}
        hbhunger.players[name].satiation = 20
        hbhunger.players[name].hunger = 20
        hbhunger.players[name].hunger_out = hbhunger.players[name].hunger
        save_players_data()
    end

    custom_hud(player)
end)

minetest.register_on_respawnplayer(function(player)
    -- reset hunger (and save)
    local name = player:get_player_name()
    hbhunger.players[name].hunger = 20
    save_players_data()
end)

minetest.register_on_leaveplayer(function()
    save_players_data()
end)

minetest.register_on_shutdown(function()
    save_players_data()
end)

local function take_hunger(player_name, amount)
    local h = hbhunger.players[player_name].hunger
    if h > 0 then
        hbhunger.players[player_name].hunger = h - amount
    elseif h < 0 then
        hbhunger.players[player_name].hunger = 0
    end
end

local main_timer = 0
local timer1 = 0
minetest.register_globalstep(function(dtime)
    if main_timer > 1 then
        for _,player in ipairs(minetest.get_connected_players()) do
            local name = player:get_player_name()
            local h = hbhunger.players[name].hunger
            local hp = player:get_hp()
            local hl = hbhunger.healing_limit

            -- heal player by 1 hp if not dead and satiation is more than the limit
            if h > hl and hp > 0 and player:get_breath() > 0 then
                player:set_hp(hp + 1)
            -- or damage player by 1 hp if satiation is below 1
            elseif h < 1 and hp - 1 >= 0 then
                player:set_hp(hp - 1)
            end

            -- lower satiation by 1 point after xx seconds
            if timer1 > hbhunger.hunger_tick then
                if h > 0 then
                    hbhunger.players[name].hunger = h - 1
                    timer1 = 0
                end
            end

            -- Determine if the player is walking
            local controls = player:get_player_control()
            if controls.up or controls.down or controls.left or controls.right then
                take_hunger(player:get_player_name(), hbhunger.exhaust_move)
            end
            -- update all hud elements
            update_hud(player)
        end
        main_timer = 0
    end
    main_timer = main_timer + dtime
    timer1 = timer1 + dtime
end)

minetest.register_on_placenode(function(pos, oldnode, player, ext)
    if player then
        take_hunger(player:get_player_name(), hbhunger.exhaust_place)
    end
end)

minetest.register_on_dignode(function(pos, oldnode, player, ext)
    if player then
        take_hunger(player:get_player_name(), hbhunger.exhaust_dig)
    end
end)

end
