vim.notify("Enhanced nvim configurations with Lua 💪", vim.log.levels.INFO)

require("common.load-lazy")

local options = require("common.options")

local keymap = require("common.utils.keymap")

for _, tweak in ipairs(options.TWEAKS) do
    local ok = pcall(require, "common.tweaks." .. tweak)
    if not ok then
        vim.notify("Cannot load tweak " .. tweak, vim.log.levels.ERROR)
    end
end

keymap.define_keymap("n", "<leader>qo", ":copen<CR>", "Open quickfix", { silent = true })
keymap.define_keymap("n", "<leader>qc", ":cclose<CR>", "Close quickfix", { silent = true })
keymap.define_keymap("n", "<BS>", ":nohl<CR>", "Clear highlights", { silent = true })
