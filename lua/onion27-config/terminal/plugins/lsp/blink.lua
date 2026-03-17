return {
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
            ---@diagnostic disable-next-line: unused-local
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
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
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
    "saghen/blink.pairs",
    dependencies = "saghen/blink.download",
    build = "cargo build --release",
    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        -- you can call require("blink.pairs.mappings").enable()
        -- and require("blink.pairs.mappings").disable()
        -- to enable/disable mappings at runtime
        enabled = true,
        cmdline = true,
        -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
        -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
        disabled_filetypes = {},
        -- see the defaults:
        -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
        pairs = {},
      },
      highlights = {
        enabled = false,
      },
      debug = false,
    },
  },
}
