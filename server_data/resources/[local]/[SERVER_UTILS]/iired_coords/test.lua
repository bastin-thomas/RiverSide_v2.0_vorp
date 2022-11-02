if hold_axe or hold_pickaxe or hold_bucket or hold_cotton then
    optimalization_fix = 5
    if hold_axe then
        for k,v in pairs(Config.Trees) do
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
            local chp1 = DoesObjectOfTypeExistAtCoords(x,y,z, 1.0, v, false, false, false)
            if chp1 then
                if active == false then
                    local item_name = CreateVarString(10, 'LITERAL_STRING', "Hache")
                    PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
                end
                if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x27D1C284) then
                    local PlayerCords = GetEntityCoords(PlayerPedId())
                    can_cut = true
                    for k,v in pairs(Config.Trees) do
                        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
                        local chp1 = DoesObjectOfTypeExistAtCoords(x,y,z, 1.0, v, false, false, false)
                        if chp1 then
                            for k,v in pairs(entit) do
                                if GetDistanceBetweenCoords(PlayerCords.x, PlayerCords.y, PlayerCords.z, v.x, v.y, v.z, false) < 3 then
                                    can_cut = false
                                end
                            end
                            if can_cut then
                                can_cut_tree()
                            end
                            can_cut = false
                            table.insert(entit, {x=PlayerCords.x, y=PlayerCords.y, z=PlayerCords.z})
                        end
                    end
                end
            end
        end					



        
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            optimalization_fix = 5
            bush = GetClosestBush()
        end
        if bush then
            optimalization_fix = 5
            if active_bl == false then
                local woodbranchGroupName  = CreateVarString(10, 'LITERAL_STRING', "Brindilles")
                PromptSetActiveGroupThisFrame(woodbranchgroup, woodbranchGroupName)
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x27D1C284) then
                active_bl = true
                oldBush[tostring(bush)] = true
                goCollect()
            end
        end
        Citizen.Wait(optimalization_fix)


        function GetClosestBush()
            local playerped = PlayerPedId()
            local itemSet = CreateItemset(true)
            local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(playerped), 2.0, itemSet, 3, Citizen.ResultAsInteger())
            if size > 0 then
                for index = 0, size - 1 do
                    local entity = GetIndexedItemInItemset(index, itemSet)
                    local model_hash = GetEntityModel(entity)
                    if (model_hash ==  477619010 or model_hash ==  85102137 or model_hash ==  -1707502213) and not oldBush[tostring(entity)] then
                      if IsItemsetValid(itemSet) then
                          DestroyItemset(itemSet)
                      end
                      return entity
                    end
                end
            else
            end
            if IsItemsetValid(itemSet) then
                DestroyItemset(itemSet)
            end
        end