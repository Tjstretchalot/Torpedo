local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')

local MAJOR, MINOR = 'TorpedoDefaultConfig-1.0', 1
local TorpedoDefaultConfig = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoDefaultConfig then return end

local config = {
	["default_profile"] = {
		["gui_settings"] = {
			["primary_panel_x"] = 500,
			["primary_panel_point"] = "TOPLEFT",
			["secondary_panel_y_offset"] = -5,
			["secondary_panel_scale"] = 0.7,
			["secondary_panel_ref_point_sec"] = "BOTTOMLEFT",
			["primary_panel_y"] = -50,
			["secondary_panel_x_offset"] = 10,
			["primary_panel_relative_point"] = "TOPLEFT",
			["primary_panel_scale"] = 1,
			["secondary_panel_ref_point_pri"] = "BOTTOMRIGHT",
		},
		["specializations"] = {
			{
				["specialization_id"] = 261,
				["name"] = "Subtlety",
				["cooldowns"] = {
					{
						["debugName"] = "SymbolsOfDeath",
						["name"] = "Symbols of Death",
						["icon_id"] = 252272,
						["spell_id"] = 212283,
						["cooldown"] = 45,
					}, -- [1]
					{
						["debugName"] = "Vanish",
						["name"] = "Vanish",
						["icon_id"] = 132331,
						["spell_id"] = 1856,
						["cooldown"] = 120,
					}, -- [2]
					{
						["debugName"] = "ShadowDance",
						["name"] = "Shadow Dance",
						["icon_id"] = 252272,
						["spell_id"] = 185313,
						["cooldown"] = 60,
						["charges"] = 3,
					}, -- [3]
					{
						["debugName"] = "ShadowBlades",
						["name"] = "Shadow Blades",
						["icon_id"] = 376022,
						["spell_id"] = 121471,
						["cooldown"] = 180,
					}, -- [4]
					{
						["debugName"] = "GoremawsBite",
						["name"] = "Goremaw's Bite",
						["icon_id"] = 1120132,
						["spell_id"] = 209782,
						["cooldown"] = 60,
					}, -- [5]
				},
				["skills"] = {
					{
						["spell"] = {
							["debugName"] = "Stealth",
							["name"] = "Stealth",
							["icon_id"] = 132320,
							["spell_id"] = 115191,
							["cooldown"] = 2,
						},
						["name"] = "Stealth",
						["suggestions"] = {
						},
					}, -- [1]
					{
						["spell"] = {
							["debugName"] = "SymbolsOfDeath",
							["name"] = "Symbols of Death",
							["icon_id"] = 252272,
							["spell_id"] = 212283,
							["cooldown"] = 45,
						},
						["name"] = "Symbols of Death",
						["suggestions"] = {
						},
					}, -- [2]
					{
						["spell"] = {
							["debugName"] = "Shadowstrike",
							["name"] = "Shadowstrike",
							["icon_id"] = 1373912,
							["spell_id"] = 185439,
						},
						["name"] = "Shadowstrike",
						["suggestions"] = {
						},
					}, -- [3]
					{
						["spell"] = {
							["debugName"] = "Nightblade",
							["name"] = "Nightblade",
							["icon_id"] = 1373907,
							["spell_id"] = 195452,
						},
						["name"] = "Nightblade",
						["suggestions"] = {
						},
					}, -- [4]
					{
						["spell"] = {
							["debugName"] = "Eviscerate",
							["name"] = "Eviscerate",
							["icon_id"] = 132292,
							["spell_id"] = 196819,
						},
						["name"] = "Eviscerate",
						["suggestions"] = {
						},
					}, -- [5]
					{
						["spell"] = {
							["debugName"] = "Backstab",
							["name"] = "Backstab",
							["icon_id"] = 132090,
							["spell_id"] = 53,
						},
						["name"] = "Backstab",
						["suggestions"] = {
						},
					}, -- [6]
					{
						["spell"] = {
							["debugName"] = "Vanish",
							["name"] = "Vanish",
							["icon_id"] = 132331,
							["spell_id"] = 1856,
						},
						["name"] = "Vanish",
						["suggestions"] = {
						},
					}, -- [7]
					{
						["spell"] = {
							["debugName"] = "ShadowDance",
							["name"] = "Shadow Dance",
							["icon_id"] = 236279,
							["spell_id"] = 185313,
						},
						["name"] = "Shadow Dance",
						["suggestions"] = {
						},
					}, -- [8]
					{
						["spell"] = {
							["debugName"] = "ShadowBlades",
							["name"] = "Shadow Blades",
							["icon_id"] = 376022,
							["spell_id"] = 121471,
							["cooldown"] = 180,
						},
						["name"] = "Shadow Blades",
						["suggestions"] = {
						},
					}, -- [9]
					{
						["spell"] = {
							["debugName"] = "GoremawsBite",
							["name"] = "Goremaw's Bite",
							["icon_id"] = 1120132,
							["spell_id"] = 209782,
							["cooldown"] = 60,
						},
						["name"] = "Goremaw's Bite",
						["suggestions"] = {
						},
					}, -- [10]
					{
						["spell"] = {
							["debugName"] = "Gloomblade",
							["name"] = "Gloomblade",
							["icon_id"] = 132292,
							["spell_id"] = 200758,
						},
						["name"] = "Gloomblade",
						["suggestions"] = {
						},
					}, -- [11]
				},
				["auras"] = {
					{
						["debugName"] = "SymbolsOfDeath",
						["name"] = "Symbols of Death",
						["icon_id"] = 252272,
						["target"] = "player",
						["max_duration"] = 45,
						["aura_id"] = 212283,
					}, -- [1]
					{
						["debugName"] = "Nightblade",
						["name"] = "Nightblade",
						["icon_id"] = 1373907,
						["target"] = "target",
						["max_duration"] = 26,
						["aura_id"] = 195452,
					}, -- [2]
					{
						["debugName"] = "ShadowBlades",
						["name"] = "Shadow Blades",
						["icon_id"] = 376022,
						["target"] = "player",
						["max_duration"] = 26,
						["aura_id"] = 121471,
					}, -- [3]
					{
						["debugName"] = "GoremawsBite",
						["name"] = "Goremaws Bite",
						["icon_id"] = 1120132,
						["target"] = "player",
						["max_duration"] = 7.8,
						["aura_id"] = 220901,
					}, -- [4]
					{
						["is_stealthy"] = true,
						["debugName"] = "Stealth1",
						["name"] = "Stealth 1",
						["icon_id"] = 132320,
						["target"] = "player",
						["max_duration"] = 1,
						["hidden"] = true,
						["aura_id"] = 1784,
					}, -- [5]
					{
						["is_stealthy"] = true,
						["debugName"] = "Stealth2",
						["name"] = "Stealth 2",
						["icon_id"] = 132320,
						["target"] = "player",
						["max_duration"] = 1,
						["hidden"] = true,
						["aura_id"] = 115191,
					}, -- [6]
					{
						["is_stealthy"] = true,
						["debugName"] = "Subterfuge",
						["name"] = "Subterfuge",
						["icon_id"] = 132320,
						["target"] = "player",
						["max_duration"] = 1,
						["hidden"] = true,
						["aura_id"] = 115192,
					}, -- [7]
					{
						["is_stealthy"] = true,
						["debugName"] = "Vanish1",
						["name"] = "Vanish 1",
						["icon_id"] = 132331,
						["target"] = "player",
						["max_duration"] = 3,
						["hidden"] = true,
						["aura_id"] = 11327,
					}, -- [8]
					{
						["is_stealthy"] = true,
						["debugName"] = "Vanish2",
						["name"] = "Vanish 2",
						["icon_id"] = 132331,
						["target"] = "player",
						["max_duration"] = 3,
						["hidden"] = true,
						["aura_id"] = 11329,
					}, -- [9]
					{
						["is_stealthy"] = true,
						["debugName"] = "Vanish3",
						["name"] = "Vanish 3",
						["icon_id"] = 132331,
						["target"] = "player",
						["max_duration"] = 3,
						["hidden"] = true,
						["aura_id"] = 115193,
					}, -- [10]
					{
						["is_stealthy"] = true,
						["debugName"] = "ShadowDanceOld",
						["name"] = "Shadow Dance Old",
						["icon_id"] = 236279,
						["target"] = "player",
						["max_duration"] = 5,
						["hidden"] = true,
						["aura_id"] = 51713,
					}, -- [11]
					{
						["is_stealthy"] = true,
						["debugName"] = "ShadowDance",
						["name"] = "Shadow Dance",
						["icon_id"] = 236279,
						["target"] = "player",
						["max_duration"] = 5,
						["hidden"] = true,
						["aura_id"] = 185422,
					}, -- [12]
				},
			}, -- [1]
			{
				["specialization_id"] = 259,
				["name"] = "Assassination",
				["cooldowns"] = {
					{
						["debugName"] = "Vendetta",
						["name"] = "Vendetta",
						["icon_id"] = 458726,
						["spell_id"] = 79140,
						["cooldown"] = 120,
					}, -- [1]
					{
						["debugName"] = "Vanish",
						["name"] = "Vanish",
						["icon_id"] = 132331,
						["spell_id"] = 1856,
						["cooldown"] = 120,
					}, -- [2]
					{
						["debugName"] = "Garrote",
						["name"] = "Garrote",
						["icon_id"] = 132297,
						["spell_id"] = 703,
						["cooldown"] = 15,
					}, -- [3]
					{
						["debugName"] = "Exsanguinate",
						["name"] = "Exsanguinate",
						["icon_id"] = 538040,
						["spell_id"] = 200806,
						["cooldown"] = 45,
					}, -- [4]
					{
						["debugName"] = "Kingsbane",
						["name"] = "Kingsbane",
						["icon_id"] = 1259291,
						["spell_id"] = 192759,
						["cooldown"] = 45,
					}, -- [5]
					{
						["debugName"] = "CrimsonVial",
						["name"] = "Crimson Vial",
						["icon_id"] = 1373904,
						["spell_id"] = 185311,
						["cooldown"] = 30,
					}, -- [6]
					{
						["debugName"] = "Rupture",
						["name"] = "Rupture",
						["icon_id"] = 132302,
						["spell_id"] = 1943,
						["cooldown"] = 1,
					}, -- [7]
				},
				["skills"] = {
					{
						["spell"] = {
							["debugName"] = "DeadlyPoison",
							["name"] = "Deadly Poison",
							["icon_id"] = 132290,
							["spell_id"] = 2823,
						},
						["name"] = "Deadly Poison",
						["suggestions"] = {
						},
					}, -- [1]
					{
						["spell"] = {
							["debugName"] = "Vendetta",
							["name"] = "Vendetta",
							["icon_id"] = 458726,
							["spell_id"] = 79140,
							["cooldown"] = 120,
						},
						["name"] = "Vendetta",
						["suggestions"] = {
						},
					}, -- [2]
					{
						["spell"] = {
							["debugName"] = "Vanish",
							["name"] = "Vanish",
							["icon_id"] = 132331,
							["spell_id"] = 1856,
							["cooldown"] = 120,
						},
						["name"] = "Vanish",
						["suggestions"] = {
						},
					}, -- [3]
					{
						["spell"] = {
							["debugName"] = "Mutilate",
							["name"] = "Mutilate",
							["icon_id"] = 132304,
							["spell_id"] = 1329,
						},
						["name"] = "Mutilate",
						["suggestions"] = {
						},
					}, -- [4]
					{
						["spell"] = {
							["debugName"] = "Garrote",
							["name"] = "Garrote",
							["icon_id"] = 132297,
							["spell_id"] = 703,
							["cooldown"] = 15,
						},
						["name"] = "Garrote",
						["suggestions"] = {
						},
					}, -- [5]
					{
						["spell"] = {
							["debugName"] = "Exsanguinate",
							["name"] = "Exsanguinate",
							["icon_id"] = 538040,
							["spell_id"] = 200806,
							["cooldown"] = 45,
						},
						["name"] = "Exsanguinate",
						["suggestions"] = {
						},
					}, -- [6]
					{
						["spell"] = {
							["debugName"] = "Kingsbane",
							["name"] = "Kingsbane",
							["icon_id"] = 1259291,
							["spell_id"] = 192759,
							["cooldown"] = 45,
						},
						["name"] = "Kingsbane",
						["suggestions"] = {
						},
					}, -- [7]
					{
						["spell"] = {
							["debugName"] = "Envenom",
							["name"] = "Envenom",
							["icon_id"] = 132287,
							["spell_id"] = 32645,
						},
						["name"] = "Envenom",
						["suggestions"] = {
						},
					}, -- [8]
					{
						["spell"] = {
							["debugName"] = "Stealth",
							["name"] = "Stealth",
							["icon_id"] = 132320,
							["spell_id"] = 1784,
						},
						["name"] = "Stealth",
						["suggestions"] = {
						},
					}, -- [9]
					{
						["spell"] = {
							["debugName"] = "CrimsonVial",
							["name"] = "Crimson Vial",
							["icon_id"] = 1373904,
							["spell_id"] = 185311,
							["cooldown"] = 30,
						},
						["name"] = "Crimson Vial",
						["suggestions"] = {
						},
					}, -- [10]
					{
						["spell"] = {
							["debugName"] = "Rupture",
							["name"] = "Rupture",
							["icon_id"] = 132302,
							["spell_id"] = 1943,
						},
						["name"] = "Rupture",
						["suggestions"] = {
						},
					}, -- [11]
				},
				["advanced_features"] = false,
				["auras"] = {
					{
						["is_stealthy"] = true,
						["debugName"] = "Stealth2",
						["name"] = "Stealth 2",
						["icon_id"] = 132320,
						["target"] = "player",
						["max_duration"] = 1,
						["hidden"] = true,
						["aura_id"] = 115191,
					}, -- [1]
					{
						["is_stealthy"] = true,
						["debugName"] = "Subterfuge",
						["name"] = "Subterfuge",
						["icon_id"] = 132320,
						["target"] = "player",
						["max_duration"] = 1,
						["hidden"] = true,
						["aura_id"] = 115192,
					}, -- [2]
					{
						["is_stealthy"] = true,
						["debugName"] = "Vanish",
						["name"] = "Vanish",
						["icon_id"] = "Interface\\Icons\\Ability_Vanish",
						["target"] = "player",
						["max_duration"] = 3.9,
						["hidden"] = true,
						["aura_id"] = 11327,
					}, -- [3]
					{
						["is_stealthy"] = true,
						["debugName"] = "Vanish2",
						["name"] = "Vanish 2",
						["icon_id"] = "Interface\\Icons\\Ability_Vanish",
						["target"] = "player",
						["max_duration"] = 3.9,
						["hidden"] = true,
						["aura_id"] = 11329,
					}, -- [4]
					{
						["is_stealthy"] = true,
						["debugName"] = "Vanish3",
						["name"] = "Vanish 3",
						["icon_id"] = "Interface\\Icons\\Ability_Vanish",
						["target"] = "player",
						["max_duration"] = 3.9,
						["hidden"] = true,
						["aura_id"] = 115193,
					}, -- [5]
					{
						["is_stealthy"] = false,
						["debugName"] = "DeadlyPoison",
						["name"] = "Deadly Poison",
						["icon_id"] = "Interface\\Icons\\Ability_Rogue_DualWeild",
						["target"] = "player",
						["max_duration"] = 4680,
						["hidden"] = false,
						["aura_id"] = 2823,
					}, -- [6]
					{
						["is_stealthy"] = true,
						["debugName"] = "Stealth",
						["name"] = "Stealth",
						["icon_id"] = "Interface\\Icons\\Ability_Stealth",
						["target"] = "player",
						["max_duration"] = 1,
						["hidden"] = true,
						["aura_id"] = 1784,
					}, -- [7]
					{
						["is_stealthy"] = false,
						["debugName"] = "Rupture",
						["name"] = "Rupture",
						["icon_id"] = "Interface\\Icons\\Ability_Rogue_Rupture",
						["target"] = "target",
						["max_duration"] = 26,
						["hidden"] = false,
						["aura_id"] = 1943,
					}, -- [8]
					{
						["is_stealthy"] = false,
						["debugName"] = "Garrote",
						["name"] = "Garrote",
						["icon_id"] = "Interface\\Icons\\Ability_Rogue_Garrote",
						["target"] = "target",
						["max_duration"] = 23.4,
						["hidden"] = false,
						["aura_id"] = 703,
					}, -- [9]
				},
			}, -- [2]
		},
		["name"] = "Default",
	},
	["active_spec_id"] = 261,
	["active_profile_index"] = 1,
	["profiles"] = {
		{
			["gui_settings"] = {
				["primary_panel_x"] = 500,
				["primary_panel_point"] = "TOPLEFT",
				["secondary_panel_y_offset"] = 0,
				["secondary_panel_scale"] = 0.7,
				["secondary_panel_ref_point_sec"] = "BOTTOMLEFT",
				["primary_panel_y"] = -50,
				["secondary_panel_x_offset"] = 10,
				["primary_panel_relative_point"] = "TOPLEFT",
				["primary_panel_scale"] = 1,
				["secondary_panel_ref_point_pri"] = "BOTTOMRIGHT",
			},
			["specializations"] = {
				{
					["specialization_id"] = 261,
					["name"] = "Subtlety",
					["cooldowns"] = {
						{
							["debugName"] = "SymbolsOfDeath",
							["name"] = "Symbols of Death",
							["icon_id"] = 252272,
							["spell_id"] = 212283,
							["cooldown"] = 45,
						}, -- [1]
						{
							["debugName"] = "Vanish",
							["name"] = "Vanish",
							["icon_id"] = 132331,
							["spell_id"] = 1856,
							["cooldown"] = 120,
						}, -- [2]
						{
							["debugName"] = "ShadowDance",
							["name"] = "Shadow Dance",
							["icon_id"] = 252272,
							["spell_id"] = 185313,
							["cooldown"] = 60,
							["charges"] = 3,
						}, -- [3]
						{
							["debugName"] = "ShadowBlades",
							["name"] = "Shadow Blades",
							["icon_id"] = 376022,
							["spell_id"] = 121471,
							["cooldown"] = 180,
						}, -- [4]
						{
							["debugName"] = "GoremawsBite",
							["name"] = "Goremaw's Bite",
							["icon_id"] = 1120132,
							["spell_id"] = 209782,
							["cooldown"] = 60,
						}, -- [5]
						{
							["debugName"] = "CrimsonVial",
							["name"] = "Crimson Vial",
							["icon_id"] = 1373904,
							["spell_id"] = 185311,
							["cooldown"] = 30,
						}, -- [6]
						{
							["debugName"] = "CheapShot",
							["name"] = "Cheap Shot",
							["icon_id"] = 132092,
							["spell_id"] = 1833,
							["cooldown"] = 1,
						}, -- [7]
					},
					["skills"] = {
						{
							["spell"] = {
								["debugName"] = "Stealth",
								["name"] = "Stealth",
								["icon_id"] = 132320,
								["spell_id"] = 115191,
								["cooldown"] = 2,
							},
							["name"] = "Stealth",
							["suggestions"] = {
								{
									["enabled"] = true,
									["cache_spells"] = {
									},
									["spell"] = {
										["debugName"] = "Stealth",
										["name"] = "Stealth",
										["icon_id"] = 132320,
										["spell_id"] = 115191,
										["cooldown"] = 2,
									},
									["talent_choices"] = {
									},
									["priority"] = 503,
									["primary"] = true,
									["require_no_combat"] = true,
									["require_not_stealthed"] = true,
								}, -- [1]
							},
						}, -- [1]
						{
							["spell"] = {
								["debugName"] = "SymbolsOfDeath",
								["name"] = "Symbols of Death",
								["icon_id"] = 252272,
								["spell_id"] = 212283,
								["cooldown"] = 45,
							},
							["name"] = "Symbols of Death",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "SymbolsOfDeath",
										["name"] = "Symbols of Death",
										["icon_id"] = 252272,
										["spell_id"] = 212283,
										["cooldown"] = 45,
									},
									["require_stealthed"] = true,
									["minEnergy"] = 35,
									["checkEnergy"] = true,
									["primary"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["hasMaxDurationOfSymbolsOfDeath"] = true,
									["maxDurationOfSymbolsOfDeath"] = 10,
									["talent_choices"] = {
									},
									["priority"] = 501,
									["poolEnergyIfLow"] = true,
									["checkDurationOfSymbolsOfDeath"] = true,
								}, -- [1]
							},
						}, -- [2]
						{
							["spell"] = {
								["debugName"] = "Shadowstrike",
								["name"] = "Shadowstrike",
								["icon_id"] = 1373912,
								["spell_id"] = 185439,
							},
							["name"] = "Shadowstrike",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Shadowstrike",
										["name"] = "Shadowstrike",
										["icon_id"] = 1373912,
										["spell_id"] = 185439,
									},
									["require_stealthed"] = true,
									["talent_choices"] = {
									},
									["checkEnergy"] = true,
									["primary"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["priority"] = 495,
									["minEnergy"] = 40,
									["poolEnergyIfLow"] = true,
								}, -- [1]
							},
						}, -- [3]
						{
							["spell"] = {
								["debugName"] = "Nightblade",
								["name"] = "Nightblade",
								["icon_id"] = 1373907,
								["spell_id"] = 195452,
							},
							["name"] = "Nightblade",
							["suggestions"] = {
								{
									["maxDurationOfNightblade"] = 4.8,
									["minEnergy"] = 25,
									["checkEnergy"] = true,
									["hasMinComboPoints"] = true,
									["hasMinEnergy"] = true,
									["priority"] = 499,
									["poolEnergyIfLow"] = true,
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Nightblade",
										["name"] = "Nightblade",
										["icon_id"] = 1373907,
										["spell_id"] = 195452,
									},
									["checkTimeToKillSolo"] = true,
									["primary"] = true,
									["minTimeToKillSolo"] = 4,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["hasMinTimeToKillSolo"] = true,
									["minComboPoints"] = 5,
									["checkDurationOfNightblade"] = true,
									["hasMaxDurationOfNightblade"] = true,
									["talent_choices"] = {
									},
								}, -- [1]
								{
									["maxDurationOfNightblade"] = 4.8,
									["minDurationOfNightblade"] = 4.8,
									["minEnergy"] = 25,
									["checkEnergy"] = true,
									["hasMinComboPoints"] = true,
									["hasMinEnergy"] = true,
									["priority"] = 498,
									["poolEnergyIfLow"] = true,
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Nightblade",
										["name"] = "Nightblade",
										["icon_id"] = 1373907,
										["spell_id"] = 195452,
									},
									["primary"] = true,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["require_pvp"] = true,
									["minComboPoints"] = 5,
									["checkDurationOfNightblade"] = true,
									["hasMaxDurationOfNightblade"] = true,
									["talent_choices"] = {
									},
								}, -- [2]
							},
						}, -- [4]
						{
							["spell"] = {
								["debugName"] = "Eviscerate",
								["name"] = "Eviscerate",
								["icon_id"] = 132292,
								["spell_id"] = 196819,
							},
							["name"] = "Eviscerate",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Eviscerate",
										["name"] = "Eviscerate",
										["icon_id"] = 132292,
										["spell_id"] = 196819,
									},
									["minEnergy"] = 35,
									["checkEnergy"] = true,
									["hasMinComboPoints"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["primary"] = true,
									["minComboPoints"] = 5,
									["priority"] = 497,
									["talent_choices"] = {
									},
									["poolEnergyIfLow"] = true,
								}, -- [1]
							},
						}, -- [5]
						{
							["spell"] = {
								["debugName"] = "Backstab",
								["name"] = "Backstab",
								["icon_id"] = 132090,
								["spell_id"] = 53,
							},
							["name"] = "Backstab",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Backstab",
										["name"] = "Backstab",
										["icon_id"] = 132090,
										["spell_id"] = 53,
									},
									["hasMaxDurationOfNightblade"] = true,
									["checkEnergy"] = true,
									["primary"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["minEnergy"] = 35,
									["talent_choices"] = {
									},
									["maxDurationOfNightblade"] = 6,
									["priority"] = 494,
									["checkDurationOfNightblade"] = true,
									["poolEnergyIfLow"] = true,
								}, -- [1]
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Backstab",
										["name"] = "Backstab",
										["icon_id"] = 132090,
										["spell_id"] = 53,
									},
									["minEnergy"] = 90,
									["checkEnergy"] = true,
									["primary"] = true,
									["hasMaxComboPoints"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["maxComboPoints"] = 4,
									["priority"] = 487,
									["talent_choices"] = {
									},
									["poolEnergyIfLow"] = true,
								}, -- [2]
							},
						}, -- [6]
						{
							["spell"] = {
								["debugName"] = "Vanish",
								["name"] = "Vanish",
								["icon_id"] = 132331,
								["spell_id"] = 1856,
							},
							["name"] = "Vanish",
							["suggestions"] = {
								{
									["require_not_stealthed"] = true,
									["spell"] = {
										["debugName"] = "Vanish",
										["name"] = "Vanish",
										["icon_id"] = 132331,
										["spell_id"] = 1856,
									},
									["hasMaxEnergy"] = true,
									["hasMaxCooldownForVanish"] = true,
									["checkEnergy"] = true,
									["primary"] = false,
									["priority"] = 492,
									["checkCooldownForVanish"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["talent_choices"] = {
									},
									["enabled"] = true,
									["maxEnergy"] = 120,
									["require_not_pvp"] = true,
									["minEnergy"] = 90,
									["poolEnergyIfLow"] = true,
								}, -- [1]
								{
									["hasMaxCooldownForSymbolsOfDeath"] = true,
									["talent_choices"] = {
									},
									["checkEnergy"] = true,
									["maxEnergy"] = 120,
									["priority"] = 486,
									["maxDurationOfSymbolsOfDeath"] = 10,
									["spell"] = {
										["debugName"] = "Vanish",
										["name"] = "Vanish",
										["icon_id"] = 132331,
										["spell_id"] = 1856,
									},
									["hasMaxEnergy"] = true,
									["hasMaxCooldownForVanish"] = true,
									["primary"] = true,
									["enabled"] = true,
									["cache_spells"] = {
									},
									["hasMaxDurationOfSymbolsOfDeath"] = true,
									["checkCooldownForVanish"] = true,
									["require_not_stealthed"] = true,
									["require_not_pvp"] = true,
									["checkCooldownForSymbolsOfDeath"] = true,
									["checkDurationOfSymbolsOfDeath"] = true,
								}, -- [2]
							},
						}, -- [7]
						{
							["spell"] = {
								["debugName"] = "ShadowDance",
								["name"] = "Shadow Dance",
								["icon_id"] = 236279,
								["spell_id"] = 185313,
							},
							["name"] = "Shadow Dance",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "ShadowDance",
										["name"] = "Shadow Dance",
										["icon_id"] = 236279,
										["spell_id"] = 185313,
									},
									["hasMaxEnergy"] = true,
									["minEnergy"] = 95,
									["checkEnergy"] = true,
									["minChargesForShadowDance"] = 2,
									["primary"] = false,
									["require_not_stealthed"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["hasMinChargesForShadowDance"] = true,
									["checkChargesForShadowDance"] = true,
									["maxEnergy"] = 120,
									["priority"] = 491,
									["talent_choices"] = {
									},
									["poolEnergyIfLow"] = true,
								}, -- [1]
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "ShadowDance",
										["name"] = "Shadow Dance",
										["icon_id"] = 236279,
										["spell_id"] = 185313,
									},
									["hasMaxEnergy"] = true,
									["talent_choices"] = {
									},
									["primary"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = true,
									["maxDurationOfSymbolsOfDeath"] = 10,
									["require_not_stealthed"] = true,
									["cache_spells"] = {
									},
									["hasMinChargesForShadowDance"] = true,
									["checkChargesForShadowDance"] = true,
									["maxEnergy"] = 130,
									["priority"] = 490,
									["minChargesForShadowDance"] = 1,
									["checkDurationOfSymbolsOfDeath"] = true,
								}, -- [2]
							},
						}, -- [8]
						{
							["spell"] = {
								["debugName"] = "ShadowBlades",
								["name"] = "Shadow Blades",
								["icon_id"] = 376022,
								["spell_id"] = 121471,
								["cooldown"] = 180,
							},
							["name"] = "Shadow Blades",
							["suggestions"] = {
								{
									["enabled"] = true,
									["hasMaxCooldownForShadowBlades"] = true,
									["checkTimeToKillSolo"] = true,
									["talent_choices"] = {
									},
									["primary"] = false,
									["minTimeToKillSolo"] = 30,
									["cache_spells"] = {
									},
									["hasMinTimeToKillSolo"] = true,
									["priority"] = 488,
									["spell"] = {
										["debugName"] = "ShadowBlades",
										["name"] = "Shadow Blades",
										["icon_id"] = 376022,
										["spell_id"] = 121471,
										["cooldown"] = 180,
									},
									["checkCooldownForShadowBlades"] = true,
								}, -- [1]
							},
						}, -- [9]
						{
							["spell"] = {
								["debugName"] = "GoremawsBite",
								["name"] = "Goremaw's Bite",
								["icon_id"] = 1120132,
								["spell_id"] = 209782,
								["cooldown"] = 60,
							},
							["name"] = "Goremaw's Bite",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "GoremawsBite",
										["name"] = "Goremaw's Bite",
										["icon_id"] = 1120132,
										["spell_id"] = 209782,
										["cooldown"] = 60,
									},
									["hasMaxEnergy"] = true,
									["talent_choices"] = {
									},
									["checkEnergy"] = true,
									["primary"] = true,
									["hasMaxComboPoints"] = true,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["maxComboPoints"] = 3,
									["maxEnergy"] = 150,
									["priority"] = 496,
									["hasMaxCooldownForGoremawsBite"] = true,
									["checkCooldownForGoremawsBite"] = true,
								}, -- [1]
							},
						}, -- [10]
						{
							["spell"] = {
								["debugName"] = "CrimsonVial",
								["name"] = "Crimson Vial",
								["icon_id"] = 1373904,
								["spell_id"] = 185311,
								["cooldown"] = 30,
							},
							["name"] = "Crimson Vial",
							["suggestions"] = {
								{
									["talent_choices"] = {
									},
									["require_not_instance"] = true,
									["minHealthPerc"] = 65,
									["hasMinEnergy"] = true,
									["priority"] = 550,
									["poolEnergyIfLow"] = true,
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "CrimsonVial",
										["name"] = "Crimson Vial",
										["icon_id"] = 1373904,
										["spell_id"] = 185311,
										["cooldown"] = 30,
									},
									["hasMaxHealthPerc"] = true,
									["checkCooldownForCrimsonVial"] = true,
									["cache_spells"] = {
									},
									["checkHealthPerc"] = true,
									["maxHealthPerc"] = 70,
									["primary"] = false,
									["minEnergy"] = 30,
									["checkEnergy"] = true,
									["hasMaxCooldownForCrimsonVial"] = true,
								}, -- [1]
							},
						}, -- [11]
						{
							["spell"] = {
								["debugName"] = "CheapShot",
								["name"] = "Cheap Shot",
								["icon_id"] = 132092,
								["spell_id"] = 1833,
							},
							["name"] = "Cheap Shot",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "CheapShot",
										["name"] = "Cheap Shot",
										["icon_id"] = 132092,
										["spell_id"] = 1833,
									},
									["require_stealthed"] = true,
									["minEnergy"] = 40,
									["checkEnergy"] = true,
									["primary"] = true,
									["minTimeToKillSolo"] = 3,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
										{
											["enabled"] = true,
											["spell"] = {
												["debugName"] = "CheapShot",
												["name"] = "Cheap Shot",
												["icon_id"] = 132092,
												["spell_id"] = 1833,
												["cooldown"] = 1,
											},
											["hasMinTimeSinceCastForCheapShot"] = true,
											["minTimeSinceCastForCheapShot"] = 20,
											["checkTimeSinceCastForCheapShot"] = true,
										}, -- [1]
									},
									["hasMinTimeToKillSolo"] = true,
									["talent_choices"] = {
									},
									["priority"] = 505,
									["require_pvp"] = true,
									["poolEnergyIfLow"] = true,
								}, -- [1]
							},
						}, -- [12]
					},
					["advanced_features"] = true,
					["auras"] = {
						{
							["debugName"] = "SymbolsOfDeath",
							["name"] = "Symbols of Death",
							["icon_id"] = 252272,
							["target"] = "player",
							["max_duration"] = 45,
							["aura_id"] = 212283,
						}, -- [1]
						{
							["debugName"] = "Nightblade",
							["name"] = "Nightblade",
							["icon_id"] = 1373907,
							["target"] = "target",
							["max_duration"] = 26,
							["aura_id"] = 195452,
						}, -- [2]
						{
							["debugName"] = "ShadowBlades",
							["name"] = "Shadow Blades",
							["icon_id"] = 376022,
							["target"] = "player",
							["max_duration"] = 26,
							["aura_id"] = 121471,
						}, -- [3]
						{
							["debugName"] = "GoremawsBite",
							["name"] = "Goremaws Bite",
							["icon_id"] = 1120132,
							["target"] = "player",
							["max_duration"] = 7.8,
							["aura_id"] = 220901,
						}, -- [4]
						{
							["is_stealthy"] = true,
							["debugName"] = "Stealth1",
							["name"] = "Stealth 1",
							["icon_id"] = 132320,
							["target"] = "player",
							["max_duration"] = 1,
							["hidden"] = true,
							["aura_id"] = 1784,
						}, -- [5]
						{
							["is_stealthy"] = true,
							["debugName"] = "Stealth2",
							["name"] = "Stealth 2",
							["icon_id"] = 132320,
							["target"] = "player",
							["max_duration"] = 1,
							["hidden"] = true,
							["aura_id"] = 115191,
						}, -- [6]
						{
							["is_stealthy"] = true,
							["debugName"] = "Subterfuge",
							["name"] = "Subterfuge",
							["icon_id"] = 132320,
							["target"] = "player",
							["max_duration"] = 1,
							["hidden"] = true,
							["aura_id"] = 115192,
						}, -- [7]
						{
							["is_stealthy"] = true,
							["debugName"] = "Vanish1",
							["name"] = "Vanish 1",
							["icon_id"] = 132331,
							["target"] = "player",
							["max_duration"] = 3,
							["hidden"] = true,
							["aura_id"] = 11327,
						}, -- [8]
						{
							["is_stealthy"] = true,
							["debugName"] = "Vanish2",
							["name"] = "Vanish 2",
							["icon_id"] = 132331,
							["target"] = "player",
							["max_duration"] = 3,
							["hidden"] = true,
							["aura_id"] = 11329,
						}, -- [9]
						{
							["is_stealthy"] = true,
							["debugName"] = "Vanish3",
							["name"] = "Vanish 3",
							["icon_id"] = 132331,
							["target"] = "player",
							["max_duration"] = 3,
							["hidden"] = true,
							["aura_id"] = 115193,
						}, -- [10]
						{
							["is_stealthy"] = true,
							["debugName"] = "ShadowDanceOld",
							["name"] = "Shadow Dance Old",
							["icon_id"] = 236279,
							["target"] = "player",
							["max_duration"] = 5,
							["hidden"] = true,
							["aura_id"] = 51713,
						}, -- [11]
						{
							["is_stealthy"] = true,
							["debugName"] = "ShadowDance",
							["name"] = "Shadow Dance",
							["icon_id"] = 236279,
							["target"] = "player",
							["max_duration"] = 5,
							["hidden"] = true,
							["aura_id"] = 185422,
						}, -- [12]
						{
							["debugName"] = "CrimsonVial",
							["name"] = "Crimson Vial",
							["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
							["target"] = "player",
							["max_duration"] = 7.8,
							["aura_id"] = 185311,
						}, -- [13]
						{
							["is_stealthy"] = false,
							["debugName"] = "CheapShot",
							["name"] = "Cheap Shot",
							["icon_id"] = "Interface\\Icons\\Ability_CheapShot",
							["target"] = "target",
							["max_duration"] = 5.2013,
							["hidden"] = false,
							["aura_id"] = 1833,
						}, -- [14]
					},
				}, -- [1]
				{
					["specialization_id"] = 259,
					["name"] = "Assassination",
					["cooldowns"] = {
						{
							["debugName"] = "Vendetta",
							["name"] = "Vendetta",
							["icon_id"] = 458726,
							["spell_id"] = 79140,
							["cooldown"] = 120,
						}, -- [1]
						{
							["debugName"] = "Vanish",
							["name"] = "Vanish",
							["icon_id"] = 132331,
							["spell_id"] = 1856,
							["cooldown"] = 120,
						}, -- [2]
						{
							["debugName"] = "Garrote",
							["name"] = "Garrote",
							["icon_id"] = 132297,
							["spell_id"] = 703,
							["cooldown"] = 15,
						}, -- [3]
						{
							["debugName"] = "Exsanguinate",
							["name"] = "Exsanguinate",
							["icon_id"] = 538040,
							["spell_id"] = 200806,
							["cooldown"] = 45,
						}, -- [4]
						{
							["debugName"] = "Kingsbane",
							["name"] = "Kingsbane",
							["icon_id"] = 1259291,
							["spell_id"] = 192759,
							["cooldown"] = 45,
						}, -- [5]
						{
							["debugName"] = "CrimsonVial",
							["name"] = "Crimson Vial",
							["icon_id"] = 1373904,
							["spell_id"] = 185311,
							["cooldown"] = 30,
						}, -- [6]
						{
							["debugName"] = "Rupture",
							["name"] = "Rupture",
							["icon_id"] = 132302,
							["spell_id"] = 1943,
							["cooldown"] = 1,
						}, -- [7]
					},
					["skills"] = {
						{
							["spell"] = {
								["debugName"] = "DeadlyPoison",
								["name"] = "Deadly Poison",
								["icon_id"] = 132290,
								["spell_id"] = 2823,
							},
							["name"] = "Deadly Poison",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "DeadlyPoison",
										["name"] = "Deadly Poison",
										["icon_id"] = 132290,
										["spell_id"] = 2823,
									},
									["talent_choices"] = {
										{
											["enabled"] = true,
											["column"] = 1,
											["tier"] = 6,
											["inverted"] = true,
										}, -- [1]
									},
									["require_no_combat"] = true,
									["hasMaxDurationOfDeadlyPoison"] = true,
									["cache_spells"] = {
									},
									["maxDurationOfDeadlyPoison"] = 600,
									["priority"] = 900,
									["primary"] = true,
									["checkDurationOfDeadlyPoison"] = true,
								}, -- [1]
								{
									["enabled"] = true,
									["cache_spells"] = {
									},
									["primary"] = true,
									["talent_choices"] = {
										{
											["enabled"] = true,
											["column"] = 1,
											["tier"] = 6,
											["inverted"] = true,
										}, -- [1]
									},
									["checkDurationOfDeadlyPoison"] = true,
									["priority"] = 895,
									["spell"] = {
										["debugName"] = "DeadlyPoison",
										["name"] = "Deadly Poison",
										["icon_id"] = 132290,
										["spell_id"] = 2823,
									},
									["hasMaxDurationOfDeadlyPoison"] = true,
								}, -- [2]
							},
						}, -- [1]
						{
							["spell"] = {
								["debugName"] = "Vendetta",
								["name"] = "Vendetta",
								["icon_id"] = 458726,
								["spell_id"] = 79140,
								["cooldown"] = 120,
							},
							["name"] = "Vendetta",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Vendetta",
										["name"] = "Vendetta",
										["icon_id"] = 458726,
										["spell_id"] = 79140,
										["cooldown"] = 120,
									},
									["checkTimeToKillSolo"] = true,
									["talent_choices"] = {
									},
									["primary"] = false,
									["minTimeToKillSolo"] = 30,
									["cache_spells"] = {
									},
									["checkCooldownForVendetta"] = true,
									["priority"] = 650,
									["hasMaxCooldownForVendetta"] = true,
									["hasMinTimeToKillSolo"] = true,
								}, -- [1]
							},
						}, -- [2]
						{
							["spell"] = {
								["debugName"] = "Vanish",
								["name"] = "Vanish",
								["icon_id"] = 132331,
								["spell_id"] = 1856,
								["cooldown"] = 120,
							},
							["name"] = "Vanish",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Vanish",
										["name"] = "Vanish",
										["icon_id"] = 132331,
										["spell_id"] = 1856,
										["cooldown"] = 120,
									},
									["talent_choices"] = {
									},
									["minEnergy"] = 25,
									["hasMaxCooldownForExsanguinate"] = true,
									["primary"] = false,
									["priority"] = 625,
									["hasMinComboPoints"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["hasMaxCooldownForVanish"] = true,
									["minComboPoints"] = 6,
									["checkCooldownForVanish"] = true,
									["checkEnergy"] = true,
									["checkCooldownForExsanguinate"] = true,
								}, -- [1]
							},
						}, -- [3]
						{
							["spell"] = {
								["debugName"] = "Mutilate",
								["name"] = "Mutilate",
								["icon_id"] = 132304,
								["spell_id"] = 1329,
							},
							["name"] = "Mutilate",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Mutilate",
										["name"] = "Mutilate",
										["icon_id"] = 132304,
										["spell_id"] = 1329,
									},
									["talent_choices"] = {
									},
									["minEnergy"] = 55,
									["hasMaxDurationOfRupture"] = true,
									["primary"] = true,
									["maxDurationOfRupture"] = 6,
									["hasMaxComboPoints"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["checkDurationOfRupture"] = true,
									["maxComboPoints"] = 4,
									["checkEnergy"] = true,
									["priority"] = 400,
									["checkComboPoints"] = true,
									["poolEnergyIfLow"] = true,
								}, -- [1]
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Mutilate",
										["name"] = "Mutilate",
										["icon_id"] = 132304,
										["spell_id"] = 1329,
									},
									["minEnergy"] = 90,
									["checkEnergy"] = true,
									["primary"] = true,
									["hasMaxComboPoints"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["maxComboPoints"] = 5,
									["priority"] = 385,
									["talent_choices"] = {
									},
									["poolEnergyIfLow"] = true,
								}, -- [2]
							},
						}, -- [4]
						{
							["spell"] = {
								["debugName"] = "Garrote",
								["name"] = "Garrote",
								["icon_id"] = 132297,
								["spell_id"] = 703,
								["cooldown"] = 15,
							},
							["name"] = "Garrote",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Garrote",
										["name"] = "Garrote",
										["icon_id"] = 132297,
										["spell_id"] = 703,
										["cooldown"] = 15,
									},
									["minEnergy"] = 45,
									["checkEnergy"] = true,
									["primary"] = true,
									["checkCooldownForGarrote"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["hasMaxDurationOfGarrote"] = true,
									["talent_choices"] = {
									},
									["priority"] = 600,
									["checkDurationOfGarrote"] = true,
									["hasMaxCooldownForGarrote"] = true,
									["poolEnergyIfLow"] = true,
								}, -- [1]
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Garrote",
										["name"] = "Garrote",
										["icon_id"] = 132297,
										["spell_id"] = 703,
										["cooldown"] = 15,
									},
									["minEnergy"] = 45,
									["checkEnergy"] = true,
									["maxDurationOfGarrote"] = 6,
									["checkCooldownForGarrote"] = true,
									["primary"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
										{
											["enabled"] = true,
											["spell"] = {
												["debugName"] = "Garrote",
												["name"] = "Garrote",
												["icon_id"] = 132297,
												["spell_id"] = 703,
												["cooldown"] = 15,
											},
											["TimestampComparedToExsanguinate"] = {
												["debug_value"] = "used_after",
												["display_value"] = true,
												["display_name"] = "Used after",
											},
										}, -- [1]
									},
									["hasMaxDurationOfGarrote"] = true,
									["talent_choices"] = {
									},
									["priority"] = 550,
									["checkDurationOfGarrote"] = true,
									["hasMaxCooldownForGarrote"] = true,
									["poolEnergyIfLow"] = true,
								}, -- [2]
							},
						}, -- [5]
						{
							["spell"] = {
								["debugName"] = "Exsanguinate",
								["name"] = "Exsanguinate",
								["icon_id"] = 538040,
								["spell_id"] = 200806,
								["cooldown"] = 45,
							},
							["name"] = "Exsanguinate",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Exsanguinate",
										["name"] = "Exsanguinate",
										["icon_id"] = 538040,
										["spell_id"] = 200806,
										["cooldown"] = 45,
									},
									["checkTimeToKillSolo"] = true,
									["talent_choices"] = {
										{
											["enabled"] = true,
											["column"] = 3,
											["tier"] = 6,
											["inverted"] = false,
										}, -- [1]
									},
									["hasMaxCooldownForExsanguinate"] = true,
									["minCooldownForVanish"] = 10,
									["minTimeToKillSolo"] = 10,
									["hasMinCooldownForVanish"] = true,
									["hasMinDurationOfRupture"] = true,
									["cache_spells"] = {
									},
									["checkDurationOfRupture"] = true,
									["hasMinTimeToKillSolo"] = true,
									["primary"] = false,
									["priority"] = 605,
									["minDurationOfRupture"] = 24,
									["checkCooldownForExsanguinate"] = true,
								}, -- [1]
							},
						}, -- [6]
						{
							["spell"] = {
								["debugName"] = "Kingsbane",
								["name"] = "Kingsbane",
								["icon_id"] = 1259291,
								["spell_id"] = 192759,
								["cooldown"] = 45,
							},
							["name"] = "Kingsbane",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Kingsbane",
										["name"] = "Kingsbane",
										["icon_id"] = 1259291,
										["spell_id"] = 192759,
										["cooldown"] = 45,
									},
									["checkTimeToKillSolo"] = true,
									["minEnergy"] = 35,
									["checkEnergy"] = true,
									["primary"] = true,
									["hasMaxCooldownForKingsbane"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["checkCooldownForKingsbane"] = true,
									["hasMinTimeToKillSolo"] = true,
									["talent_choices"] = {
									},
									["priority"] = 525,
									["minTimeToKillSolo"] = 5,
									["poolEnergyIfLow"] = true,
								}, -- [1]
							},
						}, -- [7]
						{
							["spell"] = {
								["debugName"] = "Envenom",
								["name"] = "Envenom",
								["icon_id"] = 132287,
								["spell_id"] = 32645,
							},
							["name"] = "Envenom",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Envenom",
										["name"] = "Envenom",
										["icon_id"] = 132287,
										["spell_id"] = 32645,
									},
									["minEnergy"] = 35,
									["checkEnergy"] = true,
									["hasMinComboPoints"] = true,
									["hasMinEnergy"] = true,
									["cache_spells"] = {
									},
									["checkComboPoints"] = true,
									["primary"] = true,
									["minComboPoints"] = 6,
									["priority"] = 575,
									["talent_choices"] = {
									},
									["poolEnergyIfLow"] = true,
								}, -- [1]
							},
						}, -- [8]
						{
							["spell"] = {
								["debugName"] = "Stealth",
								["name"] = "Stealth",
								["icon_id"] = 132320,
								["spell_id"] = 1784,
							},
							["name"] = "Stealth",
							["suggestions"] = {
								{
									["require_not_stealthed"] = true,
									["cache_spells"] = {
									},
									["primary"] = true,
									["talent_choices"] = {
									},
									["spell"] = {
										["debugName"] = "Stealth",
										["name"] = "Stealth",
										["icon_id"] = 132320,
										["spell_id"] = 1784,
									},
									["require_no_combat"] = true,
									["priority"] = 800,
									["enabled"] = true,
								}, -- [1]
							},
						}, -- [9]
						{
							["spell"] = {
								["debugName"] = "CrimsonVial",
								["name"] = "Crimson Vial",
								["icon_id"] = 1373904,
								["spell_id"] = 185311,
								["cooldown"] = 30,
							},
							["name"] = "Crimson Vial",
							["suggestions"] = {
								{
									["cache_spells"] = {
									},
									["talent_choices"] = {
									},
									["priority"] = 490,
									["primary"] = true,
									["spell"] = {
										["debugName"] = "CrimsonVial",
										["name"] = "Crimson Vial",
										["icon_id"] = 1373904,
										["spell_id"] = 185311,
										["cooldown"] = 30,
									},
								}, -- [1]
							},
						}, -- [10]
						{
							["spell"] = {
								["debugName"] = "Rupture",
								["name"] = "Rupture",
								["icon_id"] = 132302,
								["spell_id"] = 1943,
							},
							["name"] = "Rupture",
							["suggestions"] = {
								{
									["talent_choices"] = {
									},
									["checkEnergy"] = true,
									["hasMinComboPoints"] = true,
									["hasMinEnergy"] = true,
									["checkDurationOfRupture"] = true,
									["priority"] = 700,
									["poolEnergyIfLow"] = true,
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Rupture",
										["name"] = "Rupture",
										["icon_id"] = 132302,
										["spell_id"] = 1943,
									},
									["checkTimeToKillSolo"] = true,
									["primary"] = true,
									["minTimeToKillSolo"] = 3,
									["cache_spells"] = {
										{
											["enabled"] = true,
											["spell"] = {
												["debugName"] = "Exsanguinate",
												["name"] = "Exsanguinate",
												["icon_id"] = 538040,
												["spell_id"] = 200806,
												["cooldown"] = 45,
											},
										}, -- [1]
									},
									["checkComboPoints"] = true,
									["minComboPoints"] = 2,
									["hasMinTimeToKillSolo"] = true,
									["minEnergy"] = 25,
									["hasMaxDurationOfRupture"] = true,
								}, -- [1]
								{
									["minEnergy"] = 25,
									["checkEnergy"] = true,
									["hasMinComboPoints"] = true,
									["maxDurationOfRupture"] = 6,
									["hasMinEnergy"] = true,
									["checkDurationOfRupture"] = true,
									["priority"] = 695,
									["poolEnergyIfLow"] = true,
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "Rupture",
										["name"] = "Rupture",
										["icon_id"] = 132302,
										["spell_id"] = 1943,
									},
									["checkTimeToKillSolo"] = true,
									["primary"] = true,
									["minTimeToKillSolo"] = 3,
									["cache_spells"] = {
										{
											["hasMinDurationOfRupture"] = true,
											["spell"] = {
												["debugName"] = "Exsanguinate",
												["name"] = "Exsanguinate",
												["icon_id"] = 538040,
												["spell_id"] = 200806,
												["cooldown"] = 45,
											},
											["checkDurationOfRupture"] = true,
										}, -- [1]
										{
											["enabled"] = true,
											["spell"] = {
												["debugName"] = "Rupture",
												["name"] = "Rupture",
												["icon_id"] = 132302,
												["spell_id"] = 1943,
												["cooldown"] = 1,
											},
											["TimestampComparedToExsanguinate"] = {
												["debug_value"] = "used_after",
												["display_value"] = true,
												["display_name"] = "Used after",
											},
										}, -- [2]
									},
									["checkComboPoints"] = true,
									["minComboPoints"] = 6,
									["hasMinTimeToKillSolo"] = true,
									["talent_choices"] = {
									},
									["hasMaxDurationOfRupture"] = true,
								}, -- [2]
							},
						}, -- [11]
						{
							["spell"] = {
								["debugName"] = "AgonizingPoison",
								["name"] = "Agonizing Poison",
								["icon_id"] = 134711,
								["spell_id"] = 200802,
							},
							["name"] = "Agonizing Poison",
							["suggestions"] = {
								{
									["enabled"] = true,
									["spell"] = {
										["debugName"] = "AgonizingPoison",
										["name"] = "Agonizing Poison",
										["icon_id"] = 134711,
										["spell_id"] = 200802,
									},
									["talent_choices"] = {
										{
											["enabled"] = true,
											["column"] = 1,
											["tier"] = 6,
											["inverted"] = false,
										}, -- [1]
									},
									["require_no_combat"] = true,
									["hasMaxDurationOfAgonizingPoison"] = true,
									["cache_spells"] = {
									},
									["checkDurationOfAgonizingPoison"] = true,
									["priority"] = 910,
									["maxDurationOfAgonizingPoison"] = 600,
									["primary"] = true,
								}, -- [1]
								{
									["hasMaxDurationOfAgonizingPoison"] = true,
									["cache_spells"] = {
									},
									["checkDurationOfAgonizingPoison"] = true,
									["talent_choices"] = {
										{
											["enabled"] = true,
											["column"] = 1,
											["tier"] = 6,
											["inverted"] = false,
										}, -- [1]
									},
									["primary"] = true,
									["priority"] = 905,
									["spell"] = {
										["debugName"] = "AgonizingPoison",
										["name"] = "Agonizing Poison",
										["icon_id"] = 134711,
										["spell_id"] = 200802,
									},
									["enabled"] = true,
								}, -- [2]
							},
						}, -- [12]
					},
					["advanced_features"] = true,
					["auras"] = {
						{
							["is_stealthy"] = true,
							["debugName"] = "Stealth2",
							["name"] = "Stealth 2",
							["icon_id"] = 132320,
							["target"] = "player",
							["max_duration"] = 1,
							["hidden"] = true,
							["aura_id"] = 115191,
						}, -- [1]
						{
							["is_stealthy"] = true,
							["debugName"] = "Subterfuge",
							["name"] = "Subterfuge",
							["icon_id"] = 132320,
							["target"] = "player",
							["max_duration"] = 1,
							["hidden"] = true,
							["aura_id"] = 115192,
						}, -- [2]
						{
							["is_stealthy"] = true,
							["debugName"] = "Vanish",
							["name"] = "Vanish",
							["icon_id"] = "Interface\\Icons\\Ability_Vanish",
							["target"] = "player",
							["max_duration"] = 3.9,
							["hidden"] = true,
							["aura_id"] = 11327,
						}, -- [3]
						{
							["is_stealthy"] = true,
							["debugName"] = "Vanish2",
							["name"] = "Vanish 2",
							["icon_id"] = "Interface\\Icons\\Ability_Vanish",
							["target"] = "player",
							["max_duration"] = 3.9,
							["hidden"] = true,
							["aura_id"] = 11329,
						}, -- [4]
						{
							["is_stealthy"] = true,
							["debugName"] = "Vanish3",
							["name"] = "Vanish 3",
							["icon_id"] = "Interface\\Icons\\Ability_Vanish",
							["target"] = "player",
							["max_duration"] = 3.9,
							["hidden"] = true,
							["aura_id"] = 115193,
						}, -- [5]
						{
							["is_stealthy"] = false,
							["debugName"] = "DeadlyPoison",
							["name"] = "Deadly Poison",
							["icon_id"] = "Interface\\Icons\\Ability_Rogue_DualWeild",
							["target"] = "player",
							["max_duration"] = 4680,
							["hidden"] = false,
							["aura_id"] = 2823,
						}, -- [6]
						{
							["is_stealthy"] = true,
							["debugName"] = "Stealth",
							["name"] = "Stealth",
							["icon_id"] = "Interface\\Icons\\Ability_Stealth",
							["target"] = "player",
							["max_duration"] = 1,
							["hidden"] = true,
							["aura_id"] = 1784,
						}, -- [7]
						{
							["is_stealthy"] = false,
							["debugName"] = "Rupture",
							["name"] = "Rupture",
							["icon_id"] = "Interface\\Icons\\Ability_Rogue_Rupture",
							["target"] = "target",
							["max_duration"] = 26,
							["hidden"] = false,
							["aura_id"] = 1943,
						}, -- [8]
						{
							["is_stealthy"] = false,
							["debugName"] = "Garrote",
							["name"] = "Garrote",
							["icon_id"] = "Interface\\Icons\\Ability_Rogue_Garrote",
							["target"] = "target",
							["max_duration"] = 23.4,
							["hidden"] = false,
							["aura_id"] = 703,
						}, -- [9]
						{
							["is_stealthy"] = false,
							["debugName"] = "AgonizingPoison",
							["name"] = "Agonizing Poison",
							["icon_id"] = "Interface\\Icons\\INV_Poison_MindNumbing",
							["target"] = "player",
							["max_duration"] = 3600,
							["hidden"] = false,
							["aura_id"] = 200802,
						}, -- [10]
					},
				}, -- [2]
			},
			["name"] = "Default",
		}, -- [1]
	},
}

for k,v in pairs(config) do
  TorpedoDefaultConfig[k] = v
end