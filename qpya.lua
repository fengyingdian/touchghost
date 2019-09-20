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

M.MSG = "亲爱的EEA小伙伴你好~欢迎你加入我们这个友爱的大家庭~不过这个群是个任务群哦，每天都要做10贡献的，如果没时间做贡献可以暂时先加入微信群，让Joooy拉你进微信群好不好？[献吻]然后等有时间再回任务群做任务哈，辛苦啦[献吻]Joooy的微信号：race_joy，或者加公众号：Emma争霸，也可以哈[献吻]今天不做贡献的宝宝，今天晚上11点开始准时依次抱走咯[献吻]"

M.MSG1 = "各位同学早上好[献吻]新的一周新的气象，周一的小组排名很重要哦，所以请大家一定要加油，为了小组的荣誉，大家一起努力吧[献吻]学习过程中有任何困难或者疑问都可以联系Joooy谢谢大家，加油哈[献吻](管理员私信箱已爆，只能通过微信回复啦)"

M.MSG2 = "今天还没有做任务的同学要加油咯[献吻]目前排名在第二位，无论如何都需要各位同学再努力一下啦[献吻]"

M.MSG3 = "EEA的小伙伴们，昨天没有完成任务的同学今天要加油咯，根据排名会依次踢人哒，如果没时间做任务可以暂时先加入微信群，让Joooy拉你进微信群好不好？[献吻]然后等有时间再回任务群做任务哈，辛苦啦[献吻]Joooy的微信号：race_joy，或者加公众号：Emma争霸，也可以哈[献吻]"

M.MSG4 = "对不起大家，前段时间比较忙，没有发其他类型的任务，以后会增加音乐，动漫和每日推荐。希望大家再接再厉，我们一起努力[献吻]"

M.MSG5 = "大家早上好[献吻]以后的任务都会在凌晨12点就会发布，有时差的小伙伴可以选择早点儿配音，我会在发布任务之后跟大家一起做10个任务[献吻]管理员趣配音的私信因为太多已经显示不了了，大家有什么建议和意见请直接微信联系我，微信号：fengyingdian。一起加油[献吻]"

M.MSG6 = "小可爱们要加油做任务啦~我们EEA的小伙伴最棒啦[献吻]记得十个任务做完之后不能删除哦[献吻]"

M.MSG7 = "大家早上好，现在每天的任务包括BBC，VOA，歌曲，动漫，小鹦鹉等满足各种年龄，各种程度同学的需求~优秀是一种习惯，学习靠的是坚持，大家加油做任务哈[献吻]"

M.MSG8 = "早起的鸟儿有虫吃~亲爱的EEA小伙伴，我的任务完成啦~期待你的，加油[献吻]"

M.MSG9 = "亲爱的EEA小伙伴，本周做满70任务的同学发任务截图给Joooy，Joooy会跟你互粉哦~另外这周后面加入的,本周每天都做满任务并且下周贡献70的同学Joooy也会跟你互粉哦[献吻]"

M.MSG10 = "对不起任务发重啦~是我的错~刚刚重新发了，有时间的小伙伴做一下今天的任务哈~加油[献吻]"

M.MSG11 = "感谢小伙伴们的努力，我们又重回第一啦~但是第二名的小组又在号召做空任务想要超过EEA，大家再加油努力三天把他们甩的远远的哈[献吻]"


M.MSG12 = "同学们，周一的排名很重要，请大家今天一定要完成10个贡献，大家可以根据自己的时间调节，时间多的同学可以配长作品，时间少的同学可以配小鹦鹉，5个小鹦鹉就有10个贡献[献吻]"

M.MSG13 = "嗨，亲爱的小伙伴，如果过年期间比较忙，没有时间做任务，可以暂时先退出本群回到微信群大本营哦[献吻]让Joooy拉你进微信群好不好？[献吻]然后等有时间再回任务群做任务哈，辛苦啦[献吻]Joooy的微信号：race_joy，或者加公众号：Emma争霸，也可以哈[献吻]如果已经完成任务请忽略这条消息哈[献吻]"

M.MSG14 = "亲爱的小伙伴们，春节就要到啦，祝大家新春吉祥，万事如意，身体健康[献吻]今天的任务已经发啦~大家可以根据自己的时间调节，时间多的同学可以配长作品，时间少的同学可以配小鹦鹉，5个小鹦鹉就有10个贡献[献吻]学习过程中有任何困难或者疑问都可以联系Joooy（微信：race_joy）和我（微信：fengyingdian）谢谢大家，加油哈[献吻]"

