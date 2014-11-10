" SETUP {{{
set nocompatible
if has("win32") || has("win64")
  let $MYVIM=$HOME.'/vimfiles'
else
  let $MYVIM=$HOME.'/.vim'
endif

" UTF-8. UTF-8 EVERYWHERE.
let &termencoding = &encoding
set encoding=utf-8

" PLUGINS {{{
" Vim plugin manager

if version >= 702
  filetype off

  let $PLUGINS = $MYVIMRC.'.bundles'
  let $PLUGINS_LOCAL = $MYVIMRC.'.bundles.local'

  if filereadable($PLUGINS)
    source $PLUGINS
  endif

  if filereadable($PLUGINS_LOCAL)
    source $PLUGINS_LOCAL
  endif

endif
" }}}

" }}}

filetype plugin indent on

" 1 IMPORTANT
" 2 MOVING AROUND, SEARCHING AND PATTERNS {{{
set ignorecase
set smartcase
set incsearch
set hlsearch

" Turn off search highlights.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
set showmatch
set mat=5

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" }}}
" 3 TAGS {{{
set tags+=./tags,~/tags/_shared.tags
" including _shared tags should probably just be done as a php ft

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz

" }}}
" 4 DISPLAYING TEXT {{{
set lazyredraw
set nowrap
set ch=3

set scrolloff=3
set sidescroll=1
set sidescrolloff=4

" line numbers
" TODO: Maybe add a key mapping to toggle.
set number
if version >= 704
  " 7.4 shows the absolute line number for the current line
  " and relative numbers for all others, if nu and rnu are on
  set relativenumber
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "eol:\u00AC,tab:\u25b8 ,trail:\u00b7,extends:\u2192,precedes:\u2190,nbsp:\u02fd"
  endif
endif

" Scroll the viewport faster by scrolling 3 lines at a time, rather than one
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>
" }}}
" 5 SYNTAX, HIGHLIGHTING AND SPELLING {{{
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

syntax on
set bg=dark
colorscheme badwolf

if version >= 703
  " show a column marker for line length. text SHOULD not go past this
  set colorcolumn=+3
endif

" Highlight the line the cursor is on when in Normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" }}}
" 6 MULTIPLE WINDOWS {{{
set hidden
set splitbelow
set splitright

" resize splits when window is resized
au VimResized * :wincmd =

set laststatus=2 " Always have a status line

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.
set statusline+=%=   " Right align.
set statusline+=\    
" Fugitive
set statusline+=%{fugitive#statusline()}

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)
"
" }}}
" 7 MULTIPLE TAB PAGES
" 8 TERMINAL {{{
set title
set ttyfast
set notimeout
set ttimeout
set ttimeoutlen=30

" }}}
" 9 USING THE MOUSE {{{
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif
" }}}
" 10 GUI
" 11 PRINTING
" 12 MESSAGES AND INFO {{{
set showmode
set showcmd
set ruler        " Always show where I am in the file

" 'Turn off everything that beeps.' - Scott Hanselman.
set noerrorbells
set novisualbell
set vb t_vb=
" }}}
" 13 SELECTING TEXT {{{
set clipboard=unnamed 
" }}}
" 14 EDITING TEXT {{{
set backspace=indent,eol,start
set virtualedit+=block
set textwidth=80
set formatoptions=q1rnl
" }}}
" 15 TABS AND INDENTING {{{
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set nosmarttab
set shiftround
" }}}
" 16 FOLDING {{{
set foldlevelstart=0

" Space to toggle folds.
" (Space is our leader, so double tap)
nnoremap <Leader><Space> za
vnoremap <Leader><Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
" }}}
" 17 DIFF MODE
" 18 MAPPING {{{
set tm=500 " length of time to wait before timing out while entering a key code
" }}}
" 19 READING AND WRITING FILES {{{
" Keep backups and undo in a central location.
if !isdirectory($MYVIM."/tmp/backup")
  call mkdir($MYVIM."/tmp/backup", "p")
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=$MYVIM/tmp/backup//
"}}}
" 21 THE SWAP FILE {{{
if !isdirectory($MYVIM."/tmp/swap")
  call mkdir($MYVIM."/tmp/swap", "p")
endif
set directory-=.
set directory+=.
set directory-=~/
set directory^=$MYVIM/tmp/swap//
set noswapfile

" }}}
" 21 COMMAND LINE EDITING {{{
" Remember, at least, the last 1000 command lines
if &history < 1000
  set history=1000
endif

" Configure command-line completion matches
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.pyc
set wildignore+=*.sw?
set wildignore+=*.orig
" }}}
" 23 EXECUTING EXTERNAL COMMANDS
" 23 RUNNING MAKE AND JUMPING TO ERRORS
" 24 SYSTEM SPECIFIC
" 25 LANGUAGE SPECIFIC
" 26 MULTI-BYTE CHARACTERS
" 27 VARIOUS
set viminfo^=!

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,perl,tex set shiftwidth=2

" Trailing Whitespace {{{
" Only show when not in Insert Mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
augroup END

augroup whitespace
  autocmd BufWritePre *.php,*.js,*.py call whitespace#strip_trailing()
augroup END

nmap _$ :call whitespace#strip_trailing()<CR>
nmap _= :call whitespace#indent()<CR>

"}}}

" Return to Line {{{
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}

" Mappings {{{
let mapleader = " "
let maplocalleader= "-"

nnoremap j gj
nnoremap k gk

" Hard Re-wrap Paragraphs (Textmate)
nnoremap <leader>q gqip
" Hard Re-wrap and leave cursor at current word after formatting
nnoremap <leader>qw gwip 

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" make Y behave like C and D
nn Y y$

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Quick Escape
" http://danielmiessler.com/blog/using-jk-vs-jj-for-esc-remapping-in-vim-steve-losh
inoremap jk <Esc>

" Quick Save. 
nmap <Leader>w :w<CR>
nmap <Leader>ww :w!<CR>

" Missing ZZ and ZQ counterparts:
" quick save-buffer and quit-everything
nnoremap ZS :w<CR>
nnoremap ZX :qa<CR>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" Folding {{{
"}}}

" Editing files {{{
"Open
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
" Open Split
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
" Open Vertical Split
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
" Open new tab
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
"}}}

" Tabs {{{
" C-TAB and C-SHIFT-TAB cycle tabs forward and backward
nmap <c-tab> :tabnext<cr>
imap <c-tab> <c-o>:tabnext<cr>
vmap <c-tab> <c-o>:tabnext<cr>
nmap <c-s-tab> :tabprevious<cr>
imap <c-s-tab> <c-o>:tabprevious<cr>
vmap <c-s-tab> <c-o>:tabprevious<cr>

" C-# switches to tab
nmap <d-1> 1gt
nmap <d-2> 2gt
nmap <d-3> 3gt
nmap <d-4> 4gt
nmap <d-5> 5gt
nmap <d-6> 6gt
nmap <d-7> 7gt
nmap <d-8> 8gt
nmap <d-9> 9gt
"}}}

"}}}

" Plugins {{{
if filereadable($MYVIM.'/vimrc.plugins')
  source $MYVIM/vimrc.plugins
endif
" }}}

" Load local vimrc
if filereadable($MYVIMRC.'.local')
  source $MYVIMRC.local
endif

