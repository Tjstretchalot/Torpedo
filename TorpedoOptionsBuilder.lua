--[[
  Builds 1 leaf node for an options table for AceConfig-3.0 in 
  the Torpedo format, backed to a specific array.
]]

local MAJOR, MINOR = 'TorpedoOptionsBuilder-1.0', 1
local TorpedoOptionsBuilder = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoOptionsBuilder then return end

--[[
  Creates a new options builder.
  
  @param config The configuration that these options are backed to
  @param order the order of this leaf node in it's parent node
  @return a new instance of TorpedoOptionsBuilder
]]
function TorpedoOptionsBuilder:New(config, order)
  local res = {
    config = config,
    order = order,
    orderCounter = 0,
    result = {},
    nestStack = {},
    validator = nil
  }
  setmetatable(res, self)
  self.__index = self
  return res
end

--[[
  Increments the internal order counter and returns it.
  
  @return the order number for the next node in this options builder
]]
function TorpedoOptionsBuilder:NextOrder()
  self.orderCounter = self.orderCounter + 1
  return self.orderCounter
end

--[[
  Creates a function that performs a logical NOR on the input 
  parameters.
  
  Strings are assumed to be keys in the config table that these 
  options are backed to. 
  
  Tables may be passed in to specify what is false:
    {
      name = 'key', -- the key in the backing configuration table
      compare_with = any -- The value that represents "false", which would allow the NOR check to continue
    }
  
  For example, if a function is desired that returns false if 'enabled' is true and myTristate is nil,
  then:
  
  optionsBuilder:LogicalNorAggregateFunction('enabled', { name = 'myTristate', compare_with = nil })
  
  Another way to think of this is a function that returns true if enabled is false or if myTristate is not 
  nil.
]]
function TorpedoOptionsBuilder:LogicalNorAggregateFunction(...)
  local cacheConfig = self.config
  local things = {...}
  local parsedThings = {}
  
  for i = 1, #things do 
    if type(things[i]) == 'string' then 
      parsedThings[i] = { name = things[i], compare_with = true }
    elseif type(things[i]) == 'table' then
      parsedThings[i] = things[i]
    else
      error('Weird type: ' .. type(things[i]), 2)
    end
  end
  
  return function()
    for i = 1, #parsedThings do 
      if cacheConfig[parsedThings[i].name] ~= parsedThings[i].compare_with then 
        return true
      end
    end
    return false
  end
end

--[[
  Indicates that options that are added prior to an "Unnest" call should
  be hidden and/or disabled based on thing.
  
  Thing should be a valid parameter when sent to LogicalNorAggregateFunction
  
  @param thing a parameter in LogicalNorAggregateFunction
  @param effectsHidden boolean true if thing should be applied to hidden
  @param effectsDisabled boolean true if thing should be applied to disabled
  @return self
]]
function TorpedoOptionsBuilder:Nest(thing, effectsHidden, effectsDisabled)
  table.insert(self.nestStack, { thing = thing, effectsHidden = effectsHidden, effectsDisabled = effectsDisabled })
  return self
end

--[[
  The validator is a wrapper around a set function that returns
  boolean[, string]. The boolean is true to indicate success, false
  to indicate error.
  
  The function is passed the config, the string name of the variable, 
  and the value to set.
]]
function TorpedoOptionsBuilder:SetValidator(validator)
  self.validator = validator
  return self
end

--[[
  Pops the last nested action off of the stack.
  
  @return self
  @see Nest(thing, effectsHidden, effectsDisabled)
]]
function TorpedoOptionsBuilder:Unnest()
  table.remove(self.nestStack)
  return self
end

--[[
  Gets the current disabled function based on the nest stack.
  
  @return function to set disabled to 
]]
function TorpedoOptionsBuilder:CurrentDisabledFunction()
  local args = {}
  
  for i=1, #self.nestStack do 
    if self.nestStack[i].effectsDisabled then 
      table.insert(args, self.nestStack[i].thing)
    end
  end
  
  return self:LogicalNorAggregateFunction(unpack(args))
end


--[[
  Gets the current hidden function based on the nest stack.
  
  @return function to set hidden to 
]]
function TorpedoOptionsBuilder:CurrentHiddenFunction()
  local args = {}
  
  for i=1, #self.nestStack do 
    if self.nestStack[i].effectsHidden then 
      table.insert(args, self.nestStack[i].thing)
    end
  end
  
  return self:LogicalNorAggregateFunction(unpack(args))
end

--[[
  Add a custom partial option. Its order, width, disabled, and hidden will 
  be overriden.
  
  @param custom the option table
  @return self
]]
function TorpedoOptionsBuilder:AddCustom(custom)
  custom.order = self:NextOrder()
  custom.disabled = self:CurrentDisabledFunction()
  custom.hidden = self:CurrentHiddenFunction()
  custom.width = 'full'
  
  table.insert(self.result, custom)
  return self
end

--[[
  Add a simple custom option, which has a simple get/set that maps 
  directly to the specified varName.
  
  @param custom the partial option table
  @param varName the key in the backing config 
  @return self
]]
function TorpedoOptionsBuilder:AddCustomAttachedToVar(custom, varName)
  if type(varName) ~= 'string' then error('Weird varName ' .. tostring(varName)) end
  
  local cacheConfig = self.config
  local cacheValidator = self.validator
  custom.get = function() return cacheConfig[varName] end
  custom.set = function(info, val) 
    if cacheConfig[varName] == val then return end
    
    if not cacheValidator then 
      cacheConfig[varName] = val 
    else 
      local succ, err = cacheValidator(cacheConfig, varName, val)
      if not succ then
        message(tostring(err))
      end
    end
  end
  return self:AddCustom(custom)
