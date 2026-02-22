local options = require("terminal.options")

if options.retro_mode() then
  vim.cmd([[set termguicolors&]])
  vim.cmd([[set guicursor=n-v-c-i:block]])
end

vim.o.background = "dark"

vim.g.onedark_config = {
  style = "darker",
}

-- Theme Setup

for k, v in pairs(require("terminal.theme-setup.theme-overrides")) do
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = k,
    callback = v,
  })
end

require("terminal.theme-setup.mellow-setup")
require("terminal.theme-setup.gruvbox-material-setup")

if options.THEME == "vscode" then
  local c = require("vscode.colors").get_colors()

  require("vscode").setup {
    transparent = false,
    italic_comments = true,
    disable_nvimtree_bg = true,
    color_overrides = {
      --vscLineNumber = "#FFFFFF",
    },
  }

  require("vscode").load()
elseif options.THEME == "devcpp" then
  require("theme.devcpp")
else
  vim.cmd { cmd = "colorscheme", args = { options.THEME } }
end

-- Theme Setup end

-- Other setups

require("todo-comments").setup()

for _, tweak in ipairs(options.TWEAKS) do
  local ok, error = pcall(require, "terminal.tweaks." .. tweak)
  if not ok then
    vim.notify("Cannot load tweak " .. tweak .. ": " .. error, vim.log.levels.ERROR)
  end
end

-- Language Setup
require("terminal.languages.zig")
require("terminal.languages.apl")
require("terminal.languages.lua")
require("terminal.languages.lean")

-- Neovide Setup
if vim.g.neovide then
  require("terminal.gui.neovide")
end

-- Firenvim Setup
if vim.g.started_by_firenvim then
  require("terminal.gui.firenvim")
end

-- scrollbar setup
require("scrollbar").setup()
