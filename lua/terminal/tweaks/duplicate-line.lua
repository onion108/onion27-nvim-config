vim.keymap.set("n", "gl", "m0yyp`0j", {silent = true})

local function register_keybind()
    local wk = require("which-key")
    wk.add({
        { "gl", desc = "Duplicate line" }
    })
end

pcall(register_keybind)

