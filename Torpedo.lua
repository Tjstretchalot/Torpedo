--[[
	Torpedo by Tjstretchalot, Huge credit to Jpapertowels and szandos for
	the interface code in Claw, which I used as a strong reference in creating
	this.
]]--

local assass_spells = {
  Stealth = { name = 'Stealth', spell_id = 115191, icon_id = 132320, max_cd = 1 },
  DeadlyPoison = { name = 'Deadly Poison', spell_id = 2823, icon_id = 132290, max_cd = 1 },
  Rupture = { name = 'Rupture', spell_id = 1943, icon_id = 132302, max_cd = 1 },
  Garrote = { name = 'Garrote', spell_id = 703, icon_id = 132297, max_cd = 15 },
  Mutilate = { name = 'Mutilate', spell_id = 1329, icon_id = 132304, max_cd = 1 },
  Envenom = { name = 'Envenom', spell_id = 32645, icon_id = 132287, max_cd = 1 },
  Hemorrhage = { name = 'Hemorrhage', spell_id = 16511, icon_id = 136168, max_cd = 1 },
  Exsanguinate = { name = 'Exsanguinate', spell_id = 200806, talent_id = 22344, icon_id = 538040, max_cd = 45 },
  Vanish = { name = 'Vanish', spell_id = 1856, icon_id = 132331, max_cd = 120 },
  Vendetta = { name = 'Vendetta', spell_id = 79140, icon_id = 458726, max_cd = 120 },
  CrimsonVial = { name = 'Crimson Vial', spell_id = 185311, icon_id = 1373904, max_cd = 30 }
}

local subtlety_spells = {
  Stealth = { name = 'Stealth', spell_id = 115191, icon_id = 132320, max_cd = 1 },
  Backstab = { name = 'Backstab', spell_id = 53, icon_id = 132090, max_cd = 1 },
  Gloomblade = { name = 'Gloomblade', spell_id = 200758, icon_id = 1035040, max_cd = 1 },
  Eviscerate = { name = 'Eviscerate', spell_id = 196819, icon_id = 132292, max_cd = 1 },
  Vanish = { name = 'Vanish', spell_id = 1856, icon_id = 132331, max_cd = 120 },
  ShadowDance = { name = 'Shadow Dance', spell_id = 185313, icon_id = 236279, max_cd = 60, max_charges = 3 },
  SymbolsofDeath = { name = 'Symbols of Death', spell_id = 212283, icon_id = 252272, max_cd = 10 },
  Nightblade = { name = 'Nightblade', spell_id = 195452, icon_id = 1373907, max_cd = 1 },
  Shadowstrike = { name = 'Shadowstrike', spell_id = 185438, icon_id = 1373912, max_cd = 1 },
  ShadowBlades = { name = 'Shadow Blades', spell_id = 121471, icon_id = 376022, max_cd = 180 },
  CrimsonVial = { name = 'Crimson Vial', spell_id = 185311, icon_id = 1373904, max_cd = 30 }
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
function Aura:new(id, unitName, maxDuration, name, hasMultiplier)
  if hasMultiplier == nil then hasMultiplier = false end
  
  local res = { aura_id = id, unit_name = unitName, max_duration = maxDuration, name = name, has_multiplier = hasMultiplier }
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
  Stealth = Aura:new(1784, 'player', 1, 'Stealth'), -- Use stealthy when checking if abilities are usable!
  DeadlyPoison = Aura:new(2823, 'player', 3600, 'Deadly Poison'),
  Envenom = Aura:new(32645, 'player', 7, 'Envenom'),
  Hemorrhage = Aura:new(16511, 'target', 20, 'Hemorrhage'),
  Rupture = Aura:new(1943, 'target', 28, 'Rupture', true),
  Garrote = Aura:new(703, 'target', 18, 'Garrote', true),
  SymbolsofDeath = Aura:new(212283, 'player', 35, 'Symbols of Death'),
  Nightblade = Aura:new(195452, 'target', 18, 'Nightblade'),
  ShadowBlades = Aura:new(121471, 'player', 15, 'Shadow Blades'),
  Vendetta = Aura:new(79140, 'target', 20, 'Vendetta')
}

local subtlety_auras = {
  Stealth = auras.Stealth,
  SymbolsofDeath = auras.SymbolsofDeath,
  Nightblade = auras.Nightblade,
  ShadowBlades = auras.ShadowBlades
}

local assass_auras = {
  Stealth = auras.Stealth,
  DeadlyPoison = auras.DeadlyPoison,
  Envenom = auras.Envenom,
  Hemorrhage = auras.Hemorrhage,
  Rupture = auras.Rupture,
  Garrote = auras.Garrote
}

local pool_energy_sugg = { icon_id = 'Interface\\ICONS\\INV_Drink_15.blp' }

local NIGHTSTALKER_TALENT_ID = 22331
local DEEPER_STRATAGEM_TALENT_ID = 19239

