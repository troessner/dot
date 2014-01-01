" Unmap the arrow keys
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

"I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" short cuts
map <F9> '. " Jump to last edit location within the same file
map <leader>t   :call RunCurrentOrLastSpec()<cr>
map <leader>ts  :call RunCurrentOrLastSpecWithSpring()<cr>
map <leader>tc  :call RunCurrentOrLastExampleUnderCursor()<cr>
map <leader>tcs :call RunCurrentOrLastExampleWithSpringUnderCursor()<cr>

" unmap F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" nerdtree setup
map <F2> :NERDTreeToggle<CR>

" Dont overwrite our yank register with what you just overwrote in visual mode
xnoremap p pgvy

" Remove all trailing whitespace by pressing F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" vim taglist plugin shortcuts
map <F4> :TlistToggle<CR>

" shortcut for 'git status'
map <leader>gs :Gstatus<CR>
