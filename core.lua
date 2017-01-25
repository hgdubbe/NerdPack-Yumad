local _, Yumad = ...

-- ####################################################################################
-- Credit to Xeer for all of his amazing work.
-- I'm using a modified core.lua of selected bits and pieces with additions.
-- https://github.com/X-Xeer-X/NerdPack-Xeer
-- ####################################################################################

-- ####################################################################################
-- Warlock
-- ####################################################################################
Yumad.durations = {}
Yumad.durations["Wild Imp"] = 12
Yumad.durations["Dreadstalker"] = 12
Yumad.durations["Imp"] = 25
Yumad.durations["Felhunter"] = 25
Yumad.durations["Succubus"] = 25
Yumad.durations["Felguard"] = 25
Yumad.durations["Darkglare"] = 12
Yumad.durations["Doomguard"] = 25
Yumad.durations["Infernal"] = 25
Yumad.durations["Voidwalker"] = 25

Yumad.active_demons = {}
Yumad.empower = 0
Yumad.demon_count = 0

Yumad.minions = {"Wild Imp", "Dreadstalker", "Imp", "Felhunter", "Succubus", "Felguard", "Darkglare", "Doomguard", "Infernal", "Voidwalker"}

function Yumad.update_demons()
  --print('Yumad.update_demons')
  for key,value in pairs(Yumad.active_demons) do
    if (Yumad.is_demon_dead(Yumad.active_demons[key].name, Yumad.active_demons[key].time)) then
      Yumad.active_demons[key] = nil
      Yumad.demon_count = Yumad.demon_count - 1
    end
  end
end

function Yumad.is_demon_empowered(guid)
  --print('Yumad.is_demon_empowered')
  if (Yumad.active_demons[guid].empower_time ~= 0 and GetTime() - Yumad.active_demons[guid].empower_time <= 12) then
    return true
  end
  return false
end

function Yumad.Empower()
  --print('Yumad.Empower')
  if Yumad.demon_count == 0 and UnitExists("pet") then
    Yumad.empower = NeP.DSL:Get('buff.duration')('pet','Demonic Empowerment')
    return Yumad.empower
  end
  if Yumad.demon_count > 0 then
    for _,v in pairs(Yumad.active_demons) do
      if Yumad.is_demon_empowered(v.guid) then
        emp1 = Yumad.get_remaining_time('Empower', v.empower_time)
        emp2 = NeP.DSL:Get('buff.duration')('pet','Demonic Empowerment')
        if emp1 < emp2 then
          Yumad.empower = emp1
        else
          Yumad.empower = emp2
        end
      else
        Yumad.empower = 0
      end
    end
  end
  return Yumad.empower
end

function Yumad.is_demon_dead(name, spawn)
  --print('Yumad.is_demon_dead')
  if (Yumad.get_remaining_time(name, spawn) <= 0) then
    return true
  end
  return false
end

function Yumad.get_remaining_time(name, spawn)
  --print('Yumad.get_remaining_time')
  if name == 'Empower' then
    return 12 - (GetTime() - spawn)
  else
    return Yumad.durations[name] - (GetTime() - spawn)
  end
end

function Yumad.IsMinion(name)
  --print('Yumad.IsMinion')
  for i = 1, #Yumad.minions do
    if (name == Yumad.minions[i]) then
	--print(name)
      return true
    end
  end
  return false
end

NeP.Listener:Add('Yumad_Warlock_Pets', 'COMBAT_LOG_EVENT_UNFILTERED', function(timestamp, combatevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool, amount, ...)
  if select(3,UnitClass("player")) == 9 then
    if (combatevent == "SPELL_SUMMON" and sourceName == UnitName("player")) then
      if (Yumad.IsMinion(destName)) then
        Yumad.active_demons[destGUID]              = {}
        Yumad.active_demons[destGUID].guid         = destGUID
        Yumad.active_demons[destGUID].name         = destName
        Yumad.active_demons[destGUID].time         = GetTime()
        Yumad.active_demons[destGUID].empower_time = 0
        Yumad.active_demons[destGUID].duration     = Yumad.durations[destName]
        Yumad.demon_count                          = Yumad.demon_count + 1
      end
    end

    if ((combatevent == "SPELL_AURA_APPLIED" or combatevent == "SPELL_AURA_REFRESH") and spellID == 193396 and sourceName == UnitName("player")) then
      --print('Demonic Empowerment')
      if(Yumad.IsMinion(destName)) then
        Yumad.active_demons[destGUID].empower_time = GetTime()
      end
    end

    Yumad.update_demons()
    return true
  end
end)
