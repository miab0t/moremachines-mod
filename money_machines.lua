--More Machines - Money

local S = moremachines.gettext


local register_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, 
			{-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5}, 
		}
	}

-- Cash Register Storage
moremachines.register("cashregister", {
	tiles = {
		"cashregister_tp.png",
		"cashregister_bt.png",
		"cashregister_rt.png",
		"cashregister_lt.png",
		"cashregister_bk.png",
		"cashregister_front.png"
	},
        drawtype = "nodebox",
        paramtype = "light",
        light_source = 10,
	inventory_image = "cashregister_inv.png",
	description = S("Cash register (white)"),
	nodebox = register_box,
        groups = {snappy=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = register_box,
	node_box = register_box,
	
	infotext=S("Cash Register"),
	inventory = {
		size=50,
		lockable=true,
	},
	on_rotate = screwdriver.rotate_simple
})


local svm_cbox = {
	type = "fixed",
	fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
}


-- Change Machine
moremachines.register("change_machine", {
	description = "Change Vending Machine",
	mesh = "change_machine.obj",
	tiles = {"change_machine.png"},
	groups = {snappy=3},
        light_source = 3,
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
       wieldname == "moremachines:dollar" then
			wielditem:take_item()
			puncher:set_wielded_item(wielditem)
			minetest.spawn_item(pos_drop, "homedecor:coin")
			minetest.sound_play("change", {
				pos=pos, max_hear_distance = 5
			})
		else
			minetest.chat_send_player(puncher:get_player_name(), "Please insert $1 in the machine.")
		end
	end
})

-- ATM 

moremachines.register("atm_machine", {
	description = "ATM Machine",
        light_source = 12,
	mesh = "atm_machine.obj",
	tiles = {"atm_machine.png"},
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
		if wieldname == "moremachines:creditcard" then
			wielditem:take_item()
			puncher:set_wielded_item(wielditem)
			minetest.spawn_item(pos_drop, "moremachines:10dollars")
			minetest.sound_play("atm", {
				pos=pos, max_hear_distance = 5
			})
		else
			minetest.chat_send_player(puncher:get_player_name(), "Please insert your credit card in the machine.")
		end
	end
})



-- Extra Item (Locker)
moremachines.register("locker", {
	mesh = "locker.obj",
	tiles = { "locker.png" },
	inventory_image = "locker_inv.png",
	description = "Locker",
	groups = {snappy=3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = moremachines.nodebox.slab_y(2),
	collision_box = moremachines.nodebox.slab_y(2),
	expand = { top="placeholder" },
	infotext= "Locker",
	inventory = {
		size=50,
		lockable=true,
	},
	on_rotate = screwdriver.rotate_simple
})


-- Register Items

-- Credit card
minetest.register_node("moremachines:creditcard", {
	description = "Credit Card",
	drawtype = "signlike",
	tiles = {"creditcard.png"},
	inventory_image = "creditcard.png",
	wield_image = "creditcard.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 8,
	walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

-- ATM Sign
minetest.register_node("moremachines:atmsign", {
	description = "ATM Sign",
	drawtype = "signlike",
	tiles = {"atm-sign.png"},
	inventory_image = "atm-sign.png",
	wield_image = "atm-sign.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_source = 8,
	walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

-- Money

minetest.register_node("moremachines:dollar", {
    description = "Dollar Bill",
    weild_image = "dollar.png",
    inventory_image = "dollar.png",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = { "dollar.png" },
	groups = {oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.25, 0.4375, -0.4375, 0.1875}, -- Money
		}
	}
})


minetest.register_node("moremachines:10dollars", {
    description = "10 Dollar Bill",
    weild_image = "10dollars.png",
    inventory_image = "10dollars.png",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = { "10dollars.png" },
	groups = {oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.25, 0.4375, -0.4375, 0.1875}, -- Money
		}
	}
})



-- Security Camera

minetest.register_node("moremachines:security", {
        description = "Security Camera",
        inventory_image = "security_inv.png",
	tiles = {
		"security_top.png",
		"security_bottom.png",
		"security_right.png",
		"security_left.png",
		"security_back.png",
		"security_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
	walkable = true,
	groups = {snappy=3},
	sound = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, -0.125, -0.125, 0.5}, -- Security Camera
		}
	}
})



