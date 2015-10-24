
let $MYVIM=$HOME."/.vim/"

" Use backup features if on a UNIX-like system and not using sudo(8)
if !strlen($SUDO_USER) && has('unix')

  " Keep backups and undo in a central location.
  if !isdirectory($MYVIM."/tmp/backup") && exists('*mkdir')
    call mkdir($MYVIM."/tmp/backup", "p", 0700)
  endif

  " Use the .bak extension for backups
  set backupext=.bak

  " Keep a version of the file made when the file was opened for editing.
  set patchmode=.orig

  " Set the directories where vim keeps backups
  set backupdir-=.
  set backupdir-=~/
  " The double slash is used to make Vim use the full path to the file in the
  " backup filename. Using this to avoid collisions.
  set backupdir^=$MYVIM/tmp/backup//

  set nobackup

  if !isdirectory($MYVIM."/tmp/swap") && exists('*mkdir')
    call mkdir($MYVIM."/tmp/swap", "p", 0700)
  endif

  set directory-=.
  set directory-=~/
  set directory^=$MYVIM/tmp/swap//
  set noswapfile

" Don't use backups at all otherwise
else
  set nobackup
  set nowritebackup
endif

" Keep screeds of undo history if I am on my mac or running the GUI
if has('macunix') || has('macvim') || has('gui_running') 
  set undolevels=2000
endif

" Keep undo history in a separate file if the feature is available, we're on
" Unix, and not using sudo(8); this goes really well with undo visualization
" plugins like Gundo or Undotree.
if !strlen($SUDO_USER) && has('unix') && has('persistent_undo')

  if !isdirectory($MYVIM."/tmp/undo") && exists('*mkdir')
    call mkdir($MYVIM."/tmp/undo", "p", 0700)
  endif

  " Keep per-file undo history in ~/.vim/undo; the double-slash at the end
  " of the directory prods Vim into keeping the full path to the file in its
  " undo filename to avoid collisions; the same thing works for swap files
  set undofile
  set undodir-=.
  set undodir^=$MYVIM/tmp/undo//

  " Don't track changes to sensitive files (tmp directories or shared memory)
  if has('autocmd')
    augroup undoskip
      autocmd!
      silent! autocmd BufWritePre
          \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
          \ setlocal noundofile
    augroup END
  endif

endif
