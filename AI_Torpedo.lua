AIDecision_Torpedo = {}

AIDecision_NOT_IMPLEMENTED_Torpedo = 0
AIDecision_YES_Torpedo = 1
AIDecision_NO_Torpedo = 2
AIDecision_FINAL_Torpedo = 3

function dump_Torpedo(thing, indent) 
	if not indent then indent='' end
	if type(thing) == 'table' then
		local oldIndent = indent
		print(indent..'[')
		indent = indent..' '
		for k, v in pairs(thing) do
			if type(v) ~= 'table' then
				print(indent..k..'='..tostring(v))
			else
				print(indent..k..'=')
				dump_Torpedo(v, indent)
			end
		end
		print(oldIndent..']')
	else
		print(indent..tostring(thing))
	end
end

function AIDecision_Torpedo.create(decisionType, ability)
	local decision = {
		decisionType = decisionType,
		ability = ability
	}
	setmetatable(decision, AIDecision_Torpedo)
  decision.__self = AIDecision_Torpedo
  
	return decision
end


AI_Torpedo = {}

function AI_Torpedo.create()
	local ai = {}
	setmetatable(ai, AI_Torpedo)
  ai.__self = AI_Torpedo
  
	return ai
end

function AI_Torpedo:performDecision()
	return AIDecision_Torpedo.create(AIDecision_NOT_IMPLEMENTED_Torpedo, nil)
end

--         ========= UTILITY FUNCTIONS =========
--[[
  For all primitives, either the primative or a function that returns a primative may be passed in.
  They use this function to resolve those values 
--]]
function ResolveValue_Torpedo(valOrFunc)
  if type(valOrFunc) == 'function' then return valOrFunc() end
  
  return valOrFunc
end

--[[
  If the bool is truthy, returns the ai decision with result type AIDecision_YES_Torpedo,
  otherwise returns the ai decision with result type AIDecision_NO_Torpedo
]]
function BoolToDecision_Torpedo(bool)
  if bool then 
    return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
  end
  
  return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
end

--[[
  Determines the maximum number of combo points and returns it
]]
function MaxComboPoints_Torpedo()
  return UnitPowerMax(PlayerFrame.unit, SPELL_POWER_COMBO_POINTS)
end

function MaxUsableComboPoints_Torpedo()
  if talents_Torpedo['Deeper Stratagem']:selected() then 
    return 6
  else 
    return 5
  end
end
function TimeToCapEnergy_Torpedo() 
	local maxPower, power, powerRegen, outOfCombatRegen
	maxPower = UnitPowerMax('player')
	power = UnitPower('player')
	outOfCombatRegen, powerRegen = GetPowerRegen()
	
	return (maxPower - power) / powerRegen
end

--         ============ BASIC BEHAVIORS ============
--[[
	Returns the behavior indicating the ability should be performed
]]
function AI_Final_Torpedo(ability, dim)
	local result = AI_Torpedo.create()
	result.ability = ability
	result.dimmer = dim
	result.performDecision = function(self)
		self.ability.hints.showDimmer = ResolveValue_Torpedo(self.dimmer)
		return AIDecision_Torpedo.create(AIDecision_FINAL_Torpedo, self.ability)
	end
	return result
end

