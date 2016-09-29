local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')

local MAJOR, MINOR = 'TorpedoGUI-1.0', 1
local TorpedoGUI = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoGUI then return end

function TorpedoGUI:New(o)
  Utils:CheckTypes({}, o)
  
  setmetatable(o, self)
  self.__index = self
  return o
end

function TorpedoGUI:Init()
  local me = self
  
  local primaryPanel = CreateFrame('Frame', 'torpedoPrimaryPanel', UIParent)
  local secondaryPanel = CreateFrame('Frame', 'torpedoSecondaryPanel', UIParent)
  
  primaryPanel:SetPoint('TOPLEFT', 500, -50)
  secondaryPanel:SetPoint('BOTTOMLEFT', primaryPanel, 'BOTTOMRIGHT', 10, -5)
  
  primaryPanel:SetFrameStrata('BACKGROUND')
  secondaryPanel:SetFrameStrata('BACKGROUND')
  
  primaryPanel:SetSize(64, 64)
  secondaryPanel:SetSize(64, 64)
  
  primaryPanel.icon = primaryPanel:CreateTexture(nil, 'BACKGROUND')
  primaryPanel.icon:SetAllPoints(primaryPanel)
  primaryPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
  
  secondaryPanel.icon = secondaryPanel:CreateTexture(nil, 'BACKGROUND')
  secondaryPanel.icon:SetAllPoints(secondaryPanel)
  secondaryPanel.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
  
  primaryPanel.border = primaryPanel:CreateTexture(nil, 'BORDER')
  primaryPanel.border:SetAllPoints(primaryPanel)
  primaryPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
  secondaryPanel.border = secondaryPanel:CreateTexture('Interface\\AddOns\\Torpedo\\border.blp', 'BORDER')
  secondaryPanel.border:SetAllPoints(secondaryPanel)
  secondaryPanel.border:SetTexture('Interface\\AddOns\\Torpedo\\border.blp')
  
  primaryPanel.overlay = primaryPanel:CreateTexture(nil, 'OVERLAY')
  primaryPanel.overlay:SetAllPoints(primaryPanel)
  secondaryPanel.overlay = secondaryPanel:CreateTexture(nil, 'OVERLAY')
  secondaryPanel.overlay:SetAllPoints(secondaryPanel)
  
  primaryPanel:SetMovable(true)
  secondaryPanel:SetMovable(true)
  
  primaryPanel:EnableMouse(true)
  primaryPanel:RegisterForDrag('LeftButton')
  primaryPanel:SetScript('OnDragStart', function()
    if IsShiftKeyDown() then 
      me.primaryPanel:StartMoving() -- This will implicitly call SetUserPlaced(true)
      me.secondaryPanel:StartMoving() -- which saves its position
    end
  end)
  primaryPanel:SetScript('OnDragStop', function()
    me.primaryPanel:StopMovingOrSizing()
    me.secondaryPanel:StopMovingOrSizing()
  end)
  
  primaryPanel:SetScale(1)
  secondaryPanel:SetScale(0.7)
  
  primaryPanel.is_visible = true
  primaryPanel.overlay.is_visible = true
  secondaryPanel.is_visible = true
  secondaryPanel.overlay.is_visible = true
  
  self.primaryPanel = primaryPanel
  self.secondaryPanel = secondaryPanel
  
  self:Hide()
end

--[[
  Updates this gui to reflect the profiles settings.
]]
function TorpedoGUI:SetGUIConfig(guiSettings)
  self.primaryPanel:SetScale(guiSettings.primary_panel_scale)
  self.secondaryPanel:SetScale(guiSettings.secondary_panel_scale)
  
  self.secondaryPanel:ClearAllPoints()
  self.secondaryPanel:SetPoint(guiSettings.secondary_panel_ref_point_sec, self.primaryPanel,
    guiSettings.secondary_panel_ref_point_pri, guiSettings.secondary_panel_x_offset,
    guiSettings.secondary_panel_y_offset)
end

function TorpedoGUI:DisableDefaultGlow()
  local function DenyOverlayGlow(actButton)
    actButton.overlay:Hide()
  end
  
  hooksecurefunc('ActionButton_ShowOverlayGlow', DenyOverlayGlow)
