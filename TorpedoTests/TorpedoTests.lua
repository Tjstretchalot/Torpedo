-- Imports
local colors = require('ansicolors')
dofile('TorpedoTests/WowFuncs.lua')
dofile('Libs/LibStub/LibStub.lua')

-- Assert Functions
local assertCounter
local assertInconclusive
local function AssertEqual(expected, actual, optError)
  assertCounter = assertCounter + 1
  if expected ~= actual then 
    if optError then 
      optError = '\n' .. optError
    else
      optError = ''
    end
    error('Expected ' .. tostring(expected) .. ' (type=' .. type(expected) .. ') but got ' .. tostring(actual) .. ' (type=' .. type(actual) .. ')' .. optError, 2)
  end
end

local function AssertNotEqual(notExpected, actual, optError)
  assertCounter = assertCounter + 1
  if notExpected == actual then 
    if optError then 
      optError = '\n' .. optError
    else
      optError = ''
    end
    error('Expected not equal to ' .. tostring(notExpected) .. ' (type=' .. type(notExpected) .. ') but ' .. tostring(actual) .. ' (type=' .. type(actual) .. ') is equal to ' .. tostring(notExpected) .. ' (type=' .. type(notExpected) .. ')' .. optError, 2)
  end
end

local function AssertFalsey(actual, optError)
  assertCounter = assertCounter + 1
  if actual then 
    if optError then 
      optError = '\n' .. optError
    else
      optError = ''
    end
    error('Expected ' .. tostring(actual) .. ' (type=' .. type(actual) .. ') to be falsey, but it is truthy' .. optError, 2)
  end
end

local function AssertTruthy(actual, optError)
  assertCounter = assertCounter + 1
  if not actual then 
    if optError then 
      optError = '\n' .. optError
    else
      optError = ''
    end
    error('Expected ' .. tostring(actual) .. ' (type=' .. type(actual) .. ') to be truthy, but it is falsey' .. optError, 2)
  end
end

local function AssertNil(actual, optError)
  AssertEqual(nil, actual, optError)
end

local function AssertNotNil(actual, optError)
  AssertNotEqual(nil, actual, optError)
end

local function AssertType(expected, actual, optError)
  AssertEqual(expected, type(actual), optError)
end

local function AssertError(func, optError)
  assertCounter = assertCounter + 1
  local status, err = pcall(func)
  
  if status then 
    if optError then 
      optError = '\n' .. optError
    else
      optError = ''
    end
    error('Expected error from function, but got no error' .. optError, 2)
  end
end

local function AssertDeepEquals(expected, actual, optError, nestedStr)
  optError = optError or ''
  nestedStr = nestedStr or ''
  AssertType(type(expected), actual, 'key=' .. nestedStr .. '; optError=' .. optError)
  
  for key, val in pairs(expected) do 
    local current = nestedStr .. '.' .. tostring(key)
    AssertType(type(expected[key]), actual[key], current)
    if type(actual[key]) == 'function' then
    elseif type(actual[key]) == 'table' then 
      AssertDeepEquals(expected[key], actual[key], optError, current)
    else 
      AssertEqual(expected[key], actual[key], current)
    end
  end
  
  local check_for_extra = function(self, expected, actual, optError, nestedStr)
    for key, val in pairs(actual) do 
      local current = nestedStr .. '.' .. tostring(key)
      if expected[key] == nil then 
        error('Unexpected key/val pair key=' .. current .. ', val = ' .. tostring(val) .. ' (type=' .. type(val) .. ')', 2)
      elseif type(expected[key]) == 'table' then 
        self(self, expected[key], actual[key], optError, current)
      end
    end
  end
  
  check_for_extra(check_for_extra, expected, actual, optError, nestedStr)
end

local function AssertInconclusive(optReason)
  assertInconclusive = optReason or true
end

--[[
  Test that the New function on the specified object requires
  that all of the parameters in expectedRequirements are passed
  in.
]]
local function TestInitFunction(obj, expectedRequirements)
  AssertNotNil(obj)
  AssertType('function', obj.New)
  
  local copy = {}
  local copy2 = {}
  for key, val in pairs(expectedRequirements) do
    copy[key] = val
    copy2[key] = val
  end
  
  for key, val in pairs(copy2) do 
    copy[key] = nil
    AssertError(function() obj:New(copy) end, 'Expected an error when calling New without ' .. tostring(key))
    copy[key] = val
  end
  
  local result = obj:New(expectedRequirements)
  AssertNotNil(result)
  return result
end

-- Test Utility Functions
local function RunTestByName(testName, func)
  assertCounter = 0
  assertInconclusive = nil
  local status, err = xpcall(function()
    func()
    local plural = 's'
    if assertCounter == 1 then plural = '' end
    if type(assertInconclusive) ~= 'nil' then 
      print(colors('%{bright yellow}' .. tostring(testName) .. ' was inconclusive after ' .. tostring(assertCounter) .. ' assertion' .. plural .. '.'))
    elseif assertCounter == 0 then 
      print(colors('%{yellow}' .. tostring(testName) .. ' did not succeed or fail at any assertions.'))
    else
      print(colors('%{green}' .. tostring(testName) .. ' succeeded (' .. tostring(assertCounter) .. ' assertion' .. plural .. ')'))
    end
  end, function(err)
    local plural = 's'
    if assertCounter == 1 then plural = '' end
    print(colors('%{bright red}' .. tostring(testName) .. ' failed after ' .. tostring(assertCounter) .. ' assertion' .. plural .. ': '))
    print(err)
    print(debug.traceback())
  end)
  assertCounter = 0
  assertInconclusive = nil
  if err then error() end
end

-- Tests 
RunTestByName('Load TorpedoConstants', function()
  dofile('TorpedoConstants.lua')
  
  local TorpedoConstants = LibStub:GetLibrary('TorpedoConstants-1.0')
  AssertNotNil(TorpedoConstants)
end)

RunTestByName('Load TorpedoUtils', function()
  dofile('TorpedoUtils.lua')
  
  local TorpedoUtils = LibStub:GetLibrary('TorpedoUtils-1.0')
  AssertNotNil(TorpedoUtils)
end)

RunTestByName('Load default config', function()
  dofile('TorpedoDefaultConfig.lua')
  
  local TorpedoDefaultConfig = LibStub:GetLibrary('TorpedoDefaultConfig-1.0')
  AssertNotNil(TorpedoDefaultConfig)
end)

RunTestByName('Load TorpedoOptionsBuilder', function() 
  dofile('TorpedoOptionsBuilder.lua')
  
  local TorpedoOptionsBuilder = LibStub:GetLibrary('TorpedoOptionsBuilder-1.0')
  AssertNotNil(TorpedoOptionsBuilder)
end)

RunTestByName('Load TorpedoSpells', function()
  dofile('TorpedoSpells.lua')
  
  local TorpedoSpells = LibStub:GetLibrary('TorpedoSpells-1.0')
  AssertNotNil(TorpedoSpells)
end)

