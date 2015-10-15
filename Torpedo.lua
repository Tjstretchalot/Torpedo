--[[
	Torpedo by Tjstretchalot, Huge credit to Jpapertowels and szandos for
	the interface code in Claw, which I used as a strong reference in creating
	this. 
]]--

-- Interface Code, the torpedo panel handles the main recommendation, whereas
-- the torpedoCooldownPanel handles the cooldowns / secondary recommendations
Torpedo = {}

local function InitializeVariables()
	for k,v in pairs({
		torpedoPanelX = 500,
		torpedoPanelY = -50
	}) do
		if Torpedo[k] == nil then 
			Torpedo[k] = v
		end
	end
	
	if torpedoPanel then
		torpedoPanel:SetPoint('TOPLEFT', Torpedo.torpedoPanelX, Torpedo.torpedoPanelY)
	end
end

Torpedo_Temp = {}
local torpedoPanel = CreateFrame('Frame', 'torpedoPanel', UIParent)
torpedoPanel:SetPoint('TOPLEFT', 500, -50)
torpedoPanel:SetFrameStrata('BACKGROUND')
torpedoPanel:SetSize(64, 64)
torpedoPanel:SetMovable(true)
torpedoPanel:EnableMouse(true)
torpedoPanel:SetMovable(true)
torpedoPanel:RegisterForDrag('LeftButton')
torpedoPanel:SetScript('OnDragStart', function() 
	torpedoPanel:StartMoving()
	torpedoCooldownPanel:StartMoving()
end)
torpedoPanel:SetScript('OnDragStop', function()
	torpedoPanel:StopMovingOrSizing()
	torpedoCooldownPanel:StopMovingOrSizing()
end)
torpedoPanel:Hide()
torpedoPanel.icon = torpedoPanel:CreateTexture(nil, 'BACKGROUND')
torpedoPanel.icon:SetAllPoints(torpedoPanel)
torpedoPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
torpedoPanel.border = torpedoPanel:CreateTexture(nil, 'BORDER')
torpedoPanel.border:SetAllPoints(torpedoPanel)
torpedoPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
torpedoPanel.border:Hide()
torpedoPanel.dimmer = torpedoPanel:CreateTexture(nil, 'OVERLAY')
torpedoPanel.dimmer:SetAllPoints(torpedoPanel)
torpedoPanel.dimmer:SetTexture(0, 0, 0, 0.6)
torpedoPanel.dimmer:Hide()
local torpedoCooldownPanel = CreateFrame('Frame', 'torpedoCooldownPanel', UIParent)
torpedoCooldownPanel:SetPoint('BOTTOMLEFT', torpedoPanel, 'BOTTOMRIGHT', 10, -5)
torpedoCooldownPanel:SetFrameStrata('BACKGROUND')
torpedoCooldownPanel:SetSize(64, 64)
torpedoCooldownPanel:SetMovable(true)
torpedoCooldownPanel:Hide()
torpedoCooldownPanel.icon = torpedoCooldownPanel:CreateTexture(nil, 'BACKGROUND')
torpedoCooldownPanel.icon:SetAllPoints(torpedoCooldownPanel)
torpedoCooldownPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
torpedoCooldownPanel.border = torpedoCooldownPanel:CreateTexture(nil, 'BORDER')
torpedoCooldownPanel.border:SetAllPoints(torpedoCooldownPanel)
torpedoCooldownPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
torpedoCooldownPanel.border:Hide()
torpedoCooldownPanel.dimmer = torpedoCooldownPanel:CreateTexture(nil, 'OVERLAY')
torpedoCooldownPanel.dimmer:SetAllPoints(torpedoCooldownPanel)
torpedoCooldownPanel.dimmer:SetTexture(0, 0, 0, 0.6)
torpedoCooldownPanel.dimmer:Hide()

-- Prevents other things from causing spells to glow
local function DenyOverlayGlow(actionButton)
	actionButton.overlay:Hide()
end
hooksecurefunc('ActionButton_ShowOverlayGlow', DenyOverlayGlow)

