local spell_ids = {
  ["Cleanse"]                          = 4987,
  ["Specialized Bio-Optic Killshades"] = 81715,
  ["Eye for an Eye"]                   = 205191,
  ["Hammer of Justice"]                = 853,
  ["Righteous Fury"]                   = 25780,
  ["Aegis of Light"]                   = 204150,
  ["Absolution"]                       = 212056,
  ["Light of Dawn"]                    = 225311,
  ["Guardian of Ancient Kings"]        = 86659,
  ["Ashen Strike"]                     = 180290,
  ["Beacon of Faith"]                  = 156910,
  ["Contemplation"]                    = 121183,
  ["Blade of Light"]                   = 193115,
  ["Execution Sentence"]               = 213757,
  ["Hand of the Protector"]            = 213652,
  ["Devotion Aura"]                    = 183425,
  ["Greater Blessing of Kings"]        = 203538,
  ["Aura of Sacrifice"]                = 183416,
  ["Beacon of Virtue"]                 = 200025,
  ["Crusader Strike"]                  = 231667,
  ["Divine Steed"]                     = 221883,
  ["Blinding Light"]                   = 115750,
  ["Unbreakable Spirit"]               = 114154,
  ["Guarded by the Light"]             = 53592,
  ["Zeal"]                             = 217020,
  ["Cleanse Toxins"]                   = 213644,
  ["Lay on Hands"]                     = 633,
  ["Arcane Torrent"]                   = 155145,
  ["Jailer's Judgment"]                = 162056,
  ["Power of the Silver Hand"]         = 200656,
  ["Block"]                            = 123830,
  ["Heart of the Crusader"]            = 32223,
  ["Judgment of Light"]                = 183778,
  ["Blessing of Spellwarding"]         = 204018,
  ["Luminous Charger"]                 = 55115,
  ["Holy Light"]                       = 82326,
  ["Divine Purpose"]                   = 223817,
  ["Glyph of Fire From the Heavens"]   = 57954,
  ["Forbearance"]                      = 25771,
  ["Pillar of Light"]                  = 147974,
  ["Templar's Verdict"]                = 224266,
  ["Light of the Martyr"]              = 219562,
  ["Divine Hammer"]                    = 198034,
  ["Holy Shock"]                       = 25914,
  ["Crusader's Might"]                 = 196926,
  ["Final Verdict"]                    = 198038,
  ["Righteous Protector"]              = 204074,
  ["Blade of Justice"]                 = 184575,
  ["Bastion of Light"]                 = 204035,
  ["Crusader's Judgment"]              = 204023,
  ["Light's Beacon"]                   = 53651,
  ["Unbound Freedom"]                  = 199325,
  ["Blessing of Sacrifice"]            = 6940,
  ["Glyph of Winged Vengeance"]        = 57979,
  ["Glyph of Pillar of Light"]         = 146959,
  ["Flash of Light"]                   = 19750,
  ["Ardent Defender"]                  = 66235,
  ["Glyph of the Luminous Charger"]    = 89401,
  ["Light of the Ancient Kings"]       = 86678,
  ["Ancient Fury"]                     = 86704,
  ["Bestow Faith"]                     = 223306,
  ["Judgments of the Wise"]            = 105424,
  ["Holy Paladin"]                     = 137029,
  ["Gift of the Naaru"]                = 59542,
  ["Unbreakable Healing Amplifiers"]   = 62271,
  ["The Fires of Justice"]             = 203316,
  ["Holy Prism"]                       = 114165,
  ["Arcing Light"]                     = 119952,
  ["Virtue's Blade"]                   = 202271,
  ["Fire From the Heavens"]            = 115995,
  ["Hand of Hindrance"]                = 183218,
  ["Cavalier"]                         = 230332,
  ["Greater Judgment"]                 = 218178,
  ["Shield of Vengeance"]              = 184689,
  ["Consecration"]                     = 205228,
  ["Ancient Guardian"]                 = 86657,
  ["Word of Glory"]                    = 210191,
  ["Rebuke"]                           = 96231,
  ["Beacon of the Lightbringer"]       = 197446,
  ["Righteousness"]                    = 227068,
  ["Blessed Hammer"]                   = 204019,
  ["Justicebringer 2000 Specs"]        = 41311,
  ["Aura of Mercy"]                    = 183415,
  ["Final Stand"]                      = 204077,
  ["Seal of Light"]                    = 202273,
  ["Eternal Flame"]                    = 156322,
  ["Divine Shield"]                    = 642,
  ["Fist of Justice"]                  = 198054,
  ["Fervent Martyr"]                   = 196923,
  ["Sacred Shield Overridde (Holy)"]   = 148040,
  ["Retribution Aura"]                 = 203797,
  ["Holy Shield"]                      = 152261,
  ["Avenger's Shield"]                 = 231665,
  ["Repentance"]                       = 20066,
  ["Avenging Wrath"]                   = 31884,
  ["Bastion of Power"]                 = 144569,
  ["Justicebringer 3000 Specs"]        = 46107,
  ["Riposte"]                          = 161800,
  ["Greater Blessing of Might"]        = 205729,
  ["Eye of Tyr"]                       = 209202,
  ["Beacon of Light"]                  = 231642,
  ["Divine Protection"]                = 498,
  ["Wake of Ashes"]                    = 218001,
  ["Blade of Wrath!"]                  = 231843,
  ["Hand of Reckoning"]                = 62124,
  ["Holy Wrath"]                       = 210220,
  ["Divine Intervention"]              = 213313,
  ["Crusade"]                          = 231895,
  ["Infusion of Light"]                = 54149,
  ["Boundless Conviction"]             = 115675,
  ["Rule of Law"]                      = 214202,
  ["Blade of Wrath"]                   = 231832,
  ["Blessing of Freedom"]              = 1044,
  ["Consecrated Ground"]               = 204054,
  ["Judgment"]                         = 231663,
  ["Shield of the Righteous"]          = 132403,
  ["Light's Hammer"]                   = 114158,
  ["Ashes to Ashes"]                   = 179546,
  ["Protection Paladin"]               = 137028,
  ["Blessing of Protection"]           = 1022,
  ["Sanctuary"]                        = 105805,
  ["Specialized Retinal Armor"]        = 127122,
  ["Greater Blessing of Wisdom"]       = 203539,
  ["Divine Storm"]                     = 224239,
  ["Winged Vengeance"]                 = 58244,
  ["Light of the Protector"]           = 184092,
  ["Seraphim"]                         = 152262,
  ["Sanctified Wrath"]                 = 53376,
  ["Retribution"]                      = 183436,
  ["Retribution Paladin"]              = 137027,
  ["Protector of the Innocent"]        = 94289,
  ["Plate Specialization"]             = 86539,
  ["Paladin"]                          = 137026,
  ["Tyr's Deliverance"]                = 200654,
  ["Last Defender"]                    = 203791,
  ["Knight Templar"]                   = 204139,
  ["Justicar's Vengeance"]             = 215661,
  ["Parry"]                            = 82242,
  ["Improved Block"]                   = 157488,
  ["Holy Avenger"]                     = 105809,
  ["Blessing of the Guardians"]        = 144581,
  ["Aura Mastery"]                     = 31821,
  ["Hammer of the Righteous"]          = 88263,
  ["Grand Crusader"]                   = 85043,
  ["Consecrated Hammer"]               = 203785,
  ["First Avenger"]                    = 203776,
}

