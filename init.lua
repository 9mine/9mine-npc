print("NPC mod is loading ...")
config = luaconfig.loadConfig();
np = require '9p'
data = require 'data'
socket = require 'socket'
pprint = require 'pprint'
readdir = require 'readdir'
local path = minetest.get_modpath("9mine_npc")
dofile(path .. "/config.lua")
dofile(path .. "/help_func.lua")
dofile(path .. "/on_player.lua")
dofile(path .. "/spawn.lua")
print("NPC successfully loaded")
