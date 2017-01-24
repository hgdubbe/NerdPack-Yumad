local GUI = {

}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff8788ee ----------------------------------------------------------------------|r')
	print('|cff8788ee --- |rWarlock: |cff8788eeDEMONOLOGY|r')
	print('|cff8788ee --- |rSpecific Talents: 1/3 - 2/2 - 3/X - 4/2 - 5/X - 6/2 - 7/2')
	print('|cff8788ee ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		-- Doom
		key = 'yuDoom',
		name = 'Doom',
		text = 'Enable/Disable: Casting of Doom on targets.',
		icon = 'Interface\\ICONS\\spell_shadow_auraofdarkness',
	})
end

local Keybinds = {
	{'!Shadowfury', 'talent(3,3)&keybind(lcontrol)', 'cursor.ground'},
}

-- ####################################################################################
-- Primairly sourced from legion-dev SimC.
-- Updates to rotations from sources are considered for implementation.
-- ####################################################################################

-- SimC APL 1/17/2017
-- https://github.com/simulationcraft/simc/blob/legion-dev/profiles/Tier19M/Warlock_Demonology_T19M.simc

local PreCombat = {
	--actions.precombat+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)
	{'Summon Felguard', '!moving&!pet.exists&!talent(6,1)'},
}

local Cooldowns = {
	--actions+=/service_pet
	{'Grimoire: Felguard', 'talent(6,2)'},
	--actions+=/summon_doomguard,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening<=2&(target.time_to_die>180|target.health.pct<=20|target.time_to_die<30)
	{'Summon Doomguard', '!talent(6,1)'},
	--actions+=/berserking
	{'&Berserking'},
	--actions+=/blood_fury
	{'&Blood Fury'},

}

local DW_Clip = {
	--actions+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)
	{'!Summon Felguard', '!moving&!pet.exists&!talent(6,1)'},
	--actions+=/implosion,if=prev_gcd.1.hand_of_guldan&((wild_imp_remaining_duration<=3&buff.demonic_synergy.remains)|(wild_imp_remaining_duration<=4&spell_targets.implosion>2))	
	{'!Implosion', '!moving&talent(2,3)&combat(player).time>5&lastgcd(Hand of Gul\'dan)'},
	--actions+=/call_dreadstalkers,if=(!talent.summon_darkglare.enabled|talent.power_trip.enabled)&(spell_targets.implosion<3|!talent.implosion.enabled)
	{'!Call Dreadstalkers', '!moving||!moving&player.buff(Demonic Calling)'},
	--actions+=/hand_of_guldan,if=soul_shard>=4&!talent.summon_darkglare.enabled
	{'!Hand of Gul\'dan', '!moving&soulshards>=4'},
	--actions+=/demonic_empowerment,if=dreadstalker_no_de>0|darkglare_no_de>0|doomguard_no_de>0|infernal_no_de>0|service_no_de>0
	{'!Demonic Empowerment', '!moving&!lastgcd(Demonic Empowerment)&{warlock.empower=0||lastgcd(Summon Felguard)||lastgcd(Call Dreadstalkers)||lastgcd(Hand of Gul\'dan)||lastgcd(Summon Darkglare)||lastgcd(Summon Doomguard)||lastgcd(Grimoire: Felguard)}'},	
	--actions+=/doom,cycle_targets=1,if=!talent.hand_of_doom.enabled&target.time_to_die>duration&(!ticking|remains<duration*0.3)
	{'!Doom', '{moving||!moving}&toggle(yuDoom)&!target.debuff(Doom)'},
	--actions+=/thalkiels_consumption,if=(dreadstalker_remaining_duration>execute_time|talent.implosion.enabled&spell_targets.implosion>=3)&wild_imp_count>3&wild_imp_remaining_duration>execute_time
	{'!Thal\'kiel\'s Consumption', '!moving&warlock(Wild Imp).count>=3&warlock(Dreadstalker).count=2'},
	--actions+=/life_tap,if=mana.pct<=30
	{'!Life Tap', '{moving||!moving}&mana<=30&player.health>=15'},
	--actions+=/demonbolt
	{'!Demonbolt', '!moving&talent(7,2)&soulshards<=4'},
	--actions+=/shadow_bolt
	{'!Shadow Bolt', '!moving&!talent(7,2)&soulshards<=4'},
	--actions+=/felstorm
	{'!&Felstorm', 'combat(player).time>2'},
}

