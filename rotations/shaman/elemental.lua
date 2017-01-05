local GUI = {
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkbox', text = 'Enable Astral Shift', key = 'S_ASE', default = true},
	{type = 'spinner', text = 'Astral Shift (Health %)', key = 'S_AS', default = 40},
	{type = 'checkbox', text = 'Enable Healing Surge', key = 'S_HSGE', default = true},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'S_HSG', default = 35},
	{type = 'checkbox', text = 'Enable Earth Elemental', key = 'S_EEE', default = true},
	{type = 'spinner', text = 'Earth Elemental (Health %)', key = 'S_EE', default = 50},
	{type = 'checkbox', text = 'Enable Gift of the Naaru', key = 'S_GOTNE', default = true},
	{type = 'spinner', text = 'Gift of the Naaru (Health %)', key = 'S_GOTN', default = 40},
	{type = 'checkbox', text = 'Enable Healthstone', key = 'S_HSE', default = true},
	{type = 'spinner', text = 'Healthstone (Health %)', key = 'S_HS', default = 20},
	{type = 'checkbox', text = 'Enable Ancient Healing Potion', key = 'S_AHPE', default = true},
	{type = 'spinner', text = 'Ancient Healing Potion (Health %)', key = 'S_AHP', default = 20},
	{type = 'ruler'},{type = 'spacer'},
	
	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'checkbox', text = 'L-Shift: Liquid Magma Totem @ Cursor', key = 'K_LMT', default = true},
	{type = 'checkbox', text = 'L-Control: Lightning Surge Totem @ Cursor', key = 'K_LST', default = true},
	{type = 'checkbox', text = 'L-Alt: Earthbind Totem @ Cursor', key = 'K_ET', default = true},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'text', text = 'Activate on-use trinkets on cooldown.'},
	{type = 'checkbox', text = 'Enable Top Trinket', key = 'trinket_1', default = false},
	{type = 'checkbox', text = 'Enable Bottom Trinket', key = 'Trinket_2', default = false},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Emergency Healing
	{type = 'header', text = 'Emergency Healing', align = 'center'},
	{type = 'checkbox', text = 'Enable Emergency Healing', key = 'E_EH', default = true},
	{type = 'text', text = 'Thresholds set to ensure party member survival.'},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'E_HS', default = 35},
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff0068ff ----------------------------------------------------------------------|r')
	print('|cff0068ff --- |rShaman: |cff0068ffELEMENTAL|r')
	print('|cff0068ff --- |rLightning Rod (Mythic+) Talents: 1/3 - 2/1 - 3/1 - 4/2 - 5/2 or 5/3 (Fortified) - 6/1 - 7/2')
	print('|cff0068ff --- |rIcefury Talents: 1/2 - 2/1 - 3/1 - 4/2 - 5/3 - 6/3 - 7/3')
	print('|cff0068ff ----------------------------------------------------------------------|r')
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
	--Healing Surge usage if enabled in UI.
	{'Healing Surge', 'UI(S_HSGE)&!moving&player.health<=UI(S_HSG)', 'player'},
	-- Earth Elemental usage if enabled in UI.
	{'Earth Elemental', 'UI(S_EEE)&player.health<=UI(S_EE)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'Gift of the Naaru', 'UI(S_GOTNE)&player.health<=UI(S_GOTN)'},
	-- Healthstone usage if enabled in UI.
	{'#Healthstone', 'UI(S_HSE)&player.health<=UI(S_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#Ancient Healing Potion', 'UI(S_AHPE)&player.health<=UI(S_AHP)'},
}

