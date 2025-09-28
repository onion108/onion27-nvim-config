-- Bootstrap lazy.nvim (just grabbed from their website)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.loop and (not vim.uv) then
  vim.notify("YOU'RE TOO FUCKING OLD")
end
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim

local env = "terminal.plugins"
if vim.fn.exists("g:vscode") ~= 0 then
  env = "vscode.plugins"
else
  env = "terminal.plugins"
end

require("lazy").setup {
  spec = {
    -- import your plugins
    { import = "common.plugins" },
    {
      import = "vscode.plugins",
      cond = function(x)
        return vim.fn.exists("g:vscode") ~= 0
      end,
    },
    {
      import = "terminal.plugins",
      cond = function(x)
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
