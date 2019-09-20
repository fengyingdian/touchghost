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

MSG1 = "【加群步骤】1.请新同学关注“Emma争霸”公众号了解群规。2.关注本群前三位管理员Mandan，Joooy，Emma，并将对他们关注置顶，切记一定要置顶哦。完成以上两个步骤之后，回复“222”。经过管理员确认合格，就可以快速邀请入群。请切记，一定要完成以上两个步骤之后才能回复“222”，谢谢合作[献吻][献吻][献吻]"

MSG2 = "【加群提醒】对不起同学，在你的关注里列表里没有找到三位管理员的头像，请关注三位管理员Mandan，Joooy，Emma，并将对他们关注置顶之后再重新回复“222”。谢谢合作[献吻][献吻][献吻]"

--------------------------------------------------
--------------------------------------------------
--go
function M.go()
    M.check()
end

--check
function M.check()
    --位于待处理事项
    local count = 0
    --开始循环判断
    while count < 10000 do
        --初始标记为不同意
        local agree = 0
        --查找页面第一个申请标记
        local x, y = M.findApply()
        --点击进入同学主页
        base.touch(0, 70, y)
        --判断是否已经进入主页
        local bRes = qpy.isPageZy()     
        --进入主页
        if bRes == true then
            --进入消息页面
            base.touch(0, para.EditX, para.BottomY)
            --判断是否找到Mark222
            bRes = M.findMark222()
            --找到Mark222
            if bRes == true then
                --到同学主页检查是否已经置顶关注几位管理员
                bRes = M.checkFollowAdmin()
                --已关注
                if bRes == true then
                    --同意
                    agree = 1
                --未关注
                else
                    --提示同学一定要关注置顶
                    base.sendMessage(MSG2)
                end   
            --找不到Mark222
            else
                --判断是否找到Mark
                bRes = M.findMarkJoin()
                --没有找到Mark
                if bRes == false then
                    --发送消息
                    base.sendMessage(MSG1)
                --找到Mark
                else
                    --找到之后等待同学回复
                end
            end
            --退出消息界面
            base.touch(0, para.ReturnX, para.TopY)
        end
        --退出同学主页
        base.touch(0, para.ReturnX, para.TopY)
        --如果同意
        if agree == 1
            base.touch(0, 210, y+150)
        --计数
        count = count + 1
        --向下翻页
        base.moveDown3(0, para.MidX, 800, 600)   
    end
end

--find mark 
function M.findMarkJoin()
    return base.findPicCor1(4, para.PATHICON.."icon_mark_join"..".bmp", 250, 130, 305, 1170)
end

--find mark 
function M.findMark222()
    return base.findPicCor1(4, para.PATHICON.."icon_end"..".bmp", 135, 130, 190, 1170)
end

--find apply
function M.findApply()
    return base.findPicCor(4, para.PATHICON.."icon_add_apply.bmp", 135, 130, 195, 500)
end

--
function M.checkFollowAdmin()
    --退出消息界面
    base.touch(0, para.ReturnX, para.TopY)
    --进入关注列表
    base.touch(0, 150, 200)
    --返回识图结果
    return base.findPicCor1(4, "/mnt/sdcard/Pictures/Managers/sm".."001.bmp", 30, 130, 110, 1170)
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------