local GUI = {
	--Rotation
	{type = 'header', text = 'Rotation', align = 'center'},
	{type = 'dropdown',text = 'Select...', key = 'ROTA', list = {
		{text = 'SimC', key = '1'},
		{text = 'AMR', key = '2'},
	}, default = '1' },
	{type = 'ruler'},{type = 'spacer'},
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkbox', text = 'Enable Lay on Hands', key = 'S_LOHE', default = true},
	{type = 'spinner', text = 'Player Health %', key = 'S_LOH', default = 10},
	{type = 'checkbox', text = 'Enable Flash of Light', key = 'S_FOLE', default = true},
	{type = 'spinner', text = 'Player Health %', key = 'S_FOL', default = 40},
	{type = 'checkbox', text = 'Enable Shield of Vengeance', key = 'S_SOVE', default = true},
	{type = 'spinner', text = 'Player Health %', key = 'S_SOV', default = 75},
	{type = 'checkbox', text = 'Enable Eye for an Eye', key = 'S_EFAEE', default = true},
	{type = 'spinner', text = 'Player Health %', key = 'S_EFAE', default = 90},
	{type = 'checkbox', text = 'Enable Gift of the Naaru', key = 'S_GOTNE', default = true},
	{type = 'spinner', text = 'Player Health %', key = 'S_GOTN', default = 40},
	{type = 'checkbox', text = 'Enable Healthstone', key = 'S_HSE', default = true},
	{type = 'spinner', text = 'Player Health %', key = 'S_HS', default = 20},
	{type = 'checkbox', text = 'Enable Ancient Healing Potion', key = 'S_AHPE', default = true},
	{type = 'spinner', text = 'Player Health %', key = 'S_AHP', default = 20},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Emergency Group Assistance
	{type = 'header', text = 'Emergency Group Assistance', align = 'center'},
	{type = 'checkbox', text = 'Enable Emergency Group Assistance', key = 'E_GAE', default = false},
	{type = 'spinner', text = 'Flash of Light', key = 'E_FOL', default = 35},
	{type = 'spinner', text = 'Lay on Hands', key = 'E_LOH', default = 10},
	{type = 'spinner', text = 'Blessing of Protection', key = 'E_BOP', default = 10},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Blessings
	{type = 'header', text = 'Blessings', align = 'center'},
	{type = 'text', text = 'Check to enable blessings on yourself'},
	{type = 'checkbox', text = 'Blessing of Kings', key = 'B_BOKP', default = false},
	{type = 'checkbox', text = 'Blessing of Wisdom', key = 'B_BOWP', default = false},
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cfff58cba ----------------------------------------------------------------------|r')
	print('|cfff58cba --- |rPaladin: |cfff58cbaRETRIBUTION|r')
	print('|cfff58cba --- |rTalents ST: 1:1 - 2:1/2 - 3:1/2/3 - 4:2 - 5:2 - 6:1/2 - 7:2|r')
	print('|cfff58cba --- |rTalents AoE: 1:1 - 2:1 - 3:1/2/3 - 4:3 - 5:2 - 6:1/2 - 7:2|r')
	print('|cfff58cba ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		-- Cleanse Toxin
		key = 'yuCT',
		name = 'Cleanse Toxin',
		text = 'Enable/Disable: Automatic removal of Poison and Diseases',
		icon = 'Interface\\ICONS\\spell_holy_renew',
	})
	NeP.Interface:AddToggle({
		-- Emergency Group Assistance
		key = 'yuEGA',
		name = 'Emergency Group Assistance',
		text = 'Enable/Disable: Automatic LoH/BoP/FoL on group members',
		icon = 'Interface\\ICONS\\ability_fiegndead',
	})
