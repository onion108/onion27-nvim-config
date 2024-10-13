local exports = {}

---@param mode string|string[] Mode short-name, see |nvim_set_keymap()|.
---                            Can also be list of modes to create mapping on multiple modes.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? vim.keymap.set.Opts
---@param description string
function exports.define_keymap(mode, lhs, rhs, description, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
    pcall(function()
        local wk = require("which-key")
        wk.add({{lhs, desc = description}})
    end)
end

return exports