RunTestByName('Load TorpedoAuras', function()
  dofile('TorpedoAuras.lua')
  
  local TorpedoAuras = LibStub:GetLibrary('TorpedoAuras-1.0')
  AssertNotNil(TorpedoAuras)
end)

RunTestByName('Load TorpedoContext', function()
  dofile('TorpedoContext.lua')
  
  local TorpedoContext = LibStub:GetLibrary('TorpedoContext-1.0')
  AssertNotNil(TorpedoContext)
end)

RunTestByName('Load TorpedoSuggestionResult', function()
  dofile('TorpedoSuggestionResult.lua')
  
  local TorpedoSuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  AssertNotNil(TorpedoSuggestionResult)
end)

RunTestByName('Load TorpedoFightSummary', function()
  dofile('TorpedoFightSummary.lua')
  
  local TorpedoFightSummary = LibStub:GetLibrary('TorpedoFightSummary-1.0')
  AssertNotNil(TorpedoFightSummary)
end)

RunTestByName('Load TorpedoTimestampTristate', function()
  dofile('TorpedoTimestampTristate.lua')
  
  local TorpedoTimestampTristate = LibStub:GetLibrary('TorpedoTimestampTristate-1.0')
  AssertNotNil(TorpedoTimestampTristate)
end)

RunTestByName('Load TorpedoContextDecider', function()
  dofile('TorpedoContextDecider.lua')
  
  local TorpedoContextDecider = LibStub:GetLibrary('TorpedoContextDecider-1.0')
  AssertNotNil(TorpedoContextDecider)
end)

RunTestByName('Load TorpedoSpellContextOptions', function()
  dofile('TorpedoSpellContextOptions.lua')
  
  local TorpedoSpellContextOptions = LibStub:GetLibrary('TorpedoSpellContextOptions-1.0')
  AssertNotNil(TorpedoSpellContextOptions)
end)

RunTestByName('Load TorpedoSuggestions', function()
  dofile('TorpedoSuggestions.lua')
  
  local TorpedoSuggestions = LibStub:GetLibrary('TorpedoSuggestions-1.0')
  AssertNotNil(TorpedoSuggestions)
end)

RunTestByName('Init spell', function()
  local Spell = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local envenom = TestInitFunction(Spell, {
    name = 'Envenom',
    debugName = 'Envenom',
    spell_id = 12345,
    icon_id = 54321
  })
  
  AssertEqual('Envenom', envenom.name)
  AssertEqual(12345, envenom.spell_id)
  AssertEqual(54321, envenom.icon_id)
end)

RunTestByName('Init buff', function()
  local Aura = LibStub:GetLibrary('TorpedoAuras-1.0')
  
  local envenom = TestInitFunction(Aura, {
    name = 'Envenom',
    debugName = 'Envenom',
    target = 'player',
    aura_id = 12345,
    icon_id = 54321,
    max_duration = 6
  })
  
  AssertEqual('Envenom', envenom.name)
  AssertEqual('player', envenom.target)
  AssertEqual(12345, envenom.aura_id)
  AssertEqual(54321, envenom.icon_id)
end)

RunTestByName('Init context', function()
  local Context = LibStub:GetLibrary('TorpedoContext-1.0')
  
  local context = TestInitFunction(Context, {
    auras = {},
    cooldowns = {},
    timestamp = 0,
    power = 0,
    max_power = 0,
    combo_points = 0,
    max_combo_points = 0,
    health = 0,
    max_health = 0,
    stealthy = false,
    combat = false,
    fight_summary = {},
    target_info = {}, 
    group_size = 0, 
    in_instance = false,
    boss_fight = false
  })
  
  AssertType('table', context.auras)
  AssertEqual(0, context.timestamp)
  AssertEqual(0, context.power)
  AssertEqual(0, context.max_power)
  AssertEqual(0, context.combo_points)
  AssertEqual(0, context.max_combo_points)
  AssertEqual(0, context.health)
  AssertEqual(0, context.max_health)
end)

RunTestByName('Check suggestion result values', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  AssertNotNil(SuggestionResult)
  AssertNotNil(SuggestionResult.DO_NOT_SUGGEST)
  AssertNotNil(SuggestionResult.SUGGEST)
  AssertNotNil(SuggestionResult.POOL_ENERGY)
end)

RunTestByName('Init suggestion', function()
  local Spell = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Suggestion = LibStub:GetLibrary('TorpedoSuggestions-1.0')
  
  local envenomSpell = Spell:New({
    name = 'Envenom',
    debugName = 'Envenom',
    spell_id = 12345,
    icon_id = 54321
  })
  
  local envenom = TestInitFunction(Suggestion, {spell = envenomSpell, primary = true})
end)
RunTestByName('Suggestion can handle buffs', function()
  local Spell = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Aura = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Suggestion = LibStub:GetLibrary('TorpedoSuggestions-1.0')
  
  local envenomSpell = Spell:New({
    name = 'Envenom',
    debugName = 'Envenom',
    spell_id = 12345,
    icon_id = 54321
  })
  
  local envenomBuff = Aura:New({
    name = 'Envenom',
    debugName = 'Envenom',
    aura_id = 12346,
    icon_id = 54321,
    target = 'player',
    max_duration = 6
  })
  
  local envenomSugg = Suggestion:New({spell = envenomSpell, primary = true})
  envenomSugg:RegisterAura(envenomBuff)
  AssertTruthy(true)
end)

