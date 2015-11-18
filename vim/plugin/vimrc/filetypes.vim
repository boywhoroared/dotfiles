" Load plugins and indentation for file types
if has('autocmd')
  " Enable filetype detection, filetype identing and filetype plugins
  filetype indent plugin on

  " Shortcuts to quickly switch to common file types; handy when using
  " editing abstractions like sudoedit(8)
  nnoremap _ap :setlocal filetype=apache<CR>
  nnoremap _ht :setlocal filetype=html<CR>
  nnoremap _ph :setlocal filetype=php<CR>
  nnoremap _py :setlocal filetype=python<CR>
  nnoremap _pl :setlocal filetype=perl<CR>
  nnoremap _cs :setlocal filetype=css<CR>
  nnoremap _js :setlocal filetype=javascript<CR>
  nnoremap _md :setlocal filetype=markdown<CR>
  nnoremap _ad :setlocal filetype=asciidoc<CR>
  nnoremap _sh :setlocal filetype=sh<CR>
  nnoremap _vi :setlocal filetype=vim<CR>
  nnoremap _xm :setlocal filetype=xml<CR>

  if exists("+omnifunc")
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
    autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    autocmd Filetype *
                \   if &omnifunc == "" |
                \       setlocal omnifunc=syntaxcomplete#Complete |
                \   endif
  endif
endif


