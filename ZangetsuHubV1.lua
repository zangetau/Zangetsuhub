loadstring(game:HttpGet("https://raw.githubusercontent.com/zangetau/Zangetsuhub/main/ui.lua"))()




-- Zangetsu Hub V1 Loader
repeat wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
	Title = "Zangetsu Hub V1";
	Text = "Loading Zangetsu Hub...";
	Duration = 3;
})

wait(2)

-- Load actual hub
loadstring(game:HttpGet("https://raw.githubusercontent.com/zangetau/Zangetsuhub/main/ui.lua"))()