--[[
  AKA Sequence
	Goes through each ai in the list, if it does not return 
	decision type AIDecision_YES_Torpedo, then returns decision type
	AIDecision_YES_Torpedo, UNLESS that is the last ai, in which it returns 
	whatever that ai returns.
]]
function AI_Philosophizer_Torpedo(ais)
	local result = AI_Torpedo.create()
	result.ais = ais
	result.performDecision = function(self)
		local result = nil
		for i=1, #self.ais-1 do -- This is intended to skip the last one so we can return its result don't remove it
			result = self.ais[i]:performDecision()
			if not result or result.decisionType ~= AIDecision_YES_Torpedo then 
				return BoolToDecision_Torpedo(true)
			end
		end
		result = self.ais[#self.ais]
		if result ~= 'pool' then
			result = result:performDecision()
		end
		return result
	end
	return result
end

--[[ 
  Goes through each ai in the list, if any don't return no, it returns
  that result immediately. If none don't return no, returns no
]]
function AI_Selector_Torpedo(ais)
  local result = AI_Torpedo.create()
  result.ais = ais
  result.performDecision = function(self)
    local result = nil
    for i=1, #self.ais do 
      result = self.ais[i]:performDecision()
      if result == 'pool' then
        return result 
       end
      if result.decisionType ~= AIDecision_NO_Torpedo then 
        return result
      end
    end
    return BoolToDecision_Torpedo(false)
  end
  return result
end

--[[
	Goes through each ai in the list, if it returns decision type
	AIDecision_FINAL_Torpedo, then returns that result, otherwise
	goes onto the next one. Returns nil if none of the ais return
	AIDecision_FINAL_Torpedo type.
]]
function AI_Repeater_Torpedo(ais) 
	if #ais == 0 then ais[1]:performDecision() end -- crash and burn
	local result = AI_Torpedo.create()
	result.ais = ais
	result.performDecision = function(self) 
		for i=1, #self.ais do
			if self.ais[i] == 'pool' then return 'pool' end
			local result = self.ais[i]:performDecision()
			if result == 'pool' or result.decisionType == AIDecision_FINAL_Torpedo then
				return result
			end
		end
		return nil
	end
	return result
end

--[[
	Inverts the decision - NO becomes YES, everything else becomes NO
]]
function AI_Invert_Torpedo(ai) 
	local result = AI_Torpedo.create()
	result.ai = ai
	result.performDecision = function(self) 
		local toInvert = self.ai:performDecision()
    
		return BoolToDecision_Torpedo(toInvert.decisionType == AIDecision_NO_Torpedo)
	end
	return result
end

--[[
  If the ai returns final or pool, returns the ais result. Otherwise, returns no
]]
function AI_FinalOrNo_Torpedo(ai)
  local result = AI_Torpedo.create()
  result.ai = ai
  result.performDecision = function(self)
    local aiRes = self.ai:performDecision()
    if aiRes == 'pool' then return aiRes end
    if aiRes.decisionType == AIDecision_FINAL_Torpedo then 
      return aiRes
    end
    return BoolToDecision_Torpedo(false)
  end
  return result
end

--[[
  Prints the message using print
]]
function AI_DebugPrint_Torpedo(msg) 
	local result = AI_Torpedo.create()
  result.message = msg
	result.performDecision = function(self) 
    local _message = ResolveValue_Torpedo(self.message)
		print(_message)
    
		return BoolToDecision_Torpedo(true)
	end
	return result
end	

--[[
  Throws an error when called
]]
function AI_Fail_Torpedo()
	local result = AI_Torpedo.create()
	result.ability = ability
	result.performDecision = function(self)
		error('AI_Fail_Torpedo')
	end
	return result
end

--[[
  Returns yes when the value is greater than or equal to minIncl,
  otherwise returns no
]]
function AI_ValueGrtOrEqual_Torpedo(value, minIncl)
  local result = AI_Torpedo.create()
  result.value = value
  result.minimumInclusive = minIncl
  
  result.performDecision = function(self)
    local _value = ResolveValue_Torpedo(self.value)
    local _minimumInclusive = ResolveValue_Torpedo(self.minimumInclusive)
    
    return BoolToDecision_Torpedo(_value >= _minimumInclusive)
  end
  return result
end

--[[
  Returns yes when the value is strictly greater than the minExcl, 
  otherwise returns no
]]
function AI_ValueGrt_Torpedo(value, minExcl)
  local result = AI_Torpedo.create()
  result.value = value
  result.minimumExclusive = minExcl
  
  result.performDecision = function(self)
    local _value = ResolveValue_Torpedo(self.value)
    local _minimumExclusive = ResolveValue_Torpedo(self.minimumExclusive)
    
    return BoolToDecision_Torpedo(_value > _minimumExclusive)
  end
  return result
end

--[[
  Returns yes when the first value is equal to the second value,
  otherwise returns no
]]
function AI_ValueEqual_Torpedo(value1, value2)
  local result = AI_Torpedo.create()
  result.value1 = value1
  result.value2 = value2
  
  result.performDecision = function(self)
    local _value1 = ResolveValue_Torpedo(self.value1)
    local _value2 = ResolveValue_Torpedo(self.value2)
    
    return BoolToDecision_Torpedo(_value1 == _value2)
  end
  return result
end

--[[
  Returns yes when the value is less than or equal to maxIncl,
  otherwise returns no
]]
function AI_ValueLtOrEqual_Torpedo(value, maxIncl)
  local result = AI_Torpedo.create()
  result.value = value
  result.maximumInclusive = maxIncl
  
  result.performDecision = function(self)
    local _value = ResolveValue_Torpedo(self.value)
    local _maximumInclusive = ResolveValue_Torpedo(self.maximumInclusive)
    
    return BoolToDecision_Torpedo(_value <= _maximumInclusive)
  end
  return result
end

--[[
  Returns yes if the value is strictly less than maxExcl, 
  otherwise returns no
]]
function AI_ValueLt_Torpedo(value, maxExcl)
  local result = AI_Torpedo.create()
  result.value = value
  result.maximumExclusive = maxExcl
  
  result.performDecision = function(self)
    local _value = ResolveValue_Torpedo(self.value)
    local _maximumExclusive = ResolveValue_Torpedo(self.maximumExclusive)
    
    return BoolToDecision_Torpedo(_value < _maximumExclusive)
  end
  return result
end

--[[
  Returns yes if the value is both greater than or equal
  to the minIncl and less than or equal to the maxIncl,
  otherwise returns no
]]
function AI_ValueBetweenIncl_Torpedo(value, minIncl, maxIncl)
  local result = AI_Torpedo.create()
  result.value = value
  result.minimumInclusive = minIncl
  result.maximumInclusive = maxIncl
  
  result.performDecision = function(self)
    local _value = ResolveValue_Torpedo(self.value)
    local _minimumInclusive = ResolveValue_Torpedo(self.minimumInclusive)
    local _maximumInclusive = ResolveValue_Torpedo(self.maximumInclusive)
    
    return BoolToDecision_Torpedo( (_value >= _minimumInclusive) and (_value <= _maximumInclusive) )
  end
  return result
end

--         ========= INTERMEDIATE BEHAVIORS =========
function AI_SpellKnown_Torpedo(ability)
	if not ability then error('Ability is nil, probably a typo') end
	local result = AI_Torpedo.create()
	result.ability = ability
	result.performDecision = function(self)
		return BoolToDecision_Torpedo(self.ability:known())
	end
	return result
end

function AI_InCombat_Torpedo() 
	local result = AI_Torpedo.create()
	
	result.performDecision = function(self)
		return BoolToDecision_Torpedo(InCombatLockdown())
	end
	return result
end

function AI_BuffActive_Torpedo(buff) 
	local result = AI_Torpedo.create()
	
	result.buff = buff
	result.performDecision = function(self)
		return BoolToDecision_Torpedo(self.buff:up())
	end
	return result
end

function AI_IsUsableSpell_Torpedo(ability) 
	local result = AI_Torpedo.create()
	
	result.ability = ability
	result.performDecision = function(self)
		local usable, _ = IsUsableSpell(self.ability.name)
		return BoolToDecision_Torpedo(usable)
	end
	return result
end

function AI_SpellNotOnCooldown_Torpedo(ability)
	local result = AI_Torpedo.create()
	
	result.ability = ability
	result.performDecision = function(self)
		local _, duration, _ = GetSpellCooldown(self.ability.name)
		if duration <= 1 then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_HaveMaxUsableComboPoints_Torpedo()
  local result = AI_Torpedo.create()
  
  result.performDecision = function() 
    local cmbPoints = GetComboPoints('player', 'target')
    local maxUsableCmbPoints = MaxUsableComboPoints_Torpedo()
    
    return BoolToDecision_Torpedo(cmbPoints >= maxUsableCmbPoints)
  end
  return result
end

function AI_HaveTier18FourSet_Torpedo()
	local result = AI_Torpedo.create()
	result.performDecision = function(self)
		BoolToDecision_Torpedo(Torpedo_Temp.numberOfTier18Pieces >= 4)
	end
	return result
end

function AI_TalentSelected_Torpedo(talent)
  local result = AI_Torpedo.create()
  result.talent = talent
  result.performDecision = function(self)
    return BoolToDecision_Torpedo(self.talent:selected())
  end
  return result
end

--         ============ FINAL BEHAVIORS ============
local PREP_TIME_ENERGY = 0
local PREP_TIME_SECONDS = 1
local UNLIM_ENERGY = 9999
local UNLIM_TIME = 9999


-- ======================================================
-- =                                                    =
-- =                    ASSASSINATION                   =
-- =                                                    =
-- ======================================================

function AI_Assassination_Main()
	-- Things that are listed earlier in the top-level repeater recieve precedence --
	return AI_Repeater_Torpedo({
    -- Pre-fight --
    AI_Philosophizer_Torpedo({
      -- If deadly poison is not applied apply deadly poison --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Deadly Poison']),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Deadly Poison'])),
      AI_Final_Torpedo(abilities_Torpedo['Deadly Poison'])
    }),
    AI_Philosophizer_Torpedo({
      -- If we are not in combat and deadly poison has less than 10 minutes left, 
      -- apply deadly poison --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Deadly Poison']),
      AI_Invert_Torpedo(AI_InCombat_Torpedo()),
      AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Deadly Poison']:remaining() end, 600),
      AI_Final_Torpedo(abilities_Torpedo['Deadly Poison'])
    }),
    AI_Philosophizer_Torpedo({
      -- If we are not in combat and not stealthed, apply stealth --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
      AI_Invert_Torpedo(AI_InCombat_Torpedo()),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_Final_Torpedo(abilities_Torpedo['Stealth'])
    }),
    -- Fight --
    -- Combo finishers --
    AI_Philosophizer_Torpedo({
      -- If we have max combo points and rupture is either off, about to wear off (<7 seconds), or 
      -- has a worse multiplier than we have currently and we won't apply a worse rupture, 
      -- then apply rupture or pool energy to rupture --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Rupture']),
      AI_HaveMaxUsableComboPoints_Torpedo(),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Rupture'])), -- Rupture is not active
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Rupture']:remaining() end, 7), -- Rupture is about to wear off
        AI_ValueGrt_Torpedo(function() return buffs_Torpedo['Rupture']:getCurrentMultiplier() end, function() return buffs_Torpedo['Rupture'].multiplier or 0 end) -- Current rupture is better than previous rupture
      }),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Rupture'])), -- Rupture is not active
        AI_ValueGrtOrEqual_Torpedo(function() return buffs_Torpedo['Rupture']:getCurrentMultiplier() end, function() return buffs_Torpedo['Rupture'].multiplier or 0 end) -- New rupture isn't worse than previous rupture
      }),
      AI_Selector_Torpedo({
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 25 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Rupture'])
      })
    }),
    AI_Philosophizer_Torpedo({
      -- If rupture is off and we have at least 2 combo points and less than 70 energy, use rupture --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Rupture']),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Rupture'])),
      AI_ValueGrtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 2),
      AI_ValueLt_Torpedo(function() return UnitPower('player') end, 70 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Rupture'])
    }),
    AI_Philosophizer_Torpedo({
      -- If we have max combo points and envonem is either off or about to wear off, then 
      -- use Envenom or pool --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
      AI_HaveMaxUsableComboPoints_Torpedo(),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Envenom'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Envenom']:remaining() end, 2)
      }),
      AI_Selector_Torpedo({
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 35 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Envenom'])
      })
    }),
    -- Combo builders --
    AI_Philosophizer_Torpedo({
      -- If garrote is available, either off or about to wear off, and a new garrote isn't worse than the old 
      -- garrote, apply garrote or pool --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Garrote']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Garrote']),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Garrote'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Garrote']:remaining() end, 4)
      }),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Garrote'])),
        AI_ValueGrtOrEqual_Torpedo(function() return buffs_Torpedo['Garrote']:getCurrentMultiplier() end, function() return buffs_Torpedo['Garrote'].multiplier or 0 end)
      }),
      AI_Selector_Torpedo({
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 45 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Garrote'])
      })
    }),
    AI_Philosophizer_Torpedo({
      -- If hemorrhage is either off or about to wear off, apply hemorrhage or pool --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Hemorrhage']),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Hemorrhage'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Hemorrhage']:remaining() end, 6)
      }),
      AI_Selector_Torpedo({
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 30 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Hemorrhage'])
      })
    }),
    AI_Philosophizer_Torpedo({
      -- If we have less than the maximum usable combo points and rupture is off 
      -- or about to wear off, use mutilate or pool --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Rupture']),
      AI_SpellKnown_Torpedo(abilities_Torpedo['Mutilate']),
      AI_Invert_Torpedo(AI_HaveMaxUsableComboPoints_Torpedo()),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Rupture'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Rupture']:remaining() end, 7)
      }),
      AI_Selector_Torpedo({
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 55 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Mutilate'])
      })
    }),
    AI_Philosophizer_Torpedo({ 
      -- If we have less than the maximum usable combo points and we have 
      -- at least 75 energy, use mutilate --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Mutilate']),
      AI_Invert_Torpedo(AI_HaveMaxUsableComboPoints_Torpedo()),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 75 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Mutilate'])
    }),
    'pool'
	})
