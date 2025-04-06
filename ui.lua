-- UI START
local player = game.Players.LocalPlayer
local plrGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", plrGui)
ScreenGui.Name = "ZangetsuHub"

local OpenButton = Instance.new("ImageButton", ScreenGui)
OpenButton.Size = UDim2.new(0, 60, 0, 60)
OpenButton.Position = UDim2.new(0, 10, 0, 10)
OpenButton.Image = "https://raw.githubusercontent.com/zangetau/Zangetsuhub/main/zangetsu.png"
OpenButton.Name = "OpenButton"
OpenButton.BackgroundTransparency = 1

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
MainFrame.Visible = false
MainFrame.Name = "MainMenu"

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "Zangetsu Hub V1"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 26

-- Toggle Menu
OpenButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)
