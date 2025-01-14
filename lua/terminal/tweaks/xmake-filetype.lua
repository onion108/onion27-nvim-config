-- Correct file type for Xmake config file.

local termbuf_group = vim.api.nvim_create_augroup("XmakeTypeCorrection", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" }, {
        group = termbuf_group,
        pattern = "xmake.lua",
        callback = function(event)
            vim.bo.filetype = "xmake"
            vim.bo.syntax = "lua"
        end
    }
)

