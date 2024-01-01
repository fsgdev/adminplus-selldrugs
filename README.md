# [fsg_selldrugs](https://github.com/fsgdev/fsg_selldrugs)
### This is stasiek_selldrugsv2 but with added features such as:
- QBCore & es_extended compatibility (should also work perfectly on QBox)
- ox_lib notifications and integration
- cd_dispatch integration
- anti-drop exploit from inventories to avoid selling your item & still receiving $.

THIS IS NOT MY SCRIPT, THE ORIGINAL CREATOR IS https://github.com/xxxstasiek/stasiek_selldrugsv2 & https://github.com/itsAdminPlus/adminplus-selldrugs

## cd_dispatch integration

### Client sided code

Replace this from line 42 in client/client.lua
```
lib.notify({
	title = Config.notify.title,
	description = Config.notify.cops,
	position = 'center-right',
	duration = 8000,
	icon = 'pills'
})
```
to
```
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
```

-----------------------------------------

### Server sided code

Replace this from line 55 in server/server.lua
```
TriggerClientEvent('stasiek_selldrugsv2:notifyPolice', -1, drugToSell.coords)
```
to
```
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
```
