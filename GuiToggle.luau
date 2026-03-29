return (function(Image,callback)
	if not type(Image) == "string" then
		error("Image not string : Must to be string", 2)
	end

	if type(callback) ~= "function" then
		error("Callback not function : Must to be function", 2)
	end

	if getgenv().OpenGuiButton then getgenv().OpenGuiButton:Destroy() end 

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local ImageButton = Instance.new("ImageButton")
	local UICorner2 = Instance.new("UICorner")

	ScreenGui.Parent = (gethui and gethui()) or game.Players.LocalPlayer:WaitForChild("PlayerGui")

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BackgroundTransparency = 0.5
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.491000026, 0, 0, 155)
	Frame.Size = UDim2.new(0, 33, 0, 33)

	UICorner.Parent = Frame

	ImageButton.Parent = Frame
	ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton.BackgroundTransparency = 1.000
	ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(0,0,0,0)
	ImageButton.Size = UDim2.new(1, 0, 1, 0)
	ImageButton.Image = Image

	UICorner2.Parent = ImageButton

	ImageButton.MouseButton1Click:Connect(callback)

	getgenv().OpenGuiButton = ScreenGui

	return
end)
