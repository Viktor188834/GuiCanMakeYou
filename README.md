--Библиотека: 
local Guis = loadstring(game:HttpGet("https://raw.githubusercontent.com/Viktor188834/GuiCanMakeYou/refs/heads/main/Script.lua"))()

-- ПРИМЕР: TEMPLATE:

Guis:AddSection("Text")

Guis:AddClickButton("Text", function()
	print("Clicked")
end, "On Mouse Enter Display Text")

Guis:AddSection("--Teleportasions--")

Guis:AddSlideButton("Text", function()
	print("On")
end, function()
	print("Off")
end, "TextOnMouseEnter")

Guis:AddTextBox("ChangeSpeed", function(TextOnExit)
	character.Humanoid.WalkSpeed = tonumber(TextOnExit)
end, "TextOnMouseEnter")

