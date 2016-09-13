local MAJOR, MINOR = 'TorpedoConstants-1.0', 1
local TorpedoConstants = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoConstants then return end

TorpedoConstants.ENABLE_DESC = 'Allow this option to be considered'
TorpedoConstants.PRIMARY_DESC = 'Is this a primary suggestion or secondary suggestion?'

TorpedoConstants.PRIORITY_DEFAULT = 500
TorpedoConstants.PRIORITY_DESC = 'Options are evaluated from highest priority to lowest priority, until either there are no more options left or an option meets its requirement'
TorpedoConstants.PRIORITY_MIN = 0
TorpedoConstants.PRIORITY_MAX = 2000
TorpedoConstants.PRIORITY_SOFTMIN = 0
TorpedoConstants.PRIORITY_SOFTMAX = 1000
TorpedoConstants.PRIORITY_STEP = 1
TorpedoConstants.PRIORITY_BIGSTEP = 1

TorpedoConstants.REQUIRE_STEALTHED_DESC = 'Do we need to be able to use abilities that require stealth for this suggestion?'
TorpedoConstants.REQUIRE_NOT_STEALTHED_DESC = 'Do we need to not be able to use abilities that require stealth for this suggestion?'

TorpedoConstants.REQUIRE_COMBAT_DESC = 'Do we need to be in combat for this suggestion?'
TorpedoConstants.REQUIRE_NOT_COMBAT_DESC = 'Do we need to not be in combat for this suggestion?'

TorpedoConstants.ENERGY_MIN = 0
TorpedoConstants.ENERGY_MAX = 160
TorpedoConstants.ENERGY_SOFTMIN = 0
TorpedoConstants.ENERGY_SOFTMAX = 160
TorpedoConstants.ENERGY_STEP = 1
TorpedoConstants.ENERGY_BIGSTEP = 1
TorpedoConstants.ENERGY_CHECK_DESC = 'Check how much energy we have'
TorpedoConstants.ENERGY_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain amount of energy'
TorpedoConstants.ENERGY_MINIMUM_DESC = 'Minimum amount of energy required'
TorpedoConstants.ENERGY_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain amount of energy'
TorpedoConstants.ENERGY_MAXIMUM_DESC = 'Maximum amount of energy'
TorpedoConstants.ENERGY_POOL_DESC = 'Show the icon with a blue overlay if the only restriction is we don\'t have enough energy'

TorpedoConstants.COMBO_POINTS_MIN = 0
TorpedoConstants.COMBO_POINTS_MAX = 6
TorpedoConstants.COMBO_POINTS_SOFTMIN = 0
TorpedoConstants.COMBO_POINTS_SOFTMAX = 6
TorpedoConstants.COMBO_POINTS_STEP = 1
TorpedoConstants.COMBO_POINTS_BIGSTEP = 1
TorpedoConstants.COMBO_POINTS_CHECK_DESC = 'Check how much combo points we have'
TorpedoConstants.COMBO_POINTS_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain amount of combo points'
TorpedoConstants.COMBO_POINTS_MINIMUM_DESC = 'Minimum amount of combo points required'
TorpedoConstants.COMBO_POINTS_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain amount of combo points'
TorpedoConstants.COMBO_POINTS_MAXIMUM_DESC = 'Maximum amount of combo points'

TorpedoConstants.HEALTH_PERC_MIN = 0
TorpedoConstants.HEALTH_PERC_MAX = 100
TorpedoConstants.HEALTH_PERC_SOFTMIN = 0
TorpedoConstants.HEALTH_PERC_SOFTMAX = 100
TorpedoConstants.HEALTH_PERC_STEP = 0.01
TorpedoConstants.HEALTH_PERC_BIGSTEP = 1
TorpedoConstants.HEALTH_PERC_CHECK_DESC = 'Check how much health percentage we have'
TorpedoConstants.HEALTH_PERC_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain amount of health percentage'
TorpedoConstants.HEALTH_PERC_MINIMUM_DESC = 'Minimum amount of health percentage required'
TorpedoConstants.HEALTH_PERC_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain amount of health percentage'
TorpedoConstants.HEALTH_PERC_MAXIMUM_DESC = 'Maximum amount of health percentage'

