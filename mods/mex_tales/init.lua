local function register_tale_book(name, author, title, content)
    minetest.register_craftitem("mex_tales:" .. name, {
        description = author .. " - " .. title,
        inventory_image = "mex_tales_book_green.png",
        groups = {book = 1, flammable = 3},
        stack_max = 1,
        on_use = function(itemstack, user, pointed_thing)
            minetest.show_formspec(user:get_player_name(), "mex_tales:" .. name, "size[8,8]" ..
            "label[0.5,0.5;" .. author .. "]" ..
            "tablecolumns[color;text]" ..
            "tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
            "table[0.4,0;7,0.5;title;#FFFF00," .. title .. "]" ..
            "textarea[0.5,1.5;7.5,7;;" .. content .. ";]")
        end,
    })
end

register_tale_book("farming",
    "Norim Oiram",
    "The Gift of Nature I",
    "If you look around you can clearly see the beauty of nature, but did you know that there is more beyond that. You can find seeds in the undergrowth that are useful for you as you can till the soil with a hoe and plant them. If you do this near some water you will have beautiful, large produces, which will provide the necessary nutrients for the survival."
)

register_tale_book("fishng",
    "Norim Oiram",
    "The Gift of Nature II",
    "If you dig enough in the dirt you will notice that it holds many \"treasures\" that could be useful for you. Like the recyclers of the nature, the worms. They prove to be a perfect source of bait for catching the fishes which is a great source of protein."
)

-- register_tale_book("herding",
--     "Norim Oiram",
--     "The Gift of Nature III",
--     ""
-- )

register_tale_book("magic",
    "Norim Oiram",
    "Instruments of Magic",
    "After meeting several scholars in the wizardry I managed to see some magnificent tools. Some shoot elemental energies, some make boring tasks faster and easier. One of them was a really convenient way of transportation trough thin air. To use these you need to have some magical energy. The wizards said they managed to achieve their powers and knowledge by studying and experimenting with a material called mese. The distilled concentration of the mineral is able to increase one's magic powers. I need to obtain some equipment..."
)

register_tale_book("underworld",
    "Norim Oiram",
    "Deep Below",
    "I keep spending more and more time with the scholars. They are fascinating. And they accepted me as their notary so they can concentrate on their work while I write their notes. So many interesting topic. For example supposedly there is a place deep under our feet where our souls live until we reincarnate."
)

register_tale_book("paralell",
    "Norim Oiram",
    "Next to us",
    "During my investigation on the topic of magic I heard about an unsettling place. It is said that the place is the home of monsters and demons. If I understand it correctly it is right here but not. We are separated by an invisible, thin fabric of space so we can't interact with each other, for our luck. But some rumors said that the border between the two worlds are getting thinner and thinner till it disappears and the monsters will invade us."
)

register_tale_book("escaping",
    "Norim Oiram",
    "Escaping",
    "It is now certain that your days are counted because of the disappearing dimensional border. The monsters are coming. We can't stop them. But we can escape. If it is true that their world's terrain is the same as ours that means that the sky too, the same. Empty. So if we were able to move to the sky before they arrive we will be safe."
)

register_tale_book("preparation",
    "Norim Oiram",
    "The Preparation",
    "We are almost ready to move to the sky. We will use the power of an ancient device called The Chariot of Mex. The scholars started studying it centuries ago. Thanks to it, our exploring of the magic were much easier and faster. We were only be able to figure out that it was a transportation device but we newer managed to get it moving. We are missing the fuel to travel with it. But the scholars are trying to build a device to amplify and channel their magic to the Chariot and use it to move a large piece of the surface to the sky."
)

register_tale_book("failure",
    "Norim Oiram",
    "We Failed",
    "Yesterday night we decided to go but what happened isn't what we planned. The scholars started the device but instead teleporting our kingdom to the sky it destroyed it. When I regained consciousness there were missing parts of the surface like if it only moved parts of the area to, hopefully safe, into the sky. The rest of the kingdom were left in ruins. But this isn't even the worst. I've been left alone. I can't find anyone. None of my friends. The traders. The scholars. Everybody is gone."
)

register_tale_book("legacy",
    "Norim Oiram",
    "My Legacy",
    "I've left uncountable pieces of books around the world but I started to feel worse and worse. I knew something was wrong. And as the time went on I realized, I stopped aging. I have lost my sense of time but it was clear to me that I should have been older. My theory is that something happened with me at the Chariot. But I haven't seen any monsters yet."
)

register_tale_book("monsters",
    "Norim Oiram",
    "The First Monsters",
    "I've encoutered my first monster. It was tough but I managed to kill it. I'm covered in blood all over my body. I need to make some weapons for myself. I don't know how much longer I will be able to manage myself. I wish I would have learned magic..."
)

-- Register books as chest loot
dungeon_loot.register({
    {name = "mex_tales:farming", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:fishng", chance = 0.9, count = {1, 1}},
    -- {name = "mex_tales:herding", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:magic", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:underworld", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:paralell", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:escaping", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:preparation", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:failure", chance = 0.9, count = {1, 1}},
    {name = "mex_tales:legacy", chance = 0.5, count = {1, 1}},
    {name = "mex_tales:monsters", chance = 0.1, count = {1, 1}},
})
