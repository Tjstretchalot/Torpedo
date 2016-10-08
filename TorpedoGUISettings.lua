local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local OptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')
local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')

local MAJOR, MINOR = 'TorpedoGUISettings-1.0', 1
local TorpedoGUISettings = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoGUISettings then return end

function TorpedoGUISettings:New(o)
  setmetatable(o, self)
  self.__index = self
  o:__Init()
  return o
end

function TorpedoGUISettings:__Init()
  if self.primary_panel_scale == nil then 
    self.primary_panel_scale = 1.0
  end
  
  if self.secondary_panel_scale == nil then 
    self.secondary_panel_scale = 0.7
  end
  
  if self.secondary_panel_ref_point_pri == nil then 
    self.secondary_panel_ref_point_pri = 'BOTTOMRIGHT'
  end
  
  if self.secondary_panel_ref_point_sec == nil then 
    self.secondary_panel_ref_point_sec = 'BOTTOMLEFT'
  end
  
  if self.secondary_panel_x_offset == nil then 
    self.secondary_panel_x_offset = 10
  end
  
  if self.secondary_panel_y_offset == nil then 
    self.secondary_panel_y_offset = -5
  end
end

--[[
  Builds the options table
]]
function TorpedoGUISettings:BuildOptions(update_gui_func)
  Utils:CheckTypes({update_gui_func = 'function'}, {update_gui_func = update_gui_func})
  
  local me = self
  local result = {
    type = 'group',
    args = {
      param1 = {
        type = 'input',
        name = 'Primary Panel Scale',
        desc = Constants.PRIMARY_PANEL_SCALE_DESC,
        get = function() return tostring(me.primary_panel_scale) end,
        set = function(info, val)
          val = tonumber(val)
          if not val then return end
          
          if val < 0.1 then 
            val = 0.1
          elseif val > 10 then 
            val = 10
          end
          me.primary_panel_scale = val
          update_gui_func()
        end
      },
      param2 = {
        type = 'input',
        name = 'Secondary Panel Scale',
        desc = Constants.SECONDARY_PANEL_SCALE_DESC,
        get = function() return tostring(me.secondary_panel_scale) end,
        set = function(info, val)
          val = tonumber(val)
          if not val then return end
          
          if val < 0.1 then
            val = 0.1
          elseif val > 10 then 
            val = 10
          end
          me.secondary_panel_scale = val
          update_gui_func()
        end
      },
      param3 = {
        type = 'select',
        values = { 
          TOPLEFT = 'Top left',
          TOPRIGHT = 'Top right',
          BOTTOMLEFT = 'Bottom left',
          BOTTOMRIGHT = 'Bottom right'
        },
        name = 'Secondary panels primary panel corner offset',
        desc = Constants.SECONDARY_PANEL_PRIM_CORNER_OFFSET,
        get = function() return me.secondary_panel_ref_point_pri end,
        set = function(info, val)
          me.secondary_panel_ref_point_pri = val
          update_gui_func()
        end
      },
      param4 = {
        type = 'select',
        values = { 
          TOPLEFT = 'Top left',
          TOPRIGHT = 'Top right',
          BOTTOMLEFT = 'Bottom left',
          BOTTOMRIGHT = 'Bottom right'
        },
        name = 'Secondary panels reference corner',
        desc = Constants.SECONDARY_PANEL_REFERENCE_CORNER,
        get = function() return me.secondary_panel_ref_point_sec end,
        set = function(info, val)
          me.secondary_panel_ref_point_sec = val
          update_gui_func()
        end
      },
      param5 = {
        type = 'input',
        name = 'Secondary panel x offset',
        desc = Constants.SECONDARY_PANEL_X_OFFSET,
        get = function() return tostring(me.secondary_panel_x_offset) end,
        set = function(info, val) 
          val = tonumber(val)
          if not val then return end
          
          me.secondary_panel_x_offset = val
          update_gui_func()
        end
      },
      param6 = {
        type = 'input',
        name = 'Secondary panel y offset',
        desc = Constants.SECONDARY_PANEL_Y_OFFSET,
        get = function() return tostring(me.secondary_panel_y_offset) end,
        set = function(info, val) 
          val = tonumber(val)
          if not val then return end
          
          me.secondary_panel_y_offset = val
          update_gui_func()
        end
      }
    }
  }
  
  return result
end

function TorpedoGUISettings:Serializable()
  local res = {}
  res.primary_panel_scale = self.primary_panel_scale
  res.secondary_panel_scale = self.secondary_panel_scale
  res.secondary_panel_ref_point_pri = self.secondary_panel_ref_point_pri
  res.secondary_panel_ref_point_sec = self.secondary_panel_ref_point_sec
  res.secondary_panel_x_offset = self.secondary_panel_x_offset
  res.secondary_panel_y_offset = self.secondary_panel_y_offset
  
  res.primary_panel_x = self.primary_panel_x
  res.primary_panel_y = self.primary_panel_y
  res.primary_panel_point = self.primary_panel_point
  res.primary_panel_relative_point = self.primary_panel_relative_point
  return res
end

function TorpedoGUISettings:Unserialize(ser)
  if not ser then return TorpedoGUISettings:New({}) end
  
  local res = {}
  for k,v in pairs(ser) do 
    res[k] = v
  end
  return TorpedoGUISettings:New(res)
end
