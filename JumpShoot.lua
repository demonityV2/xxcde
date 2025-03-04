local novas = {jumpshoot = false}
local JS = debug.getupvalues(modules.Character.updateCharacter)
--
getfenv(1).old = hookfunction(JS[22].IsGrounded, function(...)
if novas.jumpshoot then
    debug.setupvalue(getfenv(1).old, 1, true)
end
    return getfenv(1).old(...)
end)
