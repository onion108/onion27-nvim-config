local options = {}

-- {{{ Helper functions

function options.retro_mode()
    return os.getenv("TERM_PROGRAM") == "Apple_Terminal" or (os.getenv("TERM_PROGRAM") == "iTerm.app" and (os.getenv("ITERM_PROFILE") == "Retro" or os.getenv("ITERM_PROFILE") == "Retro Colored"))
end

-- }}}

-- Specify the theme to use.
-- Values: "vscode" or other theme names.
options.THEME = "dracula"
--options.THEME = "vscode"

-- Specify the airline theme to use.
options.AIRLINE_THEME = "dracula"

-- Determine if use dynamic line number or not.
-- By turning this on, absolute line numbers will be enabled for insert mode and relative line numbers will be displayed on other modes.
options.DYNAMIC_LINE_NUMBER = true

-- Determine if treat terminal buffer as a filetype.
options.TERMBUF_FILETYPE = true

-- {{{ Modifications

if options.retro_mode() then
    options.THEME = "default"
    options.AIRLINE_THEME = "term"
end

-- }}}

return options

