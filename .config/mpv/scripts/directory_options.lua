-- Use different options when playing files from a specific directory
-- as well as all of it's sub-directories.
-- Where "/home/user/video" insert the full path of the directory you wish
-- and enter whatever option you like.

local utils = require 'mp.utils'
function directory_options()
    
    -- fullpath = utils.join_path(mp.get_property("working-directory"), mp.get_property("path"))
    -- fullpath = utils.join_path(mp.get_property("working-directory"), "/home/near/wd-linux")
		fullpath = mp.get_property("working-directory")
		mp.msg.warn(fullpath)
    
    if string.find(fullpath, "/home/near/wd-linux/torrents", 0, 27) ~= nil then
        mp.set_property_bool("fullscreen", true)
        mp.set_property("fs-screen", 1)
    end
    
end

mp.observe_property("path", "string", directory_options)
