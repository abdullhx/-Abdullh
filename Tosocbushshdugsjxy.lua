--==============================
-- Services
--==============================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

--==============================
-- Speeds
--==============================
local SPEED_DOWN = 999
local SPEED_X = 999

--==============================
-- Positions
--==============================
local Y_POS = -2.77
local Z_MID = -138.12
local Z_FINAL = 0

--==============================
-- X Locations
--==============================
local locations = {
	Common = 200,
	Uncommon = 284,
	Rare = 400,
	Epic = 540,
	Legendary = 756,
	Mythical = 1075,
	Cosmic = 1569,
	Secret = 2240,
	Celestial = 2600,
	Back = 128
}

--==============================
-- Character Helpers
--==============================
local isAttached = false
local lockConnection

local function getChar()
	return player.Character or player.CharacterAdded:Wait()
end

local function getHRP()
	return getChar():WaitForChild("HumanoidRootPart")
end

local function getHumanoid()
	return getChar():WaitForChild("Humanoid")
end

local function startLock()
	local hrp = getHRP()
	lockConnection = RunService.Heartbeat:Connect(function()
		if isAttached then
			hrp.AssemblyLinearVelocity = Vector3.zero
			hrp.AssemblyAngularVelocity = Vector3.zero
			hrp.Position = Vector3.new(hrp.Position.X, Y_POS, hrp.Position.Z)
		end
	end)
end

local function stopLock()
	if lockConnection then
		lockConnection:Disconnect()
		lockConnection = nil
	end
end

local function Attach()
	getHumanoid().PlatformStand = true
	isAttached = true
	startLock()
end

local function Detach()
	getHumanoid().PlatformStand = false
	isAttached = false
	stopLock()
end

player.CharacterAdded:Connect(function()
	task.wait(0.2)
	Detach()
end)

--==============================
-- Tween Helper
--==============================
local function tweenTo(posX, posZ, speed)
	local hrp = getHRP()
	local goal = Vector3.new(posX, Y_POS, posZ)
	local time = (hrp.Position - goal).Magnitude / speed

	local tween = TweenService:Create(
		hrp,
		TweenInfo.new(time, Enum.EasingStyle.Linear),
		{Position = goal}
	)
	tween:Play()
	tween.Completed:Wait()
end

--==============================
-- Teleport
--==============================
local busy = false
local function teleport(targetX, isBack)
	if busy then return end
	busy = true

	local hrp = getHRP()
	Attach()

	tweenTo(hrp.Position.X, Z_MID, SPEED_DOWN)
	tweenTo(targetX, Z_MID, SPEED_X)

	if not isBack then
		tweenTo(targetX, Z_FINAL, SPEED_DOWN)
	end

	Detach()
	busy = false
end

--==============================
-- GUI
--==============================
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- Icon (A7x)
--------------------------------------------------
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.fromOffset(60,60)
icon.Position = UDim2.fromScale(0.02,0.5)
icon.Text = "A7x"
icon.Font = Enum.Font.GothamBold
icon.TextSize = 20
icon.TextColor3 = Color3.new(1,1,1)
icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
icon.BorderSizePixel = 0
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

--------------------------------------------------
-- Main Frame
--------------------------------------------------
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.45,0.75)
frame.Position = UDim2.fromScale(0.27,0.12)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,20)

--------------------------------------------------
-- Title
--------------------------------------------------
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "A7xDev Teleport"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,200,0)

--------------------------------------------------
-- Grid
--------------------------------------------------
local gridHolder = Instance.new("Frame", frame)
gridHolder.Size = UDim2.new(1,-20,1,-80)
gridHolder.Position = UDim2.new(0,10,0,60)
gridHolder.BackgroundTransparency = 1

local grid = Instance.new("UIGridLayout", gridHolder)
grid.CellSize = UDim2.new(0.3,0,0,45)
grid.CellPadding = UDim2.new(0.03,0,0.03,0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center

--------------------------------------------------
-- Buttons
--------------------------------------------------
local function createButton(name)
	local btn = Instance.new("TextButton", gridHolder)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

	btn.MouseButton1Click:Connect(function()
		teleport(locations[name], false)
	end)
end

for name,_ in pairs(locations) do
	if name ~= "Back" then
		createButton(name)
	end
end

--------------------------------------------------
-- Back Button (منفصل)
--------------------------------------------------
local backBtn = Instance.new("TextButton", gui)
backBtn.Size = UDim2.fromOffset(130,45)
backBtn.Position = UDim2.fromScale(0.45,0.88)
backBtn.Text = "BACK"
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 18
backBtn.TextColor3 = Color3.new(1,1,1)
backBtn.BackgroundColor3 = Color3.fromRGB(160,40,40)
backBtn.BorderSizePixel = 0
Instance.new("UICorner", backBtn).CornerRadius = UDim.new(0,16)

backBtn.MouseButton1Click:Connect(function()
	teleport(locations.Back, true)
end)

--------------------------------------------------
-- Drag (Mobile + PC)
--------------------------------------------------
local function makeDraggable(ui)
	local dragging, startPos, dragStart

	ui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = ui.Position
		end
	end)

	ui.InputEnded:Connect(function()
		dragging = false
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and (
			input.UserInputType == Enum.UserInputType.Touch
			or input.UserInputType == Enum.UserInputType.MouseMovement
		) then
			local delta = input.Position - dragStart
			ui.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

makeDraggable(frame)
makeDraggable(icon)
makeDraggable(backBtn)

--------------------------------------------------
-- Icon Toggle (يخفي الواجهة فقط)
--------------------------------------------------
icon.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)
