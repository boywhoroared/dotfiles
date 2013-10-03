" thanks to http://vimcasts.org/e/4

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! whitespace#indent()
  call Preserve("normal gg=G")
endfunction

function! whitespace#strip_trailing()
  call Preserve("%s/\\s\\+$//e")
endfunction

function! whitespace#convert_tabs()
  set expandtab
  retab!
endfunction

function! whitespace#convert_spaces()
  set noexpandtab
  retab!
endfunction

function! whitespace#delete_blank_lines()
  call Preserve("g/^$/d")
endfunction
 
