--[[
  Contains tests for TorpedoEncoding.lua
]]

RunTestByName('EncodingTests.lua in a good environment', function()
  local encoding = LibStub:GetLibrary('TorpedoEncoding-1.0')
  
  AssertNotNil(encoding, 'TorpedoEncoding should be loaded before EncodingTests')
end)

RunTestByName('Encode and decode prebuilt tests', function()
  local Encoding = LibStub:GetLibrary('TorpedoEncoding-1.0')
  
  local testStrings = {
    'A simple string',                              -- 1
    'A string with a spécial character',            -- 2
    [[A long string that has no special characters,
    but does have some line breaks that will 
    need to be accounted for]],                     -- 3
    [==[
      [
        key = "value",
        [[anotherKey]] = "another value"
      ]
    ]==]                                            -- 4
  }
  
  local testLengths = {
    5,     -- 1
    15,    -- 2
    200    -- 3
  }
  
  for strInd, str in ipairs(testStrings) do 
    for lenInd, length in ipairs(testLengths) do 
      local lineAndLengthStr = 'strInd=' .. tostring(strInd) .. ', lenInd = ' .. tostring(lenInd) .. ', length = ' .. tostring(length)
      local encoded = Encoding:Encode(str, length)
      
      AssertType('table', encoded, 'Invalid Encode return type for ' .. lineAndLengthStr)
      
      for encInd, encLine in ipairs(encoded) do 
        local encLineInfo = 'encInd=' .. tostring(encInd) .. ', ' .. lineAndLengthStr .. '\nencLine = ' .. tostring(encLine)
        AssertType('string', encLine, 'Invalid line for ' .. encLineInfo)
        
        AssertLessThan(length + 1, string.len(encLine), 'Invalid line length (' .. string.len(encLine) .. ') for ' .. encLineInfo)
      end
      
      local decoded = Encoding:Decode(encoded)
      
      AssertType('string', decoded, 'Invalid Decode return type for ' .. lineAndLengthStr)
      
      AssertEqual(str, decoded, 'Decoded does not match original for ' .. lineAndLengthStr)
    end
  end
end)

RunTestByName('Implementation specific encoding test', function()
  -- This should probably just be removed if this fails and the others succeed
  
  local Encoding = LibStub:GetLibrary('TorpedoEncoding-1.0')
  
  local expectedOutputs = {
    {'A', 'QQ=='},
    {'B', 'Qg=='},
    {'CD', 'Q0Q='},
    {'EF', 'RUY='},
    {'GHI', 'R0hJ'}
  }
  
  for ind, inpOutPair in ipairs(expectedOutputs) do 
    local input = inpOutPair[1]
    local output = inpOutPair[2]
    
    local actual = Encoding:Encode(input, 1000)[1]
    AssertEqual(output, actual, input)
  end
end)