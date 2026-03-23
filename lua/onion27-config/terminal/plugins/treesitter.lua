return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
      indent = {
        "xml",
      },
      exclude_ft = { "blink-cmp-menu", "notify", "noice", "fidget", "dashboard", "snacks_dashboard" },
    },
    config = function(_, opts)
      local nvim_ts = require("nvim-treesitter")

      nvim_ts.setup {
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      }

      -- {{{ Install bunch of parsers
      nvim_ts.install {
        "rust",
        "c",
        "d",
        "c_sharp",
        "haskell",
        "json",
        "json5",
        "objc",
        "v",
        "vala",
        "vim",
        "zig",
        "cpp",
        "lua",
        "html",
        "xml",
        "commonlisp",
        "nu",
        "kdl",
        "typescript",
        "tsx",
        "javascript",
        "vue",
      }
      -- }}}

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(ev)
          local lang = ev.match
          if vim.list_contains(opts.exclude_ft, lang) then
            return
          end
          if vim.list_contains(nvim_ts.get_installed(), lang) then
            vim.schedule(function()
              pcall(vim.treesitter.start, ev.buf)
              -- Treesitter indent seems to be not mature yet.
              if vim.tbl_contains(opts.indent, lang) then
                if vim.treesitter.query.get(lang, "indents") then
                  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                else
                  vim.notify(
                    "Language list in indent " .. lang .. " doesn't support Treesitter indentation. ",
                    vim.log.levels.WARN
                  )
                end
              end
            end)
          else
            if vim.list_contains(nvim_ts.get_available(), lang) then
              nvim_ts.install({ lang }):await(function()
                pcall(vim.treesitter.start, ev.buf)
              end)
            end
          end
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      move = {
        set_jumps = true,
      },
    },
    -- {{{ Fucking Keybinds
    keys = {
      {
        "<leader>sn",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
        end,
        mode = "n",
        desc = "Swap with next parameter",
      },
      {
        "<leader>sp",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
        end,
        mode = "n",
        desc = "Swap with previous parameter",
      },
      {
        mode = { "n", "x", "o" },
        desc = "Next method (treesitter)",
        "]m",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
      },
      {
        mode = { "n", "x", "o" },
        desc = "Next class (treesitter)",
        "]]",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
        end,
      },
      {
        mode = { "n", "x", "o" },
        desc = "Next method end (treesitter)",
        "]M",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end,
      },
      {
        mode = { "n", "x", "o" },
        desc = "Next class end (treesitter)",
        "][",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
        end,
      },

      {
        mode = { "n", "x", "o" },
        desc = "Previous method (treesitter)",
        "[m",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
      },
      {
        mode = { "n", "x", "o" },
        desc = "Previous class (treesitter)",
        "[[",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
        end,
      },

      {
        mode = { "n", "x", "o" },
        desc = "Previous method end (treesitter)",
        "[M",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end,
      },
      {
        mode = { "n", "x", "o" },
        desc = "Previous class end (treesitter)",
        "[]",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
        end,
      },

      {
        mode = { "n", "x", "o" },
        desc = "Next conditional (treesitter)",
        "]c",
        function()
          require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
        end,
      },
      {
        mode = { "n", "x", "o" },
        desc = "Previous conditional (treesitter)",
        "[c",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
        end,
      },
    },
    -- }}}
    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)
    end,
  },
}
