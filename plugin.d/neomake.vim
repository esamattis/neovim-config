
" run neomake on save
autocmd! BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = []
let g:neomake_jsx_enabled_makers = []

call system('which eslint')
if  v:shell_error == 0
    call add(g:neomake_javascript_enabled_makers, 'eslint')
    call add(g:neomake_jsx_enabled_makers, 'eslint')
endif

call system('which flow')
if  v:shell_error == 0
    call add(g:neomake_javascript_enabled_makers, 'flow')
    call add(g:neomake_jsx_enabled_makers, 'flow')
endif

let s:is_mac = 0


" http://stackoverflow.com/a/2842811
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let s:is_mac = 1
  endif
endif

if !s:is_mac
    " Be crude and assume that only mac can handle neovim default "⚠" for
    " warnings
    let g:neomake_warning_sign = {
        \   'text': 'w',
        \   'texthl': 'NeomakeWarningSign',
        \ }
endif

