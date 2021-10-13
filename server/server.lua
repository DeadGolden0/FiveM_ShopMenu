ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Shop:giveItem')
AddEventHandler('Shop:giveItem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()

    if playerMoney >= item.Price * count then
          xPlayer.addInventoryItem(item.Value, count)
          xPlayer.removeMoney(item.Price * count)

          TriggerClientEvent('esx:showAdvancedNotification', source, 'SUPERMARKET', "~g~Achat effectué", "~b~Achat(s) : ~s~x".. count .." " ..item.Label.. "<br>~b~Prix : ~s~"..item.Price * count .."$", 'CHAR_BANK_MAZE', 1)
     else
          TriggerClientEvent('esx:showAdvancedNotification', source, 'SUPERMARKET', "~r~Achat annulé", "Vous n'avez assez d'argent !<br>Il vous manque ~r~"..item.Price * count - playerMoney.."$", 'CHAR_BANK_MAZE', 1)
     end
end)