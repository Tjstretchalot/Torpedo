--[[
  Functional dynamic behavior tree - maintains a set of functions that 
  either return a suggestion or nil, and a priority for each function.
  Functions are called in descending priority until either all functions 
  have been called or one returns a suggestion. If a suggestion is returned,
  that suggestion is passed to the user, otherwise no suggestion is given
  to the user.
  
  Does not allow for priority collisions.
]]

local MAJOR, MINOR = 'TorpedoAI-1.0', 1
local TorpedoAI = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoAI then return end

-- TorpedoAILib - the actual object doing all of the work --
local TorpedoAILib = {}

--[[
  Registers the specified function with the specified priority.
  Throws an error if there is a priority collision 
  
  @param priority - the priority of the function.
  @param func     - the function to register.
]]
function TorpedoAILib:RegisterSuggestion(priority, func)
  if type(priority) ~= 'number' then
    error('Usage: ai:RegisterSuggestion(priority, func) - priority: number expected, got ' .. type(priority), 2)
  end
  if type(func) ~= 'function' then 
    error('Usage: ai:RegisterSuggestion(priority, func) - func: function expected, got ' .. type(func), 2)
  end
  if self:IsPriorityRegistered(priority) then 
    error('Usage: ai:RegisterSuggestion(priority, func) - priority: ' .. tostring(priority) .. ' is already registered', 2)
  end
  
  -- Sorted descending insert --
  local toInsert = { func=func, priority=priority }
  local indToInsert = 1
  while indToInsert <= #self.suggestionFunctions do 
    if self.suggestionFunctions[indToInsert].priority < priority then 
      break
    end
    indToInsert = indToInsert + 1
  end
  if indToInsert > #self.suggestionFunctions then 
    table.insert(self.suggestionFunctions, toInsert)
  else
    table.insert(self.suggestionFunctions, indToInsert, toInsert)
  end
end

--[[
  Gets the suggestion from the registered suggestions, by iterating through
  each registered suggestion in descending order of priority until one returns
  something, unless none return anything in which this returns nil
  
  @param ... will be passed to suggestion functions
  @return something or nil
]]
function TorpedoAILib:GetSuggestion(...)
  for i=1, #self.suggestionFunctions do 
    local res = self.suggestionFunctions[i]:func(...)
    
    if res then return res end
  end
  
  return nil
end

--[[
  Checks if the specified priority is already registered. 
  
  @param priority the priority 
  @result true if priority is registered, false otherwise
]]
function TorpedoAILib:IsPriorityRegistered(priority)
  for _, val in ipairs(self.suggestionFunctions) do 
    if val.priority == priority then return true end
  end
  
  return false
end

--[[
  Initializes a new torpedo ai 
]]
function TorpedoAI:New()
  local result = {}
  setmetatable(result, TorpedoAILib)
  TorpedoAILib.__index = TorpedoAILib
  
  result.suggestionFunctions = {}
  return result
end