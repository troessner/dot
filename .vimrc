""""""""""""""""""""""""""""""""""""""""""
"   Vundle set up
""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

Bundle 'ervandew/supertab'
Bundle 'Townk/vim-autoclose'

" Yes, this needs to end with 'vim', see: https://github.com/gmarik/vundle/issues/152
Bundle 'taglist.vim'
Bundle 'molokai'
Bundle 'godlygeek/tabular'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'tpope/vim-abolish'
Bundle 'elixir-lang/vim-elixir'

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""
" load up
""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/startup/color.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/functions.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/hacks.vim

" Prolog needs some special treatment to be recognised by vim.
au BufNewFile,BufRead,BufReadPost *.pro set filetype=prolog

""""""""""""""""""""""""""""""""""""""""""
"  Stuff that doesnt work properly yet
""""""""""""""""""""""""""""""""""""""""""

" TODO everything below doesnt work when I put it in my settings file when it clearly should - fix me please?
" Syntastic set up
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1

" TODO This doesnt work anymore when I put the lines below in my settings file
" when it clearly should -> fix me.
" Show us trailing whitespace, we don't want that garbage in our source code
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" This only works if placed at the very end of the vimrc so I'm probably
" setting this somewhere else but I have zero clue where.:-/
hi StatusLine ctermbg=7 ctermfg=16
