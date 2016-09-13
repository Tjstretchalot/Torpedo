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
						{
							["debugName"] = "CrimsonVial",
							["name"] = "Crimson Vial",
							["icon_id"] = 1373904,
							["spell_id"] = 185311,
							["cooldown"] = 30,
						}, -- [6]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
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
										{
											["debugName"] = "CrimsonVial",
											["name"] = "Crimson Vial",
											["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
											["target"] = "player",
											["max_duration"] = 7.8,
											["aura_id"] = 185311,
										}, -- [13]
									},
									["hasMinEnergy"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["checkChargesForShadowDance"] = false,
									["minHealthPerc"] = 0,
									["checkComboPoints"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["maxCooldownForGoremawsBite"] = 0,
									["hasMinCooldownForShadowBlades"] = false,
									["minDurationOfShadowBlades"] = 0,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["hasMinComboPoints"] = false,
									["checkDurationOfSubterfuge"] = false,
									["hasMinCooldownForVanish"] = false,
									["minCooldownForCrimsonVial"] = 0,
									["checkDurationOfVanish3"] = false,
									["require_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["spell"] = {
										["debugName"] = "Stealth",
										["name"] = "Stealth",
										["icon_id"] = 132320,
										["spell_id"] = 115191,
										["cooldown"] = 2,
									},
									["maxDurationOfStealth2"] = 0,
									["maxCooldownForShadowDance"] = 0,
									["enabled"] = true,
									["hasMaxCooldownForShadowDance"] = false,
									["require_not_stealthed"] = true,
									["priority"] = 500,
									["primary"] = true,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["maxDurationOfShadowDance"] = 0,
									["maxDurationOfShadowBlades"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["hasMinHealthPerc"] = false,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["checkDurationOfStealth2"] = false,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfShadowDance"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["minDurationOfCrimsonVial"] = 0,
									["checkCooldownForShadowDance"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["hasMinChargesForShadowDance"] = false,
									["maxDurationOfVanish2"] = 0,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["maxHealthPerc"] = 0,
									["require_no_combat"] = true,
									["hasMinDurationOfGoremawsBite"] = false,
									["hasMaxEnergy"] = false,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish1"] = 0,
									["minCooldownForShadowDance"] = 0,
									["checkHealthPerc"] = false,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxDurationOfStealth1"] = false,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["minDurationOfVanish2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = true,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = true,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 35,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = true,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "SymbolsOfDeath",
										["name"] = "Symbols of Death",
										["icon_id"] = 252272,
										["spell_id"] = 212283,
										["cooldown"] = 45,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 10,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 499,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = true,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = true,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = true,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 40,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = true,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "Shadowstrike",
										["name"] = "Shadowstrike",
										["icon_id"] = 1373912,
										["spell_id"] = 185439,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 495,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = true,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = true,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 5,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = true,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = true,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 25,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "Nightblade",
										["name"] = "Nightblade",
										["icon_id"] = 1373907,
										["spell_id"] = 195452,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 498,
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
									},
									["hasMaxDurationOfNightblade"] = true,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = true,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 4.8,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = true,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = true,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 5,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = true,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = true,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 35,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "Eviscerate",
										["name"] = "Eviscerate",
										["icon_id"] = 132292,
										["spell_id"] = 196819,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 497,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = true,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = true,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 35,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "Backstab",
										["name"] = "Backstab",
										["icon_id"] = 132090,
										["spell_id"] = 53,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 494,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = true,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = false,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = true,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 110,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = true,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = true,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "Vanish",
										["name"] = "Vanish",
										["icon_id"] = 132331,
										["spell_id"] = 1856,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 492,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = true,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = false,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = false,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 120,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = true,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 80,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 2,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = true,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "ShadowDance",
										["name"] = "Shadow Dance",
										["icon_id"] = 236279,
										["spell_id"] = 185313,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 491,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = true,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = true,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = true,
									["poolEnergyIfLow"] = true,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
								}, -- [1]
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = false,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = false,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 130,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = true,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = true,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 1,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = true,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "ShadowDance",
										["name"] = "Shadow Dance",
										["icon_id"] = 236279,
										["spell_id"] = 185313,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 10,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 490,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = true,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = true,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = true,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = false,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = true,
									["checkEnergy"] = false,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 0,
									["checkCooldownForGoremawsBite"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = false,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "ShadowBlades",
										["name"] = "Shadow Blades",
										["icon_id"] = 376022,
										["spell_id"] = 121471,
										["cooldown"] = 180,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 488,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = false,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = false,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = true,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = 1373904,
									["spell_id"] = 185311,
									["cooldown"] = 30,
								}, -- [6]
							},
							["suggestions"] = {
								{
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["hasMinDurationOfVanish1"] = false,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = true,
									["minDurationOfVanish1"] = 0,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["maxComboPoints"] = 2,
									["checkCooldownForGoremawsBite"] = true,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["enabled"] = true,
									["primary"] = true,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["maxEnergy"] = 140,
									["checkCooldownForCrimsonVial"] = false,
									["checkChargesForShadowDance"] = false,
									["minDurationOfCrimsonVial"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = true,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["hasMinComboPoints"] = false,
									["hasMinDurationOfNightblade"] = false,
									["minEnergy"] = 0,
									["minCooldownForSymbolsOfDeath"] = 0,
									["minChargesForShadowDance"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["minHealthPerc"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["hasMaxDurationOfStealth1"] = false,
									["require_not_stealthed"] = false,
									["minDurationOfSymbolsOfDeath"] = 0,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["require_stealthed"] = false,
									["maxDurationOfStealth2"] = 0,
									["spell"] = {
										["debugName"] = "GoremawsBite",
										["name"] = "Goremaw's Bite",
										["icon_id"] = 1120132,
										["spell_id"] = 209782,
										["cooldown"] = 60,
									},
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMaxHealthPerc"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = true,
									["priority"] = 496,
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
									},
									["hasMaxDurationOfNightblade"] = false,
									["minDurationOfShadowBlades"] = 0,
									["maxCooldownForVanish"] = 0,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["hasMinHealthPerc"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMinDurationOfCrimsonVial"] = false,
									["checkDurationOfNightblade"] = false,
									["checkHealthPerc"] = false,
									["checkDurationOfGoremawsBite"] = false,
									["minCooldownForShadowBlades"] = 0,
									["checkCooldownForShadowDance"] = false,
									["maxDurationOfSubterfuge"] = 0,
									["maxDurationOfVanish2"] = 0,
									["hasMaxEnergy"] = true,
									["hasMinDurationOfShadowBlades"] = false,
									["maxDurationOfNightblade"] = 0,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["minDurationOfNightblade"] = 0,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMinCooldownForShadowDance"] = false,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfVanish3"] = 0,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = true,
									["hasMaxDurationOfVanish3"] = false,
									["maxHealthPerc"] = 0,
									["maxDurationOfVanish1"] = 0,
									["hasMinDurationOfGoremawsBite"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForCrimsonVial"] = false,
									["checkDurationOfShadowBlades"] = false,
									["minDurationOfStealth2"] = 0,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["hasMaxDurationOfStealth2"] = false,
									["minDurationOfSubterfuge"] = 0,
									["checkDurationOfShadowDanceOld"] = false,
									["minCooldownForShadowDance"] = 0,
									["minDurationOfGoremawsBite"] = 0,
									["checkDurationOfVanish1"] = false,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["minDurationOfShadowDance"] = 0,
									["hasMinEnergy"] = false,
									["poolEnergyIfLow"] = false,
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["checkDurationOfSubterfuge"] = false,
									["hasMaxChargesForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["maxDurationOfGoremawsBite"] = 0,
									["maxDurationOfShadowDance"] = 0,
									["hasMinCooldownForVanish"] = false,
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
									},
									["checkDurationOfStealth1"] = false,
									["minDurationOfVanish2"] = 0,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
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
							},
							["suggestions"] = {
								{
									["checkDurationOfVanish1"] = false,
									["minDurationOfNightblade"] = 0,
									["checkCooldownForShadowBlades"] = false,
									["checkEnergy"] = false,
									["hasMinHealthPerc"] = false,
									["hasMaxDurationOfVanish1"] = false,
									["checkDurationOfShadowDance"] = false,
									["maxDurationOfShadowBlades"] = 0,
									["maxComboPoints"] = 0,
									["hasMinDurationOfShadowDanceOld"] = false,
									["maxDurationOfShadowDanceOld"] = 0,
									["hasMaxDurationOfShadowDance"] = false,
									["require_not_stealthed"] = false,
									["hasMaxHealthPerc"] = true,
									["minCooldownForCrimsonVial"] = 0,
									["hasMaxCooldownForVanish"] = false,
									["maxChargesForShadowDance"] = 0,
									["minCooldownForVanish"] = 0,
									["maxCooldownForShadowBlades"] = 0,
									["minDurationOfShadowDance"] = 0,
									["checkCooldownForCrimsonVial"] = false,
									["minDurationOfVanish2"] = 0,
									["minEnergy"] = 0,
									["checkChargesForShadowDance"] = false,
									["minComboPoints"] = 0,
									["checkCooldownForVanish"] = false,
									["checkComboPoints"] = false,
									["checkDurationOfVanish3"] = false,
									["hasMinCooldownForShadowBlades"] = false,
									["minHealthPerc"] = 65,
									["hasMinDurationOfNightblade"] = false,
									["hasMinCooldownForSymbolsOfDeath"] = false,
									["maxDurationOfSymbolsOfDeath"] = 0,
									["hasMinComboPoints"] = false,
									["hasMaxDurationOfCrimsonVial"] = false,
									["hasMinCooldownForVanish"] = false,
									["hasMaxDurationOfShadowBlades"] = false,
									["hasMinEnergy"] = false,
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
									},
									["minDurationOfSymbolsOfDeath"] = 0,
									["maxEnergy"] = 0,
									["maxCooldownForCrimsonVial"] = 0,
									["minDurationOfVanish1"] = 0,
									["maxCooldownForGoremawsBite"] = 0,
									["spell"] = {
										["debugName"] = "CrimsonVial",
										["name"] = "Crimson Vial",
										["icon_id"] = 1373904,
										["spell_id"] = 185311,
										["cooldown"] = 30,
									},
									["minCooldownForGoremawsBite"] = 0,
									["hasMaxCooldownForShadowDance"] = false,
									["hasMaxDurationOfNightblade"] = false,
									["checkDurationOfShadowDanceOld"] = false,
									["primary"] = false,
									["maxCooldownForSymbolsOfDeath"] = 0,
									["hasMaxComboPoints"] = false,
									["priority"] = 550,
									["maxDurationOfVanish1"] = 0,
									["checkDurationOfGoremawsBite"] = false,
									["minDurationOfShadowBlades"] = 0,
									["hasMinDurationOfStealth2"] = false,
									["checkDurationOfCrimsonVial"] = false,
									["hasMinDurationOfStealth1"] = false,
									["checkHealthPerc"] = true,
									["hasMinDurationOfCrimsonVial"] = false,
									["hasMinDurationOfVanish3"] = false,
									["hasMaxDurationOfSubterfuge"] = false,
									["checkDurationOfNightblade"] = false,
									["minDurationOfGoremawsBite"] = 0,
									["minDurationOfCrimsonVial"] = 0,
									["minDurationOfSubterfuge"] = 0,
									["hasMaxDurationOfStealth2"] = false,
									["hasMinDurationOfVanish1"] = false,
									["maxDurationOfVanish2"] = 0,
									["hasMinChargesForShadowDance"] = false,
									["minDurationOfStealth2"] = 0,
									["checkDurationOfShadowBlades"] = false,
									["checkDurationOfVanish2"] = false,
									["hasMinCooldownForCrimsonVial"] = false,
									["checkDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForSymbolsOfDeath"] = false,
									["hasMaxDurationOfShadowDanceOld"] = false,
									["hasMaxEnergy"] = false,
									["minDurationOfStealth1"] = 0,
									["maxCooldownForVanish"] = 0,
									["hasMinCooldownForShadowDance"] = false,
									["hasMaxDurationOfGoremawsBite"] = false,
									["hasMaxDurationOfVanish3"] = false,
									["hasMaxDurationOfVanish2"] = false,
									["hasMaxCooldownForGoremawsBite"] = false,
									["minDurationOfVanish3"] = 0,
									["maxHealthPerc"] = 70,
									["checkDurationOfSubterfuge"] = false,
									["hasMinDurationOfGoremawsBite"] = false,
									["checkDurationOfStealth2"] = false,
									["hasMaxCooldownForCrimsonVial"] = false,
									["maxDurationOfNightblade"] = 0,
									["hasMinDurationOfShadowBlades"] = false,
									["hasMinDurationOfVanish2"] = false,
									["hasMinDurationOfSymbolsOfDeath"] = false,
									["checkCooldownForShadowDance"] = false,
									["minCooldownForShadowBlades"] = 0,
									["maxDurationOfSubterfuge"] = 0,
									["minCooldownForShadowDance"] = 0,
									["hasMaxDurationOfStealth1"] = false,
									["minChargesForShadowDance"] = 0,
									["maxDurationOfVanish3"] = 0,
									["hasMinDurationOfSubterfuge"] = false,
									["hasMinDurationOfShadowDance"] = false,
									["maxDurationOfStealth1"] = 0,
									["hasMaxCooldownForSymbolsOfDeath"] = false,
									["poolEnergyIfLow"] = false,
									["maxCooldownForShadowDance"] = 0,
									["hasMaxCooldownForShadowBlades"] = false,
									["require_stealthed"] = false,
									["minDurationOfShadowDanceOld"] = 0,
									["hasMinCooldownForGoremawsBite"] = false,
									["maxDurationOfCrimsonVial"] = 0,
									["maxDurationOfStealth2"] = 0,
									["hasMaxChargesForShadowDance"] = false,
									["minCooldownForSymbolsOfDeath"] = 0,
									["maxDurationOfGoremawsBite"] = 0,
									["hasMaxDurationOfSymbolsOfDeath"] = false,
									["maxDurationOfShadowDance"] = 0,
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
									},
									["checkDurationOfStealth1"] = false,
									["enabled"] = true,
									["checkCooldownForGoremawsBite"] = false,
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
								{
									["debugName"] = "CrimsonVial",
									["name"] = "Crimson Vial",
									["icon_id"] = "Interface\\Icons\\ability_rogue_crimsonvial",
									["target"] = "player",
									["max_duration"] = 7.8,
									["aura_id"] = 185311,
								}, -- [13]
							},
						}, -- [11]
					},
					["advanced_features"] = false,
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
					},
				}, -- [1]
			},
		}, -- [1]
	},
}

for k,v in pairs(config) do
  TorpedoDefaultConfig[k] = v
end