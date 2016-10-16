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

function TorpedoUtils:strstarts(str, start)
   return string.sub(str,1,string.len(start))==start
end

function TorpedoUtils:strends(str, ends)
   return ends=='' or string.sub(str,-string.len(ends))==ends
end

function TorpedoUtils:strlines(str, ignoreEmpty)
  local t = {}
  
  local function helper(line) 
    if not ignoreEmpty or string.len(line) > 0 then
      table.insert(t, line) 
    end
    return "" 
  end
  
  helper((str:gsub("(.-)\r?\n", helper)))
  return t
end

-- from http://lua-users.org/wiki/BaseSixtyFour by Alex Kloss modified for Torpedo
-- bitshift functions (<<, >> equivalent)
-- shift left
function TorpedoUtils:lsh(value,shift)
	return (value*(2^shift)) % 256
end

-- shift right
function TorpedoUtils:rsh(value,shift)
	return math.floor(value/2^shift) % 256
end

-- return single bit (for OR)
function TorpedoUtils:bit(x,b)
	return (x % 2^b - x % 2^(b-1) > 0)
end

-- logic OR for number values
function TorpedoUtils:lor(x,y)
	result = 0
	for p=1,8 do result = result + (((self:bit(x,p) or self:bit(y,p)) == true) and 2^(p-1) or 0) end
	return result
end