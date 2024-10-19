return {
    { "sheerun/vim-polyglot", lazy = false },
    {"neoclide/coc.nvim", branch = 'release'},
    { "dracula/vim" },
    { "ryanoasis/vim-devicons", lazy = false },
    { "honza/vim-snippets", lazy = true },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            vim.fn.sign_define("DiagnosticSignError", {text = "? ", texthl = "DiagnosticSignError"})
            vim.fn.sign_define("DiagnosticSignWarn", {text = "? ", texthl = "DiagnosticSignWarn"})
            vim.fn.sign_define("DiagnosticSignInfo", {text = "? ", texthl = "DiagnosticSignInfo"})
            vim.fn.sign_define("DiagnosticSignHint", {text = "??", texthl = "DiagnosticSignHint"})

            require("neo-tree").setup({
                default_component_configs = {
                    filesystem = {
                        window = {
                            fuzzy_finder_mappings = {
                                ["<C-j>"] = "move_cursor_down",
                                ["<Tab>"] = "move_cursor_down",
                                ["<C-k>"] = "move_cursor_up",
                                ["<S-Tab>"] = "move_cursor_up"
                            }
                        }
                    }
                }
            })
        end
    },
    {"mhinz/vim-startify"},
    {"jiangmiao/auto-pairs"},
    {"jacoborus/tender.vim"},
    {"Pocco81/auto-save.nvim"},
    {"udalov/kotlin-vim"},
    {"maxbane/vim-asm_ca65"},
    {"ARM9/arm-syntax-vim"},
    {"folke/todo-comments.nvim"},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim"},
    {"vim-airline/vim-airline"},
    {"vim-airline/vim-airline-themes"},
    {"lewis6991/gitsigns.nvim"},
    {"nvim-tree/nvim-web-devicons"},
    {"romgrk/barbar.nvim"},
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },


    -- Colorschemes
    {'kvrohit/mellow.nvim'},
    { 'Mofiqul/vscode.nvim'},
    { 'navarasu/onedark.nvim'},
    { 'ollykel/v-vim'},
    {'kaarmu/typst.vim', ft = {'typst'}},
    { 'morhetz/gruvbox'},
    { 'sainnhe/gruvbox-material'},
    { "akinsho/toggleterm.nvim", version = '*', config = function()
        require("toggleterm").setup {
            insert_mappings = false,
            open_mapping = [[<leader>ot]]
        }
        end
    },
    {'ziglang/zig.vim', lazy = true},
    {'PyGamer0/vim-apl'},
     { 'wellle/context.vim' },
     { 'edluffy/hologram.nvim' },
     { 'petertriho/nvim-scrollbar' },
    {"blazkowolf/gruber-darker.nvim"},
    {"m6vrm/gruber.vim"},
    {
        "https://git.sr.ht/~swaits/scratch.nvim",
        config = function()
            require("scratch").setup({
                buffer_name = "[SCRATCH]"
            })
            local wk = require("which-key")
            vim.keymap.set("n", "<leader>bs", "<cmd>Scratch<cr>", {silent=true})
            wk.add({
                { "<leader>bs", desc = "Open Scratch Buffer" }
            })
        end
    },
    {'drmingdrmer/vim-indent-lua'}
}


