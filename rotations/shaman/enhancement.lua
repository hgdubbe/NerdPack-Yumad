local GUI = {
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkbox', text = 'Enable Astral Shift', key = 'S_ASE', default = true},
	{type = 'spinner', text = 'Astral Shift (Health %)', key = 'S_AS', default = 40},
	{type = 'checkbox', text = 'Enable Healing Surge', key = 'S_HSGE', default = true},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'S_HSG', default = 35},
	{type = 'checkbox', text = 'Enable Gift of the Naaru', key = 'S_GOTNE', default = true},
	{type = 'spinner', text = 'Gift of the Naaru (Health %)', key = 'S_GOTN', default = 40},
	--{type = 'checkbox', text = 'Enable Healthstone', key = 'S_HSE', default = true},
	--{type = 'spinner', text = 'Healthstone (Health %)', key = 'S_HS', default = 20},
	--{type = 'checkbox', text = 'Enable Ancient Healing Potion', key = 'S_AHPE', default = true},
	--{type = 'spinner', text = 'Ancient Healing Potion (Health %)', key = 'S_AHP', default = 20},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Emergency Group Healing
	{type = 'header', text = 'Emergency Group Healing', align = 'center'},
	{type = 'checkbox', text = 'Enable Emergency Group Healing', key = 'E_HSGE', default = false},
	{type = 'text', text = 'Thresholds set to ensure party member survival.'},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'E_HSG', default = 35},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	--{type = 'checkbox', text = 'L-Shift: Liquid Magma Totem @ Cursor', key = 'K_LMT', default = true},
	{type = 'checkbox', text = 'L-Control: Lightning Surge Totem @ Cursor', key = 'K_LST', default = true},
	{type = 'checkbox', text = 'L-Alt: Earthbind Totem @ Cursor', key = 'K_ET', default = true},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'text', text = 'Activate on-use trinkets on cooldown.'},
	{type = 'checkbox', text = 'Enable Top Trinket', key = 'trinket_1', default = false},
	{type = 'checkbox', text = 'Enable Bottom Trinket', key = 'Trinket_2', default = false},
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff0070de ----------------------------------------------------------------------|r')
	print('|cff0070de --- |rShaman: |cff0070deENHANCEMENT|r')
	print('|cff0070de --- |rSuggested Talents: 1/2 - 2/X - 3/1 - 4/2 - 5/2 - 6/2 - 7/2')
	print('|cfff58cba --- |rNo Multitarget (AoE) enabled settings')
	print('|cff0070de ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		-- Cleanse Spirit
		key = 'yuPS',
		name = 'Cleanse Spirit',
		text = 'Enable/Disable: Automatic removal of curses.',
		icon = 'Interface\\ICONS\\ability_shaman_cleansespirit',
	})
end

