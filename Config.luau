local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

return function(FolderName, Env)
    if not writefile or not isfolder or not isfile then return end
    if not FolderName or typeof(FolderName) ~= "string" then return end 
    if not Env or typeof(Env) ~= "table" then return end 

    local Module = {
        Config = {},
        
        Thread = {}
    }

    Module.__index = Module

    local ConfigValues = {}
    local ActiveThreads = {}
    local IsLoading = false
    local SaveScheduled = false

    local Path = FolderName .. "/" .. Players.LocalPlayer.Name .. "-config.json"

    for key, value in pairs(Module.Config) do
        ConfigValues[key] = value
        rawset(Module.Config, key, nil)
    end

    local function IsSaveable(value)
        local valueType = typeof(value)

        return valueType == "boolean" or valueType == "string" or valueType == "number"
    end

    local function SaveConfig()
        local settings = {}

        for key, value in pairs(ConfigValues) do
            if typeof(key) == "string" and IsSaveable(value) then
                settings[key] = value
            end
        end

        writefile(Path, HttpService:JSONEncode(settings))
    end

    local function ScheduleSave()
        if IsLoading or SaveScheduled then
            return
        end

        SaveScheduled = true

        task.delay(0.25, function()
            SaveScheduled = false

            local ok, err = pcall(SaveConfig)
            if not ok then
                warn("Config save failed: " .. tostring(err))
            end
        end)
    end

    setmetatable(Module.Config, {
        __index = function(_, key)
            return ConfigValues[key]
        end,

        __newindex = function(_, key, value)
            if typeof(key) ~= "string" then
                error("Config keys must be strings", 2)
            end

            if ConfigValues[key] == value then
                return
            end

            ConfigValues[key] = value
            ScheduleSave()
        end,

        __iter = function()
            local key

            return function()
                key = next(ConfigValues, key)

                if key ~= nil then
                    return key, ConfigValues[key]
                end
            end
        end,
    })

    function Module.Thread:Load(folder)
        if folder ~= nil then
            if typeof(folder) ~= "string" or folder == "" then
                error("Config folder must be a non-empty string", 2)
            end

            self.Folder = folder
        end

        IsLoading = true

        local Ok, Result = pcall(function()
            if isfile(Path) then
                local readOk, settings = pcall(function()
                    return HttpService:JSONDecode(readfile(Path))
                end)

                if readOk and type(settings) == "table" then
                    for key, value in pairs(settings) do
                        if typeof(key) == "string" and IsSaveable(value) then
                            Module.Config[key] = value
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

    function Module.Thread:Add(configName, callback, delayTime)
        if typeof(configName) ~= "string" or configName == "" then
            error("ConfigName must be a non-empty string", 2)
        end

        if typeof(callback) ~= "function" then
            error("Callback must be a function", 2)
        end

        delayTime = delayTime or 0.1

        if typeof(delayTime) ~= "number" or delayTime < 0 or delayTime ~= delayTime then
            error("Delay must be a non-negative number", 2)
        end

        local previous = ActiveThreads[configName]
        if previous then
            previous.Cancelled = true
        end

        local entry = {
            Cancelled = false,
        }

        ActiveThreads[configName] = entry

        entry.Thread = task.spawn(xpcall, function()
            while not entry.Cancelled do
                if Env[configName] == true then
                    local ok, err = pcall(callback)

                    if not ok then
                        warn("Thread '" .. configName .. "' failed: " .. tostring(err))
                    end
                end

                task.wait(delayTime)
            end

            if ActiveThreads[configName] == entry then
                ActiveThreads[configName] = nil
            end
        end, warn)

        return entry.Thread
    end

    function Module.Thread:Remove(configName)
        local entry = ActiveThreads[configName]

        if not entry then
            return false
        end

        entry.Cancelled = true
        ActiveThreads[configName] = nil

        return true
    end

    return Module
end
