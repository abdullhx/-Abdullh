-- Silent Aim (Paid)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local pg = LocalPlayer:WaitForChild("PlayerGui")
local IgnoredPlayers = {
    ["A7x702xxx"] = true,
    ["Ggggyyytthd"] = true,
	["Astrog1_fan"] = true,
}

local ok, REGunRemote = pcall(function()
	return ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Packages") and ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RE/GunRemote"]
end)
if not ok then REGunRemote = nil end

local gui = Instance.new("ScreenGui", pg)
gui.Name = "A7xBaseUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

--الواجهه الرئيسية

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 540, 0, 320)
mainFrame.Position = UDim2.new(0.5, -270, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.new(1, 1, 1)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true

-- زر اغلاق/فتح الواجهه

local toggleIcon = Instance.new("TextButton", gui)
toggleIcon.Size = UDim2.new(0, 40, 0, 40)
toggleIcon.Position = UDim2.new(0, 10, 0.5, -20)
toggleIcon.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
toggleIcon.TextColor3 = Color3.new(1, 1, 1)
toggleIcon.Font = Enum.Font.SourceSansBold
toggleIcon.TextSize = 20
toggleIcon.Text = "📂"
toggleIcon.ZIndex = 5
toggleIcon.Active = true
toggleIcon.Draggable = true

local isVisible = true
toggleIcon.MouseButton1Click:Connect(function()
	isVisible = not isVisible
	mainFrame.Visible = isVisible
end)

local header = Instance.new("Frame", mainFrame)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

-- العنوان 

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Text = "A7xDev (Paid)"
title.TextXAlignment = Enum.TextXAlignment.Center

-- زر الاغلاق 

local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.Text = "❌"
closeBtn.ZIndex = 5
closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	isVisible = false
end)
-- الشريط الجانبي 

local sidebar = Instance.new("Frame", mainFrame)
sidebar.Size = UDim2.new(0, 100, 0, 278)
sidebar.Position = UDim2.new(0, 0, 0, 42)
sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- الخط الابيض الجانبي

local sideLine = Instance.new("Frame", mainFrame)
sideLine.Size = UDim2.new(0, 2, 0, 278)
sideLine.Position = UDim2.new(0, 100, 0, 42)
sideLine.BackgroundColor3 = Color3.new(1, 1, 1)

-- زر واجهه السايلنت ايم

local btn = Instance.new("TextButton", sidebar)
btn.Size = UDim2.new(1, 0, 0, 40)
btn.Position = UDim2.new(0, 0, 0, 10)
btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.SourceSansBold
btn.TextSize = 14
btn.Text = "Silent Aim"

-- زر ESP
local espBtn = Instance.new("TextButton", sidebar)
espBtn.Size = UDim2.new(1, 0, 0, 40)
espBtn.Position = UDim2.new(0, 0, 0, 60) -- تحته مباشرة
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.TextColor3 = Color3.new(1, 1, 1)
espBtn.Font = Enum.Font.SourceSansBold
espBtn.TextSize = 14
espBtn.Text = "ESP"

-- صفحة ESP
local espPage = Instance.new("Frame", mainFrame)
espPage.Size = UDim2.new(0, 428, 0, 278)
espPage.Position = UDim2.new(0, 110, 0, 42)
espPage.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
espPage.Visible = false  -- تكون مخفية افتراضيًا

-- لما تضغط زر ESP
espBtn.MouseButton1Click:Connect(function()
	for _, child in ipairs(mainFrame:GetChildren()) do
if (child:IsA("Frame") or child:IsA("ScrollingFrame")) and child ~= sidebar and child ~= header and child ~= sideLine then
			child.Visible = false
		end
	end
	espPage.Visible = true
end)

local page = Instance.new("Frame", mainFrame)
page.Size = UDim2.new(0, 428, 0, 278)
page.Position = UDim2.new(0, 110, 0, 42)
page.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
page.Visible = true

btn.MouseButton1Click:Connect(function()
	for _, child in ipairs(mainFrame:GetChildren()) do
if (child:IsA("Frame") or child:IsA("ScrollingFrame")) and child ~= sidebar and child ~= header and child ~= sideLine then
			child.Visible = false
		end
	end
	page.Visible = true
end)

-- زر سايلنت ايم 

local Silentbar = Instance.new("Frame", page)
Silentbar.Size = UDim2.new(1, -20, 0, 40)
Silentbar.Position = UDim2.new(0, 10, 0, 40)
Silentbar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local SilentCorner = Instance.new("UICorner", Silentbar)
SilentCorner.CornerRadius = UDim.new(0, 8)

local Silentlabel = Instance.new("TextLabel", Silentbar)
Silentlabel.Size = UDim2.new(0.8, 0, 1, 0)
Silentlabel.Position = UDim2.new(0, 10, 0, 0)
Silentlabel.BackgroundTransparency = 1
Silentlabel.TextColor3 = Color3.new(1, 1, 1)
Silentlabel.Font = Enum.Font.SourceSans
Silentlabel.TextSize = 14
Silentlabel.Text = "Silent Aim"
Silentlabel.TextXAlignment = Enum.TextXAlignment.Left

local toggleBox = Instance.new("TextButton", Silentbar)
toggleBox.Size = UDim2.new(0, 30, 0, 30)
toggleBox.Position = UDim2.new(1, -40, 0.5, -15)
toggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBox.TextColor3 = Color3.new(0, 1, 0)
toggleBox.Font = Enum.Font.SourceSansBold
toggleBox.TextSize = 18
toggleBox.Text = ""
local toggleCorner = Instance.new("UICorner", toggleBox)
toggleCorner.CornerRadius = UDim.new(0, 6)

-- اعدادات الدائره

local active = false
local currentTarget = nil
local FOV = 200

local TargetGui = Instance.new("ScreenGui", pg)
TargetGui.Name = "TargetGui"
TargetGui.ResetOnSpawn = false
TargetGui.Enabled = false

local Circle = Instance.new("Frame", TargetGui)
Circle.Size = UDim2.new(0, FOV, 0, FOV)
Circle.AnchorPoint = Vector2.new(0.5, 0.5)
Circle.BackgroundTransparency = 1

local UIStroke = Instance.new("UIStroke", Circle)
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(255, 255, 255)

local UICorner = Instance.new("UICorner", Circle)
UICorner.CornerRadius = UDim.new(1, 0)

local Line = Drawing.new("Line")
Line.Visible = false
Line.Thickness = 3
Line.Color = Color3.fromRGB(255, 0, 0)

RunService.RenderStepped:Connect(function()
	Circle.Position = UDim2.new(0.5, 0, 0.5, -30)
end)

local FireButtonGui = Instance.new("ScreenGui", pg)
FireButtonGui.Name = "FireButtonGui"
FireButtonGui.ResetOnSpawn = false
FireButtonGui.Enabled = false

local FireButton = Instance.new("TextButton", FireButtonGui)
FireButton.Size = UDim2.new(0, 70, 0, 70)
FireButton.Position = UDim2.new(0.5, -50, 0.9, -50)
FireButton.Text = "Fire"
FireButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FireButton.TextColor3 = Color3.new(1, 1, 1)
FireButton.Font = Enum.Font.SourceSansBold
FireButton.TextSize = 24
FireButton.Active = true
FireButton.Draggable = true

local fireCorner = Instance.new("UICorner", FireButton)
fireCorner.CornerRadius = UDim.new(0.5, 0)

local function GetClosestToCenter()
    local closest, dist = nil, math.huge
    local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not IgnoredPlayers[p.Name] then
            if p.Character and p.Character:FindFirstChild("Head") then
                local pos, visible = Camera:WorldToViewportPoint(p.Character.Head.Position)

                if visible then
                    local diff = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                    if diff < dist and diff <= FOV then
                        dist = diff
                        closest = p
                    end
                end
            end
        end
    end

    return closest
end

RunService.RenderStepped:Connect(function()
	if not active then
		Line.Visible = false
		currentTarget = nil
		return
	end
	local t = GetClosestToCenter()
	local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
	if t and t.Character and t.Character:FindFirstChild("Head") then
		local head, vis = Camera:WorldToViewportPoint(t.Character.Head.Position)
		if vis and (Vector2.new(head.X, head.Y) - center).Magnitude <= FOV then
			Line.Visible = true
			Line.From = center
			Line.To = Vector2.new(head.X, head.Y)
			currentTarget = t
		else
			Line.Visible = false
			currentTarget = nil
		end
	else
		Line.Visible = false
		currentTarget = nil
	end
end)

local function getEquippedTool(character)
	if not character then return nil end
	local tool = character:FindFirstChildOfClass("Tool")
	if tool then return tool end
	for _, c in ipairs(character:GetChildren()) do
		if c:IsA("Tool") then return c end
	end
	return nil
end

local function getToolDisplayName(tool)
	if not tool then return nil end
	local dv = tool:FindFirstChild("DisplayName")
	if dv and dv:IsA("StringValue") and dv.Value ~= "" then return dv.Value end
	if tool.GetAttribute and tool:GetAttribute("DisplayName") then return tostring(tool:GetAttribute("DisplayName")) end
	return tool.Name
end

