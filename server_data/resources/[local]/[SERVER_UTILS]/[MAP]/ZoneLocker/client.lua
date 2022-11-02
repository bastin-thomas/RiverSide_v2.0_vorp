zones = {}
isInZone = false

function KillPlayer()
	local _player = PlayerPedId()
	local coords = GetEntityCoords(_player)
	Citizen.InvokeNative(0x697157CED63F18D4, _player, 500,500,550,500)
end



Citizen.CreateThread(function()
	Citizen.Wait(20000)

	zones = Zones
	print("Chargement des zones Réussies.")

	local DeathCt = TimeBeforeKill
	local playerCoords = nil
	local blip = nil
	

	while true do
		playerCoords = GetEntityCoords(PlayerPedId())

		for i, zone in ipairs(zones)  do
			if Vdist(playerCoords, zone.CoordCenter) > Vdist(zone.CoordCenter, zone.CoordBorder) then
				isInZone = false
			else
				isInZone = true
				break
			end
		end

		if isInZone == false then
			if blip ~= nil then
				RemoveBlip(blip)
				blip = nil
				TriggerEvent("vorp:TipBottom", MessageReturnSafe, 3000)
				DeathCt = TimeBeforeKill
			end
		else
			if blip == nil then
				blip = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, 5220.00048828125, -2013.07275390625, 0, Vdist(vector3(1524.000244140625, 410.7984924316406, 89.96570587158203) , vector3(5220.00048828125, -2013.07275390625, 0)))
				TriggerEvent("vorp:TipBottom", MessageBeforeKill, 20000) 
			end
				
			DeathCt = DeathCt - 1
			TriggerEvent("vorp:TipRight", DeathCt,2000)
				
			if DeathCt <= 0 then
				KillPlayer()
				DeathCt = TimeBeforeKill
			end
		end
		Citizen.Wait(1000)
	end 
end)
