local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
local GUISettings = LibStub:GetLibrary('TorpedoGUISettings-1.0')
local DefaultConfig = LibStub:GetLibrary('TorpedoDefaultConfig-1.0')
local Encoding = LibStub:GetLibrary('TorpedoEncoding-1.0')
local Serializer = LibStub:GetLibrary("AceSerializer-3.0")
local StringBuffer = LibStub:GetLibrary('TorpedoStringBuffer-1.0')
local OptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')

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
  
  if self.gui_settings == nil then 
    self.gui_settings = GUISettings:New({})
  end
  
  self.export_profile_checkbox = false
  self.export_profile_input = ''
  
  self.add_spec_checkbox = false
  self.add_spec_spec_id = 0
  self.add_spec_spec_name = ''
  
  if self.options_disabled == nil then
    self.options_disabled = true
  end
end

function TorpedoProfiles:NewSpecialization(name, spec_id)
  table.insert(self.specializations, Specs:New({name = name, specialization_id = spec_id}))
end

function TorpedoProfiles:BuildContext(...)
  if not self.active_spec_index then return nil end
  
  local spec = self.specializations[self.active_spec_index]
  return spec:BuildContext(...)
end

function TorpedoProfiles:Serializable()
  local res = {}
  res.name = self.name
  res.specializations = {}
  for i=1, #self.specializations do 
    res.specializations[i] = self.specializations[i]:Serializable()
  end
  res.gui_settings = self.gui_settings:Serializable()
  
  if self.options_disabled ~= true then 
    res.options_disabled = self.options_disabled
  end
  
  return res
end

function TorpedoProfiles:Unserialize(ser)
  local specializations = {}
  for i=1, #ser.specializations do 
    specializations[i] = Specs:Unserialize(ser.specializations[i])
  end
  local name = ser.name
  local gui_settings = GUISettings:Unserialize(ser.gui_settings)
  local options_disabled = ser.options_disabled
  local profile = TorpedoProfiles:New({ specializations = specializations, name = name, gui_settings = gui_settings, options_disabled = options_disabled })
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

--[[
  Use the default config to fetch the recommended profile
]]
function TorpedoProfiles:SetAllToRecommended()
  local reccProfile = TorpedoProfiles:Unserialize(DefaultConfig.profiles[1])
  
  for k,v in pairs(reccProfile) do 
    if type(k) ~= 'function' then 
      self[k] = v
    end
  end
end

