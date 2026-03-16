return {
  -- {{{ which-key
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      require("which-key").setup(opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      preset = "helix",
    },
    lazy = true,
  },
  -- }}}

  -- {{{ mini.nvim stuff
  {
    "nvim-mini/mini.align",
    opts = {},
  },

  {
    "nvim-mini/mini.splitjoin",
    opts = function()
      local gen_hook = require("mini.splitjoin").gen_hook
      return {
        mappings = {
          toggle = "<leader>tj",
        },
        join = {
          hooks_post = {
            gen_hook.del_trailing_separator { brackets = { "%b{}" } },
            gen_hook.pad_brackets { brackets = { "%b{}" } },
          },
        },
      }
    end,
  },
  {
    "nvim-mini/mini.pairs",
    opts = {}
  },
  -- }}}

  -- {{{ nvim-surround
  {
    "kylechui/nvim-surround",
    config = true,
    init = function()
      vim.g.nvim_surround_no_mappings = true
    end,
    keys = {
      {
        "<C-g>s",
        "<Plug>(nvim-surround-insert)",
        desc = "Adding a surrounding pair around the cursor (insert mode)",
        mode = "i",
      },
      {
        "<C-g>S",
        "<Plug>(nvim-surround-insert-line)",
        desc = "Add a surrounding pair around the cursor, on new lines (insert mode)",
        mode = "i",
      },
      {
        "gs",
        "<Plug>(nvim-surround-normal)",
        desc = "Add a surrounding pair around a motion (normal mode)",
        mode = "n",
      },
      {
        "gss",
        "<Plug>(nvim-surround-normal-cur)",
        desc = "Add a surrounding pair around the current line (normal mode)",
        mode = "n",
      },
      {
        "gS",
        "<Plug>(nvim-surround-normal-line)",
        desc = "Add a surrounding pair around a motion, on new lines (normal mode)",
        mode = "n",
      },
      {
        "gSS",
        "<Plug>(nvim-surround-normal-cur-line)",
        desc = "Add a surrounding pair around the current line, on new lines (normal mode)",
        mode = "n",
      },
      {
        "gs",
        "<Plug>(nvim-surround-visual)",
        desc = "Add a surrounding pair around a visual selection",
        mode = "x",
      },
      {
        "gS",
        "<Plug>(nvim-surround-visual-line)",
        desc = "Add a surrounding pair around a visual selection, on new lines",
        mode = "x",
      },
      {
        "dgs",
        "<Plug>(nvim-surround-delete)",
        desc = "Delete a surrounding pair",
        mode = "n",
      },
      {
        "cgs",
        "<Plug>(nvim-surround-change)",
        desc = "Change a surrounding pair",
        mode = "n",
      },
      {
        "cgS",
        "<Plug>(nvim-surround-change-line)",
        desc = "Change a surrounding pair, putting replacements on new lines",
        mode = "n",
      },
    },
  },
  -- }}}
}
