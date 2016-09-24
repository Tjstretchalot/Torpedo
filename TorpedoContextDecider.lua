--[[
  The goal of this library is to see if a context meets a set of 
  criteria. 
]]
local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local OptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
local TimestampTristate = LibStub:GetLibrary('TorpedoTimestampTristate-1.0')

local MAJOR, MINOR = 'TorpedoContextDecider-1.0', 1
local TorpedoContextDecider = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoContextDecider then return end

TorpedoContextDecider.FAIL_REASON = {
  -- Simple comparison checks; these return no additional information
  DISABLED = 'Not enabled.', 
  STEALTH_REQUIRED = 'Stealth required but not stealthed.',
  NOT_STEALTHED_REQUIRED = 'Not stealth required but stealthed.',
  COMBAT_REQUIRED = 'Combat required but not in combat.',
  NO_COMBAT_REQUIRED = 'Not in combat required but in combat.',
  
  -- Min/max checks; these return something like:
  -- return false, FAIL_REASON.MIN_FAILED, 'ComboPoints'
  MIN_FAILED = 'Expected value was below minimum value.',
  MAX_FAILED = 'Expected value was above maximum value.'
}

function TorpedoContextDecider:MeetsReqs_Enabled(requirements, context, optCompareContext)
  return requirements.enabled
end

function TorpedoContextDecider:MeetsReqs_StealthRequired(requirements, context, optCompareContext)
  if not requirements.require_stealthed then return true end
  
  if context == nil then return false end
  return context.stealthy
end

function TorpedoContextDecider:MeetsReqs_NoStealthRequired(requirements, context, optCompareContext)
  if not requirements.require_not_stealthed then return true end
  
  if context == nil then return false end
  return context.stealthy == false
end

function TorpedoContextDecider:MeetsReqs_CombatRequired(requirements, context, optCompareContext)
  if not requirements.require_combat then return true end
  
  if context == nil then return false end
  return context.combat
end

function TorpedoContextDecider:MeetsReqs_NoCombatRequired(requirements, context, optCompareContext)
  if not requirements.require_no_combat then return true end
  
  if context == nil then return false end
  return context.combat == false 
end

function TorpedoContextDecider:MeetsReqs_MinCheck(name, val, requirements, context, optCompareContext) 
  if not requirements['check' .. name] then return true end
  if not requirements['hasMin' .. name] then return true end
  
  if not val then return false end -- No value always fails checks
  if context == nil then return false end
  
  local _min = requirements['min' .. name]
  return val >= _min
end

function TorpedoContextDecider:MeetsReqs_MaxCheck(name, val, requirements, context, optCompareContext) 
  if not requirements['check' .. name] then return true end
  if not requirements['hasMax' .. name] then return true end
  
  if not val then return false end -- No value always fails checks
  if context == nil then return false end
  
  local _max = requirements['max' .. name]
  return val <= _max
end

