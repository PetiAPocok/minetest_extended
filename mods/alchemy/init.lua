local reagents = {}
reagents["default:mese_crystal_fragment"] = "alchemy:magic"
reagents["flowers:chrysanthemum_green"] = "alchemy:mobility"
reagents["flowers:dandelion_white"] = "alchemy:holy"
reagents["flowers:dandelion_yellow"] = "alchemy:shine"
reagents["flowers:geranium"] = "alchemy:mana"
-- reagents["flowers:mushroom_brown"] = "alchemy:"
reagents["flowers:mushroom_red"] = "alchemy:poison"
reagents["flowers:rose"] = "alchemy:healing"
-- reagents["flowers:tulip"] = "alchemy:"
-- reagents["flowers:tulip_black"] = "alchemy:protection"
-- reagents["flowers:viola"] = "alchemy:strength"
reagents["flowers:waterlily"] = "alchemy:gills"
reagents["group:food_meat_raw"] = "alchemy:vitality"
reagents["mobs:honey"] = "alchemy:stamina"
-- reagents["mobs:lava_orb"] = "alchemy:antifire"


-- Potions
minetest.register_craftitem("alchemy:bottled_water", {
    description = "Bottled Water",
    inventory_image = "alchemy_bottled_water.png",
    on_use = minetest.item_eat(1)
})

minetest.register_craft({
    type = "shapeless",
	output = "alchemy:bottled_water 3",
	recipe = {"bucket:bucket_water", "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle"},
    replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
})


minetest.register_craftitem("alchemy:antifire", {
    description = "Fire Resistance Potion\nProtects you from fire for 30 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:gills", {
    description = "Gills Potion\nAllows breathing underwater for 30 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:healing", {
    description = "Healing Potion\nFaster health regeneration for 10 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:holy", {
    description = "Holy Water\nNullify all effects on the player.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:magic", {
    description = "Magic potion\nIncrease max mana.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:mana", {
    description = "Mana Potion\nFaster mana regeneration for 10 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:mobility", {
    description = "Mobility Potion\nIncreases walking speed and jumping height for 60 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:shine", {
    description = "Shine Potion\nMakes you shine for 60 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:poison", {
    description = "Flask of Poison (Throwable)\nHurts the affected for 10 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:protection", {
    description = "Potion of Protection\nIncrease defense for 60 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:stamina", {
    description = "Stamina Potion\nIncrease max satiation.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:strength", {
    description = "Strength Potion\nIncrease mining speed and damage for 60 seconds.",
    inventory_image = "alchemy_bottled_water.png";
})

minetest.register_craftitem("alchemy:vitality", {
    description = "Vitality Potion\nIncrease max health.",
    inventory_image = "alchemy_bottled_water.png";
})


minetest.register_node("alchemy:alchemy_set", {
    description = "Alchemy Set",
    drawtype = "mesh",
    mesh = "alchemy_alchemy_set.obj",
    tiles = { "alchemy_alchemy_set.png" },
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.2, -0.5, -0.1, 0.5, 0.2, 0.3},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.2, -0.5, -0.1, 0.5, 0.2, 0.3},
        },
    },
    paramtype2 = "facedir",
    groups = {dig_immediate = 3},

    on_construct = function(pos)
        local has_something_in_output = false
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
        "size[8,9]"..
        "image[1,2;1,1;alchemy_drop.png]"..
        "image[2,2;1,1;gui_arrow.png]"..
        "list[context;component;1,1;1,1;]"..
        "list[context;bottle;1,3;1,1;]"..
        "list[context;output;3,2;1,1;]"..
        "list[current_player;main;0,5;8,4;]"..
        "listring[current_player;main]"..
        "listring[context;component]"..
        "listring[current_player;main]"..
        "listring[context;bottle]"..
        "listring[current_player;main]"..
        "listring[context;output]"..
        "listring[current_player;main]")
        local inv = meta:get_inventory()
        inv:set_size("component", 1*1)
        inv:set_size("bottle", 1*1)
        inv:set_size("output", 1*1)
    end,

    allow_metadata_inventory_put = function(pos, listname, index, stack)
        if listname == "component" then
            local item = stack:get_name()
            if string.find(item, "flowers:") then
                return stack:get_count()
            end
        elseif listname == "bottle" then
            if stack:get_name() == "alchemy:bottled_water" then
                return stack:get_count()
            end
        elseif listname == "output" then
            return 0
        end

        return 0
    end,

    allow_metadata_inventory_move = 0,

    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        if minetest.is_protected(pos, player:get_player_name()) then
            return 0
        end
        return stack:get_count()
    end,

    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
        minetest.log("action", player:get_player_name() ..
        " moves stuff in alchemic station at " .. minetest.pos_to_string(pos))
    end,

    on_metadata_inventory_put = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name() ..
        " puts stuff to alchemic station at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()

        if not inv:is_empty("bottle") then
            if not inv:is_empty("component") then
                if inv:is_empty("output") then
                    local reagent = inv:get_stack("component", 1):get_name()
                    minetest.chat_send_all(dump(reagent))
                    --AZONNAL ADJA ODA, NE KELLJEN FŐZÉSRE VÁRNI
                    -- stack_to_pack = string.gsub(stack_to_pack, "farming:", "farming:bag_of_")
                    -- inv:add_item("output", stack_to_pack)
                    -- has_something_in_output = true
                end
            end
        end
    end,

    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        minetest.log("action", player:get_player_name() ..
        " takes stuff from alchemy station at " .. minetest.pos_to_string(pos))

        local inv = minetest.get_meta(pos):get_inventory()
        local stack_size = inv:get_stack("component", 1):get_count()
        local item_in_output = inv:get_stack("output", 1):get_name()

        if not inv:is_empty("bottle") then
            if not inv:is_empty("component") and stack_size >= 50 then
                if inv:is_empty("output") and has_something_in_output then
                    local stack_to_remove = inv:get_stack("component", 1):get_name() .. " " .. 50
                    inv:remove_item("component", stack_to_remove)
                    inv:remove_item("bottle", "alchemy:bottled_water")
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

        default.get_inventory_drops(pos, "component", temp)
        default.get_inventory_drops(pos, "output", temp)
        default.get_inventory_drops(pos, "bottle", temp)

        for i,v in ipairs(temp) do
            drop = v.name .. " " .. v.count
            minetest.add_item(pos, drop)
        end
    end
})

minetest.register_craft({
    output = "alchemy:alchemy_set",
    recipe = {
        {"default:glass", "default:glass"},
        {"group:stone", "vessels:glass_bottle"},
    }
})
