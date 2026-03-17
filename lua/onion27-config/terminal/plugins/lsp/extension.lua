return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "Decodetalkers/csharpls-extended-lsp.nvim",
    lazy = false,
    config = function()
      require("csharpls_extended").buf_read_cmd_bind()
    end,
  },
}
