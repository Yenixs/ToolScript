local Repository = "https://raw.githubusercontent.com/Yenixs/ToolScript"
local CascadeLibrary = loadstring(game:HttpGet(Repository.. "/refs/heads/main/Cascade.luau"))();
local GuiMinimizeButton = loadstring(game:HttpGet(Repository.. '/refs/heads/main/GuiToggle.luau'))()
local ConfigManager = loadstring(game:HttpGet(Repository.. "/refs/heads/main/ConfigManager.luau"))()

return {
  UILibrary = CascadeLibrary,
  MimizeButton = GuiMinimizeButton,
  ConfigManager = ConfigManager,
}
