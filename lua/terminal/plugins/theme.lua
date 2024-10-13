return {
    { "kvrohit/mellow.nvim", lazy = true },
    { "Mofiqul/vscode.nvim", lazy = true },
    { "navarasu/onedark.nvim", lazy = true },
    { "jacoborus/tender.vim", lazy = true },
    { "dracula/vim", lazy = true },
    { "morhetz/gruvbox", lazy = true },
    { "sainnhe/gruvbox-material", lazy = true },
    { "m6vrm/gruber.vim", lazy = true },
    { "arzg/vim-colors-xcode", lazy = true },

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
                    NormalFloat = { bg = "#181818" },
                    CocSemTypeTypeParameter = { link = "Type" }
                } end
            }
        end,
    },
    -- }}}

    -- {{{ Gruber darker
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = true,
        opts = {
            italic = {
                strings = false,
                comments = false,
                operators = false,
                folds = false,
            },
        }
    },
    -- }}}

}
