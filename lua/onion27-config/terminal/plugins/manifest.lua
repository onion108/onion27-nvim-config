return {

  -- {{{ NeoTree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        filesystem = {
          hijack_netrw_behavior = "disabled",
        },
        default_component_configs = {
          filesystem = {
            window = {
              fuzzy_finder_mappings = {
                ["<C-j>"] = "move_cursor_down",
                ["<Tab>"] = "move_cursor_down",
                ["<C-k>"] = "move_cursor_up",
                ["<S-Tab>"] = "move_cursor_up",
              },
            },
          },
        },
      }
    end,
  },
  -- }}}

  -- {{{ telescope
  {
    "nvim-telescope/telescope.nvim",
    --dir = "/home/onion27/Programming/Projects/telescope.nvim",
    lazy = true,
    opts = {
      defaults = {
        border = true,
      },
      extensions = {},
    },
  },
  -- }}}

  -- {{{ fzf-lua
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  -- }}}

  -- {{{ lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim", "yorumicolors/yorumi.nvim" },
    opts = {
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          { "filename", path = 1 },
          "lsp_status",
          require("onion27-config.terminal.linemsg").get_message,
        },
        lualine_x = {
          "macro_recording",
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      options = {
        refresh = {
          refresh_time = 16,
        },
      },
    },
  },
  -- }}}

  -- {{{ oil.nvim
  {
    "stevearc/oil.nvim",

    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      skip_confirm_for_simple_edits = true,
    },

    -- Optional dependencies
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
      { "nvim-tree/nvim-web-devicons" },
    },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function(_, opts)
      require("oil").setup(opts)
      local keymap = require("onion27-config.common.utils.keymap")
      keymap.define_keymap("n", "<leader>of", ":Oil<CR>", "Open file manager", { silent = true })
      keymap.define_keymap("n", "<leader>oF", ":Oil .<CR>", "Open project root", { silent = true })
    end,
  },
  -- }}}

  -- {{{ auto-save
  {
    "okuuva/auto-save.nvim",
    opts = {
      debounce_delay = 250,
    },
    config = function(_, opts)
      require("auto-save").setup(opts)
      local group = vim.api.nvim_create_augroup("autosave", {})

      vim.api.nvim_create_autocmd("User", {
        pattern = "AutoSaveWritePost",
        group = group,
        callback = function(opts_ac)
          if opts_ac.data.saved_buffer ~= nil then
            require("onion27-config.terminal.linemsg").set_message("Saved")
          end
        end,
      })
    end,
  },
  -- }}}

  -- {{{ flash.nvim
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash treesitter",
      },
    },
  },
  -- }}}

  {
    "xorid/swap-split.nvim",
    config = true,
    keys = {
      {
        "<leader>ss",
        function()
          require("swap-split").swap()
        end,
        desc = "Swap with another split",
        mode = "n"
      }
    }
  },

  { "onion108/starwalker.nvim", lazy = false, config = true },
  { "ryanoasis/vim-devicons", lazy = false },
  { "honza/vim-snippets", lazy = true },
  { "folke/todo-comments.nvim", event = { "BufRead", "BufEnter" }, config = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "lewis6991/gitsigns.nvim", lazy = false },
  { "backdround/tabscope.nvim", config = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "edluffy/hologram.nvim", lazy = true },
  { "petertriho/nvim-scrollbar", config = true },
}
