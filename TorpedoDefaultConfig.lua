local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')

local MAJOR, MINOR = 'TorpedoDefaultConfig-1.0', 1
local TorpedoDefaultConfig = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoDefaultConfig then return end

local config = {
	["default_profile"] = {
		["name"] = "Default",
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
						["suggestions"] = {
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
						["spell"] = {
							["debugName"] = "SymbolsOfDeath",
							["name"] = "Symbols of Death",
							["icon_id"] = 252272,
							["spell_id"] = 212283,
							["cooldown"] = 45,
						},
						["name"] = "Symbols of Death",
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
						["suggestions"] = {
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
					}, -- [2]
					{
						["spell"] = {
							["debugName"] = "Shadowstrike",
							["name"] = "Shadowstrike",
							["icon_id"] = 1373912,
							["spell_id"] = 185439,
						},
						["name"] = "Shadowstrike",
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
						["suggestions"] = {
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
					}, -- [3]
					{
						["spell"] = {
							["debugName"] = "Nightblade",
							["name"] = "Nightblade",
							["icon_id"] = 1373907,
							["spell_id"] = 195452,
						},
						["name"] = "Nightblade",
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
						["suggestions"] = {
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
					}, -- [4]
					{
						["spell"] = {
							["debugName"] = "Eviscerate",
							["name"] = "Eviscerate",
							["icon_id"] = 132292,
							["spell_id"] = 196819,
						},
						["name"] = "Eviscerate",
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
						["suggestions"] = {
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
					}, -- [5]
					{
						["spell"] = {
							["debugName"] = "Backstab",
							["name"] = "Backstab",
							["icon_id"] = 132090,
							["spell_id"] = 53,
						},
						["name"] = "Backstab",
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
						["suggestions"] = {
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
					}, -- [6]
					{
						["spell"] = {
							["debugName"] = "Vanish",
							["name"] = "Vanish",
							["icon_id"] = 132331,
							["spell_id"] = 1856,
						},
						["name"] = "Vanish",
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
						["suggestions"] = {
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
					}, -- [7]
					{
						["spell"] = {
							["debugName"] = "ShadowDance",
							["name"] = "Shadow Dance",
							["icon_id"] = 236279,
							["spell_id"] = 185313,
						},
						["name"] = "Shadow Dance",
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
						["suggestions"] = {
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
						["suggestions"] = {
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
						["suggestions"] = {
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
					}, -- [10]
					{
						["spell"] = {
							["debugName"] = "Gloomblade",
							["name"] = "Gloomblade",
							["icon_id"] = 132292,
							["spell_id"] = 200758,
						},
						["name"] = "Gloomblade",
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
						["suggestions"] = {
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
		},
	},
	["active_spec_id"] = 261,
	["active_profile_index"] = 1,
	["profiles"] = {
		{
			["name"] = "Default",
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
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = false,
									["minDurationOfVanish1"] = 0,
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
									["hasMinEnergy"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkChargesForShadowDance"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["minChargesForShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfStealth2"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["checkComboPoints"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["hasMinComboPoints"] = false,
									["minDurationOfShadowBlades"] = 0,
									["checkDurationOfVanish3"] = false,
									["minDurationOfVanish2"] = 0,
									["checkDurationOfStealth2"] = false,
									["hasMinDurationOfStealth1"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["maxDurationOfShadowBlades"] = 0,
									["checkDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["maxCooldownForVanish"] = 0,
									["spell"] = {
										["debugName"] = "Stealth",
										["name"] = "Stealth",
										["icon_id"] = 132320,
										["spell_id"] = 115191,
										["cooldown"] = 2,
									},
									["maxCooldownForShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["enabled"] = true,
									["priority"] = 500,
									["hasMaxEnergy"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["checkDurationOfVanish1"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMinDurationOfVanish1"] = false,
									["hasMinChargesForShadowDance"] = false,
									["require_no_combat"] = true,
									["checkDurationOfVanish2"] = false,
									["minCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfNightblade"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["minCooldownForShadowDance"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinDurationOfVanish3"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["require_not_stealthed"] = true,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["minEnergy"] = 0,
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
									["checkDurationOfStealth1"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
							["spell"] = {
								["debugName"] = "SymbolsOfDeath",
								["name"] = "Symbols of Death",
								["icon_id"] = 252272,
								["spell_id"] = 212283,
								["cooldown"] = 45,
							},
							["name"] = "Symbols of Death",
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = true,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 35,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = true,
									["checkComboPoints"] = false,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 10,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "SymbolsOfDeath",
										["name"] = "Symbols of Death",
										["icon_id"] = 252272,
										["spell_id"] = 212283,
										["cooldown"] = 45,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 499,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = false,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = true,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = true,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
						}, -- [2]
						{
							["spell"] = {
								["debugName"] = "Shadowstrike",
								["name"] = "Shadowstrike",
								["icon_id"] = 1373912,
								["spell_id"] = 185439,
							},
							["name"] = "Shadowstrike",
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = true,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 40,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "Shadowstrike",
										["name"] = "Shadowstrike",
										["icon_id"] = 1373912,
										["spell_id"] = 185439,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 495,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = false,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = true,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
						}, -- [3]
						{
							["spell"] = {
								["debugName"] = "Nightblade",
								["name"] = "Nightblade",
								["icon_id"] = 1373907,
								["spell_id"] = 195452,
							},
							["name"] = "Nightblade",
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = true,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 5,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 25,
									["hasMinComboPoints"] = true,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = true,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = true,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = true,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "Nightblade",
										["name"] = "Nightblade",
										["icon_id"] = 1373907,
										["spell_id"] = 195452,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 498,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = false,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 4.8,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
						}, -- [4]
						{
							["spell"] = {
								["debugName"] = "Eviscerate",
								["name"] = "Eviscerate",
								["icon_id"] = 132292,
								["spell_id"] = 196819,
							},
							["name"] = "Eviscerate",
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = true,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 5,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 35,
									["hasMinComboPoints"] = true,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = true,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "Eviscerate",
										["name"] = "Eviscerate",
										["icon_id"] = 132292,
										["spell_id"] = 196819,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 497,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = false,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
						}, -- [5]
						{
							["spell"] = {
								["debugName"] = "Backstab",
								["name"] = "Backstab",
								["icon_id"] = 132090,
								["spell_id"] = 53,
							},
							["name"] = "Backstab",
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = true,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 35,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "Backstab",
										["name"] = "Backstab",
										["icon_id"] = 132090,
										["spell_id"] = 53,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 494,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = false,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
						}, -- [6]
						{
							["spell"] = {
								["debugName"] = "Vanish",
								["name"] = "Vanish",
								["icon_id"] = 132331,
								["spell_id"] = 1856,
							},
							["name"] = "Vanish",
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = true,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = true,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = true,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 120,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "Vanish",
										["name"] = "Vanish",
										["icon_id"] = 132331,
										["spell_id"] = 1856,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 492,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = true,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
						}, -- [7]
						{
							["spell"] = {
								["debugName"] = "ShadowDance",
								["name"] = "Shadow Dance",
								["icon_id"] = 236279,
								["spell_id"] = 185313,
							},
							["name"] = "Shadow Dance",
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = true,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = true,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 80,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 120,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = true,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "ShadowDance",
										["name"] = "Shadow Dance",
										["icon_id"] = 236279,
										["spell_id"] = 185313,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 491,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = true,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = true,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 2,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = true,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 130,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = true,
									["checkComboPoints"] = false,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 10,
									["checkChargesForShadowDance"] = true,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "ShadowDance",
										["name"] = "Shadow Dance",
										["icon_id"] = 236279,
										["spell_id"] = 185313,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 490,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = true,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = true,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = true,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 1,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [2]
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = true,
									["checkEnergy"] = false,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "ShadowBlades",
										["name"] = "Shadow Blades",
										["icon_id"] = 376022,
										["spell_id"] = 121471,
										["cooldown"] = 180,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 488,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = false,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = true,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinEnergy"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 2,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["checkDurationOfSubterfuge"] = false,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkDurationOfVanish3"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["hasMinComboPoints"] = false,
									["hasMinCooldownForVanish"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 140,
									["maxCooldownForGoremawsBite"] = 0,
									["checkCooldownForGoremawsBite"] = true,
									["hasMaxDurationOfStealth1"] = false,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = true,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["checkComboPoints"] = true,
									["checkDurationOfStealth2"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxDurationOfStealth1"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfStealth1"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["checkChargesForShadowDance"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["checkDurationOfNightblade"] = false,
									["maxDurationOfVanish1"] = 0,
									["maxCooldownForVanish"] = 0,
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
									["spell"] = {
										["debugName"] = "GoremawsBite",
										["name"] = "Goremaw's Bite",
										["icon_id"] = 1120132,
										["spell_id"] = 209782,
										["cooldown"] = 60,
									},
									["maxCooldownForShadowDance"] = 0,
									["maxDurationOfVanish2"] = 0,
									["checkDurationOfShadowDance"] = false,
									["enabled"] = true,
									["priority"] = 496,
									["maxDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfVanish3"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxEnergy"] = true,
									["maxDurationOfShadowDance"] = 0,
									["minDurationOfShadowDance"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["maxDurationOfStealth2"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = true,
									["minDurationOfVanish3"] = 0,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfNightblade"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["minDurationOfNightblade"] = 0,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxChargesForShadowDance"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["checkDurationOfGoremawsBite"] = false,
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
									["checkDurationOfStealth1"] = false,
									["minDurationOfStealth1"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
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
						}, -- [10]
						{
							["spell"] = {
								["debugName"] = "Gloomblade",
								["name"] = "Gloomblade",
								["icon_id"] = 132292,
								["spell_id"] = 200758,
							},
							["name"] = "Gloomblade",
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
							["suggestions"] = {
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
			},
		}, -- [1]
	},
}

for k,v in pairs(config) do
  TorpedoDefaultConfig[k] = v
end