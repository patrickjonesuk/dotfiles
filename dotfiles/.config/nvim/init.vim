source ~/.vimrc " include default vimrc

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/kyazdani42/nvim-web-devicons' " Developer Icons
Plug 'https://github.com/kyazdani42/nvim-tree.lua' " NerdTree alternative
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar

Plug 'https://github.com/ap/vim-css-color' " CSS Colour Preview
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion

Plug 'https://github.com/mg979/vim-visual-multi', {'branch': 'master'} " CTRL + N for multiple cursors

Plug 'https://github.com/LunarWatcher/auto-pairs'
Plug 'https://github.com/tpope/vim-fugitive' " Git plugin

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'glepnir/dashboard-nvim'

Plug 'dracula/vim', {'as': 'dracula'}

Plug 'pjones123/kotlin-vim'
Plug 'jparise/vim-graphql'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

for f in split(glob('~/.config/local-vim-plugins/*'), '\n') " local system-specific plugins
    Plug f
endfor

set encoding=UTF-8

call plug#end()

lua require 'nvim-tree-setup'
lua require 'nvim-treesitter-setup'

let g:dashboard_default_executive='fzf.vim'

colorscheme dracula
set termguicolors

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

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

nnoremap <C-s> :Files<CR>
nnoremap <C-t> :NvimTreeFindFile<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



