" Start search from the current file directory
let g:ctrlp_working_path_mode = 'c'

if has("win32")
    let g:ctrlp_user_command = 'dir %s /-n /b /a-d'
else
    let g:ctrlp_user_command = 'find %s -maxdepth 1 -type f'
endif

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>m :CtrlPBuffer<CR>

" Just disable the default ctrlp mapping. Miniyank is mapped to it.
let g:ctrlp_map = ''
