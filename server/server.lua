RegisterCommand('dealer', function(source, args, rawcommand)
    drugToSell = {
        type = '',
        label = '',
        count = 0,
        i = 0,
        price = 0,
    }
    for k, v in pairs(Config.drugs) do
        local item = GetItemLabel(source, k)
            
        if item == nil then
            return        
        end
            
        count = GetItemCount(source, k)
        drugToSell.i = drugToSell.i + 1
        drugToSell.type = k
        drugToSell.label = item
        
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
    local count = GetItemCount(src, drugToSell.type)
    if count >= drugToSell.count then
        RemoveItem(src, drugToSell.type, drugToSell.count)
        if Config.account == 'money' then
            AddCash(src, drugToSell.price)
        else
            AddAccountMoney(src, Config.account, drugToSell.price)
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Drugs', description = Config.notify.nodrugs, duration = 8000, position = 'center-right', icon = 'pills'})
    end
end)

RegisterServerEvent('stasiek_selldrugsv2:notifycops')
AddEventHandler('stasiek_selldrugsv2:notifycops', function(drugToSell)
    TriggerClientEvent('stasiek_selldrugsv2:notifyPolice', -1, drugToSell.coords)
end)