end

local Survival = {
	-- Lay on Hands usage if enabled in UI.
	{'&Lay on Hands', 'UI(S_LOHE)&{!player.debuff(Ignite Soul)}&player.health<=UI(S_LOH)'},
	-- Shield of Vengeance usage if enabled in UI.
	{'&Shield of Vengeance', 'UI(S_SOVE)&player.health<=UI(S_SOV)'},
	-- Eye for an Eye usage if enabled in UI.
	{'Eye for an Eye', 'talent(5,2)&UI(S_EFAEE)&player.health<=UI(S_EFAE)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'&Gift of the Naaru', 'UI(S_GOTNE)&{!player.debuff(Ignite Soul)}&player.health<=UI(S_GOTN)'},
	-- Healthstone usage if enabled in UI.
	{'#5512', 'UI(S_HSE)&{!player.debuff(Ignite Soul)}&player.health<=UI(S_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#127834', 'UI(S_AHPE)&{!player.debuff(Ignite Soul)}&player.health<=UI(S_AHP)'},
}

local Player = {
	-- Flash of Light usage if enabled in UI.
	{'!Flash of Light', 'UI(S_FOLE)&{!player.debuff(Ignite Soul)}&player.health<=UI(S_FOL)', 'player'},
}

local Emergency = {
	-- Flash of Light usage if enabled in UI.
	{'!Flash of Light', 'UI(E_GAE)&{!lowest.debuff(Ignite Soul)}&lowest.health<=UI(E_FOL)', 'lowest'},
	-- Lay on Hands usage if enabled in UI.
	{'!Lay on Hands', 'UI(E_GAE)&{!lowest.debuff(Ignite Soul)}&lowest.health<=UI(E_LOH)', 'lowest'},
	-- Blessing of Protection usage if enabled in UI.
	{'!Blessing of Protection', 'UI(E_GAE)&{!lowest.debuff(Ignite Soul)}&lowest.health<=UI(E_BOP)&!lowest.role(tank)', 'lowest'},
}

local Interrupts = {
	{'&Rebuke', 'target.range<=5'},
	{'Hammer of Justice', '!equipped(Justice Gaze)&target.range<=10&spell(Rebuke).cooldown>gcd&!lastgcd(Rebuke)'},
	{'Hammer of Justice', 'equipped(Justice Gaze)&target.health>=75&target.range<=10&spell(Rebuke).cooldown>gcd&!lastgcd(Rebuke)'},
	{'Blinding Light', 'talent(3,3)&target.range<=10&spell(Rebuke).cooldown>gcd&!lastgcd(Rebuke)'},
	{'&Arcane Torrent', 'target.range<=8&spell(Rebuke).cooldown>gcd&!lastgcd(Rebuke)'},
}

local Dispel = {
	{'%dispelself'},
}

local Blessings = {
	{'Greater Blessing of Kings', 'UI(B_BOKP)&!player.buff(Greater Blessing of Kings)', 'player'},
	{'Greater Blessing of Wisdom', 'UI(B_BOWP)&!player.buff(Greater Blessing of Wisdom)', 'player'},
}

-- ####################################################################################
-- Primairly sourced from legion-dev SimC.
-- Updates to rotations from sources are considered for implementation.
-- ####################################################################################

-- SimC APL 4/20/2017
-- https://github.com/simulationcraft/simc/blob/legion-dev/profiles/Tier19M/Paladin_Retribution_T19M.simc

local Cooldowns = {
	--actions+=/arcane_torrent,if=holy_power<5&(buff.crusade.up|buff.avenging_wrath.up|time<2)
	{'&Arcane Torrent', 'holypower<5&{player.buff(Crusade)||player.buff(Avenging Wrath)||combat(player).time<2}'},
	--actions+=/holy_wrath
	{'Holy Wrath', 'talent(7,3)'},
	--actions+=/avenging_wrath
	{'&Avenging Wrath', '!talent(7,2)'},
	--actions+=/crusade,if=holy_power>=5&!equipped.137048|((equipped.137048|race.blood_elf)&holy_power>=2)
	--Crusade for SimC rota
	{'&Crusade', 'talent(7,2)&UI(ROTA) == 1&{holypower>=5&!equipped(Liadrin\'s Fury Unleashed)||{equipped(Liadrin\'s Fury Unleashed)&holypower>=2}}'},
	--Crusade for AMR rota
	{'&Crusade', 'talent(7,2)&UI(ROTA) == 2&holypower>=5'},
}

--
--Original Yumad Rotaion (SimulationCraft) 
--

local CombatSIMC = {
	{'/startattack', '!isattacking'},
	--actions+=/judgment,if=time<2
	{'Judgment', 'combat(player).time<2'},
	--actions+=/blade_of_justice,if=time<2&(equipped.137048|race.blood_elf)
	{'Blade of Justice', 'combat(player).time<2&equipped(Liadrin\'s Fury Unleashed)'},
	--actions+=/divine_hammer,if=time<2&(equipped.137048|race.blood_elf)
	{'Divine Hammer', 'talent(4,3)&combat(player).time<2&equipped(Liadrin\'s Fury Unleashed)'},
	--actions+=/wake_of_ashes,if=holy_power<=1&time<2
	{'Wake of Ashes', 'holypower<=1&combat(player).time<2'},
	--actions+=/execution_sentence,if=spell_targets.divine_storm<=3&(cooldown.judgment.remains<gcd*4.5|debuff.judgment.remains>gcd*4.5)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
	{'Execution Sentence','talent(1,2)&player.area(8).enemies<=3&{spell(Judgment).cooldown<gcd*4.5||target.debuff(judgment).duration>gcd*4.5}&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*2}'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2
	{'Divine Storm', 'target.debuff(Judgment)&player.area(8).enemies>=2&player.buff(Divine Purpose).duration<gcd*2'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&buff.divine_purpose.react
	{'Divine Storm', 'target.debuff(Judgment)&player.area(8).enemies>=2&holypower>=5&player.buff(Divine Purpose)'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=3&(buff.crusade.up&(buff.crusade.stack<15|buff.bloodlust.up)|buff.liadrins_fury_unleashed.up)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(8).enemies>=2&holypower>=3&{player.buff(Crusade)&{player.buff(Crusade).count<15||hashero}||player.buff(Liadrin\'s Fury Unleashed)}'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(8).enemies>=2&holypower>=5&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(Divine Purpose).duration<gcd*2'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&buff.divine_purpose.react
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=5&player.buff(Divine Purpose)'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(buff.crusade.up&(buff.crusade.stack<15|buff.bloodlust.up)|buff.liadrins_fury_unleashed.up)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{player.buff(Crusade)&{player.buff(Crusade).count<15||hashero}||player.buff(Liadrin\'s Fury Unleashed)}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>gcd)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=5&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*3}&{!talent(1,2)||spell(Execution Sentence).cooldown>gcd}'},
	--actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Divine Storm', 'target.debuff(Judgment)&holypower>=3&player.area(8).enemies>=2&{spell(Wake of Ashes).cooldown<gcd*2&artifact(Wake of Ashes).enabled||player.buff(Whisper of the Nathrezim).duration<gcd}&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{spell(Wake of Ashes).cooldown<gcd*2&artifact(Wake of Ashes).enabled||player.buff(Whisper of the Nathrezim).duration<gcd}&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/judgment,if=dot.execution_sentence.ticking&dot.execution_sentence.remains<gcd*2&debuff.judgment.remains<gcd*2
	{'Judgment', 'target.debuff(Execution Sentence).duration<gcd*2&target.debuff(Judgment).duration<gcd*2'},
	--actions+=/wake_of_ashes,if=(!raid_event.adds.exists|raid_event.adds.in>15)&(holy_power=0|holy_power=1&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)|holy_power=2&(cooldown.zeal.charges_fractional<=0.65|cooldown.crusader_strike.charges_fractional<=0.65))
	{'Wake of Ashes', 'holypower=0||holypower=1&{spell(Blade of Justice).cooldown>gcd||spell(Divine Hammer).cooldown>gcd}||holypower=2&{spell(Zeal).charges<=0.65||spell(Crusader Strike).charges<=0.65}'},
	--actions+=/blade_of_justice,if=(holy_power<=2&set_bonus.tier20_2pc=1|holy_power<=3&set_bonus.tier20_2pc=0)
	{'Blade of Justice', 'holypower<=2&set_bonus(T20)>=2||holypower<=3&set_bonus(T20)=0'},
	--actions+=/divine_hammer,if=(holy_power<=2&set_bonus.tier20_2pc=1|holy_power<=3&set_bonus.tier20_2pc=0)
	{'Divine Hammer', 'holypower<=2&set_bonus(T20)>=2||holypower<=3&set_bonus(T20)=0'},
	--actions+=/hammer_of_justice,if=equipped.137065&target.health.pct>=75&holy_power<=4
	{'Hammer of Justice', 'equipped(Justice Gaze)&target.health>=75&holypower<=4'},
	--actions+=/judgment
	{'Judgment'},
	--actions+=/zeal,if=charges=2&(set_bonus.tier20_2pc=0&holy_power<=2|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))|(set_bonus.tier20_2pc=1&holy_power<=1|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))
	{'Zeal', 'talent(2,2)&spell(Zeal).charges=2&{set_bonus(T20)=0&holypower<=2||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}||{set_bonus(T20)>=2&holypower<=1||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}'},
	--actions+=/crusader_strike,if=charges=2&(set_bonus.tier20_2pc=0&holy_power<=2|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))|(set_bonus.tier20_2pc=1&holy_power<=1|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))
	{'Crusader Strike', '!talent(2,2)&spell(Crusader Strike).charges=2&{set_bonus(T20)=0&holypower<=2||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}||{set_bonus(T20)>=2&holypower<=1||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}'},
	--actions+=/consecration
	{'Consecration', 'talent(1,3)'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.react
	{'Divine Storm', 'target.debuff(Judgment)&player.area(8).enemies>=2&player.buff(Divine Purpose)'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(8).enemies>=2&player.buff(The Fires of Justice)&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=4&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Divine Storm', 'target.debuff(Judgment)&player.area(8).enemies>=2&holypower>=4&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.react
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(Divine Purpose)'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(The Fires of Justice)&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=4&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>gcd*2)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=4&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*4}&{!talent(1,2)||spell(Execution Sentence).cooldown>gcd*2}'},
	--actions+=/zeal,if=holy_power<=4
	{'Zeal', 'talent(2,2)&holypower<=4'},
	--actions+=/crusader_strike,if=holy_power<=4
	{'Crusader Strike', '!talent(2,2)&holypower<=4'},
	--actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)
	{'Divine Storm', 'target.debuff(Judgment)&holypower>=3&player.area(8).enemies>=2&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*5}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*5}'},
}

