
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}

require('treesitter-context').setup({
    enable = true,
    max_lines = 0,
    patterns = {
        default = {
            "function",
            "class",
        }
    },
})
