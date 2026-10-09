local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

return function(FolderName, Env)
    if not writefile or not isfolder or not isfile or not makefolder then
        return
    end

    if typeof(FolderName) ~= "string" or FolderName == "" then
        return
    end

    if typeof(Env) ~= "table" then
        return
    end

    local StateKey = "__LUACX_CONFIG_MANAGER_STATE"
    local StateRoot = Env[StateKey]

    if typeof(StateRoot) ~= "table" then
        StateRoot = {}
        Env[StateKey] = StateRoot
    end

    local SharedState = StateRoot[FolderName]

    if typeof(SharedState) ~= "table" then
        SharedState = {
            ConfigValues = {},
            ActiveThreads = {},
        }

        StateRoot[FolderName] = SharedState
    end

    if typeof(SharedState.ConfigValues) ~= "table" then
        SharedState.ConfigValues = {}
    end

    if typeof(SharedState.ActiveThreads) ~= "table" then
        SharedState.ActiveThreads = {}
    end

    local Module = {
        Config = {},
        Thread = {},
    }

    Module.__index = Module

    local ConfigValues = SharedState.ConfigValues
    local ActiveThreads = SharedState.ActiveThreads
    local CurrentFolder = FolderName
    local IsLoading = false
    local SaveScheduled = false

    local function GetConfigPath()
        if not isfolder(CurrentFolder) then
            makefolder(CurrentFolder)
        end

        local LocalPlayer = Players.LocalPlayer

        if not LocalPlayer then
            error("LocalPlayer is not available", 2)
        end

        return CurrentFolder .. "/" .. LocalPlayer.Name .. "-config.json"
    end

    local function IsSaveable(Value)
        local ValueType = typeof(Value)

        return ValueType == "boolean"
            or ValueType == "string"
            or ValueType == "number"
    end

    local function SaveConfig()
        local Settings = {}

        for Key, Value in pairs(ConfigValues) do
            if typeof(Key) == "string" and IsSaveable(Value) then
                Settings[Key] = Value
            end
        end

        writefile(
            GetConfigPath(),
            HttpService:JSONEncode(Settings)
        )
    end

    local function ScheduleSave()
        if IsLoading or SaveScheduled then
            return
        end

        SaveScheduled = true

        task.delay(0.25, function()
            SaveScheduled = false

            local Ok, ErrorMessage = pcall(SaveConfig)

            if not Ok then
                warn("Config save failed: " .. tostring(ErrorMessage))
            end
        end)
    end

    for Key, Value in pairs(Module.Config) do
        if typeof(Key) == "string" then
            if ConfigValues[Key] == nil then
                ConfigValues[Key] = Value
            end

            Env[Key] = ConfigValues[Key]
        end

        rawset(Module.Config, Key, nil)
    end

    setmetatable(Module.Config, {
        __index = function(_, Key)
            return Env[Key]
        end,

        __newindex = function(_, Key, Value)
            if typeof(Key) ~= "string" then
                error("Config keys must be strings", 2)
            end

            local Changed = ConfigValues[Key] ~= Value

            ConfigValues[Key] = Value
            Env[Key] = Value

            if Changed then
                ScheduleSave()
            end
        end,

        __iter = function()
            local Key

            return function()
                Key = next(ConfigValues, Key)

                if Key ~= nil then
                    return Key, Env[Key]
                end
            end
        end,
    })

    function Module.Thread:Load(Folder)
        if Folder ~= nil then
            if typeof(Folder) ~= "string" or Folder == "" then
                error("Config folder must be a non-empty string", 2)
            end

            CurrentFolder = Folder
        end

        IsLoading = true

        local Ok, Result = pcall(function()
            local Path = GetConfigPath()

            if isfile(Path) then
                local ReadOk, Settings = pcall(function()
                    return HttpService:JSONDecode(readfile(Path))
                end)

                if ReadOk and type(Settings) == "table" then
                    for Key, Value in pairs(Settings) do
                        if typeof(Key) == "string" and IsSaveable(Value) then
                            Module.Config[Key] = Value
                        end
                    end
                end
            end

            return Module.Config
        end)

        IsLoading = false

        if not Ok then
            return nil, Result
        end

        return Result
    end

    function Module.Thread:Add(ConfigName, Callback, DelayTime)
        if typeof(ConfigName) ~= "string" or ConfigName == "" then
            error("ConfigName must be a non-empty string", 2)
        end

        if typeof(Callback) ~= "function" then
            error("Callback must be a function", 2)
        end

        DelayTime = DelayTime or 0.1

        if typeof(DelayTime) ~= "number"
            or DelayTime < 0
            or DelayTime ~= DelayTime then
            error("Delay must be a non-negative number", 2)
        end

        local Previous = ActiveThreads[ConfigName]

        if Previous then
            Previous.Cancelled = true
        end

        local Entry = {
            Cancelled = false,
        }

        ActiveThreads[ConfigName] = Entry

        Entry.Thread = task.spawn(function()
            while not Entry.Cancelled do
                if Env[ConfigName] == true then
                    local Ok, ErrorMessage = pcall(Callback)

                    if not Ok then
                        warn(
                            "Thread '" .. ConfigName .. "' failed: "
                                .. tostring(ErrorMessage)
                        )
                    end
                end

                task.wait(DelayTime)
            end

            if ActiveThreads[ConfigName] == Entry then
                ActiveThreads[ConfigName] = nil
            end
        end)

        return Entry.Thread
    end

    function Module.Thread:Remove(ConfigName)
        local Entry = ActiveThreads[ConfigName]

        if not Entry then
            return false
        end

        Entry.Cancelled = true
        ActiveThreads[ConfigName] = nil

        return true
    end

    return Module
end
