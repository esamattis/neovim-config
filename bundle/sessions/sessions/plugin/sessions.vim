" sessions.vim: Sessions in project dir are auto saved
" Last modified: 2010-06-30
" Version:       0.1
" Author:        Edson César <edsono@gmail.com>
" Maintainers:   Edson César <edsono@gmail.com>,
"                Hallison Batista <hallison.batista@gmail.com>
" License:       This script is released under the Vim License.

if exists("g:sessions_loaded")
  finish
endif
let g:sessions_loaded = 1

function sessions#ProjectsPath()
  if !exists("g:sessions_project_path")
    let g:sessions_project_path = "$HOME/code"
  endif
  return expand(g:sessions_project_path)
endfunction

function sessions#SessionsPath()
  if !exists("g:sessions_path")
    let g:sessions_path = "$HOME/.vim/sessions"
  endif
  return expand(g:sessions_path)
endfunction

if !isdirectory(sessions#SessionsPath())
  call mkdir(sessions#SessionsPath())
endif

function sessions#ProjectAttributes(index)
  for path in split(sessions#ProjectsPath(), ':')
    let matches = matchlist(getcwd(), path . '/\(\(\w\|\-\)\+\)')
    if !empty(matches)
      return matches[a:index]
    else
      continue
    endif
  endfor
  return ""
endfunction

function sessions#ProjectPath() 
  return sessions#ProjectAttributes(0)
endfunction

function sessions#ProjectName()
  return sessions#ProjectAttributes(1)
endfunction

function sessions#IsProject()
  return !empty(sessions#ProjectName()) && !empty(sessions#ProjectPath())
endfunction

function sessions#ProjectSessionFile()
  if sessions#IsProject()
    return sessions#SessionsPath() . "/" . sessions#ProjectName() . ".vim"
  endif
  return ""
endfunction

function sessions#IsProjectPath()
  return !empty(sessions#ProjectPath())
endfunction

function sessions#IsNotException()
  return !(match(expand("%"), "\.git\/COMMIT") >= 0) " Git commit message
endfunction

function! sessions#LoadSession()
  if sessions#IsProjectPath() && argc() == 0
    silent! execute "source " . sessions#ProjectSessionFile()
  endif
endfunction

function! sessions#SaveSession()
  if sessions#IsProjectPath() && sessions#IsNotException()
    silent! execute "mksession! " . sessions#ProjectSessionFile()
  endif
endfunction

autocmd VimEnter              * :call sessions#LoadSession()
autocmd VimLeave,BufWritePost * :call sessions#SaveSession()

