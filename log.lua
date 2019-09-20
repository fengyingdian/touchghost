--------------------------------------------------
--------------------------------------------------
require "net"
--------------------------------------------------
--------------------------------------------------

--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------
 
--测试用
function M.go()
    for i = 0, 10 do
        local strTemp = string.format("%d", i)
        M.logDebug(strTemp)
    end
end

--文件是否存在
 function M.findFile(path)
    local f = io.open(path, "r")
    if f ~= nil then
        f:close()
        return true
    end
    return false
end

--查找文件
function M.sereachFile(path)
    return io.popen("find "..path.." -prune");
end

--写文件
function M.writeFile(path, data)
    file = nil
    if M.findFile(path) == false then
        file = io.open(path, "w")
    else
        file = io.open(path, "a")
    end
    if file ~= nil then
        if data ~= nil then
            file:write(data)
        end 
        file:close()
    end
end

--log
function M.logDebug(strData)
    --网络
    local strRes = net.logDebug(strData)
    strRes = strRes.."\n"
    --准备数据
    local date = os.date("%y.%m.%d", os.time())
    local strDate = string.format("%s", date)
    --本地
    local strPath = "/mnt/sdcard/Pictures/log/"..strDate
    M.writeFile(strPath, strRes)
end

--logCount
function M.logCount(strDate, bSuccess)
    --网络
    local strRes = net.logCount(strDate, bSuccess)
    strRes = strRes.."\n"
    --准备数据
    local date = os.date("%y.%m.%d", os.time())
    local strDate = string.format("%s", date)
    --本地
    local strPath = "/mnt/sdcard/Pictures/log/"..strDate
    M.writeFile(strPath, strRes)
end

--log
function M.logDebugAdd(strData)
    --网络
    local strRes = net.logDebug(strData)
    strRes = strRes.."\n"
    --准备数据
    local date = os.date("%y.%m.%d", os.time())
    local strDate = string.format("%s", date)
    --本地
    local strPath = "/mnt/sdcard/Pictures/log/"..strDate.."add"
    M.writeFile(strPath, strRes)
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------