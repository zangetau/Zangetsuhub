
-- Zangetsu Hub v1
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local HttpService = game:GetService("HttpService")

-- Destroy old UI if exists
if PlayerGui:FindFirstChild("ZangetsuHub") then
    PlayerGui.ZangetsuHub:Destroy()
end

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "ZangetsuHub"
screenGui.ResetOnSpawn = false

-- Open Button
local openButton = Instance.new("ImageButton", screenGui)
openButton.Name = "OpenButton"
openButton.Size = UDim2.new(0, 60, 0, 60)
openButton.Position = UDim2.new(0, 10, 0.5, -30)
openButton.Image = "rbxassetid://YOUR_IMAGE_ID"
openButton.BackgroundTransparency = 1

-- Main Frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Zangetsu Hub v1"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Fantasy
title.TextSize = 28

-- Tab buttons
local tabs = {"Home", "Games", "Community", "Settings"}
for i, tabName in pairs(tabs) do
    local tab = Instance.new("TextButton", mainFrame)
    tab.Size = UDim2.new(0, 90, 0, 30)
    tab.Position = UDim2.new(0, 10 + (i - 1) * 95, 0, 50)
    tab.Text = tabName
    tab.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    tab.TextColor3 = Color3.new(1, 1, 1)
    tab.Name = tabName .. "Tab"
end

-- Open/Close logic
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Dragging
local UIS = game:GetService("UserInputService")
local dragToggle, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragToggle then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                       startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Add loading screen
local loadingScreen = Instance.new("TextLabel", screenGui)
loadingScreen.Size = UDim2.new(1, 0, 1, 0)
loadingScreen.Text = "Loading Zangetsu Hub..."
loadingScreen.TextSize = 32
loadingScreen.Font = Enum.Font.SourceSansBold
loadingScreen.TextColor3 = Color3.new(1, 1, 1)
loadingScreen.BackgroundColor3 = Color3.new(0, 0, 0)
loadingScreen.ZIndex = 10

task.wait(2)
loadingScreen:Destroy()