local ST = {
	{DW_Clip, 'player.channeling(Demonwrath)'},
	--actions+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)
	{'!Summon Felguard', '!moving&!pet.exists&!talent(6,1)'},
	--actions+=/implosion,if=prev_gcd.1.hand_of_guldan&((wild_imp_remaining_duration<=3&buff.demonic_synergy.remains)|(wild_imp_remaining_duration<=4&spell_targets.implosion>2))		
	{'!Implosion', '!moving&talent(2,3)&combat(player).time>5&lastgcd(Hand of Gul\'dan)'},
	--actions+=/call_dreadstalkers,if=(!talent.summon_darkglare.enabled|talent.power_trip.enabled)&(spell_targets.implosion<3|!talent.implosion.enabled)
	{'Call Dreadstalkers', '!moving||!moving&player.buff(Demonic Calling)'},
	--actions+=/hand_of_guldan,if=soul_shard>=4&!talent.summon_darkglare.enabled
	{'Hand of Gul\'dan', '!moving&soulshards>=4'},
	--actions+=/demonic_empowerment,if=dreadstalker_no_de>0|darkglare_no_de>0|doomguard_no_de>0|infernal_no_de>0|service_no_de>0
	{'Demonic Empowerment', '!moving&!lastgcd(Demonic Empowerment)&{warlock.empower=0||lastgcd(Summon Felguard)||lastgcd(Call Dreadstalkers)||lastgcd(Hand of Gul\'dan)||lastgcd(Summon Darkglare)||lastgcd(Summon Doomguard)||lastgcd(Grimoire: Felguard)}'},	
	--actions+=/doom,cycle_targets=1,if=!talent.hand_of_doom.enabled&target.time_to_die>duration&(!ticking|remains<duration*0.3)
	{'Doom', '{moving||!moving}&toggle(yuDoom)&!target.debuff(Doom)'},
	--actions+=/thalkiels_consumption,if=(dreadstalker_remaining_duration>execute_time|talent.implosion.enabled&spell_targets.implosion>=3)&wild_imp_count>3&wild_imp_remaining_duration>execute_time
	{'Thal\'kiel\'s Consumption', '!moving&warlock(Wild Imp).count>=3&warlock(Dreadstalker).count=2'},
	--actions+=/life_tap,if=mana.pct<=30
	{'Life Tap', '{moving||!moving}&mana<=30&player.health>=15'},
	--actions+=/demonwrath,chain=1,interrupt=1,if=spell_targets.demonwrath>=3
	{'Demonwrath', 'moving'},
	--actions+=/demonbolt
	{'Demonbolt', '!moving&talent(7,2)&soulshards<=4'},
	--actions+=/shadow_bolt
	{'Shadow Bolt', '!moving&!talent(7,2)&soulshards<=4'},
	--actions+=/felstorm
	{'&Felstorm', 'combat(player).time>2'},
}

local inCombat = {
	{Keybinds},
	{Cooldowns, 'toggle(cooldowns)'},
	{ST, 'target.infront&target.range<=40'},
}

local outCombat = {
	{PreCombat},
	{'Life Tap', '{moving||!moving}&mana<=60&player.health>=15'},
}

NeP.CR:Add(266, {
	name = '|r[|cff00fff0Yumad|r] |cff8788eeWarlock|r - |cff8788eeDEMONOLOGY|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
