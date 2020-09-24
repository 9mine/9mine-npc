spawn_npc = function(spawned, count, player)
    local spawned, count = get_npcs()
    local result, dir = get_dir(config.host, config.port, config.dir)
    local leftover = table.copy(spawned)
    if result and dir ~= nil then
        for n, file in pairs(dir) do
            if file.qid.type == 128 then
                if spawned[file.name] ~= nil then
                    leftover[file.name] = nil
                else
                    local ref = {
                        id = count,
                        pos = {
                            x = math.random(0, 16),
                            y = 1,
                            z = math.random(0, 16)
                        },
                        yaw = 0,
                        name = "npcf_p9:npc",
                        title = {text = file.name, color = "#000000"}
                    }
                    npcf:add_npc(ref)
                    npcf:add_title(ref)
                    spawned[file.name] = count
                    count = count + 1
                end
            end
        end
    end
    if next(leftover) ~= nil then
        for k, v in pairs(leftover) do
            spawned[k] = nil
            npcf:delete(v)
        end
    end
    if parted then
        print("Player is gone. Stop recursion")
    else
        minetest.after(2, spawn_npc, spawned, count, player)
    end
end
