local TweenService = game:GetService('TweenService')
    local Players = game:GetService('Players')
    local __stats = game:GetService('Stats')
    local HttpService = game:GetService('HttpService')
    local RunService = game:GetService('RunService')
    local Client = Players.LocalPlayer
    local Name = Client.Name

       local Library = {}; Library.__index = Library
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = gethui()

    local Notification = Instance.new("Frame")
    local UIListLayout_1 = Instance.new("UIListLayout")

    Notification.Name = "Notification"
    Notification.Parent = ScreenGui
    Notification.AnchorPoint = Vector2.new(1, 1)
    Notification.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Notification.BackgroundTransparency = 1
    Notification.BorderColor3 = Color3.fromRGB(0,0,0)
    Notification.BorderSizePixel = 0
    Notification.Position = UDim2.new(0.99000001, 0,0.99000001, 0)
    Notification.Size = UDim2.new(0, 100,0, 100)

    UIListLayout_1.Parent = Notification
    UIListLayout_1.Padding = UDim.new(0,5)
    UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Bottom

    function Library:Notify(info)
        
        local function Tw(info)
            local Value = info.vu or info.Value or info.value or info.Vu or info.v or info.u
            local Time = info.Time or info.t or info.T or 0
            local Style = info.Style or info.style or info.Sty or info.sty or info.s or info.S or "Linear"
            local Direction = info.Direction or info.direction or info.d or info.D or info.Drt or info.drt or info.dt or info.Dt or "Out"
            local Goal = info.Goal or info.goal or info.go or info.Go or info.G or info.g

            return TweenService:Create(Value,TweenInfo.new(Time,Enum.EasingStyle[Style],Enum.EasingDirection[Direction]),Goal)
        end

        local function infolib(tbl, key)
            local lowerKey = string.lower(key)
            for k, v in pairs(tbl) do
                if string.lower(k) == lowerKey then
                    return v
                end
            end
            for k, v in pairs(tbl) do
                if string.find(string.lower(k), lowerKey) then
                    return v
                end
            end
            return nil
        end

        local Title = infolib(info, "name") or infolib(info, "title") or "Notification"
        local Desc = infolib(info, "description") or infolib(info, "desc") or "Description"
        local Time = infolib(info, "time") or 5

        local NotifyTemple = Instance.new("Frame")
        local UICorner_1 = Instance.new("UICorner")
        local NotifyTemple_1 = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local Star_1 = Instance.new("ImageLabel")
        local ImageLabel_1 = Instance.new("ImageLabel")
        local Star_2 = Instance.new("ImageLabel")
        local ImageLabel_2 = Instance.new("ImageLabel")
        local Star_3 = Instance.new("ImageLabel")
        local ImageLabel_3 = Instance.new("ImageLabel")
        local UIGradient_1 = Instance.new("UIGradient")
        local ImageLabel_4 = Instance.new("ImageLabel")
        local Frame_1 = Instance.new("Frame")
        local UIListLayout_1 = Instance.new("UIListLayout")
        local TextLabel_1 = Instance.new("TextLabel")
        local TextLabel_2 = Instance.new("TextLabel")

        NotifyTemple.Name = "NotifyTemple"
        NotifyTemple.Parent = Notification
        NotifyTemple.BackgroundColor3 = Color3.fromRGB(202,202,202)
        NotifyTemple.BorderColor3 = Color3.fromRGB(0,0,0)
        NotifyTemple.BorderSizePixel = 0
        NotifyTemple.Size = UDim2.new(0, 0,0, 0)

        UICorner_1.Parent = NotifyTemple
        UICorner_1.CornerRadius = UDim.new(1,0)

        NotifyTemple_1.Name = "NotifyTemple"
        NotifyTemple_1.Parent = NotifyTemple
        NotifyTemple_1.AnchorPoint = Vector2.new(1, 0)
        NotifyTemple_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        NotifyTemple_1.BorderColor3 = Color3.fromRGB(0,0,0)
        NotifyTemple_1.BorderSizePixel = 0
        NotifyTemple_1.Position = UDim2.new(1, 0,0, 0)
        NotifyTemple_1.Size = UDim2.new(0, 0,0, 50)

        UICorner_2.Parent = NotifyTemple_1
        UICorner_2.CornerRadius = UDim.new(1,0)

        Star_1.Name = "Star"
        Star_1.Parent = NotifyTemple_1
        Star_1.AnchorPoint = Vector2.new(0.5, 0.5)
        Star_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Star_1.BackgroundTransparency = 1
        Star_1.BorderColor3 = Color3.fromRGB(0,0,0)
        Star_1.BorderSizePixel = 0
        Star_1.Position = UDim2.new(0.899999976, 0,0, 0)
        Star_1.Size = UDim2.new(0, 35,0, 35)
        Star_1.Image = "rbxassetid://100566911459439"

        ImageLabel_1.Parent = Star_1
        ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ImageLabel_1.BackgroundTransparency = 1
        ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
        ImageLabel_1.BorderSizePixel = 0
        ImageLabel_1.Position = UDim2.new(0.5, 0,0.5, 0)
        ImageLabel_1.Size = UDim2.new(0.800000012, 0,0.800000012, 0)
        ImageLabel_1.Image = "rbxassetid://125489335916453"

        Star_2.Name = "Star"
        Star_2.Parent = NotifyTemple_1
        Star_2.AnchorPoint = Vector2.new(0.5, 0.5)
        Star_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Star_2.BackgroundTransparency = 1
        Star_2.BorderColor3 = Color3.fromRGB(0,0,0)
        Star_2.BorderSizePixel = 0
        Star_2.Position = UDim2.new(0.75, 0,0.200000003, 0)
        Star_2.Size = UDim2.new(0, 21,0, 21)
        Star_2.Image = "rbxassetid://100566911459439"

        ImageLabel_2.Parent = Star_2
        ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ImageLabel_2.BackgroundTransparency = 1
        ImageLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
        ImageLabel_2.BorderSizePixel = 0
        ImageLabel_2.Position = UDim2.new(0.5, 0,0.5, 0)
        ImageLabel_2.Size = UDim2.new(0.800000012, 0,0.800000012, 0)
        ImageLabel_2.Image = "rbxassetid://125489335916453"

        Star_3.Name = "Star"
        Star_3.Parent = NotifyTemple_1
        Star_3.AnchorPoint = Vector2.new(0.5, 0.5)
        Star_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Star_3.BackgroundTransparency = 1
        Star_3.BorderColor3 = Color3.fromRGB(0,0,0)
        Star_3.BorderSizePixel = 0
        Star_3.Position = UDim2.new(0.860000014, 0,0.680000007, 0)
        Star_3.Size = UDim2.new(0, 21,0, 21)
        Star_3.Image = "rbxassetid://100566911459439"

        ImageLabel_3.Parent = Star_3
        ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ImageLabel_3.BackgroundTransparency = 1
        ImageLabel_3.BorderColor3 = Color3.fromRGB(0,0,0)
        ImageLabel_3.BorderSizePixel = 0
        ImageLabel_3.Position = UDim2.new(0.5, 0,0.5, 0)
        ImageLabel_3.Size = UDim2.new(0.800000012, 0,0.800000012, 0)
        ImageLabel_3.Image = "rbxassetid://125489335916453"

        UIGradient_1.Parent = NotifyTemple_1
        UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(222, 48, 176)), ColorSequenceKeypoint.new(1, Color3.fromRGB(124, 12, 113))}
        UIGradient_1.Rotation = 180

        ImageLabel_4.Parent = NotifyTemple_1
        ImageLabel_4.AnchorPoint = Vector2.new(0, 0.5)
        ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ImageLabel_4.BackgroundTransparency = 1
        ImageLabel_4.BorderColor3 = Color3.fromRGB(0,0,0)
        ImageLabel_4.BorderSizePixel = 0
        ImageLabel_4.Position = UDim2.new(0, 0,0.5, 0)
        ImageLabel_4.Size = UDim2.new(0, 65,0, 65)
        ImageLabel_4.Rotation = 5
        ImageLabel_4.Image = "rbxassetid://93809989347743"

        Frame_1.Parent = NotifyTemple_1
        Frame_1.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Frame_1.BackgroundTransparency = 1
        Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
        Frame_1.BorderSizePixel = 0
        Frame_1.Position = UDim2.new(0.481268078, 0,0.5, 0)
        Frame_1.Size = UDim2.new(0, 140,0, 45)

        UIListLayout_1.Parent = Frame_1
        UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

        TextLabel_1.Parent = Frame_1
        TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        TextLabel_1.BackgroundTransparency = 1
        TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
        TextLabel_1.BorderSizePixel = 0
        TextLabel_1.Size = UDim2.new(0, 200,0, 15)
        TextLabel_1.Font = Enum.Font.SourceSansBold
        TextLabel_1.Text = Title
        TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel_1.TextSize = 14
        TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left

        TextLabel_2.Parent = Frame_1
        TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        TextLabel_2.BackgroundTransparency = 1
        TextLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
        TextLabel_2.BorderSizePixel = 0
        TextLabel_2.Position = UDim2.new(0, 0,0.333333343, 0)
        TextLabel_2.Size = UDim2.new(0, 200,0, 32)
        TextLabel_2.Font = Enum.Font.SourceSansBold
        TextLabel_2.Text = Desc
        TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel_2.TextSize = 11
        TextLabel_2.TextTransparency = 0.30000001192092896
        TextLabel_2.TextWrapped = true
        TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
        
        local sound = Instance.new("Sound", NotifyTemple_1)
        sound.RollOffMode = Enum.RollOffMode.InverseTapered
        sound.SoundId = "rbxassetid://17417730290"
        
        sound:Play()
        Tw({
            v = NotifyTemple,
            t = 0.5,
            s = "Exponential",
            d = "Out",
            g = {Size = UDim2.new(0, 300,0, 50)}
        }):Play()
        task.wait(.2)
        Tw({
            v = NotifyTemple_1,
            t = 0.5,
            s = "Exponential",
            d = "Out",
            g = {Size = UDim2.new(0, 290,0, 50)}
        }):Play()
        task.wait(.2)
        TweenService:Create(Star_1, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, -1, true, 0), {Size = UDim2.new(0, 40,0, 40)}):Play()
        TweenService:Create(Star_2, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, -1, true, 0.1), {Size = UDim2.new(0, 24,0, 24)}):Play()
        TweenService:Create(Star_3, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, -1, true, 0), {Size = UDim2.new(0, 24,0, 24)}):Play()
        TweenService:Create(ImageLabel_4, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, -1, true, 0), {Rotation = -5}):Play()
        task.spawn(function()
            for i = Time,1,-1 do
                wait(1)
            end
            for _, child in ipairs(NotifyTemple_1:GetDescendants()) do
                if child:IsA("ImageLabel") then
                    TweenService:Create(child, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
                end
                if child:IsA("TextLabel") then
                    TweenService:Create(child, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
                end
            end
            Tw({
                v = NotifyTemple_1,
                t = 0.5,
                s = "Exponential",
                d = "Out",
                g = {Size = UDim2.new(0, 50,0, 50)}
            }):Play()
            task.wait(.2)
            Tw({
                v = NotifyTemple,
                t = 0.5,
                s = "Exponential",
                d = "Out",
                g = {Size = UDim2.new(0, 50,0, 50)}
            }):Play()
            Tw({
                v = NotifyTemple,
                t = 0.5,
                s = "Exponential",
                d = "Out",
                g = {BackgroundTransparency = 1}
            }):Play()
            local twclose1 = Tw({
                v = NotifyTemple_1,
                t = 0.5,
                s = "Exponential",
                d = "Out",
                g = {BackgroundTransparency = 1}
            })
            twclose1:Play()
            twclose1.Completed:Wait()
            local twclose = Tw({
                v = NotifyTemple,
                t = 0.5,
                s = "Exponential",
                d = "Out",
                g = {Size = UDim2.new(0, 0,0, 0)}
            })
            twclose:Play()
            twclose.Completed:Connect(function()
                NotifyTemple:Destroy()
            end)
        end)
    end

return Library
