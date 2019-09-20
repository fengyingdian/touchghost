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
    --启动APP
    --M.getIntoMemList()
    local index = 1
    if index == 0 then
        M.dealWithNewMem()
    elseif index == 1 then
        M.sendAppriciateLetter()
    else
        M.operFiles()
    end
end

--deal with new member
function M.dealWithNewMem()
    --找到标记位
    local nRes, files, mark = M.getLastDayMark()
    if nRes == -1 then
        return
    end
    --找到加号的位置
    local curi, curj = M.getIconPlusLoc()
    --如果是第一次使用，保存最后n个成员的信息
    if nRes == 0 then
        M.saveLastMemb(curi, curj)
    --如果已经记录了前一天最后一批同学
    else
        --得到今天新加入的同学
        local count = M.getNewMemb(files, mark, curi, curj)
        if count > 0 then
            --
            M.moveFromMemToContri()
            --得到这些新成员的状态
            M.getNewMemStatus()
            --
            M.moveFromContriToMem()
            --发劝退信
            M.sendQuitLetter(mark, curi, curj)
            --处理文件夹
            M.operFiles()
        end
    end
end

--save last member
function M.saveLastMemb(curi, curj)
    local count = 0
    i = curi
    while i < 7 do
        j = 0
        if count == 0 then
            j = curj + 1
            if j > 3 then
                j = 0
                i = i + 1
            end
        end
        while j < 4 do
            --
            count = count + 1
            --
            base.saveMdPic(i, j, count, para.PATHLAST)
            --mSleep(1000)
            --进入同学主页
            base.touch(0, para.SCREEN_W - j*para.memberGrid_W-40, para.SCREEN_H - i*para.memberGrid_H-45)
            mSleep(1000)
            --记录同学信息
            base.getMemInfo(count, para.PATHLAST)
            --退出同学主页
            base.touch(0, para.ReturnX, para.TopY)
            --
            if count >= para.lastPicCount then return end
            --
            j = j + 1
        end
        --
        i = i + 1
    end
end

--get new member
function M.getNewMemb(files, index, curi, curj)
    local count = 0
    local i = curi
    while true do
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
            count = count + 1
            --进入同学主页
            base.touch(0, para.SCREEN_W - j*para.memberGrid_W-40, para.SCREEN_H - i*para.memberGrid_H-45)
            --检查同学信息
            local bRes = base.checkMem2(files, index, para.PATHLAST)
            --该同学昨天就已经在群里
            if bRes == true then
                --退出同学主页
                base.touch(0, para.ReturnX, para.TopY)
                local strTemp = string.format("新加入成员：%d个", count - 1)
                notifyMessage(strTemp)
                return count - 1
            else
                base.getMemInfo(count, para.PATHMEWM)
                --退出同学主页
                base.touch(0, para.ReturnX, para.TopY)
                --
                base.saveMdPic(i, j, count, para.PATHMEWM)
            end
            --
            j = j + 1
        end
        --
        i = i + 1
        
        if i >= 6 then
            i = 0
            j = 0
            --向上翻一页
            -------------------
            -------------------
            base.moveUp(0, para.MidX, 600, 1200)
            base.moveUp(0, para.MidX, 600, 1200)
            -------------------
            -------------------
        end
    end  
    local strTemp = string.format("新加入成员：%d个", count - 1)
    notifyMessage(strTemp)
    return count - 1
end

