local GUI = {
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkbox', text = 'Enable Lay on Hands', key = 'S_LOHE', default = true},
	{type = 'spinner', text = 'Lay on Hands (Health %)', key = 'S_LOH', default = 10},
	{type = 'checkbox', text = 'Enable Flash of Light', key = 'S_FOLE', default = true},
	{type = 'spinner', text = 'Flash of Light (Health %)', key = 'S_FOL', default = 40},
	{type = 'checkbox', text = 'Enable Shield of Vengeance', key = 'S_SOVE', default = true},
	{type = 'spinner', text = 'Shield of Vengeance (Health %)', key = 'S_SOV', default = 75},
	{type = 'checkbox', text = 'Enable Eye for an Eye', key = 'S_EFAEE', default = true},
	{type = 'spinner', text = 'Eye for an Eye (Health %)', key = 'S_EFAE', default = 90},
	{type = 'checkbox', text = 'Enable Every Man for Himself (Stun)', key = 'S_EMFHSE', default = true},
	{type = 'checkbox', text = 'Enable Blessing of Freedom (Root)', key = 'S_BOFRE', default = true},
	{type = 'checkbox', text = 'Enable Blessing of Freedom (Snare)', key = 'S_BOFSE', default = true},
	{type = 'checkbox', text = 'Enable Gift of the Naaru', key = 'S_GOTNE', default = true},
	{type = 'spinner', text = 'Gift of the Naaru (Health %)', key = 'S_GOTN', default = 40},
	{type = 'checkbox', text = 'Enable Healthstone', key = 'S_HSE', default = true},
	{type = 'spinner', text = 'Healthstone (Health %)', key = 'S_HS', default = 20},
	{type = 'checkbox', text = 'Enable Ancient Healing Potion', key = 'S_AHPE', default = true},
	{type = 'spinner', text = 'Ancient Healing Potion (Health %)', key = 'S_AHP', default = 20},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Emergency Healing
	{type = 'header', text = 'Emergency Healing', align = 'center'},
	{type = 'checkbox', text = 'Enable Emergency Healing', key = 'E_FOLE', default = true},
	{type = 'text', text = 'Thresholds set to ensure party member survival.'},
	{type = 'spinner', text = 'Flash of Light (Health %)', key = 'E_FOL', default = 35},
	{type = 'ruler'},{type = 'spacer'},

	--[[ GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'checkbox', text = 'L-Shift: Liquid Magma Totem @ Cursor', key = 'K_LMT', default = true},
	{type = 'checkbox', text = 'L-Control: Lightning Surge Totem @ Cursor', key = 'K_LST', default = true},
	{type = 'checkbox', text = 'L-Alt: Earthbind Totem @ Cursor', key = 'K_ET', default = true},
	{type = 'ruler'},{type = 'spacer'},
	]]

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'text', text = 'Activate on-use trinkets on cooldown.'},
	{type = 'checkbox', text = 'Enable Top Trinket', key = 'trinket_1', default = false},
	{type = 'checkbox', text = 'Enable Bottom Trinket', key = 'Trinket_2', default = false},
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cfff58cba ----------------------------------------------------------------------|r')
	print('|cfff58cba --- |rPaladin: |cfff58cbaRETRIBUTION|r')
	print('|cfff58cba --- |rNOT FINISHED Talents: 1/2 - 2/2 - 3/1 - 4/2 - 5/2 - 6/1 - 7/2')
	print('|cfff58cba --- |rNo Multitarget (AoE) enabled settings')
	print('|cfff58cba ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		-- Cleanse Toxin
		key = 'yuPS',
		name = 'Cleanse Toxin',
		text = 'Enable/Disable: Automatic removal of Poison and Diseases.',
		icon = 'Interface\\ICONS\\spell_holy_renew',
	})
end

