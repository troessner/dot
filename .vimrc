" Pathogen set up
call pathogen#infect()
" syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
" nerdtree setup
map <F2> :NERDTreeToggle<CR>
" Needed for autoclose to work, see https://github.com/tpope/vim-endwise/issues/25
autocmd FileType ruby,eruby :let g:AutoCloseExpandEnterOn=""
" My color scheme of choice
let moria_style = 'white'
colo moria
" Tab settings: We want soft tabs with an indentation of 2.
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Make vi shell behave more like command prompt
set shellcmdflag=-ic
" Show line numbers
set number
" Show special characters in the file.
set list
" Turn on syntax highlighting
syntax on
" Use smart indentation
set smartindent
" Highlight search results
set hls
" Autodetect file types
filetype plugin on
" Add additional mappings for e.g. nerdcommenter
let mapleader = ","
" Show us trailing whitespace, we don't want that garbage in our source code
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" Highlight settings when selecting text
hi Visual cterm=reverse term=reverse
" Enable pasting from external applications like a web browser
set pastetoggle=<F3>

" Custom functions
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
xnoremap p pgvy
" Remove all trailing whitespace by pressing F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" vim taglist plugin shortcuts
map <F4> :TlistToggle<CR>
" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!spring rspec {spec}"
