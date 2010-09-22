" Influences from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://nvie.com/posts/how-i-boosted-my-vim/


" Cool plugins installed
" http://github.com/msanders/snipmate.vim
" http://www.vim.org/scripts/script.php?script_id=1234
" http://github.com/scrooloose/nerdcommenter
" http://github.com/mileszs/ack.vim
" + more
"
" Not installed, but seems cool http://github.com/rstacruz/sparkup
" Investegate! 


colorscheme peachpuff

syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set ai
set modeline

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

"work together to highlight search results (as you type). It’s really quite
"handy, as long as you have the next line as well.
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

" Execute file being edited
map <F5> :! %:p <CR>

" Some aliases
command W w
command Q q
command WQ wq
command Wq wq

" :MM to save and make
command MM w|make


" Cooler tab completion for vim commands
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list


" Folding
set foldmethod=indent     
set foldlevel=9999        " initially open all folds
command FoldAll set foldlevel=0
command FoldOne set foldlevel=1


if has("python")
    set statusline=%<%f\ %{TagInStatusLine()}\ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
else
    set statusline=%<%f\ \ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
endif
set laststatus=2 


" python stuff
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``


" php
autocmd FileType php set omnifunc=phpcomplete#CompletePHP



" Hilight long lines
autocmd BufRead *.md,*.txt,*.py,*.cgi :let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
autocmd BufRead *.md,*.txt,*.py,*.cgi :let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)




" Plugins
filetype plugin on

"JSlint
"let g:JSLintHighlightErrorLine = 0

" Clojure 
let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let g:clj_paren_rainbow=1           " Rainbow parentheses'!





"" Leader mappings
let mapleader = ","

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"  to reselect the text that was just pasted so I can perform commands (like
"  indentation) on it
nnoremap <leader>v V`]

"" Window management
" new vertical split
nnoremap <leader>w :vertical sp<CR>
" new horizontal split
nnoremap <leader>wh :sp<CR>

" Easily move between split windows using <leader>jkll
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Easily resize split windows
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>

" Ack 
" http://betterthangrep.com/
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack


" tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <leader>p :tabprevious<CR>

" Move by screen lines instead of file line. Nice with long lines.
nnoremap j gj
nnoremap k gk

" Learn mode!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