TorpedoConstants.SPELL_COOLDOWN_MIN = 0
TorpedoConstants.SPELL_COOLDOWN_SOFTMIN = 0
TorpedoConstants.SPELL_COOLDOWN_STEP = 0.05
TorpedoConstants.SPELL_COOLDOWN_BIGSTEP = 1
TorpedoConstants.SPELL_COOLDOWN_CHECK_DESC = 'Check how much time is left on {spell_name}\'s cooldown'
TorpedoConstants.SPELL_COOLDOWN_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain amount of time remaining on {spell_name}\'s cooldown'
TorpedoConstants.SPELL_COOLDOWN_MINIMUM_DESC = 'Minimum amount of time remaining on {spell_name}\'s cooldown required'
TorpedoConstants.SPELL_COOLDOWN_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain amount of time remaining on {spell_name}\'s cooldown'
TorpedoConstants.SPELL_COOLDOWN_MAXIMUM_DESC = 'Maximum amount of time remaining on {spell_name}\'s cooldown'

TorpedoConstants.SPELL_CHARGES_MIN = 0
TorpedoConstants.SPELL_CHARGES_SOFTMIN = 0
TorpedoConstants.SPELL_CHARGES_STEP = 1
TorpedoConstants.SPELL_CHARGES_BIGSTEP = 1
TorpedoConstants.SPELL_CHARGES_CHECK_DESC = 'Check how much charges are ready for {spell_name}'
TorpedoConstants.SPELL_CHARGES_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain number of charges for {spell_name}'
TorpedoConstants.SPELL_CHARGES_MINIMUM_DESC = 'Minimum number of charges for {spell_name} required'
TorpedoConstants.SPELL_CHARGES_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain number of charges for {spell_name}'
TorpedoConstants.SPELL_CHARGES_MAXIMUM_DESC = 'Maximum number of charges for {spell_name}'

TorpedoConstants.AURA_DURATION_MIN = 0
TorpedoConstants.AURA_DURATION_SOFTMIN = 0
TorpedoConstants.AURA_DURATION_STEP = 0.05
TorpedoConstants.AURA_DURATION_BIGSTEP = 1
TorpedoConstants.AURA_DURATION_CHECK_DESC = 'Check how much time is left on {aura_name}\'s duration'
TorpedoConstants.AURA_DURATION_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain amount of time remaining on {aura_name}\'s duration'
TorpedoConstants.AURA_DURATION_MINIMUM_DESC = 'Minimum amount of time remaining on {aura_name}\'s duration required'
TorpedoConstants.AURA_DURATION_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain amount of time remaining on {aura_name}\'s duration'
TorpedoConstants.AURA_DURATION_MAXIMUM_DESC = 'Maximum amount of time remaining on {aura_name}\'s duration'

TorpedoConstants.ADD_NEW_SUGGESTION_NAME = 'Add suggestion'
TorpedoConstants.ADD_NEW_SUGGESTION_DESC = 'Add a new suggestion for this skill'

TorpedoConstants.REMOVE_SUGGESTION_NAME = 'Remove suggestion'
TorpedoConstants.REMOVE_SUGGESTION_DESC = 'Remove is suggestion'

TorpedoConstants.ADD_NEW_PROFILE_NAME = 'Add profile'
TorpedoConstants.ADD_NEW_PROFILE_DESC = 'Add a new profile'

TorpedoConstants.DELETE_PROFILE_NAME = 'Delete profile'
TorpedoConstants.DELETE_PROFILE_DESC = 'Delete this profile'

TorpedoConstants.SET_ACTIVE_PROFILE_NAME = 'Set active profile'
TorpedoConstants.SET_ACTIVE_PROFILE_DESC = 'Set this profile to be the active profile.'

