" Explorer
nmap <leader>p :CocCommand explorer --toggle <CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

autocmd VimEnter * silent! autocmd! FileExplorer
au BufEnter,VimEnter * if (isdirectory(expand('<amatch>'))) | execute( 'CocCommand explorer') | endif
