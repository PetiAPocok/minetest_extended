--[[
Mana
This mod adds mana to players, a special attribute

License: MIT License
]]

--[===[
	Initialization
]===]

local S = minetest.get_translator("hbmana")

hbmana = {}
hbmana.playerlist = {}

hbmana.settings = {}
hbmana.settings.default_max = 10
hbmana.settings.max_reachable = 100
hbmana.settings.default_regen = 1
hbmana.settings.regen_timer = 0.2

do
	local default_max = tonumber(minetest.settings:get("hbmana_default_max"))
	if default_max ~= nil then
		hbmana.settings.default_max = default_max
	end

    local max_reachable = tonumber(minetest.settings:get("hbmana_max_mana"))
	if max_reachable ~= nil then
		hbmana.settings.max_reachable = max_reachable
	end

	local default_regen = tonumber(minetest.settings:get("hbmana_default_regen"))
	if default_regen ~= nil then
		hbmana.settings.default_regen = default_regen
	end

	local regen_timer = tonumber(minetest.settings:get("hbmana_regen_timer"))
	if regen_timer ~= nil then
		hbmana.settings.regen_timer = regen_timer
	end
end


--[===[
	API functions
]===]

function hbmana.set(playername, value)
	if value < 0 then
		minetest.log("info", "[mana] Warning: mana.set was called with negative value!")
		value = 0
	end
	value = hbmana.round(value)
	if value > hbmana.playerlist[playername].maxmana then
		value = hbmana.playerlist[playername].maxmana
	end
	if hbmana.playerlist[playername].mana ~= value then
		hbmana.playerlist[playername].mana = value
		hbmana.hud_update(playername)
	end
end

function hbmana.setmax(playername, value)
	if value < 0 then
		value = 0
		minetest.log("info", "[mana] Warning: mana.setmax was called with negative value!")
	end
	value = hbmana.round(value)
    if hbmana.playerlist[playername].maxmana ~= value and hbmana.settings.max_reachable >= value then
		hbmana.playerlist[playername].maxmana = value
		if(hbmana.playerlist[playername].mana > value) then
			hbmana.playerlist[playername].mana = value
		end
		hbmana.hud_update(playername)
	end
end

function hbmana.setregen(playername, value)
	hbmana.playerlist[playername].regen = value
end

function hbmana.get(playername)
	return hbmana.playerlist[playername].mana
end

function hbmana.getmax(playername)
	return hbmana.playerlist[playername].maxmana
end

function hbmana.getregen(playername)
	return hbmana.playerlist[playername].regen
end

function hbmana.add_up_to(playername, value)
	local t = hbmana.playerlist[playername]
	value = hbmana.round(value)
	if(t ~= nil and value >= 0) then
		local excess
		if((t.mana + value) > t.maxmana) then
			excess = (t.mana + value) - t.maxmana
			t.mana = t.maxmana
		else
			excess = 0
			t.mana = t.mana + value
		end
		hbmana.hud_update(playername)
		return true, excess
	else
		return false
	end
end

function hbmana.add(playername, value)
	local t = hbmana.playerlist[playername]
	value = hbmana.round(value)
	if(t ~= nil and ((t.mana + value) <= t.maxmana) and value >= 0) then
		t.mana = t.mana + value
		hbmana.hud_update(playername)
		return true
	else
		return false
	end
end

function hbmana.subtract(playername, value)
	local t = hbmana.playerlist[playername]
	value = hbmana.round(value)
	if(t ~= nil and t.mana >= value and value >= 0) then
		t.mana = t.mana -value
		hbmana.hud_update(playername)
		return true
	else
		return false
	end
end

function hbmana.subtract_up_to(playername, value)
	local t = hbmana.playerlist[playername]
	value = hbmana.round(value)
	if(t ~= nil and value >= 0) then
		local missing
		if((t.mana - value) < 0) then
			missing = math.abs(t.mana - value)
			t.mana = 0
		else
			missing = 0
			t.mana = t.mana - value
		end
		hbmana.hud_update(playername)
		return true, missing
	else
		return false
	end
end





--[===[
	File handling, loading data, saving data, setting up stuff for players.
]===]


-- Load the playerlist from a previous session, if available.
do
	local filepath = minetest.get_worldpath().."/mana.mt"
	local file = io.open(filepath, "r")
	if file then
		minetest.log("action", "[mana] mana.mt opened.")
		local string = file:read()
		io.close(file)
		if(string ~= nil) then
			local savetable = minetest.deserialize(string)
			hbmana.playerlist = savetable.playerlist
			minetest.debug("[mana] mana.mt successfully read.")
		end
	end
end

