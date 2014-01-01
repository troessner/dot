" General settings
set showmatch
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
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
set list listchars=eol:¬
" Turn on syntax highlighting
syntax on
" Indentation settings
set autoindent
" Highlight search results
set hls
" Autodetect file types
filetype plugin on
" set leader key to comma
let mapleader = ","
" Highlight settings when selecting text
hi Visual cterm=reverse term=reverse
" Enable pasting from external applications like a web browser
set pastetoggle=<F3>

set modifiable

" Needed for autoclose to work, see https://github.com/tpope/vim-endwise/issues/25
autocmd FileType ruby,eruby :let g:AutoCloseExpandEnterOn=""
