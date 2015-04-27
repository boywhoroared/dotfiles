if has('mac')
  set guifont=Source\ Code\ Pro:h16
  colo bubblegum-256-light
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

set columns=134
set lines=32

" Quick Fonts
menu Fonts.Source\ Code\ Pro :set guifont=Source\ Code\ Pro:h16<CR>
menu Fonts.Ubuntu\ Mono :set guifont=Ubuntu\ Mono:h18<CR>
menu Fonts.Consolas :set guifont=Consolas:h16<CR>
menu Fonts.Inconsolata :set guifont=Inconsolata:h18<CR>
menu Fonts.Pragmata\ Pro :set guifont=Pragmata\ Pro:h16<CR>
menu Fonts.M+\ 1mn :set guifont=M\+\ 1mn:h16<CR>
