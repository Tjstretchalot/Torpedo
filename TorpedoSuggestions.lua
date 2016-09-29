local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local OptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
local ContextDecider = LibStub:GetLibrary('TorpedoContextDecider-1.0')
local SpellContextOptions = LibStub:GetLibrary('TorpedoSpellContextOptions-1.0')

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
  if self['check' .. name] == nil then self['check' .. name] = false end
  if self['hasMin' .. name] == nil then self['hasMin' .. name] = false end
  if self['min' .. name] == nil then self['min' .. name] = 0 end
  if self['hasMax' .. name] == nil then self['hasMax' .. name] = false end 
  if self['max' .. name] == nil then self['max' .. name] = 0 end
end

function TorpedoSuggestions:__Init()
  self.auras = self.auras or {}
  self.cooldowns = self.cooldowns or {}
  
  --[[
   Spells for which we request that the fight analyzer cache, and what 
   we check about those spells. For example, if we want to check if Rupture
   was active when Exsanguinate was last used and that Rupture has not been
   used since, we could use something like the following, but with Serializable,
   Unserialize, RebuildAuras, and RebuildCooldowns functions:
   self.cache_spells = {
     { -- checks Exsanguinate 
       spell = Spells:New({spell_id = exsanguinate_spell_id, ...})
       checkDurationOfRupture = true,
       hasMinDurationOfRupture = true,
       minDurationOfRupture = 0
     }, 
     { -- checks Rupture hasn't been used since exsanguinate
       spell = Spells:New({spell_id = rupture_spell_id, ...}),
       TimestampComparedToExsanguinate = TimestampTristate.USED_BEFORE.debug_value
     }
   }
   
   These actually end up being backed by TorpedoSpellContextOptions to simplify things
  ]]
  self.cache_spells = self.cache_spells or {}
  
  if self.enabled == nil then self.enabled = false end
  if self.priority == nil then self.priority = Constants.PRIORITY_DEFAULT end
  if self.poolEnergyIfLow == nil then self.poolEnergyIfLow = false end
  if self.require_stealthed == nil then self.require_stealthed = false end
  if self.require_not_stealthed == nil then self.require_not_stealthed = false end
  if self.require_boss_fight == nil then self.require_boss_fight = false end
  if self.require_not_boss_fight == nil then self.require_not_boss_fight = false end
  if self.require_instance == nil then self.require_instance = false end
  if self.require_not_instance == nil then self.require_not_instance = false end
  __AddMinMaxOptions(self, 'GroupSize')
  __AddMinMaxOptions(self, 'Energy')
  __AddMinMaxOptions(self, 'ComboPoints')
  __AddMinMaxOptions(self, 'HealthPerc')
  __AddMinMaxOptions(self, 'TimeToKillSolo')
  __AddMinMaxOptions(self, 'TimeToKillRaid')
end

function TorpedoSuggestions:RegisterAura(aura)
  __AddMinMaxOptions(self, 'DurationOf' .. aura.debugName)
  table.insert(self.auras, aura)
  
  
  for i=1, #self.cache_spells do 
    local spellContextOption = self.cache_spells[i]
    spellContextOption:RebuildAuras()
  end
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
  
  for i=1, #self.cache_spells do 
    local spellContextOption = self.cache_spells[i]
    spellContextOption:RebuildCooldowns()
  end
  
  local newSCO = SpellContextOptions:New({spell = spell, suggestion = self})
  table.insert(self.cache_spells, newSCO)
end

