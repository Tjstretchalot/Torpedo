local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local OptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')

local MAJOR, MINOR = 'TorpedoSuggestions-1.0', 1
local TorpedoSuggestions = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoSuggestions then return end

function TorpedoSuggestions:New(o)
  Utils:CheckTypes({spell = 'table', primary = 'boolean'}, o)
  
  setmetatable(o, self)
  self.__index = self
  
  o:__Init()
  return o
end

local function __AddMinMaxOptions(self, name)
  self['check' .. name] = false
  self['hasMin' .. name] = false
  self['min' .. name] = 0
  self['hasMax' .. name] = false
  self['max' .. name] = 0
end

function TorpedoSuggestions:__Init()
  self.auras = self.auras or {}
  self.cooldowns = self.cooldowns or {}
  
  self.enabled = self.enabled or false
  self.priority = self.priority or Constants.PRIORITY_DEFAULT
  self.poolEnergyIfLow = false
  self.require_stealthed = false
  self.require_not_stealthed = false
  __AddMinMaxOptions(self, 'Energy')
  __AddMinMaxOptions(self, 'ComboPoints')
  __AddMinMaxOptions(self, 'HealthPerc')
end

function TorpedoSuggestions:RegisterAura(aura)
  __AddMinMaxOptions(self, 'DurationOf' .. aura.debugName)
  table.insert(self.auras, aura)
end

function TorpedoSuggestions:RegisterCooldown(spell)
  if spell.cooldown then 
    __AddMinMaxOptions(self, 'CooldownFor' .. spell.debugName)
    table.insert(self.cooldowns, spell)
  else
    error('Attempt to register cooldown for a spell (' .. tostring(spell.name) .. ') with no cooldown', 2)
  end
  
  if spell.charges then 
    __AddMinMaxOptions(self, 'ChargesFor' .. spell.debugName)
  end
end

function TorpedoSuggestions:Validator(config, varName, val)
  config[varName] = val
  return true
end

