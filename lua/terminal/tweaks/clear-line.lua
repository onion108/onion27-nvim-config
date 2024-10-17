vim.keymap.set("n", "g/", "0d$", {silent = true})

local function register_keybind()
    local wk = require("which-key")
    wk.add({
        { "g/", desc = "Clear line" }
    })
end

pcall(register_keybind)

