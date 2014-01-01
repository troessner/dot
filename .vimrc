" Pathogen set up
call pathogen#infect()
call pathogen#helptags()
" load up
source ~/.vim/startup/settings.vim
source ~/.vim/startup/functions.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/color.vim
" TODO everything below doesnt work when I put it in my settings file when it clearly should - fix me please?
" Syntastic set up
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1

" TODO This doesnt work anymore (it does when I c&p it into command mode)
" Show us trailing whitespace, we don't want that garbage in our source code
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
