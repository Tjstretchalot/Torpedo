local MAJOR, MINOR = 'TorpedoConstants-1.0', 1
local TorpedoConstants = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoConstants then return end

TorpedoConstants.ENABLE_DESC = 'Allow this option to be considered'
TorpedoConstants.PRIMARY_DESC = 'Is this a primary suggestion or secondary suggestion?'

TorpedoConstants.SUGGESTION_DEBUG_NAME = 'Debug'
TorpedoConstants.SUGGESTION_DEBUG_DESC = 'This will print out the result of the suggestion. Recommended only for advanced users'

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

TorpedoConstants.REQUIRE_PVP_DESC = 'Do we need to be in a controlled player vs player context (such as arenas or battlegrounds) for this suggestion?'
TorpedoConstants.REQUIRE_NOT_PVP_DESC = 'Do we need to not be in controlled player vs player context (such as arenas or battlegrounds) for this suggestion?'

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

TorpedoConstants.TIME_TO_KILL_SOLO_MIN = 0
TorpedoConstants.TIME_TO_KILL_SOLO_MAX = math.huge
TorpedoConstants.TIME_TO_KILL_SOLO_SOFTMIN = 0
TorpedoConstants.TIME_TO_KILL_SOLO_SOFTMAX = 600
TorpedoConstants.TIME_TO_KILL_SOLO_STEP = 0.05
TorpedoConstants.TIME_TO_KILL_SOLO_BIGSTEP = 1
TorpedoConstants.TIME_TO_KILL_SOLO_CHECK_DESC = 'Check how much predicted time to kill your target without the help of your teammates (requires Skada).'
TorpedoConstants.TIME_TO_KILL_SOLO_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain amount of time left on this target without the help of your teammates'
TorpedoConstants.TIME_TO_KILL_SOLO_MINIMUM_DESC = 'Minimum amount of time left on this target without the help of your teammates'
TorpedoConstants.TIME_TO_KILL_SOLO_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain amount of time left on this target without the help of your teammates'
TorpedoConstants.TIME_TO_KILL_SOLO_MAXIMUM_DESC = 'Maximum amount of time left on this target without the help of your teammates'

TorpedoConstants.TIME_TO_KILL_RAID_MIN = 0
TorpedoConstants.TIME_TO_KILL_RAID_MAX = math.huge
TorpedoConstants.TIME_TO_KILL_RAID_SOFTMIN = 0
TorpedoConstants.TIME_TO_KILL_RAID_SOFTMAX = 600
TorpedoConstants.TIME_TO_KILL_RAID_STEP = 0.05
TorpedoConstants.TIME_TO_KILL_RAID_BIGSTEP = 1
TorpedoConstants.TIME_TO_KILL_RAID_CHECK_DESC = 'Check how much predicted time to kill your target with the help of your teammates (requires Skada).'
TorpedoConstants.TIME_TO_KILL_RAID_HAVE_MINIMUM_DESC = 'Make sure we have atleast a certain amount of time left on this target with the help of your teammates'
TorpedoConstants.TIME_TO_KILL_RAID_MINIMUM_DESC = 'Minimum amount of time left on this target with the help of your teammates'
TorpedoConstants.TIME_TO_KILL_RAID_HAVE_MAXIMUM_DESC = 'Make sure we have less than a certain amount of time left on this target with the help of your teammates'
TorpedoConstants.TIME_TO_KILL_RAID_MAXIMUM_DESC = 'Maximum amount of time left on this target with the help of your teammates'

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

TorpedoConstants.CLONE_PROFILE_NAME = 'Clone profile'
TorpedoConstants.CLONE_PROFILE_DESC = 'Make a copy of this profile. Don\'t go too crazy with profiles - since there is an absolutely insane amount of options per profile it can make this configuration interface pretty slow. It won\'t affect Torpedo\'s performance while you\'re fighting though, so it all depends on your patience.'

TorpedoConstants.SET_ALL_TO_RECOMMENDED_NAME = 'Set all to recommended'
TorpedoConstants.SET_ALL_TO_RECOMMENDED_DESC = 'Make this profile a copy of the recommended settings - this will overwrite this profile!'

TorpedoConstants.ENABLE_PROFILE_OPTIONS_NAME = 'Enable profile options'
TorpedoConstants.ENABLE_PROFILE_OPTIONS_DESC = 'Actually build the options table for this profile. Recommended that you only enable this temporarily, as disabling this is a significant performance boost while actually playing. It\'s recommended you reload after disabling options.'

