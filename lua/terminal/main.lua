local options = require("terminal.options")

if options.retro_mode() then
    vim.cmd [[set termguicolors&]]
    vim.cmd [[set guicursor=n-v-c-i:block]]
end

vim.notify("Enhanced nvim configurations with Lua 💪", vim.log.levels.INFO)

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

vim.g.airline_theme = options.AIRLINE_THEME

-- Theme Setup end

local inlayhintsGroup = vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = inlayhintsGroup,
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
    end
})

require('terminal.coc-config')
require('terminal.barbar')

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            vim.api.nvim_command [[Neotree]]
        end)
    end
})

-- Other setups

require("todo-comments").setup()

if options.DYNAMIC_LINE_NUMBER then
    require("terminal.tweaks.dynamic-line-number")
end
if options.TERMBUF_FILETYPE then
    require("terminal.tweaks.termbuf-filetype")
end
require("terminal.tweaks.duplicate-line")

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

-- scrollbar setup
require("scrollbar").setup()
