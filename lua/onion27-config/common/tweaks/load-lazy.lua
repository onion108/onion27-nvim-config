-- Bootstrap lazy.nvim (just grabbed from their website)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.loop and not vim.uv then
  vim.notify("YOU'RE TOO FUCKING OLD")
  os.exit(1)
end
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      {
        "Cannot clone the fucking lazy.nvim are you fucking sure your fucking internet connection is fucking fine:\n",
        "ErrorMsg",
      },
      { out, "WarningMsg" },
      { "\nPress any fucking key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Setup lazy.nvim
require("lazy").setup {
  spec = {
    -- import your plugins
    { import = "onion27-config.common.plugins" },
    {
      import = "onion27-config.vscode.plugins",
      cond = function(_)
        return vim.fn.exists("g:vscode") ~= 0
      end,
    },
    {
      import = "onion27-config.terminal.plugins",
      cond = function(_)
        return vim.fn.exists("g:vscode") == 0
      end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
  change_detection = {
    notify = false,
  },
}
