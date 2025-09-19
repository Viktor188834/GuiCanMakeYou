local uis = game:GetService("UserInputService")
local Enabled = true
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local hidded = false
local EnabledKeyBinds = true
local DeveloperName = "gondonmev1488"
local run = game:GetService("RunService")

local Guis = {}

function WaitForIsA(parent, ClassName, MaxTime)
	MaxTime = MaxTime or 10
	local StartTime = os.clock()
	while os.clock() - StartTime < MaxTime do
		if parent:FindFirstChildOfClass(ClassName) then
			return parent:FindFirstChildOfClass(ClassName)
		end
		wait()
	end
end

function NewImage(parent, Image)
	local image = Instance.new("ImageLabel")
	image.Parent = parent
	image.Image = Image
	image.Active = false
	image.BackgroundTransparency = 1
	repeat wait() image.Image = Image until image.Image == Image
	return image
end

local gui = {
	gui = Instance.new("ScreenGui", game:GetService("CoreGui") or WaitForIsA(plr, "PlayerGui")),
	Framev1 = Instance.new("Frame"),
	ScrollingFrame1 = Instance.new("ScrollingFrame"),
	uigridlayout = Instance.new("UIGridLayout"),
	TextV1 = Instance.new("TextBox"),
	Delete = Instance.new("TextButton"),
	Hide = Instance.new("TextButton"),
}

gui.gui:SetAttribute("BackgroundTransparency", 0)

local SectionRN = nil
local Sections = {}