function TorpedoSuggestions:CreateOptions(optionName, order, rebuild_opt_func, remove_sugg_func)
  local me = self
  local result = OptionsBuilder:New(self, order)
    :SetValidator(function(config, varName, val)
      return me:Validator(config, varName, val)
    end)
    :AddCustom({
      type = 'execute',
      name = Constants.REMOVE_SUGGESTION_NAME,
      desc = Constants.REMOVE_SUGGESTION_DESC,
      func = function()
        remove_sugg_func()
        rebuild_opt_func()
      end
    })
    :AddToggle('enabled', 'Enable', Constants.ENABLE_DESC)
    :Nest('enabled', false, true)
    :AddToggle('primary', 'Primary', Constants.PRIMARY_DESC)
    :AddRange('priority', 'Priority', Constants.PRIORITY_DESC, Constants.PRIORITY_MIN, 
              Constants.PRIORITY_MAX, Constants.PRIORITY_SOFTMIN, Constants.PRIORITY_SOFTMAX, 
              Constants.PRIORITY_STEP, Constants.PRIORITY_BIGSTEP)
    :AddToggle('require_stealthed', 'Require stealthed', Constants.REQUIRE_STEALTHED_DESC)
    :AddToggle('require_not_stealthed', 'Require not stealthed', Constants.REQUIRE_NOT_STEALTHED_DESC)
    :AddToggle('require_combat', 'Require combat', Constants.REQUIRE_COMBAT_DESC)
    :AddToggle('require_no_combat', 'Require not in combat', Constants.REQUIRE_NOT_COMBAT_DESC)
    :AddMinMaxCheck('Energy', 'Energy', Constants.ENERGY_CHECK_DESC, Constants.ENERGY_HAVE_MINIMUM_DESC,
                    Constants.ENERGY_MINIMUM_DESC, Constants.ENERGY_HAVE_MAXIMUM_DESC, 
                    Constants.ENERGY_MAXIMUM_DESC, Constants.ENERGY_MIN, Constants.ENERGY_MAX,
                    Constants.ENERGY_SOFTMIN, Constants.ENERGY_SOFTMAX, Constants.ENERGY_STEP,
                    Constants.ENERGY_BIGSTEP)
    :Nest('checkEnergy', true, true)
    :Nest('hasMinEnergy', true, true)
    :AddToggle('poolEnergyIfLow', 'Pool energy if low', Constants.ENERGY_POOL_DESC)
    :Unnest()
    :Unnest()
    :AddMinMaxCheck('ComboPoints', 'Combo Points', Constants.COMBO_POINTS_CHECK_DESC, 
                    Constants.COMBO_POINTS_HAVE_MINIMUM_DESC,
                    Constants.COMBO_POINTS_MINIMUM_DESC, Constants.COMBO_POINTS_HAVE_MAXIMUM_DESC, 
                    Constants.COMBO_POINTS_MAXIMUM_DESC, 
                    Constants.COMBO_POINTS_MIN, Constants.COMBO_POINTS_MAX,
                    Constants.COMBO_POINTS_SOFTMIN, Constants.COMBO_POINTS_SOFTMAX, Constants.COMBO_POINTS_STEP, Constants.COMBO_POINTS_BIGSTEP)
    :AddMinMaxCheck('HealthPerc', 'Health Percentage', Constants.HEALTH_PERC_CHECK_DESC, 
                    Constants.HEALTH_PERC_HAVE_MINIMUM_DESC,
                    Constants.HEALTH_PERC_MINIMUM_DESC, Constants.HEALTH_PERC_HAVE_MAXIMUM_DESC, 
                    Constants.HEALTH_PERC_MAXIMUM_DESC, 
                    Constants.HEALTH_PERC_MIN, Constants.HEALTH_PERC_MAX,
                    Constants.HEALTH_PERC_SOFTMIN, Constants.HEALTH_PERC_SOFTMAX, Constants.HEALTH_PERC_STEP, Constants.HEALTH_PERC_BIGSTEP)
  
  for i=1, #self.cooldowns do 
    local spell = self.cooldowns[i]
    local nameLower = string.lower(spell.name)
    result:AddMinMaxCheck('CooldownFor' .. spell.debugName, 'Cooldown For ' .. nameLower,
      string.gsub(Constants.SPELL_COOLDOWN_CHECK_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_COOLDOWN_HAVE_MINIMUM_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_COOLDOWN_MINIMUM_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_COOLDOWN_HAVE_MAXIMUM_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_COOLDOWN_MAXIMUM_DESC, '{spell_name}', nameLower),
      Constants.SPELL_COOLDOWN_MIN, spell.cooldown, Constants.SPELL_COOLDOWN_SOFTMIN, 
      spell.cooldown, Constants.SPELL_COOLDOWN_STEP, Constants.SPELL_COOLDOWN_BIGSTEP)
      
    if spell.charges then 
      result:AddMinMaxCheck('ChargesFor' .. spell.debugName, 'Charges For ' .. nameLower,
      string.gsub(Constants.SPELL_CHARGES_CHECK_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_CHARGES_HAVE_MINIMUM_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_CHARGES_MINIMUM_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_CHARGES_HAVE_MAXIMUM_DESC, '{spell_name}', nameLower),
      string.gsub(Constants.SPELL_CHARGES_MAXIMUM_DESC, '{spell_name}', nameLower),
      Constants.SPELL_CHARGES_MIN, spell.charges, Constants.SPELL_CHARGES_SOFTMIN, 
      spell.charges, Constants.SPELL_CHARGES_STEP, Constants.SPELL_CHARGES_BIGSTEP)
    end
  end
  
  for i=1, #self.auras do 
    local aura = self.auras[i]
    if not aura.hidden then 
      local nameLower = string.lower(aura.name)
      result:AddMinMaxCheck('DurationOf' .. aura.debugName, 'Duration Of ' .. nameLower,
        string.gsub(Constants.AURA_DURATION_CHECK_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.AURA_DURATION_HAVE_MINIMUM_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.AURA_DURATION_MINIMUM_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.AURA_DURATION_HAVE_MAXIMUM_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.AURA_DURATION_MAXIMUM_DESC, '{aura_name}', nameLower),
        Constants.AURA_DURATION_MIN, aura.max_duration, Constants.AURA_DURATION_SOFTMIN, 
        aura.max_duration, Constants.AURA_DURATION_STEP, Constants.AURA_DURATION_BIGSTEP)
    end
  end
  
  result = result:Unnest()
  result = result:Build()  
  result.name = optionName
  return result
