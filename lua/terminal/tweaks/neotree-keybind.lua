local keymap = require("common.utils.keymap")

local success = pcall(function()
	require("neo-tree")
	keymap.define_keymap("n", "<leader>nt", "<cmd>Neotree toggle<CR>", "Toggle Neotree", { silent = true })
end)

if not success then
	vim.notify("Failed to setup neotree keybind", vim.log.levels.ERROR)
end
