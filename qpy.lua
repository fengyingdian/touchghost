--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------
require "para"
require "base"
require "log"
--------------------------------------------------
--------------------------------------------------

M.ColorThumbUpBefore = 0xbebebe --点赞前的颜色
M.ColorThumbUpAfter  = 0x0bbe06 --点赞后的颜色

--
function M.isPageGx()
    local bRes = base.findPicCor1(2, "/mnt/sdcard/Pictures/picIcon/".."icon_gx_location.bmp", 640, 50, 710, 120)
    return bRes
end

--
function M.isPageZy()
    local bRes = base.findPicCor1(2, "/mnt/sdcard/Pictures/picIcon/".."icon_zy_location.bmp", 170, 420, 550, 470)
    return bRes
end

--
function M.isPageZp()
    local bRes = base.findPicCor1(2, "/mnt/sdcard/Pictures/picIcon/".."icon_zp_location.bmp", 290, 1210, 430, 1260)
    return bRes
end

--
function M.isPageZgx()
    local bRes = base.findPicCor1(2, "/mnt/sdcard/Pictures/picIcon/".."icon_zgx_location.bmp", 260, 60, 410, 110)
    return bRes
end

--
function M.isPageZl()
    local bRes = base.findPicCor1(2, "/mnt/sdcard/Pictures/picIcon/".."icon_zl_location.bmp", 250, 60, 440, 120)
    return bRes
end

--
function M.isPageMem()
    local bRes = base.findPicCor1(2, "/mnt/sdcard/Pictures/picIcon/".."icon_mem_location.bmp", 240, 60, 400, 120)
    return bRes
end

--
function M.isPageJrydk()
    local bRes = base.findPicCor1(2, "/mnt/sdcard/Pictures/picIcon/".."icon_jrydk_location.bmp", 260, 50, 460, 130)
    return bRes
end

--
function M.checkPageZy()
    --查看配音两个字有没有显示
    local count = 0
    while count < 20 do 
        local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_page_zy.bmp", 75, 520, 140, 560)
        if bRes == true then
            return true
        end
        count = count + 1 
    end   
    return false
end

--
function M.checkPageZp()
    local count = 0
    while count < 20 do 
        color = getColor(645, 515)
        if color == qpy.ColorThumbUpAfter then
            return 1
        elseif color == qpy.ColorThumbUpBefore then
            return 0
        end
        count = count + 1 
        mSleep(500)
    end  
    return -1
end

--get into memberlist page
function M.getIntoMemList()
    if appRunning("com.ishowedu.peiyin") then
        appKill("com.ishowedu.peiyin")
        mSleep(1000)
    end
    --运行程序
    M.runApp()
    --进入消息栏
    base.touch(0, X3, para.BottomY)
    --进入Emma小组
    base.touch(0, para.MidX, para.EmmaY)
    --进入小组资料
    base.touch(0, para.EditX, para.TopY)
    --向下翻页到底
    base.moveFast(0, 1, 1)
    --进入小组成员列表
    base.touch(0, para.MidX, para.Y3)
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --向上翻页
    base.moveUp(0, para.MidX, 600, 1000)
    --向下翻页
    base.moveDown(0, para.MidX, 1000, 600)
end

--杀死进程
function M.killApp()
    while true do 
        log.logDebug(">>进程：判断是否在运行")
        if appRunning("com.ishowedu.peiyin") then 
            log.logDebug(">>进程：杀死正在运行的")
            appKill("com.ishowedu.peiyin")
            mSleep(2000)
        else
            return true
        end
    end
end

--run app
function M.runApp()
    --如果app在运行先杀死进程
    --虽然简单粗暴一点但是确定程序当前运行的页面
    M.killApp()
    --APP入口
    log.logDebug(">>进程：重新开启")
    appRun("com.ishowedu.peiyin")	 
    mSleep(15000)
end

--
function M.moveFromMemToContri()
    --进入小组资料界面
    base.touch(0, para.ReturnX, para.TopY)
    --进入Emma争霸群
    base.touch(0, para.ReturnX, para.TopY)
    --进入贡献榜
    base.touch(0, para.EditX, para.Y1)    
    --向下翻页到底
    --base.moveFast(0, 1, 10)
    --向上翻页到顶
    --base.moveFast2(0, 1)
end

--
function M.moveFromContriToMem()
    --进入小组资料
    base.touch(0, para.EditX, para.TopY)
    --向下翻页到底
    base.moveFast(0, 1, 1)
    --进入小组成员列表
    base.touch(0, para.MidX, para.Y3)
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --向上翻页
    base.moveUp(0, para.MidX, 600, 1000)
    --向下翻页
    base.moveDown(0, para.MidX, 1000, 600)
end

--
function M.moveFromMemToZgx()
    --进入小组资料界面
    base.touch(0, para.ReturnX, para.TopY)
    --进入Emma争霸群
    base.touch(0, para.ReturnX, para.TopY)
    --进入贡献榜
    base.touch(0, para.EditX, para.Y1)    
    --向上翻页到顶
    base.moveFast2(0, 2)
    --进入周贡献榜
    base.touch(0, para.EditX, para.Y2) 

end

--
function M.checkThumbUp()
    local bRes = false
    if getColor(645, 515) == M.ColorThumbUpAfter then
        bRes = true
    end
    return bRes
end
--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------