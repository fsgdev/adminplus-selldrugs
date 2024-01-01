if GetResourceState('qbx_core') ~= 'started' then return end

function GetPlayerFromId(id)
    return exports.qbx_core:GetPlayer(id)
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'black_money' then
        local billsMeta = {
            worth = amount,
            description = "Value: $"..amount
        }
        return player.Functions.AddItem('markedbills', 1, false, billsMeta)
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
        for _, v in pairs(exports.qbx_core:GetQBPlayers()) do
            if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
                count = count + 1
            end
        end
        return count
    else
        return count
    end
end)