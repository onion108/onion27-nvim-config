vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function (use)
    use 'wbthomason/packer.nvim'
    use 'preservim/nerdcommenter'
    if vim.fn.exists("g:vscode") ~= 0 then
        require('vscode.plugins').load(use)
    else
        require('terminal.plugins').load(use)
    end
end)

