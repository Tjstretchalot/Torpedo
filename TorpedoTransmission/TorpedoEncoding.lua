--[[
  Converts text into and out of a Base64 encoding. This class consists entirely of static functions.
]]

local Utils = LibStub:GetLibrary('TorpedoUtils-1.0')
local StringBuffer = LibStub:GetLibrary('TorpedoStringBuffer-1.0')

local MAJOR, MINOR = 'TorpedoEncoding-1.0', 1
local TorpedoEncoding = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoEncoding then return end

TorpedoEncoding.ENCRYPT_CHARACTER_SET = {[0]='A',[1]='B',[2]='C',[3]='D',[4]='E',[5]='F',[6]='G',[7]='H',[8]='I',[9]='J',[10]='K',[11]='L',[12]='M',[13]='N',[14]='O',[15]='P',[16]='Q',[17]='R',[18]='S',[19]='T',[20]='U',[21]='V',[22]='W',[23]='X',[24]='Y',[25]='Z',[26]='a',[27]='b',[28]='c',[29]='d',[30]='e',[31]='f',[32]='g',[33]='h',[34]='i',[35]='j',[36]='k',[37]='l',[38]='m',[39]='n',[40]='o',[41]='p',[42]='q',[43]='r',[44]='s',[45]='t',[46]='u',[47]='v',[48]='w',[49]='x',[50]='y',[51]='z',[52]='0',[53]='1',[54]='2',[55]='3',[56]='4',[57]='5',[58]='6',[59]='7',[60]='8',[61]='9',[62]='-',[63]='_', [64] = '='}

TorpedoEncoding.DECRYPT_CHARACTER_SET = {['A']=0,['B']=1,['C']=2,['D']=3,['E']=4,['F']=5,['G']=6,['H']=7,['I']=8,['J']=9,['K']=10,['L']=11,['M']=12,['N']=13,['O']=14,['P']=15,['Q']=16,['R']=17,['S']=18,['T']=19,['U']=20,['V']=21,['W']=22,['X']=23,['Y']=24,['Z']=25,['a']=26,['b']=27,['c']=28,['d']=29,['e']=30,['f']=31,['g']=32,['h']=33,['i']=34,['j']=35,['k']=36,['l']=37,['m']=38,['n']=39,['o']=40,['p']=41,['q']=42,['r']=43,['s']=44,['t']=45,['u']=46,['v']=47,['w']=48,['x']=49,['y']=50,['z']=51,['0']=52,['1']=53,['2']=54,['3']=55,['4']=56,['5']=57,['6']=58,['7']=59,['8']=60,['9']=61,['-']=62,['_']=63,['=']=nil}

--[[
  Returns an array of strings, where each string has less than or equal to 
  the specified maximum characters per line, and each character is a 
  valid ASCII character. The result may be decoded using 
  TorpedoEncoding:Decode(encodedLines).
  
  @param str a string
  @param maxCharsPerLine maximum characters per line
  @return table of strings
]]
function TorpedoEncoding:Encode(str, maxCharsPerLine)
  local currentDataInd = 1
  local currentData = { 0, 0, 0 }
  local finishedLines = {}
  local currentResultBuffer = StringBuffer:New()
  
  local currentLineLength = 0
  local append = function(num)
    local ch = TorpedoEncoding.ENCRYPT_CHARACTER_SET[num]
    
    if currentLineLength == maxCharsPerLine then 
      finishedLines[#finishedLines + 1] = currentResultBuffer:BuildString()
      currentResultBuffer = StringBuffer:New()
      currentLineLength = 0
    end
    
    currentResultBuffer:Append(ch)
    
    currentLineLength = currentLineLength + 1
  end
  
  for i=1, #str do 
    currentData[currentDataInd] = string.byte(str, i)
    
    currentDataInd = currentDataInd + 1
    if currentDataInd == 4 then 
      local one = Utils:rsh(currentData[1], 2) -- first 6 bits of the first 
      local two = Utils:lor(Utils:lsh(currentData[1] % 4, 4), Utils:rsh(currentData[2], 4)) -- last 2 bits of the first followed by the first 4 bits of the second
      local three = Utils:lor(Utils:lsh(currentData[2] % 16, 2), Utils:rsh(currentData[3], 6)) -- Last 4 bits of the second followed by the first 2 bits of the third
      local four = currentData[3] % 64 -- last 6 bits of the fourth
      
      append(one)
      append(two)
      append(three)
      append(four)
      currentDataInd = 1
    end
  end
  
  if currentDataInd == 2 then 
    -- We have 8 bits leftover
    local one = Utils:rsh(currentData[1], 2) -- first 6 bits
    local two = Utils:lsh(currentData[1] % 4, 4) -- last 2 bits and 4 bits of padding
    
    append(one)
    append(two)
    append(64) -- each corresponds to 2 bits of padding
    append(64)
  elseif currentDataInd == 3 then 
    -- We have 16 bits leftover
    local one = Utils:rsh(currentData[1], 2) -- first 6 bits of the first
    local two = Utils:lor(Utils:lsh(currentData[1] % 4, 4), Utils:rsh(currentData[2], 4)) -- last 2 bits of the first, first 4 bits of the second
    local three = Utils:lsh(currentData[2] % 16, 2) -- Last 4 bits of the second, 2 bits of padding
    
    append(one)
    append(two)
    append(three)
    append(64) -- 2 bits of padding
  end
  
  
  if currentLineLength > 0 then 
    finishedLines[#finishedLines + 1] = currentResultBuffer:BuildString()
  end
  
  return finishedLines
end

--[[
  Decodes the specified table of lines, that match the format 
  exported by TorpedoEncoding.
  
  @param encodedLines the encoded lines
  @return the string that was encoded
]]
function TorpedoEncoding:Decode(encodedLines)
  local currentLineIndex = 1
  local currentLine = encodedLines[currentLineIndex]
  
  local currentResultBuffer = StringBuffer:New()
  
  local currentData = {0, 0, 0, 0}
  local indexInLine = 1
  local outOfData = false
  while not outOfData do 
    for j=1, 4 do 
      if outOfData then 
        error('Malformed string', 2)
      end
      
      currentData[j] = TorpedoEncoding.DECRYPT_CHARACTER_SET[string.sub(currentLine, indexInLine, indexInLine)]
      
      indexInLine = indexInLine + 1
      if indexInLine > string.len(currentLine) then 
        if currentLineIndex < #encodedLines then 
          indexInLine = 1
          currentLineIndex = currentLineIndex + 1
          currentLine = encodedLines[currentLineIndex]
        else
          outOfData = true
        end
      end
    end
    
    local one = Utils:lor(Utils:lsh(currentData[1], 2), Utils:rsh(currentData[2], 4)) -- first 6 bits of the first and the first 2 bits of the second 
    currentResultBuffer:Append(string.char(one))
    if currentData[3] then 
      -- 2 or less bits of padding
      local two = Utils:lor(Utils:lsh(currentData[2], 4), Utils:rsh(currentData[3], 2)) -- last 4 bits of the second and first 4 bits of the third
      currentResultBuffer:Append(string.char(two))
      
      if currentData[4] then
        -- No padding
        
        local three = Utils:lor(Utils:lsh(currentData[3], 6) % 192, currentData[4]) -- Last 2 bits of the third and the first 6 bits of the 4th
        currentResultBuffer:Append(string.char(three))
      end
    end
  end
  
  return currentResultBuffer:BuildString()
end