local listutil = require("onion27-config.common.utils.list")
M = {}

--- @param ctx_width number
--- @param width number
--- @param highlights string[]
--- @return snacks.dashboard.Text
local function generate_header_strip_flag(ctx_width, width, highlights)
  local text = {}
  for _, v in ipairs(highlights) do
    table.insert(text, {
      string.rep("█", width),
      width = ctx_width,
      hl = v,
      align = "center",
    })
    table.insert(text, {
      "\n",
    })
  end
  return text
end

--- @param item snacks.dashboard.Item
--- @param ctx { width: number }
--- @return snacks.dashboard.Text
M.header_format = function(item, ctx)
  local base = {
    { item.header, width = ctx.width, hl = "OnionConfigMizukiColor", align = "center" },
  }
  local pride_condition = function()
    return vim.fn.strftime("%m") == "06"
  end
  local trans_condition = function()
    return vim.fn.strftime("%m:%d") == "03:31"
  end
  vim.api.nvim_set_hl(0, "OnionConfigMizukiColor", { fg = "#D99FC5" })
  vim.api.nvim_set_hl(0, "OnionConfigPrideRed", { fg = "#E50000" })
  vim.api.nvim_set_hl(0, "OnionConfigPrideOrange", { fg = "#FF8D00" })
  vim.api.nvim_set_hl(0, "OnionConfigPrideYellow", { fg = "#FFEE00" })
  vim.api.nvim_set_hl(0, "OnionConfigPrideGreen", { fg = "#028121" })
  vim.api.nvim_set_hl(0, "OnionConfigPrideBlue", { fg = "#004CFF" })
  vim.api.nvim_set_hl(0, "OnionConfigPridePurple", { fg = "#770088" })
  vim.api.nvim_set_hl(0, "OnionConfigTransPink", { fg = "#F5ABB9" })
  vim.api.nvim_set_hl(0, "OnionConfigTransSkyBlue", { fg = "#5BCFFB" })
  vim.api.nvim_set_hl(0, "OnionConfigTransWhite", { fg = "#FFFFFF" })
  if pride_condition() then
    return listutil.synthesize_list {
      base,
      { { "\n" } },
      generate_header_strip_flag(ctx.width, 19, {
        "OnionConfigPrideRed",
        "OnionConfigPrideOrange",
        "OnionConfigPrideYellow",
        "OnionConfigPrideGreen",
        "OnionConfigPrideBlue",
        "OnionConfigPridePurple",
      }),
      { { "Happy Pride Month!", width = ctx.width, hl = "OnionConfigMizukiColor", align = "center" } },
    }
  elseif trans_condition() then
    return listutil.synthesize_list {
      base,
      { { "\n" } },
      generate_header_strip_flag(ctx.width, 16, {
        "OnionConfigTransSkyBlue",
        "OnionConfigTransPink",
        "OnionConfigTransWhite",
        "OnionConfigTransPink",
        "OnionConfigTransSkyBlue",
      }),
      { { "Happy TDOV!", width = ctx.width, hl = "OnionConfigMizukiColor", align = "center" } },
    }
    else
    return base
  end
end

return M
