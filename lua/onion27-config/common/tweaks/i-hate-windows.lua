if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.api.nvim_echo({
    {
      "No. We won't allow this configuration to run on this fucking shitty and awful operating system. Use Linux or macOS if you want to run.",
    },
  }, true, {})
  os.exit(69)
end
