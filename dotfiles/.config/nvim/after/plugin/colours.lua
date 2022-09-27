vim.g.colourscheme = "dracula"
vim.cmd("colorscheme " .. vim.g.colourscheme)


local dark_colour = '#21222C'
local dark_fg = {
    fg = dark_colour,
}
local dark_highlight = {
    fg = dark_colour,
    bg = dark_colour,
}

require('bufferline').setup({
    options = {
        numbers = "ordinal",
        mode = "tabs",
        diagnostics = "coc",
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = '│',
            },
        },
    },

    highlights = {
        fill = dark_highlight,
        separator = dark_fg,
        separator_selected = dark_fg,
        offset_separator = {
            fg = "#6272A4",
            bg = dark_colour,
        },
    },

})
