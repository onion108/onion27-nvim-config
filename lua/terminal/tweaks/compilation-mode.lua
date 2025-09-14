local ok, toggleterm = pcall(require, "toggleterm")

local COMPILE_START_PATTERN = "vimtcompile:"
local CREATE_27ONION_KEYBIND = true

--- @return string|nil
local function try_find_compilation_command()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local result = nil
	for _, line in ipairs(lines) do
		local i = line:find(COMPILE_START_PATTERN)
		if i ~= nil then
			result = line:sub(i + COMPILE_START_PATTERN:len())
			break
		end
	end
	return result
end

if not ok then
	vim.notify("Cannot load toggleterm.nvim", vim.log.levels.ERROR)
	return
end

local last_compilation_command = nil

vim.api.nvim_create_user_command("Compile", function(args)
	local compilation_command
	if args.args == nil or (string.gsub(args.args, "^%s*(.-)%s*$", "%1")):len() == 0 then
		if last_compilation_command == nil then
			-- Try to find a command line in the current buffer when not provided
			local command = try_find_compilation_command()
			if command == nil then
				vim.notify(
					"No recent compilation command found and no command find in current buffer",
					vim.log.levels.ERROR
				)
				return
			else
				compilation_command = command
			end
		else
			compilation_command = last_compilation_command
		end
	else
		compilation_command = args.args
	end
	if not args.bang then
		last_compilation_command = compilation_command
	end

	toggleterm.exec(compilation_command)
end, {
	nargs = "?",
	bang = true,
	complete = "shellcmdline",
})

vim.api.nvim_create_user_command("SetCompileCommand", function(args)
	if args.args == nil or (string.gsub(args.args, "^%s*(.-)%s*$", "%1")):len() == 0 then
		vim.notify("Please provide command to set", vim.log.levels.ERROR)
	else
		last_compilation_command = args.args
	end
end, {
	nargs = "?",
	complete = "shellcmdline",
})

vim.api.nvim_create_user_command("RefreshCompile", function(_)
	local compile_command = try_find_compilation_command()
	if compile_command == nil then
		vim.notify("Cannot find compilation command from current buffer", vim.log.levels.ERROR)
		return
	end
	last_compilation_command = compile_command
end, {})

vim.api.nvim_create_autocmd("SessionWritePost", {
	callback = function()
		local session = vim.v.this_session
		if session == nil or session == "" or (not vim.uv.fs_stat(session)) then
			return
		end

		if last_compilation_command then
			local dirname = vim.fs.dirname(session)
			local file = vim.fs.joinpath(dirname, "sessionx.vim")
			local ok2, err = pcall(vim.fn.writefile, {
				"SetCompileCommand " .. last_compilation_command,
			}, file)
			if not ok2 then
				vim.notify("Failed to save compilation command information: " .. err, vim.log.levels.WARN)
			end
		end
	end,
})

if CREATE_27ONION_KEYBIND then
	local keymap = require("common.utils.keymap")
	keymap.define_keymap("n", "<leader>CC", "<cmd>Compile<cr>", "Run compile command", { silent = true })
	keymap.define_keymap(
		"n",
		"<leader>CR",
		"<cmd>RefreshCompile<cr>",
		"Refresh compile command from buffer",
		{ silent = true }
	)
end
