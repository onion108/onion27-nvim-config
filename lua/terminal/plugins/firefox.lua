return {
  'glacambre/firenvim',
  build = ":call firenvim#install(0)",
  config = function()
    vim.g.firenvim_config = {
      localSettings = {
        [".*"] = {
          cmdline = "neovim",
          takeover = "never",
        },
        ["https:?//(www\\.)?github\\.com/.*"] = {
          cmdline = "neovim",
          takeover = "always",
        },
      }
    }
  end
}