end

--[[
  Adds a simple toggle that is mapped to the specified varName.
  
  @param varName the key in the backing config
  @param optionName the name the user sees
  @param desc the hover text
  @return self
]]
function TorpedoOptionsBuilder:AddToggle(varName, optionName, desc)
  return self:AddCustomAttachedToVar({
    name = optionName,
    type = 'toggle',
    desc = desc
  }, varName)
end

--[[
  Adds a simple tristate tied to varName.
  
  Cycle is unchecked (ignore this) (val = false) -> checked and bright (val = true) -> checked and dark (val = nil)
  
  @param varname the key in the backing config 
  @param uncheckedName the name the user sees when unchecked
  @param checkedBrightName the name the user sees when checked and bright
  @param checkedDarkName the name the user sees when checked and dark
  @param desc the hover text
  @return self
]]
function TorpedoOptionsBuilder:AddTristate(varName, uncheckedName, checkedBrightName, checkedDarkName, desc)
  local cacheConfig = self.config
  return self:AddCustomAttachedToVar({
    name = function(info)
      local val = cacheConfig[varName]
      
      if val == nil then return checkedDarkName
      elseif val == true then return checkedBrightName
      elseif val == false then return checkedDarkName
      else error('type(val) = ' .. type(val) .. ', tostring(val) = ' .. tostring(val)) end
    end,
    type = 'toggle',
    tristate = true,
    desc = desc
  }, varName)
end

--[[
  Adds a simple range slider, tied to varName.
  
  @param varName The key in the backing config
  @param optionName The name the user sees above the slider
  @param desc The hover text
  @param minim The minimum value before things break / become illogical
  @param maxim The maximum value before things break / become illogical
  @param softMin The minimum value a user would need in most situations
  @param softMax The maximum value a user would need in most situations
  @param step The smallest step that could make any difference
  @param bigStep The step size that the slider will glue to
  @return self
]]
function TorpedoOptionsBuilder:AddRange(varName, optionName, desc, minim, maxim, softMin, softMax, step, bigStep)
  return self:AddCustomAttachedToVar({
    name = optionName,
    type = 'range',
    desc = desc,
    min = minim,
    max = maxim,
    softMin = softMin,
    softMax = softMax,
    step = step,
    bigStep = bigStep
  }, varName)
end

--[[
  Add a checkbox for checking something, which when unchecked opens two additional checkboxes,
  to check the minimum or maximum. When minimum is checked, a corresponding slider is shown. 
  Similiar situation for maximum.
  
  @param thingUpperCamel 
    Used to generate the corresponding varName
    
    check + thingUpperCamel -> top level checkbox
    hasMin + thingUpperCamel -> minimum checkbox
    min + thingUpperCamel -> minimum slider 
    hasMax + thingUpperCamel -> maximum checkbox
    max + thingUpperCamel -> maximum slider
  @param thingName The name of the thing, used to generate option names
  @param descTop The hover text for the top level check box
  @param descMinCheckbox The hover text for the minimum checkbox 
  @param descMinRange The hover text for the minimum range 
  @param descMaxCheckbox The hover text for the maximum checkbox 
  @param descMaxRange The hover text for the maximum range 
  @param minim The minimum value for the thing before things break / become illogical 
  @param maxim The maximum value for the thing before things break / become illogical 
  @param softMin The minimum value a user would need in most situations
  @param softmax The maximum value a user would need in most situations
  @param step The smallest step that could make any difference
  @param bigStep The step size that the slider will glue to 
  @return self
]]
function TorpedoOptionsBuilder:AddMinMaxCheck(thingUpperCamel, thingName, descTop, descMinCheckbox, descMinRange, descMaxCheckbox, descMaxRange, minim, maxim, softMin, softMax, step, bigStep)
  return self:AddToggle('check' .. thingUpperCamel,
    'Check ' .. string.lower(thingName),
    descTop
  )
  :Nest('check' .. thingUpperCamel, true, true)
  :AddToggle('hasMin' .. thingUpperCamel,
    'Have minimum ' .. string.lower(thingName),
    descMinCheckbox)
  :Nest('hasMin' .. thingUpperCamel, true, true)
  :AddRange('min' .. thingUpperCamel,
    'Minimum ' .. string.lower(thingName),
    descMinRange, minim, maxim, softMin, softMax, step, bigStep)
  :Unnest()
  :AddToggle('hasMax' .. thingUpperCamel,
    'Have maximum ' .. string.lower(thingName),
    descMaxCheckbox)
  :Nest('hasMax' .. thingUpperCamel, true, true)
  :AddRange('max' .. thingUpperCamel,
    'Maximum ' .. string.lower(thingName),
    descMaxRange, minim, maxim, softMin, softMax, step, bigStep)
  :Unnest()
  :Unnest()
end

--[[
  Builds the options table and returns the result.
  
  @return a table ready for AceConfig-3.0
]]
function TorpedoOptionsBuilder:Build()
  if #self.nestStack > 0 then 
    error('Attempting to build while nested!', 2)
  end
  
  local final = {
    type = 'group',
    order = self.order,
    args = {}
  }
  
  for i = 1, #self.result do 
    final.args['param' .. tostring(i)] = self.result[i]
  end
  
  return final
end