RunTestByName('Suggestion can handle cooldowns', function()
  local Spell = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Suggestion = LibStub:GetLibrary('TorpedoSuggestions-1.0')
  
  local envenomSpell = Spell:New({
    name = 'Envenom',
    debugName = 'Envenom',
    spell_id = 12345,
    icon_id = 54321
  })
  
  local exsanguinateSpell = Spell:New({
    name = 'Exsanguinate',
    debugName = 'Exsanguinate',
    spell_id = 23456,
    icon_id = 65432,
    cooldown = 45
  })
  
  local envenomSugg = Suggestion:New({spell = envenomSpell, primary = true})
  envenomSugg:RegisterCooldown(exsanguinateSpell)
  
  AssertError(function() 
    envenomSugg:RegisterCooldown(envenomSpell) -- no cooldown
  end, 'Should not be able to register a cooldown for a spell with no cooldown')
end)
--[[
RunTestByName('Suggestion can create options', function()
  local Spell = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Aura = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Suggestion = LibStub:GetLibrary('TorpedoSuggestions-1.0')
  local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
  
  local envenomSpell = Spell:New({
    name = 'Envenom',
    debugName = 'Envenom',
    spell_id = 12345,
    icon_id = 54321
  })
  
  local exsanguinateSpell = Spell:New({
    name = 'Exsanguinate',
    debugName = 'Exsanguinate',
    spell_id = 24578,
    icon_id = 87542,
    cooldown = 45
  })
  
  local someBuff = Aura:New({
    name = 'Some Buff',
    debugName = 'SomeBuff',
    aura_id = 13579,
    icon_id = 97531,
    max_duration = 30,
    target = 'player'
  })
  
  local envenomSugg = Suggestion:New({spell = envenomSpell, primary = true})
  envenomSugg:RegisterCooldown(exsanguinateSpell)
  envenomSugg:RegisterAura(someBuff)
  
  local options = envenomSugg:CreateOptions('Option 1', 1)
  local fn = function() end -- deep equals only checks if types match for functions
  
  local nameCounter = 1
  local function next_param_name()
    local key = 'param' .. tostring(nameCounter)
    nameCounter = nameCounter + 1
    return key
  end
  local orderCounter = 0
  local function next_order()
    orderCounter = orderCounter + 1
    return orderCounter
  end
  
  local expected = {
    name = 'Option 1',
    type = 'group',
    order = 1,
    args = {
      [next_param_name()] = {
        name = Constants.REMOVE_SUGGESTION_NAME,
        desc = Constants.REMOVE_SUGGESTION_DESC,
        func = fn,
        type = 'execute',
        disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Enable',
        type = 'toggle',
        desc = Constants.ENABLE_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Primary',
        type = 'toggle',
        desc = Constants.PRIMARY_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Priority',
        type = 'range',
        desc = Constants.PRIORITY_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order(),
        min = Constants.PRIORITY_MIN,
        max = Constants.PRIORITY_MAX,
        softMin = Constants.PRIORITY_SOFTMIN,
        softMax = Constants.PRIORITY_SOFTMAX,
        step = Constants.PRIORITY_STEP,
        bigStep = Constants.PRIORITY_BIGSTEP
      },
      [next_param_name()] = {
        name = 'Require stealthed',
        type = 'toggle',
        desc = Constants.REQUIRE_STEALTHED_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Require not stealthed',
        type = 'toggle',
        desc = Constants.REQUIRE_NOT_STEALTHED_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Require combat',
        type = 'toggle',
        desc = Constants.REQUIRE_COMBAT_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Require not in combat',
        type = 'toggle',
        desc = Constants.REQUIRE_NOT_COMBAT_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Check energy',
        type = 'toggle',
        desc = Constants.ENERGY_CHECK_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have minimum energy',
        type = 'toggle',
        desc = Constants.ENERGY_HAVE_MINIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Minimum energy',
        type = 'range',
        desc = Constants.ENERGY_MINIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = Constants.ENERGY_MAX,
        softMin = 0,
        softMax = Constants.ENERGY_MAX,
        step = Constants.ENERGY_STEP,
        bigStep = Constants.ENERGY_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have maximum energy',
        type = 'toggle',
        desc = Constants.ENERGY_HAVE_MAXIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Maximum energy',
        type = 'range',
        desc = Constants.ENERGY_MAXIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = Constants.ENERGY_MAX,
        softMin = 0,
        softMax = Constants.ENERGY_MAX,
        step = Constants.ENERGY_STEP,
        bigStep = Constants.ENERGY_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Pool energy if low',
        type = 'toggle',
        desc = Constants.ENERGY_POOL_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Check combo points',
        type = 'toggle',
        desc = Constants.COMBO_POINTS_CHECK_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have minimum combo points',
        type = 'toggle',
        desc = Constants.COMBO_POINTS_HAVE_MINIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Minimum combo points',
        type = 'range',
        desc = Constants.COMBO_POINTS_MINIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = Constants.COMBO_POINTS_MAX,
        softMin = 0,
        softMax = Constants.COMBO_POINTS_MAX,
        step = Constants.COMBO_POINTS_STEP,
        bigStep = Constants.COMBO_POINTS_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have maximum combo points',
        type = 'toggle',
        desc = Constants.COMBO_POINTS_HAVE_MAXIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Maximum combo points',
        type = 'range',
        desc = Constants.COMBO_POINTS_MAXIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = Constants.COMBO_POINTS_MAX,
        softMin = 0,
        softMax = Constants.COMBO_POINTS_MAX,
        step = Constants.COMBO_POINTS_STEP,
        bigStep = Constants.COMBO_POINTS_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Check health percentage',
        type = 'toggle',
        desc = Constants.HEALTH_PERC_CHECK_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have minimum health percentage',
        type = 'toggle',
        desc = Constants.HEALTH_PERC_HAVE_MINIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Minimum health percentage',
        type = 'range',
        desc = Constants.HEALTH_PERC_MINIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = Constants.HEALTH_PERC_MAX,
        softMin = 0,
        softMax = Constants.HEALTH_PERC_MAX,
        step = Constants.HEALTH_PERC_STEP,
        bigStep = Constants.HEALTH_PERC_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have maximum health percentage',
        type = 'toggle',
        desc = Constants.HEALTH_PERC_HAVE_MAXIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Maximum health percentage',
        type = 'range',
        desc = Constants.HEALTH_PERC_MAXIMUM_DESC,
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = Constants.HEALTH_PERC_MAX,
        softMin = 0,
        softMax = Constants.HEALTH_PERC_MAX,
        step = Constants.HEALTH_PERC_STEP,
        bigStep = Constants.HEALTH_PERC_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Check cooldown for exsanguinate',
        type = 'toggle',
        desc = string.gsub(Constants.SPELL_COOLDOWN_CHECK_DESC, '{spell_name}', 'exsanguinate'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have minimum cooldown for exsanguinate',
        type = 'toggle',
        desc = string.gsub(Constants.SPELL_COOLDOWN_HAVE_MINIMUM_DESC, '{spell_name}', 'exsanguinate'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Minimum cooldown for exsanguinate',
        type = 'range',
        desc = string.gsub(Constants.SPELL_COOLDOWN_MINIMUM_DESC, '{spell_name}', 'exsanguinate'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = exsanguinateSpell.cooldown,
        softMin = 0,
        softMax = exsanguinateSpell.cooldown,
        step = Constants.SPELL_COOLDOWN_STEP,
        bigStep = Constants.SPELL_COOLDOWN_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have maximum cooldown for exsanguinate',
        type = 'toggle',
        desc = string.gsub(Constants.SPELL_COOLDOWN_HAVE_MAXIMUM_DESC, '{spell_name}', 'exsanguinate'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Maximum cooldown for exsanguinate',
        type = 'range',
        desc = string.gsub(Constants.SPELL_COOLDOWN_MAXIMUM_DESC, '{spell_name}', 'exsanguinate'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = exsanguinateSpell.cooldown,
        softMin = 0,
        softMax = exsanguinateSpell.cooldown,
        step = Constants.SPELL_COOLDOWN_STEP,
        bigStep = Constants.SPELL_COOLDOWN_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Check duration of some buff',
        type = 'toggle',
        desc = string.gsub(Constants.AURA_DURATION_CHECK_DESC, '{aura_name}', 'some buff'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have minimum duration of some buff',
        type = 'toggle',
        desc = string.gsub(Constants.AURA_DURATION_HAVE_MINIMUM_DESC, '{aura_name}', 'some buff'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Minimum duration of some buff',
        type = 'range',
        desc = string.gsub(Constants.AURA_DURATION_MINIMUM_DESC, '{aura_name}', 'some buff'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = someBuff.max_duration,
        softMin = 0,
        softMax = someBuff.max_duration,
        step = Constants.AURA_DURATION_STEP,
        bigStep = Constants.AURA_DURATION_BIGSTEP,
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Have maximum duration of some buff',
        type = 'toggle',
        desc = string.gsub(Constants.AURA_DURATION_HAVE_MAXIMUM_DESC, '{aura_name}', 'some buff'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        order = next_order()
      },
      [next_param_name()] = {
        name = 'Maximum duration of some buff',
        type = 'range',
        desc = string.gsub(Constants.AURA_DURATION_MAXIMUM_DESC, '{aura_name}', 'some buff'),
        get = fn, set = fn, disabled = fn, hidden = fn, width = 'full',
        min = 0,
        max = someBuff.max_duration,
        softMin = 0,
        softMax = someBuff.max_duration,
        step = Constants.AURA_DURATION_STEP,
        bigStep = Constants.AURA_DURATION_BIGSTEP,
        order = next_order()
      },
    }
  }
  AssertDeepEquals(expected, options)
end)
]]
local function init_sugg_and_context()
  local Spell = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Suggestion = LibStub:GetLibrary('TorpedoSuggestions-1.0')
  local Context = LibStub:GetLibrary('TorpedoContext-1.0')
  local FightSummary = LibStub:GetLibrary('TorpedoFightSummary-1.0')
  
  local envenomSpell = Spell:New({
    name = 'Envenom',
    debugName = 'Envenom',
    spell_id = 12345,
    icon_id = 54321
  })
  
  local envenomSugg = Suggestion:New({spell = envenomSpell, primary = true})
  
  local context = Context:New({
    auras = {},
    cooldowns = {},
    timestamp = 0,
    power = 50,
    max_power = 150,
    combo_points = 0,
    max_combo_points = 5,
    health = 0,
    max_health = 1000,
    stealthy = false,
    combat = false,
    fight_summary = FightSummary:New({
      fight_start_time = 5,
      avg_player_dps = 20,
      avg_raid_dps = 20,
      cached_spell_contexts = {},
      predicted_time_to_kill_target_solo = 30,
      predicted_time_to_kill_target_raid = 30
    }),
    target_info = {}, 
    group_size = 0, 
    in_instance = false,
    boss_fight = false
  })
  return envenomSugg, context
end

RunTestByName('Suggestion can check requirements by context', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local envenomSugg, context = init_sugg_and_context()
  
  local meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.DO_NOT_SUGGEST, meetsReq) -- Not enabled!
end)

RunTestByName('Suggestion checks enabled requirement', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local envenomSugg, context = init_sugg_and_context()
  envenomSugg.enabled = true
  
  
  local meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
end)

RunTestByName('Suggestion checks energy requirement', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local envenomSugg, context = init_sugg_and_context()
  envenomSugg.enabled = true
  envenomSugg.checkEnergy = true
  envenomSugg.hasMinEnergy = true
  envenomSugg.minEnergy = 35
  context.power = 10
  
  local meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.DO_NOT_SUGGEST, meetsReq)
  
  context.power = 50
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
  
  envenomSugg, context = init_sugg_and_context()
  envenomSugg.enabled = true
  envenomSugg.checkEnergy = true
  envenomSugg.hasMaxEnergy = true
  envenomSugg.maxEnergy = 140
  context.power = 159
  context.max_power = 159
  
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.DO_NOT_SUGGEST, meetsReq)
  
  context.power = 139
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
end)

RunTestByName('Suggestion can decide to pool based on context', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local sugg, context = init_sugg_and_context()
  sugg.enabled = true
  sugg.checkEnergy = true
  sugg.hasMinEnergy = true
  sugg.minEnergy = 35
  sugg.poolEnergyIfLow = true
  context.power = 10
  
  local meetsReq = sugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.POOL_ENERGY, meetsReq)
  
  context.power = 50
  meetsReq = sugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
  
  sugg.hasMaxEnergy = true
  sugg.maxEnergy = 100
  
  meetsReq = sugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
  
  context.power = 110
  meetsReq = sugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.DO_NOT_SUGGEST, meetsReq)
end)

RunTestByName('Suggestion checks combo points requirement', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local envenomSugg, context = init_sugg_and_context()
  envenomSugg.enabled = true
  envenomSugg.hasMaxComboPoints = true
  envenomSugg.checkComboPoints = true
  envenomSugg.maxComboPoints = 2
  context.combo_points = 3
  
  local meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.DO_NOT_SUGGEST, meetsReq)
  
  context.combo_points = 2
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
end)

RunTestByName('Suggestion checks aura duration requirement', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  local someAura = Auras:New({
    name = 'An Aura',
    debugName = 'AnAura',
    aura_id = 13579,
    icon_id = 97531,
    target = 'player',
    max_duration = 15
  })
  
  local envenomSugg, context = init_sugg_and_context()
  envenomSugg:RegisterAura(someAura)
  envenomSugg.checkDurationOfAnAura = true
  envenomSugg.hasMinDurationOfAnAura = true
  envenomSugg.minDurationOfAnAura = 5
  envenomSugg.enabled = true
  
  local auraInfo = {
    name = 'An Aura', count = 1, duration = 15, expirationTime = 17, spellId = someAura.aura_id
  }
  context.timestamp = 15
  context.auras['player'] = { auraInfo }
  
  local meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.DO_NOT_SUGGEST, meetsReq)
  
  auraInfo.expirationTime = 30
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
  
  auraInfo.duration = 0
  auraInfo.expirationTime = context.timestamp - 1
  envenomSugg.minDurationOfAnAura = 0
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
end)

RunTestByName('Suggestion checks spell cooldown requirement', function()
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local someSpell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  })
  local spellInfo = {
    spellId = someSpell.spell_id,
    start = 0,
    duration = 15
  }
  
  local envenomSugg, context = init_sugg_and_context()
  envenomSugg.enabled = true
  envenomSugg:RegisterCooldown(someSpell)
  context.timestamp = 0
  table.insert(context.cooldowns, spellInfo)
  
  local meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
  
  envenomSugg.checkCooldownForASpell = true
  envenomSugg.hasMaxCooldownForASpell = true
  envenomSugg.maxCooldownForASpell = 5
  
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.DO_NOT_SUGGEST, meetsReq)
  
  context.timestamp = 10
  
  meetsReq = envenomSugg:MeetsRequirements(context, true)
  AssertEqual(SuggestionResult.SUGGEST, meetsReq)
