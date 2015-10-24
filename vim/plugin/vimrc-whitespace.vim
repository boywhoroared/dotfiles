augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

augroup whitespace
  autocmd BufWritePre *.php,*.js,*.py call whitespace#strip_trailing()
augroup END

nmap _$ :call whitespace#strip_trailing()<CR>
nmap _= :call whitespace#indent()<CR>
