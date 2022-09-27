local map = require('pjones.keymap')

map.nmap("<leader><cr>", ":noh<CR>", { silent = true })

map.nnoremap("<C-p>", ":Files<CR>")

map.nnoremap("<leader>q", ":tabnew ~/buffer")
map.nnoremap("<leader>x", ":tabnew ~/buffer.md")

map.xnoremap("<leader>p", '"_dP')
map.xnoremap("<leader>d", '"_d')
map.nnoremap("<leader>d", '"_d')
