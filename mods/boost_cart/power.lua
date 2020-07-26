boost_cart:register_rail("boost_cart:powerrail", {
    description = "Powered rail",
    tiles = {
        "carts_rail_straight_brk.png", "carts_rail_curved_brk.png",
        "carts_rail_t_junction_brk.png", "carts_rail_crossing_brk.png"
    },
    groups = boost_cart:get_rail_groups({power_rail = 1}),
    mesecons = {
        effector = {
            action_on = function(pos, node)
                minetest.swap_node(pos, {name = "boost_cart:powerrail_on", param2 = node.param2})
                minetest.get_meta(pos):set_string("cart_acceleration", "1")
            end
        },
    },
})

minetest.register_craft({
    output = "boost_cart:powerrail 12",
    recipe = {
        {"default:steel_ingot", "group:stick", "default:steel_ingot"},
        {"default:steel_ingot", "default:mese_crystal_fragment", "default:steel_ingot"},
        {"default:steel_ingot", "group:stick", "default:steel_ingot"},
    }
})

-- Power rail on
boost_cart:register_rail("boost_cart:powerrail_on", {
    description = "Power rail on",
    tiles = {
        "carts_rail_straight_pwr.png", "carts_rail_curved_pwr.png",
        "carts_rail_t_junction_pwr.png", "carts_rail_crossing_pwr.png"
    },
    groups = boost_cart:get_rail_groups({power_rail = 1, not_in_creative_inventory = 1}),
    drop = "boost_cart:powerrail",
    mesecons = {
        effector = {
            action_off = function(pos, node)
                minetest.swap_node(pos, {name = "boost_cart:powerrail", param2 = node.param2})
                minetest.get_meta(pos):set_string("cart_acceleration", "-1")
            end
        },
    },
})
