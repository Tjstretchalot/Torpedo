local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')

local MAJOR, MINOR = 'TorpedoFightSummary-1.0', 1
local TorpedoFightSummary = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoFightSummary then return end

TorpedoFightSummary.UNKNOWN = math.huge

function TorpedoFightSummary:New(o)
  Utils:CheckTypes({
    fight_start_time = 'number',
    avg_player_dps = 'number',
    avg_raid_dps = 'number',
    cached_spell_contexts = 'table',
    predicted_time_to_kill_target_solo = 'number',
    predicted_time_to_kill_target_raid = 'number'
    
  }, o)
  setmetatable(o, self)
  self.__index = self
  return o
end
