vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.s", "*.S" },
  callback = function()
    vim.bo.filetype = "arm"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.typ" },
  callback = function()
    vim.bo.filetype = "typst"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.m" },
  callback = function()
    vim.bo.filetype = "objc"
  end,
})

