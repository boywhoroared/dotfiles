if &history < 1000
  set history=1000
endif

" Configuration for the command completion feature; rather than merely cycling
" through possible completions with Tab, show them above the command line
if has('wildmenu')

  " Use the wild menu, both completing and showing all possible completions
  " with a single Tab press, just as I've configured Bash to do
  set wildmenu
  set wildmode=longest:list,full

  " Don't complete certain files that I'm not likely to want to manipulate
  " from within Vim:
  if has('wildignore')
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
  endif

  " TODO: Checkout wildcharm
  " :h wildcharm

  " Complete files without case sensitivity, if the option is available
  if exists('&wildignorecase')
    set wildignorecase
  endif
endif

" Indicate which mode Vim is in if it is not in Normal Mode
set showmode

" Always tell me the number of lines changed by a command
set report=0

" Set height of command-line in lines
set cmdheight=3

if has('cmdline_info')
  " Show (partial) command/keystrokes in the bottom of the screen as I type them,
  " or the size of the selected area in visual mode. Don't use this on slow terms. 
  " See :h showcmd
  if has("macunix") || has('gui_running')
    set showcmd
  endif

  " Show the position -- line, column, and relative position in file, of the
  " cursor.
  set ruler
endif

cnoremap %% <c-r>=fnameescape(expand('%'))<cr>
cnoremap :: <c-r>=fnameescape(expand('%:p:h'))<cr>/
