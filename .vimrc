call pathogen#infect()
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Make vi shell behave more like command prompt
set shellcmdflag=-ic
hi Visual cterm=reverse term=reverse
map <F2> :NERDTreeToggle<CR>
map ,# :call CommentLineToEnd('#')<CR>+
set list
set number
set noautoindent
syntax on
filetype plugin on
let mapleader = ","
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
let moria_style = 'white'
colo moria
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
