-- Disable Ctrl-Click to go to definition cuz it's too evil.
vim.keymap.set({ "n", "x", "v" }, "<C-LeftMouse>", "<nop>", { remap = false })

-- Disable F1 because I don't need (and it's super easy to accidentally being pressed)
vim.keymap.set({ "n", "x", "v", "i" }, "<F1>", "<nop>", { remap = false })
