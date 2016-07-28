--[[
	Torpedo by Tjstretchalot, Huge credit to Jpapertowels and szandos for
	the interface code in Claw, which I used as a strong reference in creating
	this.
]]--

local assass_spells = {
  Stealth = { spell_id = 115191, icon_id = 132320 },
  DeadlyPoison = { spell_id = 2823, icon_id = 132290 },
  Rupture = { spell_id = 1943, icon_id = 132302 },
  Garrote = { spell_id = 703, icon_id = 132297 },
  Mutilate = { spell_id = 1329, icon_id = 132304 },
  Envenom = { spell_id = 32645, icon_id = 132287 },
  Hemorrhage = { spell_id = 16511, icon_id = 136168 },
  Exsanguinate = { spell_id = 200806, talent_id = 22344, icon_id = 538040 },
  Vanish = { spell_id = 1856, icon_id = 132331 },
  Vendetta = { spell_id = 79140, icon_id = 458726 }
}

local subtlety_spells = {
  Stealth = { spell_id = 115191, icon_id = 132320 },
  Backstab = { spell_id = 53, icon_id = 132090 },
  Gloomblade = { spell_id = 200758, icon_id = 1035040 },
  Eviscerate = { spell_id = 196819, icon_id = 132292 },
  Vanish = { spell_id = 1856, icon_id = 132331 },
  ShadowDance = { spell_id = 185313, icon_id = 236279 },
  SymbolsofDeath = { spell_id = 212283, icon_id = 252272 },
  Nightblade = { spell_id = 195452, icon_id = 1373907 },
  Shadowstrike = { spell_id = 185438, icon_id = 1373912 },
  ShadowBlades = { spell_id = 121471, icon_id = 376022 }
}

local auras_cache = { player = {}, target = {} }
local function update_auras_for_unit(unitName) 
	local i=1, auraName, count, duration, expirationTime, unitCaster, spellId
	while true do
		if unitName == 'player' then
			auraName, _, _, count, _, duration, expirationTime, unitCaster, _, _, spellId = UnitBuff(unitName, i)
		else 
			auraName, _, _, count, _, duration, expirationTime, unitCaster, _, _, spellId = UnitDebuff(unitName, i)
		end
		if not spellId then break end
		if not auras_cache[unitName][i] then auras_cache[unitName][i] = {} end
		auras_cache[unitName][i].name = auraName
		auras_cache[unitName][i].count = count
		auras_cache[unitName][i].duration = duration
		auras_cache[unitName][i].expirationTime = expirationTime
		auras_cache[unitName][i].spellId = spellId
		i = i+1
	end
	auras_cache[unitName].len = i-1
end

local Aura = {}
function Aura:new(id, unitName)
  local res = { aura_id = id, unit_name = unitName }
  setmetatable(res, self)
  self.__index = self
  return res
end

function Aura:info()
  for i=1, auras_cache[self.unit_name].len do 
    if auras_cache[self.unit_name][i].spellId == self.aura_id then 
      return auras_cache[self.unit_name][i]
    end
  end
  return nil
end

function Aura:remaining()
  local inf = self:info()
  if not inf then return -1 end
  
	local expTime = inf.expirationTime
	local curTime = GetTime()
	if expTime == 0 then return 0 end
	local timeRemaining = expTime - curTime
			
	if timeRemaining < 0 then return 0 else return timeRemaining end
end

function Aura:up()
  return self:remaining() >= 0
end

local auras = {
  Stealth = Aura:new(1784, 'player'), -- Use stealthy when checking if abilities are usable
  DeadlyPoison = Aura:new(2823, 'player'),
  Envenom = Aura:new(32645, 'player'),
  Hemorrhage = Aura:new(16511, 'target'),
  Rupture = Aura:new(1943, 'target'),
  Garrote = Aura:new(703, 'target'),
  SymbolsofDeath = Aura:new(212283, 'player'),
  Nightblade = Aura:new(195452, 'target'),
  ShadowBlades = Aura:new(121471, 'player'),
  Vendetta = Aura:new(79140, 'target')
}


local pool_energy_sugg = { icon_id = 'Interface\\ICONS\\INV_Drink_15.blp' }

local NIGHTSTALKER_TALENT_ID = 22331
local DEEPER_STRATAGEM_TALENT_ID = 19239

