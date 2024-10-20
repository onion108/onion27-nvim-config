return {
    { "kvrohit/mellow.nvim", lazy = true },
    { "Mofiqul/vscode.nvim", lazy = true },
    { "navarasu/onedark.nvim", lazy = true },
    { "jacoborus/tender.vim", lazy = true },
    { "dracula/vim", lazy = true },
    { "morhetz/gruvbox", lazy = true },
    { "sainnhe/gruvbox-material", lazy = true },
    { "blazkowolf/gruber-darker.nvim", lazy = true },
    { "m6vrm/gruber.vim", lazy = true },

    -- {{{ Ayu theme
    {
        "Shatur/neovim-ayu",
        lazy = true,
        config = function ()
            local colors = require("ayu.colors")
            colors.generate()
            require("ayu").setup {
                overrides = function() return {
                    LineNr = { fg = "#888888" },
                    CursorLineNr = { fg = colors.accent, bg = colors.line, bold = true },
                    WinSeparator = { fg = "#aaaaaa", bg = colors.bg },
                } end
            }
        end,
    },
    -- }}}

}
