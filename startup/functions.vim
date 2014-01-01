function! RunCurrentOrLastSpec()
  let g:rspec_command = DecoratedSpecCommand(SpecCommand(0))
  call RunCurrentSpecFile()
endfunction

function! RunCurrentOrLastSpecWithSpring()
  let g:rspec_command = DecoratedSpecCommand(SpecCommand(1))
  call RunCurrentSpecFile()
endfunction

function! RunCurrentOrLastExampleUnderCursor()
  let g:rspec_command = DecoratedSpecCommand(SpecCommand(0))
  call RunNearestSpec()
endfunction

function! RunCurrentOrLastExampleWithSpringUnderCursor()
  let g:rspec_command = DecoratedSpecCommand(SpecCommand(1))
  call RunNearestSpec()
endfunction

function! SpecCommand(useSpring)
  return a:useSpring ? "spring rspec {spec}" : "bundle exec rspec {spec}"
endfunction

function! DecoratedSpecCommand(command)
  return "!echo " . a:command . " && " . a:command
endfunction

""""""""""""""""""""""""""""""""""""
" c&p'ed from thoughtbots set up
""""""""""""""""""""""""""""""""""""

function! RunCurrentSpecFile()
  if InSpecFile()
    let l:spec = @%
    call SetLastSpecCommand(l:spec)
    call RunSpecs(l:spec)
  else
    call RunLastSpec()
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:spec = @% . ":" . line(".")
    call SetLastSpecCommand(l:spec)
    call RunSpecs(l:spec)
  else
    call RunLastSpec()
  endif
endfunction

function! RunLastSpec()
  if exists("s:last_spec_command")
    call RunSpecs(s:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1 || match(expand("%"), ".feature$") != -1
endfunction

function! SetLastSpecCommand(spec)
  let s:last_spec_command = a:spec
endfunction

function! RunSpecs(spec)
  execute substitute(g:rspec_command, "{spec}", a:spec, "g")
endfunction