M.MSG15 = "亲爱的小伙伴们，周一的排名很重要，为了自己的学习，也为了小组的荣誉，请大家今天晚上十一点前一定要完成10个贡献！加油[献吻]"

M.MSG16 = "亲爱的小伙伴们，今天还是会继续踢人哦，为了自己的学习，也为了小组的荣誉，请大家每天晚上十一点前一定要完成10个贡献！加油[献吻]"

M.MSG17 = "除夕快乐[献吻][献吻][献吻]学习也要快乐哦[献吻][献吻][献吻]今天给大家准备了新年特辑，希望大家能喜欢[献吻][献吻][献吻]"

M.MSG18 = "新年快乐[献吻][献吻][献吻]新年第一天一定要养成好习惯并一直保持下去，一年之后一定会有非常大的收获[献吻][献吻][献吻] 今天给大家准备了新年特辑，希望大家能喜欢[献吻][献吻][献吻]"

M.MSG19 = "新年快乐[献吻][献吻][献吻]EEA精神的代表永远是大家，是可爱的你，是过年都不忘学习的你们[献吻][献吻][献吻]"

M.MSG20 = "亲爱的小伙伴，今天还没有打卡做任务哦，一定要每天完成十个贡献，一周内不能删除哦，加油咯[献吻][献吻][献吻]"

M.MSG21 = "亲爱的小伙伴们，今天是本周最后一天，大家再接再厉把第二名甩的远远的吧~一定要每天完成十个贡献，一周内不能删除哦~学霸们加油[献吻]"

M.MSG22 = "嗨，亲爱的小伙伴们，大家早上好，今天这条消息不是来催大家做任务的，是想请大家认真思考一下自己加入Emma争霸群到底是为了什么~如果是为了学习，请大家对自己负责，每天按时做任务[献吻]如果是为了EEA的名气而来，大家只要在名字前面加上“EEA-”就好了，别的同学自然就知道你是EEA的，不需要待在任务群的[献吻]今天我已经完成10个贡献了，学霸们加油[献吻]学习过程中有任何困难或者疑问都可以联系Joooy（微信：race_joy）和我（微信：fengyingdian）谢谢大家，加油[献吻]"

M.MSG23 = "亲爱的小伙伴们，昨天有一些小伙伴没有坚持打卡学习哈，等会儿10点左右可能要把没有贡献的小伙伴抱走啦（已完成任务的学霸们请忽略哈）[献吻]如果没时间做贡献可以暂时先加入微信群，让Joooy拉你进微信群好不好？[献吻]然后等有时间再回任务群做任务哈，辛苦啦[献吻]Joooy的微信号：race_joy，或者加公众号：Emma争霸，也可以哈[献吻]今天不做贡献的宝宝，今天晚上11点开始准时依次抱走咯[献吻]"

M.MSG24 = "亲爱的小伙伴，我已完成30贡献，等你咯（已完成任务的学霸们请忽略哈）[献吻]有些小伙伴一天只做一两个作品也是不行的哦，学习需要自发的动力，如果只是为了留在群里而敷衍了事是不行哒[献吻]除了教授和小组技术负责人（他们本身每天都会对小组做出其他的贡献），所有同学都要每天完成十个贡献，一周之内不能删除哦[献吻]"

M.MSG25 = "亲爱的小伙伴，我已完成40贡献，等你咯（已完成任务的学霸们请忽略哈）[献吻]针对部分小伙伴提出的聊天需求，请大家添加Joooy微信：race_joy，请Joooy姐姐拉你们进微信群，在那里大家可以畅所欲言，谢谢大家[献吻]"

M.MSG26 = 
"亲爱的小伙伴，我已完成今天的任务，等你咯（已完成任务的学霸们请忽略哈）[献吻]因为还有几千个小伙伴在排队等待，所以今天没有完成任务的小伙伴可能要被抱走咯[献吻]不过没关系，大家没有时间做任务可以加EEA交流群哈，群号：930733。谢谢大家[献吻]（有小伙伴反应私信我没有回复，是哒，因为我的趣配音信箱信息太多爆炸啦，只能发消息，要看谁的消息必须进入谁的主页才行，所以如果大家有疑问请加我微信：fengyingdian。谢谢大家的理解[献吻]）"

