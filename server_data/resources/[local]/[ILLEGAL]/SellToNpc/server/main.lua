local VorpCore = {}

local checkPD = 0

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

Inventory = exports.vorp_inventory:vorp_inventoryApi()

function getDistance(A, B)
    local x = B.x - A.x
    local y = B.y - A.y
    local z = B.z - A.z
    return math.sqrt((x ^ 2) + (y ^ 2) + (z ^ 2))
end

-------------------------------------------------WEBHOOK------------------------------------

function SendWebhook(webhook, source, message)
    local time = os.date("%d/%m/%Y %X")
    local name = GetPlayerName(source)
    local identifier = GetPlayerIdentifiers(source)
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local playerName = Character.firstname
    local text = message
    local playerLame = Character.lastname
    local data = "VENTE ➝".. time .. ' : ' .. playerName ..' '..playerLame..' ➝ ' .. text
    PerformHttpRequest('https://discord.com/api/webhooks/966041049795543082/oDrl5A0HakjLfKbkZ3kHP4BVqIvyZ5OMtSi5ivvaZVAHb374NHZkedlzqvvY8qViuLZl', function(err, text, headers) end, 'POST', json.encode({content = data}), { ['Content-Type'] = 'application/json' })
end
---------------------------------function check PD requirement-----------------------
function checkPDreq()
    local users = GetPlayers()
    local coponline = 0

    for _k,_v in pairs(users) do
        local users = VorpCore.getUser(_v)
        local character = users.getUsedCharacter
        
        if character.job == Config.job[1] then
            coponline = coponline + 1
        end   
    end
    
    if coponline < Config.coponlinereq then
        return(0)
    end
    return(1)
end

RegisterServerEvent("SellToNPC:CheckHasItems")
AddEventHandler("SellToNPC:CheckHasItems", function()
    local _source = source
    local hasIllicitItems = false
    for _k,_v in pairs(Config.item) do
        if Inventory.getItemCount(_source, _v) > 0 then
            hasIllicitItems = true
            break
        end
    end

    TriggerClientEvent("SellToNPC:HasItems",_source, hasIllicitItems)
end)

RegisterServerEvent('FrankieSellToNPC:CheckTabAndSellItMyGuy')
AddEventHandler('FrankieSellToNPC:CheckTabAndSellItMyGuy', function(Coords,message)
    
    local _source = source
    local kis = math.random(Config.prixMin,Config.prixMax)
	kis = kis / 100
    local AmountToSell = math.random(1,Config.nbVenteMax)
	local luck = math.random(1,Config.seuilChanceVenteMax)
    local count = 0
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local sellFcked = 0
    local dis = getDistance(Coords, Config.coordinates[1])

    local hasIllicitItems = false
    --Check Avant tout si on a les items
    for _k,_v in pairs(Config.item) do
        if Inventory.getItemCount(_source, _v) > 0 then
            hasIllicitItems = true
            break
        end
    end
    --Si on a pas les items on ne fait rien
    if hasIllicitItems == false then 
        TriggerClientEvent("SellToNPC:HasItems", hasIllicitItems)
        TriggerClientEvent("vorp:TipBottom", _source, 'Vous n\'avez rien à vendre', 6000)
        return 
    end

--------------------------------------coords check----------------------------------------
    if  (Config.distance - dis) > 0 then
        sellFcked = 1
    end
--------------------------------------CHECK PD----------------------------------------
    if checkPD == 0 then
        TriggerClientEvent("vorp:TipBottom", _source, 'Pas assez de shérif', 6000)
    elseif checkPD == 1 then
        
 --------------------------------------------------------------------------------  
        local randomitem = 1
        local playeritem = {}
        local _x = 3
        for _k,_v in pairs(Config.item) do
            if Inventory.getItemCount(_source, _v) ~= nil then
                _x = _x + 1
                playeritem[_x] = _v
            end
        end
        if _x > 0 then
            randomitem = playeritem [math.random(1,_x)]
            count = Inventory.getItemCount(_source, randomitem)
        end
        if sellFcked == 1 then
            if _x == 0 then
                TriggerClientEvent("vorp:TipBottom", _source, 'Vous n\'avez rien à vendre', 6000)    
            else 
                if count >= AmountToSell then
                    Inventory.subItem(_source, randomitem, AmountToSell)
                    local price = kis * AmountToSell
                    Character.addCurrency(0 , price)
  	                SendWebhook(webhook, _source, message)
                end      
            end
        else
            TriggerClientEvent("vorp:TipBottom", _source, 'Tu ne vendra rien ici !', 6000)
        end
    end
end)

-----police notify-----------

RegisterNetEvent("policenotify")
AddEventHandler("policenotify", function(players, coords)
    checkPD = checkPDreq()
    if checkPD == 1 then
        for each, player in ipairs(players) do
            TriggerEvent("vorp:getCharacter", player, function(user)
                if user ~= nil then
                    if user.job == Config.job[1] then
                        TriggerClientEvent("Witness:ToggleNotification2", player, coords)
                    end
                end
            end)
        end
    end
end)