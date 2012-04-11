

" CoffeeScript REPL enters multi-line mode with Ctrl+v
function! _PreTmux_coffee(session_name, target_pane)
  call system("tmux send-keys -t " . a:session_name . ":" . a:target_pane . " C-v")
endfunction

" Exit multi-line REPL mode with Ctrl+d
function! _PostTmux_coffee(session_name, target_pane)
  call system("tmux send-keys -t " . a:session_name . ":" . a:target_pane . " C-d")
endfunction

