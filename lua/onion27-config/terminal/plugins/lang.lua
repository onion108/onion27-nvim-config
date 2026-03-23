return {
  { "udalov/kotlin-vim", ft = "kotlin" },
  { "ARM9/arm-syntax-vim", ft = "arm" },
  { "maxbane/vim-asm_ca65", ft = "asm_ca65" },
  { "fedorenchik/fasm.vim" },
  { "ollykel/v-vim", ft = { "v", "vlang" } },
  { "ziglang/zig.vim", lazy = true, ft = "zig" },
  { "PyGamer0/vim-apl", lazy = true, ft = "apl" },
  { "Airbus5717/c3.vim", ft = "c3" },
  { "jlcrochet/vim-cs", ft = "cs" },
  { "imsnif/kdl.vim", lazy = false },
  { "HerringtonDarkholme/yats.vim", ft = "typescript", lazy = false },
  { "vala-lang/vala.vim", ft = "vala" },
  { "ariedov/android-nvim", config = true },

  { import = "onion27-config.terminal.plugins.lang.markdown" },

  -- {{{ Typst
  {
    "chomosuke/typst-preview.nvim",
    ft = { "typst" },
    opts = {
      open_cmd = "chromium --app=%s",
      dependencies_bin = {
        ["tinymist"] = "tinymist",
        ["websocat"] = "websocat",
      },
    },
  },
  -- }}}

  -- {{{ Polyglot
  {
    "sheerun/vim-polyglot",
    lazy = false,
    init = function()
      vim.g.polyglot_disabled = { "markdown", "typescript", "zig" }
    end,
  },
  -- }}}

  -- {{{ Autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
  -- }}}

  -- {{{ Lean
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "Saghen/blink.cmp",
      -- 'nvim-telescope/telescope.nvim', -- for 2 Lean-specific pickers
      -- 'andymass/vim-matchup',          -- for enhanced % motion behavior
      -- 'andrewradev/switch.vim',        -- for switch support
      -- 'tomtom/tcomment_vim',           -- for commenting
    },

    opts = { -- see below for full configuration options
      mappings = true,
      infoview = {
        autoopen = false,
      },
    },
  },
  -- }}}
}
