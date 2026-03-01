local M = {}

local message = ""
local message_clear = nil

--- @param msg string
function M.set_message(msg)
  message = msg
  if message_clear ~= nil then
    message_clear:stop()
    message_clear:close()
    message_clear = nil
  end
  message_clear = vim.uv.new_timer()
  if message_clear == nil then
    message = ""
    return
  end
  message_clear:start(3000, 0, function()
    message_clear:stop()
    message_clear:close()
    message = ""
    message_clear = nil
  end)
  local ok, ll = pcall(require, "lualine")
  if ok then
    ll.refresh()
  end
end

--- @return string
function M.get_message()
  return message
end

return M
