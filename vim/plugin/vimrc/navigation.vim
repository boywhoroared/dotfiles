" Navigation and Juggling

" Use Vim's built in find rather than CtrlP, but bind it to my old CtrlP
" mapping. 
nmap <Leader>p :sfind<Space> 

" List all open buffers, then start the buffer selection command which uses
" tab completion
nnoremap <Leader>l :ls<CR>:b<Space>
