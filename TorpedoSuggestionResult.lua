local MAJOR, MINOR = 'TorpedoSuggestionResult-1.0', 1
local TorpedoSuggestionResult = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoSuggestionResult then return end

TorpedoSuggestionResult.DO_NOT_SUGGEST = 128
TorpedoSuggestionResult.POOL_ENERGY = 256
TorpedoSuggestionResult.SUGGEST = 512