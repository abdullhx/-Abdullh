local function RunScript(url, msg)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if success then
        print(msg)
    else
        warn("A7x:======X", err)
    end
end

-- تشغيل السكربت الأول
RunScript("https://raw.githubusercontent.com/abdullhx/-Abdullh/refs/heads/main/Newfyrfhutr.lua", "تم تشغيل 1")

-- انتظار ثانية
task.wait(1)

-- Wallbang
RunScript("https://raw.githubusercontent.com/abdullhx/-Abdullh/refs/heads/main/WallShaigavztba.lua", "تم تشغيل 2")
