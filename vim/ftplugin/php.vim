" Use php syntax check when doing :make
setlocal makeprg=php\ -l\ \"%\"
" Use errorformat for parsing PHP error output
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Long lines
setlocal colorcolumn=120
setlocal textwidth=118


setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
