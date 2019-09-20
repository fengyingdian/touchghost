--------------------------------------------------
--------------------------------------------------
local modname = ...
local M = {}
_G[modname] = M
--------------------------------------------------
--------------------------------------------------
 
--
function M.go()

end

--
function M.logDebug(strData)
    return httpGet("http://123.206.7.41/tc?name=Aurora&type=0&token=fengyingdian&data="..strData)
end

--
function M.logCount(strData, bSuccess)
    --
    local strRes = nil
    --成功的话type = 1
    if bSuccess == true then
        strRes = httpGet("http://123.206.7.41/tc?name=Aurora&type=1&token=fengyingdian&data="..strData)
    --成功的话type = 2
    else
        strRes = httpGet("http://123.206.7.41/tc?name=Aurora&type=2&token=fengyingdian&data="..strData)
    end
    --
    return strRes 
end
 
--------------------------------------------------
--------------------------------------------------
return M
--------------------------------------------------
--------------------------------------------------