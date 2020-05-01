-- farming/init.lua

-- Global farming namespace

farming = {}
farming.path = minetest.get_modpath("farming")
farming.get_translator = S

-- Load files

dofile(farming.path .. "/api.lua")
dofile(farming.path .. "/nodes.lua")
dofile(farming.path .. "/hoes.lua")

dofile(farming.path .. "/plants/ananas.lua")
dofile(farming.path .. "/plants/bean.lua")
dofile(farming.path .. "/plants/beetroot.lua")
dofile(farming.path .. "/plants/blueberry.lua")
dofile(farming.path .. "/plants/carrot.lua")
dofile(farming.path .. "/plants/chili.lua")
dofile(farming.path .. "/plants/cocoa.lua")
dofile(farming.path .. "/plants/corn.lua")
dofile(farming.path .. "/plants/cotton.lua")
dofile(farming.path .. "/plants/cucumber.lua")
dofile(farming.path .. "/plants/garlic.lua")
dofile(farming.path .. "/plants/grapes.lua")
dofile(farming.path .. "/plants/hemp.lua")
dofile(farming.path .. "/plants/huckleberry.lua")
--dofile(farming.path .. "/plants/melon.lua")
dofile(farming.path .. "/plants/onion.lua")
dofile(farming.path .. "/plants/pea.lua")
dofile(farming.path .. "/plants/potato.lua")
--dofile(farming.path .. "/plants/pumpkin.lua")
dofile(farming.path .. "/plants/raspberry.lua")
dofile(farming.path .. "/plants/rice.lua")
dofile(farming.path .. "/plants/strawberry.lua")
dofile(farming.path .. "/plants/tomato.lua")
dofile(farming.path .. "/plants/wheat.lua")

dofile(farming.path .. "/plants/misc.lua")
dofile(farming.path .. "/plants/loot.lua")
dofile(farming.path .. "/plants/fuels.lua")
