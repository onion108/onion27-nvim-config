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