--
--  Yumads Rotaion with forced Singletarget (Could have done that within one Block but it's less cluttered zhis way)
--

local CombatSTSIMC = {
	{'/startattack', '!isattacking'},
	--actions+=/judgment,if=time<2
	{'Judgment', 'combat(player).time<2'},
	--actions+=/blade_of_justice,if=time<2&(equipped.137048|race.blood_elf)
	{'Blade of Justice', 'combat(player).time<2&equipped(Liadrin\'s Fury Unleashed)'},
	--actions+=/divine_hammer,if=time<2&(equipped.137048|race.blood_elf)
	{'Divine Hammer', 'talent(4,3)&combat(player).time<2&equipped(Liadrin\'s Fury Unleashed)'},
	--actions+=/wake_of_ashes,if=holy_power<=1&time<2
	{'Wake of Ashes', 'holypower<=1&combat(player).time<2'},
	--actions+=/execution_sentence,if=spell_targets.divine_storm<=3&(cooldown.judgment.remains<gcd*4.5|debuff.judgment.remains>gcd*4.5)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
	{'Execution Sentence','talent(1,2)&{spell(Judgment).cooldown<gcd*4.5||target.debuff(judgment).duration>gcd*4.5}&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*2}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(Divine Purpose).duration<gcd*2'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&buff.divine_purpose.react
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=5&player.buff(Divine Purpose)'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(buff.crusade.up&(buff.crusade.stack<15|buff.bloodlust.up)|buff.liadrins_fury_unleashed.up)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{player.buff(Crusade)&{player.buff(Crusade).count<15||hashero}||player.buff(Liadrin\'s Fury Unleashed)}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>gcd)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=5&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*3}&{!talent(1,2)||spell(Execution Sentence).cooldown>gcd}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{spell(Wake of Ashes).cooldown<gcd*2&artifact(Wake of Ashes).enabled||player.buff(Whisper of the Nathrezim).duration<gcd}&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*4}'},
	--actions+=/judgment,if=dot.execution_sentence.ticking&dot.execution_sentence.remains<gcd*2&debuff.judgment.remains<gcd*2
	{'Judgment', 'target.debuff(Execution Sentence).duration<gcd*2&target.debuff(Judgment).duration<gcd*2'},
	--actions+=/wake_of_ashes,if=(!raid_event.adds.exists|raid_event.adds.in>15)&(holy_power=0|holy_power=1&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)|holy_power=2&(cooldown.zeal.charges_fractional<=0.65|cooldown.crusader_strike.charges_fractional<=0.65))
	{'Wake of Ashes', 'holypower=0||holypower=1&{spell(Blade of Justice).cooldown>gcd||spell(Divine Hammer).cooldown>gcd}||holypower=2&{spell(Zeal).charges<=0.65||spell(Crusader Strike).charges<=0.65}'},
	--actions+=/blade_of_justice,if=(holy_power<=2&set_bonus.tier20_2pc=1|holy_power<=3&set_bonus.tier20_2pc=0)
	{'Blade of Justice', 'holypower<=2&set_bonus(T20)>=2||holypower<=3&set_bonus(T20)=0'},
	--actions+=/divine_hammer,if=(holy_power<=2&set_bonus.tier20_2pc=1|holy_power<=3&set_bonus.tier20_2pc=0)
	{'Divine Hammer', 'holypower<=2&set_bonus(T20)>=2||holypower<=3&set_bonus(T20)=0'},
	--actions+=/hammer_of_justice,if=equipped.137065&target.health.pct>=75&holy_power<=4
	{'Hammer of Justice', 'equipped(Justice Gaze)&target.health>=75&holypower<=4'},
	--actions+=/judgment
	{'Judgment'},
	--actions+=/zeal,if=charges=2&(set_bonus.tier20_2pc=0&holy_power<=2|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))|(set_bonus.tier20_2pc=1&holy_power<=1|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))
	{'Zeal', 'talent(2,2)&spell(Zeal).charges=2&{set_bonus(T20)=0&holypower<=2||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}||{set_bonus(T20)>=2&holypower<=1||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}'},
	--actions+=/crusader_strike,if=charges=2&(set_bonus.tier20_2pc=0&holy_power<=2|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))|(set_bonus.tier20_2pc=1&holy_power<=1|(holy_power<=4&(cooldown.divine_hammer.remains>gcd*2|cooldown.blade_of_justice.remains>gcd*2)&cooldown.judgment.remains>gcd*2))
	{'Crusader Strike', '!talent(2,2)&spell(Crusader Strike).charges=2&{set_bonus(T20)=0&holypower<=2||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}||{set_bonus(T20)>=2&holypower<=1||{holypower<=4&{spell(Divine Hammer).cooldown>gcd*2||spell(Blade of Justice).cooldown>gcd*2}&spell(Judgment).cooldown>gcd*2}}'},
	--actions+=/consecration
	{'Consecration', 'talent(1,3)'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.react
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(Divine Purpose)'},
	--actions+=/templars_verdict,if=debuff.judgment.up&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&player.buff(The Fires of Justice)&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*3}'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=4&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>gcd*2)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=4&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*4}&{!talent(1,2)||spell(Execution Sentence).cooldown>gcd*2}'},
	--actions+=/zeal,if=holy_power<=4
	{'Zeal', 'talent(2,2)&holypower<=4'},
	--actions+=/crusader_strike,if=holy_power<=4
	{'Crusader Strike', '!talent(2,2)&holypower<=4'},
	--actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)
	{'Templar\'s Verdict', 'target.debuff(Judgment)&holypower>=3&{!talent(7,2)||talent(7,2)&!toggle(cooldowns)||spell(Crusade).cooldown>gcd*5}'},
}

