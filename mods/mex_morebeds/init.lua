minetest.register_node("mex_morebeds:npc_bed", {
    description = "NPC's Bed",
    drawtype = "mesh",
    mesh = "mex_morebeds_npc_bed.obj",
    tiles = {"mex_morebeds_npc_bed.png"},
    -- inventory_image = 'mex_moreblocks_candle.png',
    -- wield_image = 'mex_moreblocks_candle.png',
    selection_box = {
       type = "fixed",
       fixed = {
           {-0.47, -0.5, -1.47, 0.47, -0.1, 0.45},
           {-0.47, -0.5, 0.45, 0.47, 0.1, 0.3},
       },
   },
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.47, -0.5, -1.47, 0.47, -0.1, 0.45},
            {-0.47, -0.5, 0.45, 0.47, 0.1, 0.3},
        },
    },
    paramtype2 = "facedir",
    groups = {oddly_breakable_by_hand = 1},
})

minetest.register_craft({
    output = "mex_morebeds:npc_bed",
    recipe = {
        {"default:sand","default:sand"},
        {"default:clay_lump","farming:straw"},
    }
})
