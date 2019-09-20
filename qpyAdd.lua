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
M.MSG0 = "对不起同学，管理员信箱爆啦，请大家重新回复一下哈~辛苦啦，爱你[献吻]"

M.MSG1 = "【加群步骤】1.请新同学关注“听说无忧”公众号了解群规，在微信添加朋友处搜索“听说无忧”，然后在公众号中搜索并关注就可以啦[献吻]2.请将名字前加上EEA-，如“EEA-Joooy”[献吻]3.完成以上步骤之后回复“222”。经过管理员确认合格，会在每天的固定时间统一将大家拉入群内，请大家耐心等待。请切记，一定要完成前三个步骤之后才能回复“222”，谢谢[献吻][献吻]"

M.MSG2 = "【加群提醒】对不起同学，在你的关注里列表里没有找到组长的头像，请关注组长，并关注置顶之后再重新回复“222”。谢谢合作[献吻][献吻][献吻]"

M.MSG3 = "【加群提醒】欢迎新同学[献吻]EEA是个友爱的大家庭，每个同学都是学霸，大家都是棒棒哒！小组的荣誉需要大家一起守护[献吻]进群之后请立刻完成10个贡献[献吻]以后每天要记得每天完成10个贡献哦[献吻]切记做完的任务不能删除哦[献吻]"

--[[
M.MSG0 = "谢谢你申请加入EEA-Emma争霸群~你是最棒哒[献吻]我是管理员Aurora很高兴认识你[献吻]因为现在有几千个同学排队申请，所以请同学们一定按照下面的步骤完成入群申请，步骤正确的同学会优先通过，谢谢大家[献吻]时间紧张的同学可以加入EEA交流群，群号：930733。谢谢大家[献吻](任务群周末人满，可能要等到下周数据统计之后才能加新人进来哦，谢谢大家理解[献吻])"
--]]

M.COUNT = 0

M.AGREE = 10

M.ADD = 0
--------------------------------------------------
--------------------------------------------------
--go
function M.go()
    while true do
        local res = M.check()
        if res == 0 then
            break
        else
            --进入事件列表
            base.touch(0, 185, 360)
            --根据情况翻页
            M.PageDown()
        end
    end
end

--check
function M.check()
    --开始循环判断
    while M.COUNT < 2000 do
        --
        if M.AGREE <= 0 then
            break
        end
        --
        while true do
            --判断是否还在事件列表内
            local res = M.findEvent()
            if res == false then
                --判断是否在消息界面
                res = M.findMsg()
                if res == true then
                    return 1
                else
                    --base.touch(0, para.ReturnX, para.TopY)
                    os.execute("input keyevent 4")
                end
            else
                break
            end
        end
        ----
        M.COUNT = M.COUNT + 1
        --
        local strTemp = string.format("%05d-", M.COUNT)
        --初始标记为不同意
        local agree = 0
        --查找页面第一个申请标记
        local x, y = M.findApply()
        if y ~= -1 then
            --点击进入同学主页
            base.touch(0, 70, y)
            --
            M.checkPageZy()
            --判断是否已经进入主页
            local bRes = qpy.isPageZy()
            --进入主页
            if bRes == true then
                --
                strTemp = strTemp.."进入主页"
                --首先给同学点赞
                --M.ThumbUp()
                --进入消息页面
                base.touch(0, para.EditX, para.BottomY)
                --判断是否找到Mark222
                bRes = M.findMark222()
                --找到Mark222
                --bRes = false
                if bRes == true then
                    --到同学主页检查是否已经置顶关注几位管理员
                    --bRes = M.checkFollowAdmin()
                    bRes = true
                    --已关注
                    if bRes == true then
                        --同意
                        agree = 1
                        --
                        if M.ADD ~= 0 then
                            --提醒一定要完成10任务
                            base.sendMessage(M.MSG3)
                            --记录日志
                            --log.logDebugAdd(strTemp.."同意")
                        end
                    --未关注
                    else
                        --提示同学一定要关注置顶
                        --base.sendMessage(M.MSG2)
                        --记录日志
                        --log.logDebugAdd(strTemp.."提醒同学要置顶关注")
                    end   
                --找不到Mark222
                else
                    --判断是否找到Mark
                    bRes = M.findMarkJoin()
                    --没有找到Mark
                    --bRes = false
                    if bRes == false then
                        --发送消息
                        base.sendMessage(M.MSG0)
                        --发送消息
                        base.sendMessage(M.MSG1)
                        --记录日志
                        --log.logDebugAdd(strTemp.."发送消息")
                    --找到Mark
                    else
                        --找到之后等待同学回复
                        --log.logDebugAdd(strTemp.."等待同学回复")
                    end
                end
                --退出消息界面
                --base.touch(0, para.ReturnX, para.TopY)
                os.execute("input keyevent 4")
                --退出同学主页
                --base.touch(0, para.ReturnX, para.TopY)
                os.execute("input keyevent 4")
            --没有进入同学主页
            else
                --回退
                --base.touch(0, para.ReturnX, para.TopY)
                os.execute("input keyevent 4")
            end
            --如果同意
            if agree == 1 then
                --
                if M.ADD ~= 0 then
                    base.touch(0, 210, y+150)
                    --log.logDebugAdd(strTemp.."按下同意按钮")
                    mSleep(10000)
                end
                --
                M.AGREE = M.AGREE - 1
            end
        end
        --]]--向下翻页
        M.moveDown()   
    end
    return 0
