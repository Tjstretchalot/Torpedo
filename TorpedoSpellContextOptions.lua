--[[
  Builds spell context options. This is it's own class because it has 
  as many or more options as suggestions, if you ignore that suggestions
  have this. 
]]

local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
local TimestampTristate = LibStub:GetLibrary('TorpedoTimestampTristate-1.0')
local OptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')

local MAJOR, MINOR = 'TorpedoSpellContextOptions-1.0', 1
local TorpedoSpellContextOptions = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoSpellContextOptions then return end

local TSCO = TorpedoSpellContextOptions -- Name is too long

--[[
  Create a new spell context options.
  
  @params 
    spell (TorpedoSpells)           - The spell around whom's the context is being built
    suggestion (TorpedoSuggestions) - The suggestion within whom this spell context check is in.
                                      Used to fetch cooldowns and auras information. Not serialized.
]]
function TSCO:New(o)
  Utils:CheckTypes({ spell = 'table', suggestion = 'table' }, o)
  local res = self:__New(o)
  res:Init()
  return res
end

function TSCO:__New(o)
  setmetatable(o, self)
  self.__index = self
  o.initialized = false
  return o
end

local function __AddMinMaxOptions(self, name)
  if self['check' .. name] == nil then self['check' .. name] = false end
  if self['hasMin' .. name] == nil then self['hasMin' .. name] = false end
  if self['min' .. name] == nil then self['min' .. name] = 0 end
  if self['hasMax' .. name] == nil then self['hasMax' .. name] = false end 
  if self['max' .. name] == nil then self['max' .. name] = 0 end
end

local function __RemoveMinMaxOptions(self, name)
  self['check' .. name] = nil
  self['hasMin' .. name] = nil
  self['min' .. name] = nil
  self['hasMax' .. name] = nil
  self['max' .. name] = nil
end

--[[
  Ensures everything has an allowed value if possible.
]]
function TSCO:Init()
  if type(self.suggestion) ~= 'table' then 
    error('TorpedoSpellContextOptions - self.suggestion is type ' .. type(self.suggestion) .. ', table expected', 2)
  end
  
  self.initialized = true
  if self.enabled == nil then self.enabled = false end
  if self.require_stealthed == nil then self.require_stealthed = false end
  if self.require_not_stealthed == nil then self.require_not_stealthed = false end
  __AddMinMaxOptions(self, 'Energy')
  __AddMinMaxOptions(self, 'ComboPoints')
  __AddMinMaxOptions(self, 'HealthPerc')
  __AddMinMaxOptions(self, 'TimeToKillSolo')
  __AddMinMaxOptions(self, 'TimeToKillRaid')
  self:RebuildAuras()
  self:RebuildCooldowns()
end

