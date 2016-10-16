local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Suggestions = LibStub:GetLibrary('TorpedoSuggestions-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')

local MAJOR, MINOR = 'TorpedoSkills-1.0', 1
local TorpedoSkills = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoSkills then return end

function TorpedoSkills:New(o)
  Utils:CheckTypes({spell = 'table', name = 'string'}, o)
  setmetatable(o, self)
  self.__index = self
  o:__Init()
  return o
end

function TorpedoSkills:__Init()
  self.validator = nil
  self.priority_function = nil
  self.suggestions = {}
  self.cooldowns = {}
  self.auras = {}
end

function TorpedoSkills:SetValidator(validator)
  for i=1, #self.suggestions do 
    self.suggestions[i].Validator = validator
  end
  self.validator = validator
end

function TorpedoSkills:NewSuggestion(priority, primary)
  local sugg = Suggestions:New({spell = self.spell, priority = priority, primary = primary})
  sugg.Validator = self.validator
  
  sugg.auras = self.auras
  sugg.cooldowns = self.cooldowns
  
  sugg:PostUnserialize()
  
  table.insert(self.suggestions, sugg)
end

function TorpedoSkills:DropLowestPrioritySuggestion()
  if #self.suggestions < 1 then return end
  
  local lastIndex = 1
  local lastPrio = self.suggestions[1].priority
  
  for i=2, #self.suggestions do 
    if self.suggestions[i].priority < lastPrio then 
      lastIndex = i
      lastPrio = self.suggestions[i].priority
    end
  end
  
  table.remove(self.suggestions, lastIndex)
end

--[[
  Assumes the backing array has already been updated
]]
function TorpedoSkills:RegisterCooldown(spell)
  for i=1, #self.suggestions do 
    self.suggestions[i]:RegisterCooldown(spell)
  end
end

--[[
  Assumes the backing array has already been updated
]]
function TorpedoSkills:RegisterAura(aura)
  for i=1, #self.suggestions do 
    self.suggestions[i]:RegisterAura(aura)
  end
end

function TorpedoSkills:CreateOptions(order, rebuild_opt, new_priority_func, advanced_features_func, delete_skill_func)
  Utils:CheckTypes({ order = 'number', rebuild_opt = 'function', new_priority_func = 'function', advanced_features_func = 'function', delete_skill_func = 'function' }, { order = order, rebuild_opt = rebuild_opt, new_priority_func = new_priority_func, advanced_features_func = advanced_features_func, delete_skill_func = delete_skill_func })
  
  if not new_priority_func then error('Need a function to get a priority for new primary abilities') end
  
  local me = self
  local result = {
    name = self.name,
    type = 'group',
    order = order,
    args = {
      param1 = {
        order = 1,
        name = Constants.ADD_NEW_SUGGESTION_NAME,
        desc = Constants.ADD_NEW_SUGGESTION_DESC,
        width = 'full',
        type = 'execute',
        func = function()
          me:NewSuggestion(new_priority_func(), true)
          rebuild_opt()
        end
      },
      param2 = {
        order = 2,
        name = Constants.DELETE_SKILL_NAME,
        desc = Constants.DELETE_SKILL_DESC,
        width = 'full',
        type = 'execute',
        hidden = function()
          return not advanced_features_func()
        end,
        func = function()
          delete_skill_func()
          rebuild_opt()
        end
      }
    }
  }
  
  local sorted = {}
  for i=1, #self.suggestions do 
    local toInsert = { suggPriority = self.suggestions[i].priority, suggIndex = i }
    if #sorted == 0 then 
      table.insert(sorted, toInsert)
    else
      local found = false
      for j=1, #sorted do 
        if self.suggestions[i].priority > sorted[j].suggPriority then 
          found = true
          table.insert(sorted, j, toInsert)
        end
      end
      if not found then 
        table.insert(sorted, toInsert)
      end
    end
  end
  
  local offset = 2
  for i=1, #sorted do 
    local sugg = self.suggestions[sorted[i].suggIndex]
    local str = 'param' .. tostring(i + offset)
    
    local cacheIndex = i
    local removeSuggestionFunc = function()
      table.remove(me.suggestions, cacheIndex)
    end
    
    result.args[str] = sugg:CreateOptions('Option ' .. tostring(i), i + offset, rebuild_opt, removeSuggestionFunc)
  end
  
  return result
end

function TorpedoSkills:Serializable() -- loses validator
  local res = {}
  res.spell = self.spell:Serializable()
  res.name = self.name
  res.suggestions = {}
  for i=1, #self.suggestions do 
    table.insert(res.suggestions, self.suggestions[i]:Serializable())
  end
  return res
end

function TorpedoSkills:Unserialize(ser)
  local spell = Spells:Unserialize(ser.spell)
  local name = ser.name
  local suggestions = {}
  for i=1, #ser.suggestions do 
    table.insert(suggestions, Suggestions:Unserialize(ser.suggestions[i]))
  end
  
  local res = TorpedoSkills:New({ spell = spell, name = name })
  res.suggestions = suggestions
  
  return res
end

function TorpedoSkills:PostUnserialize()
  for i=1, #self.suggestions do 
    self.suggestions[i].auras = self.auras
    self.suggestions[i].cooldowns = self.cooldowns
    self.suggestions[i]:PostUnserialize()
  end
end