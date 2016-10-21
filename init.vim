call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'steelsojka/deoplete-flow'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'ton/vim-bufsurf'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim' " required by gist-vim
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/Rename'
Plug 'jeetsukumaran/vim-buffersaurus'
Plug 'tomtom/tcomment_vim'
call plug#end()

for plugin in keys(g:plugs)
    let s:plugin_config = $HOME . '/.config/nvim/plugin.d/' . plugin . '.vim'
    if filereadable(s:plugin_config)
        execute 'source ' . s:plugin_config
    endif
endfor


"" Leader mappings
let mapleader = ","


" Always disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" Enter paste mode with Ctrl+i
map <C-i> :set paste<CR>i

" Show trailing whitespace characters
set list
set listchars=tab:▸\ ,trail:·,extends:…,nbsp:␣
" Show soft wrapped lines as …
set showbreak=↳

" Cooler tab completion for vim commands
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list

" By default use 4 spaces as indentation
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

" Easier curly braces insertion
imap § {
imap ½ }
imap ° }

" Map escape key to jj -- much faster to exit insert mode
imap jj <esc>



" Write buffer (save)
noremap <Leader>w :w<CR>
imap ,w <esc>:w<CR>

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="



"" Extend navigation keys

" First non whitespace character
map ö ^

" End of line
map ä $

" Begining of line
map Ö 0

" Last non space character
map Ä g_

" Same for visual mode
vmap ö ^
vmap ä $
vmap Ö 0
vmap Ä g_

" hide buffers instead of closing them
" Allows to change buffers with unsaved changes
set hidden

" The crossair
set cursorline cursorcolumn

colorscheme molokai

" Toggle with last previous buffer
nnoremap <leader>m :b#<cr>

" Do not toggle to netrw view
let g:netrw_altfile = 1

" Select another file from the directory of the current one
nnoremap <leader>f :execute 'edit' expand("%:p:h")<cr>

noremap <Leader>w :w<CR>

noremap <Up> :bNext<cr>
noremap <Down> :brewind<cr>


" Close current buffer
noremap <Leader>d :bd<CR>

" Make Y behave like other capitals. Yank to end of line.
map Y y$

" Use mouse only in visual mode
set mouse=v

" Turn magic off from search
nnoremap / /\V
vnoremap / /\V

" Make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" Hilight all words matching the one under the cursor
noremap <Space> *N
" Clear hilights
noremap  <Leader><Space> :noh<cr>

" Search literal strings
nnoremap <Leader>S :execute '/\V' . escape(input('/'), '\\/')<CR>
" Search literallly what was last yanked
nnoremap <Leader>s :execute '/\V' . escape(@", '\\/')<CR>
" Start search from visual selection. The let thing is to restore what was
" previously yanked to the unnamed register
vnoremap <Space> "xy:execute '/\V' . escape(@x, '\\/')<CR>:let @" = @0<CR>

" Join lines from below too. See :help J
map K kJ

" Easily resize split windows with Ctrl+hjkl
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>

" Show unsaved changes
command ShowUnsaved w !diff -u % -

" strip all trailing whitespace in the current file
nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<cr>'z

"  to reselect the text that was just pasted so I can perform commands (like
"  indentation) on it
nnoremap <leader>v V`]

" Use Q for formatting the current paragraph (or selection).
" Forces 80 character lines.
vmap Q gq
nmap Q gqap

" Move by screen lines instead of file line. Nice with long lines.
nnoremap j gj
nnoremap k gk

" Reset messed up Vim. Redraw screen, clear search hilights and balance window
" splits
map <F5> :redraw! \| :noh \| <cr><c-w>=

" Reselect visual block after indent/outdent. Allow ident/outdent multiple
" times
vnoremap < <gv
vnoremap > >gv


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

for plugin in keys(g:plugs)
    let s:plugin_config = $HOME . '/.config/nvim/plugin.d/' . plugin . '.after.vim'
    if filereadable(s:plugin_config)
        execute 'source ' . s:plugin_config
    endif
endfor

