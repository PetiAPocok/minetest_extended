-- Register farming items as dungeon loot
if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register({
		{name = "farming:string", chance = 0.5, count = {1, 8}},
		{name = "farming:wheat", chance = 0.5, count = {2, 5}},
		{name = "farming:seed_cotton", chance = 0.4, count = {1, 4},
            types = {"normal"}},

        {name = "farming:seed_ananas", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_bean", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_beetroot", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_blueberry", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_carrot", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_chili", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_cocoa", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_corn", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_cucumber", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_garlic", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_grape", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_hemp", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_lettuce", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_onion", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_pea", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_potato", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_raspberry", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_rice", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_strawberry", chance = 0.4, count = {1, 4}},
        {name = "farming:seed_tomato", chance = 0.4, count = {1, 4}}
	})
end

-- Register seeds
-- drop potatoes when digging in dirt
minetest.override_item("default:dirt_with_grass", {
	drop = {
		items = {
			{ items = {'default:dirt'}},
			{ items = {'farming:potato'}, rarity = 20 },
            { items = {'farming:peanut'}, rarity = 20 }
		}
	}
})

--seeds from grass
minetest.override_item("default:grass_1", {
	drop = {
		items = {
			{ items = {'default:grass_1'}},
            { items = {'farming:seed_blueberry'}, rarity = 20 },
            { items = {'farming:seed_carrot'}, rarity = 20 },
            { items = {'farming:seed_cucumber'}, rarity = 20 },
            { items = {'farming:seed_grape'}, rarity = 20 },
            { items = {'farming:seed_lettuce'}, rarity = 20 },
            { items = {'farming:seed_strawberry'}, rarity = 20 },
            { items = {'farming:seed_tomato'}, rarity = 20 },
            { items = {'farming:seed_wheat'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:grass_2", {
	drop = {
		items = {
			{ items = {'default:grass_1'}},
            { items = {'farming:seed_blueberry'}, rarity = 20 },
            { items = {'farming:seed_carrot'}, rarity = 20 },
            { items = {'farming:seed_cucumber'}, rarity = 20 },
            { items = {'farming:seed_grape'}, rarity = 20 },
            { items = {'farming:seed_lettuce'}, rarity = 20 },
            { items = {'farming:seed_strawberry'}, rarity = 20 },
            { items = {'farming:seed_tomato'}, rarity = 20 },
            { items = {'farming:seed_wheat'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:grass_3", {
	drop = {
		items = {
			{ items = {'default:grass_1'}},
            { items = {'farming:seed_blueberry'}, rarity = 20 },
            { items = {'farming:seed_carrot'}, rarity = 20 },
            { items = {'farming:seed_cucumber'}, rarity = 20 },
            { items = {'farming:seed_grape'}, rarity = 20 },
            { items = {'farming:seed_lettuce'}, rarity = 20 },
            { items = {'farming:seed_strawberry'}, rarity = 20 },
            { items = {'farming:seed_tomato'}, rarity = 20 },
            { items = {'farming:seed_wheat'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:grass_4", {
	drop = {
		items = {
			{ items = {'default:grass_1'}},
            { items = {'farming:seed_blueberry'}, rarity = 20 },
            { items = {'farming:seed_carrot'}, rarity = 20 },
            { items = {'farming:seed_cucumber'}, rarity = 20 },
            { items = {'farming:seed_grape'}, rarity = 20 },
            { items = {'farming:seed_lettuce'}, rarity = 20 },
            { items = {'farming:seed_strawberry'}, rarity = 20 },
            { items = {'farming:seed_tomato'}, rarity = 20 },
            { items = {'farming:seed_wheat'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:grass_5", {
	drop = {
		items = {
			{ items = {'default:grass_1'}},
            { items = {'farming:seed_blueberry'}, rarity = 20 },
            { items = {'farming:seed_carrot'}, rarity = 20 },
            { items = {'farming:seed_cucumber'}, rarity = 20 },
            { items = {'farming:seed_grape'}, rarity = 20 },
            { items = {'farming:seed_lettuce'}, rarity = 20 },
            { items = {'farming:seed_strawberry'}, rarity = 20 },
            { items = {'farming:seed_tomato'}, rarity = 20 },
            { items = {'farming:seed_wheat'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:dry_grass_1", { -- Grows in the savanna (dry dirt, acatia tree)
	drop = {
		items = {
			{ items = {'default:dry_grass_1'}},
            { items = {'farming:seed_corn'}, rarity = 20 },
			{ items = {'farming:seed_potato'}, rarity = 20 },
            { items = {'farming:seed_garlic'}, rarity = 20 },
            { items = {'farming:seed_onion'}, rarity = 20 },
            { items = {'farming:seed_rice'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:dry_grass_2", { -- Grows in the savanna (dry dirt, acatia tree)
	drop = {
		items = {
			{ items = {'default:dry_grass_1'}},
            { items = {'farming:seed_corn'}, rarity = 20 },
			{ items = {'farming:seed_potato'}, rarity = 20 },
            { items = {'farming:seed_garlic'}, rarity = 20 },
            { items = {'farming:seed_onion'}, rarity = 20 },
            { items = {'farming:seed_rice'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:dry_grass_3", { -- Grows in the savanna (dry dirt, acatia tree)
	drop = {
		items = {
			{ items = {'default:dry_grass_1'}},
            { items = {'farming:seed_corn'}, rarity = 20 },
			{ items = {'farming:seed_potato'}, rarity = 20 },
            { items = {'farming:seed_garlic'}, rarity = 20 },
            { items = {'farming:seed_onion'}, rarity = 20 },
            { items = {'farming:seed_rice'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:dry_grass_4", { -- Grows in the savanna (dry dirt, acatia tree)
	drop = {
		items = {
			{ items = {'default:dry_grass_1'}},
            { items = {'farming:seed_corn'}, rarity = 20 },
			{ items = {'farming:seed_potato'}, rarity = 20 },
            { items = {'farming:seed_garlic'}, rarity = 20 },
            { items = {'farming:seed_onion'}, rarity = 20 },
            { items = {'farming:seed_rice'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:dry_grass_5", { -- Grows in the savanna (dry dirt, acatia tree)
	drop = {
		items = {
			{ items = {'default:dry_grass_1'}},
            { items = {'farming:seed_corn'}, rarity = 20 },
			{ items = {'farming:seed_potato'}, rarity = 20 },
            { items = {'farming:seed_garlic'}, rarity = 20 },
            { items = {'farming:seed_onion'}, rarity = 20 },
            { items = {'farming:seed_rice'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:junglegrass", {
	drop = {
		items = {
			{ items = {'default:junglegrass'}},
			{ items = {'farming:seed_ananas'}, rarity = 20 },
            { items = {'farming:seed_chili'}, rarity = 20 },
            { items = {'farming:seed_cotton'}, rarity = 20 },
            { items = {'farming:seed_cocoa'}, rarity = 20 },
            { items = {'farming:seed_rice'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:marram_grass_1", { -- Grows on sand (anywhere)
	drop = {
		items = {
			{ items = {'default:marram_grass_1'}},
			{ items = {'farming:seed_bean'}, rarity = 20 },
            { items = {'farming:seed_hemp'}, rarity = 20 },
            { items = {'farming:seed_huckleberry'}, rarity = 20 },
            { items = {'farming:seed_melon'}, rarity = 20 },
            { items = {'farming:seed_pumpkin'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:marram_grass_2", { -- Grows on sand (anywhere)
	drop = {
		items = {
			{ items = {'default:marram_grass_1'}},
			{ items = {'farming:seed_bean'}, rarity = 20 },
            { items = {'farming:seed_hemp'}, rarity = 20 },
            { items = {'farming:seed_huckleberry'}, rarity = 20 },
            { items = {'farming:seed_melon'}, rarity = 20 },
            { items = {'farming:seed_pumpkin'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:marram_grass_3", { -- Grows on sand (anywhere)
	drop = {
		items = {
			{ items = {'default:marram_grass_1'}},
			{ items = {'farming:seed_bean'}, rarity = 20 },
            { items = {'farming:seed_hemp'}, rarity = 20 },
            { items = {'farming:seed_huckleberry'}, rarity = 20 },
            { items = {'farming:seed_melon'}, rarity = 20 },
            { items = {'farming:seed_pumpkin'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:fern_1", { -- Grows in warm pine forests
	drop = {
		items = {
			{ items = {'default:fern_1'}},
			{ items = {'farming:seed_beetroot'}, rarity = 20 },
            { items = {'farming:seed_pea'}, rarity = 20 },
            { items = {'farming:seed_raspberry'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:fern_2", { -- Grows in warm pine forests
	drop = {
		items = {
			{ items = {'default:fern_1'}},
			{ items = {'farming:seed_beetroot'}, rarity = 20 },
            { items = {'farming:seed_pea'}, rarity = 20 },
            { items = {'farming:seed_raspberry'}, rarity = 20 }
		}
	}
})

minetest.override_item("default:fern_3", { -- Grows in warm pine forests
	drop = {
		items = {
			{ items = {'default:fern_1'}},
			{ items = {'farming:seed_beetroot'}, rarity = 20 },
            { items = {'farming:seed_pea'}, rarity = 20 },
            { items = {'farming:seed_raspberry'}, rarity = 20 }
		}
	}
})
