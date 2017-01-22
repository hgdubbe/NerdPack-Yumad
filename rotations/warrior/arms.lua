local GUI = {
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkbox', text = 'Enable Victory Rush', key = 'S_VRE', default = true},
	{type = 'spinner', text = 'Victory Rush (Health %)', key = 'S_VR', default = 70},
	{type = 'checkbox', text = 'Enable Die by the Sword', key = 'S_DBTSE', default = true},
	{type = 'spinner', text = 'Die by the Sword (Health %)', key = 'S_DBTS', default = 40},
	{type = 'checkbox', text = 'Enable Commanding Shout', key = 'S_CSE', default = true},
	{type = 'spinner', text = 'Commanding Shout (Health %)', key = 'S_CS', default = 20},
	{type = 'checkbox', text = 'Enable Intimidating Shout', key = 'S_ISE', default = true},
	{type = 'spinner', text = 'Intimidating Shout (Health %)', key = 'S_IS', default = 30},
	{type = 'checkbox', text = 'Enable Gift of the Naaru', key = 'S_GOTNE', default = true},
	{type = 'spinner', text = 'Gift of the Naaru (Health %)', key = 'S_GOTN', default = 40},
	--{type = 'checkbox', text = 'Enable Healthstone', key = 'S_HSE', default = true},
	--{type = 'spinner', text = 'Healthstone (Health %)', key = 'S_HS', default = 20},
	--{type = 'checkbox', text = 'Enable Ancient Healing Potion', key = 'S_AHPE', default = true},
	--{type = 'spinner', text = 'Ancient Healing Potion (Health %)', key = 'S_AHP', default = 20},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'checkbox', text = 'L-Shift: Heroic Leap @ Cursor', key = 'K_HL', default = true},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'text', text = 'Activate on-use trinkets on cooldown.'},
	{type = 'checkbox', text = 'Enable Top Trinket', key = 'trinket_1', default = false},
	{type = 'checkbox', text = 'Enable Bottom Trinket', key = 'trinket_2', default = false},
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cffc79c6e ----------------------------------------------------------------------|r')
	print('|cffc79c6e --- |rWarrior: |cffc79c6eARMS|r')
	print('|cffc79c6e --- |rTalents: 1/1 - 2/3 - 3/3 - 4/2 - 5/3 - 6/1 - 7/1')
	print('|cffc79c6e ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')
end

