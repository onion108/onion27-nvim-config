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

--- @class HeaderMod
--- @field condition fun():boolean
--- @field mod fun(base: snacks.dashboard.Text, width: number): snacks.dashboard.Text

--- @type HeaderMod[]
local header_mods = {
  {
    condition = function()
      return vim.fn.strftime("%m:%d") == "08:21"
    end,
    mod = function(base, width)
      return listutil.synthesize_list {
        base,
        {
          { "\n" },
          { "Happy Birthday, Akiyama Mizuki!", width = width, hl = "OnionConfigMizukiColor", align = "center" },
        },
      }
    end,
  },
  {
    condition = function()
      return vim.fn.strftime("%m") == "06"
    end,
    mod = function(base, width)
      return listutil.synthesize_list {
        base,
        { { "\n" } },
        generate_header_strip_flag(width, 19, {
          "OnionConfigPrideRed",
          "OnionConfigPrideOrange",
          "OnionConfigPrideYellow",
          "OnionConfigPrideGreen",
          "OnionConfigPrideBlue",
          "OnionConfigPridePurple",
        }),
        { { "Happy Pride Month!", width = width, hl = "OnionConfigMizukiColor", align = "center" } },
      }
    end,
  },
  {
    condition = function()
      return vim.fn.strftime("%m:%d") == "03:31"
    end,
    mod = function(base, width)
      return listutil.synthesize_list {
        base,
        { { "\n" } },
        generate_header_strip_flag(width, 16, {
          "OnionConfigTransSkyBlue",
          "OnionConfigTransPink",
          "OnionConfigTransWhite",
          "OnionConfigTransPink",
          "OnionConfigTransSkyBlue",
        }),
        { { "Happy TDOV!", width = width, hl = "OnionConfigMizukiColor", align = "center" } },
      }
    end,
  },
}

local header_palette = {
  OnionConfigMizukiColor = "#D99FC5",
  OnionConfigPrideRed = "#E50000",
  OnionConfigPrideOrange = "#FF8D00",
  OnionConfigPrideYellow = "#FFEE00",
  OnionConfigPrideGreen = "#028121",
  OnionConfigPrideBlue = "#004CFF",
  OnionConfigPridePurple = "#770088",
  OnionConfigTransPink = "#F5ABB9",
  OnionConfigTransSkyBlue = "#5BCFFB",
  OnionConfigTransWhite = "#FFFFFF",
}

--- @param item snacks.dashboard.Item
--- @param ctx { width: number }
--- @return snacks.dashboard.Text
M.header_format = function(item, ctx)
  local base = {
    { item.header, width = ctx.width, hl = "OnionConfigMizukiColor", align = "center" },
  }
  for k, v in pairs(header_palette) do
    vim.api.nvim_set_hl(0, k, { fg = v })
  end
  for _, mod in ipairs(header_mods) do
    if mod.condition() then
      return mod.mod(base, ctx.width)
    end
  end
  return base
end

return M
