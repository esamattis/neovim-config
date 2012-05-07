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
"
"
let g:pathogen_disabled = []

" Disable command-t if it is broken
if filereadable($HOME . '/.vim/bundle/command-t/disable')
   call add(g:pathogen_disabled, 'command-t')
else
    " Search buffers with Command-T
    nnoremap <Leader>, :CommandTBuffer<CR>

    " Use separate working directory for Command-T instead of Vim's cwd.  Use
    " CommandTSetWorkingDirectory to reset the dir to cwd of Vim.
    command CommandTSetWorkingDirectory let g:CommandTWorkingDirectory = getcwd()
    CommandTSetWorkingDirectory " Set up initially

    " remove easy :call EasyMotionT(0, 0)<CR>
    au VimEnter *  unmap <Leader>t
    au VimEnter * map <Leader>t :exec  "CommandT" . g:CommandTWorkingDirectory  <CR>
endif

" Activate all plugins from the bundle
" call pathogen#runtime_append_all_bundles()
call pathogen#infect('~/.vim/bundle')


"" Leader mappings
let mapleader = ","

set ai
set modeline
set wildignore=*.swp,*.bak,*.pyc,*.class,eggs,develop-eggs,*.egg-info,*~,node_modules

" Improves smoothness of redrawing when there are multiple windows and the
" terminal does not support a scrolling region.
set ttyfast


set t_Co=256
colorscheme default


syntax on
filetype on
filetype plugin on


" Use smart indenting
set smarttab expandtab autoindent

" By default use 4 spaces as indentation
set tabstop=4 shiftwidth=4 softtabstop=4



" Show margin column
if exists('+colorcolumn')
    set colorcolumn=80
endif




" Command for resetting tab width
command -nargs=1 TabWidth setlocal shiftwidth=<args> tabstop=<args> softtabstop=<args>



" CSS properties and classes often use dash in their names. Add it to word
" match then.
au FileType css,jade,stylus,less,scss,handlebars,html,coffee setlocal iskeyword+=-


" Makefiles and gitconfig require tab
au FileType make,gitconfig setlocal noexpandtab



" set custom file types
au BufNewFile,BufRead *.zcml  setfiletype xml
au BufNewFile,BufRead *.pt  setfiletype xml
au BufNewFile,BufRead *.coffee  setfiletype coffee
au BufNewFile,BufRead *.cson  setfiletype coffee
au BufNewFile,BufRead *.json setfiletype json
au BufNewFile,BufRead *.ru setfiletype ruby
au BufNewFile,BufRead *.conf setfiletype conf
au BufNewFile,BufRead *.pde setfiletype arduino
au BufNewFile,BufRead *.jade setfiletype jade

" TODO: why does modula2 overrides this?
au BufNewFile,BufRead *.md setfiletype markdown
au BufNewFile,BufRead *.markdown setfiletype markdown





" My status lines
" set statusline=%<%f%y\ \ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P
" With Syntastic
set statusline=%<%f%y\ %#warningmsg#%{SyntasticStatuslineFlag()}%{fugitive#statusline()}%*\ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P


" Show error signs on left
let g:syntastic_enable_signs=1
" Shortcut for Syntastic error panel
nnoremap <leader>e :Errors<CR>


" Show statusline always
set laststatus=2


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


" Write the old file out when switching between files
set autowrite




" Some crazy insert mode overrides
""""""""""""""""""""""""""""""""""
" Map escape key to jj -- much faster to exit insert mode
imap jj <esc>



" Start window scrolling n lines before hitting the edge
set scrolloff=3

" Make Y behave like other capitals. Yank to end of line.
map Y y$


" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" Bubble single lines
" http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup " enable backup








" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif




" Search and replace
""""""""""""""""""""
" This turns off Vim’s crazy default regex characters and makes searches use
" normal regexes.
nnoremap / /\v
vnoremap / /\v


" Word scouting
" Hilight all words matching the one under the cursor and mark the position to
" 'p'. Return to original word with <Leader><Space>
noremap <Space> mp*N
noremap  <Leader><Space> 'p \| :noh<cr>
" Same for visual mode selection too
vmap <Space> mpy/<C-r>"<cr>

" Simple word refactoring shortcut. Hit <Leader>r<new word> on a word to
" refactor it. Navigate to more matches with `n` and `N` and redo refactoring
" by hitting the dot key.
noremap <Leader>r mp*Nciw

" Clear search hilights
noremap  å :noh<cr><esc>

" Join lines from below too. See :help J
map K kJ


" work together to highlight search results (as you type). It’s really quite
" handy, as long as you have the next line as well.
set incsearch
set showmatch
set hlsearch

" * Search & Replace
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase


" Search for selected text, forwards
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" and backwards
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


" Buffersaurus
" Show jump list of all search matches in all buffers
map <Leader>b :Bsgrep <c-r>/<cr>


" Apply  substitutions globally on lines. For example, instead of
" :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you
" want (when was the last time you wanted to only replace the first occurrence
" of a word on a line?) and if you need the previous behavior you just tack on
" the g again.
set gdefault


"" Better command-line editing
"Makes C-j & C-k scroll back/forward in history in command-line mode, and
"makes C-a & C-e act as Home/End in command-line mode.
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-ö> <Home>
cnoremap <C-ä> <End>



" Pasting
"""""""""
" Jump directly to insert mode with paste using F2 key
map <F2> :set paste<CR>i
imap <F2> <ESC>:set paste<CR>i<Right>

" Always disable paste mode when leaving insert mode
au InsertLeave * set nopaste




