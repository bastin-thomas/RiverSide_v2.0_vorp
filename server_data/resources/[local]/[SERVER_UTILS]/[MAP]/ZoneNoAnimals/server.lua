

AddEventHandler("entityCreating", function(entity)
    if GetEntityType(entity) == 1 then
        for i,zone in pairs(Config.Zones) do
            if GetDistanceBetweenCoords(GetEntityCoords(entity), zone.CoordCenter, false) < GetDistanceBetweenCoords(zone.CoordCenter, zone.CoordBorder, false) then
                CancelEvent()
            end
        end
    end
    
end)

function GetDistanceBetweenCoords(coords1, coords2, is3D)
    if(is3D)then
        local dx = coords1.x - coords2.x
        local dy = coords1.y - coords2.y
        local dz = coords1.z - coords2.z
        return math.sqrt (dx * dx + dy * dy + dz * dz)
    else
        local dx = coords1.x - coords2.x
        local dy = coords1.y - coords2.y
        return math.sqrt (dx * dx + dy * dy)
    end
end    