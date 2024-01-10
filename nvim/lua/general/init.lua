-- print("General config")
-- print("Remaps")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- show line numbers in a pretty way
vim.cmd [[
  set number
  set numberwidth=1
]]
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.number = true

-- Etc
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- To get long undo history??
vim.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.g.mapleader = " "


-- set encoding=utf8
-- let g:airline_powerline_fonts = 1
vim.opt.encoding = "utf8"

-- Go check theprimeagen's video on this (nvim setup from scratch)
-- :help index 
-- TODO tabs?

-- print("colors")

-- function ColorMyPencils(color)
-- 	vim.cmd.colorscheme(color)
--
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--
-- ColorMyPencils("wildcharm")
-- vim.cmd.colorscheme("wildcharm")
-- vim.cmd.colorscheme("vim")

-- vim.cmd [[colorscheme wildcharm]]

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- TODO: https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim
-- shortcut for this!

function Delete_blank_lines_in_visual_selection()
    vim.cmd('\'<,\'>g/^$/d')
end

vim.api.nvim_set_keymap('v', '<leader>dl', '<Cmd>lua Delete_blank_lines_in_visual_selection()<CR>', { noremap = true, silent = true })

-- function Delete_current_block()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local cursor = vim.api.nvim_win_get_cursor(0)
--     local cursor_row = cursor[1] - 1 -- Convert to 0-based index
--
--     print("Cursor row: " .. cursor_row) -- Debugging line
--
--     local parser = vim.treesitter.get_parser(bufnr)
--     local tree = parser:parse()[1]
--     local root = tree:root()
--     local node = root:named_descendant_for_range(cursor_row, 0, cursor_row, -1)
--
--     -- Debugging information
--     if node then
--         print("Node type: " .. node:type())
--     else
--         print("No node found")
--         return
--     end
--
--     -- Find the smallest node that starts at the same line as the cursor
--     while node and (node:start() ~= cursor_row or node:type() == 'comment') do
--         node = node:parent()
--         if node then
--             print("Parent node type: " .. node:type())
--         else
--             print("Reached root node")
--             return
--         end
--     end
--
--     local start_line, _, end_line, _ = node:range()
--     -- Convert to 1-based index and adjust end_line
--     start_line = start_line + 1
--     end_line = end_line + 1
--
--     print("Deleting lines " .. start_line .. " to " .. end_line) -- Debugging line
--     vim.api.nvim_buf_set_lines(bufnr, start_line, end_line, false, {})
-- end
--
-- vim.api.nvim_set_keymap('n', '<leader>di', ':lua Delete_current_block()<CR>', {noremap = true, silent = true})
