return {
     
    -- {{{ Scratch Buffer 
    {
        "https://git.sr.ht/~swaits/scratch.nvim",
        config = function()
            require("scratch").setup({
                buffer_name = "[SCRATCH]"
            })

            local keymap = require("common.utils.keymap")
            keymap.define_keymap("n", "<leader>bs", "<cmd>Scratch<cr>", "Open Scratch Buffer", {silent = true})
        end
    },
    -- }}}

    -- {{{ NeoTree
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
    -- }}}

    -- {{{ which-key
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opt = {},
        lazy = true
    },
    -- }}}

    -- {{{ ToggleTerm
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup {
                insert_mappings = false,
                open_mapping = [[<leader>ot]]
            }
        end,
        lazy = true,
        cmd = {
            "ToggleTerm",
            "TermExec"
        },
    },
    -- }}}

    -- {{{ telescope
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        opts = {
                extensions = {
                    coc = {
                        theme = 'ivy',
                        prefer_locations = true,
                        push_cursor_on_edit = true,
                        timeout = 3000
                    }
                }
            }
        },
    -- }}}

    -- {{{ nvim-telescope
    {
        "fannheyward/telescope-coc.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        lazy = true,
    },
    -- }}}

    { "ryanoasis/vim-devicons", lazy = false },
    { "honza/vim-snippets", lazy = true },
    { "mhinz/vim-startify" },
    { "jiangmiao/auto-pairs", event = "BufRead" },
    { "Pocco81/auto-save.nvim" },
    { "folke/todo-comments.nvim", event = "BufRead" },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "vim-airline/vim-airline-themes", lazy = false },
    { "vim-airline/vim-airline", lazy = false },
    { "lewis6991/gitsigns.nvim", lazy = false },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "romgrk/barbar.nvim" },
    { "edluffy/hologram.nvim", lazy = true },
    { "petertriho/nvim-scrollbar" },
}