local Torpedo = LibStub('AceAddon-3.0'):NewAddon('Torpedo', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

local PRIORITY_DESC = 'The relative priority of choosing this ability. Abilities with a higher priority are chosen over those with lower priority, if their requirements are met.'
-- validation works questionably at best, so we just use try-sets
local options = {
  name = 'Torpedo',
  handler = Torpedo,
  type = 'group',
  args = {
    assassination = {
      name = 'Assassination',
      type = 'group',
      order = 1,
      args = {
        primaryAbilities = {
          name = 'Primary Suggestions',
          type = 'group',
          order = 1,
          args = {
            deadlyPoison = {
              name = 'Deadly Poison',
              type = 'group',
              order = 1,
              args = {
                deadlyPoisonEnabled = {
                  type = 'toggle',
                  name = 'Suggest deadly poison',
                  desc = 'Toggles if deadly poison will ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.deadlyPoisonEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.deadlyPoisonEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                deadlyPoisonPriority = {
                  type = 'range', 
                  name = 'Priority',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.mainPriorities.deadlyPoison end,
                  set = function(info, val) Torpedo:TrySetMainPriority('assassination', 'deadlyPoison', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.deadlyPoisonEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  width = 'full',
                  step = 1,
                  bigStep = 1
                },
                refreshDeadlyPoisonOOCSeconds = {
                  type = 'range',
                  name = 'Refresh deadly poison time',
                  desc = 'If not in combat and deadly poison has less than this amount of time, in seconds, suggest refreshing deadly poison',
                  get = function(info) return Torpedo.db.profile.assassination.refreshDeadlyPoisonOOCSeconds end,
                  set = function(info, val) Torpedo.db.profile.assassination.refreshDeadlyPoisonOOCSeconds = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.deadlyPoisonEnabled end,
                  bigStep = 15,
                  min = 1,
                  max = 3600, 
                  softMin = 1,
                  softMax = 1800,
                  order = 3,
                  width = 'full'
                }
              }
            },
            stealth = {
              name = 'Stealth',
              type = 'group',
              order = 2,
              args = {
                stealthEnabled = {
                  type = 'toggle',
                  name = 'Suggest stealth',
                  desc = 'Toggles if stealth will ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.stealthEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.stealthEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                stealthPriority = {
                  type = 'range',
                  name = 'Priority',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.mainPriorities.stealth end,
                  set = function(info, val) Torpedo:TrySetMainPriority('assassination', 'stealth', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.stealthEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  width = 'full',
                  step = 1,
                  bigStep = 1
                }
              }
            },
            rupture = {
              name = 'Rupture',
              type = 'group',
              order = 3,
              args = {
                ruptureEnabled = {
                  type = 'toggle',
                  name = 'Suggest rupture',
                  desc = 'Toggles if rupture will ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.ruptureEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.ruptureEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                rupturePriority = {
                  type = 'range',
                  name = 'Priority',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.mainPriorities.rupture end,
                  set = function(info, val) Torpedo:TrySetMainPriority('assassination', 'rupture', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.ruptureEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  step = 1,
                  bigStep = 1
                },
                applyRuptureEarlyWhenLowEnergy = {
                  type = 'toggle',
                  name = 'Apply rupture early when low energy',
                  desc = 'When energy-starved, should we apply rupture with fewer than max usable combo points?',
                  get = function(info) return Torpedo.db.profile.assassination.applyRuptureEarlyWhenLowEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.applyRuptureEarlyWhenLowEnergy = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.ruptureEnabled end,
                  order = 3,
                  width = 'full'
                },
                ruptureLowEnergy = {
                  type = 'range',
                  name = 'Low energy trigger',
                  desc = 'What constitutes low energy for rupturing early?',
                  get = function(info) return Torpedo.db.profile.assassination.ruptureLowEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.ruptureLowEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.ruptureEnabled) or (not Torpedo.db.profile.assassination.applyRuptureEarlyWhenLowEnergy) end,
                  order = 4,
                  width = 'full',
                  min = 25,
                  max = 156,
                  softMin = 25,
                  softMax = 100,
                  bigStep = 5,
                  step = 1
                },
                ruptureMinComboPoints = {
                  type = 'range',
                  name = 'Minimum combo points',
                  desc = 'When rupturing early, what is the absolute minimum number of combo points we need?',
                  get = function(info) return Torpedo.db.profile.assassination.ruptureMinComboPoints end,
                  set = function(info, val) Torpedo.db.profile.assassination.ruptureMinComboPoints = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.ruptureEnabled) or (not Torpedo.db.profile.assassination.applyRuptureEarlyWhenLowEnergy) end,
                  order = 5,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 6,
                  bigStep = 1,
                  step = 1
                },
                ruptureReapplyTime = {
                  type = 'range',
                  name = 'Allowed time remaining for re-applying rupture',
                  desc = 'How much time may still be left on rupture for it to be suggested? Recall that at most 30% will not be cut-off',
                  get = function(info) return Torpedo.db.profile.assassination.ruptureReapplyTime end,
                  set = function(info, val) Torpedo.db.profile.assassination.ruptureReapplyTime = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.ruptureEnabled end,
                  order = 6,
                  width = 'full',
                  min = 1,
                  max = 28,
                  softMin = 2,
                  softMax = 12,
                  bigStep = 1
                },
                poolEnergyWaitingForRupture = {
                  type = 'toggle',
                  name = 'Pool energy for rupture',
                  desc = 'If we have enough combo points and want to re-apply rupture, but don\'t have enough energy, should we pool energy (as opposed to giving lower-priority actions a chance to give a suggestion)?',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyWaitingForRupture end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyWaitingForRupture = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.ruptureEnabled end,
                  order = 7,
                  width = 'full'
                },
                allowRuptureWorsen = {
                  type = 'toggle',
                  name = 'Allow re-apply worse rupture',
                  desc = 'Not all ruptures are made alike - for example, when rupturing from stealth with the Nightstalker talent the rupture is 50% more effective. Should we avoid overwriting a better rupture with a worse one?',
                  get = function(info) return Torpedo.db.profile.assassination.allowRuptureWorsen end,
                  set = function(info, val) Torpedo.db.profile.assassination.allowRuptureWorsen = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.ruptureEnabled end,
                  order = 8,
                  width = 'full'
                },
                cutoffRuptureWhenBetterMultiplier = {
                  type = 'toggle',
                  name = 'Allow cut-off if better rupture',
                  desc = 'Should we waste some of the remaining rupture time if we can apply a better one?',
                  get = function(info) return Torpedo.db.profile.assassination.cutoffRuptureWhenBetterMultiplier end,
                  set = function(info, val) Torpedo.db.profile.assassination.cutoffRuptureWhenBetterMultiplier = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.ruptureEnabled end,
                  order = 9,
                  width = 'full'
                },
                poolEnergyToCutoffRupture = {
                  type = 'toggle',
                  name = 'Pool energy to cut-off rupture',
                  desc = 'If we have enough combo points and we want to cut-off rupture to apply a better one, but don\'t have enough energy, should we pool energy (as opposed to giving lower-priority actions a chance to give a suggestion)?',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyToCutoffRupture end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyToCutoffRupture = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.ruptureEnabled) or (not Torpedo.db.profile.assassination.poolEnergyWaitingForRupture) end,
                  order = 10,
                  width = 'full'
                },
                applyRuptureEarlyWhenExsanguinateReady = {
                  type = 'toggle',
                  name = 'Aggresively rupture if exsanguinate ready',
                  desc = 'Should we ignore everything but having 25 energy and max combo points if exsanguinate is ready? It\'s almost always worth it to miss an envenom rather than miss an exsanguinate',
                  get = function(info) return Torpedo.db.profile.assassination.applyRuptureEarlyWhenExsanguinateReady end,
                  set = function(info, val) Torpedo.db.profile.assassination.applyRuptureEarlyWhenExsanguinateReady = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.ruptureEnabled end,
                  order = 11,
                  width = 'full'
                }
              }
            },
            envenom = {
              name = 'Envenom',
              type = 'group',
              order = 4,
              args = {
                envenomEnabled = {
                  type = 'toggle',
                  name = 'Suggest envenom',
                  desc = 'Toggles if envenom will ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.envenomEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.envenomEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                envenomPriority = {
                  type = 'range',
                  name = 'Priority',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.mainPriorities.envenom end,
                  set = function(info, val) Torpedo:TrySetMainPriority('assassination', 'envenom', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.envenomEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  step = 1,
                  bigStep = 1
                },
                avoidCuttingOffEnvenom = {
                  type = 'toggle',
                  name = 'Avoid cutting off envenom',
                  desc = 'Envenom applies a fairly helpful buff, should we avoid cutting it off?',
                  get = function(info) return Torpedo.db.profile.assassination.avoidCuttingOffEnvenom end,
                  set = function(info, val) Torpedo.db.profile.assassination.avoidCuttingOffEnvenom = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.envenomEnabled end,
                  order = 3,
                  width = 'full'
                },
                envenomReapplyTime = {
                  type = 'range',
                  name = 'Allowed time remaining for re-applying envenom',
                  desc = 'How much time may still be left on rupture for it to be suggested? Recall that at most 30% will not be cut-off',
                  get = function(info) return Torpedo.db.profile.assassination.envenomReapplyTime end,
                  set = function(info, val) Torpedo.db.profile.assassination.envenomReapplyTime = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.envenomEnabled) or (not Torpedo.db.profile.assassination.avoidCuttingOffEnvenom) end,
                  order = 4,
                  width = 'full',
                  min = 1,
                  max = 7,
                  softMin = 1,
                  softMax = 7,
                  step = 0.01,
                  bigStep = 1,
                },
                envenomAtMaxComboPoints = {
                  type = 'toggle',
                  name = 'Use only at max combo points',
                  desc = 'Should envenom only be suggested at maximum combo points? Downside is we will probably need to clip some combo points.',
                  get = function(info) return Torpedo.db.profile.assassination.envenomAtMaxComboPoints end,
                  set = function(info, val) Torpedo.db.profile.assassination.envenomAtMaxComboPoints = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.envenomEnabled end,
                  order = 5,
                  width = 'full'
                },
                envenomMinComboPoints = {
                  type = 'range',
                  name = 'Minimum combo points',
                  desc = 'What is the minimum number of combo points to use envenom?',
                  get = function(info) return Torpedo.db.profile.assassination.envenomMinComboPoints end,
                  set = function(info, val) Torpedo.db.profile.assassination.envenomMinComboPoints = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.envenomEnabled) or Torpedo.db.profile.assassination.envenomAtMaxComboPoints end,
                  order = 6,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 7,
                  step = 1,
                  bigStep = 1
                },
                poolEnergyWaitingForEnvenom = {
                  type = 'toggle',
                  name = 'Pool energy for envenom',
                  desc = 'As opposed to continuing searching for actions when we have enough combo points but not enough energy, or enough combo points and enough energy but using envenom would cutoff the buff',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyWaitingForEnvenom end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyWaitingForEnvenom = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.envenomEnabled end,
                  order = 7,
                  width = 'full'
                },
                maxEnvenomPoolEnergy = {
                  type = 'range',
                  name = 'Maximum energy to pool at',
                  desc = 'If we have enough energy and enough combo points for envenom, what is the maximum amount of energy we will pool before we give up and cut-off any remaining envenom buff duration?',
                  get = function(info) return Torpedo.db.profile.assassination.maxEnvenomPoolEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.maxEnvenomPoolEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.envenomEnabled) or (not Torpedo.db.profile.assassination.poolEnergyWaitingForEnvenom) or (not Torpedo.db.profile.assassination.avoidCuttingOffEnvenom) end,
                  order = 8,
                  width = 'full',
                  min = 1,
                  max = 156,
                  softMin = 35,
                  softMax = 125,
                  step = 1,
                  bigStep = 5
                }
              }
            },
            garrote = {
              name = 'Garrote',
              type = 'group',
              order = 5,
              args = {
                garroteEnabled = {
                  name = 'Suggest garrote',
                  type = 'toggle',
                  desc = 'Toggle if garrote will ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.garroteEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.garroteEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                garrotePriority = {
                  name = 'Priority',
                  type = 'range',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.mainPriorities.garrote end,
                  set = function(info, val) Torpedo:TrySetMainPriority('assassination', 'garrote', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.garroteEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  step = 1,
                  bigStep = 1
                },
                avoidCuttingOffGarrote = {
                  name = 'Avoid cutting-off garrote',
                  type = 'toggle',
                  desc = 'Usually it won\'t matter since the cooldown on garrote is almost it\'s full duration, but should we avoid cutting off garrote?',
                  get = function(info) return Torpedo.db.profile.assassination.avoidCuttingOffGarrote end,
                  set = function(info, val) Torpedo.db.profile.assassination.avoidCuttingOffGarrote = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.garroteEnabled end,
                  order = 3,
                  width = 'full'
                },
                garroteReapplyTime = {
                  name = 'Allowed time remaining for re-applying garrote',
                  type = 'range',
                  desc = 'How much time may still be left on garrote for to to be suggested? Recall that at most 30% will not be cut-off',
                  get = function(info) return Torpedo.db.profile.assassination.garroteReapplyTime end,
                  set = function(info, val) Torpedo.db.profile.assassination.garroteReapplyTime = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.garroteEnabled) or (not Torpedo.db.profile.assassination.avoidCuttingOffGarrote) end,
                  order = 4,
                  width = 'full',
                  min = 1,
                  max = 18,
                  softMin = 1,
                  softMax = 18,
                  step = 0.01,
                  bigStep = 1
                },
                poolEnergyWaitingForGarrote = {
                  name = 'Pool energy for garrote',
                  type = 'toggle',
                  desc = 'Should we pool energy if we want to apply garrote but don\'t have enough energy? (As opposed allowing lower-priority actions a chance to suggest something)',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyWaitingForGarrote end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyWaitingForGarrote = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.garroteEnabled end,
                  order = 5,
                  width = 'full'
                },
                allowGarroteWorsen = {
                  name = 'Allow re-apply worse garrote',
                  type = 'toggle',
                  desc = 'Not all garrotes are made alike - for example, right after exsanguinate garrote is 400% stronger. Should we avoid overwriting a worse garrote with a better one?',
                  get = function(info) return Torpedo.db.profile.assassination.allowGarroteWorsen end,
                  set = function(info, val) Torpedo.db.profile.assassination.allowGarroteWorsen = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.garroteEnabled end,
                  order = 6,
                  width = 'full'
                },
                cutoffGarroteWhenBetterMultiplier = {
                  name = 'Allow cut-off if better garrote',
                  type = 'toggle',
                  desc = 'Should we cut-off some of the remaining time on garrote if we can apply a better one?',
                  get = function(info) return Torpedo.db.profile.assassination.cutoffGarroteWhenBetterMultiplier end,
                  set = function(info, val) Torpedo.db.profile.assassination.cutoffGarroteWhenBetterMultiplier = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.garroteEnabled end,
                  order = 7,
                  width = 'full'
                },
                poolEnergyToCutoffGarrote = {
                  name = 'Pool energy to cut-off garrote',
                  type = 'toggle',
                  desc = 'Should we pool energy when we\'re trying to cut-off garrote for a better multiplier but don\'t have enough energy?',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyToCutoffGarrote end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyToCutoffGarrote = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.garroteEnabled) or (not Torpedo.db.profile.assassination.poolEnergyWaitingForGarrote) end,
                  order = 8,
                  width = 'full'
                }
              }
            },
            hemorrhage = {
              name = 'Hemorrhage',
              type = 'group',
              order = 6,
              args = {
                hemorrhageEnabled = {
                  name = 'Suggest hemorrhage',
                  type = 'toggle',
                  desc = 'Toggle if hemorrhage will ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.hemorrhageEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.hemorrhageEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                hemorrhagePriority = {
                  name = 'Priority',
                  type = 'range',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.mainPriorities.hemorrhage end,
                  set = function(info, val) TrySetMainPriority('assassination', 'hemorrhage', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.hemorrhageEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  step = 1,
                  bigStep = 1
                },
                hemorrhageReapplyTime = {
                  name = 'Allowed time remaining for re-applying hemorrhage',
                  type = 'range',
                  desc = 'How much time may still be left on hemorrhage for it to be suggested? Recall that at most 30% will not be cut-off.',
                  get = function(info) return Torpedo.db.profile.assassination.hemorrhageReapplyTime end,
                  set = function(info, val) Torpedo.db.profile.assassination.hemorrhageReapplyTime = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.hemorrhageEnabled end,
                  order = 3,
                  width = 'full',
                  min = 1,
                  max = 20,
                  softMin = 1,
                  softMax = 20,
                  step = 0.01,
                  bigStep = 1
                },
                poolEnergyWaitingForHemorrhage = {
                  name = 'Pool energy for hemorrhage',
                  type = 'toggle',
                  desc = 'Should we pool energy if we want to apply hemorrhage but don\'t have enough energy? (As opposed allowing lower-priority actions a chance to suggest something)',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyWaitingForHemorrhage end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyWaitingForHemorrhage = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.hemorrhageEnabled end,
                  order = 4,
                  width = 'full'
                }
              }
            },
            mutilate = {
              name = 'Mutilate',
              type = 'group',
              order = 7,
              args = {
                mutilateEnabled = {
                  name = 'Suggest mutilate',
                  type = 'toggle',
                  desc = 'Toggle if mutilate is ever suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.mutilateEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.mutilateEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                mutilatePriority = {
                  name = 'Priority',
                  type = 'range',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.mainPriorities.mutilate end,
                  set = function(info, val) TrySetMainPriority('assassination', 'mutilate', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.mutilateEnabled end ,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  step = 1,
                  bigStep = 1
                },
                poolEnergyWaitingForMutilate = {
                  name = 'Pool energy to mutilate',
                  type = 'toggle',
                  desc = 'Should we pool energy if we want to mutilate but don\'t have enough energy? (As opposed to having nothing show)',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyWaitingForMutilate end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyWaitingForMutilate = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.mutilateEnabled end,
                  order = 3,
                  width = 'full'
                },
                minEnergyToMutilate = {
                  name = 'Energy for non-emergent mutilate',
                  type = 'range',
                  desc = 'How much energy should we pool before we cast a mutilate without having a particularly good way to spend the combo points?',
                  get = function(info) return Torpedo.db.profile.assassination.minEnergyToMutilate end,
                  set = function(info, val) Torpedo.db.profile.assassination.minEnergyToMutilate = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.mutilateEnabled end,
                  order = 4,
                  width = 'full',
                  min = 1,
                  max = 156,
                  softMin = 55,
                  softMax = 100,
                  step = 1,
                  bigStep = 5
                },
                mutilateLenientCPCheck = {
                  name = 'Less than max combo points',
                  type = 'toggle',
                  desc = 'Should we consider mutilating as long as we are below maximum combo points? (As opposed to waiting for hemorrhage/garrote)',
                  get = function(info) return Torpedo.db.profile.assassination.mutilateLenientCPCheck end,
                  set = function(info, val) Torpedo.db.profile.assassination.mutilateLenientCPCheck = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.mutilateEnabled end,
                  order = 5,
                  width = 'full'
                },
                maxCPToMutilate = {
                  name = 'Maximum combo points to mutilate',
                  type = 'range',
                  desc = 'Maximum number of combo points where we should consider mutilating',
                  get = function(info) return Torpedo.db.profile.assassination.maxCPToMutilate end,
                  set = function(info, val) Torpedo.db.profile.assassination.maxCPToMutilate = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.mutilateEnabled) or  Torpedo.db.profile.assassination.mutilateLenientCPCheck end,
                  order = 6,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 6,
                  step = 1,
                  bigStep = 1
                },
                ignoreCPForMutilateEnergy = {
                  name = 'Minimum energy to override CP check',
                  type = 'range',
                  desc = 'To avoid wasting energy, if we have this amount of energy we will ignore combo points when deciding whether to mutilate - this won\'t override our finishers if they are higher priority',
                  get = function(info) return Torpedo.db.profile.assassination.ignoreCPForMutilateEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.ignoreCPForMutilateEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.mutilateEnabled) or (not Torpedo.db.profile.assassination.mutilateLenientCPCheck) end,
                  order = 7,
                  width = 'full',
                  min = 1,
                  max = 156,
                  softMin = 55,
                  softMax = 125,
                  step = 1,
                  bigStep = 5
                },
                dontPoolMutilateWhenRuptureRemainingLessThan = {
                  name = 'Low rupture time',
                  type = 'range',
                  desc = 'What constitutes low remaining rupture time that we should reduce our minimum energy requirements to rupture to minimum?',
                  get = function(info) return Torpedo.db.profile.assassination.dontPoolMutilateWhenRuptureRemainingLessThan end,
                  set = function(info, val) Torpedo.db.profile.assassination.dontPoolMutilateWhenRuptureRemainingLessThan = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.mutilateEnabled end,
                  order = 8,
                  width = 'full',
                  min = 1,
                  max = 28,
                  softMin = 1,
                  softMax = 28,
                  step = 1,
                  bigStep = 1
                },
                mutilateLenientCPCheckIfRuptureLow = {
                  name = 'Less than max combo points if rupture low',
                  type = 'toggle',
                  desc = 'Should we consider mutilating as long as we are below maximum combo points and rupture is about to wear off? (As opposed to waiting for hemorrhage/garrote)',
                  get = function(info) return Torpedo.db.profile.assassination.mutilateLenientCPCheckIfRuptureLow end,
                  set = function(info, val) Torpedo.db.profile.assassination.mutilateLenientCPCheckIfRuptureLow = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.mutilateEnabled end,
                  order = 9,
                  width = 'full'
                },
                maxCPToMutilateIfRuptureLow = {
                  name = 'Maximum combo points to mutilate if rupture low',
                  type = 'range',
                  desc = 'Maximum number of combo points where we should consider mutilating if rupture duration is low',
                  get = function(info) return Torpedo.db.profile.assassination.maxCPToMutilateIfRuptureLow end,
                  set = function(info, val) Torpedo.db.profile.assassination.maxCPToMutilateIfRuptureLow = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.mutilateEnabled) or Torpedo.db.profile.assassination.mutilateLenientCPCheckIfRuptureLow end,
                  order = 10,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 6,
                  step = 1,
                  bigStep = 1
                },
                poolEnergyWaitingForMutilateRuptureLow = {
                  name = 'Pool energy for mutilate when rupture low',
                  type = 'toggle',
                  desc = 'Should we pool energy if we don\'t have enough energy but want to mutilate to refresh rupture? (As opposed to showing nothing)',
                  get = function(info) return Torpedo.db.profile.assassination.poolEnergyWaitingForMutilateRuptureLow end,
                  set = function(info, val) Torpedo.db.profile.assassination.poolEnergyWaitingForMutilateRuptureLow = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.mutilateEnabled) or Torpedo.db.profile.assassination.poolEnergyWaitingForMutilate end,
                  order = 11,
                  width = 'full'
                }
              }
            }
          }
        },
        secondaryAbilities = {
          name = 'Secondary Suggestions',
          type = 'group',
          order = 2,
          args = {
            vendetta = {
              name = 'Vendetta',
              type = 'group',
              order = 1,
              args = {
                vendettaEnabled = {
                  type = 'toggle',
                  name = 'Suggest vendetta',
                  desc = 'Toggles if vendetta will ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                vendettaPriority = {
                  type = 'range', 
                  name = 'Priority',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.cdPriorities.vendetta end,
                  set = function(info, val) Torpedo:TrySetCDPriority('assassination', 'vendetta', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  order = 2, 
                  width = 'full',
                  step = 1,
                  bigStep = 1
                },
                vendettaWaitsForVanish = {
                  type = 'toggle',
                  name = 'Vendetta waits for vanish',
                  desc = 'Should vendetta try to combo with vanish? This allows the improved rupture damage to coincide with the 50% stronger rupture that is applied when rupturing from stealth, if Nightstalker is selected',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaWaitsForVanish end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaWaitsForVanish = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 3,
                  width = 'full'
                },
                vendettaLetsVanishHaveSomeCD = {
                  type = 'toggle',
                  name = 'Vendetta allows vanish some cooldown',
                  desc = 'Is there any wiggle room in the vanish cooldown?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaLetsVanishHaveSomeCD end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaLetsVanishHaveSomeCD = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForVanish) end,
                  order = 4,
                  width = 'full'
                },
                vendettaMaxAllowedVanishCDRemaining = {
                  type = 'range',
                  name = 'Vanish remaining cooldown allowed',
                  desc = 'What is the maximum remaining cooldown on vanish to suggest vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMaxAllowedVanishCDRemaining end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMaxAllowedVanishCDRemaining = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForVanish) or (not Torpedo.db.profile.assassination.vendettaLetsVanishHaveSomeCD) end,
                  order = 5,
                  width = 'full',
                  min = 1,
                  max = 120,
                  softMin = 1,
                  softMax = 120,
                  step = 0.01,
                  bigStep = 1
                },
                vendettaIgnoresVanishCDIfLongWayOff = {
                  type = 'toggle',
                  name = 'Ignore vanish cooldown if long way off',
                  desc = 'If vanish has a long time left on its cooldown and we\'re ready to vanish, should we not wait for it?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaIgnoresVanishCDIfLongWayOff end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaIgnoresVanishCDIfLongWayOff = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForVanish) end,
                  order = 6,
                  width = 'full'
                },
                vendettaVanishMinCdToIgnore = {
                  type = 'range',
                  name = 'Vanish long way off cooldown',
                  desc = 'How many seconds left on vanishs cooldown constitutes a \'long way off\'?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaVanishMinCdToIgnore end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaVanishMinCdToIgnore = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForVanish) or (not Torpedo.db.profile.assassination.vendettaIgnoresVanishCDIfLongWayOff) end,
                  order = 7,
                  width = 'full',
                  min = 1,
                  max = 120,
                  softMin = 1,
                  softMax = 120,
                  step = 0.01,
                  bigStep = 1
                },
                vendettaWaitsForExsanguinate = {
                  type = 'toggle',
                  name = 'Vendetta waits for exsanguinate',
                  desc = 'Should vendetta try to combo with exsanguinate? This allows the improved rupture from vanish to combo with exsanguinate for incredible burst damage.',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaWaitsForExsanguinate end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaWaitsForExsanguinate = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 8,
                  width = 'full'
                },
                vendettaLetsExsanguinateHaveSomeCD = {
                  type = 'toggle',
                  name = 'Vendetta allows exsanguinate some cooldown',
                  desc = 'Is there any wiggle room in the remaining exsanguinate cooldown?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaLetsExsanguinateHaveSomeCD end,
                  set = function(info, val) Torpedo.db.profile.vendettaLetsExsanguinateHaveSomeCD = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForExsanguinate) end,
                  order = 9,
                  width = 'full'
                },
                vendettaMaxAllowedExsanguinateCDRemaining = {
                  type = 'range',
                  name = 'Exsanguinate max cooldown allowed',
                  desc = 'What is the maximum remaining cooldown on exsanguinate to suggest vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMaxAllowedExsanguinateCDRemaining end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMaxAllowedExsanguinateCDRemaining = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForExsanguinate) or (not Torpedo.db.profile.assassination.vendettaLetsExsanguinateHaveSomeCD) end,
                  order = 10,
                  width = 'full',
                  min = 1,
                  max = 45,
                  softMin = 1,
                  softMax = 45,
                  step = 0.01,
                  bigStep = 1
                },
                vendettaIgnoresExsanguinateCDIfLongWayOff = {
                  type = 'toggle',
                  name = 'Ignore exsanguinate cooldown if long way off',
                  desc = 'If exsanguinate has a long time left on its cooldown and we\'re ready to vendetta, should we not wait for it?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaIgnoresExsanguinateCDIfLongWayOff end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaIgnoresExsanguinateCDIfLongWayOff = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForExsanguinate) end,
                  order = 11,
                  width = 'full'
                },
                vendettaExsanguinateMinCdToIgnore = {
                  type = 'range',
                  name = 'Exsanguinate long way off cooldown',
                  desc = 'How many seconds left on exsanguinate constitutes a \'long way off\'?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaExsanguinateMinCdToIgnore end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaExsanguinateMinCdToIgnore = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaWaitsForExsanguinate) or (not Torpedo.db.profile.assassination.vendettaIgnoresExsanguinateCDIfLongWayOff) end,
                  order = 12,
                  width = 'full',
                  min = 1,
                  max = 45,
                  softMin = 1,
                  softMax = 45,
                  step = 0.01,
                  bigStep = 1
                },
                vendettaChecksComboPoints = {
                  type = 'toggle',
                  name = 'Check combo points',
                  desc = 'Should we look at our combo points before suggesting vendetta? Recall it\'s very good to rupture from stealth with the Nightstalker talent',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaChecksComboPoints end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaChecksComboPoints = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 13,
                  width = 'full'
                },
                vendettaRequiresMaxComboPoints = {
                  type = 'toggle',
                  name = 'Use only at max combo points',
                  desc = 'Should we only vendetta at max combo points? (6 if deeper stratagem is selected, 5 otherwise)',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaRequiresMaxComboPoints end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaRequiresMaxComboPoints = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksComboPoints) end,
                  order = 14,
                  width = 'full'
                },
                vendettaHasMinCP = {
                  type = 'toggle',
                  name = 'Have minimum combo points',
                  desc = 'Do we have a minimum number of combo points to suggest vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaHasMinCP end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaHasMinCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksComboPoints) or (Torpedo.db.profile.assassination.vendettaRequiresMaxComboPoints) end,
                  order = 15,
                  width = 'full'
                },
                vendettaMinCP = {
                  type = 'range',
                  name = 'Minimum combo points',
                  desc = 'What is the minimum combo points to suggest vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMinCP end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMinCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksComboPoints) or (Torpedo.db.profile.assassination.vendettaRequiresMaxComboPoints) or (not Torpedo.db.profile.assassination.vendettaHasMinCP) end,
                  order = 16,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 6,
                  step = 1,
                  bigStep = 1
                },
                vendettaHasMaxCP = {
                  type = 'toggle',
                  name = 'Have maximum combo points',
                  desc = 'Do we have a maximum number of combo points to suggest vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaHasMaxCP end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaHasMaxCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksComboPoints) or (Torpedo.db.profile.assassination.vendettaRequiresMaxComboPoints) end,
                  order = 17,
                  width = 'full'
                },
                vendettaMaxCP = {
                  type = 'range',
                  name = 'Maximum combo points',
                  desc = 'What is the maximum number of combo points to suggest vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMaxCP end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMaxCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksComboPoints) or (Torpedo.db.profile.assassination.vendettaRequiresMaxComboPoints) or (not Torpedo.db.profile.assassination.vendettaHasMaxCP) end,
                  order = 18,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 6,
                  step = 1,
                  bigStep = 1
                },
                vendettaChecksStealthyTristate = {
                  type = 'toggle',
                  tristate = true,
                  name = function(info)
                    local curVal = Torpedo.db.profile.assassination.vendettaChecksStealthyTristate 
                    if curVal == nil then 
                      return 'Ensure we are not already stealthy'
                    elseif curVal == true then 
                      return 'Ensure we are stealthy already'
                    else
                      return 'Check stealthiness'
                    end
                  end,
                  desc = 'Should we ignore/ensure/avoid stealthiness, where stealthiness is the ability to use stealth abilities?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaChecksStealthyTristate end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaChecksStealthyTristate = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 19,
                  width = 'full'
                },
                vendettaChecksRuptureDuration = {
                  type = 'toggle',
                  name = 'Check rupture duration',
                  desc = 'Should we check how much time is left on rupture before using vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaChecksRuptureDuration end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaChecksRuptureDuration = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 20,
                  width = 'full'
                },
                vendettaMaxRuptureRemaining = {
                  type = 'range',
                  name = 'Maximum rupture duration remaining',
                  desc = 'What is the maximum time left on rupture to use vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMaxRuptureRemaining end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMaxRuptureRemaining = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksRuptureDuration) end,
                  order = 21,
                  width = 'full',
                  min = 1,
                  max = 28,
                  softMin = 1,
                  softMax = 28,
                  step = 1,
                  bigStep = 1
                },
                vendettaChecksRuptureMultiplier = {
                  type = 'toggle',
                  name = 'Check rupture multiplier',
                  desc = 'Should we check the multiplier on the current rupture if it\'s up? The multiplier would be 1 if we applied out of stealth and didn\'t exsanguinate, 1.5 if we applied from stealth and didn\'t exsanguinate, 5 if applied out of stealth and exsanguinated, and 5.5 if applied from stealth and exsanguinated.',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaChecksRuptureMultiplier end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaChecksRuptureMultiplier = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 22,
                  width = 'full'
                },
                vendettaMaxRuptureMultiplier = {
                  type = 'range',
                  name = 'Maximum rupture multiplier',
                  desc = 'What is the maximum rupture multiplier to suggest vendetta? 1 would mean suggest vendetta if and only if the old rupture wasn\'t buffed at all, 1.5 would mean suggest vendetta if and only if the current rupture isn\'t improved by exsanguinate, 5 would mean suggest vendetta if and only if the current rupture isn\'t a rupture from stealth that was exsanguinated, and 5.5 would effectively mean ignore rupture multiplier',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMaxRuptureMultiplier end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMaxRuptureMultiplier = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksRuptureMultiplier) end,
                  order = 23,
                  width = 'full',
                  min = 1,
                  max = 5.5,
                  softMin = 1,
                  softMax = 5.5,
                  step = 0.01,
                  bigStep = 0.5
                },
                vendettaChecksEnergy = {
                  type = 'toggle',
                  name = 'Check energy',
                  desc = 'Should we check our energy levels before using vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaChecksEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaChecksEnergy = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vendettaEnabled end,
                  order = 24,
                  width = 'full'
                },
                vendettaHasMinEnergy = {
                  type = 'toggle',
                  name = 'Have minimum energy',
                  desc = 'Is there a minimum energy amount for using vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaHasMinEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaHasMinEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksEnergy) end,
                  order = 25,
                  width = 'full'
                },
                vendettaMinEnergy = {
                  type = 'range',
                  name = 'Minimum energy',
                  desc = 'What is the minimum energy amount for using vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMinEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMinEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksEnergy) or (not Torpedo.db.profile.assassination.vendettaHasMinEnergy) end,
                  order = 26,
                  width = 'full',
                  min = 1,
                  max = 156,
                  softMin = 1,
                  softMax = 125,
                  step = 1,
                  bigStep = 5
                },
                vendettaHasMaxEnergy = {
                  type = 'toggle',
                  name = 'Have maximum energy',
                  desc = 'Is there a maximum energy amount for using vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaHasMaxEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaHasMaxEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksEnergy) end,
                  order = 27,
                  width = 'full'
                },
                vendettaMaxEnergy = {
                  type = 'range',
                  name = 'Maximum energy',
                  desc = 'What is the maximum energy amount for using vendetta?',
                  get = function(info) return Torpedo.db.profile.assassination.vendettaMaxEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vendettaMaxEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vendettaEnabled) or (not Torpedo.db.profile.assassination.vendettaChecksEnergy) or (not Torpedo.db.profile.assassination.vendettaHasMaxEnergy) end,
                  order = 28,
                  width = 'full',
                  min = 1,
                  max = 156,
                  softMin = 1,
                  softMax = 125,
                  step = 1,
                  bigStep = 5
                }
              }
            },
            vanish = {
              type = 'group',
              name = 'Vanish',
              order = 2,
              args = {
                vanishEnabled = {
                  name = 'Suggest vanish',
                  type = 'toggle',
                  desc = 'Toggle if vanish should ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.vanishEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                vanishPriority = {
                  type = 'range',
                  name = 'Priority',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.cdPriorities.vanish end,
                  set = function(info, val) TrySetCDPriority('assassination', 'vanish', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  step = 1,
                  bigStep = 1
                },
                vanishRequiresVendettaBuff = {
                  type = 'toggle',
                  name = 'Require vendetta buff',
                  desc = 'Should we only use vanish if vendetta is active?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishRequiresVendettaBuff end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishRequiresVendettaBuff = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 3,
                  width = 'full'
                },
                vanishRequiresVendettaBuffMinDuration = {
                  type = 'toggle',
                  name = 'Require vendetta minimum duration',
                  desc = 'Is there some minimum duration remaining on vendetta to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishRequiresVendettaBuffMinDuration end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishRequiredVendettaBuffMinDuration = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishRequiresVendettaBuff) end,
                  order = 4,
                  width = 'full'
                },
                vanishRequiredVendettaBuffMinDuration = {
                  type = 'range',
                  name = 'Vendetta minimum duration',
                  desc = 'What is the minimum duration remaining on vendetta to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishRequiredVendettaBuffMinDuration end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishRequiredVendettaBuffMinDuration = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishRequiresVendettaBuff) or (not Torpedo.db.profile.assassination.vanishRequiresVendettaBuffMinDuration) end,
                  order = 5,
                  width = 'full',
                  min = 1,
                  max = 20,
                  softMin = 1,
                  softMax = 20,
                  step = 0.01,
                  bigStep = 1
                },
                vanishWaitsForExsanguinate = {
                  type = 'toggle',
                  name = 'Vanish waits for exsanguinate',
                  desc = 'Should vanish wait for exsanguinate? This is especially important if vendetta is waiting on vanish - exsanguinate will get the much-needed energy to burst during vendetta.',
                  get = function(info) return Torpedo.db.profile.assassination.vanishWaitsForExsanguinate end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishWaitsForExsanguinate = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 6,
                  width = 'full'
                },
                vanishLetsExsanguinateHaveSomeCD = {
                  type = 'toggle',
                  name = 'Vanish allows exsanguinate some cooldown',
                  desc = 'Is there any wiggle room in the cooldown for exsanguinate to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishLetsExsanguinateHaveSomeCD end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishLetsExsanguinateHaveSomeCD = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishWaitsForExsanguinate) end,
                  order = 7,
                  width = 'full'
                },
                vanishMaxAllowedExsanguinateCDRemaining = {
                  type = 'range',
                  name = 'Max allowed exsanguinate cooldown',
                  desc = 'What is the maximum exsanguinate cooldown remaining to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMaxAllowedExsanguinateCDRemaining end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMaxAllowedExsanguinateCDRemaining = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishWaitsForExsanguinate) or (not Torpedo.db.profile.assassination.vanishLetsExsanguinateHaveSomeCD) end,
                  order = 8,
                  width = 'full'
                },
                vanishWaitsForVendetta = {
                  type = 'toggle',
                  name = 'Vanish waits for vendetta',
                  desc = 'Should vanish wait for vendetta? Be careful to avoid circular logic with vendetta waiting on vanish if they are intended to overlap.',
                  get = function(info) return Torpedo.db.profile.assassination.vanishWaitsForVendetta end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishWaitsForVendetta = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 9,
                  width = 'full'
                },
                vanishLetsVendettaHaveSomeCD = {
                  type = 'toggle',
                  name = 'Vanish allows vendetta some cooldown',
                  desc = 'Is there any wiggle room in the cooldown for vendetta to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishLetsVendettaHaveSomeCD end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishLetsVendettaHaveSomeCD = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishWaitsForVendetta) end,
                  order = 10,
                  width = 'full'
                },
                vanishMaxAllowedVendettaCDRemaining = {
                  type = 'range',
                  name = 'Max allowed vendetta cooldown',
                  desc = 'What is the maximum vendetta cooldown remaining to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMaxAllowedVendettaCDRemaining end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMaxAllowedVendettaCDRemaining = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishWaitsForVendetta) or (not Torpedo.db.profile.assassination.vanishLetsVendettaHaveSomeCD) end,
                  order = 11,
                  width = 'full',
                  min = 1,
                  max = 120,
                  softMin = 1,
                  softMax = 120,
                  step = 0.01,
                  bigStep = 1
                },
                vanishChecksComboPoints = {
                  type = 'toggle',
                  name = 'Check combo points',
                  desc = 'Should we check our combo points before using vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishChecksComboPoints end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishChecksComboPoints = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 12,
                  width = 'full'
                },
                vanishRequiresMaxComboPoints = {
                  type = 'toggle',
                  name = 'Require max combo points',
                  desc = 'Should we require that we have the maximum usable combo points (6 with deeper stratagem, 5 otherwise) to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishRequiresMaxComboPoints end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishRequiresMaxComboPoints = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksComboPoints) end,
                  order = 13,
                  width = 'full'
                },
                vanishHasMinCP = {
                  type = 'toggle',
                  name = 'Have minimum combo points',
                  desc = 'Is there some minimum number of combo points to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishHasMinCP end,
                  set = function(info) Torpedo.db.profile.assassination.vanishHasMinCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksComboPoints) or Torpedo.db.profile.assassination.vanishRequiresMaxComboPoints end,
                  order = 14,
                  width = 'full'
                },
                vanishMinCP = {
                  type = 'range',
                  name = 'Minimum combo points',
                  desc = 'What is the minimum number of combo points we should have to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMinCP end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMinCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksComboPoints) or Torpedo.db.profile.assassination.vanishRequiresMaxComboPoints or (not Torpedo.db.profile.assassination.vanishHasMinCP) end,
                  order = 15,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 6,
                  step = 1,
                  bigStep = 1
                },
                vanishHasMaxCP = {
                  type = 'toggle',
                  name = 'Have maximum combo points',
                  desc = 'Is there some maximum number of combo points to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishHasMaxCP end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishHasMaxCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksComboPoints) or Torpedo.db.profile.assassination.vanishRequiresMaxComboPoints end,
                  order = 16,
                  width = 'full'
                },
                vanishMaxCP = {
                  type = 'range',
                  name = 'Maximum combo points',
                  desc = 'What is the maximum number of combo points we should have to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMaxCP end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMaxCP = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksComboPoints) or Torpedo.db.profile.assassination.vanishRequiresMaxComboPoints or (not Torpedo.db.profile.assassination.vanishHasMaxCP) end,
                  order = 17,
                  width = 'full',
                  min = 1,
                  max = 6,
                  softMin = 1,
                  softMax = 6,
                  step = 1,
                  bigStep = 1
                },
                vanishChecksStealthyTristate = {
                  type = 'toggle',
                  tristate = true,
                  name = function(info)
                    local curVal = Torpedo.db.profile.assassination.vanishChecksStealthyTristate 
                    if curVal == nil then 
                      return 'Ensure we are not already stealthy'
                    elseif curVal == true then 
                      return 'Ensure we are stealthy already'
                    else
                      return 'Check stealthiness'
                    end
                  end,
                  desc = 'Should we ignore/ensure/avoid stealthiness, where stealthiness is the ability to use stealth abilities?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishChecksStealthyTristate end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishChecksStealthyTristate = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 18,
                  width = 'full'
                },
                vanishChecksRuptureDuration = {
                  type = 'toggle',
                  name = 'Check rupture duration',
                  desc = 'Should we check how much time is left on rupture before using vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishChecksRuptureDuration end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishChecksRuptureDuration = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 20,
                  width = 'full'
                },
                vanishMaxRuptureRemaining = {
                  type = 'range',
                  name = 'Maximum rupture duration remaining',
                  desc = 'What is the maximum time left on rupture to use vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMaxRuptureRemaining end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMaxRuptureRemaining = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksRuptureDuration) end,
                  order = 21,
                  width = 'full',
                  min = 1,
                  max = 28,
                  softMin = 1,
                  softMax = 28,
                  step = 1,
                  bigStep = 1
                },
                vanishChecksRuptureMultiplier = {
                  type = 'toggle',
                  name = 'Check rupture multiplier',
                  desc = 'Should we check the multiplier on the current rupture if it\'s up? The multiplier would be 1 if we applied out of stealth and didn\'t exsanguinate, 1.5 if we applied from stealth and didn\'t exsanguinate, 5 if applied out of stealth and exsanguinated, and 5.5 if applied from stealth and exsanguinated.',
                  get = function(info) return Torpedo.db.profile.assassination.vanishChecksRuptureMultiplier end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishChecksRuptureMultiplier = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 22,
                  width = 'full'
                },
                vanishMaxRuptureMultiplier = {
                  type = 'range',
                  name = 'Maximum rupture multiplier',
                  desc = 'What is the maximum rupture multiplier to suggest vanish? 1 would mean suggest vanish if and only if the old rupture wasn\'t buffed at all, 1.5 would mean suggest vanish if and only if the current rupture isn\'t improved by exsanguinate, 5 would mean suggest vanish if and only if the current rupture isn\'t a rupture from stealth that was exsanguinated, and 5.5 would effectively mean ignore rupture multiplier',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMaxRuptureMultiplier end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMaxRuptureMultiplier = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksRuptureMultiplier) end,
                  order = 23,
                  width = 'full',
                  min = 1,
                  max = 5.5,
                  softMin = 1,
                  softMax = 5.5,
                  step = 0.01,
                  bigStep = 0.5
                },
                vanishChecksEnergy = {
                  type = 'toggle',
                  name = 'Check energy',
                  desc = 'Should we check our energy levels before using vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishChecksEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishChecksEnergy = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.vanishEnabled end,
                  order = 24,
                  width = 'full'
                },
                vanishHasMinEnergy = {
                  type = 'toggle',
                  name = 'Have minimum energy',
                  desc = 'Is there a minimum energy amount for using vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishHasMinEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishHasMinEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksEnergy) end,
                  order = 25,
                  width = 'full'
                },
                vanishMinEnergy = {
                  type = 'range',
                  name = 'Minimum energy',
                  desc = 'What is the minimum energy amount for using vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMinEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMinEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksEnergy) or (not Torpedo.db.profile.assassination.vanishHasMinEnergy) end,
                  order = 26,
                  width = 'full',
                  min = 1,
                  max = 156,
                  softMin = 1,
                  softMax = 125,
                  step = 1,
                  bigStep = 5
                },
                vanishHasMaxEnergy = {
                  type = 'toggle',
                  name = 'Have maximum energy',
                  desc = 'Is there a maximum energy amount for using vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishHasMaxEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishHasMaxEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksEnergy) end,
                  order = 27,
                  width = 'full'
                },
                vanishMaxEnergy = {
                  type = 'range',
                  name = 'Maximum energy',
                  desc = 'What is the maximum energy amount for using vanish?',
                  get = function(info) return Torpedo.db.profile.assassination.vanishMaxEnergy end,
                  set = function(info, val) Torpedo.db.profile.assassination.vanishMaxEnergy = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.vanishEnabled) or (not Torpedo.db.profile.assassination.vanishChecksEnergy) or (not Torpedo.db.profile.assassination.vanishHasMaxEnergy) end,
                  order = 28,
                  width = 'full',
                  min = 1,
                  max = 156,
                  softMin = 1,
                  softMax = 125,
                  step = 1,
                  bigStep = 5
                }
              }
            },
            exsanguinate = {
              type = 'group',
              name = 'Exsanguinate',
              order = 3,
              args = {
                exsanguinateEnabled = {
                  type = 'toggle',
                  name = 'Suggest exsanguinate',
                  desc = 'Toggle if exsanguinate should ever be suggested.',
                  get = function(info) return Torpedo.db.profile.assassination.exsanguinateEnabled end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsanguinateEnabled = val end,
                  order = 1,
                  width = 'full'
                },
                exsanguinatePriority = {
                  type = 'range',
                  name = 'Priority',
                  desc = PRIORITY_DESC,
                  get = function(info) return Torpedo.db.profile.assassination.cdPriorities.exsanguinate end,
                  set = function(info, val) TrySetCDPriority('assassination', 'exsanguinate', val) end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.exsanguinateEnabled end,
                  order = 2,
                  width = 'full',
                  min = 1,
                  max = 2000,
                  softMin = 1,
                  softMax = 1000,
                  step = 1,
                  bigStep = 1
                },
                exsChecksVendettaCD = {
                  type = 'toggle',
                  name = 'Check vendetta cooldown',
                  desc = 'Should we check the cooldown on vendetta before using exsanguinate? Exsanguinate is very strong by itself, but if vendetta is almost ready it might be worth waiting a few seconds',
                  get = function(info) return Torpedo.db.profile.assassination.exsChecksVendettaCD end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsChecksVendettaCD = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.exsanguinateEnabled end,
                  order = 3,
                  width = 'full'
                },
                exsHasMinVendettaCdLeft = {
                  type = 'toggle',
                  name = 'Have minimum vendetta cooldown',
                  desc = 'Do we have a minimum time remaining on vendettas cooldown to use exsanguinate?',
                  get = function(info) return Torpedo.db.profile.assassination.exsHasMinVendettaCdLeft end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsHasMinVendettaCdLeft = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.exsanguinateEnabled) or (not Torpedo.db.profile.assassination.exsChecksVendettaCD) end,
                  order = 4,
                  width = 'full'
                },
                exsMinVendettaCdLeft = {
                  type = 'range',
                  name = 'Minimum vendetta cooldown',
                  desc = 'What is the minimum time remaining on vendettas cooldown to use exsanguinate?',
                  get = function(info) return Torpedo.db.profile.assassination.exsMinVendettaCdLeft end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsMinVendettaCdLeft = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.exsanguinateEnabled) or (not Torpedo.db.profile.assassination.exsChecksVendettaCD) or (not Torpedo.db.profile.assassination.exsHasMinVendettaCdLeft) end,
                  order = 5,
                  width = 'full',
                  min = 1,
                  max = 120,
                  softMin = 1,
                  softMax = 120,
                  step = 0.01,
                  bigStep = 1
                },
                exsChecksVanishCD = {
                  type = 'toggle',
                  name = 'Check vanish cooldown',
                  desc = 'Should we check the cooldown on vanish before using exsanguinate? Exsanguinate is very strong by itself, but if vanish is almost ready it might be worth waiting a few seconds',
                  get = function(info) return Torpedo.db.profile.assassination.exsChecksVanishCD end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsChecksVanishCD = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.exsanguinateEnabled end,
                  order = 6,
                  width = 'full'
                },
                exsHasMinVanishCdLeft = {
                  type = 'toggle',
                  name = 'Have minimum vanish cooldown',
                  desc = 'Do we have a minimum time remaining on vanishs cooldown to use exsanguinate?',
                  get = function(info) return Torpedo.db.profile.assassination.exsHasMinVanishCdLeft end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsHasMinVanishCdLeft = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.exsanguinateEnabled) or (not Torpedo.db.profile.assassination.exsChecksVanishCD) end,
                  order = 7,
                  width = 'full'
                },
                exsMinVanishCdLeft = {
                  type = 'range',
                  name = 'Minimum vanish cooldown',
                  desc = 'What is the minimum time remaining on vendettas cooldown to use exsanguinate?',
                  get = function(info) return Torpedo.db.profile.assassination.exsMinVanishCdLeft end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsMinVanishCdLeft = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.exsanguinateEnabled) or (not Torpedo.db.profile.assassination.exsChecksVanishCD) or (not Torpedo.db.profile.assassination.exsHasMinVanishCdLeft) end,
                  order = 8,
                  width = 'full',
                  min = 1,
                  max = 120,
                  softMin = 1,
                  softMax = 120,
                  step = 0.01,
                  bigStep = 1
                },
                exsChecksRuptureDuration = {
                  type = 'toggle',
                  name = 'Check rupture duration',
                  desc = 'Should we check how much time is left on rupture before using exsanguinate?',
                  get = function(info) return Torpedo.db.profile.assassination.exsChecksRuptureDuration end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsChecksRuptureDuration = val end,
                  disabled = function(info) return not Torpedo.db.profile.assassination.exsanguinateEnabled end,
                  order = 9,
                  width = 'full'
                },
                exsMinRuptureRemaining = {
                  type = 'range',
                  name = 'Minimum rupture duration remaining',
                  desc = 'What is the minimum time left on rupture to use exsanguinate?',
                  get = function(info) return Torpedo.db.profile.assassination.exsMinRuptureRemaining end,
                  set = function(info, val) Torpedo.db.profile.assassination.exsMinRuptureRemaining = val end,
                  disabled = function(info) return (not Torpedo.db.profile.assassination.exsanguinateEnabled) or (not Torpedo.db.profile.assassination.exsChecksRuptureDuration) end,
                  order = 10,
                  width = 'full',
                  min = 1,
                  max = 28,
                  softMin = 1,
                  softMax = 28,
                  step = 1,
                  bigStep = 1
                }
              }
            }
          }
        }
      }
    },
    subtlety = {
      name = 'Subtlety',
      type = 'group',
      order = 2,
      args = { 
        mainAbilities = {
          name = 'Primary Abilities',
          type = 'group',
          order = 1,
          args = {
            
          }
        },
        secondaryAbilities = {
          name = 'Secondary Abilities',
          type = 'group',
          order = 2,
          args = {
          
          }
        }
      }
    }
  }
}

