local map = require('pjones.keymap')

require'nvim-web-devicons'.setup {
    default = true
}

require'nvim-tree'.setup {

}
map.nnoremap("<C-t>", ":NvimTreeFindFile<CR>")
