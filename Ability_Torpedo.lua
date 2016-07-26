abilities_Torpedo = {}

Ability_Torpedo = {}
Ability_Torpedo.__index = Ability_Torpedo

function Ability_Torpedo.add(spellIds, debugName)
	local knownSpellId = -1
	for i=1, #spellIds do
		local known = IsSpellKnown(spellIds[i])
		if known then
			knownSpellId = i
			break
		end
	end
	
	local name, icon
	if knownSpellId ~= -1 then
		name, _, icon = GetSpellInfo(spellIds[knownSpellId])
	else
		print(debugName..' not known')
	end
	local ability = {
		spellIds = spellIds,
		name = name,
		icon = icon,
		debugName = debugName,
		hints = {}
	}
	setmetatable(ability, Ability_Torpedo)
	abilities_Torpedo[debugName] = ability
	return ability
end

function Ability_Torpedo:usable()
	for i=1, #self.spellIds do
		if IsSpellKnown(self.spellIds[i]) and IsUsableSpell(self.spellIds[i]) then return true end
	end
	return false
end

function Ability_Torpedo:firstKnownSpellId() 
  if self.cachedFirstKnownSpellId then return self.cachedFirstKnownSpellId end
	for i=1, #self.spellIds do
		if IsSpellKnown(self.spellIds[i]) then
      self.cachedFirstKnownSpellId = self.spellIds[i]
      return self.spellIds[i] 
    end
	end
	return false
end

function Ability_Torpedo:known()
	for i=1, #self.spellIds do
		if IsSpellKnown(self.spellIds[i]) then return true end
	end
	return false
end

--[[
  Returns the cooldown, in seconds, until the ability can be used again.
  
  Returns false if the spell is not on cooldown
]]
function Ability_Torpedo:cooldown()
  local spellIdToUse = self:firstKnownSpellId()
  
  local start, duration = GetSpellCooldown(spellIdToUse)
  
  if start == 0 then return false end
  
  return (start + duration) - GetTime()
end

--[[
  Returns currentCharges, maxCharges, timeUntilNextChargeInSeconds
]]
function Ability_Torpedo:charges()
  local spellIdToUse = self:firstKnownSpellId()
  
  local currentCharges, maxCharges, cdStarted, duration = GetSpellCharges(spellIdToUse)
  
  if currentCharges == maxCharges then return currentCharges, maxCharges, -1 end
  
  return currentCharges, maxCharges, ( (cdStarted + duration) - GetTime() )
end


auras_Torpedo = {}
auras_Torpedo['player'] = {}
auras_Torpedo['target'] = {}

local function UpdateAurasForUnit(unitName) 
	local i=1, auraName, count, duration, expirationTime, unitCaster, spellId
	while true do
		if unitName == 'player' then
			auraName, _, _, count, _, duration, expirationTime, unitCaster, _, _, spellId = UnitBuff(unitName, i)
		else 
			auraName, _, _, count, _, duration, expirationTime, unitCaster, _, _, spellId = UnitDebuff(unitName, i)
		end
		if not spellId then break end
		if not auras_Torpedo[unitName][i] then auras_Torpedo[unitName][i] = {} end
		auras_Torpedo[unitName][i].name = auraName
		auras_Torpedo[unitName][i].count = count
		auras_Torpedo[unitName][i].duration = duration
		auras_Torpedo[unitName][i].expirationTime = expirationTime
		auras_Torpedo[unitName][i].spellId = spellId
		i = i+1
	end
	auras_Torpedo[unitName].len = i-1
end

function UpdateAuras_Torpedo() 
	UpdateAurasForUnit('player')
	UpdateAurasForUnit('target')
end

Buff_Torpedo = {}
Buff_Torpedo.__index = Buff_Torpedo

buffs_Torpedo = {}

function Buff_Torpedo.add(buffIds, unitName, debugName)
	local buff = {
		buffIds = buffIds,
		unitName = unitName,
		debugName = debugName
	}
	setmetatable(buff, Buff_Torpedo)
	buffs_Torpedo[debugName] = buff
	return buff
end

function Buff_Torpedo:info()
	local i, j
	
	for i=1, auras_Torpedo[self.unitName].len do
		for j=1, #self.buffIds do
			if auras_Torpedo[self.unitName][i].spellId == self.buffIds[j] then
				return auras_Torpedo[self.unitName][i]
			end
		end
	end
end

function Buff_Torpedo:remaining()
	local inf = self:info()
	if not inf then return -1 end

	local expTime = inf.expirationTime
	local curTime = GetTime()
	if expTime == 0 then return 0 end
	local timeRemaining = expTime - curTime
			
	if timeRemaining < 0 then return 0 else return timeRemaining end
end

function Buff_Torpedo:stacks()
	local inf = self:info()
	if not inf then return -1 end

	return inf.count
end

function Buff_Torpedo:up()
	return self:remaining() >= 0
end

function Buff_Torpedo.down()
	return not self:up()
end

Talent_Torpedo = {}
Talent_Torpedo.__index = Talent_Torpedo

