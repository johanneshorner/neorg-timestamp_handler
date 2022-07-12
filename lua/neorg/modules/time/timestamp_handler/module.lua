--[[
    DATEINSERTER
    This module is responsible for handling the insertion of date and time into a neorg buffer.
--]]

require("neorg.modules.base")
require("neorg.events")

local module = neorg.modules.create("time.timestamp_handler")

module.setup = function()
	return { success = true, requires = { "core.keybinds" } }
end

module.load = function()
	module.required["core.keybinds"].register_keybinds(module.name, {
		"insert_datetime",
		"insert_datetime_before"
	})
end

module.on_event = function(event)
	if event.split_type[2] == "time.timestamp_handler.insert_datetime" then
		vim.schedule(function() require("util").buf.insert_at_cursor(module.public.timedate_now(), 1) end)
	end
	if event.split_type[2] == "time.timestamp_handler.insert_datetime_before" then
		vim.schedule(function() require("util").buf.insert_at_cursor(module.public.timedate_now()) end)
	end
end

module.public = {
	timedate_now = function()
		return string.format("<%s>", os.date("%Y-%m-%dT%H:%M:%S"))
	end
}

module.events.subscribed = {

	["core.keybinds"] = {
		["time.timestamp_handler.insert_datetime"] = true,
		["time.timestamp_handler.insert_datetime_before"] = true
	}

}

return module
