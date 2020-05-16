
-- support for MT game translation.
local S = default.get_translator

--
-- Formspecs
--

local function get_furnace_active_formspec(fuel_percent, item_percent)
	return "size[8,10]"..
        "list[context;input;1,0;2,2;]"..
        "list[context;fuel;1,3;2,2;]"..
		"image[1,2;1,1;gui_furnace_fire_bg.png^[lowpart:"..
		(fuel_percent)..":gui_furnace_fire_fg.png]"..
        "image[2,2;1,1;gui_furnace_fire_bg.png^[lowpart:"..
        (fuel_percent)..":gui_furnace_fire_fg.png]"..
		"image[3,2;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
        "list[context;output;4,1;3,3;]"..
		"list[current_player;main;0,5.75;8,1;]"..
		"list[current_player;main;0,7;8,3;8]"..
		"listring[context;output]"..
		"listring[current_player;main]"..
		"listring[context;input]"..
		"listring[current_player;main]"..
		"listring[context;fuel]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 5.75)
end

local function get_furnace_inactive_formspec()
	return "size[8,10]"..
        "list[context;input;1,0;2,2;]"..
        "list[context;fuel;1,3;2,2;]"..
        "image[1,2;1,1;gui_furnace_fire_bg.png]"..
		"image[2,2;1,1;gui_furnace_fire_bg.png]"..
		"image[3,2;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
        "list[context;output;4,1;3,3;]"..
		"list[current_player;main;0,5.75;8,1;]"..
		"list[current_player;main;0,7;8,3;8]"..
		"listring[context;output]"..
		"listring[current_player;main]"..
		"listring[context;input]"..
		"listring[current_player;main]"..
		"listring[context;fuel]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 5.75)
end

--
-- Node callback functions that are the same for active and inactive furnace
--

local function on_destruct(pos)
    local drop = ""
    local temp = {}
    default.get_inventory_drops(pos, "input", temp)
    default.get_inventory_drops(pos, "fuel", temp)
    default.get_inventory_drops(pos, "output", temp)
    for i,v in ipairs(temp) do
        drop = v.name .. " " .. v.count
        minetest.add_item(pos, drop)
    end
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "fuel" then
		if minetest.get_craft_result({method="fuel", width=1, items={stack}}).time ~= 0 then
			return stack:get_count()
		else
			return 0
		end
	elseif listname == "input" then
		return stack:get_count()
	elseif listname == "output" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local input_slot = 1
local fuel_slot = 1