function TorpedoSuggestions:EnsureSpellContextConsistency()
  for i=1, #self.cooldowns do 
    local cd = self.cooldowns[i]
    local found = false
    for j=1, #self.cache_spells do 
      local cs = self.cache_spells[j]
      
      if cd.spell_id == cs.spell.spell_id then 
        found = true
        break
      end
    end
    
    if not found then 
      local newSCO = SpellContextOptions:New({spell = cd, suggestion = self})
      table.insert(self.cache_spells, newSCO)
    end
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
    :AddMinMaxCheck('TimeToKillSolo', 'Time To Kill Solo (Seconds)', Constants.TIME_TO_KILL_SOLO_CHECK_DESC, 
                    Constants.TIME_TO_KILL_SOLO_HAVE_MINIMUM_DESC,
                    Constants.TIME_TO_KILL_SOLO_MINIMUM_DESC, Constants.TIME_TO_KILL_SOLO_HAVE_MAXIMUM_DESC, 
                    Constants.TIME_TO_KILL_SOLO_MAXIMUM_DESC, 
                    Constants.TIME_TO_KILL_SOLO_MIN, Constants.TIME_TO_KILL_SOLO_MAX,
                    Constants.TIME_TO_KILL_SOLO_SOFTMIN, Constants.TIME_TO_KILL_SOLO_SOFTMAX, Constants.TIME_TO_KILL_SOLO_STEP, Constants.TIME_TO_KILL_SOLO_BIGSTEP)
    :AddMinMaxCheck('TimeToKillRaid', 'Time To Kill Raid (Seconds)', Constants.TIME_TO_KILL_RAID_CHECK_DESC, 
                    Constants.TIME_TO_KILL_RAID_HAVE_MINIMUM_DESC,
                    Constants.TIME_TO_KILL_RAID_MINIMUM_DESC, Constants.TIME_TO_KILL_RAID_HAVE_MAXIMUM_DESC, 
                    Constants.TIME_TO_KILL_RAID_MAXIMUM_DESC, 
                    Constants.TIME_TO_KILL_RAID_MIN, Constants.TIME_TO_KILL_RAID_MAX,
                    Constants.TIME_TO_KILL_RAID_SOFTMIN, Constants.TIME_TO_KILL_RAID_SOFTMAX, Constants.TIME_TO_KILL_RAID_STEP, Constants.TIME_TO_KILL_RAID_BIGSTEP)
  
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
  
  -- Add some niche options here
  result:AddToggle('require_boss_fight', 'Require boss fight', Constants.REQUIRE_BOSS_FIGHT_DESC)
  :AddToggle('require_not_boss_fight', 'Require no boss fight', Constants.REQUIRE_NO_BOSS_FIGHT_DESC)
  :AddToggle('require_instance', 'Require instance', Constants.REQUIRE_INSTANCE_DESC)
  :AddToggle('require_not_instance', 'Require not in instance', Constants.REQUIRE_NO_INSTANCE_DESC)
  :AddMinMaxCheck('GroupSize', 'Group Size', Constants.GROUP_SIZE_CHECK_DESC, 
    Constants.GROUP_SIZE_HAVE_MINIMUM_DESC, Constants.GROUP_SIZE_MINIMUM_DESC, 
    Constants.GROUP_SIZE_HAVE_MAXIMUM_DESC, Constants.GROUP_SIZE_MAXIMUM_DESC,
    Constants.GROUP_SIZE_MIN, Constants.GROUP_SIZE_MAX, Constants.GROUP_SIZE_SOFTMIN,
    Constants.GROUP_SIZE_SOFTMAX, Constants.GROUP_SIZE_STEP, Constants.GROUP_SIZE_BIGSTEP)
  
  -- Add optional context checking for each cooldown. Done at the bottom because
  -- this feature is incredibly complex compared to everything else
  for i=1, #self.cache_spells do 
    local spellContextOptions = self.cache_spells[i]
    local nameLower = string.lower(spellContextOptions.spell.name)
    -- add a checkbox
    result:AddCustom({
      type = 'toggle',
      name = string.gsub(Constants.SPELL_CONTEXT_CHECK_ENABLED_NAME, '{spell_name}', nameLower),
      desc = string.gsub(Constants.SPELL_CONTEXT_CHECK_ENABLED_DESC, '{spell_name}', nameLower),
      get = function() return spellContextOptions.enabled end,
      set = function(info, val) spellContextOptions.enabled = val end
    })
    
    -- then add the group
    result:Nest(function() return not spellContextOptions.enabled end, true, true)
    local res = spellContextOptions:BuildOptions()
    res.inline = true
    res.name = 'Context requirements around ' .. nameLower
    result:AddCustom(res)
    result:Unnest() 
  end
  result = result:Unnest()
  result = result:Build()  
  result.name = optionName
  return result
end

function TorpedoSuggestions:MeetsRequirements(context, primary)
  if primary ~= self.primary then return SuggestionResult.DO_NOT_SUGGEST end
  
  local result = {ContextDecider:Decide(self, context)}
  if not result[1] then 
    -- print('Suggestion failed: ' .. tostring(result[2]) .. ' (' .. tostring(result[3]) .. '=' .. tostring(result[4]) .. ')')
    if result[2] == ContextDecider.FAIL_REASON.MIN_FAILED and result[3] == 'Energy' and self.poolEnergyIfLow then 
      return SuggestionResult.POOL_ENERGY
    end
    
    return SuggestionResult.DO_NOT_SUGGEST
  end
  
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
    elseif key == 'cache_spells' then
      res.cache_spells = {}
      for i=1, #val do 
        res.cache_spells[i] = val[i]:Serializable()
      end
    elseif type(val) == 'table' then
      -- deep copy 
      res[key] = Utils:tcopy(val)
    elseif type(val) ~= 'function' and type(val) ~= 'userdata' and type(val) ~= 'thread' then 
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
    elseif key == 'cache_spells' then
      res.cache_spells = {}
      for i=1, #val do 
        res.cache_spells[i] = SpellContextOptions:Unserialize(val[i])
      end
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
  
  for i=1, #res.cache_spells do 
    res.cache_spells[i].suggestion = res
    res.cache_spells[i]:Init()
  end
  
  res:EnsureSpellContextConsistency()
  return res
end
