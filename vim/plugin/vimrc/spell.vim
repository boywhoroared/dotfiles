" Configure spell checking features, if available
if has('spell')

  " Don't check spelling by default, but bind <Space>s to toggle this
  set nospell
  nnoremap <leader>s :setlocal spell!<CR>

  " Use British English for spelling by default , but bind <Space>su to switch
  " to US English and <Space>sb to switch back
  set spelllang=en
  nnoremap <leader>su :setlocal spelllang=en_us<CR>
  nnoremap <leader>sb :setlocal spelllang=en_gb<CR>

endif

" Writing
autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
autocmd FileType markdown,mkd,mail setlocal spell
set complete+=kspell