M.MSG27 = 
"亲爱的小伙伴，发完这条消息没有完成贡献的小伙伴要被依次抱走啦（完成贡献的学霸请忽略哈）[献吻]不过没关系，大家没有时间做任务可以加EEA交流群哈，群号：930733。谢谢大家[献吻]（有小伙伴反应私信我没有回复，是哒，因为我的趣配音信箱信息太多爆炸啦，只能发消息，要看谁的消息必须进入谁的主页才行，所以如果大家有疑问请加我微信：fengyingdian。谢谢大家的理解[献吻]）"

M.MSG28 = 
"亲爱的小伙伴，今天趣配音服务器故障，所以早上很多小伙伴看不到已经发布的任务，现在已经没有问题了，这里给大家真诚地道个歉！（有小伙伴反应私信我没有回复，是哒，因为我的趣配音信箱信息太多爆炸啦，只能发消息，要看谁的消息必须进入谁的主页才行，所以如果大家有疑问请加我微信：fengyingdian。谢谢大家的理解[献吻]）"

M.MSG29 = 
"亲爱的小伙伴，又到周一啦，坚持就是胜利[献吻]（有小伙伴反应私信我没有回复，是哒，因为我的趣配音信箱信息太多爆炸啦，只能发消息，要看谁的消息必须进入谁的主页才行，所以如果大家有疑问请加Joooy微信。谢谢大家的理解[献吻]）"

M.MSG30 = 
"嗨，今天要加油咯，晚上会有新的小伙伴进来，所以咱们要努力配音给新来的小伙伴做榜样哦[献吻]（有小伙伴反应私信我没有回复，是哒，因为我的趣配音信箱信息太多爆炸啦，只能发消息，要看谁的消息必须进入谁的主页才行，所以如果大家有疑问请加我微信：fengyingdian。谢谢大家的理解[献吻]）"

M.MSG31 = 
"嗨，学霸们加油啦~今天要加新人啦~"

M.MSG32 = 
"小可爱们加油啦~今天要加新人咯~有任何问题微信Joooy哈，微信号群通知里有哈~"

M.SENDLETTER = 1
--------------------------------------------------
--------------------------------------------------
--
function M.go()
    --处理周贡献
    M.dealWithMem()
end

--
function M.sendWarnMessage()
    if M.SENDLETTER == 1 then 
        --点击发送消息
        base.touch(0, para.EditX, para.BottomY)
        --开始发送消息
        base.sendMessage(M.MSG32)
        --结束发送消息
        --退出消息界面
        base.touch(0, para.ReturnX, para.TopY)   
    end
end

--[[--
function M.dealWithMem()
    --
    base.rmFile("/mnt/sdcard/Pictures/picRemoveZgx/id/")
    base.rmFile("/mnt/sdcard/Pictures/picRemoveZgx/md/")
    base.rmFile("/mnt/sdcard/Pictures/picRemoveZgx/sm/")
    base.rmFile("/mnt/sdcard/Pictures/picRemoveZgx/fu/")
    base.rmFile("/mnt/sdcard/Pictures/picRemoveZgx/ss/")
    --
    local wday = base.getWday()
    if wday == 1 or wday == 2 then
        M.dealWithMem2()
    elseif wday == 3 then
        M.dealWithMem3()
    elseif wday == 4 then
        M.dealWithMem4()
    elseif wday == 5 then
        M.dealWithMem5()
    elseif wday == 6 then
        M.dealWithMem6()
    elseif wday == 0 then
        M.dealWithMem7()
    end
end

--]]--
function M.dealWithMem()
    --向下翻页到底
    --base.moveFast(0, 1, 3)
    --
    --local files, numb = base.getFileName("/mnt/sdcard/Pictures/WhiteList/id/")
    --
    local strZgx    = "/mnt/sdcard/Pictures/picIcon/icon_zgx.bmp"
    local strZgx_10 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_10.bmp"
    local strPath   = "/mnt/sdcard/Pictures/picRemoveZgx/"
    
    --清空"/mnt/sdcard/Pictures/strDir/"目录
    --base.rmFile(strPath.."id/")
    --base.rmFile(strPath.."fu/")
    --base.rmFile(strPath.."md/")
    --base.rmFile(strPath.."sm/")
    --
    local nZgxMark = 0 
    local nCount   = 0 
    local nLimit   = 195
    --
    while true do 
        --
        if nCount >= nLimit then
            break
        end
        --
        local i = 0
        while i < 7 do 
            --查找标记位
            local x, y = base.findPicCor(2, strZgx, 530, 
                                                  para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                  710, 
                                                  para.SCREEN_H-i*para.memberGrid_H)
            --找到
            if x ~= -1 and y ~= -1 then
                --进入同学首页
                base.touch(0, x - 425, y + 40)
                --判断是否已经进入主页
                local bRes = qpy.isPageZy()
                --
                if bRes == true then
                    --判断是不是在白名单
                    --bRes = base.checkMem(files, numb,"/mnt/sdcard/Pictures/WhiteList/")
                    bRes = false
                    --点赞
                    --M.ThumbUp()
                    --
                    if bRes == false then
                        --
                        nCount = nCount + 1
                        --保存同学数据
                        --base.getMemInfo(nCount, strPath)
                        --发出劝退信
                        M.sendWarnMessage()
                    end
                    --退出同学首页
                    base.touch(0, para.ReturnX, para.TopY)
                end
            end 
            
            --查找贡献是不是满足10
            local bRes = base.findPicCor1(2, strZgx_10, 530, 
                                             para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                             710, 
                                             para.SCREEN_H-i*para.memberGrid_H)
            --
            if bRes == true then
                nZgxMark = 10
                break
            end
            
            --
            i = i + 1
        end
        
        --
        if nZgxMark == 10 then
            break
        end
        
        --
        base.moveUp(0, 715, 400, 1200)
        base.moveUp(0, 715, 600, 1200)
    end
