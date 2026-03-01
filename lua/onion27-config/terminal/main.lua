---@diagnostic disable-next-line
assert(fail == nil, "This configuration relies on fail == nil")

local options = require("onion27-config.terminal.options")

if options.retro_mode() then
  vim.cmd([[set termguicolors&]])
  vim.cmd([[set guicursor=n-v-c-i:block]])
end

vim.o.background = "dark"

vim.g.onedark_config = {
  style = "darker",
}

-- Theme Setup

for k, v in pairs(require("onion27-config.terminal.theme-setup.theme-overrides")) do
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = k,
    callback = v,
  })
end

vim.cmd { cmd = "colorscheme", args = { options.THEME } }

-- Theme Setup end

-- Other setups

for _, tweak in ipairs(options.TWEAKS) do
  local ok, error = pcall(require, "onion27-config.terminal.tweaks." .. tweak)
  if not ok then
    vim.notify("Cannot load tweak " .. tweak .. ": " .. error, vim.log.levels.ERROR)
  end
end

-- Language Setup
for _, tweak in ipairs(options.LANGUAGES) do
  local ok, error = pcall(require, "onion27-config.terminal.languages." .. tweak)
  if not ok then
    vim.notify("Cannot setup language " .. tweak .. ": " .. error, vim.log.levels.ERROR)
  end
end

-- Neovide Setup
if vim.g.neovide then
  require("onion27-config.terminal.gui.neovide")
end

-- Firenvim Setup
if vim.g.started_by_firenvim then
  require("onion27-config.terminal.gui.firenvim")
end
