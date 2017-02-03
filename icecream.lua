-- Ice Cream Ingredients


local S = 0
if rawget(_G, "intllib") then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
else
	S = function ( s ) return s end
end


food.module("icecream1", function()
	minetest.register_craftitem(":food:icecream1", {
		description = S("Vanilla Ice Cream"),
		inventory_image = "food_icecream_vanilla.png",
                on_use = food.item_eat(4),
		groups = {food_icecream1=1}
	})
	food.craft({
		output = "food:icecream1",
		recipe = {
			{"group:food_sugar","group:food_milk","default:ice"},
                        {"group:food_vanilla","",""},
                        {"","",""}
		}
	})
end, true)

food.module("icecream2", function()
	minetest.register_craftitem(":food:icecream2", {
		description = S("Chocolate Ice Cream"),
		inventory_image = "food_icecream_chocolate.png",
                on_use = food.item_eat(4),
		groups = {food_icecream2=1}
	})
	food.craft({
		output = "food:icecream2",
		recipe = {
		    {"group:food_sugar","group:food_milk","default:ice"},
                        {"group:food_cocoa", "",""},
                        { "", "", ""} 

		}
	})
end, true)


food.module("icecream3", function()
	minetest.register_craftitem(":food:icecream3", {
		description = S("Strawberry Ice Cream"),
		inventory_image = "food_icecream_berry.png",
                on_use = food.item_eat(4),
		groups = {food_icecream3=1}
	})
	food.craft({
		output = "food:icecream3",
		recipe = {
			{"group:food_sugar","group:food_milk","default:ice"},
			{"group:food_berry", "",""},
			{"","",""}
		}
	})
end, true)


food.module("berry", function()
	minetest.register_craftitem(":food:berry", {
		description = S("Berry"),
		inventory_image = "food_berry.png",
		groups = {food_berry = 1}
	})
	food.craft({
		output = "food:berry",
		recipe = {
			{"", "default:desert_sand", ""},
			{"default:desert_sand", "", "default:desert_sand"},
			{"", "default:desert_sand", ""}
		}
	})
end, true)



food.module("icecream4", function()
	minetest.register_craftitem(":food:icecream4", {
		description = S("Mint Chocolate Chip Ice Cream"),
		inventory_image = "food_icecream_mint.png",
                on_use = food.item_eat(4),
		groups = {food_icecream4=1}
	})
	food.craft({
		output = "food:icecream4",
		recipe = {
			{"group:food_sugar","group:food_milk","default:ice"},
			{"group:food_mint","group:food_cocoa",""},
			{"","",""}
		}
	})
end, true)

food.module("icecream5", function()
	minetest.register_craftitem(":food:icecream5", {
		description = S("Cookies & Cream Ice Cream"),
		inventory_image = "food_icecream_cookies.png",
                on_use = food.item_eat(4),
		groups = {food_icecream5=1}
	})
	food.craft({
		output = "food:icecream5",
		recipe = {
			{"group:food_sugar","group:food_milk","default:ice"},
			{"group:food_cookies","",""},
			{"","",""}
		}
	})
end, true)



