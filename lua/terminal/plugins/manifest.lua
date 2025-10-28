return {

  -- {{{ Scratch Buffer
  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("scratch").setup {
        file_picker = "telescope",
        scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim",
        window_cmd = "edit",
        use_telescope = true,
        filetypes = {
          "js",
          "ts",
          "lua",
          "c",
          "cc",
          "txt",
        },
      }
    end,
    keys = {
      { "<leader>bs", "<cmd>Scratch<cr>",     desc = "Create Scratch File", mode = "n" },
      { "<leader>bo", "<cmd>ScratchOpen<cr>", desc = "Open Scratch File",   mode = "n" },
    },
    hooks = {
      {
        -- TODO: How to correct barbar?
        callback = function()
          vim.schedule(function()
            vim.cmd([[ Neotree toggle ]])
            vim.cmd([[ Neotree toggle ]])
          end)
        end,
      },
    },
  },
  -- }}}

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
    lazy = true,
    opts = {
      extensions = {},
    },
  },
  -- }}}

  --{{{ LazyGit
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  --}}}

  -- {{{ lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
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

  -- {{{ dashboard-nvim
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = {
      config = {
        header = {
          "███╗   ███╗██╗███████╗██╗   ██╗██╗  ██╗██╗",
          "████╗ ████║██║╚══███╔╝██║   ██║██║ ██╔╝██║",
          "██╔████╔██║██║  ███╔╝ ██║   ██║█████╔╝ ██║",
          "██║╚██╔╝██║██║ ███╔╝  ██║   ██║██╔═██╗ ██║",
          "██║ ╚═╝ ██║██║███████╗╚██████╔╝██║  ██╗██║",
          "╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝",
        },
        week_header = { enable = false },
        shortcut = {
          {
            desc = "[NVIM Version: "
                .. vim.version().major
                .. "."
                .. vim.version().minor
                .. "."
                .. vim.version().patch
                .. "]",
            group = "DashboardShortCut",
          },
          {
            desc = "File manager",
            key = "f",
            action = "Oil",
            group = "DashboardShortCut",
          },
        },
      },
      hide = {
        statusline = false,
      },
      shortcut_type = "number",
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
      { "echasnovski/mini.icons",     opts = {} },
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

  -- {{{ nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      local notify = require("notify")
      vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if not client then
          return
        end
        local lvl = ({
          "ERROR",
          "WARN",
          "INFO",
          "DEBUG",
        })[result.type]
        notify({ result.message }, lvl, {
          title = "LSP | " .. client.name,
          timeout = 10000,
          keep = function()
            return lvl == "ERROR" or lvl == "WARN"
          end,
        })
      end
    end,
    lazy = false,
    priority = 114514,
  },
  -- }}}

  -- {{{ bufferlist.nvim
  {
    --dir = "/Users/onion27/Workspace/Programming/Projects/bufferlist.nvim",
    "EL-MASTOR/bufferlist.nvim",
    lazy = true,
    keys = { { "<Leader>ob", ":BufferList<CR>", desc = "Open bufferlist" } },
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = "BufferList",
    opts = {
      win_keymaps = {
        {
          "<CR>",
          function(opts)
            local curpos = vim.fn.line(".")
            vim.cmd("bwipeout | buffer " .. opts.buffers[curpos])
          end,
          { desc = "BufferList: Enter buffer" },
        },
      },
    },
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
      debounce_delay = 16
    },
    config = function(opts)
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

  { "onion108/starwalker.nvim",    lazy = false,                     config = true },
  { "ryanoasis/vim-devicons",      lazy = false },
  { "honza/vim-snippets",          lazy = true },
  { "folke/todo-comments.nvim",    event = { "BufRead", "BufEnter" } },
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "lewis6991/gitsigns.nvim",     lazy = false },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "crispgm/nvim-tabline",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  { "edluffy/hologram.nvim",    lazy = true },
  { "petertriho/nvim-scrollbar" },
}