local function buildShots7(headPart, myPos)
	local headPos = headPart.Position
	local offsets = {
		Vector3.new(0,0,0),
		Vector3.new(0,0.5,0),
		Vector3.new(0.5,0,0),
		Vector3.new(-0.5,0,0),
		Vector3.new(0,-0.5,0),
		Vector3.new(0.3,0.3,0),
		Vector3.new(-0.3,-0.3,0),
	}
	local shots = {}
	for _, off in ipairs(offsets) do
		local aimPos = headPos + off
		local aimDir = (aimPos - myPos).Unit
		table.insert(shots, { headPart, aimPos, aimDir, Enum.Material.Plastic })
	end
	return shots
end

local function buildShots5(headPart, myPos)
	local headPos = headPart.Position
	local offsets = {
		Vector3.new(0,0,0),
		Vector3.new(0,0.5,0),
		Vector3.new(0.5,0,0),
		Vector3.new(-0.5,0,0),
		Vector3.new(0,-0.5,0),
	}
	local shots = {}
	for _, off in ipairs(offsets) do
		local aimPos = headPos + off
		local aimDir = (aimPos - myPos).Unit
		table.insert(shots, { headPart, aimPos, aimDir, Enum.Material.Plastic })
	end
	return shots
end

local function buildSingleShotForOriginalCall(targetPart, myPos)
	local aimPos = targetPart.Position
	local aimDir = (aimPos - myPos).Unit
	return targetPart, aimPos, aimDir, Enum.Material.Plastic
end

local function safeFire(shots)
	if not REGunRemote then return end
	pcall(function()
		if type(shots) == "table" and #shots > 0 and type(shots[1]) == "table" then
			REGunRemote:FireServer("Shoot", shots)
		else
			local targetPart, targetPos, direction, material = unpack(shots)
			REGunRemote:FireServer("Shoot", targetPart, targetPos, direction, material)
		end
	end)
end

local firing = false

local function fireShot()
	if not active or not currentTarget then return end
	local t = currentTarget
	if not t.Character or not t.Character:FindFirstChild("Head") then return end

	local myChar = LocalPlayer.Character
	if not myChar then return end
	local myHRP = myChar:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end
	local myPos = myHRP.Position

	local equipped = getEquippedTool(myChar)
	local equippedName = equipped and getToolDisplayName(equipped) or nil

	local headPart = t.Character.Head

	if equippedName == "Sawn Off" then
		local shots7 = buildShots7(headPart, myPos)
		safeFire(shots7)
	elseif equippedName == "Double Barrel" then
		local shots5 = buildShots5(headPart, myPos)
		safeFire(shots5)
	else
		local targetPart = t.Character:FindFirstChild("HumanoidRootPart")
		if targetPart then
			local singleCall = { buildSingleShotForOriginalCall(targetPart, myPos) }
			safeFire(singleCall)
		end
	end
end

FireButton.MouseButton1Down:Connect(function()
	firing = true
	task.spawn(function()
		while firing do
			fireShot()
			task.wait(0.01)
		end
	end)
end)

FireButton.MouseButton1Up:Connect(function()
	firing = false
end)
FireButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		firing = false
	end
end)

toggleBox.MouseButton1Click:Connect(function()
	active = not active
	toggleBox.Text = active and "✅" or ""
	TargetGui.Enabled = active
	FireButtonGui.Enabled = active
	if not active then
		Line.Visible = false
		firing = false
	end
end)

TargetGui.Enabled = active
FireButtonGui.Enabled = active

local sliderFrame = Instance.new("Frame", page)
sliderFrame.Size = UDim2.new(1, -20, 0, 60)
sliderFrame.Position = UDim2.new(0, 10, 0, 90)
sliderFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local barCorner = Instance.new("UICorner", sliderFrame)
barCorner.CornerRadius = UDim.new(0, 8)

local sliderLabel = Instance.new("TextLabel", sliderFrame)
sliderLabel.Size = UDim2.new(0, 100, 1, 0)
sliderLabel.Position = UDim2.new(0, 10, 0, 0)
sliderLabel.BackgroundTransparency = 1
sliderLabel.TextColor3 = Color3.new(1, 1, 1)
sliderLabel.Font = Enum.Font.SourceSans
sliderLabel.TextSize = 14
sliderLabel.Text = "FOV"

local sliderLine = Instance.new("Frame", sliderFrame)
sliderLine.Size = UDim2.new(0, 200, 0, 4)
sliderLine.Position = UDim2.new(0, 120, 0.5, -2)
sliderLine.BackgroundColor3 = Color3.new(1, 1, 1)

local sliderDot = Instance.new("Frame", sliderLine)
sliderDot.Size = UDim2.new(0, 16, 0, 16)
sliderDot.Position = UDim2.new(FOV / 500, -8, 0.5, 0)
sliderDot.AnchorPoint = Vector2.new(0.5, 0.5)
sliderDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
sliderDot.Active = true
sliderDot.Draggable = true

local sliderCorner = Instance.new("UICorner", sliderDot)
sliderCorner.CornerRadius = UDim.new(1, 0)

local textBox = Instance.new("TextBox", sliderFrame)
textBox.Size = UDim2.new(0, 60, 0, 25)
textBox.Position = UDim2.new(1, -70, 0.5, -12)
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Font = Enum.Font.SourceSansBold
textBox.TextSize = 16
textBox.Text = tostring(FOV)
local toggleCorner = Instance.new("UICorner", textBox)
toggleCorner.CornerRadius = UDim.new(0, 6)

local function updateFOV(value)
	value = math.clamp(value, 20, 500)
	FOV = value
	textBox.Text = tostring(FOV)
	sliderDot.Position = UDim2.new(FOV / 500, -8, 0.5, 0)
	Circle.Size = UDim2.new(0, FOV, 0, FOV)
end

sliderDot.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		local moveConn
		moveConn = UserInputService.InputChanged:Connect(function(moveInput)
			if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
				local relative = math.clamp((moveInput.Position.X - sliderLine.AbsolutePosition.X) / sliderLine.AbsoluteSize.X, 0, 1)
				updateFOV(math.floor(relative * 500))
			end
		end)
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				moveConn:Disconnect()
			end
		end)
	end
end)

textBox.FocusLost:Connect(function()
	local val = tonumber(textBox.Text)
	if val then updateFOV(val) end
end)

-- Hook لـ FireServer الخاص بـ REGunRemote عند استدعاء "Shoot"


local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    -- التحقق أنه الريموت الصحيح والميثود FireServer
    if self == REGunRemote and method == "FireServer" and args[1] == "Shoot" then
        -- تغيير الوسيط الثالث إلى Vector3.new(NaN, NaN, NaN)
        args[3] = Vector3.new(0/0, 0/0, 0/0)
        -- استدعاء الأصلي مع الوسائط المعدلة
        return oldNamecall(self, unpack(args))
    end

    -- إذا ما تحقق الشرط، رجّع الأصل
    return oldNamecall(self, ...)
end)

-- زر ESP Player
local playerESPBtnFrame = Instance.new("Frame", espPage)
playerESPBtnFrame.Size = UDim2.new(1, -20, 0, 40)
playerESPBtnFrame.Position = UDim2.new(0, 10, 0, 40)
playerESPBtnFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local playerESPBtnFrameCorner = Instance.new("UICorner", playerESPBtnFrame)
playerESPBtnFrameCorner.CornerRadius = UDim.new(0, 8)

local playerESPLabel = Instance.new("TextLabel", playerESPBtnFrame)
playerESPLabel.Size = UDim2.new(0.8, 0, 1, 0)
playerESPLabel.Position = UDim2.new(0, 10, 0, 0)
playerESPLabel.BackgroundTransparency = 1
playerESPLabel.TextColor3 = Color3.new(1,1,1)
playerESPLabel.Font = Enum.Font.SourceSans
playerESPLabel.TextSize = 14
playerESPLabel.Text = "ESP Player"
playerESPLabel.TextXAlignment = Enum.TextXAlignment.Left

local playerESPToggle = Instance.new("TextButton", playerESPBtnFrame)
playerESPToggle.Size = UDim2.new(0, 30, 0, 30)
playerESPToggle.Position = UDim2.new(1, -40, 0.5, -15)
playerESPToggle.BackgroundColor3 = Color3.fromRGB(30,30,30)
playerESPToggle.TextColor3 = Color3.fromRGB(0, 1, 0)
playerESPToggle.Font = Enum.Font.SourceSansBold
playerESPToggle.TextSize = 18
playerESPToggle.Text = ""
PlayerESP_Enabled = false
local toggleCorner = Instance.new("UICorner", playerESPToggle)
toggleCorner.CornerRadius = UDim.new(0, 6)

local ESPHighlights = {}

local function ensureHighlight(character)
    if not character then return end
    local hl = character:FindFirstChild("ESPHighlight")
    if not hl then
        hl = Instance.new("Highlight")
        hl.Name = "ESPHighlight"
        hl.FillTransparency = 1
        hl.OutlineTransparency = 0
        hl.OutlineColor = Color3.fromRGB(0,255,0)
        hl.Parent = character
    end
    return hl
end

local function updateESP()
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl.Character then
            local hl = ensureHighlight(pl.Character)
            if hl then
                hl.OutlineTransparency = PlayerESP_Enabled and 0 or 1
            end
        end
    end
end

playerESPToggle.MouseButton1Click:Connect(function()
    PlayerESP_Enabled = not PlayerESP_Enabled
    playerESPToggle.Text = PlayerESP_Enabled and "✅" or ""
    updateESP()
end)

