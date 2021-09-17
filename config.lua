ESX = nil 

---------- Ped ---------------


function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(50)
    end
end

DecorRegister("Yay", 4)
pedHash = "cs_clay"
zone = vector3(780.4, 1297, 360.4)
Heading = -90.0
Ped = nil
HeadingSpawn = -90.0

Citizen.CreateThread(function()
    LoadModel(pedHash)
    Ped = CreatePed(2, GetHashKey(pedHash), zone, Heading, 0, 0)
    DecorSetInt(Ped, "Yay", 5431)
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "cs_clay", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
end)






