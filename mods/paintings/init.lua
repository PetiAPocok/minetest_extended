-- Licensed under CC0.
-- Painting textures from Stunt Rally <https://code.google.com/p/vdrift-ogre/>, licensed under CC0. Modified.
-- Painting textures made by Maizegod, licensed under CC0.

minetest.register_node("paintings:canvas", {
    description = "Canvas",
    drawtype = "nodebox",
    tiles = {"paintings_canvas.png"},
    inventory_image = "paintings_canvas.png",
    wield_image = "paintings_canvas.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
    output = "paintings:canvas",
    recipe = {
        {"group:stick", "group:stick", "group:stick"},
        {"group:stick", "wool:white", "group:stick"},
        {"group:stick", "group:stick", "group:stick"},
    }
})


minetest.register_node("paintings:andy_warhol_popart", {
    description = "Painting: Andy Warhol - Popart",
    drawtype = "nodebox",
    tiles = {"paintings_andy_warhol_popart.png"},
    inventory_image = "paintings_andy_warhol_popart.png",
    wield_image = "paintings_andy_warhol_popart.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:andy_warhol_popart",
    recipe = {
        {"dye:yellow", "dye:yellow", "dye:green"},
        {"dye:pink", "paintings:canvas", "dye:green"},
        {"dye:pink", "dye:blue", "dye:blue"},
    }
})


minetest.register_node("paintings:autumn_forest", {
    description = "Painting: Autumn Forest",
    drawtype = "nodebox",
    tiles = {"paintings_autumn_forest.png"},
    inventory_image = "paintings_autumn_forest.png",
    wield_image = "paintings_autumn_forest.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:autumn_forest",
    recipe = {
        {"dye:brown", "dye:grey", "dye:brown"},
        {"dye:brown", "paintings:canvas", "dye:brown"},
        {"dye:dark_green", "dye:dark_green", "dye:dark_green"},
    }
})


minetest.register_node("paintings:beach", {
    description = "Painting: Beach",
    drawtype = "nodebox",
    tiles = {"paintings_beach.png"},
    inventory_image = "paintings_beach.png",
    wield_image = "paintings_beach.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:beach",
    recipe = {
        {"dye:grey", "dye:blue", "dye:grey"},
        {"dye:green", "paintings:canvas", "dye:blue"},
        {"dye:blue", "dye:blue", "dye:blue"},
    }
})


minetest.register_node("paintings:cezanne", {
    description = "Painting: Cezanne",
    drawtype = "nodebox",
    tiles = {"paintings_cezanne.png"},
    inventory_image = "paintings_cezanne.png",
    wield_image = "paintings_cezanne.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:cezanne",
    recipe = {
        {"dye:dark_grey", "dye:dark_grey", "dye:dark_grey"},
        {"dye:blue", "paintings:canvas", "dye:pink"},
        {"dye:brown", "dye:brown", "dye:brown"},
    }
})


minetest.register_node("paintings:desert", {
    description = "Painting: Desert",
    drawtype = "nodebox",
    tiles = {"paintings_desert.png"},
    inventory_image = "paintings_desert.png",
    wield_image = "paintings_desert.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:desert",
    recipe = {
        {"dye:blue", "dye:blue", "dye:blue"},
        {"dye:orange", "paintings:canvas", "dye:orange"},
        {"dye:orange", "dye:orange", "dye:white"},
    }
})


minetest.register_node("paintings:misty_forest", {
    description = "Painting: Misty Forest",
    drawtype = "nodebox",
    tiles = {"paintings_misty_forest.png"},
    inventory_image = "paintings_misty_forest.png",
    wield_image = "paintings_misty_forest.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:misty_forest",
    recipe = {
        {"dye:dark_grey", "dye:dark_grey", "dye:dark_grey"},
        {"dye:dark_green", "paintings:canvas", "dye:dark_green"},
        {"dye:dark_green", "dye:dark_green", "dye:dark_green"},
    }
})


