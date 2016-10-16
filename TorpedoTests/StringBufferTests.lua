--[[
  Contains tests for TorpedoStringBuffer.lua
]]

RunTestByName('StringBufferTests.lua in a good environment', function()
  local StringBuffer = LibStub:GetLibrary('TorpedoStringBuffer-1.0')
  
  AssertNotNil(StringBuffer, 'TorpedoStringBuffer should be loaded before StringBufferTests')
end)

RunTestByName('String buffers can be created', function()
  local StringBuffer = LibStub:GetLibrary('TorpedoStringBuffer-1.0')
  
  local aNewBuffer = StringBuffer:New()
  AssertNotNil(aNewBuffer)
  
  local aBetterBuffer = StringBuffer:New('starting string')
  AssertNotNil(aBetterBuffer)
end)

RunTestByName('String buffers can be built', function()
  local StringBuffer = LibStub:GetLibrary('TorpedoStringBuffer-1.0')
  
  local aBuffer = StringBuffer:New()
  local result = aBuffer:BuildString()
  
  AssertEqual('', result, 'Expected an empty string from an empty buffer')
  
  aBuffer = StringBuffer:New('starting string')
  result = aBuffer:BuildString()
  
  AssertEqual('starting string', result, 'Expected the same as my starting string')
end)

RunTestByName('String buffers can be appended and built', function()
  local StringBuffer = LibStub:GetLibrary('TorpedoStringBuffer-1.0')
  
  
  local someStrings = {
    "Hi!  ",
    "This is a string.  ",
    "Doing some appending now aren't I.  ",
    "Man, I sure hope some combinining is happening.  ",
    "This is a really poor test.  ",
    "This is really only a performance improvement with really long strings, which this isn\'t..."
  }
  
  local regularConcat = ''
  local aBuffer = StringBuffer:New()
  
  for i=1, #someStrings do 
    local str = someStrings[i]
    regularConcat = regularConcat .. str
    aBuffer:Append(str)
  end
  
  local result = aBuffer:BuildString()
  AssertEqual(regularConcat, result)
end)