local Survival = {
	-- Victory Rush usage if enabled in UI.
	{'Victory Rush', '{!player.debuff(Ignite Soul)}&UI(S_VRE)&player.health<=UI(S_VR)'},
	-- Die by the Sword usage if enabled in UI.
	{'&Die by the Sword', 'UI(S_DBTSE)&player.health<=UI(S_DBTS)'},
	-- Commanding Shout usage if enabled in UI.
	{'&Commanding Shout', 'UI(S_CSE)&player.health<=UI(S_CS)'},
	-- Intimidating Shout usage if enabled in UI.
	{'Intimidating Shout', 'UI(S_ISE)&player.area(8).enemies>2&player.health<=UI(S_IS)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'&Gift of the Naaru', '{!player.debuff(Ignite Soul)}&UI(S_GOTNE)&player.health<=UI(S_GOTN)'},
	-- Healthstone usage if enabled in UI.
	--{'#Healthstone', 'UI(S_HSE)&player.health<=UI(S_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	--{'#Ancient Healing Potion', 'UI(S_AHPE)&player.health<=UI(S_AHP)'},
}

local Keybinds = {
	-- Heroic Leap at cursor on Left-Shift if enabled in UI.
	{'!Heroic Leap', 'UI(K_HL)&keybind(lshift)', 'cursor.ground'}
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)'},
}

local Interrupts = {
	{'&Pummel', 'target.range<=5'},
	{'&Arcane Torrent', 'target.range<=8&spell(Pummel).cooldown>gcd&!lastgcd(Pummel)'},
}

local Attack = {
	{'/startattack', '!isattacking'},
}

-- ####################################################################################
-- Primairly sourced from legion-dev SimC.
-- Updates to rotations from sources are considered for implementation.
-- ####################################################################################

-- SimC APL 1/17/2017
-- https://github.com/simulationcraft/simc/blob/legion-dev/profiles/Tier19M/Warrior_Arms_T19M.simc

local Cooldowns = {
	--actions+=/blood_fury,if=buff.battle_cry.up|target.time_to_die<=16
	{'&Blood Fury', 'player.buff(Battle Cry)'},
	--actions+=/berserking,if=buff.battle_cry.up|target.time_to_die<=11
	{'&Berserking', 'player.buff(Battle Cry)'},
	--actions+=/arcane_torrent,if=buff.battle_cry_deadly_calm.down&rage.deficit>40&cooldown.battle_cry.remains
	{'&Arcane Torrent', '!player.buff(Battle Cry)&talent(6,1)&player.rage>=40&spell(Battle Cry).cooldown>gcd'},
	--actions+=/battle_cry,if=gcd.remains<0.25&cooldown.avatar.remains>=10&(buff.shattered_defenses.up|cooldown.warbreaker.remains>7&cooldown.colossus_smash.remains>7|cooldown.colossus_smash.remains&debuff.colossus_smash.remains>gcd)|!cooldown.colossus_smash.remains<gcd|target.time_to_die<=7
	{'&Battle Cry', 'gcd.remains<0.25&spell(Avatar).cooldown>=10&{player.buff(Shattered Defenses)||spell(Warbreaker).cooldown>=7&spell(Colossus Smash).cooldown>=7||spell(Colossus Smash).cooldown>gcd&target.debuff(Colossus Smash).duration>gcd||!spell(Colossus Smash).cooldown<gcd}'},
	--actions+=/avatar,if=gcd.remains<0.25&(buff.battle_cry.up|cooldown.battle_cry.remains<15)|target.time_to_die<=20
	{'&Avatar', 'talent(3,3)&gcd.remains<0.25&{player.buff(Battle Cry)||spell(Battle Cry).cooldown<=15}'},
	--actions+=/use_item,name=draught_of_souls,if=equipped.draught_of_souls&((prev_gcd.1.mortal_strike|cooldown.mortal_strike.remains>=3)&buff.battle_cry.remains>=3&debuff.colossus_smash.up&buff.avatar.remains>=3)
	{'#trinket1', 'equipped(Draught of Souls)&{lastgcd(Mortal Strike)||spell(Mortal Strike).cooldown>=3}&player.buff(Battle Cry).duration>=3&target.debuff(Colossus Smash)&player.buff(Avatar).duration>=3'},
	--actions+=/use_item,name=kiljaedens_burning_wish,if=equipped.kiljaedens_burning_wish&debuff.colossus_smash.up
	{'#trinket2', 'equipped(Kil\'jaeden\'s Burning Wish)&target.debuff(Colossus Smash)'},
}

local Available = {
	{Cooldowns, 'toggle(cooldowns)'},
	--actions+=/rend,if=remains<gcd
	{'Rend', 'talent(3,2)&target.debuff(Rend).duration<gcd'},
	--actions+=/focused_rage,if=buff.battle_cry_deadly_calm.remains>cooldown.focused_rage.remains&(buff.focused_rage.stack<3|cooldown.mortal_strike.remains)
	{'&Focused Rage', 'player.buff(Battle Cry)&talent(6,1)&{player.buff(Focused Rage).count<3||spell(Mortal Strike).cooldown>gcd}'},
	--actions+=/colossus_smash,if=cooldown_react&debuff.colossus_smash.remains<gcd
	{'Colossus Smash', 'target.debuff(Colossus Smash).duration<gcd'},
	--actions+=/warbreaker,if=debuff.colossus_smash.remains<gcd
	{'Warbreaker', 'target.debuff(Colossus Smash).duration<gcd'},
	--actions+=/ravager
	{'Ravager', 'talent(7,3)'},
	--actions+=/overpower,if=buff.overpower.react
	{'Overpower', 'talent(1,2)&player.buff(Overpower!)'},
}

local Cleave = {
	--actions.cleave=mortal_strike
	{'Mortal Strike'},
	--actions.cleave+=/execute,if=buff.stone_heart.react
	{'Execute', 'player.buff(Ayala\'s Stone Heart)'},
	--actions.cleave+=/colossus_smash,if=buff.shattered_defenses.down&buff.precise_strikes.down
	{'Colossus Smash', '!player.buff(Shattered Defenses)&!player.buff(Precise Strikes)'},
	--actions.cleave+=/warbreaker,if=buff.shattered_defenses.down
	{'Warbreaker', '!player.buff(Shattered Defenses)'},
	--actions.cleave+=/focused_rage,if=rage>100|buff.battle_cry_deadly_calm.up
	{'&Focused Rage', 'player.rage>=100||player.buff(Battle Cry)&talent(6,1)'},
	--actions.cleave+=/whirlwind,if=talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)
	{'Whirlwind', 'talent(3,1)&{target.debuff(Colossus Smash)||player.rage<=50}&{!talent(5,3)||player.buff(Battle Cry)&talent(6,1)||player.buff(Cleave)}'},
	--actions.cleave+=/rend,if=remains<=duration*0.3
	{'Rend', 'talent(3,2)&target.debuff(Rend).duration<=4.5'},
	--actions.cleave+=/bladestorm
	{'Bladestorm'},
	--actions.cleave+=/cleave
	{'Cleave'},
	--actions.cleave+=/whirlwind,if=rage>40|buff.cleave.up
	{'Whirlwind', 'player.rage>=40||player.buff(Cleave)'},
	--actions.cleave+=/shockwave
	{'Shockwave', 'talent(2,1)'},
	--actions.cleave+=/storm_bolt
	{'Storm Bolt', 'talent(2,2)'},
}

