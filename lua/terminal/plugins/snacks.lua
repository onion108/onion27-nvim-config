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
    dashboard = {
      preset = {
        header = [[
███╗   ███╗██╗███████╗██╗   ██╗██╗  ██╗██╗
████╗ ████║██║╚══███╔╝██║   ██║██║ ██╔╝██║
██╔████╔██║██║  ███╔╝ ██║   ██║█████╔╝ ██║
██║╚██╔╝██║██║ ███╔╝  ██║   ██║██╔═██╗ ██║
██║ ╚═╝ ██║██║███████╗╚██████╔╝██║  ██╗██║
╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝]],
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
}
