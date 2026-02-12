vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.lean" },
  callback = function()
    vim.bo.filetype = "lean"
  end,
})
