_whitelist = {}


function AddUserToWhitelistById(id)
    _whitelist[id].GetEntry().setStatus(true)
end

function RemoveUserFromWhitelistById(id)
    _whitelist[id].GetEntry().setStatus(false)
end

local function LoadWhitelist()
    Citizen.Wait(5000)
    exports.ghmattimysql:execute('SELECT * FROM whitelist', {}, function(result)
        if #result > 0 then
            for k, v in ipairs(result) do
                _whitelist[v.id] = Whitelist(v.id, v.identifier, v.status, v.firstconnection)
            end
        end
    end)
end

local function SetUpdateWhitelistPolicy()
    while Config.AllowWhitelistAutoUpdate do
        Citizen.Wait(3600000) --change this value if you want to have update from SQL not every 1 hour
        _whitelist = {}
        exports.ghmattimysql:execute("SELECT * FROM whitelist", {}, function(result)
            if #result > 0 then
                for k, v in ipairs(result) do
                    _whitelist[v.id] = Whitelist(v.id, v.identifier, v.status, v.firstconnection)
                end
            end
        end)
    end
end

function GetSteamID(src)
    local sid = GetPlayerIdentifiers(src)[1] or false

    if (sid == false or sid:sub(1, 5) ~= "steam") then

        return false
    end

    return sid
end

function GetIdentifier(source, id_type)
    if type(id_type) ~= "string" then return print('Invalid usage') end
    for _, identifier in pairs(GetPlayerIdentifiers(source)) do
        if string.find(identifier, id_type) then
            return identifier
        end
    end
    return nil
end

function GetLicenseID(src)
    local sid = GetPlayerIdentifiers(src)[2] or false
    if (sid == false or sid:sub(1, 5) ~= "license") then
        return false
    end

    return sid
end

function GetUserId(identifier)
    for k, v in pairs(_whitelist) do
        if v.GetEntry().getIdentifier() == identifier then
            return v.GetEntry().getId()
        end
    end
end

function InsertIntoWhitelist(identifier)
    if GetUserId(identifier) then
        return GetUserId(identifier)
    end

    exports.ghmattimysql:executeSync("INSERT INTO whitelist (identifier, status, firstconnection) VALUES (@identifier, @status, @firstcon)"
        ,
        { ['@identifier'] = identifier, ['@status'] = false, ['@firstcon'] = true }, function(result) end)
    local entryList = exports.ghmattimysql:executeSync('SELECT * FROM whitelist WHERE identifier = ?', { identifier })
    local currentFreeId
    if #entryList > 0 then
        local entry = entryList[1]
        currentFreeId = entry["id"]
    end
    _whitelist[currentFreeId] = Whitelist(currentFreeId, identifier, false, true)

    return currentFreeId
end

Citizen.CreateThread(function()
    LoadWhitelist()
    SetUpdateWhitelistPolicy()
end)

AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local _source = source
    local userEntering = false

    deferrals.defer()
    local steamIdentifier = GetSteamID(_source)
    local playerWlId = nil
    local IDs = GetIdentifier(_source, 'steam')

    if IDs == nil then
        deferrals.done(Config.Langs.NoSteam)
        userEntering = false
        CancelEvent()
        return
    end

    if _users[steamIdentifier] and not _usersLoading[identifier] then --Save and delete
        _users[steamIdentifier].SaveUser()
        _users[steamIdentifier] = nil
    end

    if Config.Whitelist then
        playerWlId = GetUserId(steamIdentifier)
        if _whitelist[playerWlId] and _whitelist[playerWlId].GetEntry().getStatus() then
            deferrals.done()
            userEntering = true
        else
            playerWlId = InsertIntoWhitelist(steamIdentifier)
            deferrals.done(Config.Langs.NoInWhitelist .. playerWlId)
            setKickReason(Config.Langs.NoInWhitelist .. playerWlId)
        end
    else
        userEntering = true
    end

    if userEntering then
        deferrals.update(Config.Langs.LoadingUser)
        if CheckConnected(steamIdentifier) then
            deferrals.done(Config.Langs.IsConnected)
            setKickReason(Config.Langs.IsConnected)
        else
            LoadUser(_source, setKickReason, deferrals, steamIdentifier, GetLicenseID(_source))
        end

    end

    exports.ghmattimysql:execute("SELECT * FROM characters WHERE `identifier` = ?", { steamIdentifier },
        function(result)
            if #result ~= 0 then
                local inventory = "{}"
                if not result[1].inventory == nil then
                    inventory = result[1].inventory
                end
                LoadCharacter(steamIdentifier,
                    Character(_source, steamIdentifier, result[1].charidentifier, result[1].group, result[1].job,
                        result[1].jobgrade, result[1].firstname, result[1].lastname, inventory, result[1].status,
                        result[1].coords, result[1].money, result[1].gold, result[1].rol, result[1].healthouter,
                        result[1].healthinner, result[1].staminaouter, result[1].staminainner, result[1].xp,
                        result[1].hours, result[1].isdead))
            end
        end)
    local getPlayer = GetPlayerName(_source)
    if getPlayer then
        print("Player ^2" .. getPlayer .. " ^7steam: ^3" .. steamIdentifier .. "^7 Loading...")
    end
    --When player is fully connected then load!!!!
end)
