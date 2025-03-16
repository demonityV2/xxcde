local modules = {
    ["Character"] = {},
}
--
for _, v in pairs(getgc(true)) do
    if typeof(v) == "function" and islclosure(v) then
        local info = debug.getinfo(v)
        local name = string.match(info.short_src, "%.([%w_]+)$")

        if name and modules[name] and info.name ~= nil then
            modules[name][info.name] = info.func
        end
    end
end
getgenv().Novas = {jumpshoot = false}
local JS = debug.getupvalues(modules.Character.updateCharacter)
--
getfenv(1).old = hookfunction(JS[22].IsGrounded, function(...)
if Novas.jumpshoot then
    debug.setupvalue(getfenv(1).old, 1, true)
end
    return getfenv(1).old(...)
end)