function hbmana.save_to_file()
	local savetable = {}
	savetable.playerlist = hbmana.playerlist

	local savestring = minetest.serialize(savetable)

	local filepath = minetest.get_worldpath().."/mana.mt"
	local file = io.open(filepath, "w")
	if file then
		file:write(savestring)
		io.close(file)
		minetest.log("action", "[mana] Wrote mana data into "..filepath..".")
	else
		minetest.log("error", "[mana] Failed to write mana data into "..filepath..".")
	end
end


minetest.register_on_respawnplayer(function(player)
	local playername = player:get_player_name()
	hbmana.set(playername, 0)
	hbmana.hud_update(playername)
end)


minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	if not minetest.get_modpath("hudbars") ~= nil then
		hbmana.hud_remove(playername)
	end
	hbmana.save_to_file()
end)

minetest.register_on_shutdown(function()
	minetest.log("action", "[mana] Server shuts down. Rescuing data into mana.mt")
	hbmana.save_to_file()
end)

minetest.register_on_joinplayer(function(player)
	local playername = player:get_player_name()

	if hbmana.playerlist[playername] == nil then
		hbmana.playerlist[playername] = {}
		hbmana.playerlist[playername].mana = 0
		hbmana.playerlist[playername].maxmana = hbmana.settings.default_max
		hbmana.playerlist[playername].regen = hbmana.settings.default_regen
		hbmana.playerlist[playername].remainder = 0
	end

	if minetest.get_modpath("hudbars") ~= nil then
		hb.init_hudbar(player, "mana", hbmana.get(playername), hbmana.getmax(playername))
	else
		hbmana.hud_add(playername)
	end
end)


--[===[
	Mana regeneration
]===]

hbmana.regen_timer = 0

minetest.register_globalstep(function(dtime)
	hbmana.regen_timer = hbmana.regen_timer + dtime
	if hbmana.regen_timer >= hbmana.settings.regen_timer then
		local factor = math.floor(hbmana.regen_timer / hbmana.settings.regen_timer)
		local players = minetest.get_connected_players()
		for i=1, #players do
			local name = players[i]:get_player_name()
			if hbmana.playerlist[name] ~= nil then
				if players[i]:get_hp() > 0 then
					local plus = hbmana.playerlist[name].regen * factor
					-- Compability check for version <= 1.0.2 which did not have the remainder field
					if hbmana.playerlist[name].remainder ~= nil then
						plus = plus + hbmana.playerlist[name].remainder
					end
					local plus_now = math.floor(plus)
					local floor = plus - plus_now
					if plus_now > 0 then
						hbmana.add_up_to(name, plus_now)
					else
						hbmana.subtract_up_to(name, math.abs(plus_now))
					end
					hbmana.playerlist[name].remainder = floor
				end
			end
		end
		hbmana.regen_timer = hbmana.regen_timer % hbmana.settings.regen_timer
	end
end)

--[===[
	HUD functions
]===]

if minetest.get_modpath("hudbars") ~= nil then
	hb.register_hudbar("mana", 0xFFFFFF, S("Mana"), { bar = "mana_bar.png", icon = "mana_icon.png", bgicon = "mana_bgicon.png" }, 0, hbmana.settings.default_max, false)

	function hbmana.hud_update(playername)
		local player = minetest.get_player_by_name(playername)
		if player ~= nil then
			hb.change_hudbar(player, "mana", hbmana.get(playername), hbmana.getmax(playername))
		end
	end

	function hbmana.hud_remove(playername)
	end

else
	function hbmana.manastring(playername)
		return S("Mana: @1/@2", hbmana.get(playername), hbmana.getmax(playername))
	end

	function hbmana.hud_add(playername)
		local player = minetest.get_player_by_name(playername)
		local id = player:hud_add({
			hud_elem_type = "text",
			position = { x = 0.5, y=1 },
			text = hbmana.manastring(playername),
			scale = { x = 0, y = 0 },
			alignment = { x = 1, y = 0},
			direction = 1,
			number = 0xFFFFFF,
			offset = { x = -262, y = -103}
		})
		hbmana.playerlist[playername].hudid = id
		return id
	end

	function hbmana.hud_update(playername)
		local player = minetest.get_player_by_name(playername)
		player:hud_change(hbmana.playerlist[playername].hudid, "text", hbmana.manastring(playername))
	end

	function hbmana.hud_remove(playername)
		local player = minetest.get_player_by_name(playername)
		player:hud_remove(hbmana.playerlist[playername].hudid)
	end
end

--[===[
	Helper functions
]===]
hbmana.round = function(x)
	return math.ceil(math.floor(x+0.5))
end
