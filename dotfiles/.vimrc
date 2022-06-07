" General cfg
set number

set ignorecase
set smartcase
set hlsearch
set splitright
set splitbelow

set expandtab " Make sure that we don't accidently use tabs instead of spaces
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set wrap
" new line at 500 chars
set lbr
set tw=500

set showmatch
set mat=2

set ruler

set mouse=a
set cmdheight=1

colorscheme slate

" Misc cfg
set history=500
set autoread
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set lazyredraw
set magic

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position when opening files


" Keybinds
let mapleader = ","
map <silent> <leader><cr> :noh<cr>

command! W execute 'w !sudo tee % > /dev/null' <bar> edit! " shortcut to sudo save file

map <leader>q :tabnew ~/buffer<cr>
" same as above but in markdown format
map <leader>x :tabnew ~/buffer.md<cr> 

map <F5> :call RunFile()<CR>
imap <F5> <Esc>:call RunFile()<CR>
vmap <F5> <Esc>:call RunFile()<CR>

" functions
"
function! HasPaste()
    " Returns true if paste mode is enabled
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" function! RunFile()
"     exec "w"
"     if &filetype == 'c'
"         exec "!gcc % -o %<"
"         exec "!time ./%<"
"     elseif &filetype == 'cpp'
"         exec "!g++ % -o %<"
"         exec "!time ./%<"
"     elseif &filetype == 'java'
"         exec "!javac %"
"         exec "!time java %"
"     elseif &filetype == 'sh'
"         exec "!time bash %"
"     elseif &filetype == 'python'
"         exec "!time python3 %"
"     elseif &filetype == 'html'
"         exec "!google-chrome % &"
"     elseif &filetype == 'go'
"         exec "!go build %<"
"         exec "!time go run %"
"     elseif &filetype == 'matlab'
"         exec "!time octave %"
"     endif
" endfunc


function! RunFile()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "vsp | term ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "vsp | term ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "vsp | term java %"
    elseif &filetype == 'sh'
        exec "vsp | term bash %"
    elseif &filetype == 'python'
        exec "vsp | term python3 %"
    elseif &filetype == 'html'
        exec "!google-chrome % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "vsp | term go run %"
    elseif &filetype == 'matlab'
        exec "vsp | term octave %"
    endif
endfunc


