--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------
require "para"
--------------------------------------------------
--------------------------------------------------
 
--touch
function M.touch(Id, x, y)
    touchDown(Id, x, y)                     --ID为0的手指在坐标为(x, y)的点按下
    touchUp(Id)                             --ID为0的手指抬起
    mSleep(2000)                            --延时2000毫秒
end   

function M.touchFast(x, y)
    touchDown(0, x, y)                      --ID为0的手指在坐标为(x, y)的点按下
    touchUp(0)                              --ID为0的手指抬起
end   

--move
function M.moveDown(Id, x, y1, y2)   
    while y1 > y2 do 
        touchDown(Id, x, y1)                --ID为0的手指在坐标为(x, y1)的点按下
        mSleep(100)                         --延时50毫秒
        y1 = y1 - 100
        touchMove(Id, x, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
        touchUp(Id)                         --ID为0的手指抬起
    end     
    mSleep(1000)                            --延时2000毫秒
end

--move
function M.moveDown2(Id, x, y1, y2)   
    while y1 > y2 do 
        touchDown(Id, x, y1)                --ID为0的手指在坐标为(x, y1)的点按下
        mSleep(80)                          --延时50毫秒
        y1 = y1 - 100
        touchMove(Id, x, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
        touchUp(Id)                         --ID为0的手指抬起
    end     
    mSleep(1000)                            --延时2000毫秒
end

--move
function M.moveDown3(Id, x, y1, y2)   
    local index = 0
    while y1 > y2 do 
        index = index + 1
        touchDown(Id, x, y1)                --ID为0的手指在坐标为(x, y1)的点按下
        mSleep(100)                         --延时50毫秒
        if index%2 == 0 then
            y1 = y1 - 114
        else
            y1 = y1 - 112
        end
        touchMove(Id, x, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
        touchUp(Id)                         --ID为0的手指抬起
    end     
    mSleep(1000)                            --延时2000毫秒
end

--move
function M.moveUp(Id, x, y1, y2)   
    while y1 < y2 do 
        touchDown(Id, x, y1)                --ID为0的手指在坐标为(x, y1)的点按下
        mSleep(100)                         --延时50毫秒
        y1 = y1 + 100
        touchMove(Id, x, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
        touchUp(Id)                         --ID为0的手指抬起
    end     
    mSleep(1000)                            --延时2000毫秒
end

--move
function M.moveUp2(y1, y2)   
    while y1 < y2 do 
        touchDown(0, 715, y1)                --ID为0的手指在坐标为(x, y1)的点按下
        mSleep(30)                           --延时50毫秒
        y1 = y1 + 100
        touchMove(0, 715, y1)                --ID为0的手指向坐标为(x, y2)的点滑动
        touchUp(0)                           --ID为0的手指抬起
    end     
    mSleep(1000)                             --延时2000毫秒
end

--move fast
function M.moveFast(Id, h, num)                   --h为+1向下移动，h为-1向上移动
    for i = 0, num do                             --num滑动次数
        touchDown(Id, 715, para.MidY)             --ID为0的手指在坐标为(x, y)的点按下
        touchMove(Id, 715, 0.5*para.MidY*h)       --ID为0的手指向坐标为(x, y+h)的点滑动
        touchUp(Id)                               --ID为0的手指抬起
        mSleep(1000)                              --延时2000毫秒
    end
end

--move fast
function M.moveFast2(Id, num)                     --h为+1向下移动，h为-1向上移动
    for i = 0, num do                             --num滑动次数
        touchDown(Id, 715, 600)                   --ID为0的手指在坐标为(x, y)的点按下
        touchMove(Id, 715, 1000)                  --ID为0的手指向坐标为(x, y+h)的点滑动
        touchUp(Id)                               --ID为0的手指抬起
        mSleep(1000)                              --延时2000毫秒
    end
end

--is in box
function M.isInBox(x, y, l, t, r, b)
    local bRes = false
    if x >= l and x <= r then
        if y >= t and y <= b then
            bRes = true
        end
    end
    return bRes
end

--check member info
function M.checkMem(files, numb, path)
    --判断昨天是否存在
    for i = 0, numb do
        strName = string.format("%s", files[i])
        strPath = string.format("%s%s", path, para.PATH_SUB_ID)
        --notifyMessage(strPath..strName, 5000)
        x, y = M.findPicCor(5, strPath..strName, 290, 345, 430, 370)
        --local strTemp = string.format("%d, %d", x, y)
        --notifyMessage(strTemp, 5000)
        if x ~= -1 and y ~= -1 then 
            notifyMessage("确认成功！")
            return true 
        end
    end
    --notifyMessage("确认不成功！")
    return false
end

--check member info
function M.checkMem2(files, i, path)
    strName = string.format("%s", files[i])
    strPath = string.format("%s%s", path, para.PATH_SUB_ID)
    x, y = M.findPicCor(5, strPath..strName, 290, 345, 430, 370)
    if x ~= -1 and y ~= -1 then 
        notifyMessage("确认成功！")
        return true 
    end
    --notifyMessage("确认不成功！")
    return false
end

--check member info
function M.checkMem3(path)
    x, y = M.findPicCor(5, path, 290, 345, 430, 370)
    if x ~= -1 and y ~= -1 then 
        notifyMessage("确认成功！")
        return true 
    end
    --notifyMessage("确认不成功！")
    return false
end

--get member info
function M.getMemInfo(i, path)
    str = string.format("%03d", i)
    --将区域[(322, 430)(390, 425)]的截图保存到路径为/storage/extSdCard/memberPicLast/*.bmp的图片中
    strPath = string.format("%s%s", path, para.PATH_SUB_ID)
    snapshotRegion(strPath..str..".bmp", 290, 345, 430, 370)
    --mSleep(1000)
    --将区域[(200, 160)(520, 430)]的截图保存到路径为/storage/extSdCard/memberPicLast/*.bmp的图片中
    strPath = string.format("%s%s", path, para.PATH_SUB_FU)
    snapshotRegion(strPath..str..".bmp", 290, 120, 430, 370)
    notifyMessage("记录同学信息")
end

--get member info
function M.getMemInfo2(i, path)
    str = string.format("%03d", i)
    --将区域[(322, 430)(390, 425)]的截图保存到路径为/storage/extSdCard/memberPicLast/*.bmp的图片中
    strPath = string.format("%s%s", path, para.PATH_SUB_ID)
    snapshotRegion(strPath..str..".bmp", 290, 345, 430, 370)
    --mSleep(1000)
    --将区域[(200, 160)(520, 430)]的截图保存到路径为/storage/extSdCard/memberPicLast/*.bmp的图片中
    strPath = string.format("%s%s", path, para.PATH_SUB_FU)
    snapshotRegion(strPath..str..".bmp", 290, 120, 430, 370)
    notifyMessage("记录同学信息")
    --进入同学第一个作品
    M.touch(0, para.MidX, 650)
    mSleep(500)
    --记录同学80*80头像
    --snapshotRegion(path..PATH_SUB_SM..str..".bmp", 35, 490, 115, 570)
    strPath = string.format("%s%s", path, para.PATH_SUB_SM)
    snapshotRegion(strPath..str..".bmp", 50, 500, 100, 550)
    notifyMessage("记录同学80*80头像")
    --退出同学作品页面
    M.touch(0, para.ReturnX, para.TopY)
    mSleep(300)
    M.touch(0, para.ReturnX, para.TopY)
end

--save samall picture
function M.saveMdPic(i, j, count, path)
    str = string.format("%03d", count)
    --
    --notifyMessage("保存"..str..".bmp")
    --str_l = string.format("(%d,%d):(%d,%d,%d,%d)", i, j, SCREEN_W - (j+1)*memberGrid_W, 
    --                                     SCREEN_H - (i+1)*memberGrid_H, 
    --                                     SCREEN_W - j*memberGrid_W, 
    --                                     SCREEN_H - i*memberGrid_H)
    --notifyMessage(str_l)
    --mSleep(1000)
    --
    strPath = string.format("%s%s", path, para.PATH_SUB_MD)
    snapshotRegion(strPath..str..".bmp",
                        para.SCREEN_W - (j+1)*para.memberGrid_W+50, 
                        para.SCREEN_H - (i+1)*para.memberGrid_H+50, 
                        para.SCREEN_W - j*para.memberGrid_W-50, 
                        para.SCREEN_H - i*para.memberGrid_H-50)   
    --notifyMessage("记录同学100*100头像")
end

--find picture coordinate
function M.findPicCor(count, bmp, upx, upy, downx, dowy)
    local x = -1 
    local y = -1
    for i = 0, count, 1 do 
        --notifyMessage("查找".."icon坐标")
        --mSleep(3000)
        x, y = findImageInRegionFuzzy(bmp, 100 - i*10, upx, upy, downx, dowy, 0xffffff)
        --strRes = string.format("tmp: %d, %d", x, y)
        --notifyMessage(strRes)
        if x ~= -1 and y ~= -1 then 
            return x, y 
        end
    end
    return x, y 
end

function M.findPicCor1(count, bmp, upx, upy, downx, dowy)
    local x = -1 
    local y = -1
    for i = 0, count, 1 do 
        --notifyMessage("查找".."icon坐标")
        --mSleep(3000);
        x, y = findImageInRegionFuzzy(bmp, 100 - i*10, upx, upy, downx, dowy, 0xffffff)
        --strRes = string.format("tmp: %d, %d", x, y)
        --notifyMessage(strRes)
        if x ~= -1 and y ~= -1 then 
            return true 
        end
    end
    return false
end

--find picture coordinate
function M.findPicCor2(count, bmp)
    local x = -1 
    local y = -1
    for i = 0, count, 1 do 
        --notifyMessage("查找".."icon坐标")
        --mSleep(3000);
        x, y = findImageFuzzy(bmp, 100 - i*10, 0xffffff)
        --strRes = string.format("tmp: %d, %d", x, y)
        --notifyMessage(strRes)
        if x ~= -1 and y ~= -1 then 
            return x, y 
        end
    end
    return x, y 
end

--find picture coordinate
function M.findPicCor3(count, bmp)
    for i = 0, count, 1 do 
        --notifyMessage("查找".."icon坐标")
        --mSleep(3000);
        x, y = findImageFuzzy(bmp, 100 - i*10, 0xffffff)
        --strRes = string.format("tmp: %d, %d", x, y)
        --notifyMessage(strRes)
        if x ~= -1 and y ~= -1 then 
            return true
        end
    end
    return false 
end

--find picture local
function M.findPicLoc(x, y)
    local res = false
    for i = 0, 7 do
        for j = 0, 4 do
            res = M.isInBox(x, y, para.SCREEN_W - (j+1)*para.memberGrid_W, 
                                para.SCREEN_H - (i+1)*para.memberGrid_H, 
                                para.SCREEN_W - j*para.memberGrid_W, 
                                para.SCREEN_H - i*para.memberGrid_H)
            if res == true then 
                strTemp = string.format("%d,%d", i, j)
                notifyMessage(strTemp)
                return i, j 
            end
        end
    end
    return 0, 0
end

--get file name
function M.getFileName(path)
    files = {}
    numb = 0
    for file in io.popen("ls "..path):lines() do
        --mSleep(1000)
        --notifyMessage(file)
        table.insert(files, file)
        numb = numb + 1
    end
    strTemp = string.format("%d", numb)
    notifyMessage("得到文件:"..strTemp.."个！")
    return files, numb
end

--
function M.copyfile(source, destination)
    sourcefile = io.open(source, "r")
    if type(sourcefile) == nil then
        notifyMessage("nil")
        return
    end
    destinationfile = io.open(destination, "w")
    destinationfile:write(sourcefile:read("*all"))
    sourcefile:close()
    destinationfile:close()
end

--
function M.rmFile(path)
    for file in io.popen("ls "..path):lines() do
        os.remove(path..file)
    end
end

--
function M.cpFile(path1, path2)
    for file in io.popen("ls "..path1):lines() do
        M.copyfile(path1..file, path2..file)
    end
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
    touchDown(0, 100, 1150)
    touchUp(0)
    mSleep(500)
    --发送
    local x, y = M.findPicCor2(3, para.PATHICON.."icon_send.bmp")
    touchDown(0, x+10, y+10)
    mSleep(500)
    touchUp(0)
    mSleep(500)
    --发送
end

--得到星期几
function M.getWday()
    local wday = os.date("%w")
    local hour = os.date("%H")
    local nWday = tonumber(wday)
    local nHour = tonumber(hour)
    if nHour < 2 then
        nWday = nWday - 1
        if nWday == -1 then
            nWday = 6
        end
    end
    return nWday
end 

--得到星期几
function M.getHour()
    local hour = os.date("%H")
    return tonumber(hour)
end 

--得到一月中的第几天
function M.getDay()
    local time = os.date("*t")
    return tonumber(time.day)
end 

--根据星期几得到相应的文件夹
function M.getDirNameByWday()
    local wday = os.date("%w")
    local hour = os.date("%H")
    local nWday = tonumber(wday)
    local nHour = tonumber(hour)
    if nHour < 2 then
        nWday = nWday - 1
        if nWday == -1 then
            nWday = 6
        end
    end
    local strName = string.format("picNew%d/", nWday)
    return strName  
end

--根据星期几得到相应的文件夹
function M.getDirNameByTheWday(nWday)
    local strName = string.format("picNew%d/", nWday)
    return strName  
end

--根据星期几得到相应的文件夹
function M.getDirNameByLastWday()
    local wday = os.date("%w")
    local hour = os.date("%H")
    local nWday = tonumber(wday)
    local nHour = tonumber(hour)
    if nHour < 2 then
        nWday = nWday - 1
        if nWday == -1 then
            nWday = 6
        end
    end
    nWday = nWday - 1
    if nWday == -1 then
        nWday = 6
    end
    local strName = string.format("picNew%d/", nWday)
    return strName  
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------