-- Disable Ctrl-Click to go to definition cuz it's too evil.
vim.keymap.set({'n', 'x', 'v'}, '<C-LeftMouse>', "<nop>", { remap = false })
