-- Correct file type for Vlang source file.

local termbuf_group = vim.api.nvim_create_augroup("VFileTypeCorrection", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = termbuf_group,
	pattern = "*.v",
	callback = function(event)
		vim.bo.filetype = "vlang"
	end,
})
