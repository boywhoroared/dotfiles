" When opening a large file, take some measures to keep things loading quickly
" Source: http://vim.wikia.com/wiki/Faster_loading_of_large_files 
if has('eval') && has('autocmd')
    
    " Files are 'Large' when they are >= 10MB 
    let g:LargeFile = 1024 * 1024 * 10

    " The -2 check allows to check for files are so large that the size cannot
    " be represented by Vim (unable to fit in a signed int 2^63-1). 
    " See :h getfsize
    "
    " Would I ever open such a file in Vim? Probably not.
    augroup LargeFile 
        autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
    augroup END

    let s:script = expand("<sfile>:t")

    function! LargeFile()
        " no syntax highlighting etc
        set eventignore+=FileType
        " save memory when other file is viewed
        setlocal bufhidden=unload
        " is read-only (write with :w new_filename)
        setlocal buftype=nowrite
        " no undo possible
        setlocal undolevels=-1
        setlocal nobackup
        setlocal nowritebackup
        setlocal noswapfile
        if has('persistent_undo')
            setlocal noundofile
        endif
        if exists('&synmaxcol')
            setlocal synmaxcol=256
        endif

        " display message
        autocmd VimEnter *  echomsg "File is >=" . (g:LargeFile / 1024 / 1024) . " MB; Some options are changed (see " . s:script . " for details)."
    endfunction
    
  endif
