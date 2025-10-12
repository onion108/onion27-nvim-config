return {
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },

  {
    "saghen/blink.cmp",
    build = "cargo +nightly build --release",
    opts = {
      completion = {
        accept = { auto_brackets = { enabled = true } },
      },
      cmdline = {
        completion = {
          menu = {
            auto_show = function(ctx)
              return vim.fn.getcmdtype() == ":"
            end,
          },
          ghost_text = { enabled = true },
        },
      },
      keymap = {
        preset = "default",
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
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
      { "saghen/blink.cmp" },
      { "Decodetalkers/csharpls-extended-lsp.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      servers = {
        gdscript = {},
        clangd = {
          cmd = { "clangd", "-header-insertion=never" },
          single_file_support = true,
        },
        gopls = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = {
                enable = true,
              },
              updates = {
                checkOnStartup = false,
              },
            },
          },
        },
        zls = {},
        jdtls = {
          single_file_support = true,
          handlers = {
            -- TODO: Show something on lualine, maybe?
            ["language/status"] = function(_, result)
              require("terminal.linemsg").set_message(result.message)
            end,
          },
        },
        lua_ls = {},
        pyright = {},
        kotlin_lsp = {},
        neocmake = {},
        powershell_es = {
          bundle_paths = {
            vim.fn.expand("$HOME/Workspace/Programming/third-party/pwsh-es/PowerShellEditorServices"),
            "/opt/powershell-editor-services",
          },
        },
        denols = {
          settings = {
            deno = {
              inlayHints = {
                parameterNames = { enabled = "literals" },
                variableTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
              },
              internalDebug = true,
            },
          },
          single_file_support = true,
          trace = "verbose",
        },
        csharp_ls = {
          --cmd = { "/home/onion27/Programming/Projects/CSharpLSPWork/csharp-language-server/src/CSharpLanguageServer/bin/Debug/net9.0/CSharpLanguageServer" },
        },
        v_analyzer = {
          filetypes = { "v", "vsh", "vv", "vlang" },
          single_file_support = true,
          init_options = {},
          trace = "verbose",
        },
        vala_ls = {
          single_file_support = false,
        },
        serve_d = {},
        c3_lsp = {},
        sourcekit = {
          filetypes = { "swift" },
          single_file_support = true,
        },
        jsonls = {},
        fsautocomplete = {},
      },
      extra_servers = {
        haskell = {
          cmd = { "haskell-language-server-wrapper", "--lsp" },
          filetypes = { "hs", "lhs", "haskell", "lhaskell" },
          root_markers = {
            ".stack.yaml",
            ".hie-bios",
            "BUILD.bazel",
            "cabal.config",
            "package.yaml",
            "*.cabal",
          },
        },
        glsl = {
          cmd = { "glsl_analyzer" },
          filetypes = { "glsl" },
        },
        typst = {
          cmd = { "tinymist" },
          filetypes = { "typst" },
        },
      },
    },
    config = function(_, opts)
      vim.lsp.semantic_tokens.enable(false)
      --vim.lsp.log.set_level(vim.log.levels.TRACE)
      local config = require("lspconfig")
      local icons = require("common.utils.icons")
      local key = require("common.utils.keymap")
      local signs = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      }
      vim.diagnostic.config {
        virtual_text = { prefix = icons.ui.VirtualPrefix, current_line = false },

        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
          },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
      end

      for server, lsconfig in pairs(opts.servers) do
        lsconfig.capabilities = require("blink.cmp").get_lsp_capabilities(lsconfig.capabilities)

        ---@diagnostic disable-next-line: undefined-field
        if
          server == "clangd"
          and vim.uv.os_uname().sysname == "Darwin"
          and vim.uv.os_gethostname() == "QZKago-Requiem.local"
        then
          -- Only set on my machine.
          lsconfig.cmd[1] = "/opt/homebrew/opt/llvm/bin/clangd"
        end

        if server == "powershell_es" then
          ---@type string[]
          local paths = lsconfig.bundle_paths
          local found = false
          lsconfig.bundle_paths = nil
          for _, v in ipairs(paths) do
            if vim.fn.isdirectory(v) == 1 then
              lsconfig.bundle_path = v
              found = true
              break
            end
          end
          if not found then
            require("fidget").notify("Cannot find path for PowerShellEditorServices", vim.log.levels.WARN)
          end
        end

        vim.lsp.config(server, lsconfig)
        vim.lsp.enable(server)
      end

      for server, lsconfig in pairs(opts.extra_servers) do
        lsconfig.capabilities = require("blink.cmp").get_lsp_capabilities(lsconfig.capabilities)
        vim.lsp.config[server] = lsconfig
        vim.lsp.enable(server)
      end

      key.define_keymap("n", "<leader>ti", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, "Toggle Inlay Hint", { silent = true })
      key.define_keymap("n", "<leader>fd", function()
        vim.diagnostic.open_float()
      end, "Check diagnostic", { silent = true })
      key.define_keymap({ "n", "v" }, "grf", function()
        vim.lsp.buf.format()
      end, "Format document", { silent = true })
      key.define_keymap("n", "<leader>od", function()
        vim.diagnostic.setqflist()
        vim.cmd([[copen]])
      end, "Open diagnostics", { silent = true })
      require("telescope").load_extension("csharpls_definition")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "Decodetalkers/csharpls-extended-lsp.nvim",
    lazy = false,
    config = function()
      require("csharpls_extended").buf_read_cmd_bind()
    end,
  },
  {
    --dir = "~/Workspace/Programming/Projects/outline.nvim",
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>oo", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
  {
    "Chaitanyabsprip/fastaction.nvim",
    opts = {},
    config = function(_, opt)
      require("fastaction").setup(opt)
      vim.keymap.set(
        { "n", "x" },
        "gra",
        '<cmd>lua require("fastaction").code_action()<CR>',
        { desc = "Display code actions" }
      )
      vim.keymap.set(
        { "n", "x" },
        "grA",
        '<cmd>lua require("fastaction").code_action({ select_first = true })<CR>',
        { desc = "Select and apply first code action" }
      )
    end,
  },
}
