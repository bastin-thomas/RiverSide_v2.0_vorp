local firstSpawn = true
local active = false
local playerHash = GetHashKey("PLAYER")

local mapTypeOnMount = Config.mapTypeOnMount
local mapTypeOnFoot = Config.mapTypeOnFoot
local enableTypeRadar = Config.enableTypeRadar

pvp = Config.PVP

function setPVP()
    NetworkSetFriendlyFireOption(pvp)

    if not active then
        if pvp then
            SetRelationshipBetweenGroups(5, playerHash, playerHash)
        else
            SetRelationshipBetweenGroups(1, playerHash, playerHash)
        end
    else
        SetRelationshipBetweenGroups(1, playerHash, playerHash)
    end
end

--------------------------- UI RADAR SHOW OR HIDE ---------------------
function UI()
    local player = PlayerPedId()
    local playerOnMout = IsPedOnMount(player)
    local playerOnVeh = IsPedInAnyVehicle(player)
    if Config.HideUi then
        TriggerEvent("vorp:showUi", false)
    end
    if enableTypeRadar then
        if not playerOnMout and not playerOnVeh then
            SetMinimapType(mapTypeOnFoot)

        elseif playerOnMout or playerOnVeh then
            SetMinimapType(mapTypeOnMount)

        end
    end
end

------------------------------ SPAWN PLAYER ----------------------------------------

RegisterNetEvent('vorp:initCharacter', function(coords, heading, isdead)

    TeleportToCoords(coords.x + 0.0, coords.y + 0.0, coords.z + 0.0, heading + 0.0)

    if isdead then
        if not Config.CombatLogDeath then
            --start loading screen
            if Config.Loadinscreen then
                Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, Config.Langs.forcedrespawn, Config.Langs.forced,
                    Config.Langs.Almost)
            end
            TriggerServerEvent("vorp:PlayerForceRespawn")
            TriggerEvent("vorp:PlayerForceRespawn")
            resspawnPlayer()
            Wait(Config.LoadinScreenTimer)
            ExecuteCommand("rc")
            Wait(1000)
            --shut down loading screen
            ShutdownLoadingScreen()

            Wait(7000)
            -- ensure health and stamina
            local health = GetAttributeCoreValue(PlayerPedId(), 0)
            local newHealth = health + 100
            local stamina = GetAttributeCoreValue(PlayerPedId(), 1)
            local newStamina = stamina + 100
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, newHealth)
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, newStamina)
            SetEntityHealth(PlayerPedId(), newHealth)

        else
            if Config.Loadinscreen then
                Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, Config.Langs.Holddead, Config.Langs.Loaddead,
                    Config.Langs.Almost)
            end
            Wait(8000) -- this is needed to ensure the player has enough time to load in their character before it kills them. other wise they revive when the character loads in
            TriggerEvent("vorp_inventory:CloseInv")
            SetEntityHealth(PlayerPedId(), 0, 0)
            Wait(4000)
            ShutdownLoadingScreen()


        end
    else
        if Config.Loadinscreen then
            Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, Config.Langs.Hold, Config.Langs.Load, Config.Langs.Almost)
            Wait(Config.LoadinScreenTimer) -- wait to load in
            -- ExecuteCommand("rc") -- reload clothing
            Wait(1000)
            ShutdownLoadingScreen()

        end

        ------- to make sure health and stamina are filled ----------
        TriggerServerEvent("vorp:GetValues")
        Wait(6000)
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, HealthData.hInner)
        SetEntityHealth(PlayerPedId(), HealthData.hOuter + HealthData.hInner)
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, HealthData.sInner)
        Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), HealthData.sOuter / 1065353215 * 100)
        if Config.DisableRecharge then
            Citizen.InvokeNative(0xDE1B1907A83A1550, PlayerPedId(), 0) --SetHealthRechargeMultiplier
        end

        HealthData = {}
    end



end)
-------------------------------------------------------------------------------------------------



