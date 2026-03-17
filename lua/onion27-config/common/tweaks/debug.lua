local M = {}
vim.api.nvim_create_user_command("DbgBufs", function(_)
  local buflist = vim.api.nvim_list_bufs()
  local message = ""
  for i = 1, #buflist do
    message = message
      .. "bufnr="
      .. tostring(buflist[i])
      .. ", buflisted="
      .. tostring(vim.bo[buflist[i]].buflisted)
      .. "\n"
  end
  require("notify").notify(message, vim.log.levels.INFO, { title = "Debug Message" })
end, {})
vim.api.nvim_set_keymap("i", "<C-s>", "v:lua.require'onion27-config.common.tweaks.debug'.debug_map()", {
  expr = true,
})

M.debug_map = function()
  return vim.api.nvim_replace_termcodes("<cr>}<cmd>normal! ====<CR><up><end><CR>", true, true, true)
end

return M
