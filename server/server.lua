TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('shops:buypain')
AddEventHandler('shops:buypain', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 7
    local item = "pain"
    local xMoney = xPlayer.getMoney()
    
    
    if xMoney >= price then
        xPlayer.removeMoney(price)
 
        TriggerClientEvent('esx:showNotification', source, "Vous avez acheté: ~g~Pain~s~.")
        xPlayer.addInventoryItem(item, 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent.")
    end
end)

RegisterServerEvent('shops:buyeau')
AddEventHandler('shops:buyeau', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 6
    local item = "eau"
    local xMoney = xPlayer.getMoney()
    
    
    if xMoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Vous avez acheté: ~g~Eau~s~.")
        xPlayer.addInventoryItem(item, 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent.")
    end
end)

RegisterServerEvent('shops:buyphone')
AddEventHandler('shops:buyphone', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = 250
    local item = "phone"
    local xMoney = xPlayer.getMoney()
    
    if xMoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "Vous avez acheté: ~g~Téléphone~s~.")
        xPlayer.addInventoryItem(item, 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent.")
    end
end)
