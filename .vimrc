" Pathogen set up
call pathogen#infect()
call pathogen#helptags()
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
" General settings
" don't need to be compatible with old vim
set nocompatible
set showmatch
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
" unmap F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
" put useful info in status bar
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
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
" Indentation settings
set autoindent
filetype plugin indent on
" Highlight search results
set hls
" Autodetect file types
filetype plugin on
" set leader key to comma
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
set modifiable
