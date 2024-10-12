local termbuf_group = vim.api.nvim_create_augroup("TermBufConfiguration", { clear = true })

vim.api.nvim_create_autocmd(
    { "TermOpen" }, {
        group = termbuf_group,
        pattern = "*",
        callback = function(event)
            vim.bo.filetype = "terminal"
        end
    }
)

vim.api.nvim_create_autocmd(
    { "BufEnter" }, {
        group = termbuf_group,
        pattern = "*",
        callback = function(event)
            if vim.bo.buftype == "terminal" then
                vim.bo.filetype = "terminal"
            end
        end
    }
)

