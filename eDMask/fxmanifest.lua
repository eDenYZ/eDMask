fx_version 'adamant'

game 'gta5'

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
}

client_scripts {
    "client/*.lua",
}

server_scripts {
    '@eDBase/base/lib/MySQL.lua',
    "server/*.lua",
}

shared_scripts {
    "shared/*.lua",
}