end

function AI_Assassination_CDs()
	return AI_Repeater_Torpedo({
    AI_Philosophizer_Torpedo({
      -- If we meet vanish's requirements and vendetta is not on cooldown, suggest vendetta --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
      AI_SpellKnown_Torpedo(abilities_Torpedo['Vendetta']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vendetta']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Exsanguinate']),
      AI_HaveMaxUsableComboPoints_Torpedo(),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Rupture'])),
        AI_ValueLt_Torpedo(function() return buffs_Torpedo['Rupture'].multiplier or 0 end, 1.5)
      }),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 25 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Vendetta'])
    }),
    AI_Philosophizer_Torpedo({
      -- If vendetta is on cooldown, vanish is not on cooldown, we're not stealthed, rupture has less than 12 seconds left, 
      -- rupture multiplier is less than 1.5, and we have at least 25 energy, suggest vanish --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
      AI_Invert_Torpedo(AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vendetta'])),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Exsanguinate']),
      AI_HaveMaxUsableComboPoints_Torpedo(),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_Selector_Torpedo({
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Rupture'])),
        AI_ValueLt_Torpedo(function() return buffs_Torpedo['Rupture'].multiplier or 0 end, 1.5)
      }),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 25 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Vanish'])
    }),
    AI_Philosophizer_Torpedo({
      -- If Exsanguinate is available and the target has rupture for at least another 24 seconds, 
      -- suggest exsanguinate, unless vanish is going to be ready in the next 3 seconds --
      AI_TalentSelected_Torpedo(talents_Torpedo['Exsanguinate']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Exsanguinate']),
      AI_ValueGrtOrEqual_Torpedo(function() return buffs_Torpedo['Rupture']:remaining() end, 24 - PREP_TIME_SECONDS),
      AI_Invert_Torpedo(AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish'])),
      AI_ValueGrt_Torpedo(function() return abilities_Torpedo['Vanish']:cooldown() end, 5 + PREP_TIME_SECONDS),
      AI_Final_Torpedo(abilities_Torpedo['Exsanguinate'])
    })
	})