end

local function __CheckMinMaxRequirements(self, name, val)
  if not val then val = -1 end -- mostly for auras
  
  local check = self['check' .. name]
  local hasMin = self['hasMin' .. name]
  local min = self['min' .. name]
  local hasMax = self['hasMax' .. name]
  local max = self['max' .. name]
  
  if check then 
    if hasMin then 
      if val < min then return nil end
    end
    if hasMax then 
      if val > max then return false end
    end
  end
  return true
end

function TorpedoSuggestions:CheckStealthy(context)
  return context.stealthy
end

function TorpedoSuggestions:MeetsRequirements(context, primary)
  if self.primary ~= primary then return SuggestionResult.DO_NOT_SUGGEST end
  if not self.enabled then return SuggestionResult.DO_NOT_SUGGEST end
  
  local stealthed = self:CheckStealthy(context)
  if self.require_stealthed and not stealthed then return SuggestionResult.DO_NOT_SUGGEST end
  if self.require_not_stealthed and stealthed then return SuggestionResult.DO_NOT_SUGGEST end
  
  if self.require_combat and not context.combat then return SuggestionResult.DO_NOT_SUGGEST end
  if self.require_no_combat and context.combat then return SuggestionResult.DO_NOT_SUGGEST end
  
  if not __CheckMinMaxRequirements(self, 'ComboPoints', context.combo_points) then return SuggestionResult.DO_NOT_SUGGEST end
  
  local healthPerc = (context.health / context.max_health) * 100
  if not __CheckMinMaxRequirements(self, 'HealthPerc', healthPerc) then return SuggestionResult.DO_NOT_SUGGEST end
  
  for i=1, #self.auras do 
    local aura = self.auras[i]
    if not __CheckMinMaxRequirements(self, 'DurationOf' .. aura.debugName, aura:TimeRemaining(context)) then return SuggestionResult.DO_NOT_SUGGEST end
  end
  
  for i=1, #self.cooldowns do 
    local cooldown = self.cooldowns[i]
    if not __CheckMinMaxRequirements(self, 'CooldownFor' .. cooldown.debugName, cooldown:TimeRemaining(context)) then return SuggestionResult.DO_NOT_SUGGEST end
    
    if cooldown.charges then 
      if not __CheckMinMaxRequirements(self, 'ChargesFor' .. cooldown.debugName, cooldown:NumberOfCharges(context)) then return SuggestionResult.DO_NOT_SUGGEST end
    end
  end
  
  
  local energyRes =  __CheckMinMaxRequirements(self, 'Energy', context.power)
  if energyRes == nil and self.poolEnergyIfLow then return SuggestionResult.POOL_ENERGY
  elseif not energyRes then return SuggestionResult.DO_NOT_SUGGEST end
  return SuggestionResult.SUGGEST
end

function TorpedoSuggestions:Serializable()
  -- This is the least pretty
  local res = {}
  for key, val in pairs(self) do
    if key == 'spell' then 
      res.spell = val:Serializable()
    elseif key == 'auras' then 
      res.auras = {}
      for i=1, #val do 
        table.insert(res.auras, val[i]:Serializable())
      end
    elseif key == 'cooldowns' then
      res.cooldowns = {}
      for i=1, #val do 
        table.insert(res.cooldowns, val[i]:Serializable())
      end
    elseif type(val) ~= 'function' and type(val) ~= 'userdata' and type(val) ~= 'thread' and type(val) ~= 'table' then 
      res[key] = val
    end
  end
  return res
end

function TorpedoSuggestions:Unserialize(ser)
  local spell = Spells:Unserialize(ser.spell)
  local primary = ser.primary
  
  local res = TorpedoSuggestions:New({
    spell = spell, primary = primary
  })
  
  for key, val in pairs(ser) do 
    if key == 'spell' then 
    elseif key == 'primary' then 
    elseif key == 'auras' then 
      res.auras = {}
      for i=1, #val do 
        table.insert(res.auras, Auras:Unserialize(val[i]))
      end
    elseif key == 'cooldowns' then 
      res.cooldowns = {}
      for i=1, #val do 
        table.insert(res.cooldowns, Spells:Unserialize(val[i]))
      end
    else
      res[key] = val
    end
  end
  
  return res
end