TorpedoConstants.DISABLE_PROFILE_OPTIONS_NAME = 'Disable profile options'
TorpedoConstants.DISABLE_PROFILE_OPTIONS_DESC = 'Stop building the options for this profile until re-enabled. Recommended that you only enable this temporarily, as disabling this is a significant performance boost while actually playing. It\'s recommended you reload after disabling options.'

TorpedoConstants.DELETE_SKILL_NAME = 'Delete skill'
TorpedoConstants.DELETE_SKILL_DESC = 'Delete this skill'

TorpedoConstants.REDUCE_SKILL_ORDER_NAME = 'Reduce order'
TorpedoConstants.REDUCE_SKILL_ORDER_DESC = 'This moves this skill up in the tree layout. This has absolutely no effect on anything except that.'

TorpedoConstants.INCREASE_SKILL_ORDER_NAME = 'Increase order'
TorpedoConstants.INCREASE_SKILL_ORDER_DESC = 'This moves this skill down in the tree layout. This has absolutely no effect on anything except that.'


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
TorpedoConstants.ADD_NEW_AURA_IS_STEALTHY_NAME = 'Stealthy'
TorpedoConstants.ADD_NEW_AURA_IS_STEALTHY_DESC = 'Does this aura allow us to use stealth abilities?'
TorpedoConstants.ADD_NEW_AURA_IS_HIDDEN_NAME = 'Hidden'
TorpedoConstants.ADD_NEW_AURA_IS_HIDDEN_DESC = 'Should this aura not be shown in the options table?'

TorpedoConstants.ADD_NEW_AURA_EXECUTE_NAME = 'Add new aura'
TorpedoConstants.ADD_NEW_AURA_EXECUTE_DESC = 'Attempt to add this aura to this specializations list of auras'

TorpedoConstants.SPELL_CONTEXT_CHECK_ENABLED_NAME = 'Check context surrounding {spell_name}'
TorpedoConstants.SPELL_CONTEXT_CHECK_ENABLED_DESC = 'Advanced Feature. Examine what was happening the last time we casted {spell_name} while targetting our current target.'

TorpedoConstants.REQUIRE_STEALTHED_IN_CONTEXT_DESC = 'Ensure that when we last cast {cooldown_name} on our current target, we were stealthed.'

TorpedoConstants.REQUIRE_NOT_STEALTHED_IN_CONTEXT_DESC = 'Ensure that when we last cast {cooldown_name} on our current target, we were not stealthed.'

TorpedoConstants.COMBO_POINTS_IN_CONTEXT_CHECK_DESC = 'Ensure that when we last cast {cooldown_name} on our current target, we had a certain amount of combo points.'
TorpedoConstants.COMBO_POINTS_IN_CONTEXT_HAVE_MIN_DESC = 'Ensure we had atleast a certain number of combo points when we last cast {cooldown_name} on our current target.'
TorpedoConstants.COMBO_POINTS_IN_CONTEXT_MIN_DESC = 'Required minimum number of combo points when we last cast {cooldown_name} on our current target.'
TorpedoConstants.COMBO_POINTS_IN_CONTEXT_HAVE_MAX_DESC = 'Ensure we had at most a certain number of combo points when we last cast {cooldown_name} on our current target.'
TorpedoConstants.COMBO_POINTS_IN_CONTEXT_MAX_DESC = 'Required maximum number of combo points when we last cast {cooldown_name} on our current target.'

TorpedoConstants.TIMESTAMP_COMPARED_TO_DESC = 'Compare the time that {spell_name} was cast to when {cooldown_name} was cast. For example, when set to used before, it\'s read "{spell_name} was used before {cooldown_name}"'

TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_MIN = 0
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_SOFTMIN = 0
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_STEP = 0.05
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_BIGSTEP = 1
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_CHECK_DESC = 'Check how much time was left on {aura_name}\'s duration.'
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_HAVE_MINIMUM_DESC = 'Make sure we had atleast a certain amount of time remaining on {aura_name}\'s duration.'
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_MINIMUM_DESC = 'Minimum amount of time that had to be remaining on {aura_name}\'s duration.'
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_HAVE_MAXIMUM_DESC = 'Make sure we had less than a certain amount of time remaining on {aura_name}\'s duration.'
TorpedoConstants.SPELL_CONTEXT_AURA_DURATION_MAXIMUM_DESC = 'Maximum amount of time had to be  remaining on {aura_name}\'s duration.'

TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_MIN = 0
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_SOFTMIN = 0
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_MAX = math.huge
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_SOFTMAX = 1800
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_STEP = 0.05
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_BIGSTEP = 1
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_CHECK_DESC = 'Check how long ago, in seconds, we cast {spell_name}.'
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_HAVE_MINIMUM_DESC = 'Make sure we cast {spell_name} at least a certain amount of time ago.'
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_MINIMUM_DESC = 'Minimum amount of time since we cast {spell_name}.'
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_HAVE_MAXIMUM_DESC = 'Make sure we cast {spell_name} at most a certain amount of time ago.'
TorpedoConstants.SPELL_CONTEXT_TIME_SINCE_CAST_MAXIMUM_DESC = 'Maximum amount of time since we cast {spell_name}.'

TorpedoConstants.REQUIRE_BOSS_FIGHT_DESC = 'Only use during an encounter (boss fight).'
TorpedoConstants.REQUIRE_NO_BOSS_FIGHT_DESC = 'Don\'t use during an encounter (boss fight).'

TorpedoConstants.REQUIRE_INSTANCE_DESC = 'Only use while inside of an instance.'
TorpedoConstants.REQUIRE_NO_INSTANCE_DESC = 'Don\'t use while inside of an instance.'

TorpedoConstants.GROUP_SIZE_CHECK_DESC = 'Check how big our group is for this suggestion. No party is a group size of 0, a party with one additional person is a group size of 2.'
TorpedoConstants.GROUP_SIZE_HAVE_MINIMUM_DESC = 'Do we have a minimum group size for this suggestion?'
TorpedoConstants.GROUP_SIZE_MINIMUM_DESC = 'Minimum size of the group. Use 2 for in a party.'
TorpedoConstants.GROUP_SIZE_HAVE_MAXIMUM_DESC = 'Do we have a maximum group size for this suggestion?'
TorpedoConstants.GROUP_SIZE_MAXIMUM_DESC = 'Maximum size of the group. Use 0 for ungrouped.'
TorpedoConstants.GROUP_SIZE_MIN = 0
TorpedoConstants.GROUP_SIZE_MAX = 40
TorpedoConstants.GROUP_SIZE_SOFTMIN = 0
TorpedoConstants.GROUP_SIZE_SOFTMAX = 40
TorpedoConstants.GROUP_SIZE_STEP = 1
TorpedoConstants.GROUP_SIZE_BIGSTEP = 1

TorpedoConstants.PRIMARY_PANEL_SCALE_DESC = 'Multiplier for the size of the primary suggestion panel.'
TorpedoConstants.SECONDARY_PANEL_SCALE_DESC = 'Multiplier for the size of the secondary suggestion panel.'

TorpedoConstants.SECONDARY_PANEL_PRIM_CORNER_OFFSET = 'What corner in the primary panel is the secondary panel offset from?'
TorpedoConstants.SECONDARY_PANEL_REFERENCE_CORNER = 'What corner is the offset references on the secondary panel? E.g. if the primary corner is bottom right and the secondary corner is bottom left then the offset is the distance from the bottom right of the primary to the bottom left of the secondary.'
TorpedoConstants.SECONDARY_PANEL_X_OFFSET = 'What is the x (positive is right) distance from the secondary panel primary offset corner to the secondary panel reference corner?'
TorpedoConstants.SECONDARY_PANEL_Y_OFFSET = 'What is the y (positive is up) distance from the secondary panel primary offset corner to the secondary panel reference corner?'

