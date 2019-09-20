--------------------------------------------------
--------------------------------------------------
package.path = package.path..";/mnt/sdcard/Pictures/lua/?.lua"
print(package.path)
--------------------------------------------------
--------------------------------------------------
require "para"
require "base"
require "icon"
require "qpya"
require "qpyb"
require "qpyc"
require "qpyd"
require "qpye"
require "qpyf"
require "qpyAdd"
require "qpy"
require "wx"
require "log"
require "net"
require "xiaodaka"
require "weibo"
--------------------------------------------------
--------------------------------------------------

--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------

--go
function M.gogo()
    mSleep(3000)
    notifyMessage("开始执行！")
    ----------------------------------------
    ----------------------------------------
    local index = 2
    ----------------------------------------
    ----------------------------------------
    if index == 0 then
        --[[新成员
        qpyb.go()
        --
        qpy.moveFromMemToZgx()
        --
        --]]--周贡献
        --qpya.go()
        ----退出周贡献
        --base.touch(0, para.ReturnX, para.TopY)
        --]]--每日一句
        qpyf.go()
    elseif index == 1 then
        weibo.go()
    elseif index == 2 then
        wx.go()
    elseif index == 3 then
        qpyf.go()
    elseif index == 4 then
        qpye.go()
    elseif index == 5 then
        qpyc.go()
    elseif index == 6 then
        qpyd.go()
    elseif index == 7 then
        qpya.go()
    elseif index == 10 then
        log.go()       
    elseif index == 20 then
        net.go()   
    elseif index == 25 then
        qpyAdd.go()  
    elseif index == 30 then
        qpyAdd.go()   
    end
    ----------------------------------------
    ----------------------------------------
    notifyMessage("执行结束！")
    return 1
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------