Players.PlayerAdded:Connect(function(pl)
    pl.CharacterAdded:Connect(function(char)
        task.wait(0.3)
        if PlayerESP_Enabled then
            local hl = ensureHighlight(char)
            if hl then hl.OutlineTransparency = 0 end
        end
    end)
end)

Players.PlayerRemoving:Connect(function(pl)
    if pl.Character then
        local hl = pl.Character:FindFirstChild("ESPHighlight")
        if hl then hl:Destroy() end
    end
end)

RunService.Heartbeat:Connect(function()
    if PlayerESP_Enabled then
        updateESP()
    end
end)

--// إعدادات الـ ESP الخاصة بالأدوات
local Settings = {
    Items_ESP_Enabled = false
}

--// ألوان الأدوات
local ItemColors = {
    ["Glock"] = Color3.fromRGB(135,206,250),
    ["P226"] = Color3.fromRGB(135,206,250),
    ["Uzi"] = Color3.fromRGB(0,0,139),
    ["Hunting Rifle"] = Color3.fromRGB(0,0,139),
    ["Draco"] = Color3.fromRGB(148,0,211),
    ["Double Barrel"] = Color3.fromRGB(0,0,139),
    ["Sawn Off"] = Color3.fromRGB(148,0,211),
    ["Tactical Shovel"] = Color3.fromRGB(148,0,211),
    ["AK-47"] = Color3.fromRGB(255,215,0),
    ["RPG"] = Color3.fromRGB(255,215,0),
    ["MP5"] = Color3.fromRGB(255,215,0),
    ["Frying Pan"] = Color3.fromRGB(38,255,0),
    ["Metal Pipe"] = Color3.fromRGB(38,255,0),
    ["Axe"] = Color3.fromRGB(38,255,0),
    ["Crowbar"] = Color3.fromRGB(38,255,0),
    ["Revolver"] = Color3.fromRGB(135,206,250),
    ["Machete"] = Color3.fromRGB(38,255,0),
	["M24"] = Color3.fromRGB(255,215,0),
	["Spas-12"] = Color3.fromRGB(255,0,0),
    ["Crossbow"] = Color3.fromRGB(255,215,0),


}
local DefaultItemColor = Color3.fromRGB(255,255,255)

--// أدوات غير ظاهرة
local HiddenItems = {
    ["Fists"] = true,
    ["Mop"] = true,
    ["Crate"] = true,
    ["Brick"] = true,
    ["Spray Can"] = true,
    ["Farmerade"] = true,
}

--// خدمات

--// تخزين التسميات
local ItemsLabels = {}
local TEXT_OFFSET = 10

local function hasNonAscii(s)
    if not s then return false end
    for i = 1, #s do
        if s:byte(i) > 127 then return true end
    end
    return false
end

local function clearItemLabelsFor(player)
    if not ItemsLabels[player] then return end
    for _, gui in ipairs(ItemsLabels[player]) do
        if gui and gui.Parent then gui:Destroy() end
    end
    ItemsLabels[player] = nil
end

