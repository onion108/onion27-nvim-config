return {
  yorumi = function()
    local colors = require("yorumi.colors")
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.yoru3, fg = colors.tsuki4, bold = true })
    vim.api.nvim_set_hl(0, "Visual", { bg = colors.kuroiGray })
    vim.api.nvim_set_hl(0, "Title", { fg = colors.sangoMagenta })
  end,
  ["*"] = function()
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ddaacc" })
  end,
}
