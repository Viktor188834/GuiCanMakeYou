Библиотека: loadstring(game:HttpGet(""))()

AddClickButton("Teleport", function()
	print("LLLLLLolololol")
end, "You are loser")

AddTextBox("Speed", function(text)
	Speeeed = tonumber(text)
end, "Change Your Speed to Entered Number")

AddSlideButton("PrintLol", function()
	print("On")
end, function()
	print("Off")
end, "Test")

--character - персонаж, тоесть твой персонаж
--например телепортация: character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
--например изменение скорости: character.Humanoid.WalkSpeed = 100
--и есть телепортация выше себя на 100 студов: character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)

AddSection("--Teleportings--")

AddClickButton("Teleport Up You 100 Studs", function()
	character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)
end, "Teleport Up Your'e character 100 Studs")
