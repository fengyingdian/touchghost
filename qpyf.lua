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
--------------------------------------------------
--------------------------------------------------
NOTE1 = "打卡点评纠音1\n"
.."️纠音：别让错误的发音毁了你的形象。"
.."有不少英语学习者，单词和语法学的已经很好了，但是当他们用英语与别人交流时，还是存在沟通障碍，"
.."问题就出在了发音上，发音不标准导致对方误解，闹出很多笑话。(详情请加race_joy微信咨询)"

NOTE2 = "打卡点评纠音2\n"
.."自己的发音错误自己是很难辨别的！"
.."️想要进步最好的办法是有人指点。"
.."目前教授点评都在微信点评群。人数已满你可以先加预备群。只要打卡就可以获得教授点评。(详情请加race_joy微信咨询)"

NOTE3 = "打卡点评纠音3\n"
.."自己的发音错误自己是很难辨别的！"
.."️想要进步最好的办法是有人指点。"
.."打卡第一步，分享Emma公众号到朋友圈，截图。第二步，分享自己的趣配音或晨读求点评。第三步，艾特值班老师和班长报打卡序号(详情请加race_joy微信咨询)"
--------------------------------------------------
--------------------------------------------------

--
function M.go()
    logDebug(">>每日一句开始")
    M.sendTask()
    logDebug(">>每日一句结束")
end

--
function M.sendTask()
    --[判断时间是不是过了零点
    while true do 
        local nHour = base.getHour()
        if nHour >= 0 and nHour < 12 then
            break
        end
        --暂停1分钟
        mSleep(1000)
    end
    --]]
    --
    local day = base.getDay()
    local page = 9*day

    --[[小鹦鹉
    M.sendOneTask_Xiaoyingwu()
    --每日一句
    M.sendOneTask_Meiriyiju()
    --每日推荐
    M.sendOneTask_Jinrituijian()
    
    --]]--每日一句
    M.sendOneTask("需要点评纠音的同学请添加公众号：Emma争霸，或添加微信：race_joy，加入晨读纠音班级。", page)
    M.sendOneTask("需要点评纠音的同学请添加公众号：Emma争霸，或添加微信：race_joy，加入晨读纠音班级。", page + 3)
    M.sendOneTask("需要点评纠音的同学请添加公众号：Emma争霸，或添加微信：race_joy，加入晨读纠音班级。", page + 6)
    --]]--
end

--
function M.sendOneTask(strContent, page)
    --进入任务
    base.touch(0, 360, 170)
    --进入发任务界面
    base.touch(0, 360, 1230)
    --暂停10秒
    mSleep(3000)
    --进入每日一句
    base.touch(0, 80, 1080)
    ----查找标记位
    while true do
        local bRes = base.findPicCor1(4, "/mnt/sdcard/Pictures/picIcon/".."icon_filter.bmp", 
                                      360, 50, 720, 130) 
        if bRes == false then
            --退出重新发布
            base.touch(0, para.EditX, para.TopY)
            --进入每日一句
            base.touch(0, 80, 1080)
        else
            break
        end     
    end      
    --翻页到最后
    M.moveToTheEnd()
    --向上翻页
    M.movePage(page)                      
    --]]--循环发任务
    local nCount = 0
    --
    while true do
        --查找标记位
        local x, y = base.findPicCor2(3, "/mnt/sdcard/Pictures/picIcon/".."icon_ODOS.bmp")
        --找到标记位
        if x ~= -1 and y ~= -1 then
            for i = 0, 4 do
                strTemp = string.format("  >>%d(%d): %d, %d", nCount, i, 0, y+i*287)
                logDebug(strTemp)
                notifyMessage(strTemp)
                --第一列
                nCount = M.select(0, y+i*287, nCount)
                --
                if nCount >= 6 then
                    break
                end
                strTemp = string.format("  >>%d(%d): %d, %d", nCount, i, 362, y+i*287)
                logDebug(strTemp)
                notifyMessage(strTemp)
                --第二列
                nCount = M.select(362, y+i*287, nCount)
                --
                if nCount >= 6 then
                    break
                end
            end
        end
        --
        if nCount >= 6 then
            break
        end
        --向上翻页
        M.movePage(1)   
        --
        mSleep(3000)
    end
    --发布
    base.touch(0, 360, 1240)
    --
    M.sendMessage(strContent)
    --确定
    base.touch(0, 660, 1240)
    --
    mSleep(3000)
end

--小鹦鹉
function M.sendOneTask_Xiaoyingwu()
    --进入任务
    base.touch(0, 360, 170)
    --进入发任务界面
    base.touch(0, 360, 1230)
    --暂停10秒
    mSleep(3000)
    --进入收藏
    base.touch(0, 350, 300)
    --进入小鹦鹉
    base.touch(0, 350, 350)
    --
    mSleep(3000)
    --1
    base.touch(0, 40, 570)
    --2
    base.touch(0, 400, 570)
    --3
    base.touch(0, 40, 860)
    --4
    base.touch(0, 400, 860)
    --5
    base.touch(0, 40, 1140)
    --6
    base.touch(0, 400, 1140)
    --发布
    base.touch(0, 360, 1240)
    --
    M.sendMessage("小鹦鹉，一个顶俩，给时间紧张的小伙伴")
    --确定
    base.touch(0, 660, 1240)
    --
    mSleep(3000)
