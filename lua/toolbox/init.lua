local M = {}

local fs = require('toolbox.fs')
local git = require('toolbox.git')

M.find_owners_of_current_file = fs.find_owners_of_current_file
M.file_info = fs.file_info
M.find_pr_of_current_line = git.find_pr_of_current_line

function M.setup()
    vim.keymap.set('n', '<leader>fi', fs.file_info)
    vim.keymap.set('n', '<leader>fo', fs.find_owners_of_current_file)
    vim.keymap.set('n', '<leader>xo', git.find_pr_of_current_line)
end

return M