local Survival = {
	-- Astral Shift usage if enabled in UI.
	{'&Astral Shift', 'UI(S_ASE)&player.health<=UI(S_AS)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'&Gift of the Naaru', '{!player.debuff(Ignite Soul)}&UI(S_GOTNE)&player.health<=UI(S_GOTN)'},
	-- Healthstone usage if enabled in UI.
	--{'#Healthstone', 'UI(S_HSE)&player.health<=UI(S_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	--{'#Ancient Healing Potion', 'UI(S_AHPE)&player.health<=UI(S_AHP)'},
}

local Player = {
	-- Healing Surge usage if enabled in UI.
	{'!Healing Surge', '!moving&{!player.debuff(Ignite Soul)}&UI(S_HSGE)&player.health<=UI(S_HSG)', 'player'},
}

local Emergency = {
	-- Healing Surge usage if enabled in UI.
	{'!Healing Surge', '!moving&{!lowest.debuff(Ignite Soul)}&UI(E_HSGE)&lowest.health<=UI(E_HSG)', 'lowest'},
}

local Keybinds = {
	-- Lightning Surge Totem at cursor on Left-Control if enabled in UI.
	{'!Lightning Surge Totem', 'keybind(lcontrol)&UI(K_LST)', 'cursor.ground'},
	-- Earthbind Totem at cursor on Left-Alt if enabled in UI.
	{'!Earthbind Totem', 'keybind(lalt)&UI(K_ET)', 'cursor.ground'},
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)'},
}

local Interrupts = {
	{'&Wind Shear'},
}

local Dispel = {
	{'%dispelall'},
}

-- ####################################################################################
-- Primairly sourced from legion-dev SimC.
-- Updates to rotations from sources are considered for implementation.
-- ####################################################################################

-- SimC APL 1/10/2017
-- https://github.com/simulationcraft/simc/blob/legion-dev/profiles/Tier19M/Shaman_Enhancement_T19M.simc

local Cooldowns = {
	{'Ascendance','talent(7,1)&player.buff(Stormbringer)'},
	{'Feral Spirit','!artifact(Alpha Wolf).enabled||player.maelstrom>=20&spell(Crash Lightning).cooldown<=gcd'},
	{'&Blood Fury', 'lastcast(Feral Spirit)'},
	{'&Berserking', 'player.buff(Ascendance)||!talent(7,1)&lastcast(Feral Spirit)'},
}

local Combat = {
	--actions+=/crash_lightning,if=artifact.alpha_wolf.rank&prev_gcd.1.feral_spirit
	{'Crash Lightning', 'artifact(Alpha Wolf).enabled&lastcast(Feral Spirit)'},
	--actions+=/boulderfist,if=buff.boulderfist.remains<gcd|(maelstrom<=50&active_enemies>=3)
	{'Boulderfist', 'talent(1,3)&player.buff(Boulderfist).remains<gcd||{player.maelstrom<=50&player.area(8).enemies>=3}'},
	--actions+=/boulderfist,if=buff.boulderfist.remains<gcd|(charges_fractional>1.75&maelstrom<=100&active_enemies<=2)
	{'Boulderfist', 'talent(1,3)&player.buff(Boulderfist).remains<gcd||{spell(Boulderfist).charges>1.75&player.maelstrom<=100&player.area(8).enemies<=2}'},
	--actions+=/rockbiter,if=talent.landslide.enabled&buff.landslide.remains<gcd
	{'Rockbiter', 'talent(7,2)&player.buff(Landslide).remains<gcd'},
	--actions+=/fury_of_air,if=!ticking&maelstrom>22
	{'Fury of Air', 'talent(6,2)&!player.buff(Fury of Air)&player.maelstrom>22'},
	--actions+=/frostbrand,if=talent.hailstorm.enabled&buff.frostbrand.remains<gcd
	{'Frostbrand', 'talent(4,3)&player.buff(Frostbrand).remains<gcd'},
	--actions+=/flametongue,if=buff.flametongue.remains<gcd|(cooldown.doom_winds.remains<6&buff.flametongue.remains<4)
	{'Flametongue', 'player.buff(Flametongue).remains<gcd||{spell(Doom Winds).cooldown<6&player.buff(Flametongue).remains<4}'},
	--actions+=/doom_winds
	{'&Doom Winds'},
	--actions+=/crash_lightning,if=talent.crashing_storm.enabled&active_enemies>=3&(!talent.hailstorm.enabled|buff.frostbrand.remains>gcd)
	{'Crash Lightning', 'talent(6,1)&player.area(8).enemies>=3&{!talent(4,3)||player.buff(Frostbrand).remains>gcd}'},
	--actions+=/earthen_spike
	{'Earthen Spike', 'talent(7,3)'},
	--actions+=/lightning_bolt,if=(talent.overcharge.enabled&maelstrom>=40&!talent.fury_of_air.enabled)|(talent.overcharge.enabled&talent.fury_of_air.enabled&maelstrom>46)
	{'Lightning Bolt', '{talent(5,2)&player.maelstrom>=40&!talent(6,2)}||{talent(5,2)&talent(6,2)&player.maelstrom>46}'},
	--actions+=/crash_lightning,if=buff.crash_lightning.remains<gcd&active_enemies>=2
	{'Crash Lightning', 'player.buff(Crash Lightning).remains<gcd&player.area(8).enemies>=2'},
	--actions+=/windsong
	{'Windsong', 'talent(1,1)'},
	--actions+=/windstrike,if=buff.stormbringer.react&((talent.fury_of_air.enabled&maelstrom>=26)|(!talent.fury_of_air.enabled))
	{'Windstrike', 'talent(7,1)&player.buff(Ascendance)&player.buff(Stormbringer)&{{talent(6,2)&player.maelstrom>=26}||{!talent(6,2)}}'},
	--actions+=/stormstrike,if=buff.stormbringer.react&((talent.fury_of_air.enabled&maelstrom>=26)|(!talent.fury_of_air.enabled))
	{'Stormstrike', 'player.buff(Stormbringer)&{{talent(6,2)&player.maelstrom>=26}||{!talent(6,2)}}'},
	--actions+=/lava_lash,if=talent.hot_hand.enabled&buff.hot_hand.react
	{'Lava Lash', 'talent(1,2)&player.buff(Hot Hand)'},
	--actions+=/crash_lightning,if=active_enemies>=4
	{'Crash Lightning', 'player.area(8).enemies>=4'},
	--actions+=/windstrike
	{'Windstrike', 'talent(7,1)&player.buff(Ascendance)'},
	--actions+=/stormstrike,if=talent.overcharge.enabled&cooldown.lightning_bolt.remains<gcd&maelstrom>80
	{'Stormstrike', 'talent(5,2)&spell(Lightning Bolt).cooldown<gcd&player.maelstrom>80'},
	--actions+=/stormstrike,if=talent.fury_of_air.enabled&maelstrom>46&(cooldown.lightning_bolt.remains>gcd|!talent.overcharge.enabled)
	{'Stormstrike', 'talent(6,2)&player.maelstrom>46&{spell(Lightning Bolt).cooldown>gcd||!talent(5,2)}'},
	--actions+=/stormstrike,if=!talent.overcharge.enabled&!talent.fury_of_air.enabled
	{'Stormstrike', '!talent(5,2)&!talent(6,2)'},
	--actions+=/crash_lightning,if=((active_enemies>1|talent.crashing_storm.enabled|talent.boulderfist.enabled)&!set_bonus.tier19_4pc)|feral_spirit.remains>5
	{'Crash Lightning', '{player.area(8).enemies>1||talent(6,1)||talent(1,3)}&!set_bonus(T19)>=4||spell(Feral Spirit).cooldown>110'},
	--actions+=/frostbrand,if=talent.hailstorm.enabled&buff.frostbrand.remains<4.8
	{'Frostbrand', 'talent(4,3)&player.buff(Frostbrand).remains<4.8'},
	--actions+=/lava_lash,if=talent.fury_of_air.enabled&talent.overcharge.enabled&(set_bonus.tier19_4pc&maelstrom>=80)
	{'Lava Lash', 'talent(6,2)&talent(5,2)&{set_bonus(T19)>=4&player.maelstrom>=80}'},
	--actions+=/lava_lash,if=talent.fury_of_air.enabled&!talent.overcharge.enabled&(set_bonus.tier19_4pc&maelstrom>=53)
	{'Lava Lash', 'talent(6,2)&!talent(5,2)&{set_bonus(T19)>=4&player.maelstrom>=80}'},
	--actions+=/lava_lash,if=(!set_bonus.tier19_4pc&maelstrom>=120)|(!talent.fury_of_air.enabled&set_bonus.tier19_4pc&maelstrom>=40)
	{'Lava Lash', '!set_bonus(T19)>=4&player.maelstrom>=120||{!talent(6,2)&set_bonus(T19)>=4&player.maelstrom>=40}'},
	--actions+=/flametongue,if=buff.flametongue.remains<4.8
	{'Flametongue', 'player.buff(Flametongue).remains<4.8'},
	--actions+=/sundering
	{'Sundering', 'talent(6,3)'},
	--actions+=/rockbiter
	{'Rockbiter'},
	--actions+=/flametongue
	{'Flametongue'},
	--actions+=/boulderfist
	{'Boulderfist', 'talent(1,3)'},
	--Force attack if waiting for queued spell
	{'/startattack', '!isattacking'},
}

local inCombat = {
	{Keybinds, '{!moving||moving}'},
	{Dispel, '{!moving||moving}&toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Survival, '{!moving||moving}'},
	{Player, '{!ingroup||ingroup}&player.health<100'},
	{Emergency, 'ingroup'},
	{Trinkets, '{!moving||moving}'},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{Cooldowns, '{!moving||moving}&toggle(cooldowns)'},
	{Combat, 'target.infront&target.range<=8'},
}

local outCombat = {
	{Dispel, '{!moving||moving}&toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{Emergency, 'ingroup'},
	{'Healing Surge', '!moving&player.health<=70', 'player'},
	{'Ghost Wolf', 'movingfor>=2&!player.buff(Ghost Wolf)'},
}

NeP.CR:Add(263, {
	name = '|r[|cff00fff0Yumad|r] Shaman - |cff0068ffEnhancement|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
