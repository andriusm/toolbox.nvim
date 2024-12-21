local M = {}

function M.create_modal_window(text)
    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, text)

    local width = 1
    local height = #text

    for i = 1, #text do
        if #text[i] > width then
            width = #text[i]
        end
    end

    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "single"
    }

    vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':q<CR>', { noremap = true, silent = true })
end

return M