function TorpedoProfiles:CreateOptions(order, rebuild_opt, update_gui_func, delete_profile_func, is_active_profile_func, set_active_profile_func, is_valid_profile_name_func, clone_profile_func)
  Utils:CheckTypes({ order = 'number', update_gui_func = 'function', rebuild_opt = 'function', delete_profile_func = 'function',
  is_active_profile_func = 'function', set_active_profile_func = 'function', is_valid_profile_name_func = 'function', clone_profile_func = 'function' }, { order = order, rebuild_opt = rebuild_opt, update_gui_func = update_gui_func, delete_profile_func = delete_profile_func, is_active_profile_func = is_active_profile_func, set_active_profile_func = set_active_profile_func, is_valid_profile_name_func = is_valid_profile_name_func, clone_profile_func = clone_profile_func})
  
  if self.options_disabled then 
    return self:CreateOptionsDisabledOptions(order, rebuild_opt)
  end
  
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
          update_gui_func()
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
      },
      param4 = {
        order = 4,
        name = Constants.CLONE_PROFILE_NAME,
        desc = Constants.CLONE_PROFILE_DESC,
        width = 'full',
        type = 'execute',
        func = function()
          clone_profile_func()
          rebuild_opt()
        end
      },
      param5 = {
        order = 5,
        name = Constants.SET_ALL_TO_RECOMMENDED_NAME,
        desc = Constants.SET_ALL_TO_RECOMMENDED_DESC,
        width = 'full',
        type = 'execute',
        func = function()
          me:SetAllToRecommended()
          rebuild_opt()
          update_gui_func()
        end
      },
      param6 = {
        order = 6,
        name = Constants.EXPORT_PROFILE_CHECKBOX_NAME,
        desc = Constants.EXPORT_PROFILE_CHECKBOX_DESC,
        width = 'full',
        type = 'toggle',
        get = function() return me.export_profile_checkbox end,
        set = function(info, val) 
          me.export_profile_checkbox = val
          me.export_profile_input = ''
        end
      },
      param7 = {
        order = 7,
        name = Constants.EXPORT_PROFILE_INPUT_NAME,
        desc = Constants.EXPORT_PROFILE_INPUT_DESC,
        width = 'full',
        type = 'input',
        multiline = true,
        get = function() return me.export_profile_input end,
        set = function(info, val) me.export_profile_input = val end,
        hidden = function()
          return not me.export_profile_checkbox
        end
      },
      param8 = {
        order = 8,
        name = Constants.EXPORT_PROFILE_ENCODE_NAME,
        desc = Constants.EXPORT_PROFILE_ENCODE_DESC,
        width = 'full',
        type = 'execute',
        func = function()
          local serializableTable = me:Serializable()
          local serializedString = Serializer:Serialize(serializableTable)
          local encodedLines = Encoding:Encode(serializedString, 100)
          
          local stringBuffer = StringBuffer:New()
          me.export_profile_input = ''
          for i=1, #encodedLines do 
            stringBuffer:Append(encodedLines[i])
            stringBuffer:Append('\n')
          end
          me.export_profile_input = stringBuffer:BuildString()
          print('Torpedo: Encoding complete! ' .. tostring(#encodedLines) .. ' lines')
        end,
        hidden = function()
          return not me.export_profile_checkbox
        end
      },
      param9 = {
        order = 9,
        name = Constants.ADD_SPECIALIZATION_CHECKBOX_NAME,
        desc = Constants.ADD_SPECIALIZATION_CHECKBOX_DESC,
        width = 'full',
        type = 'toggle',
        get = function() return me.add_spec_checkbox end,
        set = function(info, val) me.add_spec_checkbox = val end
      },
      param10 = {}, -- RESERVED
      param11 = {
        order = 11,
        name = Constants.DISABLE_PROFILE_OPTIONS_NAME,
        desc = Constants.DISABLE_PROFILE_OPTIONS_DESC,
        width = 'full',
        type = 'execute',
        func = function()
          me.options_disabled = true
          rebuild_opt()
        end
      }
    }
  }
  
  -- Setup param10 (add specialization options)
  local addSpecOpts = OptionsBuilder:New(self, 10)
  addSpecOpts:AddNumericInput('add_spec_spec_id', Constants.ADD_SPECIALIZATION_SPEC_ID_NAME, Constants.ADD_SPECIALIZATION_SPEC_ID_DESC, Constants.ADD_SPECIALIZATION_SPEC_ID_MIN, Constants.ADD_SPECIALIZATION_SPEC_ID_MAX)
    :AddInput('add_spec_spec_name', Constants.ADD_SPECIALIZATION_SPEC_NAME_NAME, Constants.ADD_SPECIALIZATION_SPEC_NAME_DESC)
    :AddCustom({
      name = Constants.ADD_SPECIALIZATION_FILL_IN_CURRENT_NAME,
      desc = Constants.ADD_SPECIALIZATION_FILL_IN_CURRENT_DESC,
      type = 'execute',
      width = 'full',
      func = function()
        local id, name = GetSpecializationInfo(GetSpecialization())
        
        me.add_spec_spec_id = id
        me.add_spec_spec_name = name
      end
    })
    :AddCustom({
      name = Constants.ADD_SPECIALIZATION_EXECUTE_NAME,
      desc = Constants.ADD_SPECIALIZATION_EXECUTE_DESC,
      type = 'execute',
      width = 'full',
      func = function()
        me:NewSpecialization(me.add_spec_spec_name, me.add_spec_spec_id)
        rebuild_opt()
      end
    })
  addSpecOpts = addSpecOpts:Build()
  addSpecOpts.name = Constants.ADD_SPECIALIZATION_GROUP_NAME
  addSpecOpts.inline = true
  addSpecOpts.order = 10
  addSpecOpts.hidden = function() return not me.add_spec_checkbox end
  addSpecOpts.disabled = addSpecOpts.hidden
  result.args.param10 = addSpecOpts
  
  local offset = 11
  
  local key = 'param' .. (offset + 1)
  local guiSettings = self.gui_settings:BuildOptions(update_gui_func)
  guiSettings.order = offset + 1
  guiSettings.name = 'GUI Settings'
  guiSettings.inline = true
  
  result.args[key] = guiSettings
  
  offset = offset + 1
  for i=1, #self.specializations do 
    local key = 'param' .. tostring(i + offset)
    local cacheInd = i
    local delete_spec = function()
      table.remove(me.specializations, cacheInd)
      
      if cacheInd == me.active_spec_index then 
        me.active_spec_index = nil
      end
    end
    
    result.args[key] = self.specializations[i]:CreateOptions(i + offset, rebuild_opt, delete_spec)
  end
  
  return result
end

--[[
  It often improves performance to NOT build huge options tables.
]]
function TorpedoProfiles:CreateOptionsDisabledOptions(order, rebuild_opt)
  local me = self
  return {
    type = 'group',
    name = me.name,
    order = order,
    args = {
      param1 = {
        type = 'execute',
        name = Constants.ENABLE_PROFILE_OPTIONS_NAME,
        desc = Constants.ENABLE_PROFILE_OPTIONS_DESC,
        func = function()
          me.options_disabled = false
          rebuild_opt()
        end,
        width = 'full',
        order = 1
      }
    }
  }
end