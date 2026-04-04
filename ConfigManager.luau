return (function(d,g)
    if typeof(d) ~= "string" then
        error("Config loader: argument must be string", 2)
    end

    if typeof(g) ~= "table" then 
        error("Config loader: argument must to be table",2)
    end


    local Scripts = {}
    local Settings = {}
    local HttpService = game:GetService('HttpService')

    Scripts.SC = function()
        if not isfolder(d) then
            makefolder(d)
        end
        if not isfolder(d.."/"..game.PlaceId) then
            makefolder(d.."/"..game.PlaceId)
        end

        local path = d.."/"..game.PlaceId.."/"..game.Players.LocalPlayer.Name.."-config.json"

        if isfile(path) then
            local ok, result = pcall(function()
                return HttpService:JSONDecode(readfile(path))
            end)
            if ok and type(result) == "table" then
                Settings = result
            end
        end

        for k,v in pairs(Settings) do
            g[k] = v
        end
    end

    Scripts.S = function()
        return Settings
    end

    Scripts.SG = function()
        for k,v in pairs(g) do
            if typeof(v) == "boolean"
            or typeof(v) == "string"
            or typeof(v) == "number" then
                Settings[k] = v
            end
        end

        writefile(
            d.."/"..game.PlaceId.."/"..game.Players.LocalPlayer.Name.."-config.json",
            HttpService:JSONEncode(Settings)
        )
    end

    return Scripts
end)
