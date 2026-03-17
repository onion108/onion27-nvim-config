return {
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    --dir = "~/Workspace/Programming/Projects/outline.nvim",
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>oo" },
      { "<leader>to" },
    },
    event = "VeryLazy",
    opts = {
      providers = {
        priority = { "lsp", "coc", "markdown", "norg", "treesitter" },
      },
    },
    config = function(_, opts)
      local outline = require("outline")
      outline.setup(opts)
      Snacks.toggle({
        name = "Outline",
        get = function()
          return outline.is_focus_in_outline() or false
        end,
        set = function(enabled)
          if enabled then
            outline.focus_outline()
          else
            outline.focus_code()
          end
        end,
        wk_desc = {
          enabled = "Unfocus ",
          disabled = "Focus ",
        },
      }):map("<leader>to")

      Snacks.toggle({
        name = "Outline",
        get = function()
          return outline.is_open()
        end,
        set = function(enabled)
          if enabled then
            outline.open_outline()
          else
            outline.close_outline()
          end
        end,
        wk_desc = {
          enabled = "Close ",
          disabled = "Open ",
        },
      }):map("<leader>oo")
    end,
    dependencies = {
      "epheien/outline-treesitter-provider.nvim",
    },
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "ibhagwan/fzf-lua" },
      { "folke/snacks.nvim" },
    },
    event = "LspAttach",
    opts = {
      picker = "snacks",
    },
    keys = {
      {
        "gra",
        function()
          require("tiny-code-action").code_action {}
        end,
        mode = { "n", "x" },
        desc = "Code Action",
        noremap = true,
      },
    },
  },
}
