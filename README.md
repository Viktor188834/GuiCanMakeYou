Библиотека: loadstring(game:HttpGet("https://raw.githubusercontent.com/Viktor188834/GuiCanMakeYou/refs/heads/main/Script.lua"))()

после этой строки которая библиотека, 

--[[AddClickButton("Text", function()
	print("LLLLLLolololol")
end, "MouseText(Необезательно)")]]

--[[AddTextBox("Speed", function(text)
	Speeeed = tonumber(text)
end, "MouseText(Необезательно)")]]

--[[AddSlideButton("PrintLol", function()
	print("On")
end, function()
	print("Off")
end, "MouseText(Необезательно)")]]

--character - персонаж, тоесть твой персонаж
--например телепортация: character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
--например изменение скорости: character.Humanoid.WalkSpeed = 100
--и есть телепортация выше себя на 100 студов: character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)

AddSection("--Teleportings--")

AddClickButton("Teleport Up You 100 Studs", function()
	character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)
end, "Teleport Up Your'e character 100 Studs")
