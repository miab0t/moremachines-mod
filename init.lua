-- More Machines Mod 
-- by miab0t
-- This package started as addendem codes to the Home Decor Mod, thus much of the originating code was written by VanessaEcode 
-- The snack machine was based off the Beverage Mod Api by Mahmutelmas06
-- Sound files by: 
-- cmusounddesign https://www.freesound.org/people/cmusounddesign/sounds/84710/ cropped for vending machines
-- enric592 https://www.freesound.org/people/enric592/sounds/185737/ cropped for change machine
-- amabok https://www.freesound.org/people/amabok/sounds/41195/ cropped for ATM


local modpath = minetest.get_modpath("moremachines")

moremachines = {
	modpath = modpath,

	gettext = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end,

	expect_infinite_stacks = minetest.setting_getbool("creative_mode") and not minetest.get_modpath("unified_inventory")
}

dofile(modpath.."/handlers/init.lua")
dofile(modpath.."/money_machines.lua")
dofile(modpath.."/treat_machines.lua")
dofile(modpath.."/icecream.lua")
print("[moremachines] " .. moremachines.gettext("Loaded!"))