local defaults = {
  profile = {
    assassination = {
      mainPriorities = {
        deadlyPoison = 1000,
        stealth = 995,
        rupture = 900,
        envenom = 895,
        garrote = 800,
        hemorrhage = 795,
        mutilate = 790
      },
      cdPriorities = {
        vendetta = 1000,
        vanish = 995,
        exsanguinate = 990
      },
      frequency = 0.05,
      deadlyPoisonEnabled = true,
      refreshDeadlyPoisonOOCSeconds = 600,
      stealthEnabled = true,
      ruptureEnabled = true,
      applyRuptureEarlyWhenLowEnergy = true,
      ruptureLowEnergy = 55,
      ruptureMinComboPoints = 2,
      ruptureReapplyTime = 7,
      allowRuptureWorsen = false,
      cutoffRuptureWhenBetterMultiplier = true,
      poolEnergyWaitingForRupture = true,
      poolEnergyToCutoffRupture = true,
      applyRuptureEarlyWhenExsanguinateReady = true,
      envenomEnabled = true,
      avoidCuttingOffEnvenom = true,
      envenomReapplyTime = 2,
      envenomAtMaxComboPoints = true,
      envenomMinComboPoints = 5,
      poolEnergyWaitingForEnvenom = true,
      maxEnvenomPoolEnergy = 90,
      garroteEnabled = true,
      avoidCuttingOffGarrote = true,
      garroteReapplyTime = 6,
      allowGarroteWorsen = false,
      cutoffGarroteWhenBetterMultiplier = true,
      poolEnergyWaitingForGarrote = true,
      poolEnergyToCutoffGarrote = false,
      hemorrhageEnabled = true,
      hemorrhageReapplyTime = 6,
      poolEnergyWaitingForHemorrhage = true,
      mutilateEnabled = true,
      dontPoolMutilateWhenRuptureRemainingLessThan = 9,
      mutilateLenientCPCheckIfRuptureLow = true,
      maxCPToMutilateIfRuptureLow = 5,
      poolEnergyWaitingForMutilate = true,
      poolEnergyWaitingForMutilateRuptureLow = true,
      mutilateLenientCPCheck = true,
      maxCPToMutilate = 5,
      minEnergyToMutilate = 75,
      ignoreCPForMutilateEnergy = 100,
      vendettaEnabled = true,
      vendettaWaitsForVanish = true,
      vendettaLetsVanishHaveSomeCD = false,
      vendettaMaxAllowedVanishCDRemaining = 2,
      vendettaIgnoresVanishCDIfLongWayOff = false,
      vendettaVanishMinCdToIgnore = 90,
      vendettaWaitsForExsanguinate = true,
      vendettaLetsExsanguinateHaveSomeCD = false,
      vendettaMaxAllowedExsanguinateCDRemaining = 2,
      vendettaIgnoresExsanguinateCDIfLongWayOff = false,
      vendettaExsanguinateMinCdToIgnore = 30,
      vendettaChecksComboPoints = true,
      vendettaRequiresMaxComboPoints = true,
      vendettaHasMinCP = false,
      vendettaMinCP = 5,
      vendettaHasMaxCP = false,
      vendettaMaxCP = 6,
      vendettaChecksStealthyTristate = nil,
      vendettaChecksRuptureDuration = false,
      vendettaMaxRuptureRemaining = 7,
      vendettaChecksRuptureMultiplier = true,
      vendettaMaxRuptureMultiplier = 1,
      vendettaChecksEnergy = true,
      vendettaHasMinEnergy = true,
      vendettaMinEnergy = 25,
      vendettaHasMaxEnergy = false,
      vendettaMaxEnergy = 100,
      vanishEnabled = true,
      vanishRequiresVendettaBuff = true,
      vanishRequiresVendettaBuffMinDuration = true,
      vanishRequiredVendettaBuffMinDuration = 10,
      vanishWaitsForExsanguinate = true,
      vanishLetsExsanguinateHaveSomeCD = false,
      vanishMaxAllowedExsanguinateCDRemaining = 2,
      vanishWaitsForVendetta = false,
      vanishLetsVendettaHaveSomeCD = false,
      vanishMaxAllowedVendettaCDRemaining = 2,
      vanishChecksComboPoints = true,
      vanishRequiresMaxComboPoints = true,
      vanishHasMinCP = false,
      vanishMinCP = 5,
      vanishHasMaxCP = false,
      vanishMaxCP = 6,
      vanishChecksStealthyTristate = nil,
      vanishChecksRuptureDuration = false,
      vanishMaxRuptureRemaining = 7,
      vanishChecksRuptureMultiplier = true,
      vanishMaxRuptureMultiplier = 1,
      vanishChecksEnergy = true,
      vanishHasMinEnergy = true,
      vanishMinEnergy = 25,
      vanishHasMaxEnergy = false,
      vanishMaxEnergy = 100,
      exsanguinateEnabled = true,
      exsChecksVendettaCD = true,
      exsHasMinVendettaCdLeft = true,
      exsMinVendettaCdLeft = 3,
      exsChecksVanishCD = true,
      exsHasMinVanishCdLeft = true,
      exsMinVanishCdLeft = 3,
      exsChecksRuptureDuration = true,
      exsMinRuptureRemaining = 24
    }
  }
}