local Survival = {
	-- Lay on Hands usage if enabled in UI.
	{'&Lay on Hands', 'UI(S_LOHE)&player.health<=UI(S_LOH)'},
	-- Shield of Vengeance usage if enabled in UI.
	{'&Shield of Vengeance', 'UI(S_SOVE)&player.health<=UI(S_SOV)'},
	-- Eye for an Eye usage if enabled in UI.
	{'Eye for an Eye', 'talent(5,2)&UI(S_EFAEE)&player.health<=UI(S_EFAE)'},
	-- Every Man for Himself usage if enabled in UI.
	{'&Every Man for Himself', 'UI(S_EMFHSE)&player.state.stun'},
	-- Blessing of Freedom usage if enabled in UI.
	{'!Blessing of Freedom', 'UI(S_BOFRE)&player.state.root'},
	-- Blessing of Freedom usage if enabled in UI.
	{'!Blessing of Freedom', 'UI(S_BOFSE)&player.state.snare'},
	-- Gift of the Naaru usage if enabled in UI.
	{'&Gift of the Naaru', 'UI(S_GOTNE)&player.health<=UI(S_GOTN)'},
	-- Healthstone usage if enabled in UI.
	{'#Healthstone', 'UI(S_HSE)&player.health<=UI(S_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#Ancient Healing Potion', 'UI(S_AHPE)&player.health<=UI(S_AHP)'},
}

local Player = {
	-- Flash of Light usage if enabled in UI.
	{'!Flash of Light', '!moving&UI(S_FOLE)&player.health<=UI(S_FOL)', 'player'},
}

local Emergency = {
	-- Flash of Light usage if enabled in UI.
	{'!Flash of Light', '!moving&UI(E_FOLE)&lowest.health<=UI(E_FOL)', 'lowest'},
}

local Keybinds = {
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)&!equipped(Faulty Countermeasure)'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)'},
}

local Interrupts = {
	{'&Rebuke', 'target.range<=5'},
	{'Hammer of Justice', 'target.range<=10&spell(Rebuke).cooldown>gcd&!lastgcd(Rebuke)'},
	{'Blinding Light', 'talent(3,3)&target.range<=10&spell(Rebuke).cooldown>gcd&!lastgcd(Rebuke)'},
	{'Arcane Torrent', 'target.range<=8&spell(Rebuke).cooldown>gcd&!lastgcd(Rebuke)'},
}

local Dispel = {
	{'%dispelall'},
}

local Blessings = {
	{'Greater Blessing of Wisdom', '!player.buff(Greater Blessing of Wisdom)', 'player'},
	{'Greater Blessing of Kings', '!player.buff(Greater Blessing of Kings)', 'player'},
}

-- SimC APL 1/7/2017
-- https://github.com/simulationcraft/simc/blob/legion-dev/profiles/Tier19M/Paladin_Retribution_T19M.simc
local Cooldowns = {
	--actions+=/use_item,name=faulty_countermeasure,if=(buff.avenging_wrath.up|buff.crusade.up)
	{'#trinket1', 'equipped(Faulty Countermeasure)&{player.buff(Avenging Wrath)||player.buff(Crusade)}'},
	--actions+=/arcane_torrent,if=holy_power<5&(buff.crusade.up|buff.avenging_wrath.up|time<2)
	{'Arcane Torrent', 'holypower<5&{player.buff(Crusade)||player.buff(Avenging Wrath)||combat.time<2}'},
	--actions+=/wake_of_ashes,if=holy_power<=1&time<2
	{'Wake of Ashes', 'holypower<=1&combat.time<2'},
	--actions+=/holy_wrath
	{'Holy Wrath'},
	--actions+=/avenging_wrath
	{'Avenging Wrath', '!talent(7,2)'},
	--actions+=/crusade,if=holy_power>=5&!equipped.137048|((equipped.137048|race.blood_elf)&time<2|time>2&holy_power>=4)
	{'&Crusade', 'talent(7,2)&{holypower>=5&!equipped(Liadrin\'s Fury Unleashed)||{{equipped(Liadrin\'s Fury Unleashed)}&combat.time<2||combat.time>2&holypower>=4}}'},
	--actions+=/execution_sentence,if=spell_targets.divine_storm<=3&(cooldown.judgment.remains<gcd*4.5|debuff.judgment.remains>gcd*4.67)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
	{'Execution Sentence','talent(1,2)&{player.area(6).enemies<=3&{spell(Judgment).cooldown<gcd*4.5||target.debuff(judgment).duration>gcd*4.67}&{!talent(7,2)||spell(Crusade).cooldown>gcd*2}}'},
}

