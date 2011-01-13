" Influences from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://nvie.com/posts/how-i-boosted-my-vim/


" ProTips to remember:
" diw to delete the current word
" di( to delete within the current parens
" di" to delete the text between the quotes
"
" vt) select everything up to )
" vT( select everything up before (
" f/F is a greedy version
"
" replace d with v to select
"
" replace i with a to select parens also
"
" Surround
" Surround with tag: <select>S<tag>
" Change the surrounding tag: cst<tag>


syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set ai
set modeline
set wildignore=*.swp,*.bak,*.pyc,*.class
colorscheme mydefault

" set custom file types I've configured
au BufNewFile,BufRead *.pt  setf xml

" change the terminal's title
set title

" don't beep
set noerrorbells

" hide buffers instead of closing them
set hidden

" make backspace work like most other apps
set backspace=2


" Vim’s defaults are awful messy, leaving .swp files everywhere if the editor
" isn’t closed properly. This can save you a lot of time.
set nobackup
set noswapfile

" No Vi stuff anymore
set nocompatible



" Apply  substitutions globally on lines. For example, instead of
" :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you
" want (when was the last time you wanted to only replace the first occurrence
" of a word on a line?) and if you need the previous behavior you just tack on
" the g again.
set gdefault




" tab inserts normal tab for makefiles instead of spaces
au BufRead,BufNewFile Makefile* set noexpandtab

" * Search & Replace
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase



" Activate all plugins from the bundle
call pathogen#runtime_append_all_bundles()


" When editing a file in folder under this dir, vim-session will consider a
" project. So it will save sessions when saving and exiting vim.
let g:sessions_project_path = "$HOME/ohjelmointi"




" make vim save and load the folding of the document each time it loads
" also places the cursor in the last place that it was left.
au BufWinLeave * mkview
au BufWinEnter * silent loadview
" TODO: Bug when opening without file


" use :w!! to write to a file using sudo if you forgot to "sudo vim file"
cmap w!! %!sudo tee > /dev/null %

" This turns off Vim’s crazy default regex characters and makes searches use
" normal regexes.
nnoremap / /\v
vnoremap / /\v

" work together to highlight search results (as you type). It’s really quite
" handy, as long as you have the next line as well.
set incsearch
set showmatch
set hlsearch


" Toggle pastemode easily in insert and command mode
set pastetoggle=<F2>


" Show trailing whitespace characters
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.


" Use Q for formatting the current paragraph (or selection).
" Forces 80 character lines.
vmap Q gq
nmap Q gqap


" Execute jslint on save for .js files
if executable("jslint")
    autocmd BufWritePost *.js :!jslint %
endif


" Execute file being edited
map <F5> :! %:p <CR>

" Some aliases
command W w
command Q q
command WQ wq
command Wq wq

" :MM to save and make
command MM wall|make


" Cooler tab completion for vim commands
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list


" Folding
"set foldmethod=indent
set foldlevel=9999        " initially open all folds
command FoldAll set foldlevel=0
command FoldOne set foldlevel=1



" Close buffer without closing window. Requires bclose.vim
command Bc Bclose
command BC Bclose

set statusline=%<%f\ \ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P


" Show statusline always
set laststatus=2


" python stuff
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
let python_highlight_all = 1

" Execute a selection of code (very cool!)
" Use VISUAL to select a range and then hit ctrl-h to execute it.
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange()<CR>


" php
autocmd FileType php set omnifunc=phpcomplete#CompletePHP



" Hilight long lines
autocmd BufRead *.md,*.txt,*.py,*.cgi :let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
autocmd BufRead *.md,*.txt,*.py,*.cgi :let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)





" Plugins
filetype plugin on


" Clojure
let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let g:clj_paren_rainbow=1           " Rainbow parentheses'!



"" Leader mappings
let mapleader = ","
let maplocalleader = ";"



" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" reStructured Text Stuff
" Set heading
nnoremap <leader>rt yypVr


"  to reselect the text that was just pasted so I can perform commands (like
"  indentation) on it
nnoremap <leader>v V`]



"" Window management
" new vertical split
nnoremap <leader>w :vertical sp<CR>

" new horizontal split
nnoremap <leader>wh :sp<CR>

" Easily move between split windows using <leader>hjkl
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Easily resize split windows with Ctrl+hjkl
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>


" Open file tree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Open bufexplorer
nnoremap <Leader>m :BufExplorer<CR>


" Buffer manipulator
nmap <Leader>, :LustyJuggler<CR>
nmap <Leader>fb :FufBuffer<CR>
" open new buffers from the directory where current file is in
nmap <Leader>ff :FufFileWithCurrentBufferDir<CR>

" Move by screen lines instead of file line. Nice with long lines.
nnoremap j gj
nnoremap k gk

" Copy whole file to OS clipboard
nmap <Leader>x :%y+<CR>

" Easily change directory to the file being edited.
nmap <Leader>cd :cd %:p:h<CR>

" Delete last linebreak, leading spaces and trailing spaces
nnoremap <Leader>u I" <C-c>hvk$xh " up
nnoremap <Leader>d jI" <C-c>hvk$xh " Down

" Ack
" http://betterthangrep.com/
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack

" Learn mode!
" Disables arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>


" diff will be opened automatically after the git commit.
autocmd FileType gitcommit DiffGitCached | wincmd p




" Function for reloading snipMate snippets
" http://code.google.com/p/snipmate/issues/detail?id=67#c4
function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
        let filetype = "_"
    else
        let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction
nmap <Leader>rs :call ReloadSnippets(snippets_dir, &filetype)<CR>
