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

M.MSG = "EEA的小伙伴们早上好，感谢大家昨天积极地做任务，希望大家今天能保持势头，学习是一种习惯，优秀是一种品质，今天没有完成十任务的同学还是有可能被踢出的哦，请大家加油[献吻]"

--base.sendMessage("大家下午好！很多同学问怎么加入微信点评群，这里跟大家讲一下哈。首先关注'Emma争霸'微信公众号，然后输入'688'，点击弹出的链接，按照链接里第二步，直接扫管理员微信二维码添加管理员微信，由管理员邀请进入微信点评群！")
                    --base.sendMessage("另外大家记得每天做任务练习口语哦，没有完成10任务的同学会依次被踢出！被踢出的同学可以留在微信点评群，但是英趣群做任务的名额要留给愿意练习的同学哈~")
                    --base.sendMessage("【群发消息不用回复哈】提醒一下大家哈，刚才统计新人数据的时候发现有些同学的实际贡献会被趣配音少统计，解决方法就是多做一个两个任务，比如要求10任务，就做11个或者12个，这样一般至少能保证10个贡献~管理员一般会在11点之后开始统计，请大家务必在11点之前完成任务~早睡早起精神好哈~管理员因为要统计大家的贡献所以睡得晚，这点大家不要跟管理员学习~哈哈~")
                    --base.sendMessage("【群发消息不用回复哈】本周管理员只会精确统计每天新加入的同学的贡献，下周开始管理员会精确统计每个同学每天的贡献数，贡献太少的老同学也会有被踢的可能哦，请大家切记~学习是个坚持的过程，一定不要松懈~共勉~加油~")
                    --base.sendMessage("【群发消息不用回复哈】各位同学下午好~从今天开始管理团队决定晚上11点开始统计同学们的贡献值~原因有两点~第一，凌晨12点趣配音会刷新贡献值，开始统计时间太晚就会来不及统计到所有同学~第二，管理团队希望大家能够养成良好的作息习惯，不要因为做任务而晚睡，希望大家在学习的同时能有一个健康的身体~祝大家新的一周新的心情，好好学习，天天开心~")
                    --base.sendMessage("【群发消息不用回复哈】各位同学周一好~新的一周新的气象~Emma争霸小组感恩你的存在，上周贡献70的同学可以升两级，贡献40的同学可以升级一级，希望大家在新的一周里再接再厉~加油[献吻]")
                    --结束发送消息

--
function M.go()
    logDebug(">>开始发信")
    M.sendAppriciateLetter()
    logDebug(">>结束发信")
end

--send warn letter
function M.sendAppriciateLetter()
    local thisi = 0
    while thisi < 9 do
        local strTemp = string.format(">>>>发信: 第%d页", thisi + 1)
        logDebug(strTemp)
        --
        local curi = 0
        local curj = -1
        --查找"+"图片的位置
        x, y = base.findPicCor(1, para.PATHICON.."iconI.bmp", 0, 
                                                        para.SCREEN_H-2*para.memberGrid_H, 
                                                        para.SCREEN_W,
                                                        para.SCREEN_H)
        if x ~= -1 and y ~= -1 then
            --local strRes = string.format("'+':cor: %d, %d", x, y)
            --notifyMessage(strRes)
            --
            curi, curj = base.findPicLoc(x+20, y+20)
            --strRes = string.format("'+':loc: %d, %d", curi, curj)
            --notifyMessage(strRes)
        else
            logDebug(">>>>发信：未找到加号！")
        end
        mSleep(1000)
        --
        bEnd = M.sendAppriciateLetterPage(6, curi, curj)
        if bEnd == true then
            break
        end
        --
        --向上翻一页
        -------------------
        -------------------
        base.moveUp(0, para.MidX, 600, 1200)
        base.moveUp(0, para.MidX, 600, 1200)
        -------------------
        -------------------
        thisi = thisi + 1
    end
end

--
function M.sendAppriciateLetterPage(numb, curi, curj)
    local bMark1 = false
    local bMark2 = false
    --
    local count = 0
    local i = curi
    while i < numb do
        local j = 0 
        if count == 0 then
            j = curj + 1
            if j > 3 then
                j = 0
                i = i + 1
            end
        end
        while j < 4 do
            --
            local curxx = para.SCREEN_W - j*para.memberGrid_W
            local curyy = para.SCREEN_H - i*para.memberGrid_H
            --
            count = count + 1
            local strTemp = string.format(">>>>发信: %03d", count)
            logDebug(strTemp)
            --进入同学主页
            base.touch(0, curxx-50, curyy-50)
            mSleep(1000)
            --检查是否真的进入到主页
            local bRes = qpy.isPageZy()
            if bRes == true then
                --判断是不是林西燕
                bMark1 = base.checkMem3("/mnt/sdcard/Pictures/WhiteList/id/".."005.bmp")
                bMark2 = base.checkMem3("/mnt/sdcard/Pictures/WhiteList/id/".."004.bmp")
                if bMark1 == false and bMark2 == false then
                    --给同学第一个作品点赞
                    base.touch(0, para.MidX, 650)
                    base.touch(0, 640, 520)
                    --退出同学作品界面
                    base.touch(0, para.ReturnX, para.TopY)
                    base.touch(0, para.ReturnX, para.TopY)
                    --进入发送消息界面
                    --]]
                    base.touch(0, para.EditX, para.BottomY)
                    --开始发送消息
                    base.sendMessage(M.MSG)
                    --退出消息界面
                    base.touch(0, para.ReturnX, para.TopY)
                else
                    return true
                end
                --退出同学主页
                base.touch(0, para.ReturnX, para.TopY)
            end
            j = j + 1
        end
        --
        if bMark1 == true or bMark2 == true then
            return true
        end
        i = i + 1
        --strRes = string.format("i:%d", i)
        --notifyMessage(strRes)
    end
    if bMark1 == true or bMark2 == true then
        return true
    end
    
    return false
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------