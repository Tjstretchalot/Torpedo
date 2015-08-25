AIDecision_Torpedo = {}

AIDecision_NOT_IMPLEMENTED_Torpedo = 0
AIDecision_YES_Torpedo = 1
AIDecision_NO_Torpedo = 2
AIDecision_FINAL_Torpedo = 3

local function dump_Torpedo(thing, indent) 
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
				dump_Torpedo(v)
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
	return decision
end


AI_Torpedo = {}

function AI_Torpedo.create()
	local ai = {}
	setmetatable(ai, AI_Torpedo)
	return ai
end

function AI_Torpedo:performDecision()
	return AIDecision_Torpedo.create(AIDecision_NOT_IMPLEMENTED_Torpedo, nil)
end

--         ============ BASIC BEHAVIORS ============
--[[
	Returns the behavior indicating the ability should be performed
]]
function AI_Final_Torpedo(ability) 
	local result = AI_Torpedo.create()
	result.ability = ability
	result.performDecision = function(self)
		return AIDecision_Torpedo.create(AIDecision_FINAL_Torpedo, self.ability)
	end
	return result
end

--[[
	Goes through each ai in the list, if it does not return 
	decision type AIDecision_YES_Torpedo, then returns decision type
	AIDecision_NO_Torpedo, UNLESS that is the last ai, in which it returns 
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
				return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
			end
		end
		result = self.ais[#self.ais]:performDecision()
		return result
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
			local result = self.ais[i]:performDecision()
			if result.decisionType == AIDecision_FINAL_Torpedo then
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
		if toInvert.decisionType == AIDecision_NO_Torpedo then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		else
			return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
		end
	end
	return result
end

function AI_DebugPrint_Torpedo(msg) 
	local result = AI_Torpedo.create()
	result.performDecision = function(self) 
		print(msg)
		return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
	end
	return result
end	
function AI_Fail_Torpedo()
	local result = AI_Torpedo.create()
	result.ability = ability
	result.performDecision = function(self)
		local asdf = nil
		asdf:hi()
	end
	return result
end
--         =========INTERMEDIATE BEHAVIORS =========
function AI_SpellKnown_Torpedo(ability)
	if not ability then ability:known() end
	local result = AI_Torpedo.create()
	result.ability = ability
	result.performDecision = function(self)
		if self.ability:known() then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_HealthBetween_Torpedo(unit, minHPPerc, maxHPPerc)
	local result = AI_Torpedo.create()
	result.minHPPerc = minHPPerc
	result.maxHPPerc = maxHPPerc
	result.unit = unit
	result.performDecision = function(self) 
		local health = UnitHealth(self.unit)
		local maxHealth = UnitHealthMax(self.unit)
		local percOfMax = (health / maxHealth) * 100.
		
		if percOfMax >= self.minHPPerc and percOfMax <= self.maxHPPerc then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_HealthAbove_Torpedo(unit, minHp) 
	local result = AI_Torpedo.create()
	result.minHp = minHp
	result.unit = unit
	result.performDecision = function(self)
		local health = UnitHealth(self.unit)
		if health >= minHp then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_EnergyBetween_Torpedo(minEnergy, maxEnergy)
	local result = AI_Torpedo.create()
	result.minEnergy = minEnergy
	result.maxEnergy = maxEnergy
	
	result.performDecision = function(self)
		local powa = UnitPower('player')
		
		if powa >= self.minEnergy and powa <= self.maxEnergy then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_EnergyCapTimeLessThan_Torpedo(timeToCapEnergy)
	local result = AI_Torpedo.create()
	result.timeToCapEnergy = timeToCapEnergy
	
	result.performDecision = function(self)
		local maxPower, power, powerRegen
		maxPower = UnitPowerMax('player')
		power = UnitPower('player')
		outOfCombatRegen, powerRegen = GetPowerRegen()
		local timeToCap = (maxPower - power) / powerRegen
		if timeToCap <= timeToCapEnergy then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_InCombat_Torpedo() 
	local result = AI_Torpedo.create()
	
	result.performDecision = function(self)
		if InCombatLockdown() then 
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_BuffActive_Torpedo(buff) 
	local result = AI_Torpedo.create()
	
	result.buff = buff
	result.performDecision = function(self)
		if self.buff:up() then 
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_BuffTimeRemainingBetween_Torpedo(buff, minTimeRemaining, maxTimeRemaining)
	local result = AI_Torpedo.create()
	
	result.buff = buff
	result.maxTimeRemaining = maxTimeRemaining
	result.minTimeRemaining = minTimeRemaining
	result.performDecision = function(self) 
		local remaining = self.buff:remaining()
		if remaining >= minTimeRemaining and remaining <= maxTimeRemaining then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_BuffStacksBetween_Torpedo(buff, minStacks, maxStacks)
	local result = AI_Torpedo.create()

	result.buff = buff
	result.minStacks = minStacks
	result.maxStacks = maxStacks
	result.performDecision = function(self)
		local stacks = self.buff:stacks()
		if stacks >= minStacks and stacks <= maxStacks then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
end	

function AI_ComboPointsBetween_Torpedo(minComboPoints, maxComboPoints)
	local result = AI_Torpedo.create()
	
	result.minComboPoints = minComboPoints
	result.maxComboPoints = maxComboPoints
	result.performDecision = function(self)
		local comboPoints = GetComboPoints('player')
		
		if comboPoints >= minComboPoints and comboPoints <= maxComboPoints then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_IsUsableSpell_Torpedo(ability) 
	local result = AI_Torpedo.create()
	
	result.ability = ability
	result.performDecision = function(self)
		local usable, _ = IsUsableSpell(self.ability.name)
		if usable then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_SpellNotOnCooldown_Torpedo(ability)
	local result = AI_Torpedo.create()
	
	result.ability = ability
	result.performDecision = function(self)
		local _, duration, _ = GetSpellCooldown(ability.name)
		if duration <= 0 then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

--         ============ FINAL BEHAVIORS ============
function AI_Assassination_Main()
	local PREP_TIME_ENERGY = 5
	local UNLIM_ENERGY = 9999
	-- Things that are listed earlier in the top-level repeater recieve precedence --
	return AI_Repeater_Torpedo({
		AI_Philosophizer_Torpedo({
			-- If we don't have deadly poison, we should apply it. (Note this accounts for wound poison) --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Deadly Poison']),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Deadly Poison'])),
			AI_Final_Torpedo(abilities_Torpedo['Deadly Poison'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we haven't started combat yet, make sure we're stealthed --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
			AI_Invert_Torpedo(AI_InCombat_Torpedo()),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
			AI_Final_Torpedo(abilities_Torpedo['Stealth'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we are stealthed, we should open with mutilate. (Includes Vanish) --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Stealth']),
			AI_Final_Torpedo(abilities_Torpedo['Mutilate'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we applied Shadow Reflection and not Vendetta, apply Vendetta --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vendetta']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Shadow Reflection']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vendetta']),
			AI_Final_Torpedo(abilities_Torpedo['Vendetta'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have just applied vendetta and acquired Enhanced Vendetta (Guarranteed
			-- crit chance on next Mutilate, Dispatch, Envenom), then we should either Envenom
			-- (4-5 combo points) or mutilate, or Dispatch. --
			-- This ensures we are not pooling energy & wastiing enhanced vendetta --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vendetta']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Enhanced Vendetta']),
			AI_Repeater_Torpedo({
				AI_Philosophizer_Torpedo({
					AI_ComboPointsBetween_Torpedo(4, 5),
					AI_Final_Torpedo(abilities_Torpedo['Envenom'])
				}),
				AI_Final_Torpedo(abilities_Torpedo['Mutilate'])
			})
		}),
		AI_Philosophizer_Torpedo({
			-- If rupture has less than 8 seconds remaining, or is not active, and we
			-- have enough energy, and we have 5 combo points, we should apply rupture --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Rupture']),
			AI_EnergyBetween_Torpedo(25 - PREP_TIME_ENERGY, UNLIM_ENERGY),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Rupture'], -1, 8),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_Final_Torpedo(abilities_Torpedo['Rupture'])
		}),
		AI_Philosophizer_Torpedo({
			-- Use Envenom if it will refresh the duration without waste, and we have 5 combo points --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Envenom'], -1, 1.8),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_Final_Torpedo(abilities_Torpedo['Envenom'])
		}),
		AI_Philosophizer_Torpedo({
			-- Use Envenom if we are near energy cap and have 5 combo points, and have 3 or more Anticipation 
			-- stacks, regardless of current duration. This mostly happens when we have some sort of haste buff,
			-- such as Heroism --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_Repeater_Torpedo({ -- Either we don't know anticipation or we have 3-5 stacks of it
				AI_Invert_Torpedo(AI_SpellKnown_Torpedo(abilities_Torpedo['Anticipation'])),
				AI_BuffStacksBetween_Torpedo(buffs_Torpedo['Anticipation'], 3, 5)

			}),
			AI_EnergyCapTimeLessThan_Torpedo(3),
			AI_Final_Torpedo(abilities_Torpedo['Envenom'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we can dispatch and it will not waste a combo point, use dispatch --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Dispatch']),
			AI_IsUsableSpell_Torpedo(abilities_Torpedo['Dispatch']),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_Final_Torpedo(abilities_Torpedo['Dispatch'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have blindside (free dispatch), and we have Envenom up, we should
			-- use dispatch. --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Dispatch']), 
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Blindside']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Envenom']),
			AI_Final_Torpedo(abilities_Torpedo['Dispatch'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have 0-4 combo points and enough energy, we should use mutilate --
			AI_EnergyBetween_Torpedo(55 - PREP_TIME_ENERGY, UNLIM_ENERGY),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_Final_Torpedo(abilities_Torpedo['Mutilate'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we can use dispatch and we're close to energy cap, we should use dispatch --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Dispatch']),
			AI_IsUsableSpell_Torpedo(abilities_Torpedo['Dispatch']),
			AI_EnergyCapTimeLessThan_Torpedo(3),
			AI_Final_Torpedo(abilities_Torpedo['Dispatch'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we can use mutilate and we're close to energy cap, we should use mutilate --
			AI_IsUsableSpell_Torpedo(abilities_Torpedo['Mutilate']),
			AI_EnergyCapTimeLessThan_Torpedo(3),
			AI_Final_Torpedo(abilities_Torpedo['Mutilate'])
		})
		-- Otherwise, pool energy --
	})
end

function AI_Assassination_CDs()
	local PREP_TIME_ENERGY = 0
	local UNLIM_ENERGY = 9999
	local UNLIM_TIME = 9999
	return AI_Repeater_Torpedo({
		-- Survival Abilities --
		AI_Philosophizer_Torpedo({
			-- If we are below 50% health, and evasion is off cooldown & not active, suggest evasion.
			-- If you are wondering when it wouldn't be on cooldown and is active, consider Preperation --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Evasion']),
			AI_InCombat_Torpedo(),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Evasion']),
			AI_HealthBetween_Torpedo('player', 0, 50),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Evasion'])),
			AI_Final_Torpedo(abilities_Torpedo['Evasion'])
		}),
		AI_Philosophizer_Torpedo({
			-- If combat readiness is not on cooldown, and if evasion is not active and we
			-- are below 50% health, suggest combat readiness --
			-- Note that combat readiness stacks negatively with evasion, hence all this effort --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Combat Readiness']),
			AI_InCombat_Torpedo(),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Combat Readiness']),
			AI_HealthBetween_Torpedo('player', 0, 50),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Evasion'])),
			AI_Final_Torpedo(abilities_Torpedo['Combat Readiness'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we are below 50% health, we have the energy, and Feint is not active, then suggest
			-- Feint --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Feint']),
			AI_InCombat_Torpedo(),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Feint']),
			AI_EnergyBetween_Torpedo(20 - PREP_TIME_ENERGY, UNLIM_ENERGY),
			AI_HealthBetween_Torpedo('player', 0, 50),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Feint'])),
			AI_Final_Torpedo(abilities_Torpedo['Feint'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we are below 50% health, we have the energy, we have 3-5 combo points, and we don't
			-- have recuperate active, suggest recuperate --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Recuperate']),
			AI_InCombat_Torpedo(),
			AI_EnergyBetween_Torpedo(30 - PREP_TIME_ENERGY, UNLIM_ENERGY),
			AI_HealthBetween_Torpedo('player', 0, 50),
			AI_ComboPointsBetween_Torpedo(3, 5),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Recuperate'])),
			AI_Final_Torpedo(abilities_Torpedo['Recuperate'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we are below 85% health, we have the energy, we have 5 combo points, we have recuperate
			-- applied and we have less than 10 seconds remaining on it, recommend recuperate --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Recuperate']),
			AI_InCombat_Torpedo(),
			AI_EnergyBetween_Torpedo(30 - PREP_TIME_ENERGY, UNLIM_ENERGY),
			AI_HealthBetween_Torpedo('player', 0, 85),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Recuperate'], 0, 10), -- -1 signals no buff
			AI_Final_Torpedo(abilities_Torpedo['Recuperate'])
		}),
		-- DPS Cooldowns --
		AI_Philosophizer_Torpedo({
			-- If we can vanish, we are in combat, we have envenom for at least 2 more seconds,
			-- we have rupture for at least 4 more seconds, we have enough energy to cast
			-- mutilate while stealthed, and we have 0-3 combo points, recommend vanish. --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Rupture']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
			AI_InCombat_Torpedo(),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Envenom'], 2, UNLIM_TIME),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Rupture'], 4, UNLIM_TIME),
			AI_EnergyBetween_Torpedo(14, UNLIM_ENERGY),
			AI_ComboPointsBetween_Torpedo(0, 3),
			AI_Final_Torpedo(abilities_Torpedo['Vanish'])
		}),
		AI_Philosophizer_Torpedo({
			-- If shadow reflection and vendetta are not on cooldown, we are in combat, we have
			-- either no envenom or less than three seconds left on it, we have no rupture or less
			-- than 10 seconds on it, and we have exactly 5 combo points, then recommend shadow 
			-- reflection --  
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vendetta']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Rupture']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vendetta']),
			AI_InCombat_Torpedo(),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Envenom'], -1, 3),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Rupture'], -1, 10),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_Final_Torpedo(abilities_Torpedo['Shadow Reflection'])
		})
	})
end
