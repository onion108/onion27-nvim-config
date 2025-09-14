local keymap = require("common.utils.keymap")

local success = pcall(function()
	local telescope = require("telescope")
	local builtin = require("telescope.builtin")
	keymap.define_keymap(
		"n",
		"<leader>gw",
		"<cmd>Telescope grep_string<cr>",
		"GREP current word using telescope",
		{ silent = true }
	)
	keymap.define_keymap("n", "<leader>gp", "<cmd>Telescope live_grep<cr>", "GREP using telescope", { silent = true })
	keymap.define_keymap("n", "<leader>gf", "<cmd>Telescope find_files<cr>", "Find file", { silent = true })
	keymap.define_keymap("n", "<leader>gF", function()
		builtin.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })
	end, "Find file", { silent = true })
	keymap.define_keymap("n", "<leader>gb", "<cmd>Telescope buffers<cr>", "Find buffer", { silent = true })
end)

if not success then
	vim.notify("Failed to setup telescope keybind", vim.log.levels.ERROR)
end

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "TelescopeResults" },
	callback = function()
		vim.opt_local.foldenable = false
	end,
})
