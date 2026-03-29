return (function(image,callback)
    if type(image) ~= "string" then
        error("Image Not String : must to be string", 2)
    end
    if type(callback) ~= "function" then
        error("Callback not function : Must to be function", 2)
    end

	if getgenv().OpenGuiButton then getgenv().OpenGuiButton:Destroy() end 

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local ImageButton = Instance.new("ImageButton")

	ScreenGui.Name = "ScreenGuis"
	ScreenGui.Parent = (gethui and gethui()) or game.Players.LocalPlayer:WaitForChild("PlayerGui")

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BackgroundTransparency = 0.700
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.474052399, 0, 0.046491228, 0)
	Frame.Size = UDim2.new(0.0340000018, 0, 0.0700000003, 0)

	UICorner.Parent = Frame

	ImageButton.Parent = Frame
	ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton.BackgroundTransparency = 1.000
	ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(-0.0250000004, 0, -0.027777778, 0)
	ImageButton.Size = UDim2.new(1.1, 0, 1.1, 0)
	ImageButton.Image = image

	ImageButton.MouseButton1Click:Connect(callback)

	getgenv().OpenGuiButton = ScreenGui
    return
end)
