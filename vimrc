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



set ai
set modeline
set wildignore=*.swp,*.bak,*.pyc,*.class,eggs,develop-eggs,*.egg-info,*~,node_modules


set t_Co=256
colorscheme default

syntax on
filetype on
filetype plugin on


" Use smart indenting
set smarttab expandtab autoindent

" By default use 4 spaces as indentation
set tabstop=4 shiftwidth=4 softtabstop=4

" Command for resetting tab width
command -nargs=1 TabWidth setlocal shiftwidth=<args> tabstop=<args> softtabstop=<args>

" Ruby uses 2 spaces as indentation
au FileType ruby,haml,eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
" Also for xmly stuff
au FileType html,xml,xhtml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Makefiles and gitconfig require tab
au FileType make,gitconfig setlocal noexpandtab


"" Leader mappings
let mapleader = ","
let maplocalleader = ";"


" set custom file types
au BufNewFile,BufRead *.zcml  setfiletype xml
au BufNewFile,BufRead *.pt  setfiletype xml
au BufNewFile,BufRead *.coffee  setfiletype coffee
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
set statusline=%<%f%y\ %#warningmsg#%{SyntasticStatuslineFlag()}%*\ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P


let g:syntastic_enable_signs=1

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

"Map escape key to jj -- much faster
imap jj <esc>


" Apply  substitutions globally on lines. For example, instead of
" :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you
" want (when was the last time you wanted to only replace the first occurrence
" of a word on a line?) and if you need the previous behavior you just tack on
" the g again.
set gdefault


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





" * Search & Replace
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase





" do not store global and local values in a session
set ssop-=options
" do not store folds
set ssop-=folds

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif


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

" Always disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" Show trailing whitespace characters
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:␣




" Execute file being edited
map <F5> :! %:p <CR>

" Some aliases
command W w
command Q q
command WQ wq
command Wq wq
command Qa qa
command QA qa
command Wa wa
command WA wa




" :MM to save and make
command MM wall|make

" Show unsaved changes
command ShowUnsaved w !diff -u % -

command SessionSave mksession .session.vim
command SessionLoad source .session.vim


" Cooler tab completion for vim commands
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list


" Folding
"set foldmethod=indent
set foldlevel=9999        " initially open all folds
command FoldAll set foldlevel=0
command FoldOne set foldlevel=1




" python stuff
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``





" Hilight long lines
command LongLinesShow let w:m1=matchadd('Search', '\%<81v.\%>77v', -1) | let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
command LongLinesHide call matchdelete(w:m1) | call matchdelete(w:m2)
autocmd BufRead,BufNewFile *.md,*.txt,*.py,*.cgi :LongLinesShow

" Use Q for formatting the current paragraph (or selection).
" Forces 80 character lines.
vmap Q gq
nmap Q gqap


" Makes Caps Lock work as Esc
command EscToCapsLock !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'





" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>



"  to reselect the text that was just pasted so I can perform commands (like
"  indentation) on it
nnoremap <leader>v V`]



"" Window management
" new vertical split
command Vertical vertical sp

" new horizontal split
command Horizontal sp



" Easily resize split windows with Ctrl+hjkl
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>



" Macros-fu

" Invoke a certain macro
nnoremap ä @
" Invoke last macro
nnoremap ö @@

" Redraw broken Vim
nnoremap å :redraw!<CR>


" Open file tree
nnoremap <Leader>n :LustyFilesystemExplorer<CR>
" Open bufexplorer
nnoremap <Leader>m :LustyBufferExplorer <CR>
" Opens filesystem explorer at the directory of the current file
nnoremap <Leader>f :LustyFilesystemExplorerFromHere <CR>
" Opens buffer grep
nnoremap <Leader>g :LustyBufferGrep <CR>



" Move by screen lines instead of file line. Nice with long lines.
nnoremap j gj
nnoremap k gk


" Easily change directory to the file being edited.
nmap <Leader>cd :cd %:p:h<CR>

" Delete last linebreak, leading spaces and trailing spaces
nnoremap <Leader>u I" <C-c>hvk$xh " up
nnoremap <Leader>d jI" <C-c>hvk$xh " Down



" diff will be opened automatically after the git commit.
autocmd FileType gitcommit DiffGitCached | wincmd p





" Command for reloading snipMate snippets
command SnippetsReload call ReloadAllSnippets()
command SnippetsEditSelect e ~/.vim/bundle/snipmate/snippets/
" Open corresponding snipets file
command SnippetsEdit execute "edit ~/.vim/bundle/snipmate/snippets/" . &ft . ".snippets"
" Reload snippets after saving
au BufWritePost *.snippets call ReloadAllSnippets()





" spell checking
set spelllang=en_us
" Toggle spelling
nmap <silent> <leader>s :set spell!<CR>



"" Use ,c to compile selected text to corresponding output and print it to stdout
map <leader>c :CoffeeCompile<CR>
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>

" Hilight == operator with red in CoffeeScript. Always use "is" instead of it.
au BufNewFile,BufRead,BufEnter *.coffee syntax match BrightRed "=="
hi BrightRed ctermfg=7 ctermbg=1


" :C<line number>
" Compile CoffeeScript buffer and open it in scratch buffer on given line
" number
command -nargs=1 C CoffeeCompile | :<args>


" h, for line start
map <Leader>h 0
" ,l for line end
map <Leader>l $


" Remove crappy keymappings set by plugings
" search bad plugings with :verbose imap <c-n>
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



" Show margin column
if exists('+colorcolumn')
    set colorcolumn=80
endif




" Load local vim config file
if filereadable($HOME . "/.vim/localrc")
    source $HOME/.vim/localrc
endif