local Keybinds = {
	-- Liquid Magma Totem at cursor on Left-Shift if enabled in UI.
	{'!Liquid Magma Totem', 'talent(6,1)&keybind(lshift)&UI(K_LMT)', 'cursor.ground'},
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

local Emergency = {
	{'!Healing Surge', 'UI(E_EH)&lowest.health<=UI(E_HS)', 'lowest'},
}

local Interrupts = {
	{'&Wind Shear'},
}

local Dispel ={
	{'%dispelall'},
}

-- Lighting Rod Rotation ##############################################################
-- http://www.stormearthandlava.com/elemental-shaman-hub/lightning-rod-build-guide/
local LRCooldowns = {
	{{{'Totem Mastery', '{!moving||moving}&totem(Totem Mastery).duration<1||!player.buff(Tailwind Totem)||!player.buff(Storm Totem)||!player.buff(Resonance Totem)||!player.buff(Ember Totem)'},
	{'Fire Elemental', '!talent(6,2)'},
	{'&Elemental Mastery', 'talent(6,1)'}, -- Remove when 7.1.5 is LIVE.
	{'&Blood Fury', 'player.buff(Elemental Mastery)'},
	}, {'!moving||moving'}},
}

local LRAoE = {
	{'Totem Mastery', '{!moving||moving}&totem(Totem Mastery).duration<1||!player.buff(Tailwind Totem)||!player.buff(Storm Totem)||!player.buff(Resonance Totem)||!player.buff(Ember Totem)'},
	{'Liquid Magma Totem', '{!moving||moving}&talent(6,1)', 'cursor.ground'},
	{'Flame Shock', '{!moving||moving}&!target.debuff(Flame Shock)'},
	{'Elemental Blast', 'talent(5,3)'},
	{'Lava Burst', '{!moving||moving}&player.buff(Lava Surge)'},
	{'Stormkeeper'},
	{'Earthquake', '{!moving||moving}&player.maelstrom>=50', 'cursor.ground'},
	{'Chain Lightning', nil, 'target'},
}

local LRST = {
	{'Totem Mastery', '{!moving||moving}&totem(Totem Mastery).duration<1||!player.buff(Tailwind Totem)||!player.buff(Storm Totem)||!player.buff(Resonance Totem)||!player.buff(Ember Totem)'},
	{'Flame Shock', '{!moving||moving}&{!target.debuff(Flame Shock)||player.maelstrom>=20&player.buff(Elemental Focus)&target.debuff(Flame Shock).duration<9}'},
	{'Elemental Blast', 'talent(5,3)'},
	{'Lava Burst', 'target.debuff(Flame Shock).duration>spell(Lava Burst).casttime'},
	{'Stormkeeper'},
	{'Liquid Magma Totem', '{!moving||moving}&talent(6,1)', 'cursor.ground'},
	{'Earth Shock', '{!moving||moving}&player.maelstrom>=92'},
	{'Lava Burst', '{!moving||moving}&player.buff(Lava Surge)'},
	{'Earth Shock', '{!moving||moving}&player.maelstrom>=86&!player.buff(Lava Surge)'},
	{'Lava Burst', 'player.buff(Stormkeeper).count<=3&player.buff(Stormkeeper).duration>spell(Lava Burst).casttime+gcd'},
	{'Lightning Bolt', nil, 'target'},
}

-- Icefury Rotation ###################################################################
-- http://www.stormearthandlava.com/elemental-shaman-hub/icefury-build-guide/
local IFCooldowns = {
	{'Stormkeeper'},
	{'Fire Elemental', '!talent(6,2)'},
	{'Blood Fury', 'lastcast(Fire Elemental)'},
}

local IFST = {
	{{{'Flame Shock', '!target.debuff(Flame Shock)||player.maelstrom>=20&player.buff(Elemental Focus)&target.debuff(Flame Shock).duration<9'},
	{'Elemental Blast', 'talent(5,3)'},
	{'Earth Shock', 'player.maelstrom>=92'},
	{'Icefury', 'player.maelstrom<=76'},
	{'Frost Shock', 'lastcast(Icefury)&spell(Frost Shock).charges=4||player.maelstrom>20'},
	{'!Frost Shock', 'player.maelstrom<20&player.buff(Icefury).count<=2&player.buff(Icefury).duration<=2+gcd'},
	{'Lava Burst', 'target.debuff(Flame Shock).duration>spell(Lava Burst).casttime||player.buff(Lava Surge)||player.maelstrom<=88&spell(Lava Burst).charges<=2'},
	}, {'!moving||moving'}},
	{'Stormkeeper'},
	{'Lightning Bolt', nil, 'target'},
}

-- Ascendance Rotation ################################################################
-- http://www.stormearthandlava.com/elemental-shaman-hub/ascendance-build-guide/
local ASCooldowns = {
}

local ASAoE = {
}

local ASST = {
}

local inCombat = {
	{Keybinds, '{!moving||moving}'},
	{Dispel, '{!moving||moving}&toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Survival, 'player.health<100'},
	{Emergency},
	{Trinkets},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{LRCooldowns, 'talent(7,2)&toggle(cooldowns)'},
	{IFCooldowns, 'talent(7,3)&toggle(cooldowns)'},
	{LRAoE, 'talent(7,2)&toggle(aoe)&player.area(40).enemies>2'},
	{LRST, 'talent(7,2)&target.infront&target.range<=40'},
	{IFST, 'talent(7,3)&target.infront&target.range<=40'},
}

local outCombat = {
	{Dispel, '{!moving||moving}&toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{'Healing Surge', '!moving&lowest.health<=70', 'lowest'},
	{'Ghost Wolf', 'movingfor>=2&!player.buff(Ghost Wolf)'},
}

NeP.CR:Add(262, {
	name = '|r[|cff00fff0Yumad|r] Shaman - |cff0068ffElemental|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})