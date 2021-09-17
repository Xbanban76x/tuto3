ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RMenu.Add("weedsell", "main", RageUI.CreateMenu("Récolte Weed"," ",1350, 50))
RMenu:Get("weedsell", "main").Closed = function()
    FreezeEntityPosition(PlayerPedId(), false)

 

    IsMenuOpen2 = false  
        
end 
    function OpenMenuWeed()
    if IsMenuOpen2 then
        IsMenuOpen2 = false

        return
    else
        IsMenuOpen2 = true


        RageUI.Visible(RMenu:Get('weedsell', 'main'), true)
            while IsMenuOpen2 do 

                RageUI.IsVisible(RMenu:Get('weedsell', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Vendre de la weed", nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('weedsell')
                            Citizen.Wait(8500)

                        end
                    end)



                    FreezeEntityPosition(PlayerPedId(), true)
            end, function()
            end)



        

    Wait(1)
    end
end
end

----------------------------------------- FUNCTION ---------------------------------
local weedsell = {
{x = 780.4,  y = 1296.9,  z = 361.4},
}

    Citizen.CreateThread(function()
        while true do
            time = 2500
                for k in ipairs(weedsell) do
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, weedsell[k].x, weedsell[k].y, weedsell[k].z)

                        if dist <= 8.0 then
                            time = 1
                            RageUI.Text({ message = "Appuyez sur ~b~[E]~w~ pour commencer la récolte", time_display = 1 })
                        
                        if IsControlJustPressed(1,51) then
                            OpenMenuWeed()
                        end
                    end
                end
            Citizen.Wait(time)
        end
    end)
    

   