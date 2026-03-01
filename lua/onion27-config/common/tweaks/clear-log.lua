local log_dir = vim.fn.stdpath("log")
local LOGS_TO_CLEAR = {
  "lsp.log",
  "noice.log",
  "nvim.log",
  "telescope.log",
}

local LOG_CLEAR_THRESHOLD = 500 * 1024

for _, log in ipairs(LOGS_TO_CLEAR) do
  local stat = vim.uv.fs_stat(log_dir .. "/" .. log)
  if stat and stat.size >= LOG_CLEAR_THRESHOLD then
    vim.fs.rm(log_dir .. "/" .. log)
    vim.notify("Clear " .. log .. " with size " .. tostring(stat.size), "info")
  end
end