TorpedoConstants.CHANGE_PROFILE_NAME_NAME = 'Profile name:'
TorpedoConstants.CHANGE_PROFILE_NAME_DESC = 'Change the name of this profile'

TorpedoConstants.DELETE_SKILL_NAME = 'Delete skill'
TorpedoConstants.DELETE_SKILL_DESC = 'Delete this skill'

TorpedoConstants.TOGGLE_ADVANCED_FEATURES_NAME = 'Advanced features'
TorpedoConstants.TOGGLE_ADVANCED_FEATURES_DESC = 'Enable features that require an above-average knowledge of WoW\'s technical aspects, such as spell ids, aura targets, and icon ids. These features also tend to have more jargon in error messages and allow for subtle mistakes.'

TorpedoConstants.ADD_NEW_SKILL_GROUP_NAME = 'Add skill'

TorpedoConstants.ADD_NEW_SKILL_DESCRIPTION_NAME = [[
The spell name will attempt to autofill as much as possible.

Each spell consists of:
 - A name, which is used in the options tree and should match the spell name when hovered over
 - A debugName, which should be an UpperCamelCase string (no spaces) version of the name
 - A spell_id, which can be fetched using /dump GetSpellInfo('<spell name>') It will be the 7th result. 
 - An icon_id, which is also fetched with GetSpellInfo. It will be the 3rd result.
 - (Optionally) a cooldown, which is the maximum cooldown in seconds for the spell. Left blank for spells with no cooldown
 - (Optionally) charges, which is the maximum number of charges for the spell. Left blank for spells with no charges]]
 
TorpedoConstants.ADD_NEW_SKILL_SPELL_NAME_NAME = 'Spell name:'
TorpedoConstants.ADD_NEW_SKILL_SPELL_NAME_DESC = 'Used in the options tree and should match the spell name'

TorpedoConstants.ADD_NEW_SKILL_SPELL_DEBUGNAME_NAME = 'Spell debug name:'
TorpedoConstants.ADD_NEW_SKILL_SPELL_DEBUGNAME_DESC = 'Used for dynamic variable names. Should be UpperCamelCase (no spaces).'

TorpedoConstants.ADD_NEW_SKILL_SPELL_SPELLID_NAME = 'Spell id:'
TorpedoConstants.ADD_NEW_SKILL_SPELL_SPELLID_DESC = 'The spell id for fetching cooldown and charge information'

TorpedoConstants.ADD_NEW_SKILL_SPELL_ICONID_NAME = 'Spell icon id:'
TorpedoConstants.ADD_NEW_SKILL_SPELL_ICONID_DESC = 'The icon id to compare to textures when glowing buttons in the actionbar, and for showing when the skill is suggested'

TorpedoConstants.ADD_NEW_SKILL_SPELL_COOLDOWN_NAME = 'Spell cooldown:'
TorpedoConstants.ADD_NEW_SKILL_SPELL_COOLDOWN_DESC = 'Optional maximum cooldown in seconds for the spell. Used for building option trees.'

TorpedoConstants.ADD_NEW_SKILL_SPELL_CHARGES_NAME = 'Spell charges:'
TorpedoConstants.ADD_NEW_SKILL_SPELL_CHARGES_DESC = 'Optional maximum charges for the spell. Used for building option trees'

TorpedoConstants.ADD_NEW_SKILL_EXECUTE_NAME = 'Add skill'
TorpedoConstants.ADD_NEW_SKILL_EXECUTE_DESC = 'Add this skill to this specialization'

TorpedoConstants.ADD_NEW_COOLDOWN_GROUP_NAME = 'Add cooldown'