minetest.register_node("paintings:mountain_top", {
    description = "Painting: Mountain Top",
    drawtype = "nodebox",
    tiles = {"paintings_mountain_top.png"},
    inventory_image = "paintings_mountain_top.png",
    wield_image = "paintings_mountain_top.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:mountain_top",
    recipe = {
        {"dye:white", "dye:white", "dye:blue"},
        {"dye:green", "paintings:canvas", "dye:green"},
        {"dye:green", "dye:blue", "dye:green"},
    }
})


minetest.register_node("paintings:pines", {
    description = "Painting: Pines",
    drawtype = "nodebox",
    tiles = {"paintings_pines.png"},
    inventory_image = "paintings_pines.png",
    wield_image = "paintings_pines.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:pines",
    recipe = {
        {"dye:grey", "dye:grey", "dye:grey"},
        {"dye:green", "paintings:canvas", "dye:green"},
        {"dye:green", "dye:green", "dye:green"},
    }
})


minetest.register_node("paintings:petiapocok_dali_laba", {
    description = "Painting: PetiAPocok - Dali Lába",
    drawtype = "nodebox",
    tiles = {"paintings_petiapocok_dali_laba.png"},
    inventory_image = "paintings_petiapocok_dali_laba.png",
    wield_image = "paintings_petiapocok_dali_laba.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:petiapocok_dali_laba",
    recipe = {
        {"dye:brown", "dye:pink", "dye:brown"},
        {"dye:brown", "paintings:canvas", "dye:brown"},
        {"dye:brown", "dye:pink", "dye:brown"},
    }
})


minetest.register_node("paintings:petiapocok_golya_lab", {
    description = "Painting: PetiAPocok - Gólya Láb",
    drawtype = "nodebox",
    tiles = {"paintings_petiapocok_golya_lab.png"},
    inventory_image = "paintings_petiapocok_golya_lab.png",
    wield_image = "paintings_petiapocok_golya_lab.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:petiapocok_golya_lab",
    recipe = {
        {"dye:grey", "dye:orange", "dye:grey"},
        {"dye:grey", "paintings:canvas", "dye:grey"},
        {"dye:green", "dye:orange", "dye:green"},
    }
})


minetest.register_node("paintings:salvador_dali", {
    description = "Painting: Salvador Dali",
    drawtype = "nodebox",
    tiles = {"paintings_salvador_dali.png"},
    inventory_image = "paintings_salvador_dali.png",
    wield_image = "paintings_salvador_dali.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:salvador_dali",
    recipe = {
        {"dye:orange", "dye:orange", "dye:yellow"},
        {"dye:brown", "paintings:canvas", "dye:yellow"},
        {"dye:yellow", "dye:red", "dye:red"},
    }
})


minetest.register_node("paintings:shore", {
    description = "Painting: Shore",
    drawtype = "nodebox",
    tiles = {"paintings_shore.png"},
    inventory_image = "paintings_shore.png",
    wield_image = "paintings_shore.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:shore",
    recipe = {
        {"dye:white", "dye:blue", "dye:green"},
        {"dye:blue", "paintings:canvas", "dye:green"},
        {"dye:green", "dye:green", "dye:green"},
    }
})


minetest.register_node("paintings:sunset", {
    description = "Painting: Sunset",
    drawtype = "nodebox",
    tiles = {"paintings_sunset.png"},
    inventory_image = "paintings_sunset.png",
    wield_image = "paintings_sunset.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:sunset",
    recipe = {
        {"dye:yellow", "dye:red", "dye:grey"},
        {"dye:yellow", "paintings:canvas", "dye:green"},
        {"dye:green", "dye:brown", "dye:green"},
    }
})


minetest.register_node("paintings:winter", {
    description = "Painting: Winter",
    drawtype = "nodebox",
    tiles = {"paintings_winter.png"},
    inventory_image = "paintings_winter.png",
    wield_image = "paintings_winter.png",
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    walkable = false,
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
        wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
        wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
    },
    groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        minetest.get_meta(pos):set_string("infotext", minetest.registered_nodes[minetest.get_node(pos).name].description)
    end
})

minetest.register_craft({
    output = "paintings:winter",
    recipe = {
        {"dye:blue", "dye:blue", "dye:blue"},
        {"dye:white", "paintings:canvas", "dye:green"},
        {"dye:white", "dye:white", "dye:white"},
    }
})
