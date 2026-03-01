require("onion27-config.common.main")
if vim.fn.exists("g:vscode") ~= 0 then
  require("onion27-config.vscode.main")
else
  require("onion27-config.terminal.main")
end

