local ReplicatedStorage = game:GetService("ReplicatedStorage")

local REGunRemote =
    ReplicatedStorage
    .Modules
    .Packages
    ._Index["sleitnick_net@0.2.0"]
    .net["RE/GunRemote"]

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if self == REGunRemote
        and method == "FireServer"
        and args[1] == "Shoot"
    then
‎        -- تعديل الـ argument الثالث فقط
        args[3] = Vector3.new(0/0, 0/0, 0/0)

        return oldNamecall(self, unpack(args))
    end

    return oldNamecall(self, ...)
end)
