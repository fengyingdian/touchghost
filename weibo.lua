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
    --
    local order = 0
    --开始点赞啦
    local count = 0
    while count < 50000 do
        --
        local x = 0
        local y = 0
        --点赞
        local num = 0
        while num < 10 do
            x, y = base.findPicCor2(2, "/mnt/sdcard/Pictures/weiboIcon/".."location.bmp")
            if x~= -1 and y ~= -1 then
                base.touch(0, x, y) 
            else
                break
            end
            num = num + 1 
        end
        
        --]]--向下翻页
        
        M.moveDown2(0, 715, 1000, 400)
        count = count + 1
    end
end

--move
function M.moveDown(Id, x, y1, y2)   
    while y1 > y2 do 
        touchDown(Id, x, y1)                --ID为0的手指在坐标为(x, y1)的点按下
        mSleep(30)                         --延时50毫秒
        y1 = y1 - 40
        touchMove(Id, x, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
        touchUp(Id)                         --ID为0的手指抬起
    end     
    mSleep(1000)                            --延时2000毫秒
end

--move
function M.moveDown2(Id, x, y1, y2)   
    touchDown(Id, x, y1)                    --ID为0的手指在坐标为(x, y1)的点按下
    mSleep(1000)
    while y1 > y2 do 
        mSleep(30)                          --延时50毫秒
        y1 = y1 - 100
        touchMove(Id, x, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
    end     
    touchUp(Id)                             --ID为0的手指抬起
    mSleep(1000)                            --延时2000毫秒
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