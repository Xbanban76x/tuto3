ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RMenu.Add("weedfield", "main", RageUI.CreateMenu("Récolte Weed"," ",1350, 50))
RMenu:Get("weedfield", "main").Closed = function()
    FreezeEntityPosition(PlayerPedId(), false)

 

    IsMenuOpen2 = false  
        
end 
    function OpenMenuWeedField()
    if IsMenuOpen2 then
        IsMenuOpen2 = false

        return
    else
        IsMenuOpen2 = true


        RageUI.Visible(RMenu:Get('weedfield', 'main'), true) -- ici c'est pour rendre visible le menu principale
            while IsMenuOpen2 do -- si le menu est ouvert alors ↓↓

                RageUI.IsVisible(RMenu:Get('weedfield', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Récolter de la weed", nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('weedfield')
                            ExecuteCommand('e inspect')
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
local weedfield = {
{x = 1056.8,  y = -3198.3,  z = -39.1},
{x = 1062.3, y = -3193.3, z = -39.1},
}

    Citizen.CreateThread(function()
        while true do
            time = 2500
                for k in ipairs(weedfield) do
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, weedfield[k].x, weedfield[k].y, weedfield[k].z)

                        if dist <= 2.0 then
                            time = 1
                            RageUI.Text({ message = "Appuyez sur ~b~[E]~w~ pour commencer la récolte", time_display = 1 })
                        
                        if IsControlJustPressed(1,51) then
                            OpenMenuWeedField()
                        end
                    end
                end
            Citizen.Wait(time)
        end
    end)
    

   