end

--thumb up
function M.ThumbUp()
    --判断是否可以进入作品界面
    if M.checkPageZy() == true then
        --进入同学第一个作品
        base.touch(0, para.MidX, 620)
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
            base.touch(0, para.ReturnX, para.TopY)
            --退出同学作品界面
            base.touch(0, para.ReturnX, para.TopY)
        end
    end
end

--
function M.checkPageZy()
    --查看配音两个字有没有显示
    local count = 0
    while count < 100 do 
        local bRes = base.findPicCor1(3, "/mnt/sdcard/Pictures/picIcon/icon_page_zy.bmp", 75, 520, 140, 560)
        if bRes == true then
            return true
        end
        count = count + 1 
    end   
    return false
end

--
function M.dealWithMem2()
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/WhiteList/id/")
    --
    local strZgx    = "/mnt/sdcard/Pictures/picIcon/icon_zgx.bmp"
    local strZgx_10 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_10.bmp"
    local strPath   = "/mnt/sdcard/Pictures/picRemoveZgx/"
    --
    local nZgxMark = 0 
    local nCount   = 0 
    local nLimit   = 20
    --
    while true do 
        --
        if nCount >= nLimit then
            break
        end
        --
        local i = 0
        while i < 7 do 
            --查找贡献是不是满足10
            local bRes = base.findPicCor1(2, strZgx_10, 530, 
                                             para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                             710, 
                                             para.SCREEN_H-i*para.memberGrid_H)
            --
            if bRes == true then
                nZgxMark = 10
                break
            end
            --查找标记位
            local x, y = base.findPicCor(2, strZgx, 530, 
                                                  para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                  710, 
                                                  para.SCREEN_H-i*para.memberGrid_H)
            --找到
            if x ~= -1 and y ~= -1 then
                --进入同学首页
                base.touch(0, x - 425, y + 40)
                --判断是否已经进入主页
                bRes = qpy.isPageZy()
                if bRes == true then
                    --判断是不是在白名单
                    bRes = base.checkMem(files, numb,"/mnt/sdcard/Pictures/WhiteList/")
                    if bRes == false then
                        nCount = nCount + 1
                        --保存同学数据
                        base.getMemInfo(nCount, strPath)
                        --发出劝退信
                        M.sendWarnMessage()
                    end
                    --退出同学首页
                    base.touch(0, para.ReturnX, para.TopY)
                end
            end 
            i = i + 1
        end
        --
        base.moveUp(0, 715, 400, 1200)
        base.moveUp(0, 715, 600, 1200)
    end
end

