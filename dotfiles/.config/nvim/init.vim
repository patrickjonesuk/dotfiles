source ~/.vimrc " include default vimrc
" PLUGINS

call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Colour Preview
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/jiangmiao/auto-pairs' " auto-close
Plug 'https://github.com/tpope/vim-fugitive' " Git plugin
Plug 'https://github.com/EvanQuan/vim-executioner' " Run file
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'dracula/vim', {'as': 'dracula'}

set encoding=UTF-8

call plug#end()

" Plugin cfg

colorscheme dracula
set termguicolors

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> dy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)



nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

" Functions

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! RunFile()
    exec "w"
    let l:fname = expand("%")
    if &filetype == 'c'
        exec "TerminalSplit gcc % -o " . fname . "<"
        exec "TerminalSplit time ./" . fname . "<"
    elseif &filetype == 'cpp'
        exec "TerminalSplit g++ % -o " . fname . "<"
        exec "TerminalSplit time ./" . fname . "<"
    elseif &filetype == 'java'
        exec "TerminalSplit javac %"
        exec "TerminalSplit time java " . fname
    elseif &filetype == 'sh'
        exec "TerminalSplit time bash " . fname
    elseif &filetype == 'python'
        exec "TerminalSplit time python3 " . fname
    elseif &filetype == 'html'
        exec "TerminalSplit google-chrome " . fname . " &"
    elseif &filetype == 'go'
        exec "TerminalSplit go build %<"
        exec "TerminalSplit time go run " . fname
    elseif &filetype == 'matlab'
        exec "TerminalVSplit time octave " . fname
    endif
endfunc