local glows = {}
local lastMainAbility = nil
local currMainAbility = nil
local lastCDAbility = nil
local currCDAbility = nil
local Target = {
	guid = 0,
	hostile = false
}

-- Does our own custom glowing
local function CreateOverlayGlows() 
	local GenerateGlow = function(button)
		if button then
			local w, h, glow
			w, h = button:GetSize()
			glow = CreateFrame('Frame', nil, button, 'ActionBarButtonSpellActivationAlert')
			glow:Hide()
			glow:SetSize(w * 1.4, h * 1.4)
			glow:SetPoint('TOPLEFT', button, 'TOPLEFT', -w * 0.2, h * 0.2)
			glow:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', w * 0.2, -h * 0.2)
			glow.button = button
			glows[#glows + 1] = glow
		end
	end
	
	for i = 1, 12 do 
		GenerateGlow(_G['ActionButton' .. i])
		GenerateGlow(_G['MultiBarLeftButton' .. i])
		GenerateGlow(_G['MultiBarRightButton' .. i])
		GenerateGlow(_G['MultiBarBottomLeftButton' .. i])
		GenerateGlow(_G['MultiBarBottomRightButton' .. i])
	end
end

-- Decides if an icon should glow
local function ShouldGlow(icon) 
	if not icon then return false end
	
	if currMainAbility and icon == currMainAbility.icon then return true end
	if currCDAbility and icon == currCDAbility.icon then return true end
	
	return false
end

-- Updates icons that should be glowing to glowing, and those that shouldn't
-- be glowing to not glowing
local function UpdateGlows() 
	local glow, icon
	for i = 1, #glows do
		glow = glows[i]
		icon = glow.button.icon:GetTexture()
		if ShouldGlow(icon) and glow.button.icon:IsVisible() then
			if not glow:IsVisible() then
				glow.animIn:Play()
			end
		elseif glow:IsVisible() then
			glow.animIn:Stop()
			glow:Hide()
		end
	end
end

local events = {}
function events:ACTIONBAR_SLOT_CHANGED() 
	UpdateGlows()
end

function events:PLAYER_LOGIN()
	_, _, classIndex = UnitClass('player')
	if classIndex ~= 4 then
		DisableAddOn('Torpedo')
		return 0
	else
		events:PLAYER_SPECIALIZATION_CHANGED('player')
		events:PLAYER_EQUIPMENT_CHANGED()
	end
	Torpedo_Temp.me = UnitGUID('player')
	CreateOverlayGlows()
end

local function Disappear() 
	currMainAbility = nil
	lastMainAbility = nil
	currCDAbility = nil
	lastCDAbility = nil
	UpdateGlows()
	torpedoPanel:Hide()
	torpedoPanel.border:Hide()
	torpedoCooldownPanel:Hide()
	torpedoCooldownPanel.border:Hide()
end

function events:PLAYER_REGEN_ENABLED()
	-- Combat Ended? --
end

function events:PLAYER_TARGET_CHANGED()
	if Torpedo_Temp.ai_main == nil then return end
	local prevHostile = Target.hostile
	Target.hostile = UnitCanAttack('player', 'target') and not UnitIsDead('target')
	
	if Target.hostile then
		Target.guid = UnitGUID('Target')
		
		abilityTimer = 0.05 -- frequency
		torpedoPanel:Show()
		torpedoCooldownPanel:Show()
	elseif prevHostile then
		Disappear()
	end
end

function events:UNIT_FACTION(unitID)
	if unitID == 'target' then
		events:PLAYER_TARGET_CHANGED()
	end
end

function events:PLAYER_SPECIALIZATION_CHANGED(unitName)
	if unitName == 'player' then
		local specNumber = GetSpecialization()
		local id, name, description, icon, background, role = GetSpecializationInfo(specNumber)
		
		if id ~= 259 and Torpedo_Temp.ai_main ~= nil then
			abilities_Torpedo = {}
			buffs_Torpedo = {}
			Torpedo_Temp.ai_main = nil
			Torpedo_Temp.ai_cd = nil
			Disappear()
		elseif id == 259 and Torpedo_Temp.ai_main == nil then
			LoadAbilitiesAndBuffs_Torpedo()
			Torpedo_Temp.ai_main = AI_Assassination_Main()
			Torpedo_Temp.ai_cd = AI_Assassination_CDs()
		end
	end
end

function events:PLAYER_EQUIPMENT_CHANGED()
	local tier18Head = 124263
	local tier18Legs = 124269
	local tier18Hand = 124257
	local tier18Shou = 124274
	local tier18Ches = 124248
	
	local tier18Pcs = {tier18Head, tier18Legs, tier18Hand, tier18Shou, tier18Ches}
	local numTier18 = 0
	for _, itemId in ipairs(tier18Pcs) do
		if IsEquippedItem(itemId) then
			numTier18 = numTier18 + 1
		end
	end
	
	Torpedo_Temp.numberOfTier18Pieces = numTier18
end

function events:PLAYER_ENTERING_WORLD()
	events:PLAYER_SPECIALIZATION_CHANGED('player')
	events:PLAYER_EQUIPMENT_CHANGED()
end

function events:ADDON_LOADED(name)
	if name == 'Torpedo' then
		-- we just got loaded
		torpedoPanel:SetScale(1)
		torpedoCooldownPanel:SetScale(0.7)
		InitializeVariables()
	end
end

torpedoPanel:SetScript('OnEvent', function(self, event, ...) events[event](self, ...) end)
for event in pairs(events) do
	torpedoPanel:RegisterEvent(event)
end

local counter = 0
local function UpdateMainAbility(newMainAbility) 
	if currMainAbility ~= newMainAbility then
		if newMainAbility then
			--print('AI Tick #'..tostring(counter)..', main ability became '..tostring(newMainAbility.name))
			torpedoPanel.icon:SetTexture(newMainAbility.icon)
			torpedoPanel.icon:Show()
			torpedoPanel.border:Show()
		else
			--print('AI Tick #'..tostring(counter)..', main ability became nil')
			torpedoPanel.icon:Hide()
			torpedoPanel.border:Hide()
		end
		lastMainAbility = currMainAbility
	end
	
	if not newMainAbility or newMainAbility:usable() then
		torpedoPanel.dimmer:Hide()
	else
		torpedoPanel.dimmer:Show()
	end
	currMainAbility = newMainAbility
end

local function UpdateCDAbility(newCDAbility)
	if currCDAbility ~= newCDAbility then
		if newCDAbility then
			--print('AI Tick #'..tostring(counter)..', cd ability became '..tostring(newCDAbility.name))
			torpedoCooldownPanel.icon:SetTexture(newCDAbility.icon)
			torpedoCooldownPanel.icon:Show()
			torpedoCooldownPanel.border:Show()
		else
			--print('AI Tick #'..tostring(counter)..', cd ability became nil')
			torpedoCooldownPanel.icon:Hide()
			torpedoCooldownPanel.border:Hide()
		end
		lastCDAbility = currCDAbility
	end
	
	if not newCDAbility or newCDAbility:usable() then
		torpedoCooldownPanel.dimmer:Hide()
	else
		torpedoCooldownPanel.dimmer:Show()
	end
	currCDAbility = newCDAbility
end

local abilityTimer = 0
torpedoPanel:SetScript('OnUpdate', function(self, elapsed)
	if not Torpedo_Temp.ai_main or not Torpedo_Temp.ai_cd then 
		counter = 0
		return 
	end
	
	abilityTimer = abilityTimer + elapsed
	if abilityTimer >= 0.05 then -- frequency
		counter = counter + 1
		UpdateAuras_Torpedo()
		local mainDecision = Torpedo_Temp.ai_main:performDecision()
		local cdDecision = Torpedo_Temp.ai_cd:performDecision()
		local newMainAbility = mainDecision and mainDecision.ability or nil
		local newCDAbility = cdDecision and cdDecision.ability or nil
		
		
		UpdateCDAbility(newCDAbility)
		UpdateMainAbility(newMainAbility)
		
		UpdateGlows()
		abilityTimer = 0
	end
end)
