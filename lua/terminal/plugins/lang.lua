return {
  { "udalov/kotlin-vim",            ft = "kotlin" },
  { "ARM9/arm-syntax-vim",          ft = "arm" },
  { "maxbane/vim-asm_ca65",         ft = "asm_ca65" },
  { "fedorenchik/fasm.vim" },
  { "ollykel/v-vim",                ft = { "v", "vlang" } },
  { "kaarmu/typst.vim",             ft = { "typst" },     lazy = false },
  { "ziglang/zig.vim",              lazy = true,          ft = "zig" },
  { "PyGamer0/vim-apl",             lazy = true,          ft = "apl" },
  { "drmingdrmer/vim-indent-lua",   ft = "lua" },
  { "Airbus5717/c3.vim",            ft = "c3" },
  { "jlcrochet/vim-cs",             ft = "cs" },
  { "imsnif/kdl.vim",               lazy = false },
  { "HerringtonDarkholme/yats.vim", ft = "typescript",    lazy = false },
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
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
              --
              -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
              ["]o"] = "@loop.*",
              -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
              --
              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
              ["]d"] = "@conditional.outer",
            },
            goto_previous = {
              ["[d"] = "@conditional.outer",
            }
          },
        },
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