local AoE = {
	--actions.aoe=mortal_strike,if=cooldown_react
	{'Mortal Strike'},
	--actions.aoe+=/execute,if=buff.stone_heart.react
	{'Execute', 'player.buff(Ayala\'s Stone Heart)'},
	--actions.aoe+=/colossus_smash,if=cooldown_react&buff.shattered_defenses.down&buff.precise_strikes.down
	{'Colossus Smash', '!player.buff(Shattered Defenses)&!player.buff(Precise Strikes)'},
	--actions.aoe+=/warbreaker,if=buff.shattered_defenses.down
	{'Warbreaker', '!player.buff(Shattered Defenses)'},
	--actions.aoe+=/whirlwind,if=talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)
	{'Whirlwind', 'talent(3,1)&{target.debuff(Colossus Smash)||player.rage<=50}&{!talent(5,3)||player.buff(Battle Cry)&talent(6,1)||player.buff(Cleave)}'},
	--actions.aoe+=/rend,if=remains<=duration*0.3
	{'Rend', 'talent(3,2)&target.debuff(Rend).duration<=4.5'},
	--actions.aoe+=/bladestorm
	{'Bladestorm'},
	--actions.aoe+=/cleave
	{'Cleave'},
	--actions.aoe+=/execute,if=rage>90
	{'Execute', 'player.rage>=90'},
	--actions.aoe+=/whirlwind,if=rage>=40
	{'Whirlwind', 'player.rage>=40'},
	--actions.aoe+=/shockwave
	{'Shockwave', 'talent(2,1)'},
	--actions.aoe+=/storm_bolt
	{'Storm Bolt', 'talent(2,2)'},
}

