--------------------------------------------------
--------------------------------------------------
package.path = package.path..";/mnt/sdcard/Pictures/lua/?.lua"
print(package.path)
--------------------------------------------------
--------------------------------------------------
require "para"
--------------------------------------------------
--------------------------------------------------
 
--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------

--go
function M.go()
    notifyMessage("录制icon_IO！")
    mSleep(5000)
    M.getIconIO()
    notifyMessage("录制icon_gx！")
    mSleep(5000)
    M.getIconGX()
    notifyMessage("录制icon_end!")
    mSleep(5000)
    M.getIconEnd()
end

--get icon IO
function M.getIconIO()
    snapshotRegion(para.PATHICON.."iconI"..".bmp", 
                    2*para.memberGrid_W, 
                    para.SCREEN_H-para.memberGrid_H, 
                    3*para.memberGrid_W, 
                    para.SCREEN_H)
    snapshotRegion(para.PATHICON.."iconO"..".bmp", 
                    3*para.memberGrid_W, 
                    para.SCREEN_H-para.memberGrid_H, 
                    4*para.memberGrid_W, 
                    para.SCREEN_H)
end

--get icon contribution
function M.getIconGX()
    snapshotRegion(para.PATHICON.."icon_gx"..".bmp", 190, 530, 320, 555) 
    snapshotRegion(para.PATHICON.."icon_gx_10"..".bmp", 190, 530, 365, 555) 
end

--get icon end
function M.getIconEnd()
    snapshotRegion(para.PATHICON.."icon_end"..".bmp", 280, 1220, 440, 1250) 
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------
