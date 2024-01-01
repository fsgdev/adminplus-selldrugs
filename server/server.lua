RegisterCommand('dealer', function(source, args, rawcommand)
    drugToSell = {
        type = '',
        label = '',
        count = 0,
        i = 0,
        price = 0,
    }
    for k, v in pairs(Config.drugs) do
        item = xPlayer.getInventoryItem(k)
            
        if item == nil then
            return        
        end
            
        count = item.count
        drugToSell.i = drugToSell.i + 1
        drugToSell.type = k
        drugToSell.label = item.label
        
        if count >= 5 then
            drugToSell.count = math.random(1, 5)
        elseif count > 0 then
            drugToSell.count = math.random(1, count)
        end

        if drugToSell.count ~= 0 then
            drugToSell.price = drugToSell.count * v + math.random(1, 300)
            TriggerClientEvent('stasiek_selldrugsv2:findClient', source, drugToSell)
            break
        end
        
        if TableSizeOf(Config.drugs) == drugToSell.i and drugToSell.count == 0 then
            TriggerClientEvent('ox_lib:notify', source, {title = 'Drugs', description = Config.notify.nodrugs, duration = 8000, position = 'center-right', icon = 'pills'})
        end
    end
end, false)

RegisterServerEvent('stasiek_selldrugsv2:pay')
AddEventHandler('stasiek_selldrugsv2:pay', function(drugToSell)
    local src = source
    local count = GetItemCount(drugToSell.type)
    if count >= drugToSell.count then
        RemoveItem(src, drugToSell.type, drugToSell.count)
        if Config.account == 'money' then
            AddCash(src, drugToSell.price)
        else
            AddAccountMoney(source, Config.account, drugToSell.price)
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Drugs', description = Config.notify.nodrugs, duration = 8000, position = 'center-right', icon = 'pills'})
    end
end)

RegisterServerEvent('stasiek_selldrugsv2:notifycops')
AddEventHandler('stasiek_selldrugsv2:notifycops', function(drugToSell)
    TriggerClientEvent('stasiek_selldrugsv2:notifyPolice', -1, drugToSell.coords)
end)

lib.callback.register('fsg_selldrugs:getPoliceCount', function(source, item, metadata, target)
    count = 0

    if Config.requiredCops then
        for k, v in pairs(GetPlayers()) do
            local player = GetPlayerFromId(v)
            if player ~= nil then 
                if player.job.name == "police" then
                    count = count + 1
                end
            end
        end
        return
    else
        return
    end
end)
