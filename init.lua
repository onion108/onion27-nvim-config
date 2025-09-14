vim.o.compatible = false
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.mouse = "v"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.number = true
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.ttyfast = true
vim.o.foldmethod = "marker"
vim.o.cino = "m1,l1,j1,(0,ws,Ws,t0" -- )
vim.o.foldopen = "jump,mark,quickfix,search,tag"

if vim.o.termguicolors then
	vim.o.termguicolors = true
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.s", "*.S" },
	callback = function()
		vim.bo.filetype = "arm"
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.m" },
	callback = function()
		vim.bo.filetype = "objc"
	end,
})

require("common.main")
if vim.fn.exists("g:vscode") ~= 0 then
	require("vscode.main")
else
	require("terminal.main")
end

local grp_color_scheme_modify = vim.api.nvim_create_augroup("ColorSchemeModify", { clear = true })

vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "LazyLoad",
	group = grp_color_scheme_modify,
	callback = function()
		vim.cmd.highlight({ "link", "cErrInParen", "NONE" })
		vim.cmd.highlight({ "link", "cErrInBracket", "NONE" })
		vim.cmd.highlight({ "link", "csStringStart", "csString", bang = true })
		vim.cmd.highlight({ "link", "csStringEnd", "csString", bang = true })
	end,
})

vim.api.nvim_create_user_command("DbgBufs", function(_)
	local buflist = vim.api.nvim_list_bufs()
	local message = ""
	for i = 1, #buflist do
		message = message
			.. "bufnr="
			.. tostring(buflist[i])
			.. ", buflisted="
			.. tostring(vim.bo[buflist[i]].buflisted)
			.. "\n"
	end
	require("notify").notify(message, vim.log.levels.INFO, { title = "Debug Message" })
end, {})