--
function M.dealWithMem3()
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/WhiteList/id/")
    --找到
    local files2, numb2 = base.getFileName("/mnt/sdcard/Pictures/picNew2/id/")
    local files3, numb3 = base.getFileName("/mnt/sdcard/Pictures/picNew3/id/")
    --
    local strZgx    = "/mnt/sdcard/Pictures/picIcon/icon_zgx.bmp"
    local strZgx_20 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_20.bmp"
    local strPath   = "/mnt/sdcard/Pictures/picRemoveZgx/"
    --
    local nZgxMark = 0 
    local nCount   = 0 
    local nLimit   = 20
    --
    while true do 
        --
        if nCount >= nLimit then
            break
        end
        --
        local i = 0
        while i < 7 do 
            --查找贡献是不是满足20
            local bRes = base.findPicCor1(2, strZgx_20, 530, 
                                             para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                             710, 
                                             para.SCREEN_H-i*para.memberGrid_H)
            --
            if bRes == true then
                nZgxMark = 20
                break
            end
            --查找标记位
            local x, y = base.findPicCor(2, strZgx, 530, 
                                            para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                            710, 
                                            para.SCREEN_H-i*para.memberGrid_H)
            --找到
            if x ~= -1 and y ~= -1 then
                --进入同学首页
                base.touch(0, x - 425, y + 40)
                --判断是否已经进入主页
                bRes = qpy.isPageZy()
                if bRes == true then
                    --判断是不是在白名单
                    bRes = base.checkMem(files, numb,"/mnt/sdcard/Pictures/WhiteList/")
                    if bRes == false then
                        --判断是不是周二加入的同学
                        bRes = base.checkMem(files2, numb2,"/mnt/sdcard/Pictures/picNew2/")
                        if bRes == false then
                            --判断是不是周三加入的同学
                            bRes = base.checkMem(files3, numb3,"/mnt/sdcard/Pictures/picNew3/")
                            if bRes == false then
                                nCount = nCount + 1
                                --保存同学数据
                                base.getMemInfo(nCount, strPath)
                                --发出劝退信
                                M.sendWarnMessage()
                            end
                        end
                    end
                    --退出同学首页
                    base.touch(0, para.ReturnX, para.TopY)
                end
            end 
            i = i + 1
        end
        --
        base.moveUp(0, 715, 400, 1200)
        base.moveUp(0, 715, 600, 1200)
    end
end

--
function M.dealWithMem4()
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/WhiteList/id/")
    --找到
    local files3, numb3 = base.getFileName("/mnt/sdcard/Pictures/picNew3/id/")
    local files4, numb4 = base.getFileName("/mnt/sdcard/Pictures/picNew4/id/")
    --
    local strZgx    = "/mnt/sdcard/Pictures/picIcon/icon_zgx.bmp"
    local strZgx_20 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_20.bmp"
    local strPath   = "/mnt/sdcard/Pictures/picRemoveZgx/"
    --
    local nZgxMark = 0 
    local nCount   = 0 
    local nLimit   = 20
    --
    while true do 
        --
        if nCount >= nLimit then
            break
        end
        --
        local i = 0
        while i < 7 do 
            --查找贡献是不是满足20
            local bRes = base.findPicCor1(2, strZgx_20, 530, 
                                             para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                             710, 
                                             para.SCREEN_H-i*para.memberGrid_H)
            --
            if bRes == true then
                nZgxMark = 20
                break
            end
            --查找标记位
            local x, y = base.findPicCor(2, strZgx, 530, 
                                            para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                            710, 
                                            para.SCREEN_H-i*para.memberGrid_H)
            --找到
            if x ~= -1 and y ~= -1 then
                --进入同学首页
                base.touch(0, x - 425, y + 40)
                --判断是否已经进入主页
                bRes = qpy.isPageZy()
                if bRes == true then
                    --判断是不是在白名单
                    bRes = base.checkMem(files, numb,"/mnt/sdcard/Pictures/WhiteList/")
                    if bRes == false then
                        --判断是不是周三加入的同学
                        bRes = base.checkMem(files3, numb3,"/mnt/sdcard/Pictures/picNew3/")
                        if bRes == false then
                            --判断是不是周四加入的同学
                            bRes = base.checkMem(files3, numb3,"/mnt/sdcard/Pictures/picNew4/")
                            if bRes == false then
                                nCount = nCount + 1
                                --保存同学数据
                                base.getMemInfo(nCount, strPath)
                                --发出劝退信
                                M.sendWarnMessage()
                            end
                        end
                    end
                    --退出同学首页
                    base.touch(0, para.ReturnX, para.TopY)
                end
            end
            i = i + 1
        end
        --
        base.moveUp(0, 715, 400, 1200)
        base.moveUp(0, 715, 600, 1200)
    end
end

