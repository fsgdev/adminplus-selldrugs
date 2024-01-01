if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

function GetPlayers()
    return ESX.GetPlayers()
end

function GetPlayerFromId(id)
    return ESX.GetPlayerFromId(id)
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    return player.addAccountMoney(account, amount)
end

function AddCash(source, amount)
    local player = GetPlayerFromId(source)
    return player.addMoney(amount)
end

function RemoveItem(source, name, amount)
    local xPlayer = GetPlayerFromId(source)
    return xPlayer.removeInventoryItem(name, amount)
end

function GetItemCount(source, name)
    local xPlayer = GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(name)
    if item ~= nil then 
        return item.count
    else
        return 0
    end
end