--[[
  Checks if the requirements are met in the specified context. See 
  TorpedoSuggestions for valid requirements. Uses recursion on some 
  requirements, which requires a comparison context.
]]
function TorpedoContextDecider:Decide(requirements, context, optCompareContext)
  if not self:MeetsReqs_Enabled(requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.DISABLED
  end
  if not self:MeetsReqs_StealthRequired(requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.STEALTH_REQUIRED
  end
  if not self:MeetsReqs_NoStealthRequired(requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.NOT_STEALTHED_REQUIRED
  end
  if not self:MeetsReqs_CombatRequired(requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.COMBAT_REQUIRED
  end
  if not self:MeetsReqs_NoCombatRequired(requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.NO_COMBAT_REQUIRED
  end
  
  local combo_points = nil
  if context ~= nil then 
    combo_points = context.combo_points
  end
  if not self:MeetsReqs_MinCheck('ComboPoints', combo_points, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MIN_FAILED, 'ComboPoints', combo_points
  end
  if not self:MeetsReqs_MaxCheck('ComboPoints', combo_points, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MAX_FAILED, 'ComboPoints', combo_points
  end
  
  local power = nil
  if context ~= nil then 
    power = context.power
  end
  if not self:MeetsReqs_MinCheck('Energy', power, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MIN_FAILED, 'Energy', power
  end
  if not self:MeetsReqs_MaxCheck('Energy', power, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MAX_FAILED, 'Energy', power
  end
  
  local healthPerc = nil
  if context ~= nil then 
    healthPerc = (context.health / context.max_health) * 100
  end
  if not self:MeetsReqs_MinCheck('HealthPerc', healthPerc, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MIN_FAILED, 'HealthPerc', healthPerc
  end
  if not self:MeetsReqs_MaxCheck('HealthPerc', healthPerc, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MAX_FAILED, 'HealthPerc', healthPerc
  end
  
  local time_to_kill_solo = nil
  if context ~= nil then 
    time_to_kill_solo = context.fight_summary.predicted_time_to_kill_target_solo
  end
  if not self:MeetsReqs_MinCheck('TimeToKillSolo', time_to_kill_solo, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MIN_FAILED, 'TimeToKillSolo', time_to_kill_solo
  end
  if not self:MeetsReqs_MaxCheck('TimeToKillSolo', time_to_kill_solo, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MAX_FAILED, 'TimeToKillSolo', time_to_kill_solo
  end
  
  local time_to_kill_raid = nil
  if context ~= nil then
    time_to_kill_raid = context.fight_summary.predicted_time_to_kill_target_raid
  end
  if not self:MeetsReqs_MinCheck('TimeToKillRaid', time_to_kill_raid, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MIN_FAILED, 'TimeToKillRaid', time_to_kill_raid
  end
  if not self:MeetsReqs_MaxCheck('TimeToKillRaid', time_to_kill_raid, requirements, context, optCompareContext) then 
    return false, self.FAIL_REASON.MAX_FAILED, 'TimeToKillRaid', time_to_kill_raid
  end
  
  for i=1, #requirements.auras do 
    local aura = requirements.auras[i]
    
    local nm = 'DurationOf' .. aura.debugName
    local timeRem = nil 
    if context ~= nil then 
      timeRem = aura:TimeRemaining(context)
    end
    if not self:MeetsReqs_MinCheck(nm, timeRem, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MIN_FAILED, nm, timeRem
    end
    if not self:MeetsReqs_MaxCheck(nm, timeRem, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MAX_FAILED, nm, timeRem
    end
  end
  
  for i=1, #requirements.cooldowns do 
    local currentContext = optCompareContext or context
    local cooldown = requirements.cooldowns[i]
    
    local nm = 'CooldownFor' .. cooldown.debugName
    local timeRem = nil
    if context ~= nil then
      timeRem = cooldown:TimeRemaining(context)
    end
    if not self:MeetsReqs_MinCheck(nm, timeRem, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MIN_FAILED, nm, timeRem
    end
    if not self:MeetsReqs_MaxCheck(nm, timeRem, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MAX_FAILED, nm, timeRem
    end
    
    nm = 'ChargesFor' .. cooldown.debugName
    local charges = nil
    if context ~= nil then 
      charges = cooldown:NumberOfCharges(context)
    end
    if not self:MeetsReqs_MinCheck(nm, charges, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MIN_FAILED, nm, charges
    end
    if not self:MeetsReqs_MaxCheck(nm, charges, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MAX_FAILED, nm, charges
    end
    
    -- Timestamp comparisons are special
    
    local capturedContext = nil
    if currentContext ~= nil then 
      for i=1, #currentContext.fight_summary.cached_spell_contexts do 
        local csc = currentContext.fight_summary.cached_spell_contexts[i]
        if csc.spellId == cooldown.spell_id and csc.context.target_info.guid == currentContext.target_info.guid then 
          capturedContext = csc.context
          break
        end
      end
    end
    
    local checkVal = requirements['checkTimestampComparedTo' .. cooldown.debugName]
    if checkVal == TimestampTristate.USED_BEFORE.debug_value then 
      -- check that the spell was used before another spell
      -- the spell was used in the "context" variable, the context to compare to is the 
      -- captured context for "cooldown" which is "capturedContext"
      
      -- If capturedContext is nil, then "cooldown" hasn't been cast yet, so it must 
      -- not have happened first
      
      if not capturedContext then
        return false, self.FAIL_REASON.MIN_FAILED, 'checkTimestampComparedTo' .. cooldown.debugName, 'captured context nil'
      end
      
      -- It's possible we haven't happened yet, in which our timestamp is nil. We will simply set it to 0
      -- in that case
      local theTimestampThatShouldHappenFirst = context.timestamp or 0
      local theTimestampThatShouldHappenSecond = capturedContext.timestamp
      if theTimestampThatShouldHappenFirst > theTimestampThatShouldHappenSecond then 
        return false, self.FAIL_REASON.MIN_FAILED, 'checkTimestampComparedTo' .. cooldown.debugName, theTimestampThatShouldHappenFirst .. ' vs ' .. theTimestampThatShouldHappenSecond
      end
    elseif checkVal == TimestampTristate.USED_AFTER.debug_value then 
      -- opposite of above
      if not capturedContext then 
        return false, self.FAIL_REASON.MAX_FAILED, 'checkTimestampComparedTo' .. cooldown.debugName, 'captured context nil'
      end
      
      local theTimestampThatShouldHappenFirst = capturedContext.timestamp
      local theTimestampThatShouldHappenSecond = context.timestamp or 0
      if theTimestampThatShouldHappenFirst > theTimestampThatShouldHappenSecond then 
        return false, self.FAIL_REASON.MAX_FAILED, 'checkTimestampComparedTo' .. cooldown.debugName, theTimestampThatShouldHappenFirst .. ' vs ' .. theTimestampThatShouldHappenSecond
      end
    end
    
    -- Compare for how long ago we did it
    
    local timeSinceThisCooldownCast = math.huge
    if currentContext ~= nil and capturedContext ~= nil then 
      timeSinceThisCooldownCast = currentContext.timestamp - capturedContext.timestamp
    end
    local nm = 'TimeSinceCastFor' .. cooldown.debugName
    if not self:MeetsReqs_MinCheck(nm, timeSinceThisCooldownCast, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MIN_FAILED, nm, timeSinceThisCooldownCast
    end
    if not self:MeetsReqs_MaxCheck(nm, timeSinceThisCooldownCast, requirements, context, optCompareContext) then 
      return false, self.FAIL_REASON.MAX_FAILED, nm, timeSinceThisCooldownCast
    end
  end
  
  
  if requirements.cache_spells ~= nil then 
    for i=1, #requirements.cache_spells do 
      local compContext = optCompareContext or context -- Either compare to what we're comparing to, or compare to us
      
      local cacheSpellInfo = requirements.cache_spells[i]
      local cache_context = nil
      if context ~= nil then 
        for j=1, #context.fight_summary.cached_spell_contexts do 
          local csc = context.fight_summary.cached_spell_contexts[j]
          if csc.spellId == cacheSpellInfo.spell.spell_id and csc.context.target_info.guid == compContext.target_info.guid then 
            cache_context = csc.context
            break
          end
        end
      end
      
      -- if cache_context is nil then the spell was not cast. This isn't particularly
      -- unusual and is why there are so many nil checks above
      cache_context = cache_context
      local results = {self:Decide(cacheSpellInfo, cache_context, compContext)}
      if not results[1] and results[2] ~= self.FAIL_REASON.DISABLED then
        return unpack(results)
      end
    end
  end
  
  return true
end