" Show trailing whitespace characters
set list
set listchars=tab:▸—,trail:·,extends:…,nbsp:␣


" Show soft wrapped lines as …
set showbreak=↳
" set showbreak=⌞ " alternative

" Activate soft wrap by words
command! -nargs=* WrapText set wrap linebreak nolist
command! -nargs=* WrapCode set wrap linebreak list


" Some aliases for typoists
command W w
command Q q
command WQ wq
command Wq wq
command Qa qa
command QA qa
command Wa wa
command WA wa
command E e
nnoremap ; :
vnoremap ; :
nnoremap _ :
vnoremap _ :




" :MM to save and make
command MM wall|make

" Show unsaved changes
command ShowUnsaved w !diff -u % -



" Cooler tab completion for vim commands
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list


" Folding
"set foldmethod=indent
set foldlevel=9999        " initially open all folds
command FoldAll set foldlevel=0
command FoldOne set foldlevel=1




" Use Q for formatting the current paragraph (or selection).
" Forces 80 character lines.
vmap Q gq
nmap Q gqap


" Makes Caps Lock work as Esc. X only.
command XEscToCapsLock !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'





" strip all trailing whitespace in the current file
nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<cr>'z



"  to reselect the text that was just pasted so I can perform commands (like
"  indentation) on it
nnoremap <leader>v V`]



"" Window management

" Easily resize split windows with Ctrl+hjkl
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>



"" Macros-fu

" Invoke a certain macro
noremap § @
" Invoke last macro
noremap - @@


" Extend movement keys. Ö and ö will move to begining of the line and ä and Ä
" to end.
map ö ^
map Ä g_
vmap ö ^
vmap Ä g_
map Ö 0
map ä $
vmap Ö 0
vmap ä $



" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Reset messed up Vim. Redraw screen, clear search hilights and balance window
" splits
map <F5> :redraw! \| :noh \| <cr><c-w>=



" Open file tree
map <Leader>n :LustyFilesystemExplorer<CR>
" Open bufexplorer
map <Leader>m :LustyBufferExplorer <CR>
" Opens filesystem explorer at the directory of the current file
map <Leader>f :LustyFilesystemExplorerFromHere <CR>
" Opens buffer grep
map <Leader>g :LustyBufferGrep <CR>



" Move by screen lines instead of file line. Nice with long lines.
nnoremap j gj
nnoremap k gk




" Easily change directory to the file being edited.
nmap <Leader>cd :cd %:p:h<CR>




" diff will be opened automatically after the git commit.
autocmd FileType gitcommit DiffGitCached | wincmd p

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'





" spell checking
set spelllang=en_us
" Toggle spelling
nmap <silent> <leader>S :set spell!<CR>
" Always spellcheck Git commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!

" If we're running Vim 7.3 or newer, enable persistent undo and tell vim were
" to store the undo files.
if version >= 703
    set undofile
    set undodir=~/.vim/undos
endif



" CoffeeScript
""""""""""""""

" Indent after if else etc
autocmd BufRead,BufNewFile *.coffee set smartindent cinwords=if,else,for,while,try,loop,class,it

au FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2


"" Use ,c to compile selected text to corresponding output and print it to stdout
map <leader>c :CoffeeCompile<CR>
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>

" Hilight `==` operator with red in CoffeeScript. Always use `is` instead of it.
au BufNewFile,BufRead,BufEnter *.coffee syntax match BrightRed "=="
hi BrightRed ctermfg=7 ctermbg=1


" :C<line number>
" Compile CoffeeScript buffer and open it in scratch buffer on given line
" number
command -nargs=1 C CoffeeCompile | :<args>




" Ruby
""""""
autocmd BufRead,BufNewFile *.rb set smartindent cinwords=if,else,for,while,begin,class,do

" Ruby uses 2 spaces as indentation
au FileType ruby,haml,eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2



" Python
""""""""
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``




" Remove crappy key mappings set by plugings.
" Protip: Search for bad plugings with :verbose imap <c-n>
"
" :BufExplorerVerticalSplit<CR>
au VimEnter * unmap <Leader>bv
" :BufExplorerHorizontalSplit<CR>
au VimEnter * unmap <Leader>bs
" :BufExplorer<CR>
au VimEnter * unmap <Leader>be
" BClose
au VimEnter * unmap <Leader>bd


" LustyExplorer
au VimEnter * unmap <Leader>lf
au VimEnter * unmap <Leader>lb
au VimEnter * unmap <Leader>lj
au VimEnter * unmap <Leader>lg
au VimEnter * unmap <Leader>lr


" Slimux key map
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>



" NeoComplCache config
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1


" Open snippet file of the filetype currently being edited
command SnippetsEdit execute "edit ~/.vim/bundle/snipmate-snippets/snippets/" . &ft . ".snippets"

" Edir shortcut for this config
command Vimrc e ~/.vim/vimrc


"" Local Vim configuration
""""""""""""""""""""""""""

" Load load it always on startup
if filereadable($HOME . "/.vim/localrc")
    source $HOME/.vim/localrc
endif

" Edit shortcut
command Localrc e ~/.vim/localrc

" Reload local config always when saved.
autocmd BufWritePost $HOME/.vim/localrc source $HOME/.vim/localrc

" File type is vim
autocmd BufReadPost $HOME/.vim/localrc setfiletype vim

" Seed it with localrc.default when created
autocmd BufNewFile $HOME/.vim/localrc setfiletype vim | read $HOME/.vim/localrc.default


