local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local OptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')

local MAJOR, MINOR = 'TorpedoTalentChoiceOptions-1.0', 1
local TorpedoTalentChoiceOptions = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoTalentChoiceOptions then return end

--[[
  A simple class that is nested in suggestions that describes a requirement
  to have a particular talent chosen.
]]

function TorpedoTalentChoiceOptions:New(o)
  Utils:CheckTypes({enabled = 'boolean', tier = 'number', column = 'number', inverted = 'boolean'}, o)
  setmetatable(o, self)
  self.__index = self
  return o
end

function TorpedoTalentChoiceOptions:IsValid()
  local talentId = GetTalentInfo(self.tier, self.column, 1)
  
  return type(talentId) ~= 'nil'
end

function TorpedoTalentChoiceOptions:Selected()
  local _, _, _, selected = GetTalentInfo(self.tier, self.column, 1)
  
  return selected
end

function TorpedoTalentChoiceOptions:TalentName()
  local _, name = GetTalentInfo(self.tier, self.column, 1)
  
  return name
end

function TorpedoTalentChoiceOptions:TalentIcon()
  local _, _, icon = GetTalentInfo(self.tier, self.column, 1)
  
  return icon
end

function TorpedoTalentChoiceOptions:MeetsRequirements()
  if not self.enabled then 
    return true 
  end
  if not self:IsValid() then
    return true 
  end
  
  if self.inverted then 
    return not self:Selected()
  else
    return self:Selected()
  end
end

function TorpedoTalentChoiceOptions:BuildOptions(optionName, order, rebuild_opt_func, remove_talent_func)
  local me = self
  local result = OptionsBuilder:New(self, order)
    :AddCustom({
      type = 'header',
      name = function(info)
        if not me:IsValid() then 
          return 'Invalid Talent'
        end
        
        return me:TalentName()
      end,
      desc = Constants.TALENT_CHOICE_HEADER_DESC
    })
    :AddCustom({
      type = 'execute',
      name = Constants.TALENT_CHOICE_DELETE_NAME,
      desc = Constants.TALENT_CHOICE_DELETE_DESC,
      width = 'full',
      func = function()
        remove_talent_func()
        rebuild_opt_func()
      end
    })
    :AddToggle('enabled', Constants.TALENT_CHOICE_ENABLED_NAME, Constants.TALENT_CHOICE_ENABLED_DESC)
    :Nest('enabled', true, true)
    :AddToggle('inverted', Constants.TALENT_CHOICE_INVERTED_NAME, Constants.TALENT_CHOICE_INVERTED_DESC)
    :AddCustom({
      name = Constants.TALENT_CHOICE_TIER_NAME,
      desc = Constants.TALENT_CHOICE_TIER_DESC,
      type = 'input',
      get = function() return tostring(me.tier) end,
      set = function(info, val)
        val = tonumber(val)
        if type(val) == 'number' then 
          me.tier = val
        end
      end
    })
    :AddCustom({
      name = Constants.TALENT_CHOICE_COLUMN_NAME,
      desc = Constants.TALENT_CHOICE_COLUMN_DESC,
      type = 'input',
      get = function() return tostring(me.column) end,
      set = function(info, val)
        val = tonumber(val)
        if type(val) == 'number' then 
          me.column = val 
        end
      end
    })
    :Unnest()
    
    
  result = result:Build()  
  result.name = optionName
  return result
end

function TorpedoTalentChoiceOptions:Serializable()
  local res = {}
  
  res.enabled = self.enabled
  res.inverted = self.inverted
  res.tier = self.tier
  res.column = self.column
  
  return res
end

function TorpedoTalentChoiceOptions:Unserialize(ser)
  local res = {}
  
  res.enabled = ser.enabled
  res.inverted = ser.inverted
  res.tier = ser.tier
  res.column = ser.column
  
  return TorpedoTalentChoiceOptions:New(res)
end