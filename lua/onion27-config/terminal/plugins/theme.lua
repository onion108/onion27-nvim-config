return {
  {
    "kvrohit/mellow.nvim",
    lazy = true,
    init = function()
      vim.g.mellow_italic_comments = false
      vim.g.mellow_italic_keywords = false
      vim.g.mellow_italic_booleans = false
      vim.g.mellow_italic_functions = false
      vim.g.mellow_italic_variables = false
      vim.g.mellow_bold_comments = false
      vim.g.mellow_bold_keywords = true
      vim.g.mellow_bold_booleans = true
      vim.g.mellow_bold_functions = false
      vim.g.mellow_bold_variables = false
      vim.g.mellow_transparent = false
    end,
  },

  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    opts = {
      transparent = false,
      italic_comments = true,
      disable_nvimtree_bg = true,
      color_overrides = {
        --vscLineNumber = "#FFFFFF",
      },
    },
  },
  { "navarasu/onedark.nvim", lazy = true },
  { "jacoborus/tender.vim", lazy = true },
  { "dracula/vim", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    init = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_bold = "1"
      vim.g.gruvbox_material_diagnostic_line_highlight = "1"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_ui_contrast = "high"
    end,
  },
  { "m6vrm/gruber.vim", lazy = true },
  { "arzg/vim-colors-xcode", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
  { "oneslash/helix-nvim", lazy = true },
  { "ok-ryoko/blue-screen", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "dgox16/oldworld.nvim", lazy = true },
  { "rafamadriz/neon", lazy = true },
  { "yorumicolors/yorumi.nvim", lazy = true },
  { "nickkadutskyi/jb.nvim", opts = {} },

  -- {{{ Ayu theme
  {
    "Shatur/neovim-ayu",
    lazy = true,
    config = function()
      local colors = require("ayu.colors")
      colors.generate()
      require("ayu").setup {
        overrides = function()
          return {
            LineNr = { fg = "#888888" },
            CursorLineNr = { fg = colors.accent, bg = colors.line, bold = true },
            WinSeparator = { fg = "#aaaaaa", bg = colors.bg },
            NormalFloat = { bg = "#181818" },
            CocSemTypeTypeParameter = { link = "Type" },
          }
        end,
      }
    end,
  },
  -- }}}

  -- {{{ Gruber darker
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = true,
    opts = {
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
  },
  -- }}}

  -- {{{ bamboo
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup {
        code_style = {
          keywords = { bold = true },
          conditionals = { italic = false, bold = true },
          namespaces = { italic = false },
          parameters = { italic = false },
        },
        highlights = {
          BufferCurrent = { fg = "#ff91ff", bold = true },
          NormalFloat = { bg = "#181818" },
        },
      }
    end,
  },
  -- }}}
}
