return {
    {
        "saghen/blink.cmp",
        build = "cargo +nightly build --release",
        opts = {
            keymap = {
                preset = "default",
                ["<CR>"] = { "select_and_accept", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<Esc>"] = { "hide", "fallback" },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = {
                implementation = "rust",
                prebuilt_binaries = {
                    download = true,
                },
            },
        },
    },


    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            {'saghen/blink.cmp'}, {"Decodetalkers/csharpls-extended-lsp.nvim"}, { "nvim-telescope/telescope.nvim" }
        },
        opts = {
            servers = {
                clangd = {
                    cmd = { "clangd", "-header-insertion=never" }
                },
                gopls = {},
                rust_analyzer = {
                    settings = {
                        ['rust-analyzer'] = {
                            procMacro = {
                                enable = true
                            },
                            updates = {
                                checkOnStartup = false
                            }
                        }
                    }
                },
                zls = {},
                java_language_server = {},
                lua_ls = {},
                pyright = {},
                kotlin_language_server = {},
                neocmake = {},
                powershell_es = {
                    bundle_path = vim.fn.expand("$HOME/Workspace/Programming/third-party/pwsh-es/PowerShellEditorServices")
                },
                denols = {
                    settings = {
                        deno = {
                            inlayHints = {
                                parameterNames = { enabled = "literals" },
                                variableTypes = { enabled = true },
                                functionLikeReturnTypes = { enabled = true },
                            }
                        }
                    }
                },
                csharp_ls = {
                    handlers = {
                        ["textDocument/definition"] = function(...) require("csharpls_extended").handler(...) end,
                        ["textDocument/typeDefinition"] = function(...) require("csharpls_extended").handler(...) end,
                    },
                },
                v_analyzer = {},
                vala_ls = {},
                serve_d = {},
                c3_lsp = {},
            },
            extra_servers = {
                haskell = {
                    cmd = { "haskell-language-server-wrapper", "--lsp" },
                    filetypes = { 'hs', 'lhs', 'haskell', 'lhaskell' },
                    root_markers = { ".stack.yaml", ".hie-bios", "BUILD.bazel", "cabal.config", "package.yaml", "*.cabal" },
                },
                glsl = {
                    cmd = { "glsl_analyzer" },
                    filetypes = { "glsl" },
                },
                typst = {
                    cmd = { "typst-lsp" },
                    filetypes = { "typst" },
                },
            },
        },
        config = function(_, opts)
            local config = require('lspconfig')
            local icons = require("common.utils.icons")
            local key = require("common.utils.keymap")
            local signs = {
                { name = "DiagnosticSignError", text = icons.diagnostics.Error },
                { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
                { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
                { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
            }
            vim.diagnostic.config {
                virtual_text = { prefix = icons.ui.VirtualPrefix, current_line = true },

                signs = {
                    active = signs,
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
            end


            for server, lsconfig in pairs(opts.servers) do
                lsconfig.capabilities = require('blink.cmp').get_lsp_capabilities(lsconfig.capabilities)
                config[server].setup(lsconfig)
            end

            for server, lsconfig in pairs(opts.extra_servers) do
                lsconfig.capabilities = require('blink.cmp').get_lsp_capabilities(lsconfig.capabilities)
                vim.lsp.config[server] = lsconfig
                vim.lsp.enable(server)
            end

            key.define_keymap("n", "<leader>ti", function ()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "Toggle Inlay Hint", { silent = true })
            require("telescope").load_extension("csharpls_definition")
        end
    },
    { "Decodetalkers/csharpls-extended-lsp.nvim", lazy = false },
}