end)

RunTestByName('Load TorpedoSkills', function()
  dofile('TorpedoSkills.lua')
  
  local TorpedoSkills = LibStub:GetLibrary('TorpedoSkills-1.0')
  AssertNotNil(TorpedoSkills)
end)

RunTestByName('Init TorpedoSkills', function()
  local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
  
  TestInitFunction(Skills, {
    name = 'Envenom',
    spell = {}
  })
end)

RunTestByName('Add suggestion to skill', function()
  local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local skill = Skills:New({ name = 'Some Skill', spell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  }) })
  
  skill:NewSuggestion(500, true)
  
  AssertEqual(1, #skill.suggestions)
end)

RunTestByName('Remove suggestion from skill', function()
  local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  })
  
  local skill = Skills:New({ name = 'Some Skill', spell = spell })
  skill:NewSuggestion(500, true)
  skill:NewSuggestion(499, false)
  
  AssertEqual(2, #skill.suggestions)
  
  skill:DropLowestPrioritySuggestion()
  
  AssertEqual(1, #skill.suggestions)
end)

RunTestByName('Register cooldown to skill propagates to suggestions', function()
  local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  })
  
  local skill = Skills:New({ name = 'Some Skill', spell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  }) })
  
  skill:NewSuggestion(500, true)
  
  AssertEqual(0, #skill.suggestions[1].cooldowns)
  skill:RegisterCooldown(spell)
  AssertEqual(1, #skill.suggestions[1].cooldowns)
  
  skill:NewSuggestion(499, true)
  AssertEqual(1, #skill.suggestions[1].cooldowns)
  AssertEqual(1, #skill.suggestions[2].cooldowns)
end)

RunTestByName('Register aura to skill propagates to suggestions', function()
  local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  
  local spell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  })
  
  local aura = Auras:New({
    name = 'An Aura',
    debugName = 'AnAura',
    aura_id = 13579,
    icon_id = 97531,
    target = 'player',
    max_duration = 15
  })
  
  local skill = Skills:New({ name = 'Some Skill', spell = spell })
  
  skill:NewSuggestion(500, true)
  
  AssertEqual(0, #skill.suggestions[1].auras)
  skill:RegisterAura(aura)
  AssertEqual(1, #skill.suggestions[1].auras)
  
  skill:NewSuggestion(499, true)
  
  AssertEqual(1, #skill.suggestions[1].auras)
  AssertEqual(1, #skill.suggestions[2].auras)
end)

RunTestByName('Create options from skill', function()
  local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
  
  local spell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  })
  
  local skill = Skills:New({name = 'Some Skill', spell = spell})
  
  -- Mock the suggestions
  
  skill.suggestions[1] = {
    CreateOptions = function(self, optionName, order)
      return {
        debugStr = 'Magical mock string',
        order = order
      }
    end,
    priority = 500
  }
  
  local fn = function() end
  local actual = skill:CreateOptions(2, fn, fn, fn, fn)
  local expected = {
    name = 'Some Skill',
    type = 'group',
    order = 2,
    args = {
      param1 = {
        name = Constants.ADD_NEW_SUGGESTION_NAME,
        desc = Constants.ADD_NEW_SUGGESTION_DESC,
        type = 'execute',
        width = 'full',
        func = fn,
        order = 1
      },
      param2 = {
        order = 2,
        name = Constants.DELETE_SKILL_NAME,
        desc = Constants.DELETE_SKILL_DESC,
        width = 'full',
        type = 'execute',
        hidden = fn,
        func = fn
      },
      param3 = {
        debugStr = 'Magical mock string',
        order = 3
      }
    }
  }
  AssertDeepEquals(expected, actual)
end)

RunTestByName('Rearrange order and create options from skill', function()
  local Skills = LibStub:GetLibrary('TorpedoSkills-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
  
  local spell = Spells:New({
    name = 'A Spell',
    debugName = 'ASpell',
    spell_id = 24680,
    icon_id = 08642,
    cooldown = 30
  })
  
  local skill = Skills:New({name = 'Some Skill', spell = spell})
  
  -- Mock the suggestions
  
  skill.suggestions[1] = {
    CreateOptions = function(self, optionName, order)
      return {
        debugStr = 'Magical mock string',
        order = order
      }
    end,
    priority = 499,
    primary = true
  }
  
  skill.suggestions[2] = {
    CreateOptions = function(self, optionName, order)
      return {
        debugStr = 'Magical mock string 2',
        order = order
      }
    end,
    priority = 500,
    primary = true
  }
  
  local fn = function() end
  local actual = skill:CreateOptions(2, fn, fn, fn, fn)
  local expected = {
    name = 'Some Skill',
    type = 'group',
    order = 2,
    args = {
      param1 = {
        order = 1,
        name = Constants.ADD_NEW_SUGGESTION_NAME,
        desc = Constants.ADD_NEW_SUGGESTION_DESC,
        type = 'execute',
        width = 'full',
        func = fn
      },
      param2 = {
        order = 2,
        name = Constants.DELETE_SKILL_NAME,
        desc = Constants.DELETE_SKILL_DESC,
        width = 'full',
        type = 'execute',
        hidden = fn,
        func = fn
      },
      param3 = {
        debugStr = 'Magical mock string 2',
        order = 3
      },
      param4 = {
        debugStr = 'Magical mock string',
        order = 4
      }
    }
  }
  AssertDeepEquals(expected, actual)
  
  skill.suggestions[1].priority = 501
  local tmp = expected.args.param3
  expected.args.param3 = expected.args.param4
  expected.args.param4 = tmp
  expected.args.param3.order = 3
  expected.args.param4.order = 4
  
  actual = skill:CreateOptions(2, fn, fn, fn, fn)
  AssertDeepEquals(expected, actual)
end)

RunTestByName('Load specialization', function()
  dofile('TorpedoSpecializations.lua')
  
  local TorpedoSpecializations = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  AssertNotNil(TorpedoSpecializations)
end)

RunTestByName('Init specialization', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  
  TestInitFunction(Specs, { name = 'Subtlety', specialization_id = 5 })
end)

RunTestByName('Add skills to specializations', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  local spell2 = Spells:New({
    name = 'Backstab',
    debugName = 'Backstab',
    spell_id = 2,
    icon_id = 3
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  
  AssertEqual(1, #spec.skills)
  AssertEqual(0, #spec.skills[1].auras)
  AssertEqual(0, #spec.skills[1].cooldowns)
  AssertEqual('Nightblade', spec.skills[1].name)
  
  AssertError(function()
    spec:AddSkill(spell)
  end)
  
  spec:AddSkill(spell2)
  
  AssertEqual(2, #spec.skills)
end)

RunTestByName('Specialization can fetch skill by debug name', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  local spell2 = Spells:New({
    name = 'Backstab',
    debugName = 'Backstab',
    spell_id = 2,
    icon_id = 3
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  spec:AddSkill(spell2)
  
  AssertEqual(spell.name, spec:GetSkillByDebugName('Nightblade').spell.name)
  AssertEqual(spell2.spell_id, spec:GetSkillByDebugName('Backstab').spell.spell_id)
end)

RunTestByName('Adding aura to specialization propagates to skills', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  local spell2 = Spells:New({
    name = 'Backstab',
    debugName = 'Backstab',
    spell_id = 2,
    icon_id = 3
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  AssertEqual(0, #spec.skills[1].auras)
  
  spec:RegisterAura(Auras:New({ 
    name = 'Shadows of Death',
    debugName = 'ShadowsOfDeath',
    aura_id = 12345,
    icon_id = 54321,
    target = 'player',
    max_duration = 45
  }))
  
  AssertEqual(1, #spec.skills[1].auras)
  
  spec:AddSkill(spell2)
  
  AssertEqual(1, #spec.skills[1].auras)
  AssertEqual(1, #spec.skills[2].auras)
end)

RunTestByName('Adding cooldown to specialization propagates to skills', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  local spell2 = Spells:New({
    name = 'Backstab',
    debugName = 'Backstab',
    spell_id = 2,
    icon_id = 3
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  
  spec:RegisterCooldown(Spells:New({
    name = 'Shadow Dance',
    debugName = 'ShadowDance',
    spell_id = 4,
    icon_id = 5
  }))
  
  AssertEqual(1, #spec.skills[1].cooldowns)
  
  spec:AddSkill(spell2)
  
  AssertEqual(1, #spec.skills[1].cooldowns)
  AssertEqual(1, #spec.skills[2].cooldowns)
end)

RunTestByName('Specialization can check for priority conflicts', function()
  --[[
    The idea here is that when a change occurs due to a configuration,
    the appropriate validation is called on the specialization, which 
    will return either true (no errors), or false, errorString
  ]]
  
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  
  spec.skills[1]:NewSuggestion(spec:NewPriority(), true)
  spec.skills[1]:NewSuggestion(spec:NewPriority(), true)
  
  AssertNotEqual(spec.skills[1].suggestions[1].priority, spec.skills[1].suggestions[2].priority)
  
  local succ, err = spec.validator(spec.skills[1].suggestions[1], spec.skills[1].suggestions[1], 'priority', spec.skills[1].suggestions[2].priority)
  
  AssertEqual(false, succ)
  AssertNotEqual(spec.skills[1].suggestions[1].priority, spec.skills[1].suggestions[2].priority)
  
  succ, err = spec.validator(spec.skills[1].suggestions[1], spec.skills[1].suggestions[1], 'priority', 5)
  
  AssertEqual(true, succ)
  AssertNil(err)
  AssertEqual(5, spec.skills[1].suggestions[1].priority)
end)

RunTestByName('Specialization can be serialized and unserialized losslessly', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  
  spec.skills[1]:NewSuggestion(spec:NewPriority(), true)
  spec.skills[1]:NewSuggestion(spec:NewPriority(), true)
  
  spec:RegisterCooldown(Spells:New({
    name = 'Shadows of Death',
    debugName = 'ShadowsOfDeath',
    spell_id = 3,
    icon_id = 4,
    cooldown = 45
  }))
  
  local serialized = spec:Serializable()
  
  local check_for_non_primitives = function(self, arr)
    if type(arr) ~= 'table' then return end
    
    for i=1, #arr do 
      local eleType = type(arr[i])
      
      AssertNotEqual('function', eleType)
      AssertNotEqual('userdata', eleType)
      AssertNotEqual('thread', eleType)
      
      if eleType == 'table' then 
        self(self, arr[i])
      end
    end
  end
  
  check_for_non_primitives(check_for_non_primitives, serialized)
  
  local unserialized = Specs:Unserialize(serialized)
  
  AssertEqual(1, #unserialized.skills)
  AssertEqual(2, #unserialized.skills[1].suggestions)
  AssertEqual(1, #unserialized.skills[1].suggestions[1].cooldowns)
  
  local reser = unserialized:Serializable()
  
  AssertDeepEquals(serialized, reser)
end)

RunTestByName('Specialization can decide on a primary spell based on context', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Context = LibStub:GetLibrary('TorpedoContext-1.0')
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  
  spec.skills[1]:NewSuggestion(spec:NewPriority(), true) -- priority 500 
  spec.skills[1]:NewSuggestion(spec:NewPriority(), true) -- priority 499
  
  AssertEqual(500, spec.skills[1].suggestions[1].priority)
  AssertEqual(499, spec.skills[1].suggestions[2].priority)
  
  local sugg1 = spec.skills[1].suggestions[1]
  sugg1.enabled = true
  sugg1.checkEnergy = true
  sugg1.hasMinEnergy = true
  sugg1.minEnergy = 35
  
  local sugg2 = spec.skills[1].suggestions[2]
  sugg2.enabled = true
  
  local context = Context:New({
    auras = {},
    cooldowns = {},
    timestamp = 0,
    power = 50,
    max_power = 150,
    combo_points = 0,
    max_combo_points = 5,
    health = 0,
    max_health = 1000,
    stealthy = false,
    combat = false,
    fight_summary = {},
    target_info = {}, 
    group_size = 0, 
    in_instance = false,
    boss_fight = false, 
    group_size = 0, 
    in_instance = false,
    boss_fight = false
  })
  
  local desSugg, resultType = spec:GetSuggestion(context, true)
  AssertDeepEquals(sugg1, desSugg)
  AssertEqual(resultType, SuggestionResult.SUGGEST)
  
  context.power = 30
  desSugg, resultType = spec:GetSuggestion(context, true)
  AssertDeepEquals(sugg2, desSugg)
  AssertEqual(resultType, SuggestionResult.SUGGEST)
  
  sugg1.poolEnergyIfLow = true
  
  desSugg, resultType = spec:GetSuggestion(context, true)
  AssertDeepEquals(sugg1, desSugg)
  AssertEqual(resultType, SuggestionResult.POOL_ENERGY)
end)

RunTestByName('Specialization can decide on a secondary spell based on context', function()

end)

RunTestByName('Specialization can create options', function()
  local Specs = LibStub:GetLibrary('TorpedoSpecializations-1.0')
  local Auras = LibStub:GetLibrary('TorpedoAuras-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local Context = LibStub:GetLibrary('TorpedoContext-1.0')
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
  
  local spell = Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  })
  
  local spec = Specs:New({ name = 'Subtlety', specialization_id = 5 })
  spec:AddSkill(spell)
  
  spec.skills[1].suggestions[1] = {
    CreateOptions = function(self, optionName, order)
      return {
        order = order,
        name = optionName,
        someStr = 'Magical string 1'
      }
    end
  }
  
  local fn = function() end
  local options = spec:CreateOptions(2, fn)
  local expected = {
    name = 'Subtlety',
    type = 'group',
    order = 2,
    args = {
      param1 = {
        name = Constants.TOGGLE_ADVANCED_FEATURES_NAME,
        desc = Constants.TOGGLE_ADVANCED_FEATURES_DESC,
        order = 1,
        type = 'toggle',
        get = fn,
        set = fn,
        width = 'full'
      },
      param2 = { }, -- advanced features; add skill
      param3 = { }, -- advanced features; add cooldown
      param4 = { }, -- advanced features; add aura
      param5 = {
        order = 5,
        name = 'Nightblade',
        type = 'group',
        args = {
          param1 = {
            order = 1,
            name = Constants.ADD_NEW_SUGGESTION_NAME,
            desc = Constants.ADD_NEW_SUGGESTION_DESC,
            type = 'execute',
            width = 'full',
            func = fn
          },
          param2 = {
            order = 2,
            name = Constants.DELETE_SKILL_NAME,
            desc = Constants.DELETE_SKILL_DESC,
            width = 'full',
            type = 'execute',
            hidden = fn,
            func = fn
          },
          param3 = {
            order = 3,
            someStr = 'Magical string 1',
            name = 'Option 1'
          }
        }
      }
    }
  }
  options.args.param2 = {}
  options.args.param3 = {}
  options.args.param4 = {}
  AssertDeepEquals(expected, options)
end)

RunTestByName('Load gui settings', function()
  dofile('TorpedoGUISettings.lua')
  
  local GUISettings = LibStub:GetLibrary('TorpedoGUISettings-1.0')
  AssertNotNil(GUISettings)
end)

RunTestByName('Load profile', function()
  dofile('TorpedoProfiles.lua')
  
  local TorpedoProfiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  AssertNotNil(TorpedoProfiles)
end)

RunTestByName('Init profile', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  
  TestInitFunction(Profiles, { name = 'Default' })
end)

RunTestByName('Profile can add new specialization', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  
  local profile = Profiles:New({ name = 'Default' })
  AssertNotNil(profile.specializations)
  AssertEqual(0, #profile.specializations)
  
  profile:NewSpecialization('Subtlety', 5)
  AssertEqual(1, #profile.specializations)
  AssertEqual('Subtlety', profile.specializations[1].name)
end)

RunTestByName('Profile can be serialized and unserialized losslessly', function() 
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  
  local profile = Profiles:New({ name = 'Default' })
  
  profile:NewSpecialization('Subtlety', 5)
  
  local serialized = profile:Serializable()
  local unser = Profiles:Unserialize(serialized)
  local reser = unser:Serializable()
  
  AssertDeepEquals(serialized, reser)
  AssertEqual(1, #unser.specializations)
  AssertEqual('Subtlety', unser.specializations[1].name)
end)

RunTestByName('Profile can set active specialization', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  
  local profile = Profiles:New({ name = 'Default' })
  
  profile:NewSpecialization('Subtlety', 5)
  profile:NewSpecialization('Assassination', 6)
  
  profile:SetActiveSpecialization(6)
  AssertEqual('Assassination', profile.specializations[profile.active_spec_index].name)
end)

RunTestByName('Profile can decide on a primary spell based on context', function()
  local Context = LibStub:GetLibrary('TorpedoContext-1.0')
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local FightSummary = LibStub:GetLibrary('TorpedoFightSummary-1.0')
  
  local profile = Profiles:New({ name = 'Default' })
  
  profile:NewSpecialization('Subtlety', 5)
  profile:NewSpecialization('Assassination', 6)
  
  profile.specializations[1]:AddSkill(Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  }))
  profile.specializations[1].skills[1]:NewSuggestion(profile.specializations[1]:NewPriority(), true)
  
  profile.specializations[2]:AddSkill(Spells:New({
    name = 'Envenom',
    debugName = 'Envenom',
    spell_id = 1,
    icon_id = 2
  }))
  profile.specializations[2].skills[1]:NewSuggestion(profile.specializations[2]:NewPriority(), true)
  profile.specializations[2].skills[1]:NewSuggestion(profile.specializations[2]:NewPriority(), true)
  
  profile.specializations[2]:AddSkill(Spells:New({
    name = 'Mutilate',
    debugName = 'Mutilate',
    spell_id = 2,
    icon_id = 3
  }))
  profile.specializations[2].skills[2]:NewSuggestion(profile.specializations[2]:NewPriority(), true)
  profile.specializations[2].skills[2]:NewSuggestion(profile.specializations[2]:NewPriority(), true)
  
  profile.specializations[1].skills[1].suggestions[1].enabled = true
  profile.specializations[2].skills[1].suggestions[1].enabled = true
  profile.specializations[2].skills[1].suggestions[2].enabled = true
  profile.specializations[2].skills[2].suggestions[1].enabled = true
  profile.specializations[2].skills[2].suggestions[2].enabled = true
  profile.specializations[2].skills[2].suggestions[2].priority = 1000 -- very high
  profile.specializations[2].skills[2].suggestions[2].checkEnergy = true
  profile.specializations[2].skills[2].suggestions[2].hasMinEnergy = true
  profile.specializations[2].skills[2].suggestions[2].minEnergy = 50
  
  profile:SetActiveSpecialization(5)
  
  local context = Context:New({
    auras = {},
    cooldowns = {},
    timestamp = 0,
    power = 60,
    max_power = 150,
    combo_points = 0,
    max_combo_points = 5,
    health = 0,
    max_health = 1000,
    stealthy = false,
    combat = false,
    fight_summary = FightSummary:New({    
      fight_start_time = 5,
      avg_player_dps = 20,
      avg_raid_dps = 25,
      cached_spell_contexts = {},
      predicted_time_to_kill_target_solo = 5,
      predicted_time_to_kill_target_raid = 5
    }),
    target_info = {}, 
    group_size = 0, 
    in_instance = false,
    boss_fight = false
  })
  
  local desSugg, resultType = profile:GetSuggestion(context, true)
  AssertDeepEquals(profile.specializations[1].skills[1].suggestions[1], desSugg)
  AssertEqual(SuggestionResult.SUGGEST, resultType)
  
  profile:SetActiveSpecialization(6)
  desSugg, resultType = profile:GetSuggestion(context, true)
  AssertDeepEquals(profile.specializations[2].skills[2].suggestions[2], desSugg)
  AssertEqual(SuggestionResult.SUGGEST, resultType)
  
  context.power = 40
  desSugg, resultType = profile:GetSuggestion(context, true)
  AssertDeepEquals(profile.specializations[2].skills[1].suggestions[1], desSugg)
  AssertEqual(SuggestionResult.SUGGEST, resultType)
  
  profile.specializations[2].skills[2].suggestions[2].poolEnergyIfLow = true
  desSugg, resultType = profile:GetSuggestion(context, true)
  AssertDeepEquals(profile.specializations[2].skills[2].suggestions[2], desSugg)
  AssertEqual(SuggestionResult.POOL_ENERGY, resultType)
end)

RunTestByName('Profile can decide on a secondary spell based on context', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  

end)

RunTestByName('Profile can create options', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
  
  local profile = Profiles:New({ name = 'Default' })
  profile.specializations[1] = {
    CreateOptions = function(self, order)
      return {
        order = order,
        someStr = 'Magical string'
      }
    end
  }
  
  local fn = function() end
  local actual = profile:CreateOptions(1, fn, fn, fn, fn, fn, fn, fn)
  AssertType('table', actual)
end)

RunTestByName('Load config', function()
  dofile('TorpedoConfigs.lua')
  
  local TorpedoConfigs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  AssertNotNil(TorpedoConfigs)
end)

RunTestByName('Init config', function() 
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  
  TestInitFunction(Configs, {})
end)

RunTestByName('Add profile to config with defaults', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  
  local config = Configs:New({})
  profile = Profiles:New({ name = 'Default' })
  
  config:SetDefaultProfile(profile)
  
  AssertEqual(0, #config.profiles)
  config:NewProfile('Custom')
  AssertEqual(1, #config.profiles)
  AssertEqual('Custom', config.profiles[1].name)
end)

RunTestByName('Remove profile from config', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  
  local config = Configs:New({})
  profile = Profiles:New({ name = 'Default' })
  
  config:SetDefaultProfile(profile)
  config:NewProfile('Custom')
  AssertEqual(1, #config.profiles)
  config:RemoveProfileByIndex(1)
  AssertEqual(0, #config.profiles)
end)

RunTestByName('Config can be serialized and unserialized losslessly', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  
  local config = Configs:New({})
  profile = Profiles:New({ name = 'Default' })
  
  config:SetDefaultProfile(profile)
  
  config:NewProfile('Custom')
  
  local ser = config:Serializable()
  local unser = Configs:Unserialize(ser)
  local reser = unser:Serializable()
  
  AssertDeepEquals(ser, reser)
  AssertEqual(1, #unser.profiles)
end)

RunTestByName('Config can set active profile', function() 
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  
  local config = Configs:New({})
  profile = Profiles:New({ name = 'Default' })
  
  config:SetDefaultProfile(profile)
  
  config:NewProfile('Custom')
  config:NewProfile('Custom 2')
  
  config:SetActiveProfile('Custom 2')
  AssertEqual(2, config.active_profile_index)
end)

RunTestByName('Config disallows name collision', function() 
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  
  local config = Configs:New({})
  profile = Profiles:New({ name = 'Default' })
  
  config:SetDefaultProfile(profile)
  
  config:NewProfile('Custom')
  config:NewProfile('Custom 2')
  
  AssertError(function()
    config:NewProfile('Custom 2')
  end)
end)

RunTestByName('Config can decide on specialization based on context', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  
  local config = Configs:New({})
  profile = Profiles:New({ name = 'Default' })
  profile:NewSpecialization('Subtlety', 5)
  profile:NewSpecialization('Assassination', 6)
  config:SetDefaultProfile(profile)
  
  config:NewProfile('Custom')
  config:SetActiveProfile('Custom')
  config:SetActiveSpecialization(5)
  
  AssertEqual(5, config.active_spec_id)
  
  config:NewProfile('Custom 2')
  config:SetActiveProfile('Custom 2')
  AssertEqual(5, config.active_spec_id)
  AssertEqual(1, config.profiles[2].active_spec_index)
end)

RunTestByName('Config can decide on a primary ability', function()
  local Profiles = LibStub:GetLibrary('TorpedoProfiles-1.0')
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  local Spells = LibStub:GetLibrary('TorpedoSpells-1.0')
  local SuggestionResult = LibStub:GetLibrary('TorpedoSuggestionResult-1.0')
  local Context = LibStub:GetLibrary('TorpedoContext-1.0')
  
  local config = Configs:New({})
  profile = Profiles:New({ name = 'Default' })
  profile:NewSpecialization('Subtlety', 5)
  profile.specializations[1]:AddSkill(Spells:New({
    name = 'Nightblade',
    debugName = 'Nightblade',
    spell_id = 1,
    icon_id = 2
  }))
  profile.specializations[1].skills[1]:NewSuggestion(profile.specializations[1]:NewPriority(), true)
  profile.specializations[1].skills[1]:NewSuggestion(profile.specializations[1]:NewPriority(), true)
  profile.specializations[1].skills[1].suggestions[2].enabled = true
  profile.specializations[1]:AddSkill(Spells:New({
    name = 'Backstab',
    debugName = 'Backstab',
    spell_id = 3,
    icon_id = 4
  }))
  profile.specializations[1].skills[2]:NewSuggestion(profile.specializations[1]:NewPriority(), true)
  
  config:SetDefaultProfile(profile)
  
  config:NewProfile('Custom')
  config:SetActiveProfile('Custom')
  config:SetActiveSpecialization(5)
  
  local context = Context:New({
    auras = {},
    cooldowns = {},
    timestamp = 0,
    power = 60,
    max_power = 150,
    combo_points = 0,
    max_combo_points = 5,
    health = 0,
    max_health = 1000,
    stealthy = false,
    combat = false,
    fight_summary = {},
    target_info = {}, 
    group_size = 0, 
    in_instance = false,
    boss_fight = false
  })
  
  local sugg, suggRes = config:GetSuggestion(context, true)
  AssertDeepEquals(profile.specializations[1].skills[1].suggestions[2], sugg)
  AssertEqual(SuggestionResult.SUGGEST, suggRes)
end)

RunTestByName('Config can build options', function()
  local Configs = LibStub:GetLibrary('TorpedoConfigs-1.0')
  local Constants = LibStub:GetLibrary('TorpedoConstants-1.0')
  
  local config = Configs:New({})
  config.profiles[1] = {
    CreateOptions = function(self, order)
      return {
        order = order,
        magicalStr = 'Magical string 1'
      }
    end
  }
  
  local fn = function() end
  local actual = config:CreateOptions(fn)
  local expected = {
    name = 'Torpedo',
    type = 'group',
    args = {
      param1 = {
        name = Constants.ADD_NEW_PROFILE_NAME,
        desc = Constants.ADD_NEW_PROFILE_DESC,
        type = 'execute',
        width = 'full',
        order = 1,
        func = fn
      },
      param2 = {
        order = 2,
        magicalStr = 'Magical string 1'
      }
    }
  }
  
  AssertDeepEquals(expected, actual)
end)

RunTestByName('Load gui', function() 
  dofile('TorpedoGUI.lua')
  
  local TorpedoGUI = LibStub:GetLibrary('TorpedoGUI-1.0')
  AssertNotNil(TorpedoGUI)
end)

RunTestByName('Load fight analyzer', function()
  dofile('TorpedoFightAnalyzer.lua')
  
  local TorpedoFightAnalyzer = LibStub:GetLibrary('TorpedoFightAnalyzer-1.0')
  AssertNotNil(TorpedoFightAnalyzer)
end)


RunTestByName('Load main', function()
  local aceAddon = LibStub:NewLibrary('AceAddon-3.0', 1)
  aceAddon.NewAddon = function() 
    return LibStub:NewLibrary('Torpedo', 1) 
  end
  
  dofile('Torpedo.lua')
end)