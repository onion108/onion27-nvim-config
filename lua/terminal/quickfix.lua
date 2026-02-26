M = {}

function M.is_qfopen()
  local winid = vim.fn.getqflist({ winid = 0 }).winid
  return winid ~= 0
end

return M
