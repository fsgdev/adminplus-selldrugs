THIS IS NOT MY SCRIPT, THE ORIGINAL CREATOR IS https://github.com/xxxstasiek/stasiek_selldrugsv2 | All I did was modify the notifications & added a anti drop exploit from inventories to avoid selling your item & still receiving $.

    [ client sided code ]
    
    local data = exports['cd_dispatch']:GetPlayerInfo()
		TriggerServerEvent('cd_dispatch:AddNotification', {
    	job_table = {'police'}, 
    	coords = npc.ped,
    	title = '10-15 - Drug Sale',
    	message = 'A '..data.sex..' is selling drugs near '..data.street, 
    	flash = 0,
    	unique_id = tostring(math.random(0000000,9999999)),
    	blip = {
        	sprite = 431, 
        	scale = 1.2, 
        	colour = 3,
        	flashes = false, 
        	text = '911 - Drug Sales',
        	time = (5*60*1000),
        	sound = 1,
    	}
	})

    -- for cd_dispatch integration add this under line 83 in client.lua & remove
    ESX.ShowAdvancedNotification(Config.notify.title, '', Config.notify.cops, 'DIA_CLIFFORD', 1)

    -----------------------------------------

    [ server sided code ]

    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job_table = {'police'},
        coords = drugToSell.coords,
        title = '10-15 - Drug Sale',
        message = 'Someone is selling drugs',
        flash = 0,
        unique_id = tostring(math.random(0000000,9999999)),
        blip = {
            sprite = 403,
            scale = 1.2,
            colour = 1,
            flashes = false,
            text = '911 - Drug Sale',
            time = (5*60*1000),
            sound = 1,
        }
    })

    -- for cd_dispatch integration add this under line 55 in server.lua & remove
    TriggerClientEvent('stasiek_selldrugsv2:notifyPolice', -1, drugToSell.coords)