function Guis:Notification(Table)
	local Text = Table.Text
	local TextTittle = Table.TextTittle
	local Duration = Table.Duration or 7
	local Image = Table.Image
	local MNF = Instance.new("CanvasGroup")
	MNF.Parent = gui.gui
	MNF.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	MNF.Size = UDim2.new(0.22, 0, 0.15, 0)
	MNF.Position = UDim2.new(1, 0, 0.81, 0)
	MNF.ZIndex = 0
	if gui.gui:FindFirstChild("Notification") then
		gui.gui:FindFirstChild("Notification"):Destroy()
	end
	MNF.Name = "Notification"
	UiCorner(MNF, 10)
	local Texxl = Instance.new("TextLabel")
	Texxl.Parent = MNF
	Texxl.Size = UDim2.new(0.5, 0, 0.2, 0)
	Texxl.Position = UDim2.new(0.5, 0, 0.05, 0)
	Texxl.Text = Text or ""
	Texxl.TextColor3 = Color3.fromRGB(239, 239, 239)
	Texxl.TextScaled = true
	Texxl.TextWrapped = true
	Texxl.TextXAlignment = Enum.TextXAlignment.Left
	Texxl.BackgroundTransparency = 1
	Texxl.BorderSizePixel = 0
	local Descrpt = Instance.new("TextLabel")
	Descrpt.Parent = MNF
	Descrpt.Size = UDim2.new(0.5, 0, 0.6, 0)
	Descrpt.Position = UDim2.new(0.04, 0, 0.3, 0)
	Descrpt.Text = TextTittle or ""
	Descrpt.TextColor3 = Color3.fromRGB(239, 239, 239)
	Descrpt.TextScaled = true
	Descrpt.TextWrapped = true
	Descrpt.TextXAlignment = Enum.TextXAlignment.Left
	Descrpt.BackgroundTransparency = 1
	Descrpt.BorderSizePixel = 0
	Descrpt.TextTransparency = 0.5
	if not TextTittle and Text then
		Texxl.Size = UDim2.new(0.5, 0, 0.7, 0)
		Texxl.Position = UDim2.new(0.05, 0, 0.05, 0)
	end
	if not Text and TextTittle then
		Descrpt.Size = UDim2.new(0.5, 0, 0.7, 0)
		Descrpt.Position = UDim2.new(0.05, 0, 0.05, 0)
	end
	local Imae = nil
	if Image then
		local Imae = NewImage(MNF, Image)
		Imae.Size = UDim2.new(0.3, 0, 0.75, 0)
		Imae.Position = UDim2.new(0.65, 0, 0.125, 0)
	end
	local DI = Instance.new("Frame")
	DI.Size = UDim2.new(1, 0, 0.07, 0)
	DI.Position = UDim2.new(0, 0, 0.95, 0)
	DI.Parent = MNF
	DI.BorderSizePixel = 0
	DI.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	DI.ZIndex = 1
	DI:TweenSize(UDim2.new(0, 0, 0.07, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, (Duration/2), false, function()
		wait(Duration/5)
		game:GetService("TweenService"):Create(MNF, TweenInfo.new(Duration/2), {BackgroundTransparency = 1, Position = UDim2.new(0.75, 0, 0.4, 0)}):Play()
		game:GetService("TweenService"):Create(DI, TweenInfo.new(Duration/2), {BackgroundTransparency = 1}):Play()
		game:GetService("TweenService"):Create(Texxl, TweenInfo.new(Duration/2), {TextTransparency = 1}):Play()
		game:GetService("TweenService"):Create(Descrpt, TweenInfo.new(Duration/2), {TextTransparency = 1}):Play()
		if Imae then
			game:GetService("TweenService"):Create(Imae, TweenInfo.new(Duration/2), {ImageTransparency = 1}):Play()
		end
		wait(Duration/2)
		MNF:Destroy()
	end)
	UiCorner(DI, 9999999)
	MNF:TweenPosition(UDim2.new(0.75, 0, 0.72, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.3, true)
end

function ToSection(button)
	for i,v in Sections do
		if v.Find == SectionRN then
			table.insert(v.InSection, button)
		end
	end
end

function UiCorner(parent, Size)
	local uic = Instance.new("UICorner")
	uic.Parent = parent
	uic.CornerRadius = UDim.new(0, Size)
end

local sound = nil

function ClickSound()
	if sound == nil then
		sound = Instance.new("Sound")
		sound.Parent = plr
		sound.Name = "ClickSound"
		sound.SoundId = "rbxassetid://6895079853"
		repeat wait() until sound.IsLoaded == true
		sound.Volume = 1
		sound:Play()
	else
		sound:Play()
	end
end

local Sound1 = nil

function TextSound()
	if Sound1 == nil then
		Sound1 = Instance.new("Sound")
		Sound1.Parent = plr
		Sound1.Name = "TextSound"
		Sound1.SoundId = "rbxassetid://5416666166"
		repeat wait() until Sound1.IsLoaded == true
		Sound1.Volume = 1
		Sound1:Play()
	else
		Sound1:Play()
	end
end

function Guis:TextAccuracy(Text, TextLabelOrTextButton)
	local Splitted = string.split(Text, "")
	local arg1 = 1
	TextLabelOrTextButton.Text = ""
	repeat
		TextLabelOrTextButton.Text = TextLabelOrTextButton.Text..Splitted[arg1]
		TextSound()
		arg1 += 1
		wait(math.random(0.5, 0.8))
	until TextLabelOrTextButton.Text == Text
end

local StarterGui = {
	Image = NewImage(gui.gui, "rbxassetid://126389123237181"),
	TextLabelV1 = Instance.new("TextLabel")
}

StarterGui.Image.Size = UDim2.new(0.2, 0, 0.4, 0)
StarterGui.Image.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
StarterGui.Image.BorderSizePixel = 0
wait(0.5)
StarterGui.TextLabelV1.Parent = StarterGui.Image
StarterGui.TextLabelV1.TextColor3 = Color3.fromRGB(0, 0, 0)
StarterGui.TextLabelV1.TextTransparency = 0
StarterGui.TextLabelV1.BackgroundTransparency = 1
StarterGui.TextLabelV1.TextStrokeTransparency = 1
StarterGui.TextLabelV1.Size = UDim2.new(0.8, 0, 0.2, 0)
StarterGui.TextLabelV1.Position = UDim2.new(0.1, 0, 0.7, 0)
StarterGui.TextLabelV1.TextWrapped = true
StarterGui.TextLabelV1.TextScaled = true
Guis:TextAccuracy(DeveloperName.."'s Gui", StarterGui.TextLabelV1)

wait(1)

game:GetService("TweenService"):Create(StarterGui.Image, TweenInfo.new(3), {ImageTransparency = 1}):Play()
game:GetService("TweenService"):Create(StarterGui.TextLabelV1, TweenInfo.new(3), {TextTransparency = 1}):Play()

wait(3.1)

for i,v in StarterGui do
	v:Destroy()
end

gui.gui.ResetOnSpawn = false
gui.gui.Enabled = true

gui.uigridlayout.Parent = gui.ScrollingFrame1
gui.uigridlayout.CellSize = UDim2.new(0.75, 0, 0, 40)
gui.uigridlayout.SortOrder = Enum.SortOrder.LayoutOrder
gui.ScrollingFrame1.ScrollBarImageTransparency = 1

run.Heartbeat:Connect(function()
	gui.ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 0, gui.uigridlayout.AbsoluteContentSize.Y)
end)

UiCorner(gui.ScrollingFrame1, 5)
UiCorner(gui.Framev1, 5)
gui.Framev1.Parent = gui.gui
gui.Framev1.Size = UDim2.new(0.15, 0, 0.1, 0)
gui.Framev1.Draggable = true
gui.Framev1.Position = UDim2.new(0.25, 0, 0.25, 0)
gui.Framev1.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
gui.Framev1.Active = true
gui.Framev1.Selectable = true
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
	EnabledKeyBinds = false
	if sound ~= nil then
		sound:Destroy()
	end
	if Sound1 then
		Sound1:Destroy()
	end
end)

