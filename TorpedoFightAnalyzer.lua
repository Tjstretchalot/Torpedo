--[[
  This library is what makes analyzing bleed multipliers, multiple targets,
  and time to kill possible.
  
  For bleed multipliers, the fight analyzer will capture the current context 
  for spells which the specialization designates necessary. This might take 
  a pretty large amount of memory, but shouldn't result in much additional CPU 
  cost, since we were creating new context tables either way.
]]

local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
local FightSummary = LibStub:GetLibrary('TorpedoFightSummary-1.0')
local SkadaLocale = LibStub('AceLocale-3.0'):GetLocale('Skada', true)

local MAJOR, MINOR = 'TorpedoFightAnalyzer-1.0', 1
local TorpedoFightAnalyzer = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoFightAnalyzer then return end

function TorpedoFightAnalyzer:New(o)
  Utils:CheckTypes({}, o)
  setmetatable(o, self)
  self.__index = self
  
  o:__Init()
  o:__AttemptInitSkada()
  return o
end

-- This is mostly to see all the variables in this object --
function TorpedoFightAnalyzer:__Init()
  self.Skada = nil
  self.Window = nil
  self.CurrentContext = nil
  self.MonitorSpells = {}
  self.myGuid = UnitGUID('player')
  
  --print('__Init called - spells with context captured cleared')
  self.SpellsWithContextCaptured = {}
end

function TorpedoFightAnalyzer:__AttemptInitSkada()
  self.Skada = LibStub('AceAddon-3.0'):GetAddon('Skada', true)
  if not self.Skada then 
    print('Torpedo: Skada not detected - time to kill and related options disabled.')
    return
  end
  
  self.Window = getmetatable(self.Skada:GetWindows()[1]).__index -- This is what happens when required hookin variables are local 
  if not self.Window then 
    print('Torpedo: Failed to hook into skada - time to kill and related options disabled.')
    self.Skada = nil
  end
end

function TorpedoFightAnalyzer:SetCurrentContext(context)
  self.CurrentContext = context
end

function TorpedoFightAnalyzer:SetSpellsToMonitor(monitorSpells)
  self.SpellsWithContextCaptured = {}
  self.MonitorSpells = monitorSpells
  -- print('Set spells to monitor called - spells with context captured cleared')
end

function TorpedoFightAnalyzer:ShouldMonitor(spellId)
  for i=1, #self.MonitorSpells do 
    local spell = self.MonitorSpells[i]
    
    if spell.spell_id == spellId then return spell end
  end
  return false
end

--[[
  Sets this analyzer up for the next fight
]]
function TorpedoFightAnalyzer:Clear()
  self.CurrentContext = nil
  self.DebuffTable = {} 
  self.SpellsWithContextCaptured = {}
end

function TorpedoFightAnalyzer:CombatLogEventUnfiltered(evName, the_time, eventType, hideCaster, srcGuid, srcName, srcFlags1, srcFlags2, dstGuid, dstName, destFlags1, destFlags2, spellId)
  if #self.MonitorSpells > 0 and self.CurrentContext and self.myGuid == srcGuid and eventType == 'SPELL_CAST_SUCCESS' and self.CurrentContext.target_info.exists then
    local relSpell = self:ShouldMonitor(spellId)
    if relSpell then 
      local index = #self.SpellsWithContextCaptured + 1 
      for i=1, #self.SpellsWithContextCaptured do 
        local sCCap = self.SpellsWithContextCaptured[i]
        
        if sCCap.spellId == spellId and sCCap.context.target_info.guid == self.CurrentContext.target_info.guid then
          index = i
          break
        end
      end
      -- print('Monitoring spell ' .. tostring(spellId) .. ' (' .. tostring(relSpell.name) .. ') at index ' .. tostring(index))
      self.SpellsWithContextCaptured[index] = { 
        context = self.CurrentContext, 
        spellId = spellId, 
        dstGuid = dstGuid,
        relevantSpell = relSpell
      }
    end
  end
end

function TorpedoFightAnalyzer:FindDPSMode()
  local modes = self.Skada:GetModes()
  
  for i=1, #modes do 
    local mode = modes[i]
    
    if mode:GetName() == SkadaLocale['DPS'] then return mode end
  end
  
  return nil
end

--[[
  Returns a fight summary so far
]]
function TorpedoFightAnalyzer:Analyze()
  local fight_start_time, avg_player_dps, avg_raid_dps, predicted_time_to_kill_target_solo, predicted_time_to_kill_target_raid, cached_spell_contexts
  
  -- Calculating damage 
  if not self.Skada or (not self.Skada.current and not self.Skada.total) then 
    fight_start_time = FightSummary.UNKNOWN
    avg_player_dps = FightSummary.UNKNOWN
    avg_raid_dps = FightSummary.UNKNOWN
  else 
    local report_set = self.Skada.current
    if not report_set then
      report_set = self.Skada.total 
    end
    
    do 
      -- request the updated damage information
      local report_table = self.Window:new()
      local report_mode = self:FindDPSMode()
      
      if report_mode then
        report_mode:Update(report_table, report_set)
        
        -- Prune it to the essentials
        local my_player_info
        
        avg_raid_dps = 0
        fight_start_time = report_set.starttime
        
        for i=1, #report_table.dataset do 
          local player_info = report_table.dataset[i]
          
          avg_raid_dps = avg_raid_dps + math.floor(player_info.value)
          if player_info.id == self.myGuid then 
            my_player_info = player_info
          end
        end
        
        if not my_player_info then 
          avg_player_dps = FightSummary.UNKNOWN
        else
          avg_player_dps = my_player_info.value
        end
      else 
        fight_start_time = FightSummary.UNKNOWN
        avg_player_dps = FightSummary.UNKNOWN
        avg_raid_dps = FightSummary.UNKNOWN
      end
    end
  end
  
  
  -- Calculate player debuffs
  cached_spell_contexts = {}
  for k,v in pairs(self.SpellsWithContextCaptured) do 
    cached_spell_contexts[k] = v -- shallow copy is fine here
  end
  
  predicted_time_to_kill_target_solo = FightSummary.UNKNOWN
  predicted_time_to_kill_target_raid = FightSummary.UNKNOWN
  local tarHealth = UnitHealth('target')
  if UnitExists('target') and tarHealth > 0 then 
    if avg_raid_dps ~= FightSummary.UNKNOWN and avg_raid_dps > 0 then 
      predicted_time_to_kill_target_raid = tarHealth / avg_raid_dps
    end
    if avg_player_dps ~= FightSummary.UNKNOWN and avg_player_dps > 0 then 
      predicted_time_to_kill_target_solo = tarHealth / avg_player_dps
    end
  end
  
  local res = FightSummary:New({
    fight_start_time = fight_start_time,
    avg_player_dps = avg_player_dps,
    avg_raid_dps = avg_raid_dps,
    cached_spell_contexts = cached_spell_contexts,
    predicted_time_to_kill_target_solo = predicted_time_to_kill_target_solo,
    predicted_time_to_kill_target_raid = predicted_time_to_kill_target_raid
  })
  
  return res
end