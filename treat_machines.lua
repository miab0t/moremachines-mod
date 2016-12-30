-- More Machines - Treats 

local S = moremachines.gettext


-- Ice Cream Freezer

local f_box = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.375, 0.5, 0.3125, 0.375 }
}


moremachines.register("icecream_freezer", {
	description = S("Ice Cream Freezer"),
        light_source = 17,
        groups = {snappy=3},
        inventory_image = "icecream_freezer_inv.png",
        tiles = {
		"icecream_top.png",
		"icecream_bottom.png",
		"icecream_front.png",
		"icecream_front.png",
		"icecream_true.png",
		"icecream_true.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 1.5, 0.5, 0.5}, -- Freezer
		}
	},
       sounds = default.node_sound_stone_defaults(),
	infotext=S("Ice Cream Freezer"),
    selection_box = f_box,
	collision_box = f_box,
	inventory = {
		size=50,
		lockable=true,
	},
	on_rotate = screwdriver.rotate_simple
})


local popcorn_box = {
        type = "fixed",
        fixed = {-0.5, -0.5, -0.5, 0, 0.125, 0} -- Popcorn 
}

moremachines.register("popcorn", {
		description = "Popcorn",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
		walkable = false,
                inventory_image = "food_popcorn_inv.png",
		sunlight_propagates = true,
		tiles = {
			"popcorn_texture.png",
			"popcorn_texture.png",
			"popcorn_texture_side.png",
			"popcorn_texture_side.png",
			"popcorn_texture_side.png",
			"popcorn_texture_side.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = popcorn_box
})	

local svm_cbox = {
	type = "fixed",
	fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
}


moremachines.register("popcorn_machine", {
	description = "Popcorn Vending Machine",
        light_source = 12,
	mesh = "popcorn_machine.obj",
	tiles = {"popcorn_machine.png"},
	groups = {snappy=3},
	selection_box = cvm_cbox,
	collision_box = cvm_cbox,
	expand = { top="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = screwdriver.rotate_simple,
	on_punch = function(pos, node, puncher, pointed_thing)
		local wielditem = puncher:get_wielded_item()
		local wieldname = wielditem:get_name()
		local fdir_to_fwd = { {0, -1}, {-1, 0}, {0, 1}, {1, 0} }
		local fdir = node.param2
		local pos_drop = { x=pos.x+fdir_to_fwd[fdir+1][1], y=pos.y, z=pos.z+fdir_to_fwd[fdir+1][2] }
		
                 if wieldname == "bitchange:minecoin" or 
       wieldname == "default:gold_lump" or 
       wieldname == "currency:minegeld" or
       wieldname == "currency:minegeld_5" or
       wieldname == "currency:minegeld_10" or
       wieldname == "mint:pences" or
       wieldname == "mint:shillings" or
       wieldname == "mint:pounds" or
       wieldname == "bitchange:mineninth" or
       wieldname == "homedecor:coin" or
       wieldname == "moremachines:dollar"   
            then
			wielditem:take_item()
			puncher:set_wielded_item(wielditem)
			minetest.spawn_item(pos_drop, "moremachines:popcorn")
			minetest.sound_play("vending", {
				pos=pos, max_hear_distance = 5
			})
		else
			minetest.chat_send_player(puncher:get_player_name(), "Please insert $1 in the machine.")
		end
	end
})


local cc_box = {
        type = "fixed",
        fixed = {
			{-0.1875, -0.0625, -0.1875, 0.1875, 0.375, 0.1875}, 
			{-0.0625, -0.5, -0.0625, 0.0625, 0.0625, 0.0625}, 
        }
}

moremachines.register("cottoncandy", {
		description = "Cotton Candy",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
                inventory_image = "cottoncandy_inv.png",
		walkable = false,
		sunlight_propagates = true,
		tiles = {
		"cottoncandy_top_texture.png",
		"cottoncandy_bottom_texture.png",
		"cottoncandy_texture.png",
		"cottoncandy_texture.png",
		"cottoncandy_texture.png",
		"cottoncandy_texture.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = cc_box
})	

	



moremachines.register("cottoncandy_machine", {
	description = "Cotton Candy Vending Machine",
        light_source = 12,
	mesh = "cottoncandy_machine.obj",
	tiles = {"cottoncandy_machine.png"},
	groups = {snappy=3},
	selection_box = svm_cbox,
	collision_box = svm_cbox,
	expand = { top="placeholder" },
	sounds = default.node_sound_wood_defaults(),
	on_rotate = screwdriver.rotate_simple,
	on_punch = function(pos, node, puncher, pointed_thing)
		local wielditem = puncher:get_wielded_item()
		local wieldname = wielditem:get_name()
		local fdir_to_fwd = { {0, -1}, {-1, 0}, {0, 1}, {1, 0} }
		local fdir = node.param2
		local pos_drop = { x=pos.x+fdir_to_fwd[fdir+1][1], y=pos.y, z=pos.z+fdir_to_fwd[fdir+1][2] }
		 if wieldname == "bitchange:minecoin" or 
       wieldname == "default:gold_lump" or 
       wieldname == "currency:minegeld" or
       wieldname == "currency:minegeld_5" or
       wieldname == "currency:minegeld_10" or
       wieldname == "mint:pences" or
       wieldname == "mint:shillings" or
       wieldname == "mint:pounds" or
       wieldname == "bitchange:mineninth" or
       wieldname == "homedecor:coin" or
       wieldname == "moremachines:dollar"
      then
			wielditem:take_item()
			puncher:set_wielded_item(wielditem)
			minetest.spawn_item(pos_drop, "moremachines:cottoncandy")
			minetest.sound_play("vending", {
				pos=pos, max_hear_distance = 5
			})
		else
			minetest.chat_send_player(puncher:get_player_name(), "Please insert $1 in the machine.")
		end
	end
})


-- Register Snacks 

local candy_box = {
       type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.25, 0.375, -0.1875, -0.125}, -- CandyBox
		}
}

local gum_box = {
       	type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.25, 0.125, -0.4375, -0.1875}, -- GumBox
		}
}