--
function M.dealWithMem5()
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/WhiteList/id/")
    --找到
    local files2, numb2 = base.getFileName("/mnt/sdcard/Pictures/picNew2/id/")
    local files3, numb3 = base.getFileName("/mnt/sdcard/Pictures/picNew3/id/")
    local files4, numb4 = base.getFileName("/mnt/sdcard/Pictures/picNew4/id/")
    local files5, numb5 = base.getFileName("/mnt/sdcard/Pictures/picNew5/id/")
    local files6, numb6 = base.getFileName("/mnt/sdcard/Pictures/picNew6/id/")
    --
    local strZgx    = "/mnt/sdcard/Pictures/picIcon/icon_zgx.bmp"
    local strZgx_10 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_10.bmp"
    local strZgx_20 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_20.bmp"
    local strZgx_30 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_30.bmp"
    local strPath   = "/mnt/sdcard/Pictures/picRemoveZgx/"
    --
    local nZgxMark = 0 
    local nCount   = 0 
    local nLimit   = 20
    --
    while true do 
        --
        if nCount >= nLimit then
            break
        end
        --
        local i = 0
        while i < 7 do 
            if nZgxMark == 0 then
                --查找贡献是不是满足10
                local bRes = base.findPicCor1(2, strZgx_10, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 10
                end
            elseif nZgxMark == 10 then
                --查找贡献是不是满足20
                local bRes = base.findPicCor1(2, strZgx_20, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 20
                end
            elseif nZgxMark == 20 then
                --查找贡献是不是满足30
                local bRes = base.findPicCor1(2, strZgx_30, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 30
                    break
                end
            end
            --查找标记位
            local x, y = base.findPicCor(2, strZgx, 530, 
                                            para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                            710, 
                                            para.SCREEN_H-i*para.memberGrid_H)
            --找到
            if x ~= -1 and y ~= -1 then
                --进入同学首页
                base.touch(0, x - 425, y + 40)
                --判断是否已经进入主页
                local bRes = qpy.isPageZy()
                if bRes == true then
                    --判断是不是在白名单
                    bRes = base.checkMem(files, numb,"/mnt/sdcard/Pictures/WhiteList/")
                    if bRes == false then
                        --没有达到10任务
                        if nZgxMark == 0 then
                            nCount = nCount + 1
                            --保存同学数据
                            base.getMemInfo(nCount, strPath)
                            --发出劝退信
                            M.sendWarnMessage()
                        --达到10任务但是没有达到20任务
                        elseif nZgxMark == 10 then
                          --判断是不是周4加入的同学
                            bRes = base.checkMem(files4, numb4,"/mnt/sdcard/Pictures/picNew4/")
                            if bRes == false then
                                --判断是不是周5加入的同学
                                bRes = base.checkMem(files5, numb5,"/mnt/sdcard/Pictures/picNew5/")
                                if bRes == false then
                                    nCount = nCount + 1
                                    --保存同学数据
                                    base.getMemInfo(nCount, strPath)
                                    --发出劝退信
                                    M.sendWarnMessage()
                                end
                            end
                        --达到20任务但是没有达到30任务
                        elseif nZgxMark == 20 then
                            --判断是不是周2加入的同学
                            bRes = base.checkMem(files2, numb2,"/mnt/sdcard/Pictures/picNew2/")
                            if bRes == false then
                                --判断是不是周3加入的同学
                                bRes = base.checkMem(files3, numb3,"/mnt/sdcard/Pictures/picNew3/")
                                if bRes == false then
                                    --判断是不是周4加入的同学
                                    bRes = base.checkMem(files4, numb4,"/mnt/sdcard/Pictures/picNew4/")
                                    if bRes == false then
                                        nCount = nCount + 1
                                        --保存同学数据
                                        base.getMemInfo(nCount, strPath)
                                        --发出劝退信
                                        M.sendWarnMessage()
                                    end
                                end
                            end
                        end
                    end
                    --退出同学首页
                    base.touch(0, para.ReturnX, para.TopY)
                end
            end 
            i = i + 1
        end
        --
        base.moveUp(0, 715, 400, 1200)
        base.moveUp(0, 715, 600, 1200)
    end
end

--
function M.dealWithMem6()
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/WhiteList/id/")
    --找到
    local files3, numb3 = base.getFileName("/mnt/sdcard/Pictures/picNew3/id/")
    local files4, numb4 = base.getFileName("/mnt/sdcard/Pictures/picNew4/id/")
    local files5, numb5 = base.getFileName("/mnt/sdcard/Pictures/picNew5/id/")
    local files6, numb6 = base.getFileName("/mnt/sdcard/Pictures/picNew6/id/")
    --
    local strZgx    = "/mnt/sdcard/Pictures/picIcon/icon_zgx.bmp"
    local strZgx_10 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_10.bmp"
    local strZgx_20 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_20.bmp"
    local strZgx_30 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_30.bmp"
    local strPath   = "/mnt/sdcard/Pictures/picRemoveZgx/"
    --
    local nZgxMark = 0 
    local nCount   = 0 
    local nLimit   = 20
    --
    while true do 
        --
        if nCount >= nLimit then
            break
        end
        --
        local i = 0
        while i < 7 do 
            if nZgxMark == 0 then
                --查找贡献是不是满足10
                local bRes = base.findPicCor1(2, strZgx_10, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 10
                end
            elseif nZgxMark == 10 then
                --查找贡献是不是满足20
                local bRes = base.findPicCor1(2, strZgx_20, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 20
                end
            elseif nZgxMark == 20 then
                --查找贡献是不是满足30
                local bRes = base.findPicCor1(2, strZgx_30, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 30
                    break
                end
            end
            --查找标记位
            local x, y = base.findPicCor(2, strZgx, 530, 
                                            para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                            710, 
                                            para.SCREEN_H-i*para.memberGrid_H)
            --找到
            if x ~= -1 and y ~= -1 then
                --进入同学首页
                base.touch(0, x - 425, y + 40)
                --判断是否已经进入主页
                local bRes = qpy.isPageZy()
                if bRes == true then
                    --判断是不是在白名单
                    bRes = base.checkMem(files, numb,"/mnt/sdcard/Pictures/WhiteList/")
                    if bRes == false then
                        --没有达到10任务
                        if nZgxMark == 0 then
                            nCount = nCount + 1
                            --保存同学数据
                            base.getMemInfo(nCount, strPath)
                            --发出劝退信
                            --M.sendWarnMessage()
                        --达到10任务但是没有达到20任务
                        elseif nZgxMark == 10 then
                          --判断是不是周五加入的同学
                            bRes = base.checkMem(files5, numb5,"/mnt/sdcard/Pictures/picNew5/")
                            if bRes == false then
                                --判断是不是周六加入的同学
                                bRes = base.checkMem(files6, numb6,"/mnt/sdcard/Pictures/picNew6/")
                                if bRes == false then
                                    nCount = nCount + 1
                                    --保存同学数据
                                    base.getMemInfo(nCount, strPath)
                                    --发出劝退信
                                    --M.sendWarnMessage()
                                end
                            end
                        --达到20任务但是没有达到30任务
                        elseif nZgxMark == 20 then
                            --判断是不是周三加入的同学
                            bRes = base.checkMem(files3, numb3,"/mnt/sdcard/Pictures/picNew3/")
                            if bRes == false then
                                --判断是不是周四加入的同学
                                bRes = base.checkMem(files4, numb4,"/mnt/sdcard/Pictures/picNew4/")
                                if bRes == false then
                                    --判断是不是周五加入的同学
                                    bRes = base.checkMem(files5, numb5,"/mnt/sdcard/Pictures/picNew5/")
                                    if bRes == false then
                                        nCount = nCount + 1
                                        --保存同学数据
                                        base.getMemInfo(nCount, strPath)
                                        --发出劝退信
                                        --M.sendWarnMessage()
                                    end
                                end
                            end
                        end
                    end
                    --退出同学首页
                    base.touch(0, para.ReturnX, para.TopY)
                end
            end 
            i = i + 1
        end
    
        --
        base.moveUp(0, 715, 400, 1200)
        base.moveUp(0, 715, 600, 1200)
    end
end

--
function M.dealWithMem7()
    --向下翻页到底
    base.moveFast(0, 1, 3)
    --
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/WhiteList/id/")
    --找到
    local files3, numb3 = base.getFileName("/mnt/sdcard/Pictures/picNew3/id/")
    local files4, numb4 = base.getFileName("/mnt/sdcard/Pictures/picNew4/id/")
    local files5, numb5 = base.getFileName("/mnt/sdcard/Pictures/picNew5/id/")
    local files6, numb6 = base.getFileName("/mnt/sdcard/Pictures/picNew6/id/")
    local files7, numb7 = base.getFileName("/mnt/sdcard/Pictures/picNew0/id/")
    --
    local strZgx    = "/mnt/sdcard/Pictures/picIcon/icon_zgx.bmp"
    local strZgx_10 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_10.bmp"
    local strZgx_20 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_20.bmp"
    local strZgx_30 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_30.bmp"
    local strZgx_40 = "/mnt/sdcard/Pictures/picIcon/icon_zgx_40.bmp"
    local strPath   = "/mnt/sdcard/Pictures/picRemoveZgx/"
    --
    local nZgxMark = 0 
    local nCount   = 0 
    local nLimit   = 20
    --
    while true do 
        --
        if nCount >= nLimit then
            break
        end
        --
        local i = 0
        while i < 7 do 
            if nZgxMark == 0 then
                --查找贡献是不是满足10
                local bRes = base.findPicCor1(2, strZgx_10, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 10
                end
            elseif nZgxMark == 10 then
                --查找贡献是不是满足20
                local bRes = base.findPicCor1(2, strZgx_20, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 20
                end
            elseif nZgxMark == 20 then
                --查找贡献是不是满足30
                local bRes = base.findPicCor1(2, strZgx_30, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 30
                end
            elseif nZgxMark == 30 then
                --查找贡献是不是满足40
                local bRes = base.findPicCor1(2, strZgx_40, 530, 
                                                 para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                                 710, 
                                                 para.SCREEN_H-i*para.memberGrid_H)
                if bRes == true then
                    nZgxMark = 40
                    break
                end
            end
            --查找标记位
            local x, y = base.findPicCor(2, strZgx, 530, 
                                            para.SCREEN_H-(i+1)*para.memberGrid_H, 
                                            710, 
                                            para.SCREEN_H-i*para.memberGrid_H)
            --找到
            if x ~= -1 and y ~= -1 then
                --进入同学首页
                base.touch(0, x - 425, y + 40)
                notifyMessage("0")
                --判断是否已经进入主页
                local bRes = qpy.isPageZy()
                if bRes == true then
                    --判断是不是在白名单
                    bRes = base.checkMem(files, numb,"/mnt/sdcard/Pictures/WhiteList/")
                    if bRes == false then
                        --没有达到10任务
                        if nZgxMark == 0 then
                            nCount = nCount + 1
                            --保存同学数据
                            base.getMemInfo(nCount, strPath)
                            --发出劝退信
                            M.sendWarnMessage()
                        --达到10任务但是没有达到20任务
                        elseif nZgxMark == 10 then
                            notifyMessage("1")
                            --判断是不是周6加入的同学
                            bRes = base.checkMem(files6, numb6, "/mnt/sdcard/Pictures/picNew6/")
                            if bRes == false then
                                notifyMessage("A")
                                --判断是不是周0加入的同学
                                bRes = base.checkMem(files7, numb7,"/mnt/sdcard/Pictures/picNew0/")
                                if bRes == false then
                                    nCount = nCount + 1
                                    --保存同学数据
                                    base.getMemInfo(nCount, strPath)
                                    --发出劝退信
                                    M.sendWarnMessage()
                                end
                            end
                        --达到20任务但是没有达到30任务
                        elseif nZgxMark == 20 then
                            notifyMessage("2")                    
                            --判断是不是周4加入的同学
                            bRes = base.checkMem(files4, numb4,"/mnt/sdcard/Pictures/picNew4/")
                            if bRes == false then
                                --判断是不是周5加入的同学
                                bRes = base.checkMem(files5, numb5,"/mnt/sdcard/Pictures/picNew5/")
                                if bRes == false then
                                    --判断是不是周6加入的同学
                                    bRes = base.checkMem(files6, numb6,"/mnt/sdcard/Pictures/picNew6/")
                                    if bRes == false then
                                        nCount = nCount + 1
                                        --保存同学数据
                                        base.getMemInfo(nCount, strPath)
                                        --发出劝退信
                                        M.sendWarnMessage()
                                    end
                                end
                            end
                        --达到30任务但是没有达到40任务
                        elseif nZgxMark == 30 then
                            notifyMessage("3")
                            --判断是不是周3加入的同学
                            bRes = base.checkMem(files3, numb3,"/mnt/sdcard/Pictures/picNew3/")
                                if bRes == false then
                                --判断是不是周4加入的同学
                                bRes = base.checkMem(files4, numb4,"/mnt/sdcard/Pictures/picNew4/")
                                if bRes == false then
                                    --判断是不是周5加入的同学
                                    bRes = base.checkMem(files5, numb5,"/mnt/sdcard/Pictures/picNew5/")
                                    if bRes == false then
                                        nCount = nCount + 1
                                        --保存同学数据
                                        base.getMemInfo(nCount, strPath)
                                        --发出劝退信
                                        M.sendWarnMessage()
                                    end
                                end
                            end
                        end   
                    notifyMessage("4")
                    end
                    --退出同学首页
                    base.touch(0, para.ReturnX, para.TopY)
                end
            end 
            i = i + 1
        end
        --
        base.moveUp(0, 715, 400, 1200)
        base.moveUp(0, 715, 600, 1200)
    end
end
--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------