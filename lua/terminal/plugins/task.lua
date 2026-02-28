local function get_search_params()
  -- If we have a file open, use its parent dir as the search dir.
  -- Otherwise, use the current working directory.
  local dir = vim.fn.getcwd()
  if vim.bo.buftype == "" then
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname ~= "" then
      dir = vim.fn.fnamemodify(bufname, ":p:h")
    end
  end
  return {
    dir = dir,
    filetype = vim.bo.filetype,
  }
end

return {
  {
    "stevearc/overseer.nvim",
    dependencies = { { "folke/snacks.nvim" } },
    ---@module 'overseer'
    ---@type overseer.SetupOpts
    opts = {
      task_win = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    config = function(_, opts)
      local overseer = require("overseer")
      local overseer_win = require("overseer.window")
      overseer.setup(opts)

      Snacks.toggle({
        name = "Task List",
        get = function()
          return overseer_win.is_open()
        end,
        set = function(enabled)
          if enabled then
            overseer_win.open()
          else
            overseer_win.close()
          end
        end,
        wk_desc = {
          disabled = "Open ",
          enabled = "Close ",
        },
      }):map("<leader>tt")
    end,
    keys = {
      {
        "<leader>rs",
        ":OverseerShell<CR>",
        desc = "Run Shell Command",
      },
      {
        "<leader>rt",
        function()
          local template = require("overseer.template")

          --- @param tmpl overseer.TemplateDefinition
          local function format_template(tmpl)
            local title
            if tmpl.desc then
              title = string.format("%s (%s)", tmpl.name, tmpl.desc)
            else
              title = tmpl.name
            end
            return title
          end

          local search_opts = get_search_params()

          template.list(search_opts, function(tmpls)
            Snacks.picker.pick {
              items = vim.tbl_map(function(tmpl)
                return vim.tbl_extend("keep", tmpl, { text = format_template(tmpl) })
              end, tmpls),
              format = function(item)
                local title = ""
                if item.desc then
                  title = string.format("%s (%s)", item.name, item.desc)
                else
                  title = item.name
                end
                return { { title, virtual = false } }
              end,
              preview = function()
                return false
              end,
              layout = { preset = "vscode", hidden = { "preview" } },
              confirm = function(self, item)
                local build_opts = {
                  params = {},
                  search = search_opts,
                }
                self:close()
                ---@diagnostic disable-next-line
                template.build_task(item, build_opts, function(_, task)
                  if task then
                    task:start()
                  else
                    vim.notify(string.format("Failed to start task %s", item.name), vim.log.levels.ERROR)
                  end
                end)
              end,
            }
          end)
        end,
        desc = "Run Task",
      },
    },
    lazy = false,
  },
}
