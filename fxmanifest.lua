fx_version 'cerulean'
game 'gta5'

author 'adminplus & fsg'
description 'fsg selldrugs'
lua54 'yes'

shared_script '@ox_lib/init.lua'

client_scripts {
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

