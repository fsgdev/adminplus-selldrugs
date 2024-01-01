if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

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
    local player = GetPlayerFromId(source)
    local item = player.getInventoryItem(name)
    if item ~= nil then 
        return item.count
    else
        return 0
    end
end

function GetItemLabel(source, name)
    local player = GetPlayerFromId(source)
    local item = player.getInventoryItem(name)
    if item ~= nil then
        return item.label
    else
        return 0
    end
end

lib.callback.register('fsg_selldrugs:getPoliceCount', function(source)
    count = 0

    if Config.requiredCops then
        for k, v in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(v)
            if xPlayer ~= nil then 
                if xPlayer.job.name == "police" then
                    count = count + 1
                end
            end
        end
        return count
    else
        return count
    end
end)