--get new member status
function M.getNewMemStatus()
    --找到/storage/extSdCard/memberPicNew/sm下所有的文件  
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/picNew/id/")
    --
    local strTemp = string.format("%d个新成员!", numb)
    notifyMessage(strTemp)
    --向下翻页对齐
    base.moveDown3(0, para.MidX, 1000, 800)  
    --用来记录状态
    local status = {}
    for i = 0, numb do 
        status[i] = 0   --0代表没有找到，-1代表找到了但是贡献没有达到10，1代表贡献已经达到10了
    end
    --查找贡献已经到10的同学
    local count = 0 
    --
    while true do
        --查找icon_gx_10
        local x, y = base.findPicCor(2, "/mnt/sdcard/Pictures/picIcon/".."icon_gx_10.bmp", 180, 215, 380, 405)
        --找到
        if x ~= -1 and y ~= -1 then
            --进入同学首页
            base.touch(0, x-70, y-35)
            --循环判断
            count = M.checkContribution(files, numb, status, count)
            --退出同学首页
            base.touch(0, para.ReturnX, para.TopY)
        end
        
        --如果所有同学贡献都达到10退出
        if count >= numb then
            return status
        end
        
        --找到结束标志，一般来讲翻页看到结束位置基本上就不会有完成10贡献的同学了
        local x, y = base.findPicCor(4, para.PATHICON.."icon_end"..".bmp", 240, 1210, 480, 1260)
        if x ~= -1 and y ~= -1 then
            break
        end
        
        --看看还有没有完成10个任务的没有就退出
        local x, y = base.findPicCor2(3, para.PATHICON.."icon_gx_10"..".bmp")
        if x == -1 or y == -1 then
            break
        end
        
        --向下翻页
        base.moveDown3(0, para.MidX, 800, 600)   
    end

    return status
end

--get new member
function M.sendQuitLetter(mark, curi, curj)
    --找到
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/picLast/id/")
    --找到
    local files2, numb2 = base.getFileName("/mnt/sdcard/Pictures/picExist/id/")
    --
    local strTemp = string.format("%s个成员完成了任务!", numb2)
    notifyMessage(strTemp)
    --
    local count = 0
    local i = curi
    while true do
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
            count = count + 1
            --进入同学主页
            base.touch(0, para.SCREEN_W - j*para.memberGrid_W-40, para.SCREEN_H - i*para.memberGrid_H-45)
            --检查同学信息
            local bRes = base.checkMem2(files, mark, para.PATHLAST)
            --达标
            if bRes == true then
                --退出同学主页
                base.touch(0, para.ReturnX, para.TopY)
                return count - 1
            else
                --检查同学信息
                bRes = base.checkMem(files2, numb, "/mnt/sdcard/Pictures/picExist/")
                if bRes == false then
                    base.touch(0, para.EditX, para.BottomY)
                    --开始发送消息
                    base.sendMessage("对不起同学，因为你第一天没有完成10个任务，很抱歉要被踢了[献吻][献吻]感谢你对Emma争霸群的热爱，如果您有时间做任务可以再申请，随时欢迎[献吻]")
                    --结束发送消息
                    --退出消息界面
                    base.touch(0, para.ReturnX, para.TopY)
                end
                --退出同学主页
                base.touch(0, para.ReturnX, para.TopY)
            end
            --
            j = j + 1
        end
        --
        i = i + 1
        
        if i >= 6 then
            i = 0
            j = 0
            --向上翻一页
            base.moveUp(0, para.MidX, 600, 1200)
            base.moveUp(0, para.MidX, 600, 1200)
        end
    end  
    return count - 1
end