local TorpedoAI = LibStub('TorpedoAI-1.0')

local ai_ready = false
local ai_main = nil
local ai_cd = nil

local numberOfTier18Pieces = 0
local glows = {}
local lastMainAbility = nil
local currMainAbility = nil
local lastCDAbility = nil
local currCDAbility = nil
local showDimmer = false
local Target = {
	guid = 0,
	hostile = false
}
local counter = 0

function Torpedo:TrySetMainPriority(profileKey, subKey, val)
  local profile = self.db.profile[profileKey]
  if profile.mainPriorities[subKey] == val then return end
  for key, existingPriority in pairs(profile.mainPriorities) do 
    if existingPriority == val then
      message('Priority conflict: ' .. tostring(key) .. ' already has that priority (' .. val .. ') - abilities that show up in the same spot need to have different priorities')
      return
    end
  end
  profile.mainPriorities[subKey] = val
  Torpedo:PLAYER_SPECIALIZATION_CHANGED('player')
end

function Torpedo:TrySetCDPriority(profileKey, subKey, val)
  local profile = self.db.profile[profileKey]
  if profile.cdPriorities[subKey] == val then return end
  for key, existingPriority in pairs(profile.cdPriorities) do 
    if existingPriority == val then
      message('Priority conflict: ' .. tostring(key) .. ' already has that priority (' .. val .. ') - abilities that show up in the same spot need to have different priorities')
      return
    end
  end
  profile.cdPriorities[subKey] = val
  Torpedo:PLAYER_SPECIALIZATION_CHANGED('player')
