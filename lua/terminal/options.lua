local options = {}

-- {{{ Helper functions

function options.retro_mode()
    return os.getenv("TERM_PROGRAM") == "Apple_Terminal" or (os.getenv("TERM_PROGRAM") == "iTerm.app" and (os.getenv("ITERM_PROFILE") == "Retro" or os.getenv("ITERM_PROFILE") == "Retro Colored"))
end

-- }}}

-- Specify the theme to use.
-- Values: "vscode" or other theme names.
options.THEME = "bamboo"

-- Specify the airline theme to use.
options.AIRLINE_THEME = "atomic"

-- Enabled tweaks
options.TWEAKS = {
    "compilation-mode",
    "dynamic-line-number",
    "telescope-keybind",
    "right-click-menu",
    "termbuf-filetype",
    "neotree-keybind",
    "v-filetype",
    "c3-filetype",
    "xmake-filetype",
    "c-highlight-correction",
}

-- {{{ Modifications

if options.retro_mode() then
    options.THEME = "default"
    options.AIRLINE_THEME = "term"
end

-- }}}

return options