--operate files
function M.operFiles()
    local strDir = base.getDirNameByWday()
    notifyMessage(strDir)
    notifyMessage("1")
    --清空"/mnt/sdcard/Pictures/strDir/"目录
    base.rmFile("/mnt/sdcard/Pictures/"..strDir.."id/")
    base.rmFile("/mnt/sdcard/Pictures/"..strDir.."fu/")
    base.rmFile("/mnt/sdcard/Pictures/"..strDir.."md/")
    base.rmFile("/mnt/sdcard/Pictures/"..strDir.."sm/")
    notifyMessage("2")
    --将"/mnt/sdcard/Pictures/picExist/"复制到"/mnt/sdcard/Pictures/picstrDir/"
    base.cpFile("/mnt/sdcard/Pictures/picExist/id/", "/mnt/sdcard/Pictures/"..strDir.."id/")
    base.cpFile("/mnt/sdcard/Pictures/picExist/fu/", "/mnt/sdcard/Pictures/"..strDir.."fu/")
    base.cpFile("/mnt/sdcard/Pictures/picExist/md/", "/mnt/sdcard/Pictures/"..strDir.."md/")
    base.cpFile("/mnt/sdcard/Pictures/picExist/sm/", "/mnt/sdcard/Pictures/"..strDir.."sm/")
    notifyMessage("3")
    --找到
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/picExist/id/")
    --清空"/mnt/sdcard/Pictures/picRemove/"目录
    base.rmFile("/mnt/sdcard/Pictures/picRemove/id/")
    base.rmFile("/mnt/sdcard/Pictures/picRemove/fu/")
    base.rmFile("/mnt/sdcard/Pictures/picRemove/md/")
    base.rmFile("/mnt/sdcard/Pictures/picRemove/sm/")
    notifyMessage("4")
    --筛选出要删除的同学复制到"/mnt/sdcard/Pictures/picRemove/"目录中
    local lastNumb = 1
    for i = 0, numb do
        local strName = string.format("%s", files[i])
        local strSub = string.sub(strName, 1, -5)
        local temp = tonumber(strSub);
        if temp then
            notifyMessage("5")
            while lastNumb < temp do
                strRemove = string.format("%03d.bmp", lastNumb)
                base.copyfile("/mnt/sdcard/Pictures/picNew/id/"..strRemove,
                              "/mnt/sdcard/Pictures/picRemove/id/"..strRemove)
                base.copyfile("/mnt/sdcard/Pictures/picNew/sm/"..strRemove,
                              "/mnt/sdcard/Pictures/picRemove/sm/"..strRemove)
                base.copyfile("/mnt/sdcard/Pictures/picNew/fu/"..strRemove,
                              "/mnt/sdcard/Pictures/picRemove/fu/"..strRemove)                
                base.copyfile("/mnt/sdcard/Pictures/picNew/md/"..strRemove,
                              "/mnt/sdcard/Pictures/picRemove/md/"..strRemove)    
                lastNumb = lastNumb + 1
            end
            lastNumb = temp + 1
        end
    end
    notifyMessage("6")
    --清空picNew
    base.rmFile("/mnt/sdcard/Pictures/picNew/id/")
    base.rmFile("/mnt/sdcard/Pictures/picNew/fu/")
    base.rmFile("/mnt/sdcard/Pictures/picNew/md/")
    base.rmFile("/mnt/sdcard/Pictures/picNew/sm/")
    --清空picLast
    notifyMessage("7")
    base.rmFile("/mnt/sdcard/Pictures/picLast/id/")
    base.rmFile("/mnt/sdcard/Pictures/picLast/fu/")
    base.rmFile("/mnt/sdcard/Pictures/picLast/md/")
    base.rmFile("/mnt/sdcard/Pictures/picLast/sm/")
    notifyMessage("8")
    --复制picExist到picLast
    base.cpFile("/mnt/sdcard/Pictures/picExist/id/", "/mnt/sdcard/Pictures/picLast/id/")
    base.cpFile("/mnt/sdcard/Pictures/picExist/fu/", "/mnt/sdcard/Pictures/picLast/fu/")
    base.cpFile("/mnt/sdcard/Pictures/picExist/md/", "/mnt/sdcard/Pictures/picLast/md/")
    base.cpFile("/mnt/sdcard/Pictures/picExist/sm/", "/mnt/sdcard/Pictures/picLast/sm/")
    notifyMessage("9")
    --清空picExist
    base.rmFile("/mnt/sdcard/Pictures/picExist/id/")
    base.rmFile("/mnt/sdcard/Pictures/picExist/fu/")
    base.rmFile("/mnt/sdcard/Pictures/picExist/md/")
    base.rmFile("/mnt/sdcard/Pictures/picExist/sm/")
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

