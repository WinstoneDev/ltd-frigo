TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('shops:buyitem')
AddEventHandler('shops:buyitem', function(item, count, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xMoney = xPlayer.getMoney()
    
    
    if xMoney >= price then
        xPlayer.removeMoney(price)
 
        TriggerClientEvent('esx:showNotification', source, "Vous avez acheté: ~g~Pain~s~.")
        xPlayer.addInventoryItem(item, count)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent.")
    end
end)