local function createItemLabel(parentPart, name, color, yoffset, textSize)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ItemESP_"..name
    billboard.Size = UDim2.new(0,240,0,24)
    billboard.StudsOffset = Vector3.new(0, yoffset, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = parentPart
    billboard.Parent = parentPart

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextScaled = false
    text.Font = Enum.Font.SourceSansSemibold
    text.TextSize = textSize or 16
    text.TextColor3 = color or DefaultItemColor
    text.Text = name
    text.TextStrokeTransparency = 0.8
    text.Parent = billboard

    return billboard
end

local function updateItemsESPForPlayer(player)
    if not player or not player.Character then return end
    local char = player.Character
    clearItemLabelsFor(player)
    ItemsLabels[player] = {}

    if Settings.Items_ESP_Enabled then
        local tools = {}
        local backpack = player:FindFirstChild("Backpack")

        if backpack then
            for _, t in ipairs(backpack:GetChildren()) do
                if t:IsA("Tool") and not HiddenItems[t.Name] and (not hasNonAscii(t.Name)) then
                    table.insert(tools, t.Name)
                end
            end
        end

        for _, t in ipairs(char:GetChildren()) do
            if t:IsA("Tool") and not HiddenItems[t.Name] and (not hasNonAscii(t.Name)) then
                table.insert(tools, t.Name)
            end
        end

        local baseSize = 18
        local minSize = 12
        local textSize = baseSize
        if #tools > 3 then
            textSize = math.max(minSize, baseSize - math.floor((#tools - 3) * 2))
        end

        local headPart = char:FindFirstChild("Head") or char:FindFirstChildWhichIsA("BasePart")
        if headPart then
            for i, name in ipairs(tools) do
                local color = ItemColors[name] or DefaultItemColor
                local y = TEXT_OFFSET + (i-1) * 10
                local gui = createItemLabel(headPart, name, color, y, textSize)
                table.insert(ItemsLabels[player], gui)
            end
        end
    end
end

-- زر ESP Items

local Itemsbar = Instance.new("Frame", espPage)
Itemsbar.Size = UDim2.new(1, -20, 0, 40)
Itemsbar.Position = UDim2.new(0, 10, 0, 90)
Itemsbar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local ItemsCorner = Instance.new("UICorner", Itemsbar)
ItemsCorner.CornerRadius = UDim.new(0, 8)

local Itemslabel = Instance.new("TextLabel", Itemsbar)
Itemslabel.Size = UDim2.new(0.8, 0, 1, 0)
Itemslabel.Position = UDim2.new(0, 10, 0, 0)
Itemslabel.BackgroundTransparency = 1
Itemslabel.TextColor3 = Color3.new(1, 1, 1)
Itemslabel.Font = Enum.Font.SourceSans
Itemslabel.TextSize = 14
Itemslabel.Text = "ESP Items"
Itemslabel.TextXAlignment = Enum.TextXAlignment.Left

local ItemstoggleBox = Instance.new("TextButton", Itemsbar)
ItemstoggleBox.Size = UDim2.new(0, 30, 0, 30)
ItemstoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
ItemstoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ItemstoggleBox.TextColor3 = Color3.new(0, 1, 0)
ItemstoggleBox.Font = Enum.Font.SourceSansBold
ItemstoggleBox.TextSize = 18
ItemstoggleBox.Text = ""
local ItemstoggleCorner = Instance.new("UICorner", ItemstoggleBox)
ItemstoggleCorner.CornerRadius = UDim.new(0, 6)

-- حالة الزر
local ESP_Items_active = false

-- عند الضغط على الزر يتبدل ويشغل/يوقف ESP
ItemstoggleBox.MouseButton1Click:Connect(function()
	ESP_Items_active = not ESP_Items_active
	ItemstoggleBox.Text = ESP_Items_active and "✅" or ""

    Settings.Items_ESP_Enabled = ESP_Items_active

    -- إذا تم الإيقاف: احذف كل التسميات فورًا
    if not ESP_Items_active then
        for pl, list in pairs(ItemsLabels or {}) do
            if list then
                for _, g in ipairs(list) do
                    if g and g.Parent then g:Destroy() end
                end
                ItemsLabels[pl] = nil
            end
        end
    end
end)

-- تحديث مستمر لكل اللاعبين
RunService.Heartbeat:Connect(function()
    if Settings.Items_ESP_Enabled then
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl ~= LocalPlayer then
                updateItemsESPForPlayer(pl)
            end
        end
    end
end)

-- تحديث عند دخول لاعب جديد
Players.PlayerAdded:Connect(function(pl)
    pl.CharacterAdded:Connect(function()
        task.wait(0.3)
        updateItemsESPForPlayer(pl)
    end)
end)

-- عنوان داخل واجهه سايلنت ايم

local SilentinfoLabel = Instance.new("TextLabel", page)
SilentinfoLabel.Size = UDim2.new(0.8, 0, 0, 30)
SilentinfoLabel.Position = UDim2.new(0.1, -155, 0, 5)
SilentinfoLabel.BackgroundTransparency = 1
SilentinfoLabel.TextColor3 = Color3.new(1,1,1)
SilentinfoLabel.Font = Enum.Font.SourceSansBold
SilentinfoLabel.TextSize = 24                         
SilentinfoLabel.Text = "Silent Aim:"
SilentinfoLabel.TextXAlignment = Enum.TextXAlignment.Center
SilentinfoLabel.TextYAlignment = Enum.TextYAlignment.Center

--عنوان داخل واجهه ESP

local ESPinfoLabel = Instance.new("TextLabel", espPage)
ESPinfoLabel.Size = UDim2.new(0.8, 0, 0, 30)
ESPinfoLabel.Position = UDim2.new(0.1, -180, 0, 5)
ESPinfoLabel.BackgroundTransparency = 1
ESPinfoLabel.TextColor3 = Color3.new(1,1,1)
ESPinfoLabel.Font = Enum.Font.SourceSansBold
ESPinfoLabel.TextSize = 24                         
ESPinfoLabel.Text = "ESP:"
ESPinfoLabel.TextXAlignment = Enum.TextXAlignment.Center
ESPinfoLabel.TextYAlignment = Enum.TextYAlignment.Center



-- زر ESP Health

local Healthbar = Instance.new("Frame", espPage)
Healthbar.Size = UDim2.new(1, -20, 0, 40)
Healthbar.Position = UDim2.new(0, 10, 0, 140)
Healthbar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local HealthCorner = Instance.new("UICorner", Healthbar)
HealthCorner.CornerRadius = UDim.new(0, 8)

local Healthlabel = Instance.new("TextLabel", Healthbar)
Healthlabel.Size = UDim2.new(0.8, 0, 1, 0)
Healthlabel.Position = UDim2.new(0, 10, 0, 0)
Healthlabel.BackgroundTransparency = 1
Healthlabel.TextColor3 = Color3.new(1, 1, 1)
Healthlabel.Font = Enum.Font.SourceSans
Healthlabel.TextSize = 14
Healthlabel.Text = "ESP Health"
Healthlabel.TextXAlignment = Enum.TextXAlignment.Left

local HealthtoggleBox = Instance.new("TextButton", Healthbar)
HealthtoggleBox.Size = UDim2.new(0, 30, 0, 30)
HealthtoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
HealthtoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HealthtoggleBox.TextColor3 = Color3.new(0, 1, 0)
HealthtoggleBox.Font = Enum.Font.SourceSansBold
HealthtoggleBox.TextSize = 18
HealthtoggleBox.Text = ""
local HealthCorner = Instance.new("UICorner", HealthtoggleBox)
HealthCorner.CornerRadius = UDim.new(0, 6)

-- حالة الزر
local ESP_Health_active = false
---------------------------------------------------------------------

-- متغيرات النظام
local HealthTags = {}

-- دالة اللون المتدرج
local function getHealthColor(health)
	if health >= 50 then
		local t = (100 - health) / 50
		return Color3.new(1 * t, 1, 0)
	else
		local t = health / 50
		return Color3.new(1, t, 0)
	end
end

-- إنشاء النص
local function createHealthTag(player)
	if player.Character and player.Character:FindFirstChild("Head") then
		local Billboard = Instance.new("BillboardGui")
		Billboard.Name = "HealthDisplay"
		Billboard.Adornee = player.Character.Head
		Billboard.AlwaysOnTop = true
		Billboard.Size = UDim2.new(0, 80, 0, 10)
		Billboard.StudsOffset = Vector3.new(0, -3.5, 0) -- 🔹 قريب من البطن بدل الرأس
		Billboard.MaxDistance = 9999
		Billboard.Parent = player.Character.Head

		local Text = Instance.new("TextLabel", Billboard)
		Text.Size = UDim2.new(1, 0, 1, 0)
		Text.BackgroundTransparency = 1
		Text.TextScaled = true
		Text.Font = Enum.Font.SourceSansBold
		Text.Text = "100"
		Text.TextColor3 = Color3.fromRGB(0, 255, 0)
		Text.TextStrokeTransparency = 0.5

		HealthTags[player] = Text
	end
end

-- تحديث مستمر
RunService.RenderStepped:Connect(function()
	if not ESP_Health_active then return end
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
			local humanoid = player.Character.Humanoid
			local tag = HealthTags[player]
			if not tag or not tag.Parent then
				createHealthTag(player)
			else
				local health = math.clamp(humanoid.Health, 0, humanoid.MaxHealth)
				local percent = math.floor((health / humanoid.MaxHealth) * 100)
				tag.Text = tostring(percent)
				tag.TextColor3 = getHealthColor(percent)
			end
		end
	end
end)

-- عند موت أو تجدد اللاعب
local function onCharacterAdded(player)
	player.CharacterAdded:Connect(function(char)
		repeat task.wait() until char:FindFirstChild("Head") and char:FindFirstChild("Humanoid")
		createHealthTag(player)
	end)
end
for _, p in ipairs(Players:GetPlayers()) do
	if p ~= LocalPlayer then
		onCharacterAdded(p)
	end
end
Players.PlayerAdded:Connect(onCharacterAdded)
Players.PlayerRemoving:Connect(function(player)
	if HealthTags[player] then
		HealthTags[player] = nil
	end
end)

---------------------------------------------------------------------
-- ⚡ الزر: تشغيل / إيقاف
---------------------------------------------------------------------
HealthtoggleBox.MouseButton1Click:Connect(function()
	ESP_Health_active = not ESP_Health_active
	HealthtoggleBox.Text = ESP_Health_active and "✅" or ""

	if not ESP_Health_active then
		-- إزالة جميع التاغات لما يتوقف
		for _, v in pairs(HealthTags) do
			if v.Parent then v.Parent:Destroy() end
		end
		table.clear(HealthTags)
	end
end)

-- زر ESP Name

local Namebar = Instance.new("Frame", espPage)
Namebar.Size = UDim2.new(1, -20, 0, 40)
Namebar.Position = UDim2.new(0, 10, 0, 190)
Namebar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local NameCorner = Instance.new("UICorner", Namebar)
NameCorner.CornerRadius = UDim.new(0, 8)

local Namelabel = Instance.new("TextLabel", Namebar)
Namelabel.Size = UDim2.new(0.8, 0, 1, 0)
Namelabel.Position = UDim2.new(0, 10, 0, 0)
Namelabel.BackgroundTransparency = 1
Namelabel.TextColor3 = Color3.new(1, 1, 1)
Namelabel.Font = Enum.Font.SourceSans
Namelabel.TextSize = 14
Namelabel.Text = "ESP Name"
Namelabel.TextXAlignment = Enum.TextXAlignment.Left

local NametoggleBox = Instance.new("TextButton", Namebar)
NametoggleBox.Size = UDim2.new(0, 30, 0, 30)
NametoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
NametoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
NametoggleBox.TextColor3 = Color3.new(0, 1, 0)
NametoggleBox.Font = Enum.Font.SourceSansBold
NametoggleBox.TextSize = 18
NametoggleBox.Text = ""
local NameCorner = Instance.new("UICorner", NametoggleBox)
NameCorner.CornerRadius = UDim.new(0, 6)

-- متغير التحكم بالزر
local Names_Enabled = false
local BillboardList = {}

-- دالة إنشاء الاسم
local function createNameBillboard(player)
	if player == LocalPlayer then return end
	if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

	if BillboardList[player] then
		BillboardList[player]:Destroy()
	end

	local hrp = player.Character:FindFirstChild("HumanoidRootPart")
	local billboard = Instance.new("BillboardGui")
	billboard.Adornee = hrp
	billboard.Size = UDim2.new(0, 100, 0, 25)
	billboard.StudsOffset = Vector3.new(0, -2, 0)
	billboard.AlwaysOnTop = true
	billboard.MaxDistance = math.huge

	local nameLabel = Instance.new("TextLabel", billboard)
	nameLabel.Size = UDim2.new(1, 0, 1, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = player.Name
	nameLabel.TextColor3 = Color3.new(1, 1, 1)
	nameLabel.TextStrokeTransparency = 0
	nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
	nameLabel.TextScaled = false
	nameLabel.TextSize = 10
	nameLabel.Font = Enum.Font.SourceSansBold

	billboard.Parent = player.Character
	BillboardList[player] = billboard
end

local function removeNameBillboard(player)
	if BillboardList[player] then
		BillboardList[player]:Destroy()
		BillboardList[player] = nil
	end
end

-- تحديث مستمر
RunService.Heartbeat:Connect(function()
	if not Names_Enabled then return end
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local billboard = BillboardList[player]
			if not billboard or billboard.Adornee ~= player.Character:FindFirstChild("HumanoidRootPart") then
				createNameBillboard(player)
			end
		end
	end
end)

-- التعامل مع اللاعبين الجدد واللي يموتون
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		task.wait(1)
		if Names_Enabled then
			createNameBillboard(player)
		end
	end)
end)

Players.PlayerRemoving:Connect(removeNameBillboard)

-- ربط الزر مع وظيفة التفعيل والإيقاف
NametoggleBox.MouseButton1Click:Connect(function()
	Names_Enabled = not Names_Enabled
	NametoggleBox.Text = Names_Enabled and "✅" or ""

	if Names_Enabled then
		for _, player in ipairs(Players:GetPlayers()) do
			createNameBillboard(player)
		end
	else
		for _, billboard in pairs(BillboardList) do
			billboard:Destroy()
		end
		BillboardList = {}
	end
end)

-- زر واجهه Player
local PlayerBtn = Instance.new("TextButton", sidebar)
PlayerBtn.Size = UDim2.new(1, 0, 0, 40)
PlayerBtn.Position = UDim2.new(0, 0, 0, 110) -- ضع تحت زر Main مباشرة (تغير الرقم حسب الحاجة)
PlayerBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PlayerBtn.TextColor3 = Color3.new(1, 1, 1)
PlayerBtn.Font = Enum.Font.SourceSansBold
PlayerBtn.TextSize = 14
PlayerBtn.Text = "Player"

-- صفحة فارغة جديدة
local PlayerPage = Instance.new("ScrollingFrame", mainFrame)
PlayerPage.Size = UDim2.new(0, 428, 0, 278)
PlayerPage.Position = UDim2.new(0, 110, 0, 42)
PlayerPage.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerPage.Visible = false
PlayerPage.ScrollBarThickness = 6
PlayerPage.CanvasSize = UDim2.new(0, 0, 0, 333)

-- عند الضغط على الزر
PlayerBtn.MouseButton1Click:Connect(function()
	-- إخفاء كل الصفحات الأخرى
	for _, child in ipairs(mainFrame:GetChildren()) do
if (child:IsA("Frame") or child:IsA("ScrollingFrame")) and child ~= sidebar and child ~= header and child ~= sideLine then
			child.Visible = false
		end
	end
	-- إظهار الصفحة الجديدة
	PlayerPage.Visible = true
end)

-- عنوان داخل واجهه Player

local PlayerinfoLabel = Instance.new("TextLabel", PlayerPage)
PlayerinfoLabel.Size = UDim2.new(0.8, 0, 0, 30)
PlayerinfoLabel.Position = UDim2.new(0.1, -170, 0, 5)
PlayerinfoLabel.BackgroundTransparency = 1
PlayerinfoLabel.TextColor3 = Color3.new(1,1,1)
PlayerinfoLabel.Font = Enum.Font.SourceSansBold
PlayerinfoLabel.TextSize = 24                         
PlayerinfoLabel.Text = "Player:"
PlayerinfoLabel.TextXAlignment = Enum.TextXAlignment.Center
PlayerinfoLabel.TextYAlignment = Enum.TextYAlignment.Center


-- زر Power Jump 

local PowerJumpBar = Instance.new("Frame", PlayerPage)
PowerJumpBar.Size = UDim2.new(1, -20, 0, 40)
PowerJumpBar.Position = UDim2.new(0, 10, 0, 40)
PowerJumpBar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local PowerJumpCorner = Instance.new("UICorner", PowerJumpBar)
PowerJumpCorner.CornerRadius = UDim.new(0, 8)

local PowerJumplabel = Instance.new("TextLabel", PowerJumpBar)
PowerJumplabel.Size = UDim2.new(0.8, 0, 1, 0)
PowerJumplabel.Position = UDim2.new(0, 10, 0, 0)
PowerJumplabel.BackgroundTransparency = 1
PowerJumplabel.TextColor3 = Color3.new(1, 1, 1)
PowerJumplabel.Font = Enum.Font.SourceSans
PowerJumplabel.TextSize = 14
PowerJumplabel.Text = "Power Jump"
PowerJumplabel.TextXAlignment = Enum.TextXAlignment.Left

local PowerJumptoggleBox = Instance.new("TextButton", PowerJumpBar)
PowerJumptoggleBox.Size = UDim2.new(0, 30, 0, 30)
PowerJumptoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
PowerJumptoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PowerJumptoggleBox.TextColor3 = Color3.new(0, 1, 0)
PowerJumptoggleBox.Font = Enum.Font.SourceSansBold
PowerJumptoggleBox.TextSize = 18
PowerJumptoggleBox.Text = ""
local PowerJumpCorner = Instance.new("UICorner", PowerJumptoggleBox)
PowerJumpCorner.CornerRadius = UDim.new(0, 6)

-- الحالة
local Power_Jump_active = false
local jumpConnection -- نخزن الاتصال هنا

-- دالة تربط حدث القفز
local function connectJumping(hum, root)
	if jumpConnection then
		jumpConnection:Disconnect()
	end
	jumpConnection = hum.Jumping:Connect(function(isJumping)
		if isJumping and Power_Jump_active then
			local bv = Instance.new("BodyVelocity")
			bv.Velocity = Vector3.new(root.Velocity.X, 60, root.Velocity.Z)
			bv.MaxForce = Vector3.new(0, math.huge, 0)
			bv.P = 3000
			bv.Parent = root
			game:GetService("Debris"):AddItem(bv, 0.28)
		end
	end)
end

-- دالة تجهيز الشخصية الحالية
local function setupCharacter(char)
	local hum = char:WaitForChild("Humanoid")
	local root = char:WaitForChild("HumanoidRootPart")
	connectJumping(hum, root)
end

-- عند الضغط على الزر
PowerJumptoggleBox.MouseButton1Click:Connect(function()
	Power_Jump_active = not Power_Jump_active
	PowerJumptoggleBox.Text = Power_Jump_active and "✅" or ""
	if Power_Jump_active and game.Players.LocalPlayer.Character then
		setupCharacter(game.Players.LocalPlayer.Character)
	end
end)

-- لو مات وولد اللاعب من جديد، نربط أوتوماتيك
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	if Power_Jump_active then
		setupCharacter(char)
	end
end)

-- Speed Boost

local SpeedBoostBar = Instance.new("Frame", PlayerPage)
SpeedBoostBar.Size = UDim2.new(1, -20, 0, 40)
SpeedBoostBar.Position = UDim2.new(0, 10, 0, 90)
SpeedBoostBar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local SpeedBoostCorner = Instance.new("UICorner", SpeedBoostBar)
SpeedBoostCorner.CornerRadius = UDim.new(0, 8)

local SpeedBoostlabel = Instance.new("TextLabel", SpeedBoostBar)
SpeedBoostlabel.Size = UDim2.new(0.8, 0, 1, 0)
SpeedBoostlabel.Position = UDim2.new(0, 10, 0, 0)
SpeedBoostlabel.BackgroundTransparency = 1
SpeedBoostlabel.TextColor3 = Color3.new(1, 1, 1)
SpeedBoostlabel.Font = Enum.Font.SourceSans
SpeedBoostlabel.TextSize = 14
SpeedBoostlabel.Text = "Speed Boost"
SpeedBoostlabel.TextXAlignment = Enum.TextXAlignment.Left

local SpeedBoosttoggleBox = Instance.new("TextButton", SpeedBoostBar)
SpeedBoosttoggleBox.Size = UDim2.new(0, 30, 0, 30)
SpeedBoosttoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
SpeedBoosttoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedBoosttoggleBox.TextColor3 = Color3.new(0, 1, 0)
SpeedBoosttoggleBox.Font = Enum.Font.SourceSansBold
SpeedBoosttoggleBox.TextSize = 18
SpeedBoosttoggleBox.Text = ""
local SpeedBoosttoggleCorner = Instance.new("UICorner", SpeedBoosttoggleBox)
SpeedBoosttoggleCorner.CornerRadius = UDim.new(0, 6)

-- متغير الحالة
local Speed_Boost_active = false

-- وظيفة تغيير السرعة عند الضغط على الزر
SpeedBoosttoggleBox.MouseButton1Click:Connect(function()
	Speed_Boost_active = not Speed_Boost_active
	SpeedBoosttoggleBox.Text = Speed_Boost_active and "✅" or ""
end)

-- حلقة التكرار لتطبيق السرعة كل 0.2 ثانية
spawn(function()
	while true do
		wait(0.2)
		if Speed_Boost_active then
			local char = LocalPlayer.Character
			if char and char:FindFirstChild("Humanoid") then
				char.Humanoid.WalkSpeed = 30
			end
		end
	end
end)

-- LocalScript (ضعه في StarterPlayerScripts أو داخل ScreenGui في StarterGui)

local player = Players.LocalPlayer
local function waitForChar()
    local c = player.Character or player.CharacterAdded:Wait()
    if not c.Parent then player.CharacterAdded:Wait() end
    return player.Character
end


-- زر Noclip

local Noclipbar = Instance.new("Frame", PlayerPage)
Noclipbar.Size = UDim2.new(1, -20, 0, 40)
Noclipbar.Position = UDim2.new(0, 10, 0, 140)
Noclipbar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local NoclipCorner = Instance.new("UICorner", Noclipbar)
NoclipCorner.CornerRadius = UDim.new(0, 8)

local Nocliplabel = Instance.new("TextLabel", Noclipbar)
Nocliplabel.Size = UDim2.new(0.8, 0, 1, 0)
Nocliplabel.Position = UDim2.new(0, 10, 0, 0)
Nocliplabel.BackgroundTransparency = 1
Nocliplabel.TextColor3 = Color3.new(1, 1, 1)
Nocliplabel.Font = Enum.Font.SourceSans
Nocliplabel.TextSize = 14
Nocliplabel.Text = "Noclip"
Nocliplabel.TextXAlignment = Enum.TextXAlignment.Left

local NocliptoggleBox = Instance.new("TextButton", Noclipbar)
NocliptoggleBox.Size = UDim2.new(0, 30, 0, 30)
NocliptoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
NocliptoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
NocliptoggleBox.TextColor3 = Color3.new(0, 1, 0)
NocliptoggleBox.Font = Enum.Font.SourceSansBold
NocliptoggleBox.TextSize = 18
NocliptoggleBox.Text = ""
local NocliptoggleCorner = Instance.new("UICorner", NocliptoggleBox)
NocliptoggleCorner.CornerRadius = UDim.new(0, 6)

-- ===============================
-- Noclip (وظائف كاملة)
-- ===============================
local noclipEnabled = false
local hbConnection = nil
local charDescConn = nil

local function applyNoclipToCharacter(char)
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

local function restoreCollisions(char)
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end

local function setNoclip(on)
    noclipEnabled = on
    NocliptoggleBox.Text = on and "✅" or ""

    if hbConnection then
        hbConnection:Disconnect()
        hbConnection = nil
    end
    if charDescConn then
        charDescConn:Disconnect()
        charDescConn = nil
    end

    local char = player.Character or waitForChar()

    if on then
        applyNoclipToCharacter(char)
        charDescConn = char.DescendantAdded:Connect(function(desc)
            if desc:IsA("BasePart") then
                desc.CanCollide = false
            end
        end)
        hbConnection = RunService.Heartbeat:Connect(function()
            local c = player.Character
            if c then
                applyNoclipToCharacter(c)
            end
        end)
    else
        restoreCollisions(char)
    end
end

-- ===============================
-- ربط الزر بالوظيفة
-- ===============================
NocliptoggleBox.MouseButton1Click:Connect(function()
    setNoclip(not noclipEnabled)
end)

-- ===============================
-- إعادة تفعيل النوكليب بعد الموت فقط إذا كان مفعل
-- ===============================
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart", 5)
    if noclipEnabled then
        applyNoclipToCharacter(char)
        if charDescConn then charDescConn:Disconnect() end
        charDescConn = char.DescendantAdded:Connect(function(desc)
            if desc:IsA("BasePart") then
                desc.CanCollide = false
            end
        end)
        if not hbConnection then
            hbConnection = RunService.Heartbeat:Connect(function()
                local c = player.Character
                if c then
                    applyNoclipToCharacter(c)
                end
            end)
        end
    end
end)

-- ===============================
-- اختصار مفتاح N
-- ===============================
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.N then
        setNoclip(not noclipEnabled)
    end
end)

