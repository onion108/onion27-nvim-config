local grp_color_scheme_modify = vim.api.nvim_create_augroup("ColorSchemeModify", { clear = true })

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "LazyLoad",
  group = grp_color_scheme_modify,
  callback = function()
    vim.cmd.highlight { "link", "cErrInParen", "NONE" }
    vim.cmd.highlight { "link", "cErrInBracket", "NONE" }
    vim.cmd.highlight { "link", "csStringStart", "csString", bang = true }
    vim.cmd.highlight { "link", "csStringEnd", "csString", bang = true }
  end,
})
