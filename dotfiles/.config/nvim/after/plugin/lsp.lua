local map = require('pjones.keymap')


map.nnoremap("gd", "<Plug>(coc-definition)", { silent = true })

map.nmap("dy", "<Plug>(coc-type-definition)", { silent = true })
map.nmap("gi", "<Plug>(coc-implementation)", { silent = true })
map.nmap("gr", "<Plug>(coc-references)", { silent = true })


map.nmap("<leader>rn", "<Plug>(coc-rename)", { silent = true })
map.nmap("<leader>ca", "<Plug>(coc-codeaction-cursor)", { silent = true })

map.xnoremap("<leader>f", "<Plug>(coc-format-selected)")
map.nnoremap("<leader>f", "<Plug>(coc-format-selected)")

map.nnoremap("K", "<Cmd>lua _G.show_docs()<CR>", { silent = true })


map.inoremap("<c-space>", "coc#refresh()", { silent = true, expr = true })


-- map.inoremap("<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { silent = true, expr = true })
map.inoremap("<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', { expr = true })

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
       vim.cmd('h ', cw) 
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.cmd('!' .. vim.o.keyordprg .. ' ' .. cw)
    end
end
