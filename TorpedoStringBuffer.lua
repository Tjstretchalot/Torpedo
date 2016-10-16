local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')


local MAJOR, MINOR = 'TorpedoStringBuffer-1.0', 1
local TorpedoStringBuffer = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoStringBuffer then return end

--[[
  Creates a new string buffer, optionally from an existing string
  
  @param strOrNil either a string or nil
]]
function TorpedoStringBuffer:New(strOrNil)
  local result = {}
  
  setmetatable(result, self)
  self.__index = self
  result:__Init()
  
  if type(strOrNil) == 'string' then 
    result:Append(strOrNil)
  elseif type(strOrNil) ~= 'nil' then 
    error('Weird parameter of type ' .. type(strOrNil) .. ' sent in: ' .. type(strOrNil).. ', string or nil expected', 2)
  end
  
  return result
end

--[[
  Prepares this string buffer to be used
]]
function TorpedoStringBuffer:__Init()
  self.stack = { "" }
end

--[[
  Appends the specified string to the string buffer. Uses the same 
  method as described at https://www.lua.org/pil/11.6.html
]]
function TorpedoStringBuffer:Append(str)
  table.insert(self.stack, str)
  for i=#self.stack - 1, 1, -1 do 
    if string.len(self.stack[i]) > string.len(self.stack[i + 1]) then 
      break
    end
    
    self.stack[i] = self.stack[i] .. table.remove(self.stack)
  end
  
  return self
end

--[[
  Builds the resulting string
]]
function TorpedoStringBuffer:BuildString()
  for i=#self.stack - 1, 1, -1 do 
    self.stack[i] = self.stack[i] .. table.remove(self.stack)
  end
  
  return self.stack[1]
end