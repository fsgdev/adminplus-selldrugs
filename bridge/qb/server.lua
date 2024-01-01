if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerFromId(id)
    return QBCore.Functions.GetPlayer(id)
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'black_money' then
        local info = {
            worth = amount
        }
        return player.Functions.AddItem('markedbills', 1, false, info)
    else
        return player.Functions.AddMoney(account, amount, 'Narcotics')
    end
end

function AddCash(source, amount)
    local player = GetPlayerFromId(source)
    return player.Functions.AddMoney('cash', amount, 'Narcotics')
end

function RemoveItem(source, name, amount)
    local player = GetPlayerFromId(source)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[name], 'remove', amount)
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

function GetItemLabel(source, name)
    local player = GetPlayerFromId(source)
    local item = player.Functions.GetItemByName(name)
    if item ~= nil then
        return item.label
    else
        return 0
    end
end

lib.callback.register('fsg_selldrugs:getPoliceCount', function(source)
    count = 0
    if Config.requiredCops then
        for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
            if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
                count = count + 1
            end
        end
        return count
    else
        return count
    end
end)