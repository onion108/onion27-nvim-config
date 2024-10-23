vim.notify("Enhanced nvim configurations with Lua 💪", vim.log.levels.INFO)

require("common.load-lazy")

local options = require("common.options")

for _, tweak in ipairs(options.TWEAKS) do
    local ok = pcall(require, "common.tweaks." .. tweak)
    if not ok then
        vim.notify("Cannot load tweak " .. tweak, vim.log.levels.ERROR)
    end
end


