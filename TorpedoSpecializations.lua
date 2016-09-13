local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
local Suggestions = LibStub:GetLibrary('TorpedoSuggestions-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
local Context = LibStub:GetLibrary('TorpedoContext-1.0')

local MAJOR, MINOR = 'TorpedoSpecializations-1.0', 1
local TorpedoSpecializations = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoSpecializations then return end

function TorpedoSpecializations:New(o)
  Utils:CheckTypes({ name = 'string', specialization_id = 'number' }, o)
  setmetatable(o, self)
  self.__index = self
  
  o:__Init()
  return o
end

function TorpedoSpecializations:__Init()
  self.skills = {}
  self.auras = {}
  self.cooldowns = {}
  local me = self
  self.validator = function(sugg, config, varName, val)
    if varName ~= 'priority' then 
      config[varName] = val
      return true
    end
    
    for i=1, #me.skills do 
      for j=1, #me.skills[i].suggestions do 
        if me.skills[i].suggestions[j].priority == val then 
          return false, 'Priority conflict: ' .. tostring(me.skills[i].name) .. ' option ' .. tostring(j) .. ' already has that priority (' .. tostring(val) .. ')'
        end
      end
    end
    
    config[varName] = val
    return true
  end
end

function TorpedoSpecializations:SetValidator(validator)
  for i=1, #self.skills do 
    self.skills[i]:SetValidator(validator)
  end
  
  self.validator = validator
end

--[[
  Determines a reasonable new priority for a spell
]]
function TorpedoSpecializations:NewPriority()
  local lowestPriority
  
  for i=1, #self.skills do 
    for j=1, #self.skills[i].suggestions do 
      if not lowestPriority or lowestPriority > self.skills[i].suggestions[j].priority then 
        lowestPriority = self.skills[i].suggestions[j].priority
      end
    end
  end
  
  if not lowestPriority then lowestPriority = 501 end
  return lowestPriority - 1
end

function TorpedoSpecializations:AddSkill(spell)
  for i=1, #self.skills do 
    if self.skills[i].spell.debugName == spell.debugName then 
      error('Debug name conflict (' .. tostring(spell.debugName) .. ')', 2)
    end
  end
  
  local skill = Skills:New({ name = spell.name, spell = spell })
  skill:SetValidator(self.validator)
  
  for i=1, #self.auras do 
    skill:RegisterAura(self.auras[i])
  end
  for i=1, #self.cooldowns do 
    skill:RegisterCooldown(self.cooldowns[i])
  end
  
  table.insert(self.skills, skill)
end

function TorpedoSpecializations:GetSkillByDebugName(debugName)
  for i=1, #self.skills do 
    if self.skills[i].spell.debugName == debugName then 
      return self.skills[i]
    end
  end
end

function TorpedoSpecializations:RegisterAura(aura)
  for i=1, #self.skills do 
    self.skills[i]:RegisterAura(aura)
  end
  
  table.insert(self.auras, aura)
end

function TorpedoSpecializations:RegisterCooldown(cooldown)
  for i=1, #self.skills do 
    self.skills[i]:RegisterCooldown(cooldown)
  end
  
  table.insert(self.cooldowns, cooldown)
end

function TorpedoSpecializations:GetSuggestion(context, primary)
  local bestSugg, bestResult, bestPriority
  
  for i=1, #self.skills do 
    local skill = self.skills[i]
    for j=1, #self.skills[i].suggestions do 
      local sugg = skill.suggestions[j]
      
      if not bestPriority or sugg.priority > bestPriority then 
        local meetsReq = sugg:MeetsRequirements(context, primary)
        if meetsReq ~= SuggestionResult.DO_NOT_SUGGEST then 
          bestSugg = sugg
          bestResult = meetsReq
          bestPriority = sugg.priority
        end
      end
    end
  end
  
  return bestSugg, bestResult
end

function TorpedoSpecializations:CreateOptions(order, rebuild_opt)
  local me = self
  local new_prio_func = function()
    return me:NewPriority()
  end
  
  local result = {
    name = self.name,
    order = order,
    type = 'group',
    args = {}
  }
  
  for i=1, #self.skills do 
    local key = 'param' .. tostring(i)
    
    result.args[key] = self.skills[i]:CreateOptions(i, rebuild_opt, new_prio_func)
  end
  
  return result
end

function TorpedoSpecializations:BuildContext()
  local auras = {
    player = {},
    target = {}
  }
  
  local c=1, auraName, count, duration, expirationTime, unitCaster, spellId
  while true do 
    auraName, _, _, count, _, duration, expirationTime, unitCaster, _, _, spellId = UnitBuff('player', c)
    if not spellId then break end
    if unitCaster == 'player' then 
      local cache = {}
      cache.name = auraName
      cache.count = count
      cache.duration = duration
      cache.expirationTime = expirationTime
      cache.spellId = spellId
      auras.player[#auras.player + 1] = cache
    end
    c = c + 1
  end
  
  c = 1
  while true do 
    auraName, _, _, count, _, duration, expirationTime, unitCaster, _, _, spellId = UnitDebuff('target', c)
    if not spellId then break end
    if unitCaster == 'player' then 
      local cache = {}
      cache.name = auraName
      cache.count = count
      cache.duration = duration
      cache.expirationTime = expirationTime
      cache.spellId = spellId
      auras.target[#auras.target + 1] = cache
    end
    c = c + 1
  end
  
  local cooldowns = {}
  for i=1, #self.cooldowns do 
    local spell = self.cooldowns[i]
    
    local cdStart, cdDuration = GetSpellCooldown(spell.spell_id)
    cooldowns[#cooldowns + 1] = {
      spellId = spell.spell_id, start = cdStart, duration = cdDuration
    }
    
    if spell.charges then 
      local charges, maxCharges, start, duration = GetSpellCharges(spell.spell_id)
      
      cooldowns[#cooldowns].chargeInfo = {
        charges = charges, maxCharges = maxCharges, start = start, duration = duration
      }
    end
  end
  
  local timestamp = GetTime()
  
  local power = UnitPower('player')
  local maxPower = UnitPowerMax('player')
  local comboPoints = GetComboPoints('player', 'target')
  local maxComboPoints = 5
  
  local _, _, _, _, _, _, _, _, _, selected = GetTalentInfoByID(19239) -- deeper stratagem
  if selected then 
    maxComboPoints = 6
  end
  
  local health = UnitHealth('player')
  local maxHealth = UnitHealthMax('player')
  
  local tmp_context = {
    auras = auras, cooldowns = cooldowns, timestamp = timestamp, power = power,
    max_power = maxPower, combo_points = comboPoints, max_combo_points = maxComboPoints,
    health = health, max_health = maxHealth
  }
  
  local stealthy = false
  for i=1, #self.auras do 
    if self.auras[i].is_stealthy then 
      if self.auras[i]:TimeRemaining(tmp_context) >= 0 then
        stealthy = true
        break
      end
    end
  end
  tmp_context.stealthy = stealthy
  
  tmp_context.combat = InCombatLockdown()
  
  return Context:New(tmp_context)
end

function TorpedoSpecializations:Serializable()
  local res = {}
  
  res.name = self.name
  res.specialization_id = self.specialization_id
  res.auras = {}
  for i=1, #self.auras do 
    table.insert(res.auras, self.auras[i]:Serializable())
  end
  res.cooldowns = {}
  for i=1, #self.cooldowns do 
    table.insert(res.cooldowns, self.cooldowns[i]:Serializable())
  end
  res.skills = {}
  for i=1, #self.skills do 
    table.insert(res.skills, self.skills[i]:Serializable())
  end
  
  return res
end

function TorpedoSpecializations:Unserialize(ser)
  local name = ser.name
  local specialization_id = ser.specialization_id
  local auras = {}
  for i=1, #ser.auras do 
    table.insert(auras, Auras:Unserialize(ser.auras[i]))
  end
  local cooldowns = {}
  for i=1, #ser.cooldowns do 
    table.insert(cooldowns, Spells:Unserialize(ser.cooldowns[i]))
  end
  local skills = {}
  for i=1, #ser.skills do 
    table.insert(skills, Skills:Unserialize(ser.skills[i]))
  end
  
  local res = TorpedoSpecializations:New({ name = name, specialization_id = specialization_id })
  res.auras = auras
  res.cooldowns = cooldowns
  res.skills = skills
  
  res:SetValidator(res.validator)
  return res
end