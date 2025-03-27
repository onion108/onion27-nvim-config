local url = require("common.utils.url")

local function virtual_text_document(params)
    local bufnr = params.buf
    local actual_path = params.match:sub(1)

    local clients = vim.lsp.get_clients({ name = "csharp_ls" })
    if #clients == 0 then
        return
    end

    local client = clients[1]
    local req_params = { timeout = 5000, textDocument = { uri = url.urldecode(actual_path) } }
    local result, err = client:request_sync("csharp/metadata", req_params, 10000, 0)
    if not err and result ~= nil then
        local lines = vim.split(result.result.source, "\n")
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
        vim.api.nvim_set_option_value("readonly", true, { buf = bufnr })
        vim.api.nvim_set_option_value("modified", false, { buf = bufnr })
        vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
        vim.api.nvim_buf_set_name(bufnr, actual_path)
        vim.lsp.buf_attach_client(bufnr, client.id)

        local filetype = "cs"
        vim.api.nvim_set_option_value("filetype", filetype, { buf = bufnr })
    end
end

vim.api.nvim_create_autocmd({ "BufReadCmd" }, {
    pattern = { "csharp:/*" },
    callback = virtual_text_document,
})
