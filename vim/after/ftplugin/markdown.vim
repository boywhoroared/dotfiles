" En and Em Dash
" Usage:
"
" http://www.thepunctuationguide.com/en-dash.html
" http://www.thepunctuationguide.com/em-dash.html
" http://www.chicagomanualofstyle.org/qanda/data/faq/topics/HyphensEnDashesEmDashes/faq0002.html

" En 
inoremap <buffer> --<space> –<space>
" Em
inoremap <buffer> -- &#8202;—&#8202;

syntax match entity_hairspace "&#8202;" conceal
setl conceallevel=2
