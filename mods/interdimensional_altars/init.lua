local ms = minetest.get_mod_storage()
local detached_inventory = minetest.get_inventory({type="detached", name="interdimensional_altar"})

local function save_interdimensional_altar_detached_inventory(inv)
    local detached_inventory_table = {}

    for i=1,32 do
        detached_inventory_table[i] = inv:get_stack("main", i):to_table()
    end

    ms:set_string("iadi",minetest.serialize(detached_inventory_table))
end

if not detached_inventory then
    detached_inventory = minetest.create_detached_inventory("interdimensional_altar",{
        on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
            save_interdimensional_altar_detached_inventory(inv)
        end,

        on_put = function(inv, listname, index, stack, player)
            save_interdimensional_altar_detached_inventory(inv)
        end,

        on_take = function(inv, listname, index, stack, player)
            save_interdimensional_altar_detached_inventory(inv)
        end
    })
    detached_inventory:set_size("main", 8*4)
end

if ms:get_string("iadi") and ms:get_string("iadi") ~= "" then
    local detached_inventory_table = minetest.deserialize(ms:get_string("iadi"))

    for i=1,32 do
        detached_inventory:set_stack("main", i, detached_inventory_table[i])
    end
end

minetest.register_node("interdimensional_altars:altar", {
    description = "Interdimensional Altar",
    drawtype = "mesh",
    mesh = "interdimensional_altars_altar.obj",
    tiles = {"interdimensional_altars_altar.png"},
    inventory_image = "interdimensional_altars_altar_inv.png",
    wield_image = "interdimensional_altars_altar_inv.png",
    use_texture_alpha = true,
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.2, -0.5, -0.2, 0.2, 0.96, 0.2},
        },
    },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.2, -0.5, -0.2, 0.2, 0.96, 0.2},
        },
    },
    paramtype2 = "facedir",
    groups = {oddly_breakable_by_hand = 3},

    on_construct = function(pos)
        local meta = minetest.get_meta(pos)

        meta:set_string("formspec",
        "size[8,9]" ..
        "list[detached:interdimensional_altar;main;0,0.3;8,4;]" ..
        "list[current_player;main;0,4.85;8,1;]" ..
        "list[current_player;main;0,6.08;8,3;8]" ..
        "listring[current_player;main]"..
        "listring[detached:interdimensional_altar;main]")
    end,
})

minetest.register_craft({
	output = "interdimensional_altars:altar",
	recipe = {
        {"", "void_bags:bag", ""},
		{"", "default:obsidian", ""},
		{"default:obsidian", "default:obsidian", "default:obsidian"}
	}
})