--run app
function M.runApp()
    appRun("com.ishowedu.peiyin")	 --APP入口
    notifyMessage("打开趣配音，请耐心等待十秒钟！")
    mSleep(8000)
end

--get last day's mark
function M.getLastDayMark()
    --找到/storage/extSdCard/memberPicLast/id下所有的文件  
    local files, numb = base.getFileName(para.PATHLAST..para.PATH_SUB_MD)
    if numb == 0 then
        return 0, files, mark
    end
    
    --判断这些人今天还在不在
    local bRes = false
    local page = 0
    local mark = 0
    while page < 2 do
        while mark < numb do
            strName = string.format("%s", files[mark])
            bRes = base.findPicCor3(4, para.PATHLAST..para.PATH_SUB_MD..strName)
            if bRes == true then
                notifyMessage("标记位为："..strName)
                break
            end
            mark = mark + 1
            local strTemp = string.format("%d", mark)
            notifyMessage(strTemp)
        end
        if bRes == true then
            break
        end
        notifyMessage("本页未找到标记位！即将上翻！")
        --向上翻页
        base.moveUp(0, para.MidX, 600, 1200)
        base.moveUp(0, para.MidX, 600, 1200)
        --重头再找
        mark = 0
        page = page + 1
    end
    
    --
    if bRes == false then
        notifyMessage("error!")
        return -1, files, mark
    else
        while page > 0 do
            --向下翻页
            base.moveDown(0, para.MidX, 1200, 600)
            base.moveDown(0, para.MidX, 1200, 600)
            page = page - 1
        end
    end
    
    --向上翻页
    base.moveUp(0, para.MidX, 600, 1000)
    --向下翻页
    base.moveDown(0, para.MidX, 1000, 600)
    --
    mSleep(1000)   
    return 1, files, mark
end

--get icon plus location
function M.getIconPlusLoc()
    --查找"+"图片的位置
    local xxxx, yyyy = base.findPicCor(2, para.PATHICON.."iconI.bmp", 0, 
                                                        para.SCREEN_H-2*para.memberGrid_H, 
                                                        para.SCREEN_W,
                                                        para.SCREEN_H)
    if xxxx ~= -1 and yyyy ~= -1 then
        --
        local strRes = string.format("cor: %d, %d", xxxx, yyyy)
        notifyMessage(strRes)
        --
        local curiiii, curjjjj = base.findPicLoc(xxxx+20, yyyy+20)
        local strRes = string.format("loc: %d, %d", curiiii, curjjjj)
        notifyMessage(strRes)
        return curiiii, curjjjj
    end
    return 1, 0
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
function M.checkContribution(files, numb, status, count)
    for i = 0, numb do 
        if status[i] ~= 1 then
            local strName = string.format("%s", files[i])
            --确认是不是该同学
            local bRes = base.checkMem2(files, i, "/mnt/sdcard/Pictures/picNew/")
            if bRes == true then 
                status[i] = 1
                count = count + 1
                --将该同学头像保存
                base.copyfile("/mnt/sdcard/Pictures/picNew/md/"..strName, "/mnt/sdcard/Pictures/picExist/md/"..strName)
                base.copyfile("/mnt/sdcard/Pictures/picNew/id/"..strName, "/mnt/sdcard/Pictures/picExist/id/"..strName)
                base.copyfile("/mnt/sdcard/Pictures/picNew/sm/"..strName, "/mnt/sdcard/Pictures/picExist/sm/"..strName)
                base.copyfile("/mnt/sdcard/Pictures/picNew/fu/"..strName, "/mnt/sdcard/Pictures/picExist/fu/"..strName)
                --退出循环
                break
            end
        end
    end  
    return count
end

