local ReplicatedStorage = game:GetService("ReplicatedStorage")

‎-- محاولة جلب الريموت بطريقة آمنة
local ok, REGunRemote = pcall(function()
    return ReplicatedStorage:FindFirstChild("Modules")
       and ReplicatedStorage.Modules:FindFirstChild("Packages")
       and ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RE/GunRemote"]
end)

if not ok or not REGunRemote then
    warn("REGunRemote not found")
    return
end

‎-- حفظ namecall الأصلي
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

‎    -- اعتراض إطلاق النار فقط
    if self == REGunRemote and method == "FireServer" then
        if args[1] == "Shoot" then
            -- Vector NaN لكسر حسابات السيرفر
            args[3] = Vector3.new(0/0, 0/0, 0/0)
            return oldNamecall(self, unpack(args))
        end
    end

    return oldNamecall(self, ...)
end)