local function furnace_node_timer(pos, elapsed)
	--
	-- Initialize metadata
	--
	local meta = minetest.get_meta(pos)
	local fuel_time = meta:get_float("fuel_time") or 0
	local input_time = meta:get_float("input_time") or 0
	local fuel_totaltime = meta:get_float("fuel_totaltime") or 0

	local inv = meta:get_inventory()
	local inputlist, fuellist
	local output_full = false

	local cookable, cooked
	local fuel

	local update = true

    local repeat_cycle = true

    while elapsed > 0 and update do
		update = false

		inputlist = inv:get_list("input")
		fuellist = inv:get_list("fuel")

		--
		-- Cooking
		--

		-- Check if we have cookable content
		local aftercooked
		cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = {inputlist[input_slot]}})
        cookable = cooked.time ~= 0

		local el = math.min(elapsed, fuel_totaltime - fuel_time)
		if cookable then -- fuel lasts long enough, adjust el to cooking duration
			el = math.min(el, cooked.time - input_time)
        else
            input_slot = input_slot + 1
            if input_slot > 4 then
                input_slot = 1
                repeat_cycle = false
            end
		end

		-- Check if we have enough fuel to burn
		if fuel_time < fuel_totaltime then
			-- The furnace is currently active and has enough fuel
			fuel_time = fuel_time + el
			-- If there is a cookable item then check if it is ready yet
			if cookable then
                --Make things faster
                el = el * 2
				input_time = input_time + el
				if input_time >= cooked.time then
					-- Place result in output list if possible
					if inv:room_for_item("output", cooked.item) then
						inv:add_item("output", cooked.item)
						inv:set_stack("input", input_slot, aftercooked.items[1])
						input_time = input_time - cooked.time
						update = true
					else
						output_full = true
					end
				else
					-- Item could not be cooked: probably missing fuel
					update = true
				end
			end
		else
			-- Furnace ran out of fuel
			if cookable then
				-- We need to get new fuel
				local afterfuel
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = {fuellist[fuel_slot]}})

				if fuel.time == 0 then
					-- No valid fuel in fuel list
                    fuel_slot = fuel_slot + 1
                    if fuel_slot > 4 then
                        fuel_slot = 1
                        fuel_totaltime = 0
                        input_time = 0
                    end
				else
					-- Take fuel from fuel list
					inv:set_stack("fuel", fuel_slot, afterfuel.items[1])
					-- Put replacements in output list or drop them on the furnace.
					local replacements = fuel.replacements
					if replacements[1] then
						local leftover = inv:add_item("output", replacements[1])
						if not leftover:is_empty() then
							local above = vector.new(pos.x, pos.y + 1, pos.z)
							local drop_pos = minetest.find_node_near(above, 1, {"air"}) or above
							minetest.item_drop(replacements[1], nil, drop_pos)
						end
					end
					update = true
					fuel_totaltime = fuel.time + (fuel_totaltime - fuel_time)
				end
			else
				-- We don't need to get new fuel since there is no cookable item
				fuel_totaltime = 0
				input_time = 0
			end
			fuel_time = 0
		end

		elapsed = elapsed - el
	end

	if fuel and fuel_totaltime > fuel.time then
		fuel_totaltime = fuel.time
	end
	if inputlist and inputlist[1]:is_empty() and inputlist[2]:is_empty() and inputlist[3]:is_empty() and inputlist[4]:is_empty() then
		input_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec
	local item_state
	local item_percent = 0
	if cookable then
		item_percent = math.floor(input_time / cooked.time * 100)
	end

	local active = false

	if fuel_totaltime ~= 0 then
		active = true
		local fuel_percent = 100 - math.floor(fuel_time / fuel_totaltime * 100)
		formspec = get_furnace_active_formspec(fuel_percent, item_percent)
		swap_node(pos, "industrial_furnace:industrial_furnace_active")
		-- make sure timer restarts automatically
		repeat_cycle = true
	else
		formspec = get_furnace_inactive_formspec()
		swap_node(pos, "industrial_furnace:industrial_furnace")
		-- stop timer on the inactive furnace
		minetest.get_node_timer(pos):stop()
	end

	--
	-- Set meta values
	--
	meta:set_float("fuel_totaltime", fuel_totaltime)
	meta:set_float("fuel_time", fuel_time)
	meta:set_float("input_time", input_time)
	meta:set_string("formspec", formspec)

	return repeat_cycle
end

--
-- Node definitions
--
minetest.register_node("industrial_furnace:industrial_furnace", {
    description = "Industrial Furnace",
    tiles = {
		"industrial_furnace_side.png", "industrial_furnace_side.png",
		"industrial_furnace_side.png", "industrial_furnace_side.png",
		"industrial_furnace_side.png", "industrial_furnace_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	on_destruct = on_destruct,

	on_timer = furnace_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('input', 4)
		inv:set_size('fuel', 4)
		inv:set_size('output', 9)
		furnace_node_timer(pos, 0)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "input", drops)
		default.get_inventory_drops(pos, "fuel", drops)
		default.get_inventory_drops(pos, "output", drops)
		drops[#drops+1] = "industrial_furnace:industrial_furnace"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_node("industrial_furnace:industrial_furnace_active", {
    description = "Industrial Furnace",
    tiles = {
		"industrial_furnace_side.png", "industrial_furnace_side.png",
		"industrial_furnace_side.png", "industrial_furnace_side.png",
		"industrial_furnace_side.png", {
			image = "industrial_furnace_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2
			}
        }
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "default:furnace",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_timer = furnace_node_timer,

	on_destruct = on_destruct,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_craft({
	output = "industrial_furnace:industrial_furnace",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})