end

--find mark 
function M.findMarkJoin()
    return base.findPicCor1(4, para.PATHICON.."icon_mark_join.bmp", 250, 130, 305, 1170)
end

--find mark 
function M.findMark222()
    return base.findPicCor1(4, para.PATHICON.."icon_mark_222.bmp", 135, 130, 190, 1170)
end

--find apply
function M.findApply()
    return base.findPicCor(4, para.PATHICON.."icon_add_apply.bmp", 135, 130, 195, 500)
end

--find msg
function M.findMsg()
    return base.findPicCor1(4, para.PATHICON.."icon_add_msg.bmp", 245, 70, 315, 110)
end

--find event
function M.findEvent()
    return base.findPicCor1(4, para.PATHICON.."icon_add_event.bmp", 275, 70, 340, 105)
end

--thumb up
function M.ThumbUp()
    --判断是否可以进入作品界面
    if M.checkPageZy() == true then
        --进入同学第一个作品
        base.touch(0, para.MidX, 660)
        --判断是否进入作品界面
        local bRes2 = qpy.isPageZp()
        --可以进入
        if bRes2 == true then
            --判断是否可以点赞
            local res = qpy.checkPageZp()
            if res == 0 then
                --点赞
                base.touchFast(640, 520)
            else
                --取消重新点赞
                base.touchFast(640, 520)
                mSleep(1000)
                base.touchFast(640, 520)
            end
            --单击视频左上角
            --base.touch(0, para.ReturnX, para.TopY)
            os.execute("input keyevent 4")
            --退出同学作品界面
            --base.touch(0, para.ReturnX, para.TopY)
            os.execute("input keyevent 4")
        end
    end
end

--
function M.checkFollowAdmin()
    --退出消息界面
    --base.touch(0, para.ReturnX, para.TopY)
    os.execute("input keyevent 4")
    --进入关注列表
    base.touch(0, 150, 200)
    --
    mSleep(2000)
    --返回识图结果
    local bRes = base.findPicCor1(4, "/mnt/sdcard/Pictures/Managers/sm/".."002.bmp", 30, 130, 110, 1170)
    --退出关注列表
    --base.touch(0, para.ReturnX, para.TopY)
    os.execute("input keyevent 4")
    --进入消息界面
    base.touch(0, para.EditX, para.BottomY)
    --
    return bRes 
end

--
function M.checkPageZy()
    --查看配音两个字有没有显示
    local count = 0
    while count < 5 do 
        local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_page_zy.bmp", 75, 520, 140, 560)
        if bRes == true then
            return true
        end
        count = count + 1 
    end   
    return false
end

--move
function M.moveDown()   
    touchDown(0, 715, 800)               
    mSleep(100)                         
    touchMove(0, 715, 500)                
    touchUp(0)     
    mSleep(1000)                           
end

--pagedown
function M.PageDown()
    local count = 0
    while count < M.COUNT do
        M.moveDown()
        count = count + 1
    end
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------