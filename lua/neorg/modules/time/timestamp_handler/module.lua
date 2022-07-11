--[[
    DATEINSERTER
    This module is responsible for handling the insertion of date and time into a neorg buffer.
--]]

require('neorg.modules.base')

local module = neorg.modules.create("time.timestamp_handler")
local log = require('neorg.external.log')

module.load = function()
	log.info("DATEINSERTER loaded!")
end

module.public = {

	version = "0.1",

	insert_datetime = function()
		vim.cmd("put =strftime('%c')")
	end

}

return module
