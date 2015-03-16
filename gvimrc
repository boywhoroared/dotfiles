if has('mac')
  set guifont=Meslo\ LG\ M:h14
  "set guifont=Source\ Code\ Pro:h14
elseif has('gui_gtk2')
  set guifont=Droid\ Sans\ Mono\ 13
  colo base16-ocean
endif

set guioptions-=T

" Cursor
" mode-list:argument-list,mode-list:argument-list,..
" default from docs
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10
