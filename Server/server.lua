ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-------------------------- Nourriture ---------------------

RegisterNetEvent('weedfield')
AddEventHandler('weedfield', function()
    local item = "weed"
    local nombregive = "5"
    local limiteitem = 25
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getWeight()
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, nombregive)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('weedprocess')
AddEventHandler('weedprocess', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local weed = xPlayer.getInventoryItem('weed').count
    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count

    if weed_pooch > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de sachets de weed .. Vas les vendre')
    elseif weed < 3 then
        TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de weed pour traiter')
    else
        xPlayer.removeInventoryItem('weed', 5)
        xPlayer.addInventoryItem('weed_pooch', 1)    
    end
end)

--[[RegisterServerEvent('weedprocess')
AddEventHandler('weedprocess', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local weedpooch = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "weed_pooch" then
			weedpooch = item.count
		end
	end
    
    if weedpooch > 0 then
        xPlayer.removeInventoryItem('weed_pooch', 1)
        xPlayer.addAccountMoney('black_money', 25)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Dégage d\'ici si ta rien. Boloss')
    end
end)--]]

