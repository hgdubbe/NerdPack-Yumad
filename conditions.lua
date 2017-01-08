-- Xeer's select conditions.lua

local LAD = LibStub('LibArtifactData-1.0')

--/dump NeP.DSL:Get('artifact.activeid')()
NeP.DSL:Register('artifact.active_id', function ()
    local artifactID = LAD.GetActiveArtifactID(artifactID)
    return LAD.GetActiveArtifactID()
end)

--/dump NeP.DSL:Get('artifact.force_update')()
NeP.DSL:Register('artifact.force_update', function ()
    return LAD.ForceUpdate()
end)

--/dump NeP.DSL:Get('artifact.traits')(NeP.DSL:Get('artifact.activeid'))
NeP.DSL:Register('artifact.traits', function (artifactID)
    local artifactID, data = LAD.GetArtifactTraits(artifactID)
    return LAD.GetArtifactTraits(artifactID)
end)

--/dump NeP.DSL:Get('artifact.trait_info')('player', 'Wake of Ashes')
NeP.DSL:Register('artifact.trait_info', function(_, spell)
    local currentRank = 0
    artifactID = NeP.DSL:Get('artifact.active_id')()
    if not artifactID then
        NeP.DSL:Get('artifact.force_update')()
    end
    local _, traits = NeP.DSL:Get('artifact.traits')(artifactID)
    if traits then
        for _,v in ipairs(traits) do
            if v.name == spell then
                return v.isGold, v.bonusRanks, v.maxRank, v.traitID, v.isStart, v.icon, v.isFinal, v.name, v.currentRank, v.spellID
            end
        end
    end
end)

--/dump NeP.DSL:Get('artifact.enabled')('player', 'Wake of Ashes')
NeP.DSL:Register('artifact.enabled', function(_, spell)
    if select(10,NeP.DSL:Get('artifact.trait_info')(_, spell)) then
        return 1
    else
        return 0
    end
end)

--/dump NeP.DSL:Get('spell_haste')()
NeP.DSL:Register('spell_haste', function()
    local shaste = NeP.DSL:Get('haste')('player')
    return math.floor((100 / ( 100 + shaste )) * 10^3 ) / 10^3
end)

--/dump NeP.DSL:Get('haste')('player')