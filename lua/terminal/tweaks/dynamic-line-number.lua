local number_toggle_group = vim.api.nvim_create_augroup("DynamicLineNumber", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave" }, {
        pattern = "*",
        callback = function(event)
            local buf = event.buf
            if not vim.o.number then return end
            if string.sub(vim.api.nvim_get_mode().mode, 1, 1) ~= "i" then
                vim.cmd [[ set relativenumber ]]
            end
        end,
        group = number_toggle_group
    }
)

vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter" }, {
        pattern = "*",
        callback = function(event)
            local buf = event.buf
            if not vim.o.number then return end
            vim.cmd [[ set norelativenumber ]]
        end,
        group = number_toggle_group
    }
)

