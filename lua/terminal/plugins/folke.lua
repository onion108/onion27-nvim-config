return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "lazy.nvim",
        "snacks.nvim",
        "noice.nvim",
      },
      enabled = function(root_dir)
        if vim.g.lazydev_enabled ~= nil then
          return vim.g.lazydev_enabled
        end
        return vim.uv.fs_stat(root_dir .. "/.nvim-proj")
      end,
    },
  },
  {
    "folke/snacks.nvim",
    priority = 114514,
    lazy = false,
    ---@type snacks.Config
    opts = {
      notifier = {
        enabled = true,
      },
      input = { enabled = true },
      picker = {
        win = {
          input = {
            keys = {
              ["J"] = { "preview_scroll_down", mode = { "n" } },
              ["K"] = { "preview_scroll_up", mode = { "n" } },
              ["H"] = { "preview_scroll_left", mode = { "n" } },
              ["L"] = { "preview_scroll_right", mode = { "n" } },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local snacks = require("snacks")
      snacks.setup(opts)

      vim.notify = snacks.notifier.notify
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
        snacks.notifier.notify(result.message, lvl, {
          title = "LSP | " .. client.name,
          timeout = 10000,
          keep = function()
            return lvl == "ERROR" or lvl == "WARN"
          end,
        })
      end
    end,
    keys = {
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "LazyGit",
      },
      {
        "<leader>nd",
        function()
          require("snacks").notifier.hide()
        end,
        desc = "Dismiss all notifications",
      },
      {
        "<leader>on",
        function()
          require("snacks").notifier.show_history()
        end,
        desc = "Open notification history",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    ---@type NoiceConfig
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline",
        opts = {},
        format = {
          cmdline = { pattern = "^:", icon = "[Command]", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "[Search]", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "[Search (reverse)]", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "[Shell]", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "[Lua]", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "[Help]" },
          input = { view = "cmdline_input" },
        },
      },
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
        kind_icons = {},
      },
      redirect = {
        view = "popup",
        filter = { event = "msg_show" },
      },
      notify = { enabled = false },
      lsp = {
        progress = { enabled = false },
        hover = {
          enabled = true,
          silent = false,
          view = nil,
          opts = {},
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
          view = nil,
          opts = {},
        },
        message = { enabled = false },
        documentation = {
          view = "hover",
          opts = {
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
          },
        },
      },
      views = {
        notify = {
          backend = "snacks",
        },
      },
      health = {
        checker = true,
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
      routes = {
        {
          view = "split",
          filter = { event = "msg_show", min_height = 20 },
        },
        {
          view = "split",
          filter = { cmdline = true, min_height = 2 },
        },
      },
    },
  },
}