--[[
  Ensures that there are no zombie aura options and that 
  every aura option has valid values.
]]
function TSCO:RebuildAuras()
  if self.auras == nil then self.auras = {} end
  
  -- check for zombies first, then add new ones
  local zombieIndexes = {} -- sorted from lowest indexes to highest
  for i=1, #self.auras do 
    local ourAura = self.auras[i]
    local found = false
    for j=1, #self.suggestion.auras do 
      local suggAura = self.suggestion.auras[j]
      
      if ourAura.aura_id == suggAura.aura_id then 
        found = true
        break
      end
    end
    
    if not found then 
      zombieIndexes[#zombieIndexes + 1] = i
    end
  end
  
  for i=#zombieIndexes, 1, -1 do 
    local zombie = self.auras[i]
    table.remove(self.auras, i)
    
    __RemoveMinMaxOptions(self, 'DurationOf' .. zombie.debugName)
  end
  
  for i=1, #self.suggestion.auras do 
    local suggAura = self.suggestion.auras[i]
    local found = false
    for j=1, #self.auras do 
      local ourAura = self.auras[j]
      
      if ourAura.aura_id == suggAura.aura_id then 
        found = true
        break
      end
    end
    
    if not found then 
      __AddMinMaxOptions(self, 'DurationOf' .. suggAura.debugName)
      table.insert(self.auras, suggAura)
    end
  end
end

function TSCO:RebuildCooldowns()
  if self.cooldowns == nil then self.cooldowns = {} end
  
  -- check for zombies first, then add new ones
  local zombieIndexes = {} -- sorted from lowest indexes to highest
  for i=1, #self.cooldowns do 
    local ourCooldown = self.cooldowns[i]
    local found = false
    for j=1, #self.suggestion.cooldowns do 
      local suggCooldown = self.suggestion.cooldowns[j]
      
      if ourCooldown.spell_id == suggCooldown.spell_id then 
        found = true
        break
      end
    end
    
    if not found then 
      zombieIndexes[#zombieIndexes + 1] = i
    end
  end
  
  for i=#zombieIndexes, 1, -1 do 
    local zombie = self.cooldowns[i]
    table.remove(self.cooldowns, i)
    
    __RemoveMinMaxOptions(self, 'CooldownFor' .. zombie.debugName)
    self['TimestampComparedTo' .. zombie.debugName] = nil
    __RemoveMinMaxOptions(self, 'TimeSinceCastFor' .. zombie.debugName)
    if zombie.charges then 
      __RemoveMinMaxOptions(self, 'ChargesFor' .. zombie.debugName)
    end
  end
  
  for i=1, #self.suggestion.cooldowns do 
    local suggCooldown = self.suggestion.cooldowns[i]
    local found = false
    for j=1, #self.cooldowns do 
      local ourCooldown = self.cooldowns[j]
      
      if ourCooldown.spell_id == suggCooldown.spell_id then 
        found = true
        break
      end
    end
    
    if not found then 
      __AddMinMaxOptions(self, 'CooldownFor' .. suggCooldown.debugName)
      if self['TimestampComparedTo' .. suggCooldown.debugName] == nil then 
        self['TimestampComparedTo' .. suggCooldown.debugName] = TimestampTristate.DO_NOT_CHECK
      end
      __AddMinMaxOptions(self, 'TimeSinceCastFor' .. suggCooldown.debugName)
      if suggCooldown.charges then 
        __AddMinMaxOptions(self, 'ChargesFor' .. suggCooldown.debugName)
      end
      table.insert(self.cooldowns, suggCooldown)
    end
  end
end

--[[
  Builds the options table. Does not include an enabled checkbox, since that's assumed to be
  handled outside of this group. 
]]
function TSCO:BuildOptions()
  local me = self
  local result = OptionsBuilder:New(self, 1)
  -- Not everything that we have an option for is particularly useful, so let's limit
  -- these to require stealth, require not stealthed, combo points, aura durations, 
  -- and timestamp comparison options
  local nameLower = string.lower(self.spell.name)
  result:AddToggle('require_stealthed', 'Require stealthed',
    string.gsub(Constants.REQUIRE_STEALTHED_IN_CONTEXT_DESC, '{spell_name}', nameLower))
  :AddToggle('require_not_stealthed', 'Require not stealthed',
    string.gsub(Constants.REQUIRE_NOT_STEALTHED_IN_CONTEXT_DESC, '{spell_name}', nameLower))
  :AddMinMaxCheck('ComboPoints', 'Combo Points',
    string.gsub(Constants.COMBO_POINTS_IN_CONTEXT_CHECK_DESC, '{spell_name}', nameLower), string.gsub(Constants.COMBO_POINTS_IN_CONTEXT_HAVE_MIN_DESC, '{spell_name}', nameLower), string.gsub(Constants.COMBO_POINTS_IN_CONTEXT_MIN_DESC, '{spell_name}', nameLower),
    string.gsub(Constants.COMBO_POINTS_IN_CONTEXT_HAVE_MAX_DESC, '{spell_name}', nameLower),
    string.gsub(Constants.COMBO_POINTS_IN_CONTEXT_MAX_DESC, '{spell_name}', nameLower),
    Constants.COMBO_POINTS_MIN, Constants.COMBO_POINTS_MAX,
    Constants.COMBO_POINTS_SOFTMIN, Constants.COMBO_POINTS_SOFTMAX, 
    Constants.COMBO_POINTS_STEP, COMBO_POINTS_BIGSTEP)
    
  for i=1, #self.auras do 
    local aura = self.auras[i]
    if not aura.hidden then 
      local nameLower = string.lower(aura.name)
      result:AddMinMaxCheck('DurationOf' .. aura.debugName, 'Duration Of ' .. nameLower,
        string.gsub(Constants.SPELL_CONTEXT_AURA_DURATION_CHECK_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.SPELL_CONTEXT_AURA_DURATION_HAVE_MINIMUM_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.SPELL_CONTEXT_AURA_DURATION_MINIMUM_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.SPELL_CONTEXT_AURA_DURATION_HAVE_MAXIMUM_DESC, '{aura_name}', nameLower),
        string.gsub(Constants.SPELL_CONTEXT_AURA_DURATION_MAXIMUM_DESC, '{aura_name}', nameLower),
        Constants.AURA_DURATION_MIN, aura.max_duration, Constants.AURA_DURATION_SOFTMIN, 
        aura.max_duration, Constants.AURA_DURATION_STEP, Constants.AURA_DURATION_BIGSTEP)
    end
  end
  
  for i=1, #self.cooldowns do 
    local cooldown = self.cooldowns[i]
    local cdNameLower = string.lower(cooldown.name)
    local key = 'TimestampComparedTo' .. cooldown.debugName
    -- Use a custom instead of a tristate to make it as explicit as possible which 
    -- values mean what, since we're already comparing two things that happened in
    -- the past and it's confusing.
    result:AddCustom({
      name = function()
        return me[key].display_name .. ' ' .. cdNameLower
      end,
      get = function(info)
        return me[key].display_value
      end,
      set = function(info, val)
        if val == TimestampTristate.USED_BEFORE.display_value then 
          me[key] = TimestampTristate.USED_BEFORE
        elseif val == TimestampTristate.USED_AFTER.display_value then 
          me[key] = TimestampTristate.USED_AFTER
        elseif val == TimestampTristate.DO_NOT_CHECK.display_value then 
          me[key] = TimestampTristate.DO_NOT_CHECK
        end
      end,
      type = 'toggle',
      tristate = true,
      desc = string.gsub(
        string.gsub(Constants.TIMESTAMP_COMPARED_TO_DESC, '{spell_name}', nameLower),
        '{cooldown_name}',
        cdNameLower)
    })
    
    result:AddMinMaxCheck('TimeSinceCastFor' .. cooldown.debugName, 'Time since we cast ' .. cdNameLower,
        string.gsub(string.gsub(Constants.SPELL_CONTEXT_TIME_SINCE_CAST_CHECK_DESC, '{spell_name}', nameLower), '{cooldown_name}', cdNameLower),
        string.gsub(string.gsub(Constants.SPELL_CONTEXT_TIME_SINCE_CAST_HAVE_MINIMUM_DESC, '{spell_name}', nameLower), '{cooldown_name}', cdNameLower),
        string.gsub(string.gsub(Constants.SPELL_CONTEXT_TIME_SINCE_CAST_MINIMUM_DESC, '{spell_name}', nameLower), '{cooldown_name}', cdNameLower),
        string.gsub(string.gsub(Constants.SPELL_CONTEXT_TIME_SINCE_CAST_HAVE_MAXIMUM_DESC, '{spell_name}', nameLower), '{cooldown_name}', cdNameLower),
        string.gsub(string.gsub(Constants.SPELL_CONTEXT_TIME_SINCE_CAST_MAXIMUM_DESC, '{spell_name}', nameLower), '{cooldown_name}', cdNameLower),
        Constants.SPELL_CONTEXT_TIME_SINCE_CAST_MIN, Constants.SPELL_CONTEXT_TIME_SINCE_CAST_MAX, 
        Constants.SPELL_CONTEXT_TIME_SINCE_CAST_SOFTMIN, Constants.SPELL_CONTEXT_TIME_SINCE_CAST_SOFTMAX, 
        Constants.SPELL_CONTEXT_TIME_SINCE_CAST_STEP, Constants.SPELL_CONTEXT_TIME_SINCE_CAST_BIGSTEP)
  end
  
  return result:Build()
end

function TSCO:Serializable()
  local res = {}
  for key, val in pairs(self) do
    if key == 'spell' then 
      res.spell = val:Serializable()
    elseif key == 'suggestion' then
    elseif key == 'initialized' then
    elseif key == 'auras' then
    elseif key == 'cooldowns' then
    elseif type(val) == 'table' then
      -- deep copy 
      res[key] = Utils:tcopy(val)
    elseif type(val) ~= 'function' and type(val) ~= 'userdata' and type(val) ~= 'thread' then 
      res[key] = val
    end
  end
  return res
end

--[[
  Unserializes a table built with Serializable. The result is not 
  complete - it needs the "suggestion" key set. 
]]
function TSCO:Unserialize(ser)
  local spell = Spells:Unserialize(ser.spell)
  
  local result = self:__New({ spell = spell })
  
  for key, val in pairs(ser) do 
    if key == 'spell' then 
    else
      result[key] = val
    end
  end
  
  return result
end