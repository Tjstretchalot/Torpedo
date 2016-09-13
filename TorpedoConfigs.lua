local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')

local MAJOR, MINOR = 'TorpedoConfigs-1.0', 1
local TorpedoConfigs = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoConfigs then return end

function TorpedoConfigs:New(o)
  Utils:CheckTypes({}, o)
  setmetatable(o, self)
  self.__index = self
  o:__Init()
  return o
end

function TorpedoConfigs:__Init()
  self.profiles = self.profiles or {}
end

function TorpedoConfigs:SetDefaultProfile(profile)
  self.default_profile = profile
end

function TorpedoConfigs:__CheckProfileName(nm)
  for i=1, #self.profiles do 
    if self.profiles[i].name == nm then 
      return true
    end
  end
  
  return false
end

function TorpedoConfigs:NewProfile(nm)
  if self:__CheckProfileName(nm) then
    error('Already have a profile with the name ' .. tostring(nm))
  end
  
  local profile = Profiles:Unserialize(self.default_profile:Serializable())
  profile.name = nm
  profile:SetActiveSpecialization(self.active_spec_id)
  
  table.insert(self.profiles, profile)
end

function TorpedoConfigs:SetActiveProfile(nm)
  for i=1, #self.profiles do 
    if self.profiles[i].name == nm then 
      self.active_profile_index = i
      return
    end
  end
  
  error('No profile with the name ' .. tostring(nm) .. ' found')
end

function TorpedoConfigs:GetActiveProfile()
  return self.profiles[self.active_profile_index]
end

function TorpedoConfigs:RemoveProfileByIndex(index)
  table.remove(self.profiles, index)
end

function TorpedoConfigs:SetActiveSpecialization(specId)
  self.active_spec_id = specId
  
  for i=1, #self.profiles do 
    self.profiles[i]:SetActiveSpecialization(self.active_spec_id)
  end
end

function TorpedoConfigs:GetSuggestion(context, primary)
  if not self.active_profile_index then
    return nil, SuggestionResult.DO_NOT_SUGGEST
  end
  
  local prof = self.profiles[self.active_profile_index]
  
  return prof:GetSuggestion(context, primary)
end

function TorpedoConfigs:CreateOptions(rebuild_opt)
  local me = self
  local res = {
    name = 'Torpedo',
    type = 'group',
    args = {
      param1 = {
        name = Constants.ADD_NEW_PROFILE_NAME,
        desc = Constants.ADD_NEW_PROFILE_DESC,
        type = 'execute',
        width = 'full',
        order = 1,
        func = function()
          if not me:__CheckProfileName('Custom Profile') then 
            me:NewProfile('Custom Profile')
          else
            local counter = 2
            local name
            while true do
              name = 'Custom Profile ' .. counter
              
              if not me:__CheckProfileName(name) then break end
            end
            me:NewProfile(name)
          end
          
          rebuild_opt()
        end
      }
    }
  }
  
  for i=1, #self.profiles do 
    local key = 'param' .. tostring(i+1)
    
    local cacheInd = i
    local delete_profile_func = function()
      if me.active_profile_index == cacheInd then 
        message('Can\'t delete the active profile!')
        return
      end
      
      table.remove(me.profiles, cacheInd)
    end
    
    local is_active_profile_func = function()
      return cacheInd == me.active_profile_index
    end
    
    local set_active_profile_func = function()
      me.active_profile_index = cacheInd
    end
    
    local is_valid_profile_name_func = function(nm)
      for counter=1, #me.profiles do 
        if counter ~= cacheInd and me.profiles[counter].name == nm then 
          message('Already have a profile with that name!')
          return false
        end
        
        return true
      end
    end
    
    res.args[key] = self.profiles[i]:CreateOptions(i+1, rebuild_opt, delete_profile_func, is_active_profile_func, set_active_profile_func, is_valid_profile_name_func)
  end
  
  return res
end

function TorpedoConfigs:Serializable()
  local res = {}
  
  res.profiles = {}
  for i=1, #self.profiles do 
    res.profiles[i] = self.profiles[i]:Serializable()
  end
  
  if self.default_profile then 
    res.default_profile = self.default_profile:Serializable()
  end
  
  res.active_spec_id = self.active_spec_id
  res.active_profile_index = self.active_profile_index
  
  return res
end

function TorpedoConfigs:Unserialize(ser)
  local profiles = {}
  for i=1, #ser.profiles do 
    profiles[i] = Profiles:Unserialize(ser.profiles[i])
  end
  
  local default_profile
  if ser.default_profile then 
    default_profile = Profiles:Unserialize(ser.default_profile)
  end
  
  local active_profile_index = ser.active_profile_index
  local active_spec_id = ser.active_spec_id
  
  return TorpedoConfigs:New({ profiles = profiles, default_profile = default_profile,
    active_profile_index = active_profile_index, active_spec_id = active_spec_id })
end