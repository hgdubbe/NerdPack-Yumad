local GUI = {

}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cffc79c6e ----------------------------------------------------------------------|r')
	print('|cffc79c6e --- |rWarrior: |cffc79c6eFURY|r')
	print('|cffc79c6e --- |rTalents: 1/2 - 2/3 - 3/3 - 4/3 - 5/2 - 6/3 - 7/2')
	print('|cffc79c6e ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')
end

local Survival = {
	{'Victory Rush', 'player.health<=70'},
}

local Keybinds = {
	{'!Heroic Leap', 'keybind(lshift)', 'cursor.ground'}
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
-- https://github.com/simulationcraft/simc/blob/legion-dev/profiles/Tier19M/Warrior_Fury_T19M.simc

local Cooldowns = {
	--actions+=/use_item,name=faulty_countermeasure,if=buff.battle_cry.up&buff.enrage.up
	{'#trinket2', 'equipped(Faulty Countermeasure)&player.buff(Battle Cry)&player.buff(Enrage)'},
	--actions+=/battle_cry,if=gcd.remains=0&(!talent.reckless_abandon.enabled&(cooldown.bloodthirst.remains=0|buff.enrage.remains>cooldown.bloodthirst.remains))|(talent.reckless_abandon.enabled&(talent.dragon_roar.enabled&buff.dragon_roar.up|!talent.dragon_roar.enabled))
	{'&Battle Cry', 'gcd.remains=0&{!talent(7,2)&{spell(Bloodthirst).cooldown=0||player.buff(Enrage).duration>spell(Bloodthirst).cooldown}}||talent(7,2)'},
	--actions+=/battle_cry,if=gcd.remains=0&talent.reckless_abandon.enabled
	{'&Battle Cry', 'gcd.remains=0&talent(7,2)'},
	--actions+=/battle_cry,if=gcd.remains=0&buff.dragon_roar.up&(cooldown.bloodthirst.remains=0|buff.enrage.remains>cooldown.bloodthirst.remains)
	{'&Battle Cry', 'gcd.remains=0&player.buff(Dragon Roar)&{spell(Bloodthirst).cooldown=0||player.buff(Enrage).duration>spell(Bloodthirst).cooldown}'},
	--actions+=/avatar,if=buff.battle_cry.up|(target.time_to_die<(cooldown.battle_cry.remains+10))
	{'&Avatar', 'talent(3,3)&player.buff(Battle Cry)'},
	--actions+=/bloodbath,if=buff.dragon_roar.up|(!talent.dragon_roar.enabled&(buff.battle_cry.up|cooldown.battle_cry.remains>10))
	{'&Bloodbath', 'talent(6,1)&{player.buff(Dragon Roar)||{!talent(7,3)&{player.buff(Battle Cry)||spell(Battle Cry).cooldown>10}}}'},
	--actions+=/blood_fury,if=buff.battle_cry.up
	{'&Blood Fury', 'player.buff(Battle Cry)'},
	--actions+=/berserking,if=buff.battle_cry.up
	{'&Berserking', 'player.buff(Battle Cry)'},
	--actions+=/arcane_torrent,if=rage<rage.max-40
	{'&Arcane Torrent', 'player.rage<=60'},
}

local BattleCry = {
	--actions.cooldowns=rampage,if=talent.massacre.enabled&buff.massacre.react&buff.enrage.remains<1
	{'Rampage', 'talent(5,1)&player.buff(Massacre)&player.buff(Enrage).duration<1'},
	--actions.cooldowns+=/bloodthirst,if=target.health.pct<20&buff.enrage.remains<1
	{'Bloodthirst', 'target.health<=20&player.buff(Enrage).duration<1'},
	--actions.cooldowns+=/execute
	{'Execute'},
	--actions.cooldowns+=/raging_blow,if=buff.enrage.up
	{'Raging Blow', 'player.buff(Enrage)'},
	--actions.cooldowns+=/rampage,if=talent.reckless_abandon.enabled
	{'Rampage', 'talent(7,2)'},
	--actions.cooldowns+=/berserker_rage,if=talent.outburst.enabled&buff.enrage.down&buff.battle_cry.up
	{'&Berserker Rage', 'talent(3,2)&!player.buff(Enrage)&player.buff(Battle Cry)'},
	--actions.cooldowns+=/bloodthirst,if=buff.enrage.remains<1&!talent.outburst.enabled
	{'Bloodthirst', 'player.buff(Enrage).duration<1&!talent(3,2)'},
	--actions.cooldowns+=/use_item,name=draught_of_souls,if=equipped.trinket=draught_of_souls,if=buff.battle_cry.remains>3&((talent.dragon_roar.enabled&buff.dragon_roar.remains>=3)|!talent.dragon_roar.enabled)
	{'#trinket1', 'equipped(Draught of Souls)&player.buff(Battle Cry).duration>3&{{talent(7,3)&player.buff(Dragon Roar).duration>=3}||!talent(7,3)}'},
	--actions.cooldowns+=/raging_blow
	{'Raging Blow'},
	--actions.cooldowns+=/odyns_fury
	{'Odyn\'s Fury', 'player.buff(Enrage)'},
	--actions.cooldowns+=/bloodthirst
	{'Bloodthirst'},
	--actions.cooldowns+=/whirlwind,if=buff.wrecking_ball.react&buff.enrage.up
	{'Whirlwind', 'talent(3,1)&player.buff(Wrecking Ball)&player.buff(Enrage)'},
	--actions.cooldowns+=/furious_slash
	{'Furious Slash'},
}

local Execute = {
	--actions.execute=bloodthirst,if=buff.fujiedas_fury.up&buff.fujiedas_fury.remains<2
	{'Bloodthirst', 'player.buff(Fujieda\'s Fury)&player.buff(Fujieda\'s Fury).count<2'},
	--actions.execute+=/execute,if=artifact.juggernaut.enabled&(!buff.juggernaut.up|buff.juggernaut.remains<2)|buff.stone_heart.react
	{'Execute', 'artifact(Juggernaut).enabled&{!player.buff(Juggernaut)||player.buff(Juggernaut).duration<2}||player.buff(Stone Heart)'},
	--actions.execute+=/rampage,if=buff.massacre.react&buff.enrage.remains<1
	{'Rampage', 'talent(5,1)&player.buff(Massacre)&player.buff(Enrage).duration<1'},
	--actions.execute+=/execute
	{'Execute'},
	--actions.execute+=/bloodthirst
	{'Bloodthirst'},
	--actions.execute+=/raging_blow
	{'Raging Blow'},
	--actions.execute+=/whirlwind,if=buff.wrecking_ball.react&buff.enrage.up
	{'Whirlwind', 'talent(3,1)&player.buff(Wrecking Ball)&player.buff(Enrage)'},
	--actions.execute+=/furious_slash
	{'Furious Slash'},
}

local ST ={
	--actions.single_target=bloodthirst,if=buff.fujiedas_fury.up&buff.fujiedas_fury.remains<2
	{'Bloodthirst', 'player.buff(Fujieda\'s Fury)&player.buff(Fujieda\'s Fury).count<2'},
	--actions.single_target+=/execute,if=buff.stone_heart.react
	{'Execute', 'player.buff(Stone Heart)'},
	--actions.single_target+=/furious_slash,if=talent.frenzy.enabled&(buff.frenzy.down|buff.frenzy.remains<=3)
	{'Furious Slash', 'talent(6,2)&{!player.buff(Frenzy)||player.buff(Frenzy).count<=3}'},
	--actions.single_target+=/raging_blow,if=buff.enrage.up
	{'Raging Blow', 'player.buff(Enrage)'},
	--actions.single_target+=/rampage,if=(buff.enrage.down&!talent.frothing_berserker.enabled)|buff.massacre.react&cooldown.raging_blow.remains>1|rage>=100
	{'Rampage', '{!player.buff(Enrage)&!talent(5,2)}||talent(5,1)&player.buff(Massacre)&spell(Raging Blow).cooldown>1||player.rage>=100'},
	--actions.single_target+=/raging_blow
	{'Raging Blow'},
	--actions.single_target+=/whirlwind,if=buff.wrecking_ball.react&buff.enrage.up
	{'Whirlwind', 'talent(3,1)&player.buff(Wrecking Ball)&player.buff(Enrage)'},
	--actions.single_target+=/bloodthirst
	{'Bloodthirst'},
	--actions.single_target+=/furious_slash
	{'Furious Slash'},
	--actions.single_target+=/call_action_list,name=bladestorm
	{'Bladestorm', 'talent(7,1)&player.buff(Enrage).duration>2'},
	--actions.single_target+=/bloodbath,if=buff.frothing_berserker.up|(rage>80&!talent.frothing_berserker.enabled)
	{'&Bloodbath', 'talent(6,1)&{player.buff(Frothing Berserker)||{player.rage>=80&!talent(5,2)}}'},
}

local AoE = {
	--actions.aoe=bloodthirst,if=buff.enrage.down|rage<50
	{'Bloodthirst', '!player.buff(Enrage)||player.rage<=50'},
	--actions.aoe+=/call_action_list,name=bladestorm
	{'Bladestorm', 'talent(7,1)&player.buff(Enrage).duration>2'},
	--actions.aoe+=/odyns_fury,if=buff.battle_cry.up&buff.enrage.up
	{'Odyn\'s Fury', 'player.buff(Battle Cry)&player.buff(Enrage)'},
	--actions.aoe+=/whirlwind,if=buff.meat_cleaver.down
	{'Whirlwind', '!player.buff(Meat Cleaver)'},
	--actions.aoe+=/dragon_roar
	{'Dragon Roar', 'talent(7,3)'},
	--actions.aoe+=/rampage,if=buff.meat_cleaver.up
	{'Rampage', 'player.buff(Meat Cleaver)'},
	--actions.aoe+=/bloodthirst
	{'Bloodthirst'},
	--actions.aoe+=/whirlwind
	{'Whirlwind'},
}

local TwoTargets = {
	--actions.two_targets=whirlwind,if=buff.meat_cleaver.down
	{'Whirlwind', '!player.buff(Meat Cleaver)'},
	--actions.two_targets+=/call_action_list,name=bladestorm
	{'Bladestorm', 'talent(7,1)&player.buff(Enrage).duration>2'},
	--actions.two_targets+=/rampage,if=buff.enrage.down|(rage=100&buff.juggernaut.down)|buff.massacre.up
	{'Rampage', '!player.buff(Enrage)||{player.rage=100&!player.buff(Juggernaut)}||talent(5,1)&player.buff(Massacre)'},
	--actions.two_targets+=/bloodthirst,if=buff.enrage.down
	{'Bloodthirst', '!player.buff(Enrage)'},
	--actions.two_targets+=/odyns_fury,if=buff.battle_cry.up&buff.enrage.up
	{'Odyn\'s Fury', 'player.buff(Battle Cry)&player.buff(Enrage)'},
	--actions.two_targets+=/raging_blow,if=talent.inner_rage.enabled&spell_targets.whirlwind=2
	{'Raging Blow', 'talent(6,3)&player.area(8).enemies=2'},
	--actions.two_targets+=/whirlwind,if=spell_targets.whirlwind>2
	{'Whirlwind', 'player.area(8).enemies>2'},
	--actions.two_targets+=/dragon_roar
	{'Dragon Roar', 'talent(7,3)'},
	--actions.two_targets+=/bloodthirst
	{'Bloodthirst'},
	--actions.two_targets+=/whirlwind
	{'Whirlwind'},
}

local inCombat = {
	{Keybinds, '{!moving||moving}'},
	{Survival, '{!moving||moving}&player.health<100'},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront'},
	{Attack, '{!moving||moving}'},
	{Cooldowns, '{!moving||moving}&toggle(cooldowns)&target.range<=8'},
	{BattleCry, '{!moving||moving}&target.range<=8&target.infront&player.buff(Battle Cry)'},
	{TwoTargets, '{!moving||moving}&toggle(aoe)&{player.area(8).enemies=2||player.area(8).enemies=3}'},
	{AoE, '{!moving||moving}&toggle(aoe)&{player.area(8).enemies>3'},
	{Execute, '{!moving||moving}&target.range<=8&target.infront&target.health<=20&!player.buff(Battle Cry)'},
	{ST, '{!moving||moving}&target.range<=8&target.infront&target.health>20&!player.buff(Battle Cry)'},
}

local outCombat = {
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront'},
}

NeP.CR:Add(72, {
	name = '|r[|cff00fff0Yumad|r] Warrior - |cffc79c6eFury|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
