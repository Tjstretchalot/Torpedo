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