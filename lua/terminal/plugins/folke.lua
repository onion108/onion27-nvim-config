return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      input = { enabled = true },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
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
      --markdown = {
        --hover = {},
      --},
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
