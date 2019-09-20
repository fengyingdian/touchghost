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

--
function M.go()
    M.getWhileListMem()
end

--
function M.getWhileListMem()
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/whiteList/id/")
    base.getMemInfo(numb + 1, "/mnt/sdcard/Pictures/whiteList/")
end

--
function M.getManagers()
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/Managers/id/")
    base.getMemInfo2(numb + 1, "/mnt/sdcard/Pictures/Managers/")
end

--
function M.getMarkers()
    local files, numb = base.getFileName("/mnt/sdcard/Pictures/Markers/id/")
    base.getMemInfo2(numb + 1, "/mnt/sdcard/Pictures/Markers/")
end

--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------