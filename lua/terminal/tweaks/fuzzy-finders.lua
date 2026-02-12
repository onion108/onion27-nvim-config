local keymap = require("common.utils.keymap")
require("which-key").add { "<leader>f", group = "Fuzzy Finders" }

local success = pcall(function()
  local themes = require("telescope.themes")
  local builtin = require("telescope.builtin")
  keymap.define_keymap(
    "n",
    "<leader>fw",
    "<cmd>Telescope grep_string<cr>",
    "GREP current word using telescope",
    { silent = true }
  )
  keymap.define_keymap("n", "<leader>fs", function()
    builtin.symbols(themes.get_cursor { hidden = true, no_ignore = true, no_ignore_parent = true })
  end, "Find symbol", { silent = true })
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "TelescopeResults" },
    callback = function()
      vim.opt_local.foldenable = false
    end,
  })
end)

if not success then
  vim.notify("Failed to setup telescope keybind", vim.log.levels.ERROR)
end

success = pcall(function()
  local picker = require("snacks").picker
  keymap.define_keymap("n", "<leader>fi", function()
    picker.icons()
  end, "Find icon", { silent = true })
  keymap.define_keymap("n", "<leader><leader>", function()
    picker.keymaps { layout = { preset = "vscode" } }
  end, "Find symbol", { silent = true })
  keymap.define_keymap("n", "<leader>fg", function()
    picker.grep {
      layout = { preset = "telescope" },
    }
  end, "GREP using telescope", { silent = true })
  keymap.define_keymap("n", "<leader>ff", function()
    picker.files {
      layout = { preset = "ivy" },
    }
  end, "Find file", { silent = true })
  keymap.define_keymap("n", "<leader>fF", function()
    picker.files {
      layout = { preset = "ivy" },
      hidden = true,
      ignored = true,
    }
  end, "Find file (all)", { silent = true })
  keymap.define_keymap("n", "<leader>fq", function()
    picker.qflist {
      layout = { preset = "ivy" },
    }
  end, "Find quickfix", { silent = true })
  keymap.define_keymap("n", "<leader>fb", function()
    picker.buffers {
      layout = { preset = "left" },
    }
  end, "Find buffer", { silent = true })
  keymap.define_keymap("n", "<leader>fd", function()
    picker.diagnostics {
      layout = { preset = "ivy" },
    }
  end, "Pick Diagnostics", { silent = true })
  keymap.define_keymap("n", "<leader>fn", function()
    picker.notifications()
    picker.pick()
  end, "Find notifications", { silent = true })
  keymap.define_keymap("n", "<leader>fp", function()
    picker.pickers {
      layout = { preset = "vscode" },
    }
  end, "Find more picker", { silent = true })
end)

if not success then
  vim.notify("Failed to setup snackes keybind", vim.log.levels.ERROR)
end
