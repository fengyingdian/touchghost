--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------
require "para"
require "base"
--------------------------------------------------
--------------------------------------------------
--go
function M.go()
    --如果app在运行关闭app
    --if appRunning("com.tencent.mm") then
    --    appKill("com.tencent.mm")
    --    mSleep(1000)
    --end
    --
    --打开程序
    --M.runApp()
    --点击发现
    --base.touch(0, 450, 1210)
    --点击朋友圈
    --base.touch(0, 65, 235)
    --开始点赞啦
    local count = 0
    while count < 5000 do
        --点赞
        local x, y = base.findPicCor(2, "/mnt/sdcard/Pictures/wxIcon/".."xiaodaka.bmp", 390, 100, 450, 1100)
        if x~= -1 and y ~= -1 then
            base.touch(0, x+20, y+20)
            base.moveDown(0, 715, y+500, 145+200)
            count = count + 1
        else
            base.moveDown(0, 715, 1000, 200)
        end
        --[[评论
        local x, y = base.findPicCor2(2, "/mnt/sdcard/Pictures/wxIcon/".."location.bmp")
        if x~= -1 and y ~= -1 then
            base.touch(0, x, y) 
            local xx, yy = base.findPicCor2(2, "/mnt/sdcard/Pictures/wxIcon/".."comment.bmp")
            if xx~= -1 and yy ~= -1 then
                base.touch(0, xx, yy)
                M.sendMessage("中午好！")
            end
        end
        --]]--向下翻页
    end
end

--run app
function M.runApp()
    appRun("com.tencent.mm")	 --APP入口
    notifyMessage("请耐心等待十秒钟！")
    mSleep(8000)
end

--send message
function M.sendMessage(strContent)
   --复制消息
    copyText(strContent)
    --准备发送消息
    touchDown(0, para.MidX, 1230)
    mSleep(1000)
    touchUp(0)
    mSleep(500)
    --点击粘贴
    touchDown(0, 70, 1150)
    touchUp(0)
    mSleep(500)
    --发送
    touchDown(0, 660, 1230)
    mSleep(500)
    touchUp(0)
    mSleep(500)
    --发送
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------