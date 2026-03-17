return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "saghen/blink.cmp" },
    { "Decodetalkers/csharpls-extended-lsp.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "folke/snacks.nvim" },
  },
  opts = {
    servers = {
      gdscript = {},
      vtsls = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = "/usr/lib/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
                  languages = { "vue" },
                  configNamespace = "typescript",
                },
              },
            },
          },
        },
        filetypes = { "vue" },
      },
      vue_ls = {},
      clangd = {
        cmd = { "clangd", "-header-insertion=never" },
        single_file_support = true,
      },
      ocamllsp = {},
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
            require("onion27-config.terminal.linemsg").set_message(result.message)
          end,
        },
      },
      lua_ls = {},
      ty = {},
      ruff = {
        --- @param client vim.lsp.Client
        attach_handler = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      },
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
        root_dir = function(bufnr, on_dir)
          local root_markers = { "deno.lock" }
          root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
            or vim.list_extend(root_markers, { ".git" })
          local project_root = vim.fs.root(bufnr, root_markers)
          on_dir(project_root or vim.fn.getcwd())
        end,
        single_file_support = true,
        trace = "verbose",
      },
      csharp_ls = {
        cmd = { "csharp-ls" },
        capabilities = {
          experimental = {
            csharp = {
              metadataUris = true,
            },
          },
        },
        get_language_id = function(_, ft)
          if ft == "cs" then
            return "csharp"
          end
          return ft
        end,
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
      fortls = {},
      racket_langserver = {
        filetypes = { "racket" },
      },
    },
  },
  config = function(_, opts)
    vim.lsp.semantic_tokens.enable(false)
    --vim.lsp.log.set_level(vim.log.levels.TRACE)
    local icons = require("onion27-config.common.utils.icons")
    local key = require("onion27-config.common.utils.keymap")
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

    local attach_handlers = {}
    for server, lsconfig in pairs(opts.servers) do
      lsconfig.capabilities = require("blink.cmp").get_lsp_capabilities(lsconfig.capabilities)

      if lsconfig.attach_handler then
        attach_handlers[server] = lsconfig.attach_handler
        lsconfig.attach_handler = nil
      end

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

    key.define_keymap({ "n", "v" }, "grf", function()
      vim.lsp.buf.format()
    end, "Format document", { silent = true })
    -- This is already defined in most of filetypes, but redefined to avoid ftplugin rewriting the keybind
    key.define_keymap({ "n", "v" }, "K", function()
      vim.lsp.buf.hover()
    end, "Hover Symbol", { silent = true })
    key.define_keymap("n", "<leader>od", function()
      vim.diagnostic.setqflist()
      vim.cmd([[copen]])
    end, "Open diagnostics", { silent = true })
    Snacks.toggle.diagnostics():map("<leader>td")
    Snacks.toggle.inlay_hints():map("<leader>ti")

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end

        if attach_handlers[client.name] then
          attach_handlers[client.name](client)
        end
      end,
    })
  end,
}
