if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

function GetPlayers()
    return QBCore.Functions.GetQBPlayers()
end

function GetPlayerFromId(id)
    return QBCore.Functions.GetPlayer(id)
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    return player.Functions.AddMoney(account, amount, 'Narcotics')
end

function AddCash(source, amount)
    local player = GetPlayerFromId(source)
    return player.Functions.AddMoney('cash', amount, 'Narcotics')
end

function RemoveItem(source, name, amount)
    local player = GetPlayerFromId(source)
    return player.Functions.RemoveItem(name, amount)
end

function GetItemCount(source, name)
    local player = GetPlayerFromId(source)
    local item = player.Functions.GetItemByName(name)
    if item ~= nil then 
        return item.amount
    else
        return 0
    end
end