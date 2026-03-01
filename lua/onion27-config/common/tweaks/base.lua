vim.o.compatible = false
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.mouse = "v"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.number = true
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.ttyfast = true
vim.o.foldmethod = "marker"
vim.o.cino = "m1,l1,j1,(0,ws,Ws,t0" -- )
vim.o.foldopen = "jump,mark,quickfix,search,tag"
vim.o.exrc = true

if vim.o.termguicolors then
  vim.o.termguicolors = true
end