end

function TorpedoGUI:CreateOverlayGlows()
  if self.glows then return end
  
  self.glows = {}
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
			self.glows[#self.glows + 1] = glow
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

function TorpedoGUI:ShouldGlow(icon)
  if self.primaryPanel.is_visible then 
    if icon == self.primaryPanel.icon:GetTexture() then return true end
  end
  
  if self.secondaryPanel.is_visible then 
    if icon == self.secondaryPanel.icon:GetTexture() then return true end
  end
  
  return false
end

function TorpedoGUI:UpdateGlows()
  if not self.glows then return end
  
  local glow, icon
  for i=1, #self.glows do 
    glow = self.glows[i]
    icon = glow.button.icon:GetTexture()
    if self:ShouldGlow(icon) and glow.button.icon:IsVisible() then 
      if not glow:IsVisible() then 
        glow.animIn:Play()
      end
    elseif glow:IsVisible() then 
      glow.animIn:Stop()
      glow:Hide()
    end
  end
end

function TorpedoGUI:__HidePanel(panel)
  if panel.is_visible then 
    panel:Hide()
    panel.icon:Hide()
    panel.border:Hide()
    panel.overlay:Hide()
    
    panel.overlay.is_visible = false
    panel.is_visible = false
    self:UpdateGlows()
  end
end

function TorpedoGUI:HidePrimaryPanel()
  self:__HidePanel(self.primaryPanel)
end

function TorpedoGUI:HideSecondaryPanel()
  self:__HidePanel(self.secondaryPanel)
end

function TorpedoGUI:Hide()
  self:HidePrimaryPanel()
  self:HideSecondaryPanel()
end

function TorpedoGUI:__ShowPanel(panel, showOverlay)
  if not panel.is_visible then
    panel:Show()
    panel.border:Show()
    panel.icon:Show()
    self:UpdateGlows()
    
    panel.is_visible = true
  end
  
  if showOverlay and not panel.overlay.is_visible then 
    panel.overlay:Show()
    panel.overlay.is_visible = true
  end
  
  if not showOverlay and panel.overlay.is_visible then 
    panel.overlay:Hide()
    panel.overlay.is_visible = false
  end
end

function TorpedoGUI:ShowPrimaryPanel(showOverlay)
  self:__ShowPanel(self.primaryPanel, showOverlay)
end

function TorpedoGUI:ShowSecondaryPanel(showOverlay)
  self:__ShowPanel(self.secondaryPanel, showOverlay)
end

function TorpedoGUI:__SetupPanelForSuggestion(panel, suggestion, blueOverlay)
  local result = false
  if panel.icon ~= suggestion.spell.icon_id then 
    panel.icon:SetTexture(suggestion.spell.icon_id)
    self:UpdateGlows()
  end
  
  if blueOverlay then 
    panel.overlay:SetTexture('Interface\\AddOns\\Torpedo\\pool.tga')
  end
  
  return result
end

function TorpedoGUI:__SetSuggestion(panel, suggestion, suggestionResult)
  if not suggestion then
    self:__HidePanel(panel)
    return
  end
  
  if suggestionResult == SuggestionResult.SUGGEST then
    self:__SetupPanelForSuggestion(panel, suggestion, false)
    self:__ShowPanel(panel, false)
  elseif suggestionResult == SuggestionResult.POOL_ENERGY then 
    self:__SetupPanelForSuggestion(panel, suggestion, true)
    self:__ShowPanel(panel, true)
  else
    self:__HidePanel(panel)
  end
end

function TorpedoGUI:SetPrimarySuggestion(suggestion, suggestionResult)
  self:__SetSuggestion(self.primaryPanel, suggestion, suggestionResult)
end

function TorpedoGUI:SetSecondarySuggestion(suggestion, suggestionResult)
  self:__SetSuggestion(self.secondaryPanel, suggestion, suggestionResult)
end

function TorpedoGUI:Serializable()
  local res = {}
  
  return res
end

function TorpedoGUI:Unserialize(ser)
  return TorpedoGUI:New({})
end