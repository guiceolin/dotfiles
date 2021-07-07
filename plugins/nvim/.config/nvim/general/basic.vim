set hidden

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

"" Remove Trailling spaces
autocmd BufWritePre * :%s/\s\+$//e
