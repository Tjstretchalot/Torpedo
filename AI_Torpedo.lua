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
function AI_Final_Torpedo(ability, dim)
	local result = AI_Torpedo.create()
	result.ability = ability
	result.dimmer = dim
	result.performDecision = function(self)
		self.ability.hints.showDimmer = self.dimmer
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
		result = self.ais[#self.ais]
		if result ~= 'pool' then
			result = result:performDecision()
		end
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

function TimeToCapEnergy_Torpedo() 
	local maxPower, power, powerRegen, outOfCombatRegen
	maxPower = UnitPowerMax('player')
	power = UnitPower('player')
	outOfCombatRegen, powerRegen = GetPowerRegen()
	
	if buffs_Torpedo['Slice and Dice'] and buffs_Torpedo['Slice and Dice']:up() then 
		powerRegen = powerRegen + 4
	end
	
	return (maxPower - power) / powerRegen
end

function AI_EnergyCapTimeLessThan_Torpedo(timeToCapEnergy)
	local result = AI_Torpedo.create()
	result.timeToCapEnergy = timeToCapEnergy
	
	result.performDecision = function(self)
		local timeToCap = TimeToCapEnergy_Torpedo()
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
		local stacks = buff:stacks()
		if stacks >= minStacks and stacks <= maxStacks then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
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
		if duration <= 1 then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_SpellCooldownBetween_Torpedo(ability, mincd, maxcd) 
	local result = AI_Torpedo.create()
	
	result.ability = ability
	result.mincd = mincd
	result.maxcd = maxcd
	result.performDecision = function(self)
		local start, duration, _ = GetSpellCooldown(ability.name)
		local timeLeft = 0
		if duration ~= 0 then
			timeLeft = (start + duration) - GetTime()
		end
		
		if timeLeft >= mincd and timeLeft <= maxcd then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_SpellCooldownEndsBeforeEnergyCaps_Torpedo(ability)
	local result = AI_Torpedo.create()
	
	result.ability = ability
	result.performDecision = function(self)
		local start, duration, _ = GetSpellCooldown(ability.name)
		local timeLeft = 0
		if duration ~= 0 then
			timeLeft = (start + duration) - GetTime()
		end
		
		if timeLeft <= TimeToCapEnergy_Torpedo() then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

function AI_HaveTier18FourSet_Torpedo()
	local result = AI_Torpedo.create()
	
	result.performDecision = function(self)
		if Torpedo_Temp.numberOfTier18Pieces >= 4 then
			return AIDecision_Torpedo.create(AIDecision_YES_Torpedo, nil)
		end
		return AIDecision_Torpedo.create(AIDecision_NO_Torpedo, nil)
	end
	return result
end

--         ============ FINAL BEHAVIORS ============
local PREP_TIME_ENERGY = 0
local PREP_TIME_SECONDS = 2
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
			-- This ensures we are not pooling energy & wasting enhanced vendetta --
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
			-- Use Envenom if it will refresh the duration without waste, we have 5 combo points, and
			-- we have enough energy --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Envenom'], -1, 1.8),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_EnergyBetween_Torpedo(35 - PREP_TIME_ENERGY, UNLIM_ENERGY),
			AI_Final_Torpedo(abilities_Torpedo['Envenom'])
		}),
		AI_Philosophizer_Torpedo({
			-- Use Envenom if we are near energy cap, have 5 combo points, and have 2 or more Anticipation 
			-- stacks, regardless of current duration. This mostly happens when we have some sort of haste buff,
			-- such as Heroism --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_Repeater_Torpedo({ -- Either we don't know anticipation or we have 3-5 stacks of it
				AI_Invert_Torpedo(AI_SpellKnown_Torpedo(abilities_Torpedo['Anticipation'])),
				AI_BuffStacksBetween_Torpedo(buffs_Torpedo['Anticipation'], 2, 5)

			}),
			AI_EnergyCapTimeLessThan_Torpedo(3),
			AI_Final_Torpedo(abilities_Torpedo['Envenom'])
		}),
		AI_Philosophizer_Torpedo({
			-- Use envenom if we are near energy cap, have 5 combo points, have the 4pc tier 18,
			-- and the enemy is below 35% health. --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Envenom']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Dispatch']),
			AI_HaveTier18FourSet_Torpedo(),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_EnergyCapTimeLessThan_Torpedo(5),
			AI_HealthBetween_Torpedo('target', 0, 35),
			AI_Final_Torpedo(abilities_Torpedo['Envenom'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we can dispatch without wasting combo points use dispatch. --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Dispatch']),
			AI_IsUsableSpell_Torpedo(abilities_Torpedo['Dispatch']),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_Final_Torpedo(abilities_Torpedo['Dispatch'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have 0-4 combo points and enough energy, we should use mutilate --
			AI_EnergyBetween_Torpedo(55 - PREP_TIME_ENERGY, UNLIM_ENERGY),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_Final_Torpedo(abilities_Torpedo['Mutilate'])
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
			-- If we can vanish, we are in combat, we have enough energy to cast
			-- mutilate while stealthed, we have less than 60 energy, we have
			-- 0-3 combo points, and we have at least 50 more seconds on the 
			-- shadow reflection/vendetta cooldown, recommend vanish --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
			AI_InCombat_Torpedo(),
			AI_SpellCooldownBetween_Torpedo(abilities_Torpedo['Shadow Reflection'], 50 - PREP_TIME_SECONDS, UNLIM_TIME),
			AI_SpellCooldownBetween_Torpedo(abilities_Torpedo['Vendetta'], 50 - PREP_TIME_SECONDS, UNLIM_TIME),
			AI_EnergyBetween_Torpedo(14 - PREP_TIME_ENERGY, 60),
			AI_ComboPointsBetween_Torpedo(0, 3),
			AI_Final_Torpedo(abilities_Torpedo['Vanish'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we can vanish, we are in combat, we have enough energy to cast 
			-- mutilate while stealthed, we have less than 60 energy, 0-3 combo points, 
			-- and we have shadow reflection/vendetta active, recommend vanish. --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vendetta']),
			AI_InCombat_Torpedo(),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Shadow Reflection'], 2, UNLIM_TIME),
			AI_EnergyBetween_Torpedo(14 - PREP_TIME_ENERGY, 60),
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
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Envenom'], -1, 3 + PREP_TIME_SECONDS), 
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Rupture'], -1, 10 + PREP_TIME_SECONDS),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_Final_Torpedo(abilities_Torpedo['Shadow Reflection'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we are in combat, shadow reflection is active, and
			-- vanish has 50 or more seconds on cooldown, recommend preparation --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vendetta']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Preparation']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_InCombat_Torpedo(),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Shadow Reflection'], 2, UNLIM_TIME),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Preparation']),
			AI_SpellCooldownBetween_Torpedo(abilities_Torpedo['Vanish'], 50, UNLIM_TIME),
			AI_Final_Torpedo(abilities_Torpedo['Preparation'])
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
		-- PREFIGHT -- 
		AI_Philosophizer_Torpedo({
			-- If we do not have poisons applied, apply poisons --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Deadly Poison']),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Deadly Poison'])),
			AI_Final_Torpedo(abilities_Torpedo['Deadly Poison'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we are not in combat, use stealth --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
			AI_Invert_Torpedo(AI_InCombat_Torpedo()),
			AI_Final_Torpedo(abilities_Torpedo['Stealth'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we are in stealth and premeditation is not on cooldown, and we have 3 
			-- or less combo points, suggest premeditation --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Premeditation']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Stealth']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Premeditation']),
			AI_ComboPointsBetween_Torpedo(0, 3),
			AI_Final_Torpedo(abilities_Torpedo['Premeditation'])
		}),
		-- FINISHERS --
		AI_Philosophizer_Torpedo({
			-- If we have 5 combo points and rupture has 8 seconds or less
			-- remaining, use rupture --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Rupture']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Rupture'], -1, 8),
			AI_Final_Torpedo(abilities_Torpedo['Rupture'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have 5 combo points and slice and dice has 10 seconds or less
			-- remaining, use slice and dice --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Slice and Dice']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_BuffTimeRemainingBetween_Torpedo(buffs_Torpedo['Slice and Dice'], -1, 10),
			AI_Final_Torpedo(abilities_Torpedo['Slice and Dice'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have 5 combo points and find weakness, and we don't have
			-- stealth, use eviscerate --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Eviscerate']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_BuffActive_Torpedo(buffs_Torpedo['Find Weakness']),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Stealth'])),
			AI_Final_Torpedo(abilities_Torpedo['Eviscerate'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have 5 combo points and 3 anticipation stacks, and we are
			-- going to cap energy in less than 2 seconds, use eviscerate --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Eviscerate']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_BuffStacksBetween_Torpedo(buffs_Torpedo['Anticipation'], 3, 5),
			AI_EnergyCapTimeLessThan_Torpedo(2),
			AI_Final_Torpedo(abilities_Torpedo['Eviscerate'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have 5 combo points and 3 anticipation stacks, and we have
			-- find weakness, use eviscerate (regardless of stealth) --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Eviscerate']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_BuffActive_Torpedo(buffs_Torpedo['Find Weakness']),
			AI_Final_Torpedo(abilities_Torpedo['Eviscerate'])
		}),
		-- BUILDERS --
		AI_Philosophizer_Torpedo({
			-- If we are in stealth or have subterfuge, use ambush --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Stealth']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Ambush']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Stealth']),
			AI_Final_Torpedo(abilities_Torpedo['Ambush'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we need to build combo points and will cap 
			-- energy in less than 2 seconds, use backstab --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_EnergyCapTimeLessThan_Torpedo(2),
			AI_Final_Torpedo(abilities_Torpedo['Backstab'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we need to build combo points and don't have
			-- slice and dice active, use backstab --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Slice and Dice'])),
			AI_Final_Torpedo(abilities_Torpedo['Backstab'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we need to build combo points and don't have
			-- rupture active, use backstab --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_Invert_Torpedo(AI_BuffActive_Torpedo(buffs_Torpedo['Rupture'])),
			AI_Final_Torpedo(abilities_Torpedo['Backstab'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we need to build combo points and find weakness is
			-- active, use backstab --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
			AI_ComboPointsBetween_Torpedo(0, 4),
			AI_BuffActive_Torpedo(buffs_Torpedo['Find Weakness']),
			AI_Final_Torpedo(abilities_Torpedo['Backstab'])
		}),
		AI_Philosophizer_Torpedo({
			-- If combo points could be put into anticipation and we're
			-- going to cap energy in less than 2 seconds, use backstab --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Backstab']),
			AI_ComboPointsBetween_Torpedo(5, 5),
			AI_BuffStacksBetween_Torpedo(buffs_Torpedo['Anticipation'], 0, 4),
			AI_EnergyCapTimeLessThan_Torpedo(2),
			AI_Final_Torpedo(abilities_Torpedo['Backstab'])
		}),
		'pool'
	})
end

function AI_Subtlety_CDs()
	return AI_Repeater_Torpedo({
		-- Cooldowns -- 
		
		-- Shadow Reflection Combo --
		AI_Philosophizer_Torpedo({
			-- If we have shadow reflection ready, we have vanish ready, we have shadow dance ready, 
			-- and we have 100 or more energy, suggest shadow reflection --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_EnergyBetween_Torpedo(100, UNLIM_ENERGY),
			AI_Final_Torpedo(abilities_Torpedo['Shadow Reflection'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have shadow reflection buff and we have vanish ready, use vanish --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Shadow Reflection']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
			AI_Final_Torpedo(abilities_Torpedo['Vanish'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have shadow reflection buff and we have shadow dance ready, use shadow dance --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_BuffActive_Torpedo(buffs_Torpedo['Shadow Reflection']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_Final_Torpedo(abilities_Torpedo['Shadow Dance'])
		}),
		
		
		-- Shadow Dance Combo (Between Shadow Reflections) --
		AI_Philosophizer_Torpedo({
			-- If we have vanish ready and we have shadow dance ready, and we have 30 or more seconds
			-- on the shadow reflection cooldown, suggest vanish --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_SpellCooldownBetween_Torpedo(abilities_Torpedo['Shadow Reflection'], 30, UNLIM_TIME),
			AI_Final_Torpedo(abilities_Torpedo['Vanish'])
		}),
		AI_Philosophizer_Torpedo({
			-- If we have shadow dance ready, we are in combat, and we are stealthed, suggest shadow
			-- dance --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_InCombat_Torpedo(),
			AI_BuffActive_Torpedo(buffs_Torpedo['Stealth']),
			AI_Final_Torpedo(abilities_Torpedo['Shadow Dance'])
		}),
		
		-- Preparation --
		AI_Philosophizer_Torpedo({
			-- If preparation is ready, shadow reflection has 1 and a half minutes or more left, vanish has
			-- 60 seconds or more left for cd, and shadow dance has 30 seconds or more left for cd, 
			-- suggest preparation --
			AI_SpellKnown_Torpedo(abilities_Torpedo['Preparation']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Reflection']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Vanish']),
			AI_SpellKnown_Torpedo(abilities_Torpedo['Shadow Dance']),
			AI_SpellNotOnCooldown_Torpedo(abilities_Torpedo['Preparation']),
			AI_SpellCooldownBetween_Torpedo(abilities_Torpedo['Shadow Reflection'], 90, UNLIM_TIME),
			AI_SpellCooldownBetween_Torpedo(abilities_Torpedo['Vanish'], 60, UNLIM_TIME),
			AI_SpellCooldownBetween_Torpedo(abilities_Torpedo['Shadow Dance'], 30, UNLIM_TIME),
			AI_Final_Torpedo(abilities_Torpedo['Preparation'])
		})
	})
end