-- تأكد أن هذا السكربت LocalScript وموجود في مكان يشوف PlayerPage (مثلاً داخل نفس ScreenGui)
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--زر TP UP

local TPButton = Instance.new("TextButton")
TPButton.Name = "TPUpButton"
TPButton.Parent = PlayerPage
TPButton.Size = UDim2.new(0, 50, 0, 10)
TPButton.Position = UDim2.new(0, 350, 0, 10)
TPButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- أحمر
TPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TPButton.Text = "TP UP"
TPButton.Font = Enum.Font.GothamBold
TPButton.TextSize = 12
TPButton.AutoButtonColor = true

-- جعل الحواف دائرية
local TPcorner = Instance.new("UICorner")
TPcorner.CornerRadius = UDim.new(0, 10)
TPcorner.Parent = TPButton

-- وظيفة الزر
TPButton.MouseButton1Click:Connect(function()
	local character = LocalPlayer.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		local hrp = character.HumanoidRootPart
		hrp.CFrame = hrp.CFrame + Vector3.new(0, 50, 0)
	end
end)

-- // الريموت
local RESoda = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RE/Soda"]

-- زر Infinite Stamina

local InfiniteStaminaBar = Instance.new("Frame", PlayerPage)
InfiniteStaminaBar.Size = UDim2.new(1, -20, 0, 40)
InfiniteStaminaBar.Position = UDim2.new(0, 10, 0, 190)
InfiniteStaminaBar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local barCorner = Instance.new("UICorner", InfiniteStaminaBar)
barCorner.CornerRadius = UDim.new(0, 8)

