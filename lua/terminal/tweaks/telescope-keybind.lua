local keymap = require("common.utils.keymap")

local success = pcall(function()
    require("telescope")
    keymap.define_keymap("n", "<leader>gw", "<cmd>Telescope grep_string<cr>", "GREP current word using telescope", { silent = true })
    keymap.define_keymap("n", "<leader>gp", "<cmd>Telescope live_grep<cr>", "GREP using telescope", { silent = true })
    keymap.define_keymap("n", "<leader>gf", "<cmd>Telescope find_files<cr>", "Find file", { silent = true })
end)

if not success then
    vim.notify("Failed to setup telescope keybind", vim.log.levels.ERROR)
end

