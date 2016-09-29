local MAJOR, MINOR = 'TorpedoUtils-1.0', 1
local TorpedoUtils = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoUtils then return end

function TorpedoUtils:CheckTypes(expected, actual)
  local haveError = false
  local errorStr = ''
  
  for key, val in pairs(expected) do 
    if type(actual[key]) ~= val then 
      if not haveError then
        haveError = true
      else
        errorStr = errorStr .. '; '
      end
      errorStr = errorStr .. 'Expected ' .. tostring(key) .. ' to be type ' .. tostring(val) .. ' but it is ' .. type(actual[key])
    end
  end
  
  if haveError then
    error(errorStr)
  end
end

function TorpedoUtils:tcopy(arr)
  local res = {}
  for k,v in pairs(arr) do 
    if type(v) == 'table' then 
      res[k] = self:tcopy(v)
    else
      res[k] = v
    end
  end
  return res
end
