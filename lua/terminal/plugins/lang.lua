return {
  { "udalov/kotlin-vim", ft = "kotlin" },
  { "ARM9/arm-syntax-vim", ft = "arm" },
  { "maxbane/vim-asm_ca65", ft = "asm_ca65" },
  { "fedorenchik/fasm.vim" },
  { "ollykel/v-vim", ft = { "v", "vlang" } },
  { "kaarmu/typst.vim", ft = { "typst" }, lazy = false },
  { "ziglang/zig.vim", lazy = true, ft = "zig" },
  { "PyGamer0/vim-apl", lazy = true, ft = "apl" },
  { "drmingdrmer/vim-indent-lua", ft = "lua" },
  { "Airbus5717/c3.vim", ft = "c3" },
  { "jlcrochet/vim-cs", ft = "cs" },
  { "imsnif/kdl.vim", lazy = false },
  { "HerringtonDarkholme/yats.vim", ft = "typescript", lazy = false },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- {{{ Polyglot
  {
    "sheerun/vim-polyglot",
    lazy = false,
    init = function()
      vim.g.polyglot_disabled = { "markdown", "typescript", "zig" }
    end,
  },
  -- }}}

  -- {{{ Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup {
        ensure_installed = {
          "rust",
          "c",
          "d",
          "c_sharp",
          "haskell",
          "json",
          "json5",
          "objc",
          "v",
          "vala",
          "zig",
          "cpp",
          "lua",
          "html",
          "xml",
          "commonlisp",
          "nu",
          "kdl",
          "typescript",
          "tsx",
          "javascript",
          "vue",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      }
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
}
