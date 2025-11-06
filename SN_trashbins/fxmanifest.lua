fx_version 'cerulean'
game 'gta5'

author 'ChatGPT'
description 'Bin searching using ox_target + ox_lib + ox_inventory'
version '1.0.0'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

dependencies {
    'ox_lib',
    'ox_target',
    'ox_inventory'
}