end

-- Utility functions -- 
local stealthy = false
local stealthyCounter = 0
local function increment_stealthy_counter()
  stealthyCounter = stealthyCounter + 1
  stealthy = stealthyCounter > 0
end
local function decrement_stealthy_counter()
  stealthyCounter = stealthyCounter - 1
  stealthy = stealthyCounter > 0
end

local stealthy_Auras = {1784, 11327, 115191, 115192, 51713, 185422}
local function is_stealthy_Aura(AuraId)
  for i=1, #stealthy_Auras do 
    if stealthy_Auras[i] == AuraId then return true end
  end
  return false
end
-- End utility functions --

local myGuid = -1

local is_assassination = nil
local is_subtlety = nil
local nightstalker_selected = nil
local deeper_stratagem_selected = nil

local function update_specialization_and_talents()
  local specNumber = GetSpecialization()
  local id, name, description, icon, background, role = GetSpecializationInfo(specNumber)
  
  is_assassination = id == 259
  is_subtlety = id == 261
  
  if is_assassination or is_subtlety then 
    local _, _, _, _, _, _, _, _, _, selected = GetTalentInfoByID(NIGHTSTALKER_TALENT_ID)
    nightstalker_selected = selected
   
    _, _, _, _, _, _, _, _, _, selected = GetTalentInfoByID(DEEPER_STRATAGEM_TALENT_ID)
    deeper_stratagem_selected = selected
  else
    nightstalker_selected = false
    deeper_stratagem_selected = false
  end
