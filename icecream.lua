-- Ice Cream Ingredients


local S = 0
if rawget(_G, "intllib") then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
	S = function ( s ) return s end
end


minetest.register_craftitem("moremachines:vanilla", {
		description = S("Vanilla"),
		inventory_image = "vanilla.png",
		groups = {moremachines_vanilla = 1}
	})


minetest.register_craftitem("moremachines:strawberry", {
		description = S("Strawberry"),
		inventory_image = "strawberry.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_strawberry = 1}
	})
	

minetest.register_craftitem("moremachines:mint", {
		description = S("Mint"),
		inventory_image = "mint.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_mint = 1}
	})
	



minetest.register_craftitem("moremachines:cookie", {
		description = S("Cookie"),
		inventory_image = "cookie.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_cookies = 1}
	})
	



minetest.register_craftitem("moremachines:icecream1", {
		description = S("Vanilla Ice Cream"),
		inventory_image = "icecream_vanilla.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_icecream1=1}
	})
	
minetest.register_craft({
		output = "moremachines:icecream1",
		recipe = {
			{"group:moremachines_sugar","group:moremachines_milk","default:ice"},
                        {"group:moremachines_vanilla","",""},
                        {"","",""}
		}
})



minetest.register_craftitem("moremachines:icecream2", {
		description = S("Chocolate Ice Cream"),
		inventory_image = "icecream_chocolate.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_icecream2=1}
	})
	
minetest.register_craft({
		output = "moremachines:icecream2",
		recipe = {
		    {"group:moremachines_sugar","group:moremachines_milk","default:ice"},
                        {"group:moremachines_cocoa", "",""},
                        { "", "", ""} 

		}
})



minetest.register_craftitem("moremachines:icecream3", {
		description = S("Strawberry Ice Cream"),
		inventory_image = "icecream_strawberry.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_icecream3=1}
	})
	
minetest.register_craft({
		output = "moremachines:icecream3",
		recipe = {
			{"group:moremachines_sugar","group:moremachines_milk","default:ice"},
			{"group:moremachines_strawberry", "",""},
			{"","",""}
		}
})



minetest.register_craftitem("moremachines:icecream4", {
		description = S("Mint Chocolate Chip Ice Cream"),
		inventory_image = "icecream_mint.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_icecream4=1}
	})
	
minetest.register_craft({
		output = "moremachines:icecream4",
		recipe = {
			{"group:moremachines_sugar","group:moremachines_milk","default:ice"},
			{"group:moremachines_mint","group:moremachines_cocoa",""},
			{"","",""}
		}
})


minetest.register_craftitem("moremachines:icecream5", {
		description = S("Cookies & Cream Ice Cream"),
		inventory_image = "icecream_cookies.png",
                on_use = minetest.item_eat(4),
		groups = {moremachines_icecream5=1}
	})
	
minetest.register_craft({
		output = "moremachines:icecream5",
		recipe = {
			{"group:moremachines_sugar","group:moremachines_milk","default:ice"},
			{"group:moremachines_cookie","",""},
			{"","",""}
		}
})