-- // النص (العنوان)
local InfiniteStaminalabel = Instance.new("TextLabel", InfiniteStaminaBar)
InfiniteStaminalabel.Size = UDim2.new(0.8, 0, 1, 0)
InfiniteStaminalabel.Position = UDim2.new(0, 10, 0, 0)
InfiniteStaminalabel.BackgroundTransparency = 1
InfiniteStaminalabel.TextColor3 = Color3.new(1, 1, 1)
InfiniteStaminalabel.Font = Enum.Font.SourceSans
InfiniteStaminalabel.TextSize = 16
InfiniteStaminalabel.Text = "Infinite Stamina"
InfiniteStaminalabel.TextXAlignment = Enum.TextXAlignment.Left

-- // الزر الجانبي (تشغيل / إيقاف)
local InfiniteStaminatoggleBox = Instance.new("TextButton", InfiniteStaminaBar)
InfiniteStaminatoggleBox.Size = UDim2.new(0, 30, 0, 30)
InfiniteStaminatoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
InfiniteStaminatoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InfiniteStaminatoggleBox.TextColor3 = Color3.new(0, 1, 0)
InfiniteStaminatoggleBox.Font = Enum.Font.SourceSansBold
InfiniteStaminatoggleBox.TextSize = 18
InfiniteStaminatoggleBox.Text = ""
local InfiniteStaminatoggleCorner = Instance.new("UICorner", InfiniteStaminatoggleBox)
InfiniteStaminatoggleCorner.CornerRadius = UDim.new(0, 6)

-- // متغير التفعيل
local Infinite_Stamina_active = false

-- // التبديل بين التشغيل والإيقاف
InfiniteStaminatoggleBox.MouseButton1Click:Connect(function()
	Infinite_Stamina_active = not Infinite_Stamina_active
	InfiniteStaminatoggleBox.Text = Infinite_Stamina_active and "✅" or ""
	
	if Infinite_Stamina_active then
		-- تشغيل الريموت مباشرة
		firesignal(RESoda.OnClientEvent)
	end
end)

-- // تنفيذ الريموت كل 10 ثواني إذا كان مفعّل
task.spawn(function()
	while true do
		if Infinite_Stamina_active then
			firesignal(RESoda.OnClientEvent)
		end
		task.wait(10)
	end
end)

-- اعدادات Checkpoint

local savedPosition = nil
local trackingEnabled = false
local connection = nil -- لتخزين الاتصال مع HealthChanged

-- زر Checkpoint

local CheckpointBar = Instance.new("Frame", PlayerPage)
CheckpointBar.Size = UDim2.new(1, -20, 0, 40)
CheckpointBar.Position = UDim2.new(0, 10, 0, 240)
CheckpointBar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
local barCorner = Instance.new("UICorner", CheckpointBar)
barCorner.CornerRadius = UDim.new(0, 8)

local Checkpointlabel = Instance.new("TextLabel", CheckpointBar)
Checkpointlabel.Size = UDim2.new(0.8, 0, 1, 0)
Checkpointlabel.Position = UDim2.new(0, 10, 0, 0)
Checkpointlabel.BackgroundTransparency = 1
Checkpointlabel.TextColor3 = Color3.new(1, 1, 1)
Checkpointlabel.Font = Enum.Font.SourceSans
Checkpointlabel.TextSize = 14
Checkpointlabel.Text = "Checkpoint"
Checkpointlabel.TextXAlignment = Enum.TextXAlignment.Left

local CheckpointtoggleBox = Instance.new("TextButton", CheckpointBar)
CheckpointtoggleBox.Size = UDim2.new(0, 30, 0, 30)
CheckpointtoggleBox.Position = UDim2.new(1, -40, 0.5, -15)
CheckpointtoggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CheckpointtoggleBox.TextColor3 = Color3.new(0, 1, 0)
CheckpointtoggleBox.Font = Enum.Font.SourceSansBold
CheckpointtoggleBox.TextSize = 18
CheckpointtoggleBox.Text = ""
local CheckpointCorner = Instance.new("UICorner", CheckpointtoggleBox)
CheckpointCorner.CornerRadius = UDim.new(0, 6)

-- دالة متابعة دم اللاعب
local function startTracking()
    if not player.Character or not trackingEnabled then return end
    local character = player.Character
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end

    connection = humanoid.HealthChanged:Connect(function(health)
        if trackingEnabled and health <= 0 and character:FindFirstChild("HumanoidRootPart") then
            -- حفظ الاحداثيات عند الموت
            savedPosition = character.HumanoidRootPart.Position
            print("تم حفظ الإحداثيات عند الموت:", savedPosition)

            -- بعد 0.5 ثانية، تفعيل الريموت RespawnEvent إذا الزر مفعل
            task.delay(1, function()
                if trackingEnabled then
                    local netModule = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net
                    netModule["RE/RespawnEvent"]:FireServer()
                    print("تم تفعيل الريموت RespawnEvent")
                end
            end)
        end
    end)
end

local function stopTracking()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

-- عند الضغط على ToggleBox
CheckpointtoggleBox.MouseButton1Click:Connect(function()
    trackingEnabled = not trackingEnabled
    CheckpointtoggleBox.Text = trackingEnabled and "✅" or ""
    if trackingEnabled then
        startTracking()
    else
        stopTracking()
    end
end)

-- متابعة رجوع الشخصية
player.CharacterAdded:Connect(function(character)
    -- إذا فيه إحداثيات محفوظة والزر مفعل، نقله فورًا
    if trackingEnabled and savedPosition then
        character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(savedPosition)
        print("تم نقل اللاعب للإحداثيات المحفوظة بعد العودة")
    end

    -- إذا الزر مفعل، نعيد الاتصال بالموت
    if trackingEnabled then
        startTracking()
    end
end)

-- زر واجهه Shop

local ShopBtn = Instance.new("TextButton", sidebar)
ShopBtn.Size = UDim2.new(1, 0, 0, 40)
ShopBtn.Position = UDim2.new(0, 0, 0, 160)
ShopBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ShopBtn.TextColor3 = Color3.new(1, 1, 1)
ShopBtn.Font = Enum.Font.SourceSansBold
ShopBtn.TextSize = 14
ShopBtn.Text = "Shop"

local ShopPage = Instance.new("ScrollingFrame", mainFrame)
ShopPage.Size = UDim2.new(0, 428, 0, 278)
ShopPage.Position = UDim2.new(0, 110, 0, 42)
ShopPage.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ShopPage.Visible = false
ShopPage.ScrollBarThickness = 6
ShopPage.CanvasSize = UDim2.new(0, 0, 0, 600)

-- عند الضغط على الزر
ShopBtn.MouseButton1Click:Connect(function()
	-- إخفاء كل الصفحات الأخرى
	for _, child in ipairs(mainFrame:GetChildren()) do
if (child:IsA("Frame") or child:IsA("ScrollingFrame")) and child ~= sidebar and child ~= header and child ~= sideLine then
			child.Visible = false
		end
	end
	-- إظهار الصفحة الجديدة
	ShopPage.Visible = true
end)

-- عنوان داخل واجهه Shop

