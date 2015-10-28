" = Navigation and Juggling

" Use Vim's built in find rather than CtrlP, but bind it to my old CtrlP
" mapping. 
nmap <Leader>p :sfind<Space> 

" List all open buffers, then start the buffer selection command which uses
" tab completion
nnoremap <Leader>l :ls<CR>:b<Space>


" romainl, the patient vimmer, is my vim spirit animal.
" See:
" https://www.reddit.com/r/vim/comments/3o7b4h/can_vim_manage_project_folders/cvuosjy
" http://stackoverflow.com/questions/16082991/vim-switching-between-files-rapidly/16084326#16084326
" https://www.reddit.com/user/-romainl-

" == Juggling Files
nnoremap <Leader>f :find *
nnoremap <Leader>fs :sfind *
nnoremap <Leader>v :vert sfind *
nnoremap <Leader>t :tabfind *

" Juggle files recursively under the directory of the current file.
nnoremap <Leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <Leader>S :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <Leader>V :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <Leader>T :tabfind <C-R>=expand('%:h').'/*'<CR>

" == Juggling Buffers
set wildcharm=<C-z>
nnoremap <Leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>
nnoremap ,b :buffer *
nnoremap ,B :sbuffer *
nnoremap <BS> <C-^>

" The mappings above list the available buffers in the "wildmenu" with an empty
" prompt, allowing me to either navigate the menu with <Tab> or type a few
" letters and <Tab> again to narrow down the list. Like with the file mappings
" above, the process is quick and almost friction-less.

nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
" Those mappings speak for themselves.

" == Juggling with Tags/Definitions
nnoremap <Leader>j :tjump /
nnoremap <Leader>d :dlist /

" See :h ptjump and :tselect
nnoremap ,p :ptjump /
nnoremap [D [D:djump   <C-r><C-w><S-Left><Left>
nnoremap ]D ]D:djump   <C-r><C-w><S-Left><Left>

" Juggling with matches
nnoremap ,i :ilist /
nnoremap [I [I:ijump   <C-r><C-w><S-Left><Left><Left>
nnoremap ]I ]I:ijump   <C-r><C-w><S-Left><Left><Left>

" Juggling with changes
nnoremap ,; *``cgn
nnoremap ,, #``cgN