local Torpedo = LibStub('AceAddon-3.0'):NewAddon('Torpedo', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

local PRIORITY_DESC = 'The relative priority of choosing this ability. Abilities with a higher priority are chosen over those with lower priority, if their requirements are met.'

local function pretty_type_error(errPrefix, varName, var, expectedType)
  if type(var) ~= expectedType then 
    error(tostring(errPrefix) .. ': ' .. tostring(varName) .. ' - ' .. tostring(expectedType) ' expected, but got ' .. type(var) .. ' (' .. tostring(var) .. ')', 3)
  end
end

-- This works for the subtlety conventions; I was still getting the hang of 
-- AceConfig for assassination. Assassination should be changed to use this --

--[[
  Builds a specific suggestion for an ability, e.g. deadly poison, with functions 
  to add different types of configuration, such as enabled/disabled,
  with an internal order counter.
--]]
local OptionBuilder = {}
function OptionBuilder:New(profile, suggestion, prettyName, order)
  local errPrefix = 'OptionBuilder:New(profile, suggestion, prettyName, order)'
  pretty_type_error(errPrefix, 'profile', profile, 'table')
  pretty_type_error(errPrefix, 'suggestion', suggestion, 'table')
  pretty_type_error(errPrefix, 'prettyName', prettyName, 'string')
  pretty_type_error(errPrefix, 'order', order, 'number')
  
  local res = {
    profile = profile,
    suggestion = suggestion,
    prettyName = prettyName,
    order = order,
    orderCounter = 0,
    result = {}}
  setmetatable(res, self)
  self.__index = self
  return res
end

function OptionBuilder:IncOrderCounter()
  self.orderCounter = self.orderCounter + 1
  return self.orderCounter
end

--[[
  Gets a function that returns true based on names of 
  boolean variables passed to it. Accepts strings, tables, and functions.
  Always strict - if *any* of the passed in things suggest
  disabled, returns disabled
  Strings are assumed to be inverted (i.e. true represents that
  the option is enabled)
  
  Ex: Never disabled
  optionBuilder:GetDisabledFunction(false)
  
  Ex: Always disabled
  optionBuilder:GetDisabledFunction(true)
  
  Ex: Want it to return true if 'enabled' is false
  optionBuilder:GetDisabledFunction('enabled')
  OR (since enabled is special)
  optionBuilder:GetDisabledFunction()
  
  Ex: Want it to return true if 'enabled' is false or 
      'ignoreXYZ' is true
  optionBuilder:GetDisabledFunction('enabled', { name = 'ignoreXYZ', invert = false })
]]
function OptionBuilder:GetDisabledFunction(...)
  local cacheSuggestion = self.suggestion
  local errPrefix = 'OptionBuilder:GetDisabledFunction(...)'
  
  local things = {...}
  local asFns = {}
  
  if #things == 1 and type(things[1]) == 'boolean' then 
    return things[1] 
  end
  
  if #things == 0 then 
    table.insert(things, 'enabled')
  end
  
  for i = 1, #things do 
    if type(things[i]) == 'string' then 
      local varName = things[i]
      table.insert(asFns, function(info) return not cacheSuggestion[varName] end)
    elseif type(things[i]) == 'table' then 
      local params = things[i]
      if not params.name then error(errPrefix .. ' passed in a table, but it doesn\'t have a name key/value pair!', 2) end
      if type(params.name) ~= 'string' then error(errPrefix .. ' passed in a table, and it has a name, but that name resolves to a ' .. type(params.name) .. ' - string expected', 2) end
      table.insert(asFns, function(info)
        local result = cacheSuggestion[params.name]
        
        if params.is_nil then result = (result == nil) end
        if params.strict then result = (result == true) end
        if params.invert then result = not result end
        
        return result
      end)
    elseif type(things[i]) == 'function' then 
      table.insert(asFns, things[i])
    else
      error(errPrefix .. ' passed in a ' .. type(things[i]) .. ' - string, function, or table expected', 2)
    end
  end
  
  return function(info)
    for i = 1, #asFns do 
      if asFns[i]() then return true end
    end
    return false
  end
end

--[[
  The next call to AddCustom will have the key/value 
  pairs from this infection table shallow-copied in,
  overwriting any previous values.
  
  This allows for additional code re-use, and sounds 
  awesome. Win-win.
  
  Mostly used for stuff like tri-states that want to toggle visible
  on otherwise standard components depending on the tristate. 
  
  If optOverwrite is false (strict; nil counts as true), then the infection 
  table should have functions as values that take in one parameter, the 
  old value for their key, and return the new value for that key
]]
function OptionBuilder:InfectNext(infectionTable, optTimes, optSkips, optOverwrite)
  if optOverwrite == nil then optOverwrite = true end
  if self.infection == nil then self.infection = {} end
  
  table.insert(self.infection, {
    skips = optSkips or 0,
    times = optTimes or 1,
    overwrite = optOverwrite,
    tbl = infectionTable
  })
  
  return self
end
--[[
  Adds the specified option to the result
  
  Sets the order to be the order it was called in
  Sets the width to 'full'
  Sets the disabled if it's nil to check 'enabled'
  
  Handles infection from InfectNext
]]
function OptionBuilder:AddCustom(custom)
  custom.order = self:IncOrderCounter()
  custom.width = 'full'
  
  if type(custom.disabled) == 'nil' then 
    custom.disabled = GetDisabledFunction()
  end
  
  if self.infection then
    local newInfections = {}
    for _, inf in ipairs(self.infection) do 
      if inf.skips > 0 then 
        inf.skips = inf.skips - 1
        table.insert(newInfections, inf)
      else 
        for key, val in pairs(inf.tbl) do
          if inf.overwrite then 
            custom[key] = val
          else 
            custom[key] = val(custom[key])
          end
        end
        
        
        inf.times = inf.times - 1
        if inf.times > 0 then 
          table.insert(newInfections, inf)
        end
      end
    end
    self.infection = newInfections
  end
  
  table.insert(self.result, custom)
  return self
end

--[[
  Adds the specified option to the result directly.
  
  See GetDisabledFunction for more info on extra arguments!
  
  Sets the get/set to retrieve varName from the suggestion, then calls AddCustom
]]
function OptionBuilder:AddSimpleCustom(custom, varName, ...)
  local errPrefix = 'OptionBuilder:AddSimpleCustom(custom, varName, ...)'
  pretty_type_error(errPrefix, 'custom', custom, 'table')
  pretty_type_error(errPrefix, 'varName', varName, 'string')
  
  local cacheSuggestion = self.suggestion
  custom.get = function(info) return cacheSuggestion[varName] end
  custom.set = function(info, val) cacheSuggestion[varName] = val end
  custom.disabled = self:GetDisabledFunction(...)
  return self:AddCustom(custom)
end

--[[
  Adds a simple toggle, which is tied to varName.
  
  See GetDisabledFunction for more info on extra arguments!
  
  Ex: optionBuilder:AddSimpleToggle(db.profile.subtlety.stealth.suggestions[1], 'enabled', 'Suggest stealth', 'Should stealth be suggested?', false)
]]
function OptionBuilder:AddSimpleToggle(varName, prettyName, desc, ...)
  local errPrefix = 'OptionBuilder:AddSimpleToggle(varName, prettyName, desc, ...)'
  pretty_type_error(errPrefix, 'varName', varName, 'string')
  pretty_type_error(errPrefix, 'prettyName', prettyName, 'string')
  pretty_type_error(errPrefix, 'desc', desc, 'string')
  
  local result = {
    name = prettyName,
    type = 'toggle',
    desc = desc
  }
  
  return self:AddSimpleCustom(result, varName, ...)
end

--[[
  Adds a simple tristate checkbox, which is tied to varName
  
  Cycle is unchecked (ignore this) (val = false) -> checked (val = true) -> checked 2 (val = nil)
  
  See GetDisabledFunction for more info on extra arguments!
  
  Ex: optionBuilder:AddSimpleTristate('stealthyTristate', 'Check stealth', 'Require stealth', 'Require not stealthed', 'Should we check if we\'re stealthed?')
]]
function OptionBuilder:AddSimpleTristate(varName, uncheckedName, option1Name, option2Name, desc, ...)
  local errPrefix = 'OptionBuilder:AddSimpleTristate(varName, uncheckedName, option1Name, option2Name, desc, ...)'
  pretty_type_error(errPrefix, 'varName', varName, 'string')
  pretty_type_error(errPrefix, 'uncheckedName', uncheckedName, 'string')
  pretty_type_error(errPrefix, 'option1Name', option1Name, 'string')
  pretty_type_error(errPrefix, 'option2Name', option2Name, 'string')
  pretty_type_error(errPrefix, 'desc', desc, 'string')
  
  local cacheSuggestion = self.suggestion
  local result = {
    name = function(info)
      local val = cacheSuggestion[varName]
      
      if val == nil then return option2Name 
      elseif val == true then return option1Name 
      elseif val == false then return uncheckedName end
      error('type(val) = ' .. type(val) .. ', tostring(val) = ' .. tostring(val))
    end,
    type = 'toggle',
    tristate = true,
    desc = desc
  }
  
  return self:AddSimpleCustom(result, varName, ...)
end

--[[
  Adds a simple range, which is tied to varName. disabled is optional; it defaults to checking 'enabled'.
  
  See GetDisabledFunction for more info on extra arguments!
  
  Ex: optionBuilder:AddSimpleRange('refreshTimeSeconds', 'Refresh time (seconds)', 1, 3600, 1, 1800, 1, 5, 'enabled', {name = 'refreshEarly', invert = false})
]]
function OptionBuilder:AddSimpleRange(varName, prettyName, desc, minim, maxim, softMin, softMax, step, bigStep, ...)
  local errPrefix = 'OptionBuilder:AddSimpleRange(varName, prettyName, desc, minim, maxim, softMin, softMax, step, bigStep, ...)'
  pretty_type_error(errPrefix, 'varName', varName, 'string')
  pretty_type_error(errPrefix, 'prettyName', prettyName, 'string')
  pretty_type_error(errPrefix, 'desc', desc, 'string')
  pretty_type_error(errPrefix, 'minim', minim, 'number')
  pretty_type_error(errPrefix, 'maxim', maxim, 'number')
  pretty_type_error(errPrefix, 'softMin', softMin, 'number')
  pretty_type_error(errPrefix, 'softMax', softMax, 'number')
  pretty_type_error(errPrefix, 'step', step, 'number')
  pretty_type_error(errPrefix, 'bigStep', bigStep, 'number')
  
  local result = {
    name = prettyName,
    type = 'range',
    desc = desc,
    min = minim,
    max = maxim,
    softMin = softMin,
    softMax = softMax,
    step = step,
    bigStep = bigStep
  }
  
  return self:AddSimpleCustom(result, varName, ...)
end

function OptionBuilder:AddEnabled()
  return self:AddSimpleToggle('enabled', 
    'Suggest ' .. self.prettyName, 
    'Should ' .. string.lower(self.prettyName) .. ' ever be suggested?',
    false)
end

function OptionBuilder:AddPriority()
  -- Nothing about priority is particularly simple, so we build it from scratch --
  local cacheSuggestion = self.suggestion
  local result = {
    name = 'Priority',
    type = 'range',
    desc = PRIORITY_DESC,
    get = function(info) return cacheSuggestion.priority end,
    set = function(info, val)
      Torpedo:TrySetPriority(profile, cacheSuggestion, val)
    end,
    disabled = self:GetDisabledFunction(),
    width = 'full',
    min = 1,
    max = 2000,
    softMin = 1,
    softMax = 1000,
    step = 1,
    bigStep = 1
  }
  return self:AddCustom(result)
end

function OptionBuilder:AddIsMain()
  return self:AddSimpleToggle('isMain',
    'Primary suggestion',
    'Should ' .. string.lower(self.prettyName) .. ' be considered a primary suggestion?')
end

--[[
  Look at energy / combo points to see how this works and looks
]]
function OptionBuilder:AddMinMaxCheck(thingUpperCamel, thingPretty, minim, maxim, softMin, softMax, step, bigStep)
  local errPrefix = 'OptionBuilder:AddMinMaxCheck(thingUpperCamel, thingPretty, minim, maxim, softMin, softMax, step, bigStep)'
  pretty_type_error(errPrefix, 'thingUpperCamel', thingUpperCamel, 'string')
  pretty_type_error(errPrefix, 'thingPretty', thingPretty, 'string')
  pretty_type_error(errPrefix, 'minim', minim, 'number')
  pretty_type_error(errPrefix, 'maxim', maxim, 'number')
  pretty_type_error(errPrefix, 'softMin', softMin, 'number')
  pretty_type_error(errPrefix, 'softMax', softMax, 'number')
  pretty_type_error(errPrefix, 'step', step, 'number')
  pretty_type_error(errPrefix, 'bigStep', bigStep, 'number')
  
  return self:AddSimpleToggle('check' .. thingUpperCamel, 
    'Check ' .. string.lower(thingPretty), 
    'Should we check our ' .. string.lower(thingPretty) .. ' before using ' .. string.lower(self.prettyName) .. '?')
  :InfectNext({
    hidden = self:GetDisabledFunction('check' .. thingUpperCamel)
  })
  :AddSimpleToggle('hasMin' .. thingUpperCamel,
    'Have minimum ' .. string.lower(thingPretty),
    'Do we have a minimum ' .. string.lower(thingPretty) .. ' requirement for using ' .. string.lower(self.prettyName) .. '?',
    'enabled', 'check' .. thingUpperCamel)
  :InfectNext({
    hidden = self:GetDisabledFunction('check' .. thingUpperCamel, 'hasMin' .. thingUpperCamel)
  })
  :AddSimpleRange('min' .. thingUpperCamel, 
    'Minimum ' .. string.lower(thingPretty),
    'What is the minimum ' .. string.lower(thingPretty) .. ' to use ' .. string.lower(self.prettyName) .. '?',
    minim, 
    maxim,
    softMin,
    softMax,
    step,
    bigStep,
    'enabled', 'check' .. thingUpperCamel, 'hasMin' .. thingUpperCamel)
  :InfectNext({
    hidden = self:GetDisabledFunction('check' .. thingUpperCamel)
  })
  :AddSimpleToggle('hasMax' .. thingUpperCamel,
    'Have maximum ' .. string.lower(thingPretty),
    'If we have too much ' .. string.lower(thingPretty) .. ', should we avoid using ' .. string.lower(self.prettyName) .. '?',
    'enabled', 'check' .. thingUpperCamel)
  :InfectNext({
    hidden = self:GetDisabledFunction('check' .. thingUpperCamel, 'hasMax' .. thingUpperCamel)
  })
  :AddSimpleRange('max' .. thingUpperCamel,
    'Maximum ' .. string.lower(thingPretty),
    'What is the maximum ' .. string.lower(thingPretty) .. ' to use ' .. string.lower(self.prettyName) .. '?',
    minim,
    maxim,
    softMin,
    softMax,
    step,
    bigStep,
    'enabled', 'check' .. thingUpperCamel, 'hasMax' .. thingUpperCamel)
end

--[[
  Adds necessary widgets for energy check
]]
function OptionBuilder:AddEnergyCheck()
  return self:AddMinMaxCheck('Energy', 'Energy', 0, 160, 0, 160, 1, 1)
end

--[[
  Adds necessary widgets for health percentage check
]]
function OptionBuilder:AddHealthCheck()
  return self:AddMinMaxCheck('HealthPerc', 'Health Percentage', 0, 100, 0, 100, 0.1, 1)
end

--[[
  Adds necessary widgets for combo points check
]]
function OptionBuilder:AddComboPointCheck()
  local me = self
  self:InfectNext({
    disabled = function(oldVal)
      return me:GetDisabledFunction(oldVal, { name = 'requireMaxComboPointsTristate', invert = false } )
    end
  }, 4, 1, false)
  self:AddMinMaxCheck('ComboPoints', 'Combo Points', 0, 6, 0, 6, 1, 1)
  :InfectNext({
    hidden = self:GetDisabledFunction('enabled', 'checkComboPoints')
  })
  self:AddSimpleTristate('requireMaxComboPointsTristate', 
    'Compare to maximum combo points',
    'Require max combo points',
    'Require less than max combo points',
    'Should we compare with maximum combo points rather than use a range?', 
    'enabled', 'checkComboPoints')
  return self
end

function OptionBuilder:AddMultiplierCheck(auraNameUpperCamel, prettyName)
  local cacheSuggestion = self.suggestion
  local me = self
  self:InfectNext({
      disabled = function(oldVal)
        return me:GetDisabledFunction(oldVal, function()
          if cacheSuggestion['multiplierFor' .. auraNameUpperCamel .. 'Tristate'] ~= false then return true end
        end)
      end
    }, 4, 1, false)
    :AddMinMaxCheck(auraNameUpperCamel .. 'Multiplier', prettyName .. ' Multiplier', 0, 6, 0, 6, 0.5, 0.1)
    :InfectNext({
      hidden = self:GetDisabledFunction('enabled', 'check' .. auraNameUpperCamel .. 'Multiplier')
    })
    :AddSimpleTristate('multiplierFor' .. auraNameUpperCamel .. 'Tristate',
    'Compare ' .. string.lower(prettyName) .. '\s multiplier to current',
    'Can improve ' .. string.lower(prettyName) .. '\s multiplier',
    'Won\'t worsen ' .. string.lower(prettyName) .. '\s multiplier',
    'Not all ' .. string.lower(prettyName) .. '\s are made alike; should we compare the multiplier that is currently active to the one we would have if we used ' .. string.lower(prettyName) .. ' right now?',
    'enabled', 'check' .. auraNameUpperCamel .. 'Multiplier')
  return self
end

--[[
  Adds a simple way to look at charges of a spell
]]
function OptionBuilder:AddSpellChargesCheck(spellNameUpperCamel, prettyName, descExt, maxCharges)
  local errPrefix = 'OptionBuilder:AddSpellChargesCheck(spellNameUpperCamel, prettyName, descExt, maxCharges)'
  pretty_type_error(errPrefix, 'spellNameUpperCamel', spellNameUpperCamel, 'string')
  pretty_type_error(errPrefix, 'prettyName', prettyName, 'string')
  pretty_type_error(errPrefix, 'maxCharges', maxCharges, 'number')
  
  return self:AddMinMaxCheck(spellNameUpperCamel .. 'Charges', prettyName .. ' Charges', 0, maxCharges, 0, maxCharges, 1, 1)
end

--[[
  Adds necessary widgets for stealthiness check.
]]
function OptionBuilder:AddStealthCheck()
  return self:AddSimpleTristate('stealthyTristate',
    'Check stealth',
    'Require stealth',
    'Require not stealthed',
    'Should we check if we can use stealth abilities?')
end

--[[
  Adds necessary widgets for combat check.
]]
function OptionBuilder:AddCombatCheck()
  return self:AddSimpleTristate('combatTristate',
    'Check combat',
    'Require combat',
    'Require not in combat',
    'Should we check if we are in combat?')
end

--[[
  Adds necessary widgets for combat check.
]]
function OptionBuilder:AddPoolIfLow()
  return self:AddSimpleToggle('poolIfNeeded',
    'Pool energy if other requirements met',
    'Should we pool energy if all the other requirements are met, but we don\'t have enough energy? Alternatively, we can give lower-priority actions a chance to suggest something'
  )
end

--[[
  Adds necessary widgets for checking information about an auras duration. Allows 
  an optional note after the typical tooltip.
  
  Usage: optionBuilder:AddAuraDurationCheck('Rupture', 'Rupture', 'Otherwise, we\'re going to cut rupture off way early!')
]]
function OptionBuilder:AddAuraDurationCheck(auraNameUpperCamel, prettyName, descExt, maxDuration)
  local errPrefix = 'OptionBuilder:AddAuraDurationCheck(auraNameUpperCamel, prettyName, descExt, maxDuration)'
  pretty_type_error(errPrefix, 'auraNameUpperCamel', auraNameUpperCamel, 'string')
  pretty_type_error(errPrefix, 'prettyName', prettyName, 'string')
  pretty_type_error(errPrefix, 'maxDuration', maxDuration, 'number')
  
  if descExt then 
    descExt = ' ' .. descExt
  else
    descExt = ''
  end
  
  local checkDurName = 'check' .. auraNameUpperCamel .. 'Duration'
  return self:AddSimpleToggle(checkDurName,
    'Check ' .. string.lower(prettyName) .. ' duration',
    'Should we check ' .. string.lower(prettyName) .. '\'s remaining duration before using ' .. string.lower(self.prettyName) .. '?' .. descExt)
  :InfectNext({
    hidden = self:GetDisabledFunction(checkDurName)
  })
  :AddSimpleToggle('hasMinDurationFor' .. auraNameUpperCamel,
    'Have minimum duration for ' .. string.lower(prettyName) .. '?',
    'Should we avoid using ' .. string.lower(self.prettyName) .. ' if ' .. string.lower(prettyName) .. ' is about to wear off?',
    'enabled', checkDurName)
  :InfectNext({
    hidden = self:GetDisabledFunction(checkDurName, 'hasMinDurationFor' .. auraNameUpperCamel)
  })
  :AddSimpleRange('minDurationFor' .. auraNameUpperCamel,
    'Minimum duration for ' .. string.lower(prettyName),
    'What is the minimum duration remaining on ' .. string.lower(prettyName) .. ' to use ' .. string.lower(self.prettyName) .. '? (Use 0 for up)',
    0,
    maxDuration,
    0,
    maxDuration,
    0.05,
    1,
    'enabled', checkDurName, 'hasMinDurationFor' .. auraNameUpperCamel)
  :InfectNext({
    hidden = self:GetDisabledFunction(checkDurName)
  })
  :AddSimpleToggle('hasMaxDurationFor' .. auraNameUpperCamel,
    'Have maximum duration for ' .. string.lower(prettyName),
    'Should we avoid using ' .. string.lower(self.prettyName) .. ' if ' .. string.lower(prettyName) .. ' has a lot of time left?',
    'enabled', checkDurName)
  :InfectNext({
    hidden = self:GetDisabledFunction(checkDurName, 'hasMaxDurationFor' .. auraNameUpperCamel)
  })
  :AddSimpleRange(
    'maxDurationFor' .. auraNameUpperCamel,
    'Maximum duration for ' .. string.lower(prettyName),
    'What is the maximum duration remaining on ' .. string.lower(prettyName) .. ' to use ' .. string.lower(self.prettyName) .. '? (Use 0 for down)',
    0,
    maxDuration,
    0,
    maxDuration,
    0.05,
    1,
    'enabled', checkDurName, 'hasMaxDurationFor' .. auraNameUpperCamel
  )
end

--[[
  Adds necessary widgets for checking information about a spells cooldown, and 
  an optional note in addition to the standard tooltip.
  
  Usage: optionBuilder:AddSpellCooldownCheck('ShadowofDeath', 'Shadow of Death', nil, 35)
]]
function OptionBuilder:AddSpellCooldownCheck(spellNameUpperCamel, prettyName, descExt, maxCd)
  local errPrefix = 'OptionBuilder:AddSpellCooldownCheck(spellNameUpperCamel, prettyName, descExt, maxCd)'
  pretty_type_error(errPrefix, 'spellNameUpperCamel', spellNameUpperCamel, 'string')
  pretty_type_error(errPrefix, 'prettyName', prettyName, 'string')
  pretty_type_error(errPrefix, 'maxCd', maxCd, 'number')
  
  if descExt then 
    descExt = ' ' .. descExt
  else
    descExt = ''
  end
  
  local checkCdName = 'check' .. spellNameUpperCamel .. 'Cooldown'
  
  return self:AddSimpleToggle(checkCdName,
    'Check ' .. string.lower(prettyName) .. '\'s cooldown',
    'Should we check ' .. string.lower(prettyName) .. '\'s cooldown before using ' .. string.lower(self.prettyName) .. '?' .. descExt)
  :InfectNext({
    hidden = self:GetDisabledFunction(checkCdName)
  })
  :AddSimpleToggle('hasMinCooldownRemFor' .. spellNameUpperCamel,
    'Have minimum cd for ' .. string.lower(prettyName),
    'Should we avoid using ' .. string.lower(self.prettyName) .. ' unless ' .. string.lower(prettyName) .. ' has a cooldown? (Use 0 for at least some cooldown)')
  :InfectNext({
    hidden = self:GetDisabledFunction(checkCdName, 'hasMinCooldownRemFor' .. spellNameUpperCamel)
  })
  :AddSimpleRange('minCooldownRemFor' .. spellNameUpperCamel,
    'Minimum cd for ' .. string.lower(prettyName),
    'What is the minimum cooldown remaining on ' .. string.lower(prettyName) .. ' to use ' .. string.lower(self.prettyName) .. '? (Use 0 for atleast some)',
    0,
    maxCd,
    0,
    maxCd,
    0.05,
    1,
    'enabled', checkCdName, 'hasMinCooldownRemFor' .. spellNameUpperCamel)
  :InfectNext({
    hidden = self:GetDisabledFunction(checkCdName)
  })
  :AddSimpleToggle('hasMaxCooldownRemFor' .. spellNameUpperCamel,
    'Have maximum cd for ' .. string.lower(prettyName),
    'Should we avoid using ' .. string.lower(self.prettyName) .. ' when there is a cooldown left on ' .. string.lower(prettyName) .. '?',
    'enabled', checkCdName)
  :InfectNext({
    hidden = self:GetDisabledFunction(checkCdName, 'hasMaxCooldownRemFor' .. spellNameUpperCamel)
  })
  :AddSimpleRange('maxCooldownRemFor' .. spellNameUpperCamel,
    'Maximum cd for ' .. string.lower(prettyName),
    'What is the maximum cooldown remaining on ' .. string.lower(prettyName) .. ' to use ' .. string.lower(self.prettyName) .. '? (Use 0 for none)',
    0,
    maxCd,
    0,
    maxCd,
    0.05,
    1,
    'enabled', checkCdName, 'hasMaxCooldownRemFor' .. spellNameUpperCamel)
end

--[[
  Add priority, combat check, stealth check, energy check, pool if low, combo 
  point check, every applicable spell cooldown and charges check, and every 
  applicable aura duration check.
]]
function OptionBuilder:AddAll(spells, _auras)
  local errPrefix = 'OptionBuilder:AddConfigForSuggestion(spells, _auras)'
  pretty_type_error(errPrefix, 'spells', spells, 'table')
  pretty_type_error(errPrefix, '_auras', _auras, 'table')

  local result = self:AddEnabled()
    :AddPriority()
    :AddIsMain()
    :AddCombatCheck()
    :AddStealthCheck()
    :AddEnergyCheck()
    :AddPoolIfLow()
    :AddComboPointCheck()
    :AddHealthCheck()
    
  for key, spell in pairs(spells) do 
    if spell.max_cd > 1 then 
      result:AddSpellCooldownCheck(key, spell.name, nil, spell.max_cd)
    end
    if spell.max_charges then 
      result:AddSpellChargesCheck(key, spell.name, nil, spell.max_charges)
    end
  end
  
  for key, aura in pairs(_auras) do
    if aura.max_duration > 1 then 
      result:AddAuraDurationCheck(key, aura.name, nil, aura.max_duration)
    end
    if aura.has_multiplier then 
      result:AddMultiplierCheck(key, aura.name)
    end
  end
  
  return result
end

function OptionBuilder:Build()
  if self.infectionTable then 
    error('InfectNext called without matching widget!', 2)
  end
  
  local final = {
    name = self.prettyName,
    type = 'group',
    order = self.order,
    args = {}
  }
  
  for i = 1, #self.result do 
    final.args['param' .. tostring(i)] = self.result[i]
  end
  
  
  return final
end

local function insert_aura_duration_defaults(defaults, auraNameUpperCamel)
  defaults['check' .. auraNameUpperCamel .. 'Duration'] = false
  defaults['hasMinDurationFor' .. auraNameUpperCamel] = false
  defaults['minDurationFor' .. auraNameUpperCamel] = 1
  defaults['hasMaxDurationFor' .. auraNameUpperCamel] = false
  defaults['maxDurationFor' .. auraNameUpperCamel] = 1
end

local function insert_spell_cooldown_defaults(defaults, spellNameUpperCamel)
  defaults['checks' .. spellNameUpperCamel .. 'Cooldown'] = false
  defaults['hasMinCooldownRemFor' .. spellNameUpperCamel] = false
  defaults['minCooldownRemFor' .. spellNameUpperCamel] = 1
  defaults['hasMaxCooldownRemFor' .. spellNameUpperCamel] = false
  defaults['maxCooldownRemFor' .. spellNameUpperCamel] = 1
end

local function insert_minmax_defaults(defaults, nameUpperCamel)
  defaults['checks' .. nameUpperCamel] = false
  defaults['hasMin' .. nameUpperCamel] = false
  defaults['min' .. nameUpperCamel] = 1
  defaults['hasMax' .. nameUpperCamel] = false
  defaults['max' .. nameUpperCamel] = 1
end

--[[
  Gets defaults where everything except enabled 
  is false
]]
local function get_all_false_defaults(spells, _auras)
  -- _auras to avoid confusion with the global auras 
  local result = {
    enabled = true,
    poolIfNeeded = false,
    stealthyTristate = false,
    combatTristate = false,
    isMain = true,
    requireMaxComboPointsTristate = false
  }
  
  insert_minmax_defaults(result, 'Energy')
  insert_minmax_defaults(result, 'ComboPoints')
  insert_minmax_defaults(result, 'HealthPerc')
  
  for key, spell in pairs(spells) do
    if spell.max_cd > 1 then 
      insert_spell_cooldown_defaults(result, key)
    end
    if spell.max_charges then 
      insert_minmax_defaults(result, key .. 'Charges')
    end
  end
  
  for key, aura in pairs(_auras) do
    if aura.max_duration > 1 then 
      insert_aura_duration_defaults(result, key)
    end
    if aura.has_multiplier then 
      insert_minmax_defaults(result, key .. 'Multiplier')
      result['multiplierFor' .. key .. 'Tristate'] = false
    end
  end
  
  return result
end

local function insert_general_spell_options(args, spellCfg, profile, spells, _auras)
  args['deleteLastOption'] = {
    type = 'execute',
    name = 'Delete last option',
    desc = 'Delete the last option. REQUIRES RELOAD',
    order = 1,
    disabled = function()
      return (#spellCfg.suggestions < 1)
    end,
    func = function()
      table.remove(spellCfg.suggestions)
      ReloadUI()
    end
  }
  args['addNewOption'] = {
    type = 'execute',
    name = 'Add new option',
    desc = 'Add a new option. REQUIRES RELOAD',
    order = 2,
    func = function() 
      local defaults = get_all_false_defaults(spells, _auras)
      
      defaults.priority = 2001
      table.insert(spellCfg.suggestions, defaults)
      
      for i=1, 2000 do 
        if Torpedo:TrySetPriority(profile, defaults, i, true) then break end
      end
      
      ReloadUI()
    end
  }
end

local function build_profile_options(profile, order, spells, _auras)
  local result = {
    type = 'group',
    order = order,
    name = profile.name,
    args = {}
  }
  
  for debugName, spellCfg in pairs(profile.spells) do 
    local tmp = {
      name = spellCfg.name,
      type = 'group',
      order = spellCfg.order,
      args = {}
    }
    insert_general_spell_options(tmp.args, spellCfg, profile, spells, _auras)
    for suggNum, suggCfg in ipairs(spellCfg.suggestions) do 
      tmp.args['sugg' .. tostring(suggNum)] = OptionBuilder:New(profile, suggCfg, spellCfg.name, suggNum):AddAll(spells, _auras):Build()
      tmp.args['sugg' .. tostring(suggNum)].name = 'Option ' .. tostring(suggNum)
    end
    
    result.args[debugName] = tmp
  end
  
  return result
end

local function build_options_table(cfg)
  return {
    name = 'Torpedo',
    handler = Torpedo,
    type = 'group',
    args = {
      assassination = build_profile_options(cfg.profile.assassination, 1, assass_spells, assass_auras),
      subtlety = build_profile_options(cfg.profile.subtlety, 2, subtlety_spells, subtlety_auras)
    }
  }
end

local REALLY_WANT_NIL = 'i really want nil'
local defaults = {
  profile = {
    assassination = {
      name = 'Assassination',
      spells = {
        stealth = {
          name = 'Stealth',
          spellDebugName = 'Stealth',
          order = 1,
          suggestions = {
            {
              priority = 1000,
              isMain = true,
              stealthyTristate = REALLY_WANT_NIL,
              combatTristate = REALLY_WANT_NIL
            }
          }
        },
        deadlyPoison = {
          name = 'Deadly Poison',
          spellDebugName = 'DeadlyPoison',
          order = 2,
          suggestions = {
            {
              priority = 995,
              isMain = true,
              combatTristate = REALLY_WANT_NIL,
              checkDeadlyPoisonDuration = true,
              hasMaxDurationForDeadlyPoison = true,
              maxDurationForDeadlyPoison = 600
            },
            {
              priority = 994,
              isMain = true,
              checkDeadlyPoisonDuration = true,
              hasMaxDurationForDeadlyPoison = true,
              maxDurationForDeadlyPoison = 0
            }
          }
        },
        rupture = {
          name = 'Rupture',
          spellDebugName = 'Rupture',
          order = 3,
          suggestions = {
            {
              priority = 900,
              isMain = true,
              checkRuptureDuration = true,
              hasMaxDurationForRupture = true,
              maxDurationForRupture = 7,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              poolIfNeeded = true,
              checkRuptureMultiplier = true,
              multiplierForRuptureTristate = REALLY_WANT_NIL
            },
            {
              priority = 899,
              isMain = true,
              checkRuptureDuration = true,
              hasMaxDurationForRupture = true,
              maxDurationForRupture = 0,
              checkEnergy = true,
              hasMaxEnergy = true,
              maxEnergy = 60,
              hasMinEnergy = true,
              minEnergy = 25,
              poolIfNeeded = true,
              checkComboPoints = true,
              hasMinComboPoints = true,
              minComboPoints = 2
            },
            {
              priority = 898,
              isMain = true,
              checkRuptureMultiplier = true,
              multiplierForRuptureTristate = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              poolIfNeeded = true
            },
            {
              priority = 897,
              isMain = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              poolIfNeeded = true,
              checkExsanguinateCooldown = true,
              hasMaxCooldownRemForExsanguinate = true,
              maxCooldownRemForExsanguinate = 0
            }
          }
        },
        envenom = {
          name = 'Envenom',
          spellDebugName = 'Envenom',
          order = 4,
          suggestions = {
            {
              priority = 895,
              isMain = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 55,
              poolIfNeeded = true,
              checkEnvenomDuration = true,
              hasMaxDurationForEnvenom = true,
              maxDurationForEnvenom = 2
            },
            {
              priority = 894,
              isMain = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 100,
              poolIfNeeded = false
            }
          }
        },
        garrote = {
          name = 'Garrote',
          spellDebugName = 'Garrote',
          order = 5,
          suggestions = {
            {
              priority = 800,
              isMain = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = REALLY_WANT_NIL,
              checkGarroteDuration = true,
              hasMaxDurationForGarrote = true,
              maxDurationForGarrote = 6,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 45,
              poolIfNeeded = true,
              checkGarroteCooldown = true,
              hasMaxCooldownRemForGarrote = true,
              maxCooldownRemForGarrote = 0,
              checkGarroteMultiplier = true,
              multiplierForGarroteTristate = REALLY_WANT_NIL
            }
          }
        },
        hemorrhage = {
          name = 'Hemorrhage',
          spellDebugName = 'Hemorrhage',
          order = 6,
          suggestions = {
            {
              priority = 795,
              isMain = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = REALLY_WANT_NIL,
              checkHemorrhageDuration = true,
              hasMaxDurationForHemorrhage = true,
              maxDurationForHemorrhage = 6,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 30,
              poolIfNeeded = true
            }
          }
        },
        mutilate = {
          name = 'Mutilate',
          spellDebugName = 'Mutilate',
          order = 7,
          suggestions = {
            {
              priority = 790,
              isMain = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 55,
              poolIfNeeded = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = REALLY_WANT_NIL,
              checkRuptureDuration = true,
              hasMaxDurationForRupture = true,
              maxDurationForRupture = 6
            },
            {
              priority = 750,
              isMain = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 75,
              poolIfNeeded = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = REALLY_WANT_NIL
            }
          }
        },
        vendetta = {
          name = 'Vendetta',
          spellDebugName = 'Vendetta',
          order = 8,
          suggestions = {
            {
              priority = 1000,
              isMain = false,
              checkVendettaCooldown = true,
              hasMaxCooldownRemForVendetta = true,
              maxCooldownRemForVendetta = 0,
              checkVanishCooldown = true,
              hasMaxCooldownRemForVanish = true,
              maxCooldownRemForVanish = 0,
              checkExsanguinateCooldown = true,
              hasMaxCooldownRemForExsanguinate = true,
              maxCooldownRemForExsanguinate = 0,
              stealthyTristate = REALLY_WANT_NIL,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              checkRuptureMultiplier = true,
              hasMaxRuptureMultiplier = true,
              maxRuptureMultiplier = 1,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true
            }
          }
        },
        vanish = {
          name = 'Vanish',
          spellDebugName = 'Vanish',
          order = 9,
          suggestions = {
            {
              priority = 900,
              isMain = false,
              checkVanishCooldown = true,
              hasMaxCooldownRemForVanish = true,
              maxCooldownRemForVanish = 0,
              checkExsanguinateCooldown = true,
              hasMaxCooldownRemForExsanguinate = true,
              maxCooldownRemForExsanguinate = 0,
              stealthyTristate = REALLY_WANT_NIL,
              checkVendettaDuration = true,
              hasMinDurationForVendetta = true,
              minDurationForVendetta = 0,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true
            }
          }
        },
        exsanguinate = {
          name = 'Exsanguinate',
          spellDebugName = 'Exsanguinate',
          order = 10,
          suggestions = {
            {
              priority = 800,
              isMain = false,
              checkExsanguinateCooldown = true,
              hasMaxCooldownRemForExsanguinate = true,
              maxCooldownRemForExsanguinate = 0,
              checkVanishCooldown = true,
              hasMinCooldownRemForVanish = true,
              minCooldownRemFor = 3,
              checkVendettaCooldown = true,
              hasMinCooldownRemForVendetta = true,
              minCooldownRemForVendetta = 3,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              checkRuptureDuration = true,
              hasMinDurationForRupture = true,
              minDurationForRupture = 24
            }
          }
        },
        crimsonVial = {
          name = 'Crimson Vial',
          spellDebugName = 'CrimsonVial',
          order = 11,
          suggestions = {
            {
              enabled = false,
              priority = 1005,
              isMain = false,
              checkHealthPerc = true,
              hasMaxHealthPerc = true,
              maxHealthPerc = 70,
              checkCrimsonVialCooldown = true,
              hasMaxCooldownRemForCrimsonVial = true,
              maxCooldownRemForCrimsonVial = 0,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 30,
              poolIfNeeded = true
            }
          }
        }
      }
    },
    subtlety = {
      name = 'Subtlety',
      spells = {
        stealth = {
          name = 'Stealth',
          spellDebugName = 'Stealth',
          order = 1,
          suggestions = {
            {
              priority = 1000,
              isMain = true,
              stealthyTristate = REALLY_WANT_NIL,
              combatTristate = REALLY_WANT_NIL
            }
          }
        },
        symbolsOfDeath = {
          name = 'Symbols of Death',
          spellDebugName = 'SymbolsofDeath',
          order = 2,
          suggestions = {
            {
              priority = 995,
              isMain = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 35,
              poolIfNeeded = true,
              stealthyTristate = true,
              checkSymbolsofDeathDuration = true,
              hasMaxDurationForSymbolsofDeath = true,
              maxDurationForSymbolsofDeath = 5,
              checkSymbolsofDeathCooldown = true,
              hasMaxCooldownRemForSymbolsofDeath = true,
              maxCooldownRemForSymbolsofDeath = 0
            }
          }
        },
        nightblade = {
          name = 'Nightblade',
          spellDebugName = 'Nightblade',
          order = 3,
          suggestions = {
            {
              priority = 900,
              isMain = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              poolIfNeeded = true,
              checkComboPoints = true,
              hasMinComboPoints = true,
              minComboPoints = 5,
              checkNightbladeDuration = true,
              hasMaxDurationForNightblade = true,
              maxDurationForNightblade = 5
            }
          }
        },
        eviscerate = {
          name = 'Eviscerate',
          spellDebugName = 'Eviscerate',
          order = 4,
          suggestions = {
            {
              priority = 895,
              isMain = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 35,
              poolIfNeeded = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = true
            }
          }
        },
        shadowstrike = {
          name = 'Shadowstrike',
          spellDebugName = 'Shadowstrike',
          order = 5,
          suggestions = {
            {
              priority = 800,
              isMain = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 40,
              poolIfNeeded = true,
              stealthyTristate = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = REALLY_WANT_NIL
            }
          }
        },
        backstab = {
          name = 'Backstab',
          spellDebugName = 'Backstab',
          order = 6,
          suggestions = {
            {
              priority = 795,
              isMain = true,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 35,
              poolIfNeeded = true,
              checkComboPoints = true,
              requireMaxComboPointsTristate = REALLY_WANT_NIL,
              stealthyTristate = REALLY_WANT_NIL
            }
          }
        },
        shadowBlades = {
          name = 'Shadow Blades',
          spellDebugName = 'ShadowBlades',
          order = 7,
          suggestions = {
            {
              priority = 1000,
              isMain = false,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 50,
              checkComboPoints = true,
              hasMaxComboPoints = true,
              maxComboPoints = 1,
              checkShadowBladesCooldown = true,
              hasMaxCooldownRemForShadowBlades = true,
              maxCooldownRemForShadowBlades = 0
            }
          }
        },
        vanish = {
          name = 'Vanish',
          spellDebugName = 'Vanish',
          order = 8,
          suggestions = {
            {
              priority = 900,
              isMain = false,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              stealthyTristate = REALLY_WANT_NIL,
              checkVanishCooldown = true,
              hasMaxCooldownRemForVanish = true,
              maxCooldownRemForVanish = 0,
              checkComboPoints = true,
              hasMaxComboPoints = true,
              maxComboPoints = 1
            }
          }
        },
        shadowDance = {
          name = 'Shadow Dance',
          spellDebugName = 'ShadowDance',
          order = 9,
          suggestions = {
            {
              priority = 800,
              isMain = false,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              stealthyTristate = REALLY_WANT_NIL,
              checkShadowDanceCharges = true,
              hasMinShadowDanceCharges = true,
              minShadowDanceCharges = 2,
              checkEnergy = true,
              hasMaxEnergy = true,
              maxEnergy = 110
            },
            {
              priority = 795,
              isMain = false,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 25,
              stealthyTristate = REALLY_WANT_NIL,
              checkSymbolsofDeathDuration = true,
              hasMaxDurationForSymbolsofDeath = true,
              maxDurationForSymbolsofDeath = 11,
              checkSymbolsofDeathCooldown = true,
              hasMaxCooldownRemForSymbolsofDeath = true,
              maxCooldownRemForSymbolsofDeath = 0,
              checkShadowDanceCooldown = true,
              hasMaxCooldownRemForShadowDance = true,
              maxCooldownRemForShadowDance = 0
            }
          }
        },
        crimsonVial = {
          name = 'Crimson Vial',
          spellDebugName = 'CrimsonVial',
          order = 10,
          suggestions = {
            {
              enabled = false,
              priority = 1005,
              isMain = false,
              checkHealthPerc = true,
              hasMaxHealthPerc = true,
              maxHealthPerc = 70,
              checkCrimsonVialCooldown = true,
              hasMaxCooldownRemForCrimsonVial = true,
              maxCooldownRemForCrimsonVial = 0,
              checkEnergy = true,
              hasMinEnergy = true,
              minEnergy = 30,
              poolIfNeeded = true
            }
          }
        }
      }
    }
  }
}

-- Fill in blanks in defaults --
local blanks = get_all_false_defaults(subtlety_spells, subtlety_auras)
for _, spell in pairs(defaults.profile.subtlety.spells) do 
  for _, sugg in pairs(spell.suggestions) do 
    for k,v in pairs(blanks) do 
      if sugg[k] == nil then sugg[k] = v
      elseif sugg[k] == REALLY_WANT_NIL then sugg[k] = nil end 
    end
  end
end

blanks = get_all_false_defaults(assass_spells, assass_auras)
for key, spell in pairs(defaults.profile.assassination.spells) do 
  for _, sugg in pairs(spell.suggestions) do 
    for k,v in pairs(blanks) do 
      if sugg[k] == nil then sugg[k] = v
      elseif sugg[k] == REALLY_WANT_NIL then sugg[k] = nil end 
    end
  end
end


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

function Torpedo:TrySetPriority(profile, suggestion, val, optSuppressMessage)
  local errPrefix = 'Torpedo:TrySetPriority(profile, suggestion, val)'
  pretty_type_error(errPrefix, 'profile', profile, 'table')
  pretty_type_error(errPrefix, 'suggestion', suggestion, 'table')
  pretty_type_error(errPrefix, 'val', val, 'number')
  
  for _, spellCfg in pairs(profile.spells) do 
    for suggNum, sugg in ipairs(spellCfg.suggestions) do 
      if sugg.isMain == suggestion.isMain and sugg.priority == val then 
        if not optSuppressMessage then 
          message('Priority conflict: ' .. tostring(spellCfg.name) .. ' suggestion ' .. tostring(sugNum) .. ' already has that priority (' .. val .. ') - all suggestions for the same location must have different priorities')
        end
        return false
      end
    end
  end
  
  suggestion.priority = val
  self:PLAYER_SPECIALIZATION_CHANGED('player')
  return true
end

-- Utility functions -- 

local stealthy_Auras = {
  Aura:new(1784, 'player', 1, 'Stealth'), 
  Aura:new(11327, 'player', 3, 'Vanish'), 
  Aura:new(115191, 'player', 1, 'Stealth'),
  Aura:new(115192, 'player', 2, 'Subterfuge'),
  Aura:new(51713, 'player', 5, 'Shadow Dance'),
  Aura:new(185422, 'player', 5, 'Shadow Dance')}

local stealthy = false

local function full_stealthy_check()
  stealthy = false
  for i=1, #stealthy_Auras do 
    if stealthy_Auras[i]:up() then
      stealthy = true
      break
    end
  end
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
    if eventType == 'SPELL_CAST_SUCCESS' then 
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

local function check_combat(cfg)
  if cfg.combatTristate == false then return true end
  
  local inCombat = InCombatLockdown()
  
  if (cfg.combatTristate == true) and (not inCombat) then return false end
  if (cfg.combatTristate == nil) and inCombat then return false end
  
  return true
end

local function check_energy(cfg)
  if not cfg.checkEnergy then return true end 
  
  local energy = UnitPower('player')
  if cfg.hasMinEnergy and (energy < cfg.minEnergy) then return false, true end
  if cfg.hasMaxEnergy and (energy > cfg.maxEnergy) then return false, false end
  
  return true
end

local function check_combo_points(cfg)
  if not cfg.checkComboPoints then return true end 
  
  local maxCPTri = cfg.requireMaxComboPointsTristate
  
  local comboPoints = GetComboPoints('player', 'target')
  if maxCPTri ~= false then 
    if (maxCPTri == true) and (comboPoints < max_usable_combo_points()) then return false end
    if (maxCPTri == nil) and (comboPoints >= max_usable_combo_points()) then return false end
  else 
    if cfg.hasMinComboPoints and (comboPoints < cfg.minComboPoints) then return false end
    if cfg.hasMaxComboPoints and (comboPoints > cfg.maxComboPoints) then return false end
  end
  
  return true
end

local function check_stealth(cfg)
  if cfg.stealthyTristate == false then return true end
  
  local oocStealth = auras.Stealth:up()  
  local combStealth = oocStealth or stealthy
  
  if (cfg.stealthyTristate == true) and (not combStealth) then return false end
  if (cfg.stealthyTristate == nil) and combStealth then return false end
  
  return true
end

local function check_health_perc(cfg)
  if not cfg.checkHealthPerc then return true end
  
  local health = UnitHealth('player')
  local maxHealth = UnitHealthMax('player')
  local healthPerc = (health / maxHealth) * 100
  
  if cfg.hasMinHealthPerc and (healthPerc < cfg.minHealthPerc) then return false end
  if cfg.hasMaxHealthPerc and (healthPerc > cfg.maxHealthPerc) then return false end
  
  return true
end

local function check_aura_duration(cfg, auraNameUpperCamel)
  if not cfg['check' .. auraNameUpperCamel .. 'Duration'] then return true end 
  
  local aura = auras[auraNameUpperCamel]
  local auraRem = aura:remaining()
  
  if cfg['hasMinDurationFor' .. auraNameUpperCamel] then
    local minDuration = cfg['minDurationFor' .. auraNameUpperCamel]
    if auraRem < minDuration then return false end
  end
  
  if cfg['hasMaxDurationFor' .. auraNameUpperCamel] then
    local maxDuration = cfg['maxDurationFor' .. auraNameUpperCamel]
    if auraRem > maxDuration then return false end
  end
  
  return true
end

local function check_aura_multiplier(cfg, auraNameUpperCamel)
  local extension = auraNameUpperCamel .. 'Multiplier'
  if not cfg['check' .. extension] then return true end
  
  local aura = auras[auraNameUpperCamel]
  local multiplier = 0
  if aura:up() then
    multiplier = aura.multiplier or 1
  end
  
  local tristate = cfg['multiplierFor' .. auraNameUpperCamel .. 'Tristate']
  if tristate ~= false then 
    local newMultiplier = bleed_multiplier()
    if (tristate == true) and (newMultiplier <= multiplier) then return false
    elseif (tristate == nil) and (newMultiplier < multiplier) then return false end
  else
    if (cfg['hasMin' .. extension]) and (multiplier < cfg['min' .. extension]) then return false end
    if (cfg['hasMax' .. extension]) and (multiplier > cfg['max' .. extension]) then return false end
  end
  return true
end

local function check_auras(cfg, _auras)
  for key, aura in pairs(_auras) do
    if aura.max_duration > 1 then 
      if not check_aura_duration(cfg, key) then return false end
    end
    if aura.has_multiplier then 
      if not check_aura_multiplier(cfg, key) then return false end
    end
  end
  
  return true
end

local function check_spell_cooldown(cfg, spell, maxCd, spellNameUpperCamel)
  if not cfg['check' .. spellNameUpperCamel .. 'Cooldown'] then return true end
  
  local cdStart, cdDuration = GetSpellCooldown(spell.spell_id)
  local cdRemaining = 0
  if cdDuration == maxCd then 
    cdRemaining = cdStart + cdDuration - GetTime()
    if cdRemaining <= 0 then cdRemaining = 0.01 end -- It's all a lie!
  end
  
  if cfg['hasMinCooldownRemFor' .. spellNameUpperCamel] then 
    if cdRemaining < cfg['minCooldownRemFor' .. spellNameUpperCamel] then return false end
  end
  if cfg['hasMaxCooldownRemFor' .. spellNameUpperCamel] then 
    if cdRemaining > cfg['maxCooldownRemFor' .. spellNameUpperCamel] then return false end
  end
  
  return true
end

local function check_spell_charges(cfg, spell, spellNameUpperCamel)
  if not cfg['check' .. spellNameUpperCamel .. 'Charges'] then return true end
  
  local charges, maxCharges, start, duration = GetSpellCharges(spell.spell_id)
  
  if cfg['hasMin' .. spellNameUpperCamel .. 'Charges'] then 
    local minCharges = cfg['min' .. spellNameUpperCamel .. 'Charges']
    if charges < minCharges then return false end
  end
  
  if cfg['hasMax' .. spellNameUpperCamel .. 'Charges'] then 
    local maxCharges = cfg['max' .. spellNameUpperCamel .. 'Charges']
    if charges > maxCharges then return false end
  end
  
  return true
end

local function check_spells(cfg, spells)
  for key, val in pairs(spells) do
    if not check_spell_cooldown(cfg, val, val.max_cd, key) then return false end
    if val.max_charges then 
      if not check_spell_charges(cfg, val, key) then return false end
    end
  end
  
  return true
end

local function suggestion_delegate(cfg, spells, _auras, spell)
  if not cfg.enabled then return end
  if not check_combat(cfg) then return end
  if not check_stealth(cfg) then return end
  if not check_combo_points(cfg) then return end
  if not check_auras(cfg, _auras) then return end
  if not check_spells(cfg, spells) then return end
  if not check_health_perc(cfg) then return end
  local madeEnergyReq, energyTooLow = check_energy(cfg)
  if (not madeEnergyReq) and (not energyTooLow) then return end
  if not madeEnergyReq then
    if cfg.poolIfNeeded then return pool_energy_sugg else return end
  end
  
  return spell
end

local function create_ais(controller, profile, main, spells, _auras)
  for _, spellCfg in pairs(profile.spells) do
    local spell = spells[spellCfg.spellDebugName]
    
    for suggNum, suggCfg in ipairs(spellCfg.suggestions) do 
      if suggCfg.isMain == main then 
        controller:RegisterSuggestion(suggCfg.priority, function(self, db)
          return suggestion_delegate(suggCfg, spells, _auras, spell)
        end)
      end
    end
  end
end

local function initialize_profile(profile, spells, _auras)
  ai_main = TorpedoAI:New()
  create_ais(ai_main, profile, true, spells, _auras)
  
  ai_cd = TorpedoAI:New()
  create_ais(ai_cd, profile, false, spells, _auras)
end

local function initialize(db)
  local _, _, classIndex = UnitClass('player')
  
  if classIndex ~= 4 then -- (if we're not a rogue)
    return
  end
  
  if is_assassination then
    initialize_profile(db.profile.assassination, assass_spells, assass_auras)
    ai_ready = true
  elseif is_subtlety then
    initialize_profile(db.profile.subtlety, subtlety_spells, subtlety_auras)
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

local lastUpdate = -1
function Torpedo:TimerTick()
	if not ai_main or not ai_cd or not ai_ready then
		counter = 0
    lastUpdate = -1   
		return 
	end
  
  --[[local the_time = GetTime()
  if lastUpdate ~= -1 then 
    local timeSinceLast = the_time - lastUpdate
    
    if timeSinceLast > 0.10 then 
      self:Print('WARNING! Long time since last update: ' .. tostring(timeSinceLast))
    end
  end--
  lastUpdate = the_time]]
  
  full_stealthy_check()
  
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
  
  LibStub('AceConfig-3.0'):RegisterOptionsTable('Torpedo', build_options_table(self.db))
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
  self:ScheduleRepeatingTimer('TimerTick', 0.05, self)
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
    update_auras_for_unit('player')
    full_stealthy_check()
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