local AmmoinfoLabel = Instance.new("TextLabel", ShopPage)
AmmoinfoLabel.Size = UDim2.new(0.8, 0, 0, 30)
AmmoinfoLabel.Position = UDim2.new(0.1, -150, 0, 5)
AmmoinfoLabel.BackgroundTransparency = 1
AmmoinfoLabel.TextColor3 = Color3.new(1,1,1)
AmmoinfoLabel.Font = Enum.Font.SourceSansBold
AmmoinfoLabel.TextSize = 24                         
AmmoinfoLabel.Text = "Ammo Shop:"
AmmoinfoLabel.TextXAlignment = Enum.TextXAlignment.Center
AmmoinfoLabel.TextYAlignment = Enum.TextYAlignment.Center

-- زر Pistol

local PistolBtn = Instance.new("TextButton")
PistolBtn.Name = "Pistol"
PistolBtn.Size = UDim2.new(0, 120, 0, 40)
PistolBtn.Position = UDim2.new(0, 20, 0, 40)
PistolBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
PistolBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PistolBtn.Font = Enum.Font.GothamBold
PistolBtn.TextSize = 18
PistolBtn.Text = "Pistol"
PistolBtn.Parent = ShopPage

local Pistolcorner = Instance.new("UICorner", PistolBtn)
Pistolcorner.CornerRadius = UDim.new(0, 12)

PistolBtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 560)
	task.wait(0.5)
	shop:InvokeServer("Ammo", "Pistol Ammo")
end)

-- زر Rifle
local Riflebtn = Instance.new("TextButton")
Riflebtn.Name = "Rifle"
Riflebtn.Size = UDim2.new(0, 120, 0, 40)
Riflebtn.Position = UDim2.new(0, 280, 0, 40)
Riflebtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Riflebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Riflebtn.Font = Enum.Font.GothamBold
Riflebtn.TextSize = 18
Riflebtn.Text = "Rifle"
Riflebtn.Parent = ShopPage

local Riflecorner = Instance.new("UICorner", Riflebtn)
Riflecorner.CornerRadius = UDim.new(0, 12)

Riflebtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 1500)
	task.wait(0.5)
	shop:InvokeServer("Ammo", "Rifle Ammo")
end)


-- زر Shotgun
local Shotgunbtn = Instance.new("TextButton")
Shotgunbtn.Name = "Shotgun"
Shotgunbtn.Size = UDim2.new(0, 120, 0, 40)
Shotgunbtn.Position = UDim2.new(0, 150, 0, 40)
Shotgunbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Shotgunbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Shotgunbtn.Font = Enum.Font.GothamBold
Shotgunbtn.TextSize = 18
Shotgunbtn.Text = "Shotgun"
Shotgunbtn.Parent = ShopPage

local Shotguncorner = Instance.new("UICorner", Shotgunbtn)
Shotguncorner.CornerRadius = UDim.new(0, 12)

Shotgunbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 1700)
	task.wait(0.5)
	shop:InvokeServer("Ammo", "Shotgun Ammo")
end)


-- زر Explosive
local Explosivebtn = Instance.new("TextButton")
Explosivebtn.Name = "Explosive"
Explosivebtn.Size = UDim2.new(0, 120, 0, 40)
Explosivebtn.Position = UDim2.new(0, 85, 0, 90)
Explosivebtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Explosivebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Explosivebtn.Font = Enum.Font.GothamBold
Explosivebtn.TextSize = 18
Explosivebtn.Text = "Explosive"
Explosivebtn.Parent = ShopPage

local Explosivecorner = Instance.new("UICorner", Explosivebtn)
Explosivecorner.CornerRadius = UDim.new(0, 12)

Explosivebtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 3000)
	task.wait(0.5)
	shop:InvokeServer("Ammo", "Explosive Ammo")
end)


-- زر Arrows
local Arrowsbtn = Instance.new("TextButton")
Arrowsbtn.Name = "Arrows"
Arrowsbtn.Size = UDim2.new(0, 120, 0, 40)
Arrowsbtn.Position = UDim2.new(0, 215, 0, 90)
Arrowsbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Arrowsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Arrowsbtn.Font = Enum.Font.GothamBold
Arrowsbtn.TextSize = 18
Arrowsbtn.Text = "Arrows"
Arrowsbtn.Parent = ShopPage

local Arrowscorner = Instance.new("UICorner", Arrowsbtn)
Arrowscorner.CornerRadius = UDim.new(0, 12)

Arrowsbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 800)
	task.wait(0.5)
	shop:InvokeServer("Ammo", "Arrows")
end)

--عنوان داخل واجهه Shop

local BoxinfoLabel = Instance.new("TextLabel", ShopPage)
BoxinfoLabel.Size = UDim2.new(0.8, 0, 0, 30)
BoxinfoLabel.Position = UDim2.new(0.1, -160, 0, 150)
BoxinfoLabel.BackgroundTransparency = 1
BoxinfoLabel.TextColor3 = Color3.new(1,1,1)
BoxinfoLabel.Font = Enum.Font.SourceSansBold
BoxinfoLabel.TextSize = 24                         
BoxinfoLabel.Text = "Box Shop:"
BoxinfoLabel.TextXAlignment = Enum.TextXAlignment.Center
BoxinfoLabel.TextYAlignment = Enum.TextYAlignment.Center


local Basicbtn = Instance.new("TextButton")
Basicbtn.Name = "Basic"
Basicbtn.Size = UDim2.new(0, 120, 0, 40)
Basicbtn.Position = UDim2.new(0, 20, 0, 185)
Basicbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Basicbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Basicbtn.Font = Enum.Font.GothamBold
Basicbtn.TextSize = 18
Basicbtn.Text = "Basic"
Basicbtn.Parent = ShopPage

local Basiccorner = Instance.new("UICorner", Basicbtn)
Basiccorner.CornerRadius = UDim.new(0, 12)

Basicbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 55)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Gun",
		[2] = "Basic",
	}))
end)


local Rarebtn = Instance.new("TextButton")
Rarebtn.Name = "Rare"
Rarebtn.Size = UDim2.new(0, 120, 0, 40)
Rarebtn.Position = UDim2.new(0, 150, 0, 185)
Rarebtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Rarebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Rarebtn.Font = Enum.Font.GothamBold
Rarebtn.TextSize = 18
Rarebtn.Text = "Rare"
Rarebtn.Parent = ShopPage

local Rarecorner = Instance.new("UICorner", Rarebtn)
Rarecorner.CornerRadius = UDim.new(0, 12)

Rarebtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 150)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Gun",
		[2] = "Rare",
	}))
end)

local Elitebtn = Instance.new("TextButton")
Elitebtn.Name = "Elite"
Elitebtn.Size = UDim2.new(0, 120, 0, 40)
Elitebtn.Position = UDim2.new(0, 280, 0, 185)
Elitebtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Elitebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Elitebtn.Font = Enum.Font.GothamBold
Elitebtn.TextSize = 18
Elitebtn.Text = "Elite"
Elitebtn.Parent = ShopPage

local Elitecorner = Instance.new("UICorner", Elitebtn)
Elitecorner.CornerRadius = UDim.new(0, 12)

Elitebtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 4000)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Gun",
		[2] = "Elite",
	}))
end)

local Exoticbtn = Instance.new("TextButton")
Exoticbtn.Name = "Exotic"
Exoticbtn.Size = UDim2.new(0, 120, 0, 40)
Exoticbtn.Position = UDim2.new(0, 150, 0, 235)
Exoticbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Exoticbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Exoticbtn.Font = Enum.Font.GothamBold
Exoticbtn.TextSize = 18
Exoticbtn.Text = "Exotic"
Exoticbtn.Parent = ShopPage

local Exoticcorner = Instance.new("UICorner", Exoticbtn)
Exoticcorner.CornerRadius = UDim.new(0, 12)

Exoticbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 16000)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Gun",
		[2] = "Exotic",
	}))
end)

local AccessoriesinfoLabel = Instance.new("TextLabel", ShopPage)
AccessoriesinfoLabel.Size = UDim2.new(0.8, 0, 0, 30)
AccessoriesinfoLabel.Position = UDim2.new(0.1, -125, 0, 295)
AccessoriesinfoLabel.BackgroundTransparency = 1
AccessoriesinfoLabel.TextColor3 = Color3.new(1,1,1)
AccessoriesinfoLabel.Font = Enum.Font.SourceSansBold
AccessoriesinfoLabel.TextSize = 24                         
AccessoriesinfoLabel.Text = "Accessories Shop:"
AccessoriesinfoLabel.TextXAlignment = Enum.TextXAlignment.Center
AccessoriesinfoLabel.TextYAlignment = Enum.TextYAlignment.Center

local GripsAndMagsbtn = Instance.new("TextButton")
GripsAndMagsbtn.Name = "Grips&Mags"
GripsAndMagsbtn.Size = UDim2.new(0, 120, 0, 40)
GripsAndMagsbtn.Position = UDim2.new(0, 20, 0, 330)
GripsAndMagsbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
GripsAndMagsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GripsAndMagsbtn.Font = Enum.Font.GothamBold
GripsAndMagsbtn.TextSize = 18
GripsAndMagsbtn.Text = "Grips&Mags"
GripsAndMagsbtn.Parent = ShopPage

local GripsAndMagscorner = Instance.new("UICorner", GripsAndMagsbtn)
GripsAndMagscorner.CornerRadius = UDim.new(0, 12)

GripsAndMagsbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 1000)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Att",
		[2] = "Grips and Mags",
	}))
end)


local ScopesAndSilencersbtn = Instance.new("TextButton")
ScopesAndSilencersbtn.Name = "Scopes&Silencers"
ScopesAndSilencersbtn.Size = UDim2.new(0, 120, 0, 40)
ScopesAndSilencersbtn.Position = UDim2.new(0, 150, 0, 330)
ScopesAndSilencersbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ScopesAndSilencersbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ScopesAndSilencersbtn.Font = Enum.Font.GothamBold
ScopesAndSilencersbtn.TextSize = 18
ScopesAndSilencersbtn.Text = "Grips&Mags"
ScopesAndSilencersbtn.Parent = ShopPage

local ScopesAndSilencerscorner = Instance.new("UICorner", ScopesAndSilencersbtn)
ScopesAndSilencerscorner.CornerRadius = UDim.new(0, 12)

ScopesAndSilencersbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 1000)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Att",
		[2] = "Scopes and Silencers",
	}))
end)

local BeamsAndButtonsbtn = Instance.new("TextButton")
BeamsAndButtonsbtn.Name = "Beams&Buttons"
BeamsAndButtonsbtn.Size = UDim2.new(0, 120, 0, 40)
BeamsAndButtonsbtn.Position = UDim2.new(0, 280, 0, 330)
BeamsAndButtonsbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
BeamsAndButtonsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BeamsAndButtonsbtn.Font = Enum.Font.GothamBold
BeamsAndButtonsbtn.TextSize = 18
BeamsAndButtonsbtn.Text = "Grips&Mags"
BeamsAndButtonsbtn.Parent = ShopPage

local BeamsAndButtonscorner = Instance.new("UICorner", BeamsAndButtonsbtn)
BeamsAndButtonscorner.CornerRadius = UDim.new(0, 12)

BeamsAndButtonsbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/ShopFunction"]
	bank:InvokeServer("Withdraw", 1000)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Att",
		[2] = "Beams and Buttons",
	}))
end)

local HospitalinfoLabel = Instance.new("TextLabel", ShopPage)
HospitalinfoLabel.Size = UDim2.new(0.8, 0, 0, 30)
HospitalinfoLabel.Position = UDim2.new(0.1, -125, 0, 440)
HospitalinfoLabel.BackgroundTransparency = 1
HospitalinfoLabel.TextColor3 = Color3.new(1,1,1)
HospitalinfoLabel.Font = Enum.Font.SourceSansBold
HospitalinfoLabel.TextSize = 24                         
HospitalinfoLabel.Text = "Hospital&Soda Shop:"
HospitalinfoLabel.TextXAlignment = Enum.TextXAlignment.Center
HospitalinfoLabel.TextYAlignment = Enum.TextYAlignment.Center


local Medkitbtn = Instance.new("TextButton")
Medkitbtn.Name = "Medkit"
Medkitbtn.Size = UDim2.new(0, 120, 0, 40)
Medkitbtn.Position = UDim2.new(0, 20, 0, 475)
Medkitbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Medkitbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Medkitbtn.Font = Enum.Font.GothamBold
Medkitbtn.TextSize = 18
Medkitbtn.Text = "Medkit"
Medkitbtn.Parent = ShopPage

local Medkitcorner = Instance.new("UICorner", Medkitbtn)
Medkitcorner.CornerRadius = UDim.new(0, 12)

Medkitbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/NormalShopFunction"]
	bank:InvokeServer("Withdraw", 200)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Hospital",
		[2] = "Medkit",
	}))
end)

local Pillbtn = Instance.new("TextButton")
Pillbtn.Name = "Pill"
Pillbtn.Size = UDim2.new(0, 120, 0, 40)
Pillbtn.Position = UDim2.new(0, 150, 0, 475)
Pillbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Pillbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Pillbtn.Font = Enum.Font.GothamBold
Pillbtn.TextSize = 18
Pillbtn.Text = "Pill"
Pillbtn.Parent = ShopPage

local Pillcorner = Instance.new("UICorner", Pillbtn)
Pillcorner.CornerRadius = UDim.new(0, 12)

Pillbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/NormalShopFunction"]
	bank:InvokeServer("Withdraw", 20)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Hospital",
		[2] = "Pill",
	}))
end)

local Bandagebtn = Instance.new("TextButton")
Bandagebtn.Name = "Bandage"
Bandagebtn.Size = UDim2.new(0, 120, 0, 40)
Bandagebtn.Position = UDim2.new(0, 280, 0, 475)
Bandagebtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Bandagebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Bandagebtn.Font = Enum.Font.GothamBold
Bandagebtn.TextSize = 18
Bandagebtn.Text = "Bandage"
Bandagebtn.Parent = ShopPage

local Bandagecorner = Instance.new("UICorner", Bandagebtn)
Bandagecorner.CornerRadius = UDim.new(0, 12)

Bandagebtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/NormalShopFunction"]
	bank:InvokeServer("Withdraw", 75)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Hospital",
		[2] = "Bandage",
	}))
end)

local BloodBagbtn = Instance.new("TextButton")
BloodBagbtn.Name = "Blood Bag"
BloodBagbtn.Size = UDim2.new(0, 120, 0, 40)
BloodBagbtn.Position = UDim2.new(0, 85, 0, 525)
BloodBagbtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
BloodBagbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BloodBagbtn.Font = Enum.Font.GothamBold
BloodBagbtn.TextSize = 18
BloodBagbtn.Text = "Blood Bag"
BloodBagbtn.Parent = ShopPage

local BloodBagcorner = Instance.new("UICorner", BloodBagbtn)
BloodBagcorner.CornerRadius = UDim.new(0, 12)

BloodBagbtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/NormalShopFunction"]
	bank:InvokeServer("Withdraw", 150)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "Hospital",
		[2] = "Blood Bag",
	}))
end)

local Sodabtn = Instance.new("TextButton")
Sodabtn.Name = "Soda"
Sodabtn.Size = UDim2.new(0, 120, 0, 40)
Sodabtn.Position = UDim2.new(0, 215, 0, 525)
Sodabtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Sodabtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Sodabtn.Font = Enum.Font.GothamBold
Sodabtn.TextSize = 18
Sodabtn.Text = "Soda"
Sodabtn.Parent = ShopPage

local Sodacorner = Instance.new("UICorner", Sodabtn)
Sodacorner.CornerRadius = UDim.new(0, 12)

Sodabtn.MouseButton1Click:Connect(function()
	local bank = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/BankEvent"]
	local shop = ReplicatedStorage.Modules.Packages._Index["sleitnick_net@0.2.0"].net["RF/NormalShopFunction"]
	bank:InvokeServer("Withdraw", 250)
	task.wait(0.5)
	shop:InvokeServer(table.unpack({
		[1] = "General",
		[2] = "Farmerade",
	}))
end)


-- زر قائمة التجاهل Ignore List
local IgnoreButton = Instance.new("TextButton", page)
IgnoreButton.Size = UDim2.new(0, 150, 0, 35)
IgnoreButton.Position = UDim2.new(0, 10, 0, 160) -- تحت السلايدر
IgnoreButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
IgnoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
IgnoreButton.Font = Enum.Font.SourceSansBold
IgnoreButton.TextSize = 16
IgnoreButton.Text = "Ignore List"

local IgnoreCorner = Instance.new("UICorner", IgnoreButton)
IgnoreCorner.CornerRadius = UDim.new(0, 8)

-- القائمة المنبثقة
local IgnorePopup = Instance.new("Frame", page)
IgnorePopup.Size = UDim2.new(0, 250, 0, 250)
IgnorePopup.Position = UDim2.new(0, 170, 0, 50) 
IgnorePopup.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
IgnorePopup.Visible = false

local popupCorner = Instance.new("UICorner", IgnorePopup)
popupCorner.CornerRadius = UDim.new(0, 8)

local scroll = Instance.new("ScrollingFrame", IgnorePopup)
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.CanvasSize = UDim2.new(0, 0, 0, 300)
scroll.ScrollBarThickness = 5
scroll.BackgroundTransparency = 1

IgnoreButton.MouseButton1Click:Connect(function()
    IgnorePopup.Visible = not IgnorePopup.Visible
end)

local function RefreshIgnoreList()
    scroll:ClearAllChildren()

    local y = 0
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer then

            local btn = Instance.new("TextButton", scroll)
            btn.Size = UDim2.new(1, -10, 0, 35)
            btn.Position = UDim2.new(0, 5, 0, y)
            btn.BackgroundColor3 = IgnoredPlayers[pl.Name] 
                and Color3.fromRGB(120, 40, 40)
                or Color3.fromRGB(55, 55, 55)

            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Text = pl.Name
            btn.Font = Enum.Font.SourceSansBold
            btn.TextSize = 16

            btn.MouseButton1Click:Connect(function()
                if IgnoredPlayers[pl.Name] then
                    IgnoredPlayers[pl.Name] = nil
                    btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                else
                    IgnoredPlayers[pl.Name] = true
                    btn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
                end
            end)

            y += 40
        end
    end
    
    scroll.CanvasSize = UDim2.new(0, 0, 0, y)
end

task.spawn(function()
    while true do
        if IgnorePopup.Visible then
            RefreshIgnoreList()
        end
        task.wait(1)
    end
end)