end

local function max_combo_points()
  return UnitPowerMax(PlayerFrame.unit, SPELL_POWER_COMBO_POINTS)
end

local function max_usable_combo_points()
  return deeper_stratagem_selected and 6 or 5
end

local function bleed_multiplier()
  if not is_assassination then return 0 end
  
  local result = 1
  
  if stealthy and nightstalker_selected then 
    result = result + 0.5
  end
  
  return result
end

function Torpedo:COMBAT_LOG_EVENT_UNFILTERED(evName, the_time, eventType, _, srcGuid, srcName, _, _, dstGuid, dstName, _, _, spellId)
  if srcGuid == myGuid then 
    if eventType == 'SPELL_AURA_APPLIED' and dstGuid == myGuid then 
      if is_stealthy_Aura(spellId) then 
        increment_stealthy_counter()
      end
    elseif eventType == 'SPELL_AURA_REMOVED' and dstGuid == myGuid then 
      if is_stealthy_Aura(spellId) then 
        decrement_stealthy_counter()
      end
    elseif eventType == 'SPELL_CAST_SUCCESS' then 
      if is_assassination then 
        if spellId == assass_spells.Rupture.spell_id then 
          auras.Rupture.multiplier = bleed_multiplier()
        elseif spellId == assass_spells.Garrote.spell_id then 
          auras.Garrote.multiplier = bleed_multiplier()
        elseif spellId == assass_spells.Exsanguinate.spell_id then 
          if auras.Rupture:up() then auras.Rupture.multiplier = auras.Rupture.multiplier + 4 end
          if auras.Garrote:up() then auras.Garrote.multiplier = auras.Garrote.multiplier + 4 end
        end
      end
    end
  end
end

-- Prevents other things from causing spells to glow
local function DenyOverlayGlow(actionButton)
	actionButton.overlay:Hide()
end
hooksecurefunc('ActionButton_ShowOverlayGlow', DenyOverlayGlow)

