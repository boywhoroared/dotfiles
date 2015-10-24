" CtrlP
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Easy Buffer 
nmap <Leader>l :EasyBuffer<CR>

" NERDTree
nmap <Leader>m :Explore<CR>

" Tagbar
nmap <Leader>t :TagbarToggle<CR>

" Syntastic

" SQLComplete: GEEZUS H CHRIST.
let g:omni_sql_no_default_maps = 1

" GitGutter
let g:gitgutter_enabled = 0

" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_auto_loc_list=1
let g:syntastic_php_phpcs_args='-n '
let g:synastic_mode_map={ "mode": "active", "active_filetypes": [], "passive_filetypes": [] }




