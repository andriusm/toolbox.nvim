local M = {}

local utils = require("toolbox.utils")

function M.find_owners_of_current_file()
    local filename = vim.fn.expand('%')
    local output = vim.fn.systemlist({ "codeowners", filename })

    local line = output[1]
    local parts = vim.split(line, "@")
    local filepath = string.gsub(parts[1], "%s+", "")
    local owners = {}

    for i = 2, #parts do
        owners[#owners + 1] = parts[i]
    end

    local public = filepath:find("public") ~= nil and "Yes" or "No"
    local modal_content = { "File: " .. filepath, "Public:" .. public, "Owners: " .. owners[1] }

    for i, owner in ipairs(owners) do
        if i ~= 1 then
            modal_content[#modal_content + 1] = "        " .. owner
        end
    end

    utils.create_modal_window(modal_content)
end

function M.file_info()
    local filename = vim.fn.expand('%')

    local modal_content = { "File: " .. filename }

    utils.create_modal_window(modal_content)
end

return M
