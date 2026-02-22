return {
  {
    'stevearc/overseer.nvim',
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    opts = {},
    keys = {
      {
        "<leader>to",
        function()
          require("overseer").toggle()
        end,
        desc = "Toggle Task List",
      },
      {
        "<leader>rs",
        ":OverseerShell<CR>",
        desc = "Run Shell Command",
      },
      {
        "<leader>rt",
        ":OverseerRun<CR>",
        desc = "Run Task"
      },
    },
    lazy = false,
  }
}