-- Add/Remove specialization stuff --
TorpedoConstants.ADD_SPECIALIZATION_CHECKBOX_NAME = 'Show new specialization options'
TorpedoConstants.ADD_SPECIALIZATION_CHECKBOX_DESC = 'Show options relating to adding a new specialization. This is for advanced users only.'
TorpedoConstants.ADD_SPECIALIZATION_GROUP_NAME = 'Add specialization'
TorpedoConstants.ADD_SPECIALIZATION_SPEC_ID_NAME = 'Specialization ID'
TorpedoConstants.ADD_SPECIALIZATION_SPEC_ID_DESC = 'This can be retrieved using GetSpecializationInfo(GetSpecialization()) - Returns id, name, description, ...'
TorpedoConstants.ADD_SPECIALIZATION_SPEC_ID_MIN = nil
TorpedoConstants.ADD_SPECIALIZATION_SPEC_ID_MAX = nil
TorpedoConstants.ADD_SPECIALIZATION_SPEC_NAME_NAME = 'Specialization name'
TorpedoConstants.ADD_SPECIALIZATION_SPEC_NAME_DESC = 'What is the specialization called?'
TorpedoConstants.ADD_SPECIALIZATION_FILL_IN_CURRENT_NAME = 'Fill in automatically'
TorpedoConstants.ADD_SPECIALIZATION_FILL_IN_CURRENT_DESC = 'Fill this in with our current specialization information?'
TorpedoConstants.ADD_SPECIALIZATION_EXECUTE_NAME = 'Add specialization'
TorpedoConstants.ADD_SPECIALIZATION_EXECUTE_DESC = 'Add the specified specialization to this profile'

TorpedoConstants.DELETE_SPECIALIZATION_NAME = 'Delete specialization'
TorpedoConstants.DELETE_SPECIALIZATION_DESC = 'Delete this specialization from this profile. Make sure you know what you\'re doing, but you can always get the default profile back using \'Set all to recommended\'.'

-- Talent Choices --
TorpedoConstants.TALENT_CHOICE_NEW_NAME = 'Add talent check'
TorpedoConstants.TALENT_CHOICE_NEW_DESC = 'Add a check to see if a talent is or is not selected'
TorpedoConstants.TALENT_CHOICE_ENABLED_NAME = 'Enabled'
TorpedoConstants.TALENT_CHOICE_ENABLED_DESC = 'Should we check this talent?'
TorpedoConstants.TALENT_CHOICE_HEADER_DESC = 'This is either the name of the talent or \'Invalid Talent\' if the talent tier and column do not correspond to an actual talent. This option will be disregarded if this text says \'Invalid Talent\'.'
TorpedoConstants.TALENT_CHOICE_DELETE_NAME = 'Delete'
TorpedoConstants.TALENT_CHOICE_DELETE_DESC = 'Delete this talent choice group'
TorpedoConstants.TALENT_CHOICE_INVERTED_NAME = 'Inverted'
TorpedoConstants.TALENT_CHOICE_INVERTED_DESC = 'Check that we don\'t have this talent?'
TorpedoConstants.TALENT_CHOICE_TIER_NAME = 'Tier'
TorpedoConstants.TALENT_CHOICE_TIER_DESC = 'Which row is this talent on? Ascending from 1 for level 15 talents to 7 for level 100 talents.'
TorpedoConstants.TALENT_CHOICE_COLUMN_NAME = 'Column'
TorpedoConstants.TALENT_CHOICE_COLUMN_DESC = 'Which column is this talent on? Ascending from 1 on the left to 3 on the right.'

-- Transmission
TorpedoConstants.IMPORT_PROFILE_CHECKBOX_NAME = 'Show importing options'
TorpedoConstants.IMPORT_PROFILE_CHECKBOX_DESC = 'Show options relating to importing profiles - you should only import profiles from people you trust.'
TorpedoConstants.IMPORT_PROFILE_INPUT_NAME = 'Encoded String'
TorpedoConstants.IMPORT_PROFILE_INPUT_DESC = 'Copy and paste the encoded string here'
TorpedoConstants.IMPORT_PROFILE_EXECUTE_NAME = 'Import Profile'
TorpedoConstants.IMPORT_PROFILE_EXECUTE_DESC = 'Decode the string and import it as a profile.'
TorpedoConstants.IMPORT_PROFILE_DEBUG_NAME = 'Debug Import'
TorpedoConstants.IMPORT_PROFILE_DEBUG_DESC = 'More debug print statements to help diagnose what\'s happening.'

TorpedoConstants.EXPORT_PROFILE_CHECKBOX_NAME = 'Show exporting options'
TorpedoConstants.EXPORT_PROFILE_CHECKBOX_DESC = 'Show options relating to exporting profiles - you can share the encoded string using a service such as pastebin'

TorpedoConstants.EXPORT_PROFILE_INPUT_NAME = 'Export String'
TorpedoConstants.EXPORT_PROFILE_INPUT_DESC = 'Have the recieving user import this string'

TorpedoConstants.EXPORT_PROFILE_ENCODE_NAME = 'Encode Profile'
TorpedoConstants.EXPORT_PROFILE_ENCODE_DESC = 'Encode the profile and fill the above multiline input.'