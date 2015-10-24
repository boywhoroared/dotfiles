" When opening a large file, take some measures to keep things loading quickly
if has('eval') && has('autocmd')

  " Threshold is 10 MiB
  let g:bigfilesize = 10 * 1024 * 1024

  " Declare function for turning off slow options
  function! BigFileMeasures()
    let l:file = expand('<afile>')
    if getfsize(l:file) > g:bigfilesize
      setlocal nobackup
      setlocal nowritebackup
      setlocal noswapfile
      if has('persistent_undo')
        setlocal noundofile
      endif
      if exists('&synmaxcol')
        setlocal synmaxcol=256
      endif
    endif
  endfunction

  " Define autocmd for calling to check filesize
  augroup bigfilesize
    autocmd!
    autocmd BufReadPre * call BigFileMeasures()
  augroup end
endif
