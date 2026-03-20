return {
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

    --- {{{ Dashboard
    dashboard = {
      preset = {
        header = [[
███╗   ███╗██╗███████╗██╗   ██╗██╗  ██╗██╗
████╗ ████║██║╚══███╔╝██║   ██║██║ ██╔╝██║
██╔████╔██║██║  ███╔╝ ██║   ██║█████╔╝ ██║
██║╚██╔╝██║██║ ███╔╝  ██║   ██║██╔═██╗ ██║
██║ ╚═╝ ██║██║███████╗╚██████╔╝██║  ██╗██║
╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝]],

        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = function()
              vim.fn.chdir(vim.fn.stdpath("config"), "global")
              if vim.uv.fs_stat("init.vim") then
                vim.cmd([[ e init.vim ]])
              end
              vim.cmd([[ e init.lua ]])
            end,
          },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        {
          title = "NVIM Version: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
          padding = 1,
          align = "center",
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
      formats = {
        header = function(item, ctx)
          local pride_condition = function()
            return vim.fn.strftime("%m") == "06"
          end
          vim.api.nvim_set_hl(0, "OnionConfigMizukiColor", { fg = "#D99FC5" })
          vim.api.nvim_set_hl(0, "OnionConfigPrideRed", { fg = "#E50000" })
          vim.api.nvim_set_hl(0, "OnionConfigPrideOrange", { fg = "#FF8D00" })
          vim.api.nvim_set_hl(0, "OnionConfigPrideYellow", { fg = "#FFEE00" })
          vim.api.nvim_set_hl(0, "OnionConfigPrideGreen", { fg = "#028121" })
          vim.api.nvim_set_hl(0, "OnionConfigPrideBlue", { fg = "#004CFF" })
          vim.api.nvim_set_hl(0, "OnionConfigPridePurple", { fg = "#770088" })
          if pride_condition() then
            return {
              { item.header, width = ctx.width, hl = "OnionConfigMizukiColor", align = "center" },
              { "\n" },
              {
                "███████████████████",
                width = ctx.width,
                hl = "OnionConfigPrideRed",
                align = "center",
              },
              { "\n" },
              {
                "███████████████████",
                width = ctx.width,
                hl = "OnionConfigPrideOrange",
                align = "center",
              },
              { "\n" },
              {
                "███████████████████",
                width = ctx.width,
                hl = "OnionConfigPrideYellow",
                align = "center",
              },
              { "\n" },
              {
                "███████████████████",
                width = ctx.width,
                hl = "OnionConfigPrideGreen",
                align = "center",
              },
              { "\n" },
              {
                "███████████████████",
                width = ctx.width,
                hl = "OnionConfigPrideBlue",
                align = "center",
              },
              { "\n" },
              {
                "███████████████████",
                width = ctx.width,
                hl = "OnionConfigPridePurple",
                align = "center",
              },
              { "\nHappy Pride Month!", hl = "OnionConfigMizukiColor", align = "center" },
            }
          else
            return {
              { item.header, hl = "OnionConfigMizukiColor", align = "center" },
            }
          end
        end,
      },
    },
    --- }}}

    toggle = {
      notify = false,
    },
    terminal = {
      win = {
        style = "terminal",
        wo = {
          winbar = "",
        },
      },
    },
    image = {
      math = { enabled = true },
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
    snacks
      .toggle({
        name = "Quickfix",
        get = function()
          return require("onion27-config.terminal.quickfix").is_qfopen()
        end,
        set = function(enabled)
          if enabled then
            vim.cmd("copen")
          else
            vim.cmd("cclose")
          end
        end,
        wk_desc = {
          enabled = "Close ",
          disabled = "Open ",
        },
      })
      :map("<leader>tq")
  end,
  keys = {
    {
      "<leader>ot",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
    },
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
    {
      "<leader>bs",
      function()
        require("snacks").scratch()
      end,
      desc = "Scratch",
      mode = "n",
    },
  },
}
