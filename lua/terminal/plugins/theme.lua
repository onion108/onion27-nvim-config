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
    {
        "Shatur/neovim-ayu",
        lazy = true,
        config = function ()
            require("ayu").setup {
                overrides = {
                    LineNr = { fg = "#aaaaaa" },
                }
            }
        end,
    },
}
