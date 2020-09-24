get_dir = function(host, port, dir)
    local tcp = socket:tcp()
    local connection, err = tcp:connect(host, port)
    if (err ~= nil) then print("Connection error: " .. dump(err)) end
    local conn = np.attach(tcp, "root", "")
    local result, content = pcall(readdir, conn, dir)
    tcp:close()
end

get_npcs = function()
    local count = 0
    local spawned = {}
    for k, v in pairs(npcf.npcs) do
        spawned[v.title.text] = count
        count = count + 1
    end
    return spawned, count
end
