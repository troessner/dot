set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set background=dark 
hi Visual cterm=reverse term=reverse
map <F2> :NERDTreeToggle<CR>
map ,# :call CommentLineToEnd('#')<CR>+
set list
set number
set noautoindent
syntax on
filetype plugin on
let mapleader = ","
