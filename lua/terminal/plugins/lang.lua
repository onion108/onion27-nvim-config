return {
    { "neoclide/coc.nvim", branch = "release" },

    { "sheerun/vim-polyglot", lazy = false },
    { "udalov/kotlin-vim", ft = "kotlin" },
    { "ARM9/arm-syntax-vim", ft = "arm" },
    { "maxbane/vim-asm_ca65", ft = "asm_ca65" },
    { "ollykel/v-vim", ft = { "v", "vlang" } },
    { "kaarmu/typst.vim", ft = { "typst" }, lazy = false },
    { "ziglang/zig.vim", lazy = true, ft = "zig" },
    { "PyGamer0/vim-apl", lazy = true, ft = "apl" },
    { "drmingdrmer/vim-indent-lua", ft = "lua" },
    { "Airbus5717/c3.vim", ft = "c3" },

    -- {{{ Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "cpp",
                    "lua",
                    "html",
                    "xml",
                    "commonlisp",
                },
                sync_install = false,
                highlight = { enable = false },
                indent = { enable = true },
            })
        end
    },
    -- }}}

    -- {{{ Autotag
    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false
                },
            })
        end
    }
    -- }}}


}
