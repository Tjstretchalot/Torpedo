local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')

local MAJOR, MINOR = 'TorpedoAuras-1.0', 1
local TorpedoAuras = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoAuras then return end

function TorpedoAuras:New(o)
  Utils:CheckTypes({name = 'string', debugName = 'string', aura_id = 'number', icon_id = 'number', target = 'string', max_duration = 'number'}, o)
  
  setmetatable(o, self)
  self.__index = self
  return o
end

function TorpedoAuras:Info(context)
  local unitInfo = context.auras[self.target]
  
  if not unitInfo then 
    print('No unit info for ' .. self.target .. '; this is likely a bug')
    return nil 
  end
  
  for i=1, #unitInfo do 
    if unitInfo[i].spellId == self.aura_id then return unitInfo[i] end
  end
  
  return nil
end

function TorpedoAuras:TimeRemaining(context)
  local info = self:Info(context)
  if not info then return -1 end
  
  if info.duration == 0 then return 0 end
  local result = info.expirationTime - context.timestamp
  if result < 0 then return 0 end
  return result
end

function TorpedoAuras:Serializable()
  local res = {}
  res.name = self.name
  res.debugName = self.debugName
  res.aura_id = self.aura_id
  res.icon_id = self.icon_id
  res.target = self.target
  res.max_duration = self.max_duration
  res.is_stealthy = self.is_stealthy
  res.hidden = self.hidden
  
  return res
end

function TorpedoAuras:Unserialize(ser)
  local name = ser.name
  local debugName = ser.debugName
  local aura_id = ser.aura_id
  local icon_id = ser.icon_id
  local target = ser.target
  local max_duration = ser.max_duration
  local is_stealthy = ser.is_stealthy
  local hidden = ser.hidden
  
  local res = TorpedoAuras:New({
    name = name, debugName = debugName, aura_id = aura_id, 
    icon_id = icon_id, target = target, max_duration = max_duration,
    is_stealthy = is_stealthy, hidden = hidden
  })
  
  return res
end