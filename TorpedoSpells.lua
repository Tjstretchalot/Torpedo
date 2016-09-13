local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')

local MAJOR, MINOR = 'TorpedoSpells-1.0', 1
local TorpedoSpells = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoSpells then return end

function TorpedoSpells:New(o)
  Utils:CheckTypes({ name = 'string', debugName = 'string', spell_id = 'number' }, o)
  if type(o.icon_id) ~= 'number' and type(o.icon_id) ~= 'string' then 
    error('Expected o.icon_id to be a number or a string, but it is ' .. type(o.icon_id), 2)
  end
  
  setmetatable(o, self)
  self.__index = self
  return o
end

function TorpedoSpells:Info(context)
  for i=1, #context.cooldowns do 
    local cd = context.cooldowns[i]
    if cd.spellId == self.spell_id then 
      return cd
    end
  end
  
  return nil
end

function TorpedoSpells:TimeRemaining(context)
  local info = self:Info(context)
  if not info then 
    error('No cooldown information for me (name=' .. tostring(self.name) .. ', spell_id=' .. tostring(self.spell_id) .. ')', 2)
  end
  
  local result = info.start + info.duration - context.timestamp
  if result < 0 then return 0 end
  return result
end

function TorpedoSpells:NumberOfCharges(context)
  local info = self:Info(context)
  if not info or not info.chargeInfo then
    error('No charges information for me (name=' .. tostring(self.name) .. ', spell_id=' .. tostring(self.spell_id) .. ')', 2)
  end
  
  return info.chargeInfo.charges
end

function TorpedoSpells:Serializable()
  local res = {}
  res.name = self.name
  res.debugName = self.debugName
  res.spell_id = self.spell_id
  res.icon_id = self.icon_id
  res.cooldown = self.cooldown
  res.charges = self.charges
  
  return res
end

function TorpedoSpells:Unserialize(ser)
  local name = ser.name
  local debugName = ser.debugName
  local spell_id = ser.spell_id
  local icon_id = ser.icon_id
  local cooldown = ser.cooldown
  local charges = ser.charges
  
  return TorpedoSpells:New({
    name = name, debugName = debugName,
    spell_id = spell_id, icon_id = icon_id,
    cooldown = cooldown, charges = charges
  })
end