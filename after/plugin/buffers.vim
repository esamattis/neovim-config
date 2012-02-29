
function! SaveSess()

    if filereadable('BUFS')
        !rm BUFS
    endif

    bufdo silent !echo :e % >> BUFS
    redraw!

endfunction

function! RestoreSess()
    if filereadable('BUFS')
        !echo && cat BUFS
        if confirm("Load these buffers?", "&Yes\n&No") == 1
            source BUFS
            redraw!
        endif
    endif
endfunction

command SaveSession call SaveSess()

call RestoreSess()
