" Dirty hack to prevent 'set cursorline' from slowing down vim significantly
" Stolen from: http://haerench.blogspot.de/2012/12/cursorline-cursorcolumn-and-syntax.html
let g:boostmove=0
set updatetime=50
au CursorMoved * call BoostMoveON()
au CursorMovedI * call BoostMoveON()
au CursorHold * call BoostMoveOFF()
au CursorHoldI * call BoostMoveOFF()
function BoostMoveON()
  if (g:boostmove == 0)
    let g:boostmove=1
    setlocal nocursorline
  endif
endfunction
function BoostMoveOFF()
  if g:boostmove==1
    let g:boostmove=0
    setlocal cursorline
  endif
endfunction