--
--  AskMrRobot Rotation
--

local CombatAMR = {
	{'/startattack', '!isattacking'},
	{'Judgment', 'holypower>=3||{holypower>=2&player.buff(The Fires of Justice)}||{talen(7,1)&player.buff(Divine Purpose)'},
	
	--T20 Bonus Rotation Changes
	{'Blade of Justice', 'set_bonus(T20)>=2&{holypower<=2||{!set_bonus(T20)>=4&holypower<=3}}'},
	{'Divine Hammer', 'set_bonus(T20)>=2&{holypower<=2||{!set_bonus(T20)>=4&holypower<=3}}'},
	
	--Divine Storm when AoE enabled
	{'Divine Storm', 'toggle(AOE)&target.debuff(Judgment)&player.area(8).enemies>=2&{!talent(7,2)||spell(Crusade).cooldown>gcd*2||!toggle(Cooldowns)}'},	
	
	--nested Singletarget-Rotation
	{{
	{'Execution Sentence'},
	{'Justicar\'s Vengeance', '!equipped(207633)&!talent(1,1)&target.debuff(Judgment)&player.buff(Divine Purpose)'},
	{'Divine Storm', 'target.debuff(Judgment)&player.buff(248289).count>=25'}, --use DS when legendary Chest-Stacks high (even ST)
	{'Templar\'s Verdict', 'target.debuff(Judgment)||player.spell(Judgment).cooldown>=gcd'},
	}, '{player.area(8).enemies<2||!toggle(AOE)}&{!talent(7,2)||spell(Crusade).cooldown>gcd*2||!toggle(Cooldowns)}'},
	
	--all that other Stuff
	{'Wake of Ashes', 'holypower<=1'},
	{'Blade of Justice', 'set_bonus(T20)<2'},
	{'Divine Hammer', 'set_bonus(T20)<2'},
	{'Consecration'},
	{'Zeal'},
	{'Crusader Strike'},
	{'Judgment'},
}

local inCombat = {
	{Dispel, 'toggle(yuCT)&spell(Cleanse Toxins).cooldown=0'},
	{Survival},
	{Blessings},
	{Emergency, 'ingroup&toggle(yuEGA)'},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront'},
	{Cooldowns, 'toggle(cooldowns)'},
	{CombatSIMC, 'UI(ROTA) == 1&target.infront&target.range<=8&toggle(AoE)'},
	{CombatSTSIMC, 'UI(ROTA) == 1&target.infront&target.range<=8&!toggle(AoE)'},
	{CombatAMR, 'UI(ROTA) == 2&target.infront&target.range<=8'},
}

local outCombat = {
	{Dispel, 'toggle(yuCT)&spell(Cleanse Toxins).cooldown=0'},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront'},
	{Blessings},
	{Emergency, 'ingroup&toggle(yuEGA)'},
}

NeP.CR:Add(70, {
	name = '|r[|cff00fff0Yumad|r] |cfff58cbaPaladin|r - |cfff58cbaRETRIBUTION|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	ids = spell_ids,
	load = exeOnLoad
})
