

description "vRP Farmer"
--ui_page "ui/index.html"

dependency "vrp"

client_scripts{ 
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "client.lua",
  "config.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua", 
  '@mysql-async/lib/MySQL.lua',
  "server.lua"
}
