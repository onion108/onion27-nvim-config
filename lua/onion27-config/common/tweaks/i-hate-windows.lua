if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.api.nvim_echo({
    {
      "No. We won't allow this configuration to run on this fucking shitty and awful operating system. Use Linux or macOS if you want to run.",
      "ErrorMsg",
    },
  }, true, {})
  os.exit(69)
end

if vim.fn.has("wsl") == 1 then
  vim.api.nvim_echo({
    {
      "Even if you're using WSL doesn't hide the fact that you're using the fucking shitty and awful niche garbage operating system.",
      "ErrorMsg",
    },
    {
      "Get out of my configuration. Use a proper operating system.",
      "ErrorMsg",
    },
  }, true, {})
  os.exit(69)
end
