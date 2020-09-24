minetest.register_on_joinplayer(function(player)
    player:set_pos({x = 0, y = 2, z = 0})
    parted = false
    local spawned, count = get_npcs()
    spawn_npc(spawned, count, player)
end)

minetest.register_on_leaveplayer(function(player, timed_out)
    player = nil
    parted = true
end)

minetest.register_on_generated(function(minp, maxp, blockseed)
    if minp.x < 0 and minp.y < 0 and minp.z < 0 then
        platforms.create({x = 0, y = 0, z = 0}, 16, "horizontal")
    end
end)