end

--每日一句
function M.sendOneTask_Meiriyiju()
    --进入任务
    base.touch(0, 360, 170)
    --进入发任务界面
    base.touch(0, 360, 1230)
    --暂停10秒
    mSleep(3000)
    --进入每日一句
    base.touch(0, 350, 1080)
    --
    mSleep(3000)
    --1
    base.touch(0, 40, 250)
    --2
    base.touch(0, 400, 250)
    --3
    base.touch(0, 40, 530)
    --4
    base.touch(0, 400, 530)
    --5
    base.touch(0, 40, 820)
    --6
    base.touch(0, 400, 820)
    --下一步
    base.touch(0, 350, 1240)
    --标题
    M.sendMessage("每日一句")
    --确定
    base.touch(0, 660, 1240)
    --
    mSleep(3000)
end

--每日推荐
function M.sendOneTask_Jinrituijian()
    --进入任务
    base.touch(0, 360, 170)
    --进入发任务界面
    base.touch(0, 360, 1230)
    --暂停10秒
    mSleep(3000)
    --进入每日推荐
    base.touch(0, 350, 630)
    --
    mSleep(3000)
    --1
    base.touch(0, 40, 250)
    --2
    base.touch(0, 400, 250)
    --3
    base.touch(0, 40, 530)
    --4
    base.touch(0, 400, 530)
    --5
    base.touch(0, 40, 820)
    --6
    base.touch(0, 400, 820)
    --下一步
    base.touch(0, 350, 1240)
    --标题
    M.sendMessage("每日推荐")
    --确定
    base.touch(0, 660, 1240)
    --
    mSleep(3000)
end

--
function M.select(x, y, count)
    --
    local yy = y - 165
    --判断是否被遮住
    if yy < 225 or yy > 1180 then
        return count
    end
    
    --查找标记位
    local bRes = base.findPicCor1(4, "/mnt/sdcard/Pictures/picIcon/".."icon_select.bmp", 
                                  x-10, yy - 40, x+80, yy + 40) 
    if bRes == false then
        --选择
        base.touch(0, x + 40, yy)
        --验证
        bRes = base.findPicCor1(4, "/mnt/sdcard/Pictures/picIcon/".."icon_select.bmp", 
                              x-10, yy - 40, x+80, yy + 40) 
        if bRes == true then
            count = count + 1    
        end
    end
    return count 
end  

--
function M.sendMessage(strContent)
   --复制消息
    copyText(strContent)
    --准备发送消息
    touchDown(0, para.MidX, 900)
    mSleep(1000)
    touchUp(0)
    mSleep(500)
    --点击粘贴
    touchDown(0, 65, 845)
    touchUp(0)
    mSleep(500)
end

--move
function M.moveDown(Id, x, y1, y2)   
    touchDown(Id, x, y1)                    --ID为0的手指在坐标为(x, y1)的点按下
    mSleep(1000)
    while y1 > y2 do 
        mSleep(30)                          --延时50毫秒
        y1 = y1 - 30
        touchMove(Id, x, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
    end     
    touchUp(Id)                             --ID为0的手指抬起
    mSleep(1000)                            --延时2000毫秒
end

--
function M.moveToTheEnd()
    logDebug("  >>向下翻页：开始")
    local i = 0
    local strTemp = string.format("  >>%d", i)
    while i < 1000 do
        local bRes = base.findPicCor1(2,"/mnt/sdcard/Pictures/picIcon/icon_end_odos.bmp", 250, 1100, 460, 1200)
        if bRes == true then
            logDebug(strTemp)
            logDebug("  >>向下翻页：结束（找到结束位）")
            return 
        end
        i = i + 1
        strTemp = strTemp..string.format("-%d", i)
        M.moveDown(0, 715, 1000, 400)
    end
    logDebug(strTemp)
    logDebug("  >>向下翻页：结束（未找到结束位）")
end

--
function M.moveToTheEnd2()
    logDebug("  >>向下翻页：开始")
    local i = 0
    local strTemp = string.format("  >>%d", i)
    while i < 30 do
        local bRes = base.findPicCor1(2,"/mnt/sdcard/Pictures/picIcon/icon_end_odos.bmp", 250, 1100, 460, 1200)
        if bRes == true then
            logDebug(strTemp)
            logDebug("  >>向下翻页：结束（找到结束位）")
            return 
        end
        i = i + 1
        strTemp = strTemp..string.format("-%d", i)
        base.moveFast(0, 1, 10)
    end
    logDebug(strTemp)
    logDebug("  >>向下翻页：结束（未找到结束位）")
end

--根据当前页的属性实验得出的数据，对其他页不适用
function M.movePage(page)
    logDebug("  >>向上翻页：开始")
    local i = 0
    local strTemp = string.format("  >>%d", i)
    while i < page do 
        touchDown(0, 715, 400)                
        mSleep(23)                           
        touchMove(0, 715, 478)               
        touchUp(0)                           
        mSleep(1000)   
        i = i + 1
        strTemp = strTemp..string.format("-%d", i)
    end
    logDebug(strTemp)
    logDebug("  >>向上翻页：结束")
end
--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------