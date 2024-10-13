set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab " convert tab to space
set shiftwidth=4
set autoindent
set number
filetype plugin indent on
syntax on
set mouse=a
set cursorline
set clipboard=unnamedplus
set ttyfast
set foldmethod=marker
set cino=m1,l1,j1,(0,ws,Ws
"set guicursor=n-v-c-i:block

" tender Setups
if (has("termguicolors"))
    set termguicolors
endif

" File type detection
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
au BufNewFile,BufRead *.m set filetype=objc

lua require('common.main')
if exists('g:vscode')
    lua require('vscode.main')
else
    lua require('terminal.main')
endif

augroup ColorSchemeModify
    autocmd!
    autocmd User LazyLoad highlight link cErrInParen NONE
    autocmd User LazyLoad highlight link cErrinBracket NONE
    autocmd User LazyLoad highlight! link CocMenuSel PmenuSel
    autocmd User LazyLoad hi CocInlayHint ctermbg=247 guifg=#000000 guibg=#999999
augroup END


