if vim.fn.has("nvim-0.13") ~= 1 then
  vim.notify(
    "Your nvim is too fucking old but we decided to spare you because you fucking ass don't know how to upgrade to the fucking nightly. We don't guarantee this shit will fucking work on your poor fucking old nvim instance! Good luck.",
    vim.log.levels.WARN
  )
end
