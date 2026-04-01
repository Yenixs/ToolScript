if not game:IsLoaded() then game.Loaded:Wait() end
repeat task.wait() until workspace and game.Players.LocalPlayer and game.Players.LocalPlayer.PlayerGui

assert(writefile,"Your executor does not support the writefile function")
assert(readfile,"Your executor does not support the readfile function")
assert(getcustomasset,"Your executor does not support the getcustomasset function")
assert(setmetatable,"Your executor does not support the setmetatable function")
assert(require,"Your executor does not support the require function")

local function c() 
    return getgenv() 
end

local cloneref = cloneref or function(...) 
    return ... 
end

local Service = setmetatable({},{
    __index = function(self, name) 
        return cloneref(game:GetService(name)) 
    end
})

local PathfindingService = Service.PathfindingService
local ReplicatedStorage = Service.ReplicatedStorage
local RunService = Service.RunService
local VirtualInputManager = Service.VirtualInputManager
local GuiService = Service.GuiService
local UserInputService = Service.UserInputService
local Players = Service.Players

local Client = Players.LocalPlayer
local PlayerGui = Client.PlayerGui
local img = nil 

if request then
    local res = request({
        Url = "https://img1.pic.in.th/images/image054f28ff633e1f45.png",
        Method = "GET",
        Headers = {
            ["User-Agent"] = "Mozilla/5.0",
            ["Referer"] = "https://discord.com"
        }
    })

    local filename = "tairaaoi.png"

    if res.StatusCode == 200 then 
        writefile(filename, res.Body)

        img = getcustomasset(filename)
    end
end

local CascadeLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yenixs/ToolScript/refs/heads/main/Cascade.luau"))();

local CreateApp = CascadeLibrary.New({
    WindowPill = true,
    Theme = CascadeLibrary.Themes.Dark,
    Accent = CascadeLibrary.Accents.Pink
})

local CreateWindow = CreateApp:Window({
    Title = "Yenix Exploit | Script Hub",
    Subtitle = "Taira Aoi Edition",
    Size = UserInputService.TouchEnabled and UDim2.fromOffset(550, 325) or UDim2.fromOffset(850, 530)
})

local minimizeKeybind = Enum.KeyCode.LeftAlt

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == minimizeKeybind and not gameProcessedEvent then
        CreateWindow.Minimized = not CreateWindow.Minimized
    end
end)

loadstring(game:HttpGet('https://raw.githubusercontent.com/Yenixs/ToolScript/refs/heads/main/GuiToggle.luau'))()(img or "rbxassetid://103816145608946", function() CreateWindow.Minimized = not CreateWindow.Minimized end)

	local TabSection = {}

	local Catorgary = {
		"Main",
		"Combat",
		"Shop",
		"Client",
		"Vechine",
		"Configuration"
	}
	
	for i, v in pairs(Catorgary) do 
		TabSection[v] = CreateWindow:Section({
			Disclosure = false,
			Title = v
		})
	end
	
	local Tabs = {
		General = TabSection.Main:Tab(
			{
			Selected = true,
			Title = "General",
			Icon = CascadeLibrary.Symbols.switch2
		}
		),
		Aimbots = TabSection.Combat:Tab(
			{
			Selected = false,
			Title = "Aimbot",
			Icon = CascadeLibrary.Symbols.target
		}
		),
		Visual = TabSection.Combat:Tab(
			{
			Selected = false,
			Title = "Visual",
			Icon = CascadeLibrary.Symbols.eye
		}
		),
		Marketplace = TabSection.Shop:Tab(
			{
			Selected = false,
			Title = "Marketplace",
			Icon = CascadeLibrary.Symbols.homekit
		}
		),
		LocalPlayers = TabSection.Client:Tab(
			{
			Selected = false,
			Title = "LocalPlayer",
			Icon = CascadeLibrary.Symbols.person
		}
		),
		Vechines = TabSection.Vechine:Tab(
			{
			Selected = false,
			Title = "Vechines",
			Icon = CascadeLibrary.Symbols.car
		}
		),
		Settings = TabSection.Configuration:Tab(
			{
			Selected = false,
			Title = "Settings",
			Icon = CascadeLibrary.Symbols.gear
		}
		)
	}
