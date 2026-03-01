require("onion27-config.common.load-lazy")

local options = require("onion27-config.common.options")

local keymap = require("onion27-config.common.utils.keymap")

for _, tweak in ipairs(options.TWEAKS) do
  local ok = pcall(require, "onion27-config.common.tweaks." .. tweak)
  if not ok then
    vim.notify("Cannot load tweak " .. tweak, vim.log.levels.ERROR)
  end
end

keymap.define_keymap("n", "<BS>", ":nohl<CR>", "Clear highlights", { silent = true })
keymap.define_keymap("n", "ZZ", ":qa<CR>", "Quit Neovim", { silent = true })
keymap.define_keymap("n", "ZQ", ":wqa<CR>", "Quit Neovim with Save", { silent = true })
