" Simple sessions for Vim
"
" https://github.com/epeli/vimconfig/blob/master/after/plugin/buffersessions.vim
"
" (c) Esa-Matti Suuronen <esa-matti@suuronen.org>
"
" Default Vim session management tries to be too clever. I want just to save a
" list of open buffers.
"
" Usage:
" Use :SaveSession to save buffer list to BUFS file in the current working
" directory. Vim will now open that list of buffers when the file is found
" from the directory where Vim is launched. It will be read only if Vim is
" called without any arguments
"
" Installation:
" Put this file to ~/.vim/after/plugin/
"

let g:SessionAutoSave = 0

function! SaveSess()

    if filereadable('BUFS')
        !rm BUFS
    endif

    " Save buffer list to BUFS file in cwd
    bufdo silent !echo :e % >> BUFS

    " Command spawning messes up Vim for some reason. Fix it.
    redraw!

    let g:SessionAutoSave = 1

endfunction

" TODO: requires too many enter presses
function! RestoreSess()
    if filereadable('BUFS') && argv() == []
        !echo && cat BUFS
        if confirm("Load these buffers?", "&Yes\n&No") == 1
            source BUFS
            redraw!
            let g:SessionAutoSave = 1
        endif
    endif
endfunction

command SaveSession call SaveSess()

call RestoreSess()

autocmd VimLeave *
\ if g:SessionAutoSave |
\   exe "SaveSession" |
\ endif
