" Whitespace appearance
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "eol:\u00AC,tab:\u25b8 ,trail:\u00b7,extends:\u2192,precedes:\u2190,nbsp:\u02fd"
  endif
endif

augroup whitespace
  autocmd BufWritePre *.php,*.js,*.py call whitespace#strip_trailing()
augroup END

nmap _$ :call whitespace#strip_trailing()<CR>
nmap _= :call whitespace#indent()<CR>
