
function! SlimuxPost_clojure(target_pane)
    call system("tmux send-keys -t " . a:target_pane . " KPEnter")
endfunction