-- Does our own custom glowing
local function create_overlay_glows() 
  if #glows > 0 then return end
  
	local GenerateGlow = function(button)
		if button then
			local w, h, glow
			w, h = button:GetSize()
			glow = CreateFrame('Frame', nil, button, 'ActionBarButtonSpellActivationAlert')
			glow:Hide()
			glow:SetSize(w * 1.4, h * 1.4)
			glow:SetPoint('TOPLEFT', button, 'TOPLEFT', -w * 0.2, h * 0.2)
			glow:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', w * 0.2, -h * 0.2)
			glow.button = button
			glows[#glows + 1] = glow
		end
	end
	
	for i = 1, 12 do 
		GenerateGlow(_G['ActionButton' .. i])
		GenerateGlow(_G['MultiBarLeftButton' .. i])
		GenerateGlow(_G['MultiBarRightButton' .. i])
		GenerateGlow(_G['MultiBarBottomLeftButton' .. i])
		GenerateGlow(_G['MultiBarBottomRightButton' .. i])
	end
end

-- Decides if an icon should glow
local function should_glow(icon) 
	if not icon then return false end
	
	if currMainAbility and icon == currMainAbility.icon_id then return true end
	if currCDAbility and icon == currCDAbility.icon_id then return true end
	
	return false
end

-- Updates icons that should be glowing to glowing, and those that shouldn't
-- be glowing to not glowing
local function update_glows() 
	local glow, icon
	for i = 1, #glows do
		glow = glows[i]
		icon = glow.button.icon:GetTexture()
		if should_glow(icon) and glow.button.icon:IsVisible() then
			if not glow:IsVisible() then
				glow.animIn:Play()
			end
		elseif glow:IsVisible() then
			glow.animIn:Stop()
			glow:Hide()
		end
	end
end


local function disappear() 
	currMainAbility = nil
	lastMainAbility = nil
	currCDAbility = nil
	lastCDAbility = nil
	update_glows()
	torpedoPanel:Hide()
	torpedoPanel.border:Hide()
	torpedoCooldownPanel:Hide()
	torpedoCooldownPanel.border:Hide()
end


local function cleanup()
  auras_cache = { player = {}, target = {} }
  ai_ready = false
  ai_main = nil
  ai_cd = nil
  showDimmer = false
  disappear()
end

local function initialize_assassination(db)
  ai_main = TorpedoAI:New()
  
  ai_main:RegisterSuggestion(db.profile.assassination.mainPriorities.deadlyPoison, function(self, db)
    -- If deadly poison is not active, or we're not in combat and it's about to wear off, 
    -- then apply deadly poison --
    if not db.profile.assassination.deadlyPoisonEnabled then return end
    
    if auras.DeadlyPoison:up() then
      if InCombatLockdown() then return end 
      if auras.DeadlyPoison:remaining() < db.profile.assassination.refreshDeadlyPoisonOOCSeconds then 
        return assass_spells.DeadlyPoison
      end
    else 
      return assass_spells.DeadlyPoison
    end
  end)
  ai_main:RegisterSuggestion(db.profile.assassination.mainPriorities.stealth, function(self, db)
    -- If we are not in combat and not stealthed, apply stealth --
    if not db.profile.assassination.stealthEnabled then return end
    
    if InCombatLockdown() then return end
    if not auras.Stealth:up() then 
      return assass_spells.Stealth
    end
  end)
  ai_main:RegisterSuggestion(db.profile.assassination.mainPriorities.rupture, function(self, db)
    -- If rupture is off apply rupture if we have at least 2 combo points and 70 energy --
    -- If exsanguinate is ready apply rupture if we have max combo points and 25 energy --
    -- If we have max combo points and rupture is about to wear off and reapplying rupture 
    -- won't worsen it, reapply rupture --
    -- If ruptures multiplier is worse than our current multiplier and we have max combo 
    -- points, apply rupture --
    if not db.profile.assassination.ruptureEnabled then return end
    
    local energy = UnitPower('player')
    local comboPoints = GetComboPoints('player', 'target')
    local haveEnoughEnergy = energy >= 25
    if db.profile.assassination.applyRuptureEarlyWhenLowEnergy then 
      local ruptureOff = not auras.Rupture:up()
      local lowEnergy = energy <= db.profile.assassination.ruptureLowEnergy
      local enoughComboPoints = comboPoints >= db.profile.assassination.ruptureMinComboPoints
      
      if ruptureOff and lowEnergy and enoughComboPoints then 
        if not haveEnoughEnergy then 
          return pool_energy_sugg
        end
        return assass_spells.Rupture
      end
    end
    
    local haveMaxComboPoints = comboPoints == max_usable_combo_points()
    
    if db.profile.assassination.applyRuptureEarlyWhenExsanguinateReady then
      local exsanguinateCdStart, exsanguinateCdDuration = GetSpellCooldown(assass_spells.Exsanguinate.spell_id)
      
      local exsReady = exsanguinateCdDuration ~= 45
      if exsReady and haveEnoughEnergy and haveMaxComboPoints then 
        return assass_spells.Rupture
      end
    end
    
    local oldMultiplier = (not auras.Rupture:up()) and 0 or auras.Rupture.multiplier
    local newMultiplier = bleed_multiplier()
    local haveWorseMultiplier = newMultiplier < oldMultiplier
    local haveBetterMultiplier = newMultiplier > oldMultiplier
    local withinReapplyTime = (not auras.Rupture:up()) or (auras.Rupture:remaining() < db.profile.assassination.ruptureReapplyTime)
    local multiplierOK = db.profile.assassination.allowRuptureWorsen or (not haveWorseMultiplier)
    if haveMaxComboPoints and withinReapplyTime and multiplierOK then 
      if haveEnoughEnergy then 
        return assass_spells.Rupture
      elseif db.profile.assassination.poolEnergyWaitingForRupture then 
        return pool_energy_sugg
      end
    end
    
    if db.profile.assassination.cutoffRuptureWhenBetterMultiplier and haveMaxComboPoints then 
      if haveBetterMultiplier then 
        if haveEnoughEnergy then 
          return assass_spells.Rupture
        elseif db.profile.assassination.poolEnergyWaitingForRupture and db.profile.assassination.poolEnergyToCutoffRupture then
          return pool_energy_sugg
        end
      end
    end
  end)
  ai_main:RegisterSuggestion(db.profile.assassination.mainPriorities.envenom, function(self, db)
    -- If we have max combo points and envenom is either off or about to wear off, then use 
    -- Envenom or pool -- 
    if not db.profile.assassination.envenomEnabled then return end
    
    local energy = UnitPower('player')
    local comboPoints = GetComboPoints('player', 'target')
    local haveMaxComboPoints = comboPoints == max_usable_combo_points()
    
    local dontHaveTooMuchEnvenomLeft = (not db.profile.assassination.avoidCuttingOffEnvenom) or (not auras.Envenom:up()) or (auras.Envenom:remaining() < db.profile.assassination.envenomReapplyTime)
    local haveEnoughComboPoints = (db.profile.assassination.envenomAtMaxComboPoints and haveMaxComboPoints) or ((not db.profile.assassination.envenomAtMaxComboPoints) and (comboPoints >= db.profile.assassination.envenomMinComboPoints))
    local haveEnoughEnergy = energy >= 35
    
    if haveEnoughComboPoints then 
      if haveEnoughEnergy then 
        if dontHaveTooMuchEnvenomLeft then 
          return assass_spells.Envenom
        else 
          -- We have enough energy & enough combo points, but envenom buff is still up --
          local willingToPool = db.profile.assassination.poolEnergyWaitingForEnvenom
          local haveTooMuchEnergyToPool = energy > db.profile.assassination.maxEnvenomPoolEnergy
          if (not willingToPool) or haveTooMuchEnergyToPool then 
            return assass_spells.Envenom
          elseif willingToPool then
            return pool_energy_sugg
          end
        end
      else
        -- We have enough combo points but not enough energy
        if db.profile.assassination.poolEnergyWaitingForEnvenom then 
          return pool_energy_sugg
        end
      end
    end
  end)
  ai_main:RegisterSuggestion(db.profile.assassination.mainPriorities.garrote, function(self, db)
    -- If garrote is available and a new garrote is better than the old one, apply garrote or pool --
    -- If garrote is available, either off or about to wear off, and a new garrote 
    -- isn't worse than the old garrote, apply garrote or pool --
    if not db.profile.assassination.garroteEnabled then return end
    
    local energy = UnitPower('player')
    local cdStart, cdDuration, _ = GetSpellCooldown(assass_spells.Garrote.spell_id)
    
    local oldMultiplier = (not auras.Garrote:up()) and 0 or auras.Garrote.multiplier
    local newMultiplier = bleed_multiplier()
    local haveWorseMultiplier = newMultiplier < oldMultiplier
    local haveBetterMultiplier = newMultiplier > oldMultiplier
    local garroteReady = cdDuration ~= 15
    local dontHaveTooMuchGarroteLeft = (not db.profile.assassination.avoidCuttingOffGarrote) or (not auras.Garrote:up()) or (auras.Garrote:remaining() < db.profile.assassination.garroteReapplyTime)
    local haveEnoughEnergy = energy >= 45
    
    if not garroteReady then return end
    
    if haveWorseMultiplier and (not db.profile.assassination.allowGarroteWorsen) then return end
    
    if haveBetterMultiplier and db.profile.assassination.cutoffGarroteWhenBetterMultiplier then 
      if haveEnoughEnergy then 
        return assass_spells.Garrote
      else
        if db.profile.assassination.poolEnergyWaitingForGarrote and db.profile.assassination.poolEnergyToCutoffGarrote then 
          return pool_energy_sugg
        end
      end
    end
    
    if dontHaveTooMuchGarroteLeft then 
      if haveEnoughEnergy then 
        return assass_spells.Garrote
      else
        if db.profile.assassination.poolEnergyWaitingForGarrote then 
          return pool_energy_sugg
        end
      end
    end
  end)
  ai_main:RegisterSuggestion(db.profile.assassination.mainPriorities.hemorrhage, function(self, db)
    -- If hemorrhage is either off or about to wear off, apply hemorrhage or pool --
    if not db.profile.assassination.hemorrhageEnabled then return end
    
    local energy = UnitPower('player')
    
    local haveEnoughEnergy = energy >= 30
    local dontHaveTooMuchHemorrhageLeft = (not auras.Hemorrhage:up()) or (auras.Hemorrhage:remaining() < db.profile.assassination.hemorrhageReapplyTime)
    
    if dontHaveTooMuchHemorrhageLeft then
      if haveEnoughEnergy then 
        return assass_spells.Hemorrhage
      elseif db.profile.assassination.poolEnergyWaitingForHemorrhage then 
        return pool_energy_sugg
      end
    end
  end)
  ai_main:RegisterSuggestion(db.profile.assassination.mainPriorities.mutilate, function(self, db)
    -- If rupture is off or about to wear off and we have less than the maximum usable combo points,
    -- use mutilate or pool --
    -- If we have less than the maximum usable combo points and we have at least 75 energy, use 
    -- mutilate --
    if not db.profile.assassination.mutilateEnabled then return end
    
    local energy = UnitPower('player')
    local comboPoints = GetComboPoints('player', 'target')
    
    local ruptureAlmostOff = (not auras.Rupture:up()) or (auras.Rupture:remaining() < db.profile.assassination.dontPoolMutilateWhenRuptureRemainingLessThan)
    
    if ruptureAlmostOff then 
      local dontHaveTooManyCP = false
      if db.profile.assassination.mutilateLenientCPCheckIfRuptureLow then 
        dontHaveTooManyCP = comboPoints < max_usable_combo_points()
      else
        local maxCPToMutilate = db.profile.assassination.maxCPToMutilateIfRuptureLow 
        dontHaveTooManyCP = comboPoints <= maxCPToMutilate
      end
      
      if not dontHaveTooManyCP then 
        local haveEnoughEnergy = energy >= 55
        
        if haveEnoughEnergy then 
          return assass_spells.Mutilate
        elseif db.profile.assassination.poolEnergyWaitingForMutilate or db.profile.assassination.poolEnergyWaitingForMutilateRuptureLow then 
          return pool_energy_sugg
        end
      end
    end
    
    local dontHaveTooManyCP = false
    if db.profile.assassination.mutilateLenientCPCheck then 
      dontHaveTooManyCP = comboPoints < max_usable_combo_points()
    else 
      local maxCPToMutilate = db.profile.assassination.maxCPToMutilate
      dontHaveTooManyCP = comboPoints <= maxCPToMutilate
    end
    local ignoreCPDueToEnergy = energy >= db.profile.assassination.ignoreCPForMutilateEnergy
    
    local haveEnoughEnergy = energy >= db.profile.assassination.minEnergyToMutilate
    
    if dontHaveTooManyCP or ignoreCPDueToEnergy then 
      if haveEnoughEnergy then 
        return assass_spells.Mutilate
      else
        if db.profile.assassination.poolEnergyWaitingForMutilate then 
          return pool_energy_sugg
        end
      end
    end
  end)
  
  
  ai_cd = TorpedoAI:New()
  
  ai_cd:RegisterSuggestion(db.profile.assassination.cdPriorities.vendetta, function(self, db)
    -- If vendetta is not on cooldown, vanish is not on cooldown, exsanguinate is not on cooldown, 
    -- we have the max usable combo points, we're not stealthed, and rupture is either off, about
    -- to wear off, or weak and we have at least 25 energy, suggest vendetta --
    local cfg = db.profile.assassination -- make lines less long
    if not cfg.vendettaEnabled then return end
    
    local vendettaCdStart, vendettaCdDuration = GetSpellCooldown(assass_spells.Vendetta.spell_id)
    local vanishCdStart, vanishCdDuration = GetSpellCooldown(assass_spells.Vanish.spell_id)
    local exsanguinateCdStart, exsanguinateCdDuration = GetSpellCooldown(assass_spells.Exsanguinate.spell_id)
    
    local the_time = GetTime()
    local vendettaCdRemaining = (vendettaCdStart ~= 0) and (vendettaCdStart + vendettaCdDuration - the_time) or 0
    local vanishCdRemaining = (vanishCdStart ~= 0) and (vanishCdStart + vanishCdDuration - the_time) or 0
    local exsanguinateCdRemaining = (exsanguinateCdStart ~= 0) and (exsanguinateCdStart + exsanguinateCdDuration - the_time) or 0
    
    local comboPoints = GetComboPoints('player', 'target')
    local haveMaxComboPoints = comboPoints == max_usable_combo_points()
    local energy = UnitPower('player')
    local oldRuptureMultiplier = auras.Rupture:up() and auras.Rupture.multiplier or 0
    
    local vendettaCdOK = (vendettaCdDuration ~= 120)
    if not vendettaCdOK then return end
    
    local vanishCdOK = (not cfg.vendettaWaitsForVanish) 
      or (vanishCdDuration ~= 120) 
      or (cfg.vendettaLetsVanishHaveSomeCD and vanishCdRemaining <= cfg.vendettaMaxAllowedVanishCDRemaining) 
      or (cfg.vendettaIgnoresVanishCDIfLongWayOff and vanishCdRemaining >= cfg.vendettaVanishMinCdToIgnore)
    if not vanishCdOK then return end
    
    local exsanguinateCdOK = (not cfg.vendettaWaitsForExsanguinate)
      or (exsanguinateCdDuration ~= 45)
      or (cfg.vendettaLetsExsanguinateHaveSomeCD and exsanguinateCdRemaining <= cfg.vendettaMaxAllowedExsanguinateCDRemaining)
      or (cfg.vendettaIgnoresExsanguinateCDIfLongWayOff and exsanguinateCdRemaining >= cfg.vendettaExsanguinateMinCdToIgnore)
      
    if not exsanguinateCdOK then return end
    
    local comboPointsOK = (not cfg.vendettaChecksComboPoints)
      or (cfg.vendettaRequiresMaxComboPoints and haveMaxComboPoints)
      or (not cfg.vendettaRequiresMaxComboPoints
        and ((not cfg.vendettaHasMinCP) or (comboPoints >= cfg.vendettaMinCP))
        and ((not cfg.vendettaHasMaxCP) or (comboPoints <= cfg.vendettaMaxCP)))
    if not comboPointsOK then return end
    
    local stealthOK = (cfg.vendettaChecksStealthyTristate == false)
      or ((cfg.vendettaChecksStealthyTristate == nil) and (not stealthy))
      or ((cfg.vendettaChecksStealthyTristate == true) and stealthy)
    if not stealthOK then return end
    
    local ruptureDurationOK = (not cfg.vendettaChecksRuptureDuration)
      or (not auras.Rupture:up())
      or (auras.Rupture:remaining() <= cfg.vendettaMaxRuptureRemaining)
    if not ruptureDurationOK then return end
    
    local ruptureMultiplierOK = (not cfg.vendettaChecksRuptureMultiplier)
      or (not auras.Rupture:up())
      or (oldRuptureMultiplier <= cfg.vendettaMaxRuptureMultiplier)
    if not ruptureMultiplierOK then return end
    
    local energyOK = (not cfg.vendettaChecksEnergy)
      or (  ((not cfg.vendettaHasMinEnergy) or energy >= cfg.vendettaMinEnergy)
        and ((not cfg.vendettaHasMaxEnergy) or energy <= cfg.vendettaMaxEnergy))
    if not energyOK then return end
    
    return assass_spells.Vendetta
  end)
  
  ai_cd:RegisterSuggestion(db.profile.assassination.cdPriorities.vanish, function(self, db)
    -- If vendetta is active, vanish is not on cooldown, exsanguinate is not on cooldown, 
    -- we have the max usable combo points, we're not stealthed, and rupture is either off, about
    -- to wear off, or weak and we have at least 25 energy, suggest vanish --
    local cfg = db.profile.assassination 
    if not cfg.vanishEnabled then return end
    
    local vendettaCdStart, vendettaCdDuration = GetSpellCooldown(assass_spells.Vendetta.spell_id)
    local vanishCdStart, vanishCdDuration = GetSpellCooldown(assass_spells.Vanish.spell_id)
    local exsanguinateCdStart, exsanguinateCdDuration = GetSpellCooldown(assass_spells.Exsanguinate.spell_id)
    
    local the_time = GetTime()
    local vendettaCdRemaining = (vendettaCdStart ~= 0) and (vendettaCdStart + vendettaCdDuration - the_time) or 0
    local vanishCdRemaining = (vanishCdStart ~= 0) and (vanishCdStart + vanishCdDuration - the_time) or 0
    local exsanguinateCdRemaining = (exsanguinateCdStart ~= 0) and (exsanguinateCdStart + exsanguinateCdDuration - the_time) or 0
    
    local comboPoints = GetComboPoints('player', 'target')
    local haveMaxComboPoints = comboPoints == max_usable_combo_points()
    local energy = UnitPower('player')
    local oldRuptureMultiplier = auras.Rupture:up() and auras.Rupture.multiplier or 0
    
    local vendettaAuraOK = (not cfg.vanishRequiresVendettaBuff)
      or ((not cfg.vanishRequiresVendettaBuffMinDuration) and auras.Vendetta:up())
      or (auras.Vendetta:remaining() >= cfg.vanishRequiredVendettaBuffMinDuration)
    if not vendettaAuraOK then return end
    
    local vanishCdOK = vanishCdDuration ~= 120
    if not vanishCdOK then return end
    
    local exsanguinateCdOK = (not cfg.vanishWaitsForExsanguinate)
      or (exsanguinateCdDuration ~= 45)
      or (cfg.vanishLetsExsanguinateHaveSomeCD and exsanguinateCdRemaining <= cfg.vanishMaxAllowedExsanguinateCDRemaining)
    if not exsanguinateCdOK then return end
    
    local vendettaCdOK = (not cfg.vanishWaitsForVendetta)
      or (vendettaCdDuration ~= 120)
      or (cfg.vanishLetsVendettaHaveSomeCD and vendettaCdRemaining <= cfg.vanishMaxAllowedVendettaCDRemaining)
    if not vendettaCdOK then return end
    
    local comboPointsOK = (not cfg.vanishChecksComboPoints)
      or (cfg.vanishRequiresMaxComboPoints and haveMaxComboPoints) 
      or (not cfg.vanishRequiresMaxComboPoints
        and ((not cfg.vanishHasMinCP) or (comboPoints >= cfg.vanishMinCP))
        and ((not cfg.vanishHasMaxCP) or (comboPoints <= cfg.vanishMaxCP)))
    if not comboPointsOK then return end
    
    local stealthOK = (cfg.vanishChecksStealthyTristate == false)
      or ((cfg.vanishChecksStealthyTristate == nil) and (not stealthy))
      or ((cfg.vanishChecksStealthyTristate == true) and stealthy)
    if not stealthOK then return end
    
    local ruptureDurationOK = (not cfg.vanishChecksRuptureDuration)
      or (not auras.Rupture:up())
      or (auras.Rupture:remaining() <= cfg.vanishChecksRuptureDuration)
    if not ruptureDurationOK then return end
    
    local ruptureMultiplierOK = (not cfg.vanishChecksRuptureDuration)
      or (not auras.Rupture:up())
      or (oldRuptureMultiplier <= cfg.vanishChecksRuptureDuration)
    if not ruptureMultiplierOK then return end
    
    local energyOK = (not cfg.vanishChecksEnergy)
      or (  ((not cfg.vanishHasMinEnergy) or energy >= cfg.vanishMinEnergy)
        and ((not cfg.vanishHasMaxEnergy) or energy <= cfg.vanishMaxEnergy))
    if not energyOK then return end
    
    return assass_spells.Vanish
  end)
  
  ai_cd:RegisterSuggestion(db.profile.assassination.cdPriorities.exsanguinate, function(self, db)
    -- If exsanguinate is available and the target has rupture for at least another 24 seconds,
    -- and vanish/vendetta is not almost ready, suggest exsanguinate --
    local cfg = db.profile.assassination
    if not cfg.exsanguinateEnabled then return end
    
    local vendettaCdStart, vendettaCdDuration = GetSpellCooldown(assass_spells.Vendetta.spell_id)
    local vanishCdStart, vanishCdDuration = GetSpellCooldown(assass_spells.Vanish.spell_id)
    local exsanguinateCdStart, exsanguinateCdDuration = GetSpellCooldown(assass_spells.Exsanguinate.spell_id)
    
    local the_time = GetTime()
    local vendettaCdRemaining = (vendettaCdStart ~= 0) and (vendettaCdStart + vendettaCdDuration - the_time) or 0
    local vanishCdRemaining = (vanishCdStart ~= 0) and (vanishCdStart + vanishCdDuration - the_time) or 0
    local exsanguinateCdRemaining = (exsanguinateCdStart ~= 0) and (exsanguinateCdStart + exsanguinateCdDuration - the_time) or 0
    
    local comboPoints = GetComboPoints('player', 'target')
    local haveMaxComboPoints = comboPoints == max_usable_combo_points()
    local energy = UnitPower('player')
    
    local exsanguinateCdOK = exsanguinateCdDuration ~= 45
    if not exsanguinateCdOK then return end
    
    local vendettaCdOK = (not cfg.exsChecksVendettaCD)
      or ((not cfg.exsHasMinVendettaCdLeft) or (vendettaCdDuration ~= 120) or (vendettaCdRemaining >= cfg.exsMinVendettaCdLeft))
    if not vendettaCdOK then return end
    
    local vanishCdOK = (not cfg.exsChecksVanishCD)
      or ((not cfg.exsHasMinVanishCdLeft) or (vanishCdDuration ~= 120) or (vanishCdRemaining >= cfg.exsMinVanishCdLeft))
    if not vanishCdOK then return end
    
    local ruptureDurationOK = (not cfg.exsChecksRuptureDuration)
      or (auras.Rupture:remaining() >= cfg.exsMinRuptureRemaining)
    if not ruptureDurationOK then return end
    
    return assass_spells.Exsanguinate
  end)
  
end

local function initialize_subtlety(db)

end

local function initialize(db)
  local _, _, classIndex = UnitClass('player')
  
  if classIndex ~= 4 then -- (if we're not a rogue)
    return
  end
  
  if is_assassination then
    initialize_assassination(db)
    ai_ready = true
  elseif is_subtlety then
    initialize_subtlety(db)
    ai_ready = true
  end
end

local function init_gui()
  local torpedoPanel = CreateFrame('Frame', 'torpedoPanel', UIParent)
  torpedoPanel:SetPoint('TOPLEFT', 500, -50)
  torpedoPanel:SetFrameStrata('BACKGROUND')
  torpedoPanel:SetSize(64, 64)
  torpedoPanel:SetMovable(true)
  torpedoPanel:EnableMouse(true)
  torpedoPanel:SetMovable(true)
  torpedoPanel:RegisterForDrag('LeftButton')
  torpedoPanel:SetScript('OnDragStart', function() 
    torpedoPanel:StartMoving()
    torpedoCooldownPanel:StartMoving()
  end)
  torpedoPanel:SetScript('OnDragStop', function()
    torpedoPanel:StopMovingOrSizing()
    torpedoCooldownPanel:StopMovingOrSizing()
  end)
  torpedoPanel:Hide()
  torpedoPanel.icon = torpedoPanel:CreateTexture(nil, 'BACKGROUND')
  torpedoPanel.icon:SetAllPoints(torpedoPanel)
  torpedoPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
  torpedoPanel.border = torpedoPanel:CreateTexture(nil, 'BORDER')
  torpedoPanel.border:SetAllPoints(torpedoPanel)
  torpedoPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
  torpedoPanel.border:Hide()
  torpedoPanel.dimmer = torpedoPanel:CreateTexture(nil, 'OVERLAY')
  torpedoPanel.dimmer:SetAllPoints(torpedoPanel)
  torpedoPanel.dimmer:SetTexture(0, 0, 0, 0.6)
  torpedoPanel.dimmer:Hide()
  local torpedoCooldownPanel = CreateFrame('Frame', 'torpedoCooldownPanel', UIParent)
  torpedoCooldownPanel:SetPoint('BOTTOMLEFT', torpedoPanel, 'BOTTOMRIGHT', 10, -5)
  torpedoCooldownPanel:SetFrameStrata('BACKGROUND')
  torpedoCooldownPanel:SetSize(64, 64)
  torpedoCooldownPanel:SetMovable(true)
  torpedoCooldownPanel:Hide()
  torpedoCooldownPanel.icon = torpedoCooldownPanel:CreateTexture(nil, 'BACKGROUND')
  torpedoCooldownPanel.icon:SetAllPoints(torpedoCooldownPanel)
  torpedoCooldownPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
  torpedoCooldownPanel.border = torpedoCooldownPanel:CreateTexture(nil, 'BORDER')
  torpedoCooldownPanel.border:SetAllPoints(torpedoCooldownPanel)
  torpedoCooldownPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
  torpedoCooldownPanel.border:Hide()
  torpedoCooldownPanel.dimmer = torpedoCooldownPanel:CreateTexture(nil, 'OVERLAY')
  torpedoCooldownPanel.dimmer:SetAllPoints(torpedoCooldownPanel)
  torpedoCooldownPanel.dimmer:SetTexture(0, 0, 0, 0.6)
  torpedoCooldownPanel.dimmer:Hide()
  
  torpedoPanel:SetScale(1)
  torpedoCooldownPanel:SetScale(0.7)
end

function Torpedo:ACTIONBAR_SLOT_CHANGED()
  update_glows()
end

local function update_main_ability(newMainAbility) 
	if currMainAbility ~= newMainAbility then
		if newMainAbility then
			--print('AI Tick #'..tostring(counter)..', main ability became '..tostring(newMainAbility.icon_id))
      torpedoPanel.icon:SetTexture(newMainAbility.icon_id)
			torpedoPanel.icon:Show()
			torpedoPanel.border:Show()
		else
			--print('AI Tick #'..tostring(counter)..', main ability became nil')
			torpedoPanel.icon:Hide()
			torpedoPanel.border:Hide()
		end
		lastMainAbility = currMainAbility
	elseif not currMainAbility then
		torpedoPanel.icon:Hide()
	end
	
	if not newMainAbility or (not showDimmer) then
		torpedoPanel.dimmer:Hide()
	else
		torpedoPanel.dimmer:Show()
	end
	currMainAbility = newMainAbility
end

local function update_cd_ability(newCDAbility)
	if currCDAbility ~= newCDAbility then
		if newCDAbility then
			--print('AI Tick #'..tostring(counter)..', cd ability became '..tostring(newCDAbility.icon_id))
		  torpedoCooldownPanel.icon:SetTexture(newCDAbility.icon_id)
			torpedoCooldownPanel.icon:Show()
			torpedoCooldownPanel.border:Show()
		else
			--print('AI Tick #'..tostring(counter)..', cd ability became nil')
			torpedoCooldownPanel.icon:Hide()
			torpedoCooldownPanel.border:Hide()
		end
		lastCDAbility = currCDAbility
	elseif not currCDAbility then
		torpedoCooldownPanel.icon:Hide()
	end
	
	if not newCDAbility or (not showDimmer) then
		torpedoCooldownPanel.dimmer:Hide()
	else
		torpedoCooldownPanel.dimmer:Show()
	end
	currCDAbility = newCDAbility
end

function Torpedo:TimerTick()
	if not ai_main or not ai_cd or not ai_ready then
		counter = 0
		return 
	end
  
  if not Target.hostile then return end
  
  counter = counter + 1
  update_auras_for_unit('player')
  update_auras_for_unit('target')
  
  local mainDecision = ai_main:GetSuggestion(self.db)
  local cdDecision = ai_cd:GetSuggestion(self.db)
  local newMainAbility = mainDecision
  local newCDAbility = cdDecision
  
  update_cd_ability(newCDAbility)
  update_main_ability(newMainAbility)
  
  update_glows()
end

function Torpedo:OnInitialize()
  self.db = LibStub('AceDB-3.0'):New('TorpedoDB', defaults)
  
  LibStub('AceConfig-3.0'):RegisterOptionsTable('Torpedo', options)
  self.optionsFrame = LibStub('AceConfigDialog-3.0'):AddToBlizOptions('Torpedo', 'Torpedo')
  
  init_gui()
end

function Torpedo:OnEnable()
  self:RegisterEvent('PLAYER_LOGIN')
  self:RegisterEvent('PLAYER_TARGET_CHANGED')
  self:RegisterEvent('UNIT_FACTION')
  self:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
  self:RegisterEvent('PLAYER_EQUIPMENT_CHANGED')
  self:RegisterEvent('PLAYER_ENTERING_WORLD')
  self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
  self:RegisterEvent('ACTIONBAR_SLOT_CHANGED')
  self:RegisterEvent('PLAYER_TALENT_UPDATE')
  self:ScheduleRepeatingTimer('TimerTick', self.db.profile.assassination.frequency, self)
  create_overlay_glows()
end

function Torpedo:OnDisable()
  self:CancelAllTimers()
end

function Torpedo:PLAYER_TARGET_CHANGED()
	if ai_main == nil then return end
	local prevHostile = Target.hostile
	Target.hostile = UnitCanAttack('player', 'target') and not UnitIsDead('target')
	
	if Target.hostile then
		Target.guid = UnitGUID('Target')
		
		torpedoPanel:Show()
		torpedoCooldownPanel:Show()
	elseif prevHostile then
		disappear()
	end
end

function Torpedo:UNIT_FACTION(unitID)
  if unitID == 'target' then 
    self:PLAYER_TARGET_CHANGED()
  end
end

function Torpedo:PLAYER_EQUIPMENT_CHANGED()
	local tier18Head = 124263
	local tier18Legs = 124269
	local tier18Hand = 124257
	local tier18Shou = 124274
	local tier18Ches = 124248
	
	local tier18Pcs = {tier18Head, tier18Legs, tier18Hand, tier18Shou, tier18Ches}
	local numTier18 = 0
	for _, itemId in ipairs(tier18Pcs) do
		if IsEquippedItem(itemId) then
			numTier18 = numTier18 + 1
		end
	end
	
	numberOfTier18Pieces = numTier18
end

function Torpedo:PLAYER_ENTERING_WORLD()
  self:PLAYER_SPECIALIZATION_CHANGED('player')
  self:PLAYER_EQUIPMENT_CHANGED()
end

function Torpedo:PLAYER_SPECIALIZATION_CHANGED(unitName)
  if unitName == 'player' then 
    myGuid = UnitGUID('player')
    cleanup()
    update_specialization_and_talents()
    initialize(self.db)
    Torpedo:PLAYER_TARGET_CHANGED()
  end
end

function Torpedo:PLAYER_TALENT_UPDATE()
  self:PLAYER_SPECIALIZATION_CHANGED('player')
end

function Torpedo:PLAYER_LOGIN()
  myGuid = UnitGUID('player')
  self:PLAYER_SPECIALIZATION_CHANGED('player')
  self:PLAYER_EQUIPMENT_CHANGED()
end