end

-- ======================================================
-- =                                                    =
-- =                      SUBTLETY                      =
-- =                                                    =
-- ======================================================

function AI_Subtlety_Main()
	return AI_Repeater_Torpedo({
		-- Pre-fight -- 
		AI_Philosophizer_Torpedo({
			-- If we are not in combat, use stealth --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
			AI_Invert_Torpedo(AI_InCombat_Torpedo()),
			AI_Final_Torpedo(abilities_Torpedo['Stealth'])
		}),
    -- We have active buffs and should make use of them --
    AI_Philosophizer_Torpedo({
      -- If we are in stealth and symbols of death has less than 7 seconds left then
      --   If we have less than 35 energy, pool energy
      --   Otherwise, use symbols of death
      AI_SpellKnown_Torpedo(abilities_Torpedo['Symbols of Death']),
      AI_BuffActive_Torpedo(buffs_Torpedo['Stealth']),
      AI_Selector_Torpedo({
        -- Either symbols of death is not active, or it has less than 7 seconds left -- 
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Symbols of Death'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Symbols of Death']:remaining() end, 7 + PREP_TIME_SECONDS)
      }),
      AI_Selector_Torpedo({
        -- Either pool energy if less than 35 energy, otherwise use symbols of death --
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 35 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Symbols of Death'])
      })
    }),
    -- Finishers --
    AI_Philosophizer_Torpedo({
      -- If we have at least 3 combo points and Nightblade is not active then 
      --   If we have less than 25 energy, pool energy
      --   Otherwise, use Nightblade
      AI_SpellKnown_Torpedo(abilities_Torpedo['Nightblade']),
      AI_ValueGrtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 3),
      AI_Selector_Torpedo({
        -- Nightblade is not active -- 
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Nightblade'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Nightblade']:remaining() end, PREP_TIME_SECONDS)
      }),
      AI_Selector_Torpedo({
        -- Either pool energy if less than 25 energy, otherwise use symbols of death --
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 25 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Nightblade'])
      })
    }),
    AI_Philosophizer_Torpedo({
      -- If we have the maximum usable combo points, and Nightblade will wear off within
      -- the next 4 seconds, then
      --   If we have less than 25 energy, pool energy
      --   Otherwise, use Nightblade
      AI_SpellKnown_Torpedo(abilities_Torpedo['Nightblade']),
      AI_HaveMaxUsableComboPoints_Torpedo(),
      AI_Selector_Torpedo({
        -- Nightblade is not active or less than 4 seconds remaining -- 
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Nightblade'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Nightblade']:remaining() end, 4 + PREP_TIME_SECONDS)
      }),
      AI_Selector_Torpedo({
        -- Either pool energy if less than 25 energy, otherwise use symbols of death --
        AI_FinalOrNo_Torpedo(AI_Philosophizer_Torpedo({
          AI_ValueLt_Torpedo(function() return UnitPower('player') end, 25 - PREP_TIME_ENERGY),
          'pool'
        })),
        AI_Final_Torpedo(abilities_Torpedo['Nightblade'])
      })
    }),
    AI_Philosophizer_Torpedo({
      -- If we have no more than 1 less than the maximum usable combo points and less than 60 energy,
      -- and nightblade has 4 or less seconds remaining but is active, pool energy --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Nightblade']),
      AI_ValueGrtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, function() return MaxUsableComboPoints_Torpedo() - 1 end),
      AI_ValueLtOrEqual_Torpedo(function() return UnitPower('player') end, 60 - PREP_TIME_ENERGY),
      AI_BuffActive_Torpedo(buffs_Torpedo['Nightblade']),
      AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Nightblade']:remaining() end, 4),
      'pool'
    }),
    AI_Philosophizer_Torpedo({
      -- If we have the maximum usable combo points and at least 35 energy, use Eviscerate --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Eviscerate']),
      AI_HaveMaxUsableComboPoints_Torpedo(),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 35 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Eviscerate'])
    }),
    -- Combo builders --
    AI_Philosophizer_Torpedo({
      -- If we have less than the maximum usable combo points, we are stealthed, and we have at least 40 energy, cast 
      -- shadowstrike
      AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
      AI_SpellKnown_Torpedo(abilities_Torpedo['Shadowstrike']),
      AI_Invert_Torpedo(AI_HaveMaxUsableComboPoints_Torpedo()),
      AI_BuffActive_Torpedo(buffs_Torpedo['Stealth']),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 40 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Shadowstrike'])
    }),
    AI_Philosophizer_Torpedo({
      -- If we have less than the maximum usable combo points, we are not stealthed, and we have at least 35 energy, 
      -- and Nightblade as less than 3 + (number of missing combo points) seconds left, cast Backstab
      AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
      AI_Invert_Torpedo(AI_HaveMaxUsableComboPoints_Torpedo()),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 35 - PREP_TIME_ENERGY),
      AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Nightblade']:remaining() end, function()
        local missingComboPoints = MaxUsableComboPoints_Torpedo() - GetComboPoints('player', 'target')
        
        return 3 + missingComboPoints
      end),
      AI_Final_Torpedo(abilities_Torpedo['Backstab'])
    }),
    AI_Philosophizer_Torpedo({
      -- If we have less than the maximum usable combo points, we are not stealthed, and we have at least 100 energy, cast 
      -- backstab --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
      AI_Invert_Torpedo(AI_HaveMaxUsableComboPoints_Torpedo()),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 100 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Backstab'])
    }),
    AI_Philosophizer_Torpedo({
      -- If we have less than the maximum usable combo points, we are not stealthed, we have at least 35 energy, and Shadow Blades
      -- is active, cast Backstab
      AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Blades']),
      AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
      AI_Invert_Torpedo(AI_HaveMaxUsableComboPoints_Torpedo()),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 35 - PREP_TIME_ENERGY),
      AI_BuffActive_Torpedo(buffs_Torpedo['Shadow Blades']),
      AI_Final_Torpedo(abilities_Torpedo['Backstab'])
    }),
    -- Leveling up alternatives --
    AI_Philosophizer_Torpedo({
      -- If we do not know shadowstrike, we are stealthed, and we have at least 35 energy, cast backstab --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
      AI_Invert_Torpedo(AI_SpellKnown_Torpedo(abilities_Torpedo['Shadowstrike'])),
      AI_BuffActive_Torpedo(buffs_Torpedo['Stealth']),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 35 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Backstab'])
    }),
    -- Pool energy --
		'pool'
	})