RegisterNetEvent('vorp:SelectedCharacter', function()
    local playerId = PlayerId()

    firstSpawn = false

    SetMinimapHideFow(true)

    if Config.ActiveEagleEye then
        Citizen.InvokeNative(0xA63FCAD3A6FEC6D2, playerId, true)
    end

    if Config.ActiveDeadEye then
        Citizen.InvokeNative(0x95EE1DEE1DCD9070, playerId, true)
    end

    setPVP()
    DisplayRadar(true) -- show HUD
    SetMinimapHideFow(true) -- enable FOW
    TriggerServerEvent("vorp:chatSuggestion") --- chat add suggestion trigger 
    TriggerServerEvent('vorp_core:instanceplayers', 0) -- remove instanced players
end)

HealthData = {}

RegisterNetEvent("vorp:GetHealthFromCore")
AddEventHandler("vorp:GetHealthFromCore", function(healthData)

    HealthData = healthData

end)

AddEventHandler('playerSpawned', function(spawnInfo)
    TriggerServerEvent('vorp_core:instanceplayers', tonumber(GetPlayerServerId(PlayerId())) + 45557) --instance players
    Wait(2000)
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, Config.Langs.Hold, Config.Langs.Load, Config.Langs.Almost)
    DisplayRadar(false) --hide HUD on player select char
    SetMinimapHideFow(false) -- hide map fog of war
    Wait(2000)
    TriggerServerEvent("vorp:playerSpawn")
    Wait(6000) -- wait to load in
    ExecuteCommand("rc") --reload char
    Wait(2000)
    ShutdownLoadingScreen()

end)

-- disable RDR HUDS
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisableControlAction(0, 0x580C4473, true) -- Disable hud
        DisableControlAction(0, 0xCF8A4ECA, true) -- Disable hud
        DisableControlAction(0, 0x9CC7A1A4, true) -- disable special ability when open hud
        DisableControlAction(0, 0x1F6D95E5, true) -- diable f4 key that contains HUD

    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local pped = PlayerPedId()

        if IsControlPressed(0, 0xCEFD9220) then
            active = true
            setPVP()
            Citizen.Wait(4000)
        end

        if not IsPedOnMount(pped) and not IsPedInAnyVehicle(pped, false) and active then
            -- When you press E to get off a horse or carriage
            active = false
            setPVP()
        elseif active and IsPedOnMount(pped) or IsPedInAnyVehicle(pped, false) then
            if IsPedInAnyVehicle(pped, false) then
                --Nothing?
            elseif GetPedInVehicleSeat(GetMount(pped), -1) == pped then
                active = false
                setPVP()
            end
        else
            setPVP() --Set pvp defaults
        end
    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)
        UI()
        if not firstSpawn then
            local player = PlayerPedId()
            local playerCoords, playerHeading = GetEntityCoords(player, true, true), GetEntityHeading(player)
            TriggerServerEvent("vorp:saveLastCoords", playerCoords, playerHeading)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        --print("Updating local data with Health and Stamina")

        local innerCoreHealth = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 0)
        local outerCoreStamina = Citizen.InvokeNative(0x22F2A386D43048A9, PlayerPedId())
        local innerCoreStamina = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)

        TriggerServerEvent("vorp:HealthCached", GetEntityHealth(PlayerPedId()), innerCoreHealth, outerCoreStamina,
            innerCoreStamina)
    end
end)

CreateThread(function()
    while true do
        local player = PlayerPedId()
        Wait(300000)

        local innerCoreHealth = Citizen.InvokeNative(0x36731AC041289BB1, player, 0, Citizen.ResultAsInteger())
        local outerCoreStamina = Citizen.InvokeNative(0x22F2A386D43048A9, player)
        local innerCoreStamina = Citizen.InvokeNative(0x36731AC041289BB1, player, 1, Citizen.ResultAsInteger())
        local getHealth = GetEntityHealth(player)
        local innerHealth = tonumber(innerCoreHealth)
        local innerStamina = tonumber(innerCoreStamina)

        if innerHealth and innerStamina and getHealth and outerCoreStamina then

            TriggerServerEvent("vorp:SaveHealth", getHealth, innerHealth)
            Wait(5)
            TriggerServerEvent("vorp:SaveStamina", outerCoreStamina, innerStamina)
        end
    end
end)

-- To do in server side if is any problems
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1800000)
        TriggerServerEvent("vorp:SaveHours")
	end
end)
