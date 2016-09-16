local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
local Suggestions = LibStub:GetLibrary('TorpedoSuggestions-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
local Context = LibStub:GetLibrary('TorpedoContext-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')

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
  
  
  -- This is used for adding new skills (advanced feature)
  self.new_skill_info = {
    spell = {
      name = '',
      debugName = '',
      spell_id = '',
      icon_id = '',
      cooldown = '',
      charges = ''
    }
  }
  
  self.new_cooldown_info = {
    spell = {
      name = '',
      debugName = '',
      spell_id = '',
      icon_id = '',
      cooldown = '',
      charges = ''
    }
  }
  
  self.new_aura_info = {
    name = '',
    debugName = '',
    aura_id = '',
    icon_id = '',
    target = '',
    max_duration = ''
  }
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
  
  local advanced_features_func = function()
    return me.advanced_features
  end
  
  local result = {
    name = self.name,
    order = order,
    type = 'group',
    args = {
      param1 = {
        name = Constants.TOGGLE_ADVANCED_FEATURES_NAME,
        desc = Constants.TOGGLE_ADVANCED_FEATURES_DESC,
        order = 1,
        type = 'toggle',
        get = advanced_features_func,
        set = function(info, val) me.advanced_features = val end,
        width = 'full'
      },
      param2 = {
        name = Constants.ADD_NEW_SKILL_GROUP_NAME,
        order = 2,
        type = 'group',
        inline = true,
        hidden = function() return not me.advanced_features end,
        args = {
          param1 = {
            name = Constants.ADD_NEW_SKILL_DESCRIPTION_NAME,
            order = 1,
            type = 'description',
            width = 'full'
          },
          param2 = {
            name = Constants.ADD_NEW_SKILL_SPELL_NAME_NAME,
            desc = Constants.ADD_NEW_SKILL_SPELL_NAME_DESC,
            order = 2,
            type = 'input',
            get = function() return me.new_skill_info.spell.name end,
            set = function(info, val) 
              me.new_skill_info.spell.name = val 
              
              local name, _, icon, _, _, _, id = GetSpellInfo(val)
              if name and name == val then 
                me.new_skill_info.spell.icon_id = tostring(icon)
                me.new_skill_info.spell.spell_id = tostring(id)
                me.new_skill_info.spell.debugName = string.gsub(val, '%s+', '')
              end
            end,
            width = 'full'
          },
          param3 = {
            name = Constants.ADD_NEW_SKILL_SPELL_DEBUGNAME_NAME,
            desc = Constants.ADD_NEW_SKILL_SPELL_DEBUGNAME_DESC,
            order = 3,
            type = 'input',
            get = function() return me.new_skill_info.spell.debugName end,
            set = function(info, val) 
              me.new_skill_info.spell.debugName = string.gsub(val, '%s+', '')
            end,
            width = 'full'
          },
          param4 = {
            name = Constants.ADD_NEW_SKILL_SPELL_SPELLID_NAME,
            desc = Constants.ADD_NEW_SKILL_SPELL_SPELLID_DESC,
            order = 4,
            type = 'input',
            get = function() return me.new_skill_info.spell.spell_id end,
            set = function(info, val) 
              if tonumber(val) ~= nil then 
                me.new_skill_info.spell.spell_id = val 
              end
            end,
            width = 'full'
          },
          param5 = {
            name = Constants.ADD_NEW_SKILL_SPELL_ICONID_NAME,
            desc = Constants.ADD_NEW_SKILL_SPELL_ICONID_DESC,
            order = 5,
            type = 'input',
            get = function() return me.new_skill_info.spell.icon_id end,
            set = function(info, val)
              if tonumber(val) ~= nil then
                me.new_skill_info.spell.icon_id = val 
              end
            end,
            width = 'full'
          },
          param6 = {
            name = Constants.ADD_NEW_SKILL_SPELL_COOLDOWN_NAME,
            desc = Constants.ADD_NEW_SKILL_SPELL_COOLDOWN_DESC,
            order = 6,
            type = 'input',
            get = function() return me.new_skill_info.spell.cooldown end,
            set = function(info, val)
              if val == '' or tonumber(val) ~= nil then 
                me.new_skill_info.spell.cooldown = val
              end
            end,
            width = 'full'
          },
          param7 = {
            name = Constants.ADD_NEW_SKILL_SPELL_CHARGES_NAME,
            desc = Constants.ADD_NEW_SKILL_SPELL_CHARGES_DESC,
            order = 7,
            type = 'input',
            get = function() return me.new_skill_info.spell.charges end,
            set = function(info, val)
              if val == '' or tonumber(val) ~= nil then 
                me.new_skill_info.spell.charges = val 
              end
            end,
            width = 'full'
          },
          param8 = {
            name = Constants.ADD_NEW_SKILL_EXECUTE_NAME,
            desc = Constants.ADD_NEW_SKILL_EXECUTE_DESC,
            order = 8,
            type = 'execute',
            width = 'full',
            func = function()
              xpcall(function()
                local spell = Spells:New({
                  name = me.new_skill_info.spell.name, debugName = me.new_skill_info.spell.debugName,
                  spell_id = tonumber(me.new_skill_info.spell.spell_id), 
                  icon_id = tonumber(me.new_skill_info.spell.icon_id),
                  cooldown = tonumber(me.new_skill_info.spell.cooldown),
                  charges = tonumber(me.new_skill_info.spell.charges)
                })
                
                me:AddSkill(spell)
              end, function(err)
                print('An error occurred: ' .. tostring(err))
                print(debugstack())
              end)
              rebuild_opt()
            end
          }
        }
      },
      param3 = {
        name = Constants.ADD_NEW_COOLDOWN_GROUP_NAME,
        order = 3,
        type = 'group',
        inline = true,
        hidden = function() return not me.advanced_features end,
        args = {
          param1 = {
            name = Constants.ADD_NEW_COOLDOWN_DESCRIPTION_NAME,
            order = 1,
            width = 'full',
            type = 'description'
          },
          param2 = {
            name = Constants.ADD_NEW_COOLDOWN_SPELL_NAME,
            order = 2,
            type = 'input',
            width = 'full',
            get = function() return me.new_cooldown_info.spell.name end,
            set = function(info, val) 
              me.new_cooldown_info.spell.name = val 
              
              local name, _, icon, _, _, _, id = GetSpellInfo(val)
              if name and name == val then 
                me.new_cooldown_info.spell.icon_id = tostring(icon)
                me.new_cooldown_info.spell.spell_id = tostring(id)
                me.new_cooldown_info.spell.debugName = string.gsub(val, '%s+', '')
              end
            end
          },
          param3 = {
            name = Constants.ADD_NEW_COOLDOWN_SPELL_DEBUGNAME,
            order = 3,
            type = 'input',
            width = 'full',
            get = function() return me.new_cooldown_info.spell.debugName end,
            set = function(info, val) me.new_cooldown_info.spell.debugName = val end
          },
          param4 = {
            name = Constants.ADD_NEW_COOLDOWN_SPELL_SPELLID,
            order = 4,
            type = 'input',
            width = 'full',
            get = function() return me.new_cooldown_info.spell.spell_id end,
            set = function(info, val) 
              if tonumber(val) ~= nil then me.new_cooldown_info.spell.spell_id = val end
            end
          },
          param5 = {
            name = Constants.ADD_NEW_COOLDOWN_SPELL_ICONID,
            order = 5,
            type = 'input',
            width = 'full',
            get = function() return me.new_cooldown_info.spell.icon_id end,
            set = function(info, val) 
              if tonumber(val) ~= nil then me.new_cooldown_info.spell.icon_id = val end
            end
          },
          param6 = {
            name = Constants.ADD_NEW_COOLDOWN_SPELL_COOLDOWN,
            order = 6,
            type = 'input',
            width = 'full',
            get = function() return me.new_cooldown_info.spell.cooldown end,
            set = function(info, val) 
              if tonumber(val) ~= nil then me.new_cooldown_info.spell.cooldown = val end
            end
          },
          param7 = {
            name = Constants.ADD_NEW_COOLDOWN_SPELL_CHARGES,
            order = 7,
            type = 'input',
            width = 'full',
            get = function() return me.new_cooldown_info.spell.charges end,
            set = function(info, val) 
              if val == '' or tonumber(val) ~= nil then me.new_cooldown_info.spell.charges = val end
            end
          },
          param8 = {
            name = Constants.ADD_NEW_COOLDOWN_EXECUTE_NAME,
            order = 8,
            type = 'execute',
            width = 'full',
            func = function()
              xpcall(function()
                local spell = Spells:New({
                  name = me.new_cooldown_info.spell.name, debugName = me.new_cooldown_info.spell.debugName,
                  spell_id = tonumber(me.new_cooldown_info.spell.spell_id), 
                  icon_id = tonumber(me.new_cooldown_info.spell.icon_id),
                  cooldown = tonumber(me.new_cooldown_info.spell.cooldown),
                  charges = tonumber(me.new_cooldown_info.spell.charges)
                })
                
                me:RegisterCooldown(spell)
                print('Torpedo: Successfully registered cooldown ' .. spell.name)
              end, function(err)
                print('Torpedo: An error occurred: ' .. tostring(err))
                print(debugstack())
              end)
              rebuild_opt()
            end
          }
        }
      },
      param4 = {
        name = Constants.ADD_NEW_AURA_GROUP_NAME,
        order = 4,
        type = 'group',
        inline = true,
        hidden = function() return not me.advanced_features end,
        args = {
          param1 = {
            name = Constants.ADD_NEW_AURA_DESCRIPTION_NAME,
            order = 1,
            width = 'full',
            type = 'description'
          },
          param2 = {
            name = Constants.ADD_NEW_AURA_NAME_NAME,
            desc = Constants.ADD_NEW_AURA_NAME_DESC,
            order = 2,
            width = 'full',
            type = 'input',
            get = function() return me.new_aura_info.name end,
            set = function(info, val)
              me.new_aura_info.name = val
              
              local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, _, nameplateShowAll, timeMod
              
              local counter = 1
              while true do
                name, rank, icon, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, _, nameplateShowAll, timeMod = UnitAura('player', counter)
                
                if not name then break end
                if name == val then break end
                counter = counter + 1
              end
              
              if name and name == val then 
                me.new_aura_info.debugName = string.gsub(val, '%s+', '')
                me.new_aura_info.aura_id = tostring(spellId)
                me.new_aura_info.icon_id = tostring(icon)
                me.new_aura_info.target = 'player'
                me.new_aura_info.max_duration = tostring(duration * 1.3)
                return
              end
              
              if UnitExists('target') then 
                counter = 1
                while true do 
                  name, rank, icon, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, _, nameplateShowAll, timeMod = UnitAura('target', counter)
                  
                  if not name then break end
                  if name == val then break end
                  counter = counter + 1
                end
              
                if name and name == val then 
                  me.new_aura_info.debugName = string.gsub(val, '%s+', '')
                  me.new_aura_info.aura_id = tostring(spellId)
                  me.new_aura_info.icon_id = tostring(icon)
                  me.new_aura_info.target = 'target'
                  me.new_aura_info.max_duration = tostring(duration * 1.3)
                  return
                end
              end
            end
          },
          param3 = {
            name = Constants.ADD_NEW_AURA_DEBUGNAME_NAME,
            desc = Constants.ADD_NEW_AURA_DEBUGNAME_DESC,
            order = 3,
            width = 'full',
            type = 'input',
            get = function() return me.new_aura_info.debugName end,
            set = function(info, val)
              me.new_aura_info.debugName = string.gsub(val, '%s+', '')
            end
          },
          param4 = {
            name = Constants.ADD_NEW_AURA_AURAID_NAME,
            desc = Constants.ADD_NEW_AURA_AURAID_DESC,
            order = 4,
            width = 'full',
            type = 'input',
            get = function() return me.new_aura_info.aura_id end,
            set = function(info, val)
              if val == '' or tonumber(val) ~= nil then me.new_aura_info.aura_id = val end
            end
          },
          param5 = {
            name = Constants.ADD_NEW_AURA_ICONID_NAME,
            desc = Constants.ADD_NEW_AURA_ICONID_DESC,
            order = 5,
            width = 'full',
            type = 'input',
            get = function() return me.new_aura_info.icon_id end,
            set = function(info, val)
              if val == '' or tonumber(val) ~= nil then me.new_aura_info.icon_id = val end
            end
          },
          param6 = {
            name = Constants.ADD_NEW_AURA_TARGET_NAME,
            desc = Constants.ADD_NEW_AURA_TARGET_DESC,
            order = 6,
            width = 'full',
            type = 'input',
            get = function() return me.new_aura_info.target end,
            set = function(info, val)
              if val == '' or val == 'target' or val == 'player' then 
                me.new_aura_info.target = val
              end
            end
          },
          param7 = {
            name = Constants.ADD_NEW_AURA_MAXDURATION_NAME,
            desc = Constants.ADD_NEW_AURA_MAXDURATION_DESC,
            order = 7,
            width = 'full',
            type = 'input',
            get = function() return me.new_aura_info.max_duration end,
            set = function(info, val)
              if val == '' or tonumber(val) ~= nil then me.new_aura_info.max_duration = val end
            end
          },
          param8 = {
            name = Constants.ADD_NEW_AURA_EXECUTE_NAME,
            desc = Constants.ADD_NEW_AURA_EXECUTE_DESC,
            order = 8,
            width = 'full',
            type = 'execute',
            func = function()
              xpcall(function()
                local iconId = tonumber(me.new_aura_info.icon_id)
                if iconId == nil then iconId = me.new_aura_info.icon_id end
                
                local aura = Auras:New({
                  name = me.new_aura_info.name, debugName = me.new_aura_info.debugName,
                  aura_id = tonumber(me.new_aura_info.aura_id),
                  icon_id = iconId,
                  target = me.new_aura_info.target,
                  max_duration = tonumber(me.new_aura_info.max_duration)
                })
                
                me:RegisterAura(aura)
                print('Torpedo: Successfully registered aura ' .. aura.name)
              end, function(err)
                print('Torpedo: An error occurred: ' .. tostring(err))
                print(debugstack())
              end)
            end
          }
        }
      }
    }
  }
  
  local offset = 4
  for i=1, #self.skills do 
    local key = 'param' .. tostring(i + offset)
    
    local cacheInd = i
    
    local delete_skill_func = function()
      table.remove(me.skills, cacheInd)
    end
    
    result.args[key] = self.skills[i]:CreateOptions(i + offset, rebuild_opt, new_prio_func, advanced_features_func, delete_skill_func)
  end
  
  return result
end

function TorpedoSpecializations:BuildContext(fightAnalyzer, targetInfo)
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
  tmp_context.fight_summary = fightAnalyzer:Analyze()
  tmp_context.target_info = targetInfo
  
  local result = Context:New(tmp_context)
  
  fightAnalyzer:SetCurrentContext(result)
  
  return result
end

function TorpedoSpecializations:Serializable()
  local res = {}
  
  res.advanced_features = self.advanced_features
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
  local advanced_features = ser.advanced_features
  
  local res = TorpedoSpecializations:New({ name = name, specialization_id = specialization_id, advanced_features = advanced_features })
  res.auras = auras
  res.cooldowns = cooldowns
  res.skills = skills
  
  res:SetValidator(res.validator)
  return res
end