talents_Torpedo = {}

function Talent_Torpedo.add(tier, column, group, debugName)
  local talent = {
    tier = tier,
    column = column,
    group = group,
    debugName = debugName
  }
  setmetatable(talent, Talent_Torpedo)
  talents_Torpedo[debugName] = talent
  return talent
end

function Talent_Torpedo:selected()
  if self.cachedSelected == nil then
    local talentId, name, texture, selected, available = GetTalentInfo(self.tier, self.column, self.group)
    
    self.cachedSelected = selected
  end
  
  return self.cachedSelected
end

--[[
  Sets up the multiplier variable on dots where relevant; the multiplier is only relative
  to the players base, so things like mastery are ignored.
  
  Multiplier is only valid that in if the getCurrentMultiplier is larger than it was, then it'll
  do more damage.
]]
function UpdateAbilitiesAndBuffs_CombatLogEventUnfiltered(unknown, eventType, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, spellId)
  local bleeds = {'Rupture', 'Garrote'}
  if srcGUID == Torpedo_Temp.me then
    if eventType == 'SPELL_CAST_SUCCESS' then
      for _, bleedName in ipairs(bleeds) do 
        if spellId == abilities_Torpedo[bleedName]:firstKnownSpellId() then 
          buffs_Torpedo[bleedName].multiplier = buffs_Torpedo[bleedName].getCurrentMultiplier()
          return
        end
      end
      
      if spellId == abilities_Torpedo['Exsanguinate']:firstKnownSpellId() then
        for _, bleedName in ipairs(bleeds) do 
          local bleed = buffs_Torpedo[bleedName]
          
          if bleed:up() then 
            bleed.multiplier = bleed.multiplier + 4
          end
        end
      end
    end
  end
end

function LoadAbilitiesAndBuffs_Assassination_Torpedo() 
  Ability_Torpedo.add({1784}, 'Stealth')
  Ability_Torpedo.add({2823}, 'Deadly Poison')
  Ability_Torpedo.add({1943}, 'Rupture')
  Ability_Torpedo.add({703}, 'Garrote')
  Ability_Torpedo.add({1329}, 'Mutilate')
  Ability_Torpedo.add({32645}, 'Envenom')
  Ability_Torpedo.add({16511}, 'Hemorrhage')
  Ability_Torpedo.add({200806}, 'Exsanguinate')
	Ability_Torpedo.add({1856}, 'Vanish')
  Ability_Torpedo.add({79140}, 'Vendetta')
  
	Buff_Torpedo.add({1784, 11327, 115191, 115192, 51713, 185422}, 'player', 'Stealth')
  Buff_Torpedo.add({2823}, 'player', 'Deadly Poison')
  Buff_Torpedo.add({32645}, 'player', 'Envenom')
  Buff_Torpedo.add({16511}, 'target', 'Hemorrhage')
  
  -- 'Special' buffs
  Buff_Torpedo.add({1943}, 'target', 'Rupture')
  buffs_Torpedo['Rupture'].getCurrentMultiplier = function(self)
    local multiplier = 1
    if buffs_Torpedo['Stealth']:up() and talents_Torpedo['Nightstalker']:selected() then 
      multiplier = multiplier + 0.5
    end
    return multiplier
  end
  Buff_Torpedo.add({703}, 'target', 'Garrote')
  buffs_Torpedo['Garrote'].getCurrentMultiplier = buffs_Torpedo['Rupture'].getCurrentMultiplier
  
  Talent_Torpedo.add(2, 1, 1, 'Nightstalker')
  Talent_Torpedo.add(3, 1, 1, 'Deeper Stratagem')
  Talent_Torpedo.add(6, 3, 1, 'Exsanguinate')
end

function LoadAbilitiesAndBuffs_Subtlety_Torpedo()
	Ability_Torpedo.add({1784}, 'Stealth')
	Ability_Torpedo.add({53, 200758}, 'Backstab') -- Includes Gloomblade if you chose that tier 1 talent
	Ability_Torpedo.add({2098, 196819}, 'Eviscerate')
	Ability_Torpedo.add({1856}, 'Vanish')
	Ability_Torpedo.add({51713, 185313}, 'Shadow Dance')
  Ability_Torpedo.add({212283}, 'Symbols of Death')
  Ability_Torpedo.add({195452}, 'Nightblade')
  Ability_Torpedo.add({185438}, 'Shadowstrike')
	Ability_Torpedo.add({121471}, 'Shadow Blades')
  
	Buff_Torpedo.add({1784, 11327, 115191, 115192, 51713, 185422}, 'player', 'Stealth')
  Buff_Torpedo.add({212283}, 'player', 'Symbols of Death')
	Buff_Torpedo.add({115189}, 'player', 'Anticipation')
  Buff_Torpedo.add({195452}, 'target', 'Nightblade')
	Buff_Torpedo.add({121471}, 'player', 'Shadow Blades')
  
  Talent_Torpedo.add(3, 1, 3, 'Deeper Stratagem')
end

