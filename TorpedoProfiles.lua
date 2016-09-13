local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')

local MAJOR, MINOR = 'TorpedoProfiles-1.0', 1
local TorpedoProfiles = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoProfiles then return end

function TorpedoProfiles:New(o)
  Utils:CheckTypes({ name = 'string' }, o)
  
  setmetatable(o, self)
  self.__index = self
  
  o:__Init()
  return o
end

function TorpedoProfiles:__Init()
  self.specializations = self.specializations or {}
end

function TorpedoProfiles:NewSpecialization(name, spec_id)
  table.insert(self.specializations, Specs:New({name = name, specialization_id = spec_id}))
end

function TorpedoProfiles:BuildContext()
  if not self.active_spec_index then return nil end
  
  local spec = self.specializations[self.active_spec_index]
  return spec:BuildContext()
end

function TorpedoProfiles:Serializable()
  local res = {}
  res.name = self.name
  res.specializations = {}
  for i=1, #self.specializations do 
    res.specializations[i] = self.specializations[i]:Serializable()
  end
  
  return res
end

function TorpedoProfiles:Unserialize(ser)
  local specializations = {}
  for i=1, #ser.specializations do 
    specializations[i] = Specs:Unserialize(ser.specializations[i])
  end
  local name = ser.name
  local profile = TorpedoProfiles:New({ specializations = specializations, name = name })
  return profile
end

function TorpedoProfiles:SetActiveSpecialization(specNum)
  for i=1, #self.specializations do 
    if self.specializations[i].specialization_id == specNum then 
      self.active_spec_index = i
      return
    end
  end
  self.active_spec_index = nil
end

function TorpedoProfiles:GetSuggestion(context, primary)
  if not self.active_spec_index then 
    return nil, SuggestionResult.DO_NOT_SUGGEST
  end
  
  return self.specializations[self.active_spec_index]:GetSuggestion(context, primary)
end

function TorpedoProfiles:CreateOptions(order, rebuild_opt, delete_profile_func, is_active_profile_func, set_active_profile_func, is_valid_profile_name_func)
  Utils:CheckTypes({ order = 'number', rebuild_opt = 'function', delete_profile_func = 'function',
  is_active_profile_func = 'function', set_active_profile_func = 'function', is_valid_profile_name_func = 'function' }, { order = order, rebuild_opt = rebuild_opt, delete_profile_func = delete_profile_func, is_active_profile_func = is_active_profile_func, set_active_profile_func = set_active_profile_func, is_valid_profile_name_func = is_valid_profile_name_func})
  
  local me = self
  local result = {
    name = function() return me.name end,
    type = 'group',
    order = order,
    args = {
      param1 = {
        order = 1,
        name = Constants.DELETE_PROFILE_NAME,
        desc = Constants.DELETE_PROFILE_DESC,
        width = 'full',
        type = 'execute',
        func = function()
          delete_profile_func()
          rebuild_opt()
        end
      },
      param2 = {
        order = 2,
        name = Constants.SET_ACTIVE_PROFILE_NAME,
        desc = Constants.SET_ACTIVE_PROFILE_DESC,
        width = 'full',
        type = 'execute',
        disabled = function()
          if is_active_profile_func() then return true end
          return false
        end,
        func = function()
          set_active_profile_func()
        end
      },
      param3 = {
        order = 3,
        name = Constants.CHANGE_PROFILE_NAME_NAME,
        desc = Constants.CHANGE_PROFILE_NAME_DESC,
        width = 'full',
        type = 'input',
        get = function() return me.name end,
        set = function(info, val)
          if not is_valid_profile_name_func(val) then return end
          
          me.name = val
        end
      }
    }
  }
  
  local offset = 3
  for i=1, #self.specializations do 
    local key = 'param' .. tostring(i + offset)
    
    result.args[key] = self.specializations[i]:CreateOptions(i + offset, rebuild_opt)
  end
  
  return result
end