local cookies_box = {
       	type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.25, 0.125, -0.25, -0.125}, -- CookiesBox
		}
}

local chips_box = {
       type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.25, 0.125, -0.125, -0.0625}, -- ChipsBox
		}
}

local cheese_box = {
       	type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.25, 0.125, -0.125, -0.0625}, -- CheeseBox
		}
}


moremachines.register("candy", {
		description = "Candy",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
                inventory_image = "candy_inv.png",
		walkable = false,
		sunlight_propagates = true,
		tiles = {
		"candy-y.png",
		"candy-y.png",
		"candy.png",
		"candy.png",
		"candy.png",
		"candy.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = candy_box
})	

moremachines.register("chocolatebar", {
		description = "Chocolate Bar",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
                inventory_image = "chocolatebar_inv.png",
		walkable = false,
		sunlight_propagates = true,
		tiles = {
		"chocolatebar-b.png",
		"chocolatebar-b.png",
		"chocolatebar-b.png",
		"chocolatebar-b.png",
		"chocolatebar.png",
		"chocolatebar.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = candy_box
})	



moremachines.register("gum", {
		description = "gum",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
                inventory_image = "gum_inv.png",
		walkable = false,
		sunlight_propagates = true,
		tiles = {
		"gum-g.png",
		"gum-g.png",
		"gum-g.png",
		"gum-g.png",
		"gum.png",
		"gum.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = gum_box
})	

moremachines.register("chips", {
		description = "Chips",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
                inventory_image = "chips_inv.png",
		walkable = false,
		sunlight_propagates = true,
		tiles = {
		"chips-r.png",
		"chips-r.png",
		"chips-r.png",
		"chips-r.png",
		"chips.png",
		"chips.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = chips_box
})	

moremachines.register("cookies", {
		description = "Cookies",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
                inventory_image = "cookies_inv.png",
		walkable = false,
		sunlight_propagates = true,
		tiles = {
		"cookies-b.png",
		"cookies-b.png",
		"cookies-b.png",
		"cookies-b.png",
		"cookies.png",
		"cookies.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = cookies_box
})	


moremachines.register("cheesesnacks", {
		description = "Cheese Snacks",
		on_use = minetest.item_eat(2),
		groups={food=3,crumbly=3},
                inventory_image = "cheesesnacks_inv.png",
		walkable = false,
		sunlight_propagates = true,
		tiles = {
		"cheesesnacks-y.png",
		"cheesesnacks-y.png",
		"cheesesnacks-y.png",
		"cheesesnacks-y.png",
		"cheesesnacks.png",
		"cheesesnacks.png"
		},
		drawtype="nodebox",
		paramtype = "light",
		node_box = chips_box
})

--- Snack Machine



local moremachinessnack=  {"moremachines:candy",
                      "moremachines:chocolatebar", 
                      "moremachines:gum", 
                      "moremachines:chips",
                      "moremachines:cookies",
                      "moremachines:cheesesnacks"
                     }

minetest.register_node("moremachines:snackmachine", {
	description = S("Snack Machine"),
  drawtype = "mesh",
	mesh = "snack_machine.obj",
  inventory_image = "snack_machine_inv.png",
  paramtype = "light",
  paramtype2 = "facedir",
  light_source = 15,
  tiles = {"snack_machine.png"},
  groups = {snappy=3},
  selection_box = {
		 type = "fixed",
     fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
	},
  collision_box = {
		 type = "fixed",
     fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
	},

	expand = { top="placeholder" }, 
	sounds = default.node_sound_glass_defaults(),
	on_rotate = screwdriver.rotate_simple,
	on_punch = function(pos, node, puncher, pointed_thing)
		local wielditem = puncher:get_wielded_item()
		local wieldname = wielditem:get_name()
		local fdir_to_fwd = { {0, -1}, {-1, 0}, {0, 1}, {1, 0} }
		local fdir = node.param2
		local pos_drop = { x=pos.x+fdir_to_fwd[fdir+1][1], y=pos.y, z=pos.z+fdir_to_fwd[fdir+1][2] }
    
    if wieldname == "bitchange:minecoin" or 
       wieldname == "default:gold_lump" or 
       wieldname == "currency:minegeld" or
       wieldname == "currency:minegeld_5" or
       wieldname == "currency:minegeld_10" or
       wieldname == "mint:pences" or
       wieldname == "mint:shillings" or
       wieldname == "mint:pounds" or
       wieldname == "bitchange:mineninth" or
       wieldname == "homedecor:coin" or
       wieldname == "moremachines:dollar"
      then
      wielditem:take_item()
			puncher:set_wielded_item(wielditem)
      local moremachinessnacks = moremachinessnack
      local RndChoice = moremachinessnacks[math.random( #moremachinessnacks )]
			minetest.spawn_item(pos_drop, RndChoice)
			minetest.sound_play("vending", {
				pos=pos, max_hear_distance = 5
			})
		else
			minetest.chat_send_player(puncher:get_player_name(), S("Please insert $1 in the machine."))
		end
	end
})




