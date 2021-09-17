ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RMenu.Add("weedprocess", "main", RageUI.CreateMenu("Traitement de Weed"," ",1350, 50))

RMenu:Get("weedprocess", "main").Closed = function()
    FreezeEntityPosition(PlayerPedId(), false)

 

    IsMenuOpen2 = false  
        
end 
    function OpenMenuWeedProcess()
    if IsMenuOpen2 then
        IsMenuOpen2 = false

        return
    else
        IsMenuOpen2 = true


        RageUI.Visible(RMenu:Get('weedprocess', 'main'), true) -- ici c'est pour rendre visible le menu principale
            while IsMenuOpen2 do -- si le menu est ouvert alors ↓↓

                RageUI.IsVisible(RMenu:Get('weedprocess', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Traiter de la weed", nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('weedprocess')
                            Citizen.Wait(5000)

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

local weedprocess = {
    {x = 1529.0,  y = 3794.5,  z = 34.5},
}

    Citizen.CreateThread(function()
        while true do
            time = 2500
                for k in ipairs(weedprocess) do
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, weedprocess[k].x, weedprocess[k].y, weedprocess[k].z)

                        if dist <= 8.0 then
                            time = 1
                            RageUI.Text({ message = "Appuyez sur ~b~[E]~w~ pour commencer le traitement", time_display = 1 })
                        
                        if IsControlJustPressed(1,51) then
                            OpenMenuWeedProcess()
                        end
                    end
                end
            Citizen.Wait(time)
        end
    end)
    

   