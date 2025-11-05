return {
  -- {{{ Nerd Commenter
  {
    "preservim/nerdcommenter",
    lazy = true,
    keys = {
      { "<leader>cc", desc = "Comment out current line(s)", mode = { "n", "v" } },
      { "<leader>cn", desc = "Comment out current line(s) (forced nesting)", mode = { "n", "v" } },
      { "<leader>c<space>", desc = "Toggle Comment", mode = { "n", "v" } },
      { "<leader>cm", desc = "Comment given lines use minimal delim", mode = { "n", "v" } },
      { "<leader>ci", desc = "Toggle comment individually", mode = { "n", "v" } },
      { "<leader>cs", desc = "Comment out sexily", mode = { "n", "v" } },
      { "<leader>cy", desc = "Comment out and yank", mode = { "n", "v" } },
      { "<leader>c$", desc = "Comment until EOL", mode = { "n", "v" } },
      { "<leader>cA", desc = "Append Comment", mode = { "n", "v" } },
      { "<leader>ca", desc = "Insert Comment", mode = { "n", "v" } },
      { "<leader>cl", desc = "Comment aligned down to left", mode = { "n", "v" } },
      { "<leader>cb", desc = "Comment aligned down to both", mode = { "n", "v" } },
      { "<leader>cu", desc = "Uncomment current line(s)", mode = { "n", "v" } },
    },
  },
  -- }}}

  -- {{{ which-key
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      require("which-key").setup(opts);
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      preset = "helix"
    },
    lazy = true,
  },
  -- }}}

  {
    "nvim-mini/mini.align",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "gs",
          normal_cur = "gss",
          normal_line = "gS",
          normal_cur_line = "gSS",
          visual = "gs",
          visual_line = "gS",
          delete = "dgs",
          change = "cgs",
          change_line = "cgS",
        },
      }
    end,
  },
}