--send welcome letter
function M.sendWelcomeLetter(files, numb)
    for i = 0, numb do
        local strName = string.format("%s", files[i])
        local x, y = base.findPicCor2(4, "/mnt/sdcard/Pictures/picLast/md/"..strName)
        if x ~= -1 and y ~= -1 then
            local curi, curj = base.findPicLoc(x+20, y+20)
            local strRes = string.format("loc: %d, %d", curi, curj)
            notifyMessage(strRes)
            --进入同学主页
            base.touch(0, x+20, y+20)
            mSleep(1000)
            --进入发送消息界面
            base.touch(0, para.EditX, para.BottomY)
            --开始发送消息
            base.sendMessage("欢迎新同学[献吻]感谢有你，Emma争霸群才能不断地茁壮成长[献吻]")
            --结束发送消息
            --退出消息界面
            base.touch(0, para.ReturnX, para.TopY)
            --退出同学主页
            base.touch(0, para.ReturnX, para.TopY)
        end
    end
end

--send appriciate letter
function M.sendAppriciateLetter()
    local thisi = 0
    while thisi < 9 do
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
            notifyMessage("未找到加号！")
        end
        mSleep(1000)
        --
        M.sendAppriciateLetterPage(6, curi, curj)
        --
        local bRes = base.findPicCor3(2, para.PATHICON.."icon_mine.bmp")
        if bRes == true then
            notifyMessage("找到自己！")
            break
        end
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

--send appriciate letter page
function M.sendAppriciateLetterPage(numb, curi, curj)
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
            local bRes1 = base.findPicCor1(2, para.PATHICON.."icon_mine.bmp", curxx-180, curyy-170, curxx, curyy)
            local bRes2 = base.findPicCor1(2, para.PATHICON.."icon_linxiyan.bmp", curxx-180, curyy-170, curxx, curyy)
            if bRes1 == false and bRes2 == false then
                --
                count = count + 1
                --进入同学主页
                base.touch(0, curxx-50, curyy-50)
                mSleep(1000)
                --[[给同学第一个作品点赞
                base.touch(0, para.MidX, 650)
                base.touch(0, 640, 520)
                --退出同学作品界面
                base.touch(0, para.ReturnX, para.TopY)
                base.touch(0, para.ReturnX, para.TopY)
                --进入发送消息界面
                --]]
                base.touch(0, para.EditX, para.BottomY)
                --开始发送消息
                --base.sendMessage("大家下午好！很多同学问怎么加入微信点评群，这里跟大家讲一下哈。首先关注'Emma争霸'微信公众号，然后输入'688'，点击弹出的链接，按照链接里第二步，直接扫管理员微信二维码添加管理员微信，由管理员邀请进入微信点评群！")
                --base.sendMessage("另外大家记得每天做任务练习口语哦，没有完成10任务的同学会依次被踢出！被踢出的同学可以留在微信点评群，但是英趣群做任务的名额要留给愿意练习的同学哈~")
                base.sendMessage("【群发消息不用回复哈】提醒一下大家哈，刚才统计新人数据的时候发现有些同学的实际贡献会被趣配音少统计，解决方法就是多做一个两个任务，比如要求10任务，就做11个或者12个，这样一般至少能保证10个贡献~管理员一般会在11点之后开始统计，请大家务必在11点之前完成任务~早睡早起精神好哈~管理员因为要统计大家的贡献所以睡得晚，这点大家不要跟管理员学习~哈哈~")
                base.sendMessage("【群发消息不用回复哈】本周管理员只会精确统计每天新加入的同学的贡献，下周开始管理员会精确统计每个同学每天的贡献数，贡献太少的老同学也会有被踢的可能哦，请大家切记~学习是个坚持的过程，一定不要松懈~共勉~加油~")
                --结束发送消息
                --退出消息界面
                base.touch(0, para.ReturnX, para.TopY)
                --退出同学主页
                base.touch(0, para.ReturnX, para.TopY)
            end
            j = j + 1
        end
        i = i + 1
        --strRes = string.format("i:%d", i)
        --notifyMessage(strRes)
    end
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------