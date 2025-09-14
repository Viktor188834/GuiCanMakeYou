local uis = game:GetService("UserInputService")
local Enabled = true
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local hidded = false

local Guis = {}

local gui = {
	gui = Instance.new("ScreenGui"),
	Framev1 = Instance.new("Frame"),
	ScrollingFrame1 = Instance.new("ScrollingFrame"),
	uigridlayout = Instance.new("UIGridLayout"),
	TextV1 = Instance.new("TextBox"),
	Delete = Instance.new("TextButton"),
	Hide = Instance.new("TextButton")
}

local function UiCorner(parent, Size)
	local uic = Instance.new("UICorner")
	uic.Parent = parent
	uic.CornerRadius = UDim.new(0, Size)
end

local function NewImage(parent, Image)
	local image = Instance.new("ImageLabel")
	image.Parent = parent
	image.Image = Image
	image.Active = false
	image.BackgroundTransparency = 1
	repeat wait() image.Image = Image until image.Image == Image
	return image
end

local sound = nil

local function ClickSound()
	if sound == nil then
		sound = Instance.new("Sound")
		sound.Parent = plr
		sound.SoundId = "rbxassetid://6895079853"
		repeat wait() until sound.IsLoaded == true
		sound.Volume = 1
		sound:Play()
	else
		sound:Play()
	end
end

plr.CharacterAdded:Connect(function(char)
	sound = Instance.new("Sound")
	sound.Parent = plr
	sound.SoundId = "rbxassetid://6895079853"
	repeat wait() until sound.IsLoaded == true
	sound.Volume = 1
end)

gui.gui.ResetOnSpawn = false
gui.gui.Parent = plr.PlayerGui
gui.uigridlayout.Parent = gui.ScrollingFrame1
gui.uigridlayout.CellSize = UDim2.new(0.8, 0, 0, 40)
gui.uigridlayout.SortOrder = Enum.SortOrder.LayoutOrder
gui.ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 0, gui.ScrollingFrame1.UIGridLayout.AbsoluteContentSize.Y)

gui.ScrollingFrame1.ChildAdded:Connect(function()
	gui.ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 0, gui.ScrollingFrame1.UIGridLayout.AbsoluteContentSize.Y)
end)

gui.ScrollingFrame1.ChildRemoved:Connect(function()
	gui.ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 0, gui.ScrollingFrame1.UIGridLayout.AbsoluteContentSize.Y)
end)

UiCorner(gui.ScrollingFrame1, 5)
UiCorner(gui.Framev1, 5)
gui.Framev1.Parent = gui.gui
gui.Framev1.Size = UDim2.new(0.15, 0, 0.1, 0)
gui.Framev1.Draggable = true
gui.Framev1.Position = UDim2.new(0.7, 0, 0.5, 0)
gui.Framev1.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
gui.Framev1.Active = true
gui.Framev1.Selectable = true
gui.ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 0, gui.ScrollingFrame1.UIGridLayout.AbsoluteContentSize.Y)
gui.ScrollingFrame1.Parent = gui.Framev1
gui.ScrollingFrame1.Size = UDim2.new(1, 0, 3, 0)
gui.ScrollingFrame1.Position = UDim2.new(0, 0, 0.5, 0)
gui.ScrollingFrame1.BackgroundColor3 = Color3.fromRGB(24, 24, 24)

gui.Delete.Parent = gui.Framev1
gui.Delete.Size = UDim2.new(0.15, 0, 0.4, 0)
gui.Delete.Position = UDim2.new(0.825, 0, 0.05, 0)
gui.Delete.BorderSizePixel = 0
gui.Delete.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
gui.Delete.TextColor3 = Color3.fromRGB(210, 210, 210)
gui.Delete.Text = "X"
gui.Delete.TextWrapped = true
gui.Delete.TextScaled = true

gui.Hide.Parent = gui.Framev1
gui.Hide.Size = UDim2.new(0.15, 0, 0.4, 0)
gui.Hide.Position = UDim2.new(0.650, 0, 0.05, 0)
gui.Hide.BorderSizePixel = 0
gui.Hide.BackgroundColor3 = Color3.fromRGB(127, 139, 220)
gui.Hide.TextColor3 = Color3.fromRGB(210, 210, 210)
gui.Hide.Text = "-"
gui.Hide.TextWrapped = true
gui.Hide.TextScaled = true

gui.Delete.MouseButton1Click:Connect(function()
	gui.gui:Destroy()
	if sound ~= nil then
		sound:Destroy()
	end
end)

