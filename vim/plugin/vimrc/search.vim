" Some special settings for searching, if available
if has('extra_search')

  " Searching as I enter my pattern, <Leader>i toggles this
  set incsearch
  "nnoremap <leader>i :set incsearch!<CR>

  " Highlight search results, <Leader>h toggles this
  set hlsearch
  nnoremap <leader>h :set hlsearch!<CR>

  " Map ^L in Normal Mode if it isn't mapped already
  " See :h maparg
  if maparg('<C-L>', 'n') ==# ''
    " Pressing ^L will clear highlighting until the next search-related
    " operation; quite good because the highlighting gets distracting after
    " you've found what you wanted
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  endif

  " Clear search highlighting as soon as I enter insert mode, and restore it
  " once I leave it
  if has('autocmd')
    augroup highlight
      autocmd!
      silent! autocmd InsertEnter * set nohlsearch
      silent! autocmd InsertLeave * set hlsearch
    augroup END
  endif
endif

" Keep search matches in the middle of the window.
" n/N - next search down/up
" zz - scroll the cursor's current line to the center of the window
" zv - open enough folds to view the cursor's current line
" See :h z
"     :h scrolling
nnoremap n nzzzv
nnoremap N Nzzzv

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Show matching paren
set showmatch

