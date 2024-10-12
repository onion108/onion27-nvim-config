local exports = {}

function exports.load(use)
    use 'sheerun/vim-polyglot'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'dracula/vim'
    use 'ryanoasis/vim-devicons'
    use 'honza/vim-snippets'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        requires = {
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
    }
    use 'mhinz/vim-startify'
    use 'jiangmiao/auto-pairs'
    use 'jacoborus/tender.vim'
    use 'Pocco81/auto-save.nvim'
    use 'udalov/kotlin-vim'
    use 'maxbane/vim-asm_ca65'
    use 'ARM9/arm-syntax-vim'
    use 'folke/todo-comments.nvim'
    use 'lvimuser/lsp-inlayhints.nvim'
    use "nvim-lua/plenary.nvim"
    use 'nvim-telescope/telescope.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'romgrk/barbar.nvim'
    use {
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
    }


    -- Colorschemes
    use 'kvrohit/mellow.nvim'
    use 'haoyu953/pride.vim'
    use 'Mofiqul/vscode.nvim'
    use 'navarasu/onedark.nvim'
    use 'ollykel/v-vim'
    use {'kaarmu/typst.vim', ft = {'typst'}}
    use 'morhetz/gruvbox'
    use 'sainnhe/gruvbox-material'
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup {
            insert_mappings = false,
            open_mapping = [[<leader>ot]]
        }
        end
    }
    use 'ziglang/zig.vim'
    use 'PyGamer0/vim-apl'
    --use {'nvim-treesitter/nvim-treesitter-context', config = function()
        --require('treesitter-context').setup {
            --enable = true,
        --}
        --end
    --}
    use { 'wellle/context.vim' }
    use { 'edluffy/hologram.nvim' }
    use { 'petertriho/nvim-scrollbar' }
    use "blazkowolf/gruber-darker.nvim"
    use "m6vrm/gruber.vim"
    use { 
        "https://git.sr.ht/~swaits/scratch.nvim",
        config = function()
            require("scratch").setup()
        end
    }
end

return exports

