" Do not include STDERR output when writing the buffer after running the 
" formatprg and equalprg commands.
setlocal shellredir=>%s


" Use xmllint for formatting. Discard STDERR because Vim draws/displays the 
" STDERR output briefly when running the commands, even though it will not be 
" included in the buffer.
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