TorpedoConstants.ADD_NEW_COOLDOWN_DESCRIPTION_NAME = [[
Cooldowns are just spells that are specifically setup for "Check xyz's cooldown" options and 
"Check xyz's charges" options. The cooldown is not optional and is for 1 charge. See "Add skill"
for more information about each parameter.

Be careful! In order to edit / remove these you will need to open up your SavedVariables file, or start over with a new profile. It is *strongly* suggested to test this on an empty profile first.

The spell name will attempt to autofill as much as possible.

Each spell consists of:
 - A name
 - A debugName
 - A spell_id (GetSpellInfo 7th result)
 - A icon_id (GetSpellInfo 3rd result)
 - A cooldown (not optional)
 - (Optionally) charges 
]]
TorpedoConstants.ADD_NEW_COOLDOWN_SPELL_NAME = 'Spell name:'
TorpedoConstants.ADD_NEW_COOLDOWN_SPELL_DEBUGNAME = 'Spell debug name:'
TorpedoConstants.ADD_NEW_COOLDOWN_SPELL_SPELLID = 'Spell id:'
TorpedoConstants.ADD_NEW_COOLDOWN_SPELL_ICONID = 'Icon id:'
TorpedoConstants.ADD_NEW_COOLDOWN_SPELL_COOLDOWN = 'Cooldown:'
TorpedoConstants.ADD_NEW_COOLDOWN_SPELL_CHARGES = 'Charges:'
TorpedoConstants.ADD_NEW_COOLDOWN_EXECUTE_NAME = 'Add new cooldown'

TorpedoConstants.ADD_NEW_AURA_GROUP_NAME = 'Add aura'
TorpedoConstants.ADD_NEW_AURA_DESCRIPTION_NAME = [[
Auras are used for "Check xyz's duration" options. Auras can only be autofilled in the aura is active when the aura name is put in. Both the player and his target will be scanned, though this is difficult if it is a short-duration buff that requires combat.

Be careful! In order to edit / remove these you will need to open up your SavedVariables file, or start over with a new profile. It is *strongly* suggested to test this on an empty profile first.

Each aura consists of:
 - A name (like spells)
 - A debugName (like spells)
 - An aura_id - these are much less convienent to get than spells. I suggest using something like the idTip addon and hovering over the buff to get the aura_id. Then, search online or follow the spell method to find the icon id.
 - An icon_id - like spells
 - target - Either 'target' or 'player'. Who to check for the aura
 - max_duration - The maximum duration that the aura could use. This is for building the option tree, and is 1.3 * duration (i.e. Symbols of Death is 35 seconds per cast, which can go as high as 35 * 1.3 = 45.5 seconds)
]]

TorpedoConstants.ADD_NEW_AURA_NAME_NAME = 'Aura name:'
TorpedoConstants.ADD_NEW_AURA_NAME_DESC = 'The name of the aura when you hover over it'
TorpedoConstants.ADD_NEW_AURA_DEBUGNAME_NAME = 'Aura debug name:'
TorpedoConstants.ADD_NEW_AURA_DEBUGNAME_DESC = 'Like spells, UpperCamelCase no spaces version of the name'
TorpedoConstants.ADD_NEW_AURA_AURAID_NAME = 'Aura id:'
TorpedoConstants.ADD_NEW_AURA_AURAID_DESC = 'The aura id. Not always the same as the corresponding spell id, so you will need to check'
TorpedoConstants.ADD_NEW_AURA_ICONID_NAME = 'Icon id:'
TorpedoConstants.ADD_NEW_AURA_ICONID_DESC = 'The icon id that shows up. Not currently used, but might be in the future'
TorpedoConstants.ADD_NEW_AURA_TARGET_NAME = 'Target:'
TorpedoConstants.ADD_NEW_AURA_TARGET_DESC = 'Either player if it occurs to you, or target if it occurs to your target'
TorpedoConstants.ADD_NEW_AURA_MAXDURATION_NAME = 'Max duration:'
TorpedoConstants.ADD_NEW_AURA_MAXDURATION_DESC = 'Maximum duration in seconds. See above.'

TorpedoConstants.ADD_NEW_AURA_EXECUTE_NAME = 'Add new aura'
TorpedoConstants.ADD_NEW_AURA_EXECUTE_DESC = 'Attempt to add this aura to this specializations list of auras'