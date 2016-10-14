
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
