return {

    -- {{{ Scratch Buffer 
    {
        "LintaoAmons/scratch.nvim",
        event = "VeryLazy",
        dependencies = {
            { "nvim-telescope/telescope.nvim" }
        },
        config = function ()
            require("scratch").setup {
                file_picker = "telescope",
                scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim",
                window_cmd = "edit",
                use_telescope = true,
                filetypes = {
                    "js",
                    "ts",
                    "lua",
                    "c",
                    "cc",
                    "txt"
                }
            }
        end,
        keys = {
            { "<leader>bs", "<cmd>Scratch<cr>", desc = "Create Scratch File", mode = "n" },
            { "<leader>bo", "<cmd>ScratchOpen<cr>", desc = "Open Scratch File", mode = "n" }
        },
        hooks = {
            {
                -- TODO: How to correct barbar? 
                callback = function ()
                    vim.schedule(function ()
                        vim.cmd [[ Neotree toggle ]]
                        vim.cmd [[ Neotree toggle ]]
                    end)
                end,
            },
        },
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

    -- {{{ coc-telescope
    {
        "fannheyward/telescope-coc.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        lazy = true,
    },
    -- }}}

    --{{{ LazyGit
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    --}}}

    { "ryanoasis/vim-devicons", lazy = false },
    { "honza/vim-snippets", lazy = true },
    { "mhinz/vim-startify" },
    { "jiangmiao/auto-pairs", lazy = false },
    { "Pocco81/auto-save.nvim" },
    { "folke/todo-comments.nvim", event = {"BufRead", "BufEnter"} },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "vim-airline/vim-airline-themes", lazy = false },
    { "vim-airline/vim-airline", lazy = false },
    { "lewis6991/gitsigns.nvim", lazy = false },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "romgrk/barbar.nvim" },
    { "edluffy/hologram.nvim", lazy = true },
    { "petertriho/nvim-scrollbar" },
}


