--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------
 
M.SCREEN_W = 720
M.SCREEN_H = 1280

M.MidX = 360
M.MidY = 640

M.X1      = 90        --主页
M.X2      = 270       --学习
M.X3      = 450       --消息
M.X4      = 630       --我
M.EditX   = 680       --编辑
M.ReturnX = 50        --回退

M.Y1      = 180       --待处理事项
M.Y2      = 280       --私信
M.Y3      = 380       --赞
M.Y4      = 480       --
M.Y5      = 580       --
M.Y6      = 680       --
M.EmmaY   = 820       --Emma群
M.TopY    = 90        --顶边栏
M.BottomY = 1200      --底边栏

M.memberGrid_W = 180  --小组成员列表头像框宽度
M.memberGrid_H = 170  --小组成员列表头像框高度

M.MemberCount = 0     --记录小组成员的数量

M.PATHICON = "/mnt/sdcard/Pictures/picIcon/"
M.PATHLAST = "/mnt/sdcard/Pictures/picLast/"
M.PATHMEWM = "/mnt/sdcard/Pictures/picNew/"
M.PATHMEW1 = "/mnt/sdcard/Pictures/picNew1/"
M.PATHMEW2 = "/mnt/sdcard/Pictures/picNew2/"
M.PATHMEW3 = "/mnt/sdcard/Pictures/picNew3/"
M.PATHMEW4 = "/mnt/sdcard/Pictures/picNew4/"
M.PATHMEW5 = "/mnt/sdcard/Pictures/picNew5/"
M.PATHMEW6 = "/mnt/sdcard/Pictures/picNew6/"
M.PATHMEW7 = "/mnt/sdcard/Pictures/picNew7/"

M.PATHREMOVE = "/mnt/sdcard/Pictures/picRemove/"

M.PATH_SUB_MD = "md/"     --100*100
M.PATH_SUB_SM = "sm/"     --80*80
M.PATH_SUB_SS = "ss/"     --60*60
M.PATH_SUB_ID = "id/"
M.PATH_SUB_FU = "fu/"

M.PATHMEWM_MD = "/mnt/sdcard/Pictures/picNew/md/"
M.PATHMEWM_SM = "/mnt//sdcard/Pictures/picNew/sm/"
M.PATHMEWM_SS = "/mnt/sdcard/Pictures/picNew/ss/"
M.PATHMEWM_ID = "/mnt/sdcard/Pictures/picNew/id/"
M.PATHMEWM_FU = "/mnt/sdcard/Pictures/picNew/fu/"

M.lastPicCount = 5  

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------
