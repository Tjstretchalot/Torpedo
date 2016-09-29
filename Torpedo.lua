local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
local Context = LibStub:GetLibrary('TorpedoContext-1.0')
local GUI = LibStub:GetLibrary('TorpedoGUI-1.0')
local FightAnalyzer = LibStub:GetLibrary('TorpedoFightAnalyzer-1.0')

local Torpedo = LibStub('AceAddon-3.0'):NewAddon('Torpedo', 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

TorpedoDB_2 = {}

function Torpedo:OnInitialize()
  local defaultConfig = LibStub:GetLibrary('TorpedoDefaultConfig-1.0')
  
  if not TorpedoDB_2.profiles then
    TorpedoDB_2 = defaultConfig
  end
  
  self.config = Configs:Unserialize(TorpedoDB_2)
  
  local me = self
  local rebuild_opt = function() me:RebuildOptions() end
  local update_gui = function() me:UpdateGUI() end
  self.optionsTable = self.config:CreateOptions(rebuild_opt, update_gui)
  
  LibStub('AceConfig-3.0'):RegisterOptionsTable('Torpedo', self.optionsTable)
  self.optionsFrame = LibStub('AceConfigDialog-3.0'):AddToBlizOptions('Torpedo', 'Torpedo')
  
  self.gui = GUI:New({})
end

function Torpedo:RebuildOptions()
  for k,v in pairs(self.optionsTable) do
    self.optionsTable[k] = nil
  end
  
  local me = self
  local rebuild_opt = function() me:RebuildOptions() end
  local update_gui = function() me:UpdateGUI() end
  local newOpt = self.config:CreateOptions(rebuild_opt, update_gui)
  
  for k,v in pairs(newOpt) do
    self.optionsTable[k] = v
  end
end

function Torpedo:OnEnable()
  self.gui:Init()
  self.gui:DisableDefaultGlow()
  self.gui:CreateOverlayGlows()
  
  self:RegisterEvent('PLAYER_LOGIN')
  self:RegisterEvent('PLAYER_LOGOUT')
  self:RegisterEvent('UNIT_FACTION')
  self:RegisterEvent('UNIT_CLASSIFICATION_CHANGED')
  self:RegisterEvent('PLAYER_TARGET_CHANGED')
  self:RegisterEvent('PLAYER_TALENT_UPDATE')
  self:RegisterEvent('ACTIONBAR_SLOT_CHANGED')
  self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
  self:RegisterEvent('PLAYER_REGEN_ENABLED')
  
  self:ScheduleRepeatingTimer('TimerTick', 0.05, self)
  
  self:UpdateEverything()
end

function Torpedo:OnDisable()
  self:Save()
  self:CancelAllTimers()
  self.gui:Hide()
end

function Torpedo:Save()
  for k,v in pairs(TorpedoDB_2) do
    TorpedoDB_2[k] = nil
  end
  
  local newDb = self.config:Serializable()
  
  for k,v in pairs(newDb) do
    TorpedoDB_2[k] = v  
  end
end

-- Utility
function Torpedo:UnitIsTarget(unitId)
  return UnitIsUnit(unitId, 'target')
end

function Torpedo:BuildContext()
  return self.config:GetActiveProfile():BuildContext(self.fightAnalyzer, self.TargetInfo)
end

-- Updating cache
function Torpedo:UpdateSpecialization()
  self.myGuid = UnitGUID('player')
  if self.fightAnalyzer then 
    self.fightAnalyzer.myGuid = self.myGuid
    self.fightAnalyzer:Clear()
  end
  
  local specNum = GetSpecializationInfo(GetSpecialization())
  self.config:SetActiveSpecialization(specNum)
end

function Torpedo:UpdateGUI()
  self.gui:SetGUIConfig(self.config:GetActiveProfile().gui_settings)
end

function Torpedo:BuildTargetInfo()
  local result = {}
  result.exists = UnitExists('target')
  
  if result.exists then 
    result.hostile = UnitCanAttack('player', 'target')
    result.dead = UnitIsDead('target')
    result.guid = UnitGUID('target')
    result.name = UnitName('target')
  end
  
  return result
end

function Torpedo:UpdateTarget(considerHideGui)
  if not self.fightAnalyzer then 
    self.fightAnalyzer = FightAnalyzer:New({})
    self.fightAnalyzer.myGuid = self.myGuid
  end
  self.TargetInfo = self:BuildTargetInfo()
  
  if considerHideGui then
    if not self.TargetInfo.exists or not self.TargetInfo.hostile or self.TargetInfo.dead then 
      self.fightAnalyzer.CurrentContext = self:BuildContext()
      self.gui:Hide()
    end
  end
end

function Torpedo:UpdateEverything()
  self.gui:Hide()
  self:UpdateSpecialization()
  self:UpdateTarget(false)
  self:UpdateGUI()
end

-- Events
function Torpedo:PLAYER_LOGIN()
  self:UpdateEverything()
end

function Torpedo:UNIT_FACTION(unitId)
  if self:UnitIsTarget(unitId) then 
    self:UpdateTarget(true)
  end
end

function Torpedo:UNIT_CLASSIFICATION_CHANGED(unitId)
  if self:UnitIsTarget(unitId) then 
    self:UpdateTarget(true)
  end
end

function Torpedo:PLAYER_TARGET_CHANGED(unitId)
  self:UpdateTarget(true)
end

function Torpedo:PLAYER_TALENT_UPDATE()
  self:UpdateEverything()
end

function Torpedo:ACTIONBAR_SLOT_CHANGED()
  self.gui:UpdateGlows()
end

function Torpedo:PLAYER_REGEN_ENABLED()
  self.fightAnalyzer:Clear()
end

function Torpedo:PLAYER_LOGOUT()
  self:Save()
end

function Torpedo:COMBAT_LOG_EVENT_UNFILTERED(...)
  if self.fightAnalyzer then 
    self.fightAnalyzer:CombatLogEventUnfiltered(...)
  end
end

-- Main timer
function Torpedo:TimerTick()
  if not self.TargetInfo or not self.TargetInfo.exists or not self.TargetInfo.hostile or self.TargetInfo.dead then return end
  
  local context = self:BuildContext()
  local primarySugg, primarySuggRes = self.config:GetSuggestion(context, true)
  local secondarySugg, secondarySuggRes = self.config:GetSuggestion(context, false)
  
  self.gui:SetPrimarySuggestion(primarySugg, primarySuggRes)
  self.gui:SetSecondarySuggestion(secondarySugg, secondarySuggRes)
end