local Execute = {
	--actions.execute=mortal_strike,if=cooldown_react&buff.battle_cry.up&buff.focused_rage.stack=3
	{'Mortal Strike', 'player.buff(Battle Cry)&player.buff(Focused Rage).count=3'},
	--actions.execute+=/execute,if=buff.battle_cry_deadly_calm.up
	{'Execute', 'player.buff(Battle Cry)&talent(6,1)'},
	--actions.execute+=/colossus_smash,if=cooldown_react&buff.shattered_defenses.down
	{'Colossus Smash', '!player.buff(Shattered Defenses)'},
	--actions.execute+=/execute,if=buff.shattered_defenses.up&(rage>=17.6|buff.stone_heart.react)
	{'Execute', 'player.buff(Shattered Defenses)&{player.rage>=17.6||player.buff(Ayala\'s Stone Heart)}'},
	--actions.execute+=/mortal_strike,if=cooldown_react&equipped.archavons_heavy_hand&rage<60|talent.in_for_the_kill.enabled&buff.shattered_defenses.down
	{'Mortal Strike', 'equipped(Archavon\'s Heavy Hand)&player.rage<=60||talent(5,1)&!player.buff(Shattered Defenses)'},
	--actions.execute+=/execute,if=buff.shattered_defenses.down
	{'Execute', '!player.buff(Shattered Defenses)'},
	--actions.execute+=/bladestorm,interrupt=1,if=raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets
	{'Bladestorm'},
}

local ST = {
	--actions.single=colossus_smash,if=cooldown_react&buff.shattered_defenses.down&(buff.battle_cry.down|buff.battle_cry.up&buff.battle_cry.remains>=gcd|buff.corrupted_blood_of_zakajz.remains>=gcd)
	{'Colossus Smash', '!player.buff(Shattered Defenses)&{!player.buff(Battle Cry)||player.buff(Battle Cry)&player.buff(Battle Cry).duration>=gcd||player.buff(Corrupted Blood of Zakajz).duration>=gcd}'},
	--actions.single+=/focused_rage,if=!buff.battle_cry_deadly_calm.up&buff.focused_rage.stack<3&!cooldown.colossus_smash.up&(rage>=50|debuff.colossus_smash.down|cooldown.battle_cry.remains<=8)|cooldown.battle_cry.remains<=8&cooldown.battle_cry.remains>0&rage>100
	{'&Focused Rage', '!player.buff(Battle Cry)&talent(6,1)&player.buff(Focused Rage).count<3&spell(Colossus Smash).cooldown>gcd&{player.rage>=50||!target.debuff(Colossus Smash)||spell(Battle Cry).cooldown<=8}||spell(Battle Cry).cooldown<=8&spell(Battle Cry).cooldown>0&player.rage>=100'},
	--actions.single+=/mortal_strike,if=cooldown.battle_cry.remains>8|!buff.battle_cry.remains>(gcd.max*2)&buff.focused_rage.stack<3|buff.battle_cry.remains<=gcd
	{'Mortal Strike', 'spell(Battle Cry).cooldown>=8||!player.buff(Battle Cry)&player.buff(Focused Rage).count<3||player.buff(Battle Cry).duration<=gcd'},
	--actions.single+=/execute,if=buff.stone_heart.react
	{'Execute', 'player.buff(Ayala\'s Stone Heart)'},
	--actions.single+=/whirlwind,if=spell_targets.whirlwind>1|talent.fervor_of_battle.enabled
	{'Whirlwind', 'player.area(8).enemies>1||talent(3,1)&player.rage>=40'},
	--actions.single+=/slam,if=spell_targets.whirlwind=1&!talent.fervor_of_battle.enabled
	{'Slam', '!talent(3,1)&player.rage>=32'},
	--actions.single+=/bladestorm,interrupt=1,if=raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets
	{'Bladestorm'},
}

local inCombat = {
	{Keybinds, '{!moving||moving}'},
	{Survival, '{!moving||moving}&player.health<100'},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront'},
	{Attack, '{!moving||moving}'},
	{Available, '{!moving||moving}&target.range<=8'},
	{Cleave, '{!moving||moving}&toggle(aoe)&player.area(8).enemies>=2&talent(1,3)'},
	{AoE, '{!moving||moving}&toggle(aoe)&player.area(8).enemies>=5&!talent(1,3)'},
	{Execute, '{!moving||moving}&target.range<=8&target.infront&target.health<=20&player.area(8).enemies<5'},
	{ST, '{!moving||moving}&target.range<=8&target.infront&target.health>20'},
}

local outCombat = {
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront'},
}

NeP.CR:Add(71, {
	name = '|r[|cff00fff0Yumad|r] |cffc79c6eWarrior|r - |cffc79c6eARMS|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
