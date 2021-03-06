local M = {
	buf = {},
	time = {}
}

M.buf.insert_at_cursor = function(str, offset)
	if not offset then offset = 0 end

	local cursor_column_pos = vim.api.nvim_win_get_cursor(0)[2] + offset
	local current_line = vim.api.nvim_get_current_line()
	local new_line = current_line:sub(0, cursor_column_pos) .. str .. current_line:sub(cursor_column_pos + 1)

	vim.api.nvim_set_current_line(new_line)
end

M.time.date_str_to_table = function(str)
	local year, month, day, hour, min, sec = str:match("(%d+)-(%d+)-(%d+) .* (%d+):(%d+)")
	local table = { day = day, month = month, year = year, hour = hour, min = min, sec = sec }
	print(vim.inspect(table))
	-- print(os.time({ day = day, month = month, year = year, hour = hour, min = min, sec = sec }))
end

return M
