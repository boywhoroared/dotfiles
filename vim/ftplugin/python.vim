" Python-specific settings

" Vim uses PEP8 out of the box
" setlocal tabstop=2
" setlocal softtabstop=2
" setlocal shiftwidth=2
" setlocal expandtab

setlocal autoindent
setlocal smarttab

" Enable all the fancy highlighting for Python
let python_highlight_all = 1

" Compiler
setlocal makeprg=python\ -m\ py_compile\ %
setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"setlocal makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
"setlocal errorformat=%f:%l:\ %m