gui.Hide.MouseButton1Click:Connect(function()
	if hidded == false then
		gui.Framev1:TweenSize(UDim2.new(0.15, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
			gui.Framev1.Visible = false
			hidded = true
		end)
	else
		gui.Framev1.Visible = true
		gui.Framev1:TweenSize(UDim2.new(0.15, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
			hidded = false
		end)
	end
end)

UiCorner(gui.Delete, 5)
UiCorner(gui.Hide, 5)

function Guis:AddClickButton(Text, fun, TextOnMouseEnter)
	local button = Instance.new("TextButton")
	button.Text = Text
	button.Name = Text
	button.Parent = gui.ScrollingFrame1
	button.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	button.TextColor3 = Color3.fromRGB(239, 239, 239)
	button.RichText = true
	button.TextWrapped = true
	button.TextScaled = true
	button.Size = UDim2.new(1, 0, 1, 0)
	button.Position = UDim2.new(0, 0, 1, 0)
	button.AutoButtonColor = false
	button.TextXAlignment = Enum.TextXAlignment.Left
	UiCorner(button, 3)
	local image = NewImage(button, "rbxassetid://16081386298")
	image.Size = UDim2.new(0.2, 0, 0.6, 0)
	image.Position = UDim2.new(1, 0, 0.2, 0)
	-- functions<<
	button.MouseButton1Click:Connect(function()
		ClickSound()
		fun()
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*7
		button.MouseEnter:Connect(function(x, y)
			local MouseText = Instance.new("TextLabel")
			MouseText.ZIndex = 1000
			mousetext = MouseText
			MouseText.Parent = gui.gui
			MouseText.BorderSizePixel = 0
			MouseText.TextWrapped = true
			MouseText.TextScaled = true
			UiCorner(MouseText, 1)
			MouseText.Text = TextOnMouseEnter
			MouseText.TextColor3 = Color3.fromRGB(239, 239, 239)
			MouseText.Size = UDim2.new(0, offsetX, 0, 0)
			MouseText:TweenSize(UDim2.new(0, offsetX, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
			MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			MouseText.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext ~= nil then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
	-->>
	return button
end

function Guis:AddTextBox(Text, funWithText, TextOnMouseEnter)
	local button = Instance.new("TextBox")
	button.Text = Text
	button.Name = Text
	button.Parent = gui.ScrollingFrame1
	button.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	button.TextColor3 = Color3.fromRGB(239, 239, 239)
	button.TextWrapped = true
	button.TextScaled = true
	button.RichText = true
	UiCorner(button, 3)
	-- functions<<
	button.Focused:Connect(function()
		ClickSound()
	end)
	button.FocusLost:Connect(function()
		ClickSound()
		funWithText(button.Text)
		button.Text = Text
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*7
		button.MouseEnter:Connect(function(x, y)
			local MouseText = Instance.new("TextLabel")
			mousetext = MouseText
			MouseText.Parent = gui.gui
			MouseText.BorderSizePixel = 0
			MouseText.TextWrapped = true
			MouseText.TextScaled = true
			MouseText.ZIndex = 1000
			UiCorner(MouseText, 1)
			MouseText.Text = TextOnMouseEnter
			MouseText.TextColor3 = Color3.fromRGB(239, 239, 239)
			MouseText.Size = UDim2.new(0, offsetX, 0, 0)
			MouseText:TweenSize(UDim2.new(0, offsetX, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
			MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			MouseText.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext ~= nil then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
	-->>
	return button
end

function Guis:AddSlideButton(Text, functionOn, functionOff, TextOnMouseEnter)
	local button = Instance.new("TextButton")
	button.Text = ""
	button.Name = Text
	button.Parent = gui.ScrollingFrame1
	button.BackgroundColor3 = Color3.fromRGB(165, 0, 0)
	button.TextColor3 = Color3.fromRGB(239, 239, 239)
	button.RichText = true
	button.TextWrapped = true
	button.TextScaled = true
	button.AutoButtonColor = false
	local Textt = Instance.new("TextLabel")
	Textt.Parent = button
	Textt.Text = Text
	Textt.TextColor3 = Color3.fromRGB(231, 231, 231)
	Textt.Size = UDim2.new(1, 0, 1, 0)
	Textt.Position = UDim2.new(0, 0, 0, 0)
	Textt.TextWrapped = true
	Textt.TextScaled = true
	Textt.BackgroundTransparency = 1
	Textt.ZIndex = 2
	UiCorner(button, 3)
	local Slide = Instance.new("Frame")
	Slide.Parent = button
	Slide.BackgroundColor3 = Color3.fromRGB(91, 0, 0)
	UiCorner(Slide, 9999)
	Slide.Size = UDim2.new(0.25, 0, 0.9, 0)
	Slide.Position = UDim2.new(0.01, 0, 0.05, 0)
	-- functions<<
	local En = false
	local coldown = false
	button.MouseButton1Click:Connect(function()
		ClickSound()
		if En == false then
			En = true
			game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 165, 0)}):Play()
			game:GetService("TweenService"):Create(Slide, TweenInfo.new(0.2), {Position = UDim2.new(((1-Slide.Size.X.Scale)-0.01), 0, 0.05, 0), BackgroundColor3 = Color3.fromRGB(0, 91, 0)}):Play()
			functionOn()
		elseif En == true then
			En = false
			game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(165, 0, 0)}):Play()
			game:GetService("TweenService"):Create(Slide, TweenInfo.new(0.2), {Position = UDim2.new(0.01, 0, 0.05, 0), BackgroundColor3 = Color3.fromRGB(91, 0, 0)}):Play()
			functionOff()
		end
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*7
		button.MouseEnter:Connect(function(x, y)
			local MouseText = Instance.new("TextLabel")
			mousetext = MouseText
			MouseText.Parent = gui.gui
			MouseText.BorderSizePixel = 0
			MouseText.TextWrapped = true
			MouseText.ZIndex = 1000
			MouseText.TextScaled = true
			UiCorner(MouseText, 1)
			MouseText.Text = TextOnMouseEnter
			MouseText.TextColor3 = Color3.fromRGB(239, 239, 239)
			MouseText.Size = UDim2.new(0, offsetX, 0, 0)
			MouseText:TweenSize(UDim2.new(0, offsetX, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
			MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			MouseText.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext ~= nil then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
	-->>
	return button
end

function Guis:AddKeybind(Text, fun, StarterKeybind, TextOnMouseEnter)
	local Keybind = Enum.KeyCode.Y
	if StarterKeybind then
		Keybind = StarterKeybind
	end
	local button = Instance.new("TextButton")
	button.Text = Text
	button.Name = Text
	button.Parent = gui.ScrollingFrame1
	button.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	button.TextColor3 = Color3.fromRGB(239, 239, 239)
	button.RichText = true
	button.TextWrapped = true
	button.TextScaled = true
	button.AutoButtonColor = false
	UiCorner(button, 3)
	local image = NewImage(button, "rbxassetid://71459514973341")
	local keycodee = Instance.new("TextLabel")
	keycodee.Parent = image
	keycodee.Text = Keybind.Name
	keycodee.Size = UDim2.new(0.25, 0, 0.25, 0)
	keycodee.TextWrapped = true
	keycodee.TextScaled = true
	keycodee.TextColor3 = Color3.fromRGB(239, 239, 239)
	keycodee.BackgroundTransparency = 1
	keycodee.Position = UDim2.new(0.5, 0, 0.5, 0)
	image.Size = UDim2.new(0.25, 0, 1, 0)
	image.Position = UDim2.new(1, 0, 0, 0)
	button.MouseButton1Click:Connect(function()
		button.Text = "..."
		wait(0.3)
		local KeyCode = uis.InputBegan:Wait()
		if KeyCode.KeyCode.EnumType == Enum.KeyCode then
			Keybind = KeyCode.KeyCode
			keycodee.Text = KeyCode.KeyCode.Name
			button.Text = Text
		end
	end)
	uis.InputBegan:Connect(function(i, g)
		if g then return end
		if i.KeyCode == Keybind then
			fun()
		end
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*7
		button.MouseEnter:Connect(function(x, y)
			local MouseText = Instance.new("TextLabel")
			mousetext = MouseText
			MouseText.Parent = gui.gui
			MouseText.BorderSizePixel = 0
			MouseText.TextWrapped = true
			MouseText.ZIndex = 1000
			MouseText.TextScaled = true
			UiCorner(MouseText, 1)
			MouseText.Text = TextOnMouseEnter
			MouseText.TextColor3 = Color3.fromRGB(239, 239, 239)
			MouseText.Size = UDim2.new(0, offsetX, 0, 0)
			MouseText:TweenSize(UDim2.new(0, offsetX, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
			MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			MouseText.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext ~= nil then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
	return button
end

function Guis:AddSection(Text)
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = gui.ScrollingFrame1
	TextLabel.BorderSizePixel = 0
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextColor3 = Color3.fromRGB(232, 232, 232)
	TextLabel.Text = Text
	TextLabel.TextScaled = true
	TextLabel.TextWrapped = true
	TextLabel.RichText = true
	return TextLabel
end

local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()

plr.CharacterAdded:Connect(function(newChar)
	character = newChar
end)

uis.InputBegan:Connect(function(i, g)
	if g then return end
	if i.KeyCode == Enum.KeyCode.G then
		if hidded == false then
			gui.Framev1:TweenSize(UDim2.new(0.15, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
				gui.Framev1.Visible = false
				hidded = true
			end)
		else
			gui.Framev1.Visible = true
			gui.Framev1:TweenSize(UDim2.new(0.15, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
				hidded = false
			end)
		end
	end
end)

return Guis