end

function AI_Subtlety_CDs()
	return AI_Repeater_Torpedo({
		-- Cooldowns -- 
    AI_Philosophizer_Torpedo({
      -- If shadow blades is not on cooldown, we are not stealthed, we have at least 100 energy, and we have 
      -- 0-1 combo points suggest Shadow Blades --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Blades']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Blades']),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 100 - PREP_TIME_ENERGY),
      AI_ValueLtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 1),
      AI_Final_Torpedo(abilities_Torpedo['Shadow Blades'])
    }),
    AI_Philosophizer_Torpedo({
      -- If shadow blades is not on cooldown, we are not stealthed, we have less than 100 energy, and we have 
      -- 0-1 combo points, suggest pooling energy --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Blades']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Blades']),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueLt_Torpedo(function() return UnitPower('player') end, 100 - PREP_TIME_ENERGY),
      AI_ValueLtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 1),
      'pool'
    }),
    AI_Philosophizer_Torpedo({
      -- If vanish is not on cooldown, we are not stealthed, shadow blades is not active,
      -- we have at least 100 energy, and we have 0-1 combo points, suggest Vanish --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Shadow Blades'])),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 100 - PREP_TIME_ENERGY),
      AI_ValueLtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 1),
      AI_Final_Torpedo(abilities_Torpedo['Vanish'])
    }),
    AI_Philosophizer_Torpedo({
      -- If vanish is not on cooldown, we are not stealthed, shadow blades is not active,
      -- we have less than 100 energy, and we have 0-1 combo points, suggest pooling energy --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
      AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Shadow Blades'])),
      AI_ValueLt_Torpedo(function() return UnitPower('player') end, 100 - PREP_TIME_ENERGY),
      AI_ValueLtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 1),
      'pool'
    }),
    AI_Philosophizer_Torpedo({
      -- If we are not stealthed, have a shadow dance available and symbols of death is less than or equal to 4 seconds from 
      -- ending, suggest shadow dance --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
      AI_SpellKnown_Torpedo(abilities_Torpedo['Symbols of Death']),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueGrtOrEqual_Torpedo(function() 
        local charges, maxCharges, timeUntilNextCharge = abilities_Torpedo['Shadow Dance']:charges()
        return charges 
      end, 1),
      AI_Selector_Torpedo({
        -- Symbols of death is not active or less than 4 seconds remaining -- 
        AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Symbols of Death'])),
        AI_ValueLtOrEqual_Torpedo(function() return buffs_Torpedo['Symbols of Death']:remaining() end, 4 + PREP_TIME_SECONDS)
      }),
      AI_Final_Torpedo(abilities_Torpedo['Shadow Dance'])
    }),
    AI_Philosophizer_Torpedo({
      -- If shadow dance has at least 2 charges, we are not stealthed, we have 0-1 combo points, and 
      -- we have at least 100 energy, suggest shadow dance --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
      AI_ValueGrtOrEqual_Torpedo(function()
        local charges, maxCharges, timeUntilNextCharge = abilities_Torpedo['Shadow Dance']:charges()
        return charges
      end, 2),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueLtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 1),
      AI_ValueGrtOrEqual_Torpedo(function() return UnitPower('player') end, 100 - PREP_TIME_ENERGY),
      AI_Final_Torpedo(abilities_Torpedo['Shadow Dance'])
    }),
    AI_Philosophizer_Torpedo({
      -- If shadow dance has at least 2 charges, we are not stealthed, we have 0-1 combo points, and we 
      -- have less than 100 energy, suggest pooling energy --
      AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
      AI_ValueGrtOrEqual_Torpedo(function()
        local charges, maxCharges, timeUntilNextCharge = abilities_Torpedo['Shadow Dance']:charges()
        return charges
      end, 2),
      AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
      AI_ValueLtOrEqual_Torpedo(function() return GetComboPoints('player', 'target') end, 1),
      AI_ValueLt_Torpedo(function() return UnitPower('player') end, 100 - PREP_TIME_ENERGY),
      'pool'
    })
	})
end