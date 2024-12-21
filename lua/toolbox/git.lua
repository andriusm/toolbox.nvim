local M = {}

function M.find_pr_of_current_line()
	local file_name = vim.api.nvim_buf_get_name(0)
	local line_number = vim.api.nvim_win_get_cursor(0)[1]

	local pr_command = "git log -1 $(git blame -L " .. line_number .. "," .. line_number .. " " .. file_name ..
			" | cut -d ' ' -f 1 | sed 's/^\\^//') |  grep -o '#[0-9]\\+' | sed 's/#//'"
	local pr = vim.fn.system(pr_command):gsub("%s+", "")

	if pr == "" then
		print("PR not found, this was probably merged straight to master")
		return
	end

	local base_command = "git remote -v | grep '(fetch)' | sed 's/^.*@//;s/ .*$//;s/:/\\//;s/\\.git//'"
	local base = vim.fn.system(base_command):gsub("%s+", "")

	local url = "https://" .. base .. "/pull/" .. pr
	vim.fn.system("open '" .. url .. "'")
end

return M
