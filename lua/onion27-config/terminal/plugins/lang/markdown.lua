return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "OXY2DEV/markview.nvim",
    dependencies = { "saghen/blink.cmp", "mini.icons" },
    --- @module 'markview'
    --- @type markview.config
    opts = {
      preview = {
        enable = false,
        icon_provider = "mini",
      },
    },
    config = function(_, opts)
      require("markview").setup(opts)
      local action = require("markview.actions")
      local state = require("markview.state")
      Snacks.toggle({
        name = "Markview",
        get = function()
          local bufnr = vim.api.nvim_get_current_buf()
          if state.buf_attached(bufnr) == false then
            return false
          end
          if state.get_splitview_source() == bufnr then
            return false
          end

          local buf_state = state.get_buffer_state(bufnr)
          if not buf_state then
            return false
          end
          return buf_state.enable
        end,
        set = function(enabled)
          local bufnr = vim.api.nvim_get_current_buf()
          if state.buf_attached(bufnr) == false then
            return
          end
          if state.get_splitview_source() == bufnr then
            return
          end

          local buf_state = state.get_buffer_state(bufnr)
          if not buf_state then
            return
          end
          if enabled then
            action.enable(bufnr)
          else
            action.disable(bufnr)
          end
        end,
      }):map("<leader>tm")
    end,
    lazy = false,
  },
}