local sTween = nil
gui.Hide.MouseButton1Click:Connect(function()
	if hidded == false then
		sTween = gui.Framev1.AbsoluteSize.Y
		gui.Framev1:TweenSize(UDim2.new(0, gui.Framev1.AbsoluteSize.X, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
			gui.Framev1.Visible = false
			hidded = true
		end)
	else
		gui.Framev1.Visible = true
		gui.Framev1:TweenSize(UDim2.new(0, gui.Framev1.AbsoluteSize.X, 0, sTween), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
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
	ToSection(button)
	button.AutoButtonColor = false
	button.TextXAlignment = Enum.TextXAlignment.Left
	UiCorner(button, 3)
	local image = NewImage(button, "rbxassetid://16081386298")
	image.Size = UDim2.new(0.25, 0, 1, 0)
	image.Position = UDim2.new(1, 0, 0, 0)
	gui.gui:GetAttributeChangedSignal("BackgroundTransparency"):Connect(function()
		local Value = gui.gui:GetAttribute("BackgroundTransparency")
		button.BackgroundTransparency = Value
		image.ImageTransparency = Value
		button.TextTransparency = Value
	end)
	-- functions<<
	button.MouseButton1Click:Connect(function()
		ClickSound()
		fun()
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*15
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
			game:GetService("Debris"):AddItem(MouseText, 5)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext then
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
	gui.gui:GetAttributeChangedSignal("BackgroundTransparency"):Connect(function()
		local Value = gui.gui:GetAttribute("BackgroundTransparency")
		button.BackgroundTransparency = Value
		button.TextTransparency = Value
	end)
	UiCorner(button, 3)
	ToSection(button)
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
		local offsetX = #string.split(TextOnMouseEnter, "")*15
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
			game:GetService("Debris"):AddItem(MouseText, 5)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext then
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
	ToSection(button)
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
	gui.gui:GetAttributeChangedSignal("BackgroundTransparency"):Connect(function()
		local Value = gui.gui:GetAttribute("BackgroundTransparency")
		button.BackgroundTransparency = Value
		Slide.BackgroundTransparency = Value
		Textt.TextTransparency = Value
	end)
	-- functions<<
	local En = false
	local coldown = false
	local Activated = false
	button.MouseButton1Click:Connect(function()
		ClickSound()
		if En == false then
			En = true
			game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 165, 0)}):Play()
			game:GetService("TweenService"):Create(Slide, TweenInfo.new(0.2), {Position = UDim2.new(((1-Slide.Size.X.Scale)-0.01), 0, 0.05, 0), BackgroundColor3 = Color3.fromRGB(0, 91, 0)}):Play()
			Activated = true
			functionOn()
		elseif En == true then
			En = false
			game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(165, 0, 0)}):Play()
			game:GetService("TweenService"):Create(Slide, TweenInfo.new(0.2), {Position = UDim2.new(0.01, 0, 0.05, 0), BackgroundColor3 = Color3.fromRGB(91, 0, 0)}):Play()
			Activated = false
			functionOff()
		end
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*15
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
			game:GetService("Debris"):AddItem(MouseText, 5)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext then
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
	ToSection(button)
	UiCorner(button, 3)
	local image = NewImage(button, "rbxassetid://71459514973341")
	gui.gui:GetAttributeChangedSignal("BackgroundTransparency"):Connect(function()
		local Value = gui.gui:GetAttribute("BackgroundTransparency")
		button.BackgroundTransparency = Value
		button.TextTransparency = Value
		image.ImageTransparency = Value
	end)
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
		local arg1Text = button.Text
		button.Text = "..."
		wait(0.5)
		local KeyCode = uis.InputBegan:Wait()
		if KeyCode.KeyCode.EnumType == Enum.KeyCode then
			Keybind = KeyCode.KeyCode
			keycodee.Text = KeyCode.KeyCode.Name
			button.Text = arg1Text
		end
	end)
	uis.InputBegan:Connect(function(i, g)
		if EnabledKeyBinds == false then return end
		if button.Visible == false then return end
		if g then return end
		if i.KeyCode == Keybind then
			fun()
		end
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*15
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
			game:GetService("Debris"):AddItem(MouseText, 5)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
	return button
end

function Guis:AddSlideKeybind(Text, functionOn, functionOff, StarterKeybind, TextOnMouseEnter)
	local Keybind = Enum.KeyCode.Y
	if StarterKeybind then
		Keybind = StarterKeybind
	end
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
	local Slide = Instance.new("Frame")
	Slide.Parent = button
	Slide.BackgroundColor3 = Color3.fromRGB(91, 0, 0)
	UiCorner(Slide, 9999)
	Slide.Size = UDim2.new(0.25, 0, 0.9, 0)
	Slide.Position = UDim2.new(0.01, 0, 0.05, 0)
	UiCorner(button, 3)
	local image = NewImage(button, "rbxassetid://71459514973341")
	local keycodee = Instance.new("TextLabel")
	keycodee.Parent = image
	keycodee.Text = Keybind.Name
	ToSection(button)
	keycodee.Size = UDim2.new(0.25, 0, 0.25, 0)
	keycodee.TextWrapped = true
	keycodee.TextScaled = true
	keycodee.TextColor3 = Color3.fromRGB(239, 239, 239)
	keycodee.BackgroundTransparency = 1
	keycodee.Position = UDim2.new(0.5, 0, 0.5, 0)
	image.Size = UDim2.new(0.25, 0, 1, 0)
	image.Position = UDim2.new(1, 0, 0, 0)
	gui.gui:GetAttributeChangedSignal("BackgroundTransparency"):Connect(function()
		local Value = gui.gui:GetAttribute("BackgroundTransparency")
		button.BackgroundTransparency = Value
		Textt.TextTransparency = Value
		image.ImageTransparency = Value
	end)
	local En = false
	local coldown = false
	local Activated = false
	local function D()
		if En == false then
			En = true
			game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 165, 0)}):Play()
			game:GetService("TweenService"):Create(Slide, TweenInfo.new(0.2), {Position = UDim2.new(((1-Slide.Size.X.Scale)-0.01), 0, 0.05, 0), BackgroundColor3 = Color3.fromRGB(0, 91, 0)}):Play()
			Activated = true
			functionOn()
		elseif En == true then
			En = false
			game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(165, 0, 0)}):Play()
			game:GetService("TweenService"):Create(Slide, TweenInfo.new(0.2), {Position = UDim2.new(0.01, 0, 0.05, 0), BackgroundColor3 = Color3.fromRGB(91, 0, 0)}):Play()
			Activated = false
			functionOff()
		end
	end
	button.MouseButton1Click:Connect(function()
		ClickSound()
		local arg1Text = Textt.Text
		Textt.Text = "..."
		wait(0.5)
		local KeyCode = uis.InputBegan:Wait()
		if KeyCode.KeyCode.EnumType == Enum.KeyCode then
			Keybind = KeyCode.KeyCode
			keycodee.Text = KeyCode.KeyCode.Name
			Textt.Text = arg1Text
		end
	end)
	uis.InputBegan:Connect(function(i, g)
		if EnabledKeyBinds == false then return end
		if g then return end
		if button.Visible == false then return end
		if i.KeyCode == Keybind then
			D()
		end
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*15
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
			game:GetService("Debris"):AddItem(MouseText, 5)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
	return button
end

function Guis:AddSection(Text)
	local TextLabel = Instance.new("TextButton")
	local clr = 21
	TextLabel.Parent = gui.ScrollingFrame1
	TextLabel.BackgroundColor3 = Color3.fromRGB(clr, clr, clr)
	TextLabel.TextColor3 = Color3.fromRGB(232, 232, 232)
	TextLabel.Text = Text
	TextLabel.Name = Text
	TextLabel.TextScaled = true
	TextLabel.TextWrapped = true
	TextLabel.RichText = true
	TextLabel.AutoButtonColor = false
	local img = NewImage(TextLabel, "rbxassetid://278543076")
	img.Size = UDim2.new(0.25, 0, 1, 0)
	img.Position = UDim2.new(1, 0, 0, 0)
	UiCorner(TextLabel, 5)
	SectionRN = Text
	local Table = {Find = Text, InSection = {}}
	table.insert(Sections, Table)
	local e = false
	local Rot = 0
	gui.gui:GetAttributeChangedSignal("BackgroundTransparency"):Connect(function()
		local Value = gui.gui:GetAttribute("BackgroundTransparency")
		TextLabel.BackgroundTransparency = Value
		TextLabel.TextTransparency = Value
		img.ImageTransparency = Value
	end)
	TextLabel.MouseButton1Click:Connect(function()
		ClickSound()
		for i, v in Table.InSection do
			if v then
				v.Visible = not v.Visible
			end
		end
		e = not e
		if e == true then
			clr = 17
		else
			clr = 21
		end
		TextLabel.BackgroundColor3 = Color3.fromRGB(clr, clr, clr)
		Rot += 180
		img.Rotation = Rot
	end)
	return TextLabel
end



local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()

plr.CharacterAdded:Connect(function(newChar)
	character = newChar
end)

uis.InputBegan:Connect(function(i, g)
	if g then return end
	if i.KeyCode == Enum.KeyCode.K then
		if hidded == false then
			sTween = gui.Framev1.AbsoluteSize.Y
			gui.Framev1:TweenSize(UDim2.new(0, gui.Framev1.AbsoluteSize.X, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
				gui.Framev1.Visible = false
				hidded = true
			end)
		else
			gui.Framev1.Visible = true
			gui.Framev1:TweenSize(UDim2.new(0, gui.Framev1.AbsoluteSize.X, 0, sTween), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, false, function()
				hidded = false
			end)
		end
	end
end)

function Guis:AddButtonToSelectPlayer(Text, funcWithPlayerInstance, TextOnMouseEnter)
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
	local image = NewImage(button, "rbxassetid://2243841635")
	image.Size = UDim2.new(0.25, 0, 1, 0)
	image.Position = UDim2.new(1, 0, 0, 0)
	local SFv2 = Instance.new("ScrollingFrame")
	SFv2.Parent = gui.Framev1
	SFv2.Size = UDim2.new(1, 0, 0, 0)
	SFv2.CanvasSize = UDim2.new(0, 0, 0, 0)
	SFv2.Visible = false
	ToSection(button)
	SFv2.Position = UDim2.new(1, 0, 0, 0)
	SFv2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	SFv2.ScrollBarImageTransparency = 1
	gui.gui:GetAttributeChangedSignal("BackgroundTransparency"):Connect(function()
		local Value = gui.gui:GetAttribute("BackgroundTransparency")
		button.BackgroundTransparency = Value
		button.TextTransparency = Value
		image.ImageTransparency = Value
	end)
	local uigridLayoutv1 = Instance.new("UIGridLayout")
	uigridLayoutv1.Parent = SFv2
	uigridLayoutv1.CellSize = UDim2.new(0.95, 0, 0, 25)
	uigridLayoutv1.CellPadding = UDim2.new(0, 5, 0, 5)
	local function SetUp()
		for i,v in SFv2:GetChildren() do
			if v:IsA("TextButton") then
				v:Destroy()
			end
		end
		for i, v in pairs(game.Players:GetPlayers()) do
			local newbutton = Instance.new("TextButton")
			newbutton.Parent = SFv2
			newbutton.Text = v.Name.." ("..v.DisplayName..")"
			newbutton.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
			newbutton.TextColor3 = Color3.fromRGB(239, 239, 239)
			newbutton.TextWrapped = true
			newbutton.TextScaled = true
			newbutton.AutoButtonColor = false
			UiCorner(newbutton, 3)
			newbutton.MouseButton1Click:Connect(function()
				ClickSound()
				SFv2.Size = UDim2.new(1, 0, 0, 0)
				SFv2.Visible = false
				funcWithPlayerInstance(v)
			end)
		end
	end
	SFv2.ChildAdded:Connect(function()
		SFv2.CanvasSize = UDim2.new(0, 0, 0, uigridLayoutv1.AbsoluteContentSize.Y)
	end)
	SFv2.ChildRemoved:Connect(function()
		SFv2.CanvasSize = UDim2.new(0, 0, 0, uigridLayoutv1.AbsoluteContentSize.Y)
	end)
	UiCorner(SFv2, 5)
	UiCorner(button, 5)
	local cd = false
	button.MouseButton1Click:Connect(function()
		if cd == true then return end
		ClickSound()
		if SFv2.Visible == false then
			SFv2.Visible = true
			SetUp()
			SFv2:TweenSize(UDim2.new(1, 0, 3, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, false, function()
				cd = false
			end)
		else
			SFv2:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, false, function()
				cd = false
				SFv2.Visible = false
			end)
		end
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*15
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
			game:GetService("Debris"):AddItem(MouseText, 5)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
	return button
end

function Guis:AddSliderButton(MaxValue, Text, FunctionWithNumber, TextOnMouseEnter)
	local button = Instance.new("TextButton")
	button.Text = ""
	button.Name = Text
	button.Parent = gui.ScrollingFrame1
	button.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	button.BackgroundTransparency = 1
	button.TextYAlignment = Enum.TextYAlignment.Bottom
	button.TextColor3 = Color3.fromRGB(239, 239, 239)
	button.RichText = true
	button.TextWrapped = true
	button.TextScaled = true
	button.AutoButtonColor = false
	ToSection(button)
	local MainSlide = Instance.new("Frame")
	MainSlide.Parent = button
	MainSlide.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
	MainSlide.Size = UDim2.new(1, 0, 0.25, 0)
	MainSlide.BorderSizePixel = 0
	MainSlide.Position = UDim2.new(0, 0, 0.2, 0)
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = button
	TextLabel.Text = Text
	TextLabel.TextWrapped = true
	TextLabel.TextScaled = true
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Position = UDim2.new(0.25, 0, 0.5, 0)
	TextLabel.TextColor3 = Color3.fromRGB(239, 239, 239)
	local arg1 = Instance.new("Frame")
	arg1.Parent = MainSlide
	arg1.BackgroundColor3 = Color3.fromRGB(218, 218, 218)
	arg1.Size = UDim2.new(0, (MainSlide.AbsoluteSize.Y*2), 0, (MainSlide.AbsoluteSize.Y*2))
	arg1.Position = UDim2.new(0, 0, 0, (-MainSlide.AbsoluteSize.Y/2))
	local text1 = Instance.new("TextLabel")
	text1.Parent = arg1
	text1.Position = UDim2.new(0, 0, -1, 0)
	text1.BorderSizePixel = 0
	text1.Size = UDim2.new(1, 0, 1, 0)
	text1.TextWrapped = true
	text1.TextScaled = true
	text1.BackgroundTransparency = 1
	text1.TextColor3 = Color3.fromRGB(240, 240, 240)
	local text2 = Instance.new("TextLabel")
	text2.Parent = MainSlide
	text2.Position = UDim2.new(0, 0, 0.9, 0)
	text2.BorderSizePixel = 0
	text2.Size = UDim2.new(0.25, 0, 2, 0)
	text2.TextWrapped = true
	text2.TextScaled = true
	text2.BackgroundTransparency = 1
	text2.TextColor3 = Color3.fromRGB(240, 240, 240)
	text2.Text = tostring(0)
	local text3 = Instance.new("TextLabel")
	text3.Parent = MainSlide
	text3.Position = UDim2.new(0.75, 0, 0.9, 0)
	text3.BorderSizePixel = 0
	text3.Size = UDim2.new(0.25, 0, 2, 0)
	text3.TextWrapped = true
	text3.TextScaled = true
	text3.BackgroundTransparency = 1
	text3.TextColor3 = Color3.fromRGB(240, 240, 240)
	text3.Text = tostring(MaxValue)
	UiCorner(button, 5)
	UiCorner(MainSlide, 9999)
	UiCorner(arg1, 9999)
	local function GetProcents()
		local a = math.floor(((math.floor((math.floor(((mouse.X - MainSlide.AbsolutePosition.X) / MainSlide.AbsoluteSize.X)*1000)/10)*100)/100)/100*MaxValue)*100)/100
		local spl = string.split(a, ".")
		local ToReturn = spl[1]
		return tostring(ToReturn)
	end
	text1.Text = GetProcents()
	local clk1 = false
	local clk2 = false
	button.MouseButton1Down:Connect(function()
		clk1 = true
		repeat
			text1.Text = GetProcents()
			arg1.Position = UDim2.new(0, (mouse.X - MainSlide.AbsolutePosition.X), -0.5, 0)
			local ToFunction = (math.floor((math.floor(((mouse.X - MainSlide.AbsolutePosition.X) / MainSlide.AbsoluteSize.X)*1000)/10)*100)/100)/100*MaxValue
			if tonumber(ToFunction) > MaxValue then
				ToFunction = MaxValue
				text1.Text = tostring(MaxValue)
				arg1.Position = UDim2.new(1, 0, -0.5, 0)
			elseif tonumber(ToFunction) < 0 then
				ToFunction = 0
				arg1.Position = UDim2.new(0, 0, -0.5, 0)
				text1.Text = "0"
			end
			FunctionWithNumber(tonumber(ToFunction))
			game:GetService("RunService").Heartbeat:Wait()
		until clk1 == false
	end)
	game:GetService("RunService").Heartbeat:Connect(function()
		if clk2 == false then
			clk1 = false
		end
	end)
	button.MouseEnter:Connect(function()
		clk2 = true
	end)
	button.MouseLeave:Connect(function()
		clk2 = false
	end)
	mouse.Button1Up:Connect(function()
		clk1 = false
	end)
	button.MouseButton1Up:Connect(function()
		clk1 = false
	end)
	local mousetext = nil
	if TextOnMouseEnter then
		local offsetX = #string.split(TextOnMouseEnter, "")*15
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
			game:GetService("Debris"):AddItem(MouseText, 5)
			mouse.Move:Connect(function()
				MouseText.Position = UDim2.new(0, mouse.X+5, 0, mouse.Y)
			end)
		end)
		button.MouseLeave:Connect(function()
			if mousetext then
				mousetext:TweenSize(UDim2.new(0, offsetX, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3)
				game:GetService("Debris"):AddItem(mousetext, 0.31)
			end
			mousetext = nil
		end)
	end
end

Guis:AddSection("Gui Settings")

Guis:AddSliderButton(1, "Background Transparency", function(V)
	gui.gui:SetAttribute("BackgroundTransparency", V)
end)

Guis:AddClickButton("increase gui", function()
	gui.Framev1:TweenSize(UDim2.new(0, gui.Framev1.AbsoluteSize.X+10, 0, gui.Framev1.AbsoluteSize.Y+10), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, true, function()
		Guis:Notification({Text = "Done!", Duration = 2})
	end)
end)

Guis:AddClickButton("reduce gui", function()
	gui.Framev1:TweenSize(UDim2.new(0, gui.Framev1.AbsoluteSize.X-10, 0, gui.Framev1.AbsoluteSize.Y-10), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, true, function()
		Guis:Notification({Text = "Done!", Duration = 2})
	end)
end)

return Guis
