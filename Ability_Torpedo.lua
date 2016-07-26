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

function LoadAbilitiesAndBuffs_Assassination_Torpedo() 
	Ability_Torpedo.add({1784}, 'Stealth')
	Ability_Torpedo.add({1329, 1752}, 'Mutilate') 
	Ability_Torpedo.add({1329}, 'Actual Mutilate')
	Ability_Torpedo.add({145416, 2098}, 'Envenom')
	Ability_Torpedo.add({1856}, 'Vanish')
	Ability_Torpedo.add({121733}, 'Throw')
	Ability_Torpedo.add({51723}, 'Fan of Knives')
	Ability_Torpedo.add({1943}, 'Rupture')
	Ability_Torpedo.add({111240, 1752}, 'Dispatch') -- So apparently dispatch replaces sinister strike - Y U DO THIS.
	Ability_Torpedo.add({152151}, 'Shadow Reflection')
	Ability_Torpedo.add({79140},  'Vendetta')
	Ability_Torpedo.add({2823, 8679}, 'Deadly Poison')
	Ability_Torpedo.add({5277}, 'Evasion')
	Ability_Torpedo.add({74001}, 'Combat Readiness')
	Ability_Torpedo.add({1966}, 'Feint')
	Ability_Torpedo.add({73651}, 'Recuperate')
	Ability_Torpedo.add({145418}, 'Slice and Dice')
	Ability_Torpedo.add({157513}, 'Improved Slice and Dice')
	Ability_Torpedo.add({114015}, 'Anticipation')
	Ability_Torpedo.add({14185}, 'Preparation')
	
	Buff_Torpedo.add({1784, 11327},   'player', 'Stealth')
	Buff_Torpedo.add({1943},   'target', 'Rupture')
	Buff_Torpedo.add({32645}, 'player', 'Envenom')
	Buff_Torpedo.add({152151}, 'target', 'Shadow Reflection')
	Buff_Torpedo.add({158108}, 'player', 'Enhanced Vendetta')
	Buff_Torpedo.add({121153}, 'player', 'Blindside') -- Free dispatch --
	Buff_Torpedo.add({2823, 8679}, 'player', 'Deadly Poison')
	Buff_Torpedo.add({115189}, 'player', 'Anticipation')
	Buff_Torpedo.add({5277}, 'player', 'Evasion')
	Buff_Torpedo.add({74001}, 'player', 'Combat Readiness')
	Buff_Torpedo.add({1966}, 'player', 'Feint')
	Buff_Torpedo.add({73651}, 'player', 'Recuperate')
end

function LoadAbilitiesAndBuffs_Subtlety_Torpedo()
	Ability_Torpedo.add({1784}, 'Stealth')
	Ability_Torpedo.add({53, 200758}, 'Backstab') -- Includes Gloomblade if you chose that lv15 talent
	Ability_Torpedo.add({2098, 196819}, 'Eviscerate')
	Ability_Torpedo.add({1856}, 'Vanish')
	Ability_Torpedo.add({51713, 185313}, 'Shadow Dance')
  Ability_Torpedo.add({212283}, 'Symbols of Death')
  Ability_Torpedo.add({195452}, 'Nightblade')
  Ability_Torpedo.add({193531}, 'Deeper Stratagem')
  Ability_Torpedo.add({185438}, 'Shadowstrike')
	Ability_Torpedo.add({121471}, 'Shadow Blades')
  
	Buff_Torpedo.add({1784, 11327, 115191, 115192, 51713, 185422}, 'player', 'Stealth')
  Buff_Torpedo.add({212283}, 'player', 'Symbols of Death')
	Buff_Torpedo.add({115189}, 'player', 'Anticipation')
  Buff_Torpedo.add({195452}, 'target', 'Nightblade')
	Buff_Torpedo.add({121471}, 'player', 'Shadow Blades')
end

