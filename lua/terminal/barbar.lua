vim.g.barbar_auto_setup = false
require("barbar").setup({
    exclude_ft = {"terminal", "qf"},
    sidebar_filetypes = {
        ['neo-tree'] = true
    },
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<leader>t,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>t.', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<leader>t<', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>t>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>t0', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>t1', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>t2', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>t3', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>t4', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>t5', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>t6', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>t7', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>t8', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>tl', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>tp', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>tc', '<Cmd>BufferClose<CR>', opts)
map('n', '<leader>tC', '<Cmd>BufferClose!<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
