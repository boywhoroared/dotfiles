set nocompatible
filetype off
filetype plugin indent on

" UTF-8. UTF-8 EVERYWHERE. 
let &termencoding = &encoding
set encoding=utf-8

if has("win32") || has("win64")
   set runtimepath=$LocalAppData\Vim,$VIMRUNTIME,$LocalAppData\Vim\after
endif

" Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

set showmode
set showcmd
set ch=2
set title
set hidden
set lazyredraw
set backspace=indent,eol,start
set virtualedit+=block
set clipboard=unnamed 

" 'Turn off everything that beeps.' - Scott Hanselman.
set noerrorbells
set novisualbell
set vb t_vb=
set tm=500

" Terminal {{{
set ttyfast
set notimeout
set ttimeout
set ttimeoutlen=50

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif
"}}}

" Color {{{
syntax on
set bg=dark
colorscheme badwolf
"}}}

" Editing {{{
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set nosmarttab
set shiftround

set nowrap
set textwidth=80
set formatoptions=q1rnl
set colorcolumn=+1

set nonumber
set norelativenumber

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "eol:\u00AC,tab:\u25b8 ,trail:\u00b7,extends:\u2192,precedes:\u2190,nbsp:\u02fd"
  endif
endif
"}}}

" History and Undo {{{
if &history < 1000
  set history=1000
endif
set viminfo^=!

" Keep backups and undo in a central location.
let s:dir = (has("win32") || has("win64")) ? '$LocalAppData/Vim/Temp' : '~/.vim/tmp'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif

if exists('+undofile')
  set undofile
endif

set noswapfile
" "}}}

" Searching and Movement {{{
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

set scrolloff=3
set sidescroll=1
set sidescrolloff=3

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

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"}}}

" Tags {{{
set tags+=./tags,~/tags/_shared.tags
" including _shared tags should probably just be done as a php ft

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz
" }}}

" Splits {{{
set splitbelow
set splitright

" resize splits when window is resized
au VimResized * :wincmd =
"}}}

" Statusline {{{
set ruler        " Always show the cursor position
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
"}}}

" Completion {{{
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.pyc
set wildignore+=*.sw?
set wildignore+=*.orig

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,perl,tex set shiftwidth=2
"}}}

" Trailing Whitespace {{{
" Only show when not in Insert Mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
augroup END
"}}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

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
let mapleader = ","
let maplocalleader= "\\"

nnoremap j gj
nnoremap k gk

" Hard Re-wrap Paragraphs (Textmate)
nnoremap <leader>q gqip
" Hard Re-wrap and leave cursor at current word after formatting
nnoremap <leader>qw gwip 

" Scroll the viewport faster by scrolling 3 lines at a time, rather than one
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

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
inoremap jj <Esc>

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
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
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

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

" Easy Buffer 
nmap <Leader>. :EasyBuffer<CR>

" NERDTree
nmap <Leader>m :Explore<CR>

" Syntastic
let g:syntastic_phpcs_conf="--warning-severity=0 --standard=/data/ese/ruleset.xml"

" }}}

" Load local vimrc
source ~/.vimrc.local

