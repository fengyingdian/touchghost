--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------
require "para"
require "base"
require "qpy"
require "log"
--------------------------------------------------
--------------------------------------------------

--
function M.go()
    log.logDebug(">>开始点赞")
    while true do
        M.thumbUp()
    end
    log.logDebug(">>结束点赞")
end

--
function M.thumbUp()
    --杀死进程
    --因为有些安卓系统不能一次杀死进程所以根据具体的情况具体操作
    --返回：1-目前位于打卡提醒界面
    --返回：2-目前位于每日打卡界面
    --返回：0-进程已经被杀死
    local res = M.killApp()
    if res ~= 1 then
        --启动程序
        if res == 0 then
            M.runApp()
        end
        --进入打卡提醒界面
        M.enterClockin()
    end
    --进入查看全部
    M.enterList()   
    --准备数据
    local yStart = 190
    --记录状态
    local round = 0
    --依次点赞
    while true do                 
        --
        local i = 0
        while i < 9 do 
            --
            local bThumbUp = false
            --
            local strTemp = "点击"
            --进入同学首页
            base.touch(0, 70, i*120 + yStart)
            --判断是否已经进入主页
            local bRes1 = qpy.isPageZy()       
            if bRes1 == true then
                --判断是否可以进入作品界面
                if qpy.checkPageZy() == true then
                    --进入同学第二个作品
                    strTemp = strTemp.."-进入主页"
                    base.touch(0, para.MidX, 850)
                    --判断是否进入作品界面
                    local bRes2 = qpy.isPageZp()
                    if bRes2 == true then
                        strTemp = strTemp.."-进入作品"
                        --判断是否可以点赞
                        local res = qpy.checkPageZp()
                        if res == 0 then
                            bThumbUp = true
                            strTemp = strTemp.."-点赞"
                            base.touchFast(640, 520)
                        else
                            strTemp = strTemp.."-未点赞" 
                        end
                        --单击视频左上角
                        base.touch(0, para.ReturnX, para.TopY)
                        --退出同学作品界面
                        base.touch(0, para.ReturnX, para.TopY)
                    end
                end
                --退出同学主页
                base.touch(0, para.ReturnX, para.TopY)
            end 
            --记录点赞数据，用另外一个函数
            log.logCount(strTemp, bThumbUp)
            --
            if bThumbUp == true then
                round = 0
            else
                round = round + 1
            end
            --
            if round == 5 then
                log.logDebug(">>进程：错误")
                return
            end
            --
            i = i + 1
        end
        --查看是不是结束
        local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_end_thumbup.bmp", 280, 1210, 440, 1260)
        if bRes == true then
            --退出今日打卡
            log.logDebug(">>>>退出列表：结束位")
            base.touch(0, para.ReturnX, para.TopY)
            mSleep(1000)
            base.touch(0, para.ReturnX, para.TopY)
            mSleep(1000)
            --进入打卡提醒界面
            M.enterClockin()
            --进入查看全部
            M.enterList()
            --刷新3秒钟
            mSleep(2000)
        end
        --
        base.moveFast(0, 1, 1)
    end        
end

--
function M.enterClockin()
    --进入每日打卡
    log.logDebug(">>>>进入每日打卡")
    base.touch(0, 70, 440)
    --判断是不是在打卡提醒界面
    local count = 0 
    while count < 20 do 
        log.logDebug(">>>>判断打卡提醒")
        local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_clockin_remind.bmp", 485, 70, 595, 105)
        if bRes == true then
            break
        end
        count = count + 1
        mSleep(500)
    end   
end

--
function M.enterList()
    while true do 
        log.logDebug(">>>>进入列表")
        base.touch(0, 620, 970)
        mSleep(2000)
        local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_error_thumbup.bmp", 230, 770, 500, 850)
        if bRes == true then
            log.logDebug(">>>>错误！")
            base.touch(0, para.ReturnX, para.TopY)
        else
            break
        end
    end   
end

--杀死进程
function M.killApp()
    local count = 0
    while true do 
        log.logDebug(">>进程：判断是否运行")
        if appRunning("com.ishowedu.peiyin")  and count < 20 then 
            count = count + 1
            --判断是不是在每日打卡界面
            log.logDebug(">>进程：判断是否位于打卡进入界面")
            local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_clockin_enter.bmp", 20, 490, 130, 530)
            if bRes == true then
                log.logDebug(">>进程：位于打卡进入界面")
                return 2
            end            
            --
            base.touch(0, para.ReturnX, para.TopY)
            mSleep(2000)
        else
            while true do 
                if appRunning("com.ishowedu.peiyin") then 
                    appKill("com.ishowedu.peiyin")
                    mSleep(2000)
                else
                    mSleep(2000)
                    if appRunning("com.ishowedu.peiyin") then 
                        appKill("com.ishowedu.peiyin")
                    else
                        log.logDebug(">>进程：杀死进程")
                        return 0
                    end
                end
            end
        end
    end
end

--run app
function M.runApp()
    --
    log.logDebug(">>进程：重新开启")
    appRun("com.ishowedu.peiyin")	 
    --判断是不是在每日打卡界面
    while true do
        local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_clockin_enter.bmp", 20, 490, 130, 530)
        if bRes == true then
            log.logDebug(">>进程：进入程序成功")
            return
        end   
    end
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------