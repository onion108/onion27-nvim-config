-- Correct file type for Vlang source file.

local termbuf_group = vim.api.nvim_create_augroup("C3FileTypeCorrection", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" }, {
        group = termbuf_group,
        pattern = "*.c3",
        callback = function(event)
            vim.bo.filetype = "c3"
        end
    }
)
