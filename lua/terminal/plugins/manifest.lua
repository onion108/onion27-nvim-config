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

  -- {{{ ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        insert_mappings = false,
        open_mapping = [[<leader>ot]],
      }
    end,
    lazy = true,
    cmd = {
      "ToggleTerm",
      "TermExec",
    },
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
          require("terminal.linemsg").get_message,
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
      local keymap = require("common.utils.keymap")
      keymap.define_keymap("n", "<leader>of", ":Oil<CR>", "Open file manager", { silent = true })
      keymap.define_keymap("n", "<leader>oF", ":Oil .<CR>", "Open project root", { silent = true })
    end,
  },
  -- }}}

  -- {{{ nvim-autopair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup {}
      local cond = require("nvim-autopairs.conds")
      local basic = require("nvim-autopairs.rules.basic")

      autopairs.get_rules("'")[1].not_filetypes = { "clojure", "scheme", "lisp", "rust" }

      local bracket = basic.bracket_creator(require("nvim-autopairs").config)
      autopairs.add_rules {
        bracket("(", ")", { "clojure", "lisp" }):with_pair(cond.not_after_regex([=[[%w%%%'%[%"%.%`%$%+%-%/%*]]=])),
      }

      autopairs.get_rule("(")[1].not_filetypes = { "clojure", "lisp" }
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
            require("terminal.linemsg").set_message("Saved")
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
