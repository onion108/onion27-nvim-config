local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
    vim.notify("Cannot load toggleterm.nvim", vim.log.levels.ERROR)
    return
end

local last_compilation_command = nil

vim.api.nvim_create_user_command("Compile", function (args)
    local compilation_command
    if args.args == nil or (string.gsub(args.args, "^%s*(.-)%s*$", "%1")):len() == 0 then
        if last_compilation_command == nil then
            vim.notify("No recent compilation command found", vim.log.levels.ERROR)
            return
        end
            compilation_command = last_compilation_command
    else
        compilation_command = args.args
    end
    if not args.bang then
        last_compilation_command = compilation_command
    end

    toggleterm.exec(compilation_command)
end, {
    nargs = "?",
    bang = true,
    complete = "shellcmdline"
})


