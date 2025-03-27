local options = require("terminal.options")

if options.retro_mode() then
    vim.cmd [[set termguicolors&]]
    vim.cmd [[set guicursor=n-v-c-i:block]]
end

vim.o.mopt = "wait:1000,history:5000"


vim.o.background = 'dark'

vim.g.onedark_config = {
    style = 'darker'
}


-- Theme Setup

require("terminal.theme-setup.mellow-setup")
require("terminal.theme-setup.gruvbox-material-setup")


if options.THEME == "vscode" then

    local c = require('vscode.colors').get_colors()

    require('vscode').setup({
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
            --vscLineNumber = "#FFFFFF",
        }
    })

    require('vscode').load()

elseif options.THEME == 'devcpp' then

    require('theme.devcpp')

else

    vim.cmd({ cmd = 'colorscheme', args = { options.THEME } })

end

-- Theme Setup end

require('terminal.barbar')

-- Other setups

require("todo-comments").setup()

for _, tweak in ipairs(options.TWEAKS) do
    local ok = pcall(require, "terminal.tweaks." .. tweak)
    if not ok then
        vim.notify("Cannot load tweak " .. tweak, vim.log.levels.ERROR)
    end
end

-- Language Setup
require("terminal.languages.zig")
require("terminal.languages.apl")
require("terminal.languages.lua")

-- Neovide Setup
if vim.g.neovide then
    require("terminal.neovide")
end

-- context.vim setup
vim.g.context_highlight_normal = 'PMenu'
vim.g.AutoPairsMapCR = 0

-- scrollbar setup
require("scrollbar").setup()

