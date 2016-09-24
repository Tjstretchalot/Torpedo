local MAJOR, MINOR = 'TorpedoTimestampTristate-1.0', 1
local TorpedoTimestampTristate = LibStub:NewLibrary(MAJOR, MINOR)

if not TorpedoTimestampTristate then return end

TorpedoTimestampTristate.USED_BEFORE = { debug_value = 'used_before', display_value = nil, display_name = 'Used before' }
TorpedoTimestampTristate.USED_AFTER = { debug_value = 'used_after', display_value = true, display_name = 'Used after' }
TorpedoTimestampTristate.DO_NOT_CHECK = { debug_value = 'do_not_check', display_value = false, display_name = 'Do not check' }