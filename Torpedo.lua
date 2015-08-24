--[[
	Torpedo by Tjstretchalot, Huge credit to Jpapertowels and szandos for
	the interface code in Claw, which I used as a strong reference in creating
	this. 
]]--

-- Interface Code, the torpedo panel handles the main recommendation, whereas
-- the torpedoCooldownPanel handles the cooldowns / secondary recommendations
Torpedo = {}
Torpedo_Temp = {}
local torpedoPanel = CreateFrame('Frame', 'torpedoPanel', UIParent)
torpedoPanel:SetPoint('TOPLEFT', 500, -50)
torpedoPanel:SetFrameStrata('BACKGROUND')
torpedoPanel:SetSize(64, 64)
torpedoPanel:SetMovable(true)
torpedoPanel:Hide()
torpedoPanel.icon = torpedoPanel:CreateTexture(nil, 'BACKGROUND')
torpedoPanel.icon:SetAllPoints(torpedoPanel)
torpedoPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
torpedoPanel.border = torpedoPanel:CreateTexture(nil, 'BORDER')
torpedoPanel.border:SetAllPoints(torpedoPanel)
torpedoPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
torpedoPanel.border:Hide()
torpedoPanel.gcd = CreateFrame('Cooldown', nil, torpedoPanel, 'CooldownFrameTemplate')
torpedoPanel.gcd:SetAllPoints(torpedoPanel)
torpedoPanel.dimmer = torpedoPanel:CreateTexture(nil, 'OVERLAY')
torpedoPanel.dimmer:SetAllPoints(torpedoPanel)
torpedoPanel.dimmer:SetTexture(0, 0, 0, 0.6)
torpedoPanel.dimmer:Hide()
local torpedoCooldownPanel = CreateFrame('Frame', 'torpedoCooldownPanel', UIParent)
torpedoCooldownPanel:SetPoint('BOTTOMLEFT', torpedoPanel, 'BOTTOMRIGHT', 10, -5)
torpedoCooldownPanel:SetSize(64, 64)
torpedoCooldownPanel:SetFrameStrata('BACKGROUND')
torpedoCooldownPanel:Hide()
torpedoCooldownPanel.icon = torpedoCooldownPanel:CreateTexture(nil, 'BACKGROUND')
torpedoCooldownPanel.icon:SetAllPoints(torpedoCooldownPanel)
torpedoCooldownPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
torpedoCooldownPanel.border = torpedoCooldownPanel:CreateTexture(nil, 'BORDER')
torpedoCooldownPanel.border:SetAllPoints(torpedoCooldownPanel)
torpedoCooldownPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
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
end

function events:PLAYER_REGEN_ENABLED()
	-- Combat Ended? --
end

function events:PLAYER_TARGET_CHANGED()
	local prevHostile = Target.hostile
	Target.hostile = UnitCanAttack('player', 'target') and not UnitIsDead('target')
	
	if Target.hostile then
		Target.guid = UnitGUID('Target')
		
		abilityTimer = 0.05 -- frequency
		torpedoPanel:Show()
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
	end
end

function events:PLAYER_ENTERING_WORLD()
	events:PLAYER_SPECIALIZATION_CHANGED('player')
	-- also equipment, but we don't care
end

function events:ADDON_LOADED(name)
	if name == 'Torpedo' then
		-- we just got loaded
		torpedoPanel:SetScale(1)
		torpedoCooldownPanel:SetScale(0.7)
	end
end

torpedoPanel:SetScript('OnEvent', function(self, event, ...) events[event](self, ...) end)
for event in pairs(events) do
	torpedoPanel:RegisterEvent(event)
end

local function UpdateMainAbility(newMainAbility) 
	if currMainAbility ~= newMainAbility then
		if newMainAbility then
			torpedoPanel.icon:SetTexture(newMainAbility.icon)
			torpedoPanel.icon:Show()
			torpedoPanel.border:Show()
		else
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
			torpedoCooldownPanel.icon:SetTexture(newCDAbility.icon)
			torpedoCooldownPanel.icon:Show()
			torpedoCooldownPanel.border:Show()
			torpedoCooldownPanel:Show()
		else
			torpedoCooldownPanel.icon:Hide()
			torpedoCooldownPanel.border:Hide()
			torpedoCooldownPanel:Hide()
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
local ai_main = AI_Assassination_Main()
local ai_cd = AI_Assassination_CDs()
torpedoPanel:SetScript('OnUpdate', function(self, elapsed)
	abilityTimer = abilityTimer + elapsed
	if abilityTimer >= 0.05 then -- frequency
		UpdateAuras_Torpedo()
		local mainDecision = ai_main:performDecision()
		local cdDecision = ai_cd:performDecision()
		local newMainAbility = mainDecision and mainDecision.ability or nil
		local newCDAbility = cdDecision and cdDecision.ability or nil
		
		UpdateMainAbility(newMainAbility)
		UpdateCDAbility(newCDAbility)
		
		UpdateGlows()
		abilityTimer = 0
	end
end)
