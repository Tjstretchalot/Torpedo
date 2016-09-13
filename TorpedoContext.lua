local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')

local MAJOR, MINOR = 'TorpedoContext-1.0', 1
local TorpedoContext = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoContext then return end

function TorpedoContext:New(o)
  Utils:CheckTypes({
    auras = 'table', cooldowns = 'table', timestamp = 'number', power = 'number',
    max_power = 'number', combo_points = 'number', max_combo_points = 'number',
    health = 'number', max_health = 'number', stealthy = 'boolean', combat = 'boolean'
  }, o)
  
  setmetatable(o, self)
  self.__index = self
  return o
end