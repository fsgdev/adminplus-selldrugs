fx_version 'cerulean'
game 'gta5'

author 'adminplus & fsg'
description 'fsg selldrugs'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    -- '@qbx_core/modules/utils.lua' -- Uncomment if using QBox
}

client_scripts {
    -- '@qbx_core/modules/playerdata.lua', -- Uncomment if using QBox
    'bridge/**/client.lua',
    'config.lua',
    'client/functions.lua',
    'client/client.lua',
}

server_scripts {
    'bridge/**/server.lua',
    'config.lua',
    'server/functions.lua',
    'server/server.lua',
}