local Combat = {
	--actions+=/judgment,if=time<2
	{'Judgment', 'combat.time<2'},
	--actions+=/blade_of_justice,if=time<2&(equipped.137048|race.blood_elf)
	{'Blade of Justice', 'combat.time<2&{equipped(Liadrin\'s Fury Unleashed)}'},
	--actions+=/divine_hammer,if=time<2&(equipped.137048|race.blood_elf)
	{'Divine Hammer', 'combat.time<2&{equipped(Liadrin\'s Fury Unleashed)}'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2
	{'Divine Storm', 'target.debuff(Judgment)&player.area(6).enemies>=2&player.buff(Divine Purpose)&player.buff(Divine Purpose).duration<gcd*2'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&buff.divine_purpose.react
	{'Divine Storm', 'target.debuff(Judgment)&player.area(6).enemies>=2&holypower>=5&player.buff(Divine Purpose)'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=3&buff.crusade.up&(buff.crusade.stack<15|buff.bloodlust.up)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(6).enemies>=2&holypower>=3&player.buff(Crusade)&{player.buff(Crusade).count<15||hashero}'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(6).enemies>=2&holypower>=5&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(Divine Purpose)&player.buff(Divine Purpose).duration<gcd*2'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&buff.divine_purpose.react
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=5&player.buff(Divine Purpose)'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&buff.crusade.up&(buff.crusade.stack<15|buff.bloodlust.up)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&player.buff(Crusade)&{player.buff(Crusade).count<15||hashero}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=5&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Divine Storm', 'target.debuff(Judgment)&holypower>=3&player.area(6).enemies>=2&{spell(Wake of Ashes).cooldown<gcd*2&artifact(Wake of Ashes).enabled||player.buff(Whisper of the Nathrezim)&player.buff(Whisper of the Nathrezim).duration<gcd}&{!talent(7,2)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{spell(Wake of Ashes).cooldown<gcd*2&artifact(Wake of Ashes).enabled||player.buff(Whisper of the Nathrezim)&player.buff(Whisper of the Nathrezim).duration<gcd}&{!talent(7,2)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/wake_of_ashes,if=holy_power=0|holy_power=1&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)|holy_power=2&(cooldown.zeal.charges_fractional<=0.65|cooldown.crusader_strike.charges_fractional<=0.65)
	{'Wake of Ashes', 'holypower=0||holypower=1&{spell(Blade of Justice).cooldown>gcd||spell(Divine Hammer).cooldown>gcd}||holypower=2&{spell(Zeal).charges<=0.65||spell(Crusader Strike).charges<=0.65}'},
	--actions+=/blade_of_justice,if=holy_power<=3&buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains>gcd&buff.whisper_of_the_nathrezim.remains<gcd*3&debuff.judgment.up&debuff.judgment.remains>gcd*2
	{'Blade of Justice', 'holypower<=3||player.buff(Whisper of the Nathrezim)&player.buff(Whisper of the Nathrezim).duration>gcd&player.buff(Whisper of the Nathrezim).duration<gcd*3&target.debuff(Judgment).duration>gcd*2'},
	--actions+=/divine_hammer,if=holy_power<=3&buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains>gcd&buff.whisper_of_the_nathrezim.remains<gcd*3&debuff.judgment.up&debuff.judgment.remains>gcd*2
	{'Divine Hammer', 'holypower<=3||player.buff(Whisper of the Nathrezim)&player.buff(Whisper of the Nathrezim).duration>gcd&player.buff(Whisper of the Nathrezim).duration<gcd*3&target.debuff(Judgment).duration>gcd*2'},
	--actions+=/blade_of_justice,if=talent.blade_of_wrath.enabled&holy_power<=3
	{'Blade of Justice', 'talent(4,2)&holypower<=3'},
	--actions+=/zeal,if=charges=2&holy_power<=4
	{'Zeal', 'talent(2,2)&{spell(Zeal).charges=2&holypower<=4}'},
	--actions+=/crusader_strike,if=charges=2&holy_power<=4
	{'Crusader Strike', 'spell(Crusader Strike).charges=2&holypower<=4'},
	--actions+=/blade_of_justice,if=holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))
	{'Blade of Justice', 'holypower<=2||{holypower<=3&{spell(Zeal).charges<=1.34||spell(Crusader Strike).charges<=1.34}}'},
	--actions+=/divine_hammer,if=holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))
	{'Divine Hammer', 'holypower<=2||{holypower<=3&{spell(Zeal).charges<=1.34||spell(Crusader Strike).charges<=1.34}}'},
	--actions+=/judgment,if=holy_power>=3|((cooldown.zeal.charges_fractional<=1.67|cooldown.crusader_strike.charges_fractional<=1.67)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd))|(talent.greater_judgment.enabled&target.health.pct>50)
	{'Judgment', 'holypower>=3||{{spell(Zeal).charges<=1.67||spell(Crusader Strike).charges<=1.67}&{spell(Divine Hammer).cooldown>gcd||spell(Blade of Justice).cooldown>gcd}}||{talent(2,3)&target.health>50}'},
	--actions+=/consecration
	{'Consecration', 'talent(1,3)'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.react
	{'Divine Storm', 'target.debuff(Judgment)&player.area(6).enemies>=2&player.buff(Divine Purpose)'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(6).enemies>=2&player.buff(The Fires of Justice)&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(6).enemies>=2&{holypower>=4||{{spell(Zeal).charges<=1.34||spell(Crusader Strike).charges<=1.34}&{spell(Divine Hammer).cooldown>gcd||spell(Blade of Justice).cooldown>gcd}}}&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.react
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(Divine Purpose)'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(The Fires of Justice)&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&{holypower>=4||{{spell(Zeal).charges<=1.34||spell(Crusader Strike).charges<=1.34}&{spell(Divine Hammer).cooldown>gcd||spell(Blade of Justice).cooldown>gcd}}}&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/zeal,if=holy_power<=4
	{'Zeal', 'talent(2,2)&holypower<=4'},
	--actions+=/crusader_strike,if=holy_power<=4
	{'Crusader Strike', 'holypower<=4'},
	--actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)
	{'Divine Storm', 'target.debuff(Judgment)&holypower>=3&player.area(6).enemies>=2&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*5}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{{talent(7,2)&!toggle(cooldowns)}||!talent(7,2)||spell(Crusade).cooldown>gcd*5}'},
}

local inCombat = {
	--{Keybinds, '{!moving||moving}'},
	{Dispel, '{!moving||moving}&toggle(yuPS)&spell(Cleanse Toxins).cooldown=0'},
	{Survival, '{!moving||moving}'},
	{Blessings, '{!moving||moving}'},
	{Player, 'player.health<100'},
	{Emergency},
	{Trinkets, '{!moving||moving}'},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront'},
	{Cooldowns, '{!moving||moving}&toggle(cooldowns)'},
	{Combat, 'target.infront&target.range<=8'},
}

local outCombat = {
	{Dispel, '{!moving||moving}&toggle(yuPS)&spell(Cleanse Toxins).cooldown=0'},
	{Interrupts, '{!moving||moving}&toggle(interrupts)&target.interruptAt(70)&target.infront'},
	{Blessings, '{!moving||moving}'},
}

NeP.CR:Add(70, {
	name = '|r[|cff00fff0Yumad|r] Paladin - |cfff58cbaRetribution|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})