minetest.register_node("farming:packer", {
    description = "Packer",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.4, -0.5, -0.4, -0.3, 0.4, -0.3 }, -- foot 1
            { 0.3, -0.5, -0.4, 0.4, 0.4, -0.3 }, -- foot 2
            { -0.4, -0.5, 0.3, -0.3, 0.4, 0.4 }, -- foot 3
            { 0.3, -0.5, 0.3, 0.4, 0.4, 0.4 }, -- foot 4
        },
    },
    tiles = { "default_wood.png" },
    selection_box = {
           type = "fixed",
           fixed = {
               {-0.4, -0.5, -0.4, 0.4, 0.4, 0.4},
           },
       },
    groups = {oddly_breakable_by_hand = 1},

    on_construct = function(pos)
        local has_something_in_output = false
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
            "size[8,9]"..
            "image[1,2;1,1;farming_bag.png]"..
            "image[2,2;1,1;gui_arrow.png]"..
            "list[context;input;1,1;1,1;]"..
            "list[context;bags;1,3;1,1;]"..
            "list[context;output;3,2;1,1;]"..
            "list[current_player;main;0,5;8,4;]"..
            "listring[current_player;main]"..
            "listring[context;input]"..
            "listring[current_player;main]"..
            "listring[context;bags]"..
        	"listring[current_player;main]"..
            "listring[context;output]"..
       	    "listring[current_player;main]")
        local inv = meta:get_inventory()
        inv:set_size("input", 1*1)
        inv:set_size("bags", 1*1)
        inv:set_size("output", 1*1)
	end,

    allow_metadata_inventory_put = function(pos, listname, index, stack)
        if listname == "input" then
            local inv = minetest.get_meta(pos):get_inventory()
            if inv:is_empty("output") then
                local item = stack:get_name()
                local is_sackable = minetest.get_item_group(item, "sackable")
                if is_sackable ~= 0 then
                    return stack:get_count()
                end
            end
    	elseif listname == "bags" then
            if stack:get_name() == "farming:bag" then
                return stack:get_count()
            end
    	elseif listname == "output" then
    		return 0
    	end

        return 0
    end,

    allow_metadata_inventory_move = function()
        return 0
    end,

    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
    	if minetest.is_protected(pos, player:get_player_name()) then
    		return 0
    	end
    	return stack:get_count()
    end,

    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in packer at " .. minetest.pos_to_string(pos))
	end,

	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" puts stuff to packer at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()

        if not inv:is_empty("bags") then
            if not inv:is_empty("input") then
                if inv:is_empty("output") then
                    local stack_size = inv:get_stack("input", 1):get_count()
                    if stack_size >= 50 then
                        local stack_to_pack = inv:get_stack("input", 1):get_name()
                        stack_to_pack = string.gsub(stack_to_pack, "farming:", "farming:bag_of_")
                        inv:add_item("output", stack_to_pack)
                        has_something_in_output = true
                    end
                end
            end
        end
	end,

	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from packer at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()
        local stack_size = inv:get_stack("input", 1):get_count()
        local item_in_output = inv:get_stack("output", 1):get_name()

        if not inv:is_empty("bags") then
            if not inv:is_empty("input") and stack_size >= 50 then
                if inv:is_empty("output") and has_something_in_output then
                    local stack_to_remove = inv:get_stack("input", 1):get_name() .. " " .. 50
                    inv:remove_item("input", stack_to_remove)
                    inv:remove_item("bags", "farming:bag")
                    has_something_in_output = false
                end
            else
                inv:remove_item("output", item_in_output)
            end
        else
            inv:remove_item("output", item_in_output)
        end
	end,

    on_destruct = function(pos)
        local drop = ""
        local temp = {}

        default.get_inventory_drops(pos, "input", temp)
        default.get_inventory_drops(pos, "output", temp)
        default.get_inventory_drops(pos, "bags", temp)

        for i,v in ipairs(temp) do
            drop = v.name .. " " .. v.count
            minetest.add_item(pos, drop)
        end
    end
})

minetest.register_craft({
	output = "farming:packer",
	recipe = {
		{"", "", ""},
		{"group:stick", "", "group:stick"},
		{"group:stick", "", "group:stick"},
	}
})

-- Bag
minetest.register_craftitem("farming:bag", {
	description = "Bag\n(Use it with packer to bag 50 of the small produces)",
	inventory_image = "farming_bag.png"
})

minetest.register_craft({
    output = "farming:bag",
    recipe = {
        {"farming:string", "", "farming:string"},
        {"farming:string", "", "farming:string"},
        {"farming:string", "farming:string", "farming:string"}
    }
})


-- Bag of beans
minetest.register_craftitem("farming:bag_of_bean", {
    description = "Bag of Beans",
    inventory_image = "farming_bag_of_bean.png"
})

-- Bag of peanuts
minetest.register_craftitem("farming:bag_of_peanut", {
    description = "Bag of Peanuts",
    inventory_image = "farming_bag_of_peanut.png"
})

-- Bag of peas
minetest.register_craftitem("farming:bag_of_peas", {
	description = "Bag of Peas",
	inventory_image = "farming_bag_of_peas.png"
})

-- Bag of rice
minetest.register_craftitem("farming:bag_of_rice", {
	description = "Bag of Rice",
	inventory_image = "farming_bag_of_rice.png"
})
