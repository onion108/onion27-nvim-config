return {
  yorumi = function()
    local colors = require("yorumi.colors")
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.yoru3, fg = colors.tsuki4, bold = true })
  end,
  ["*"] = function ()
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ddaacc" })
  end
}

