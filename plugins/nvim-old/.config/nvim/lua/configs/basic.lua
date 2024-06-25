vim.cmd [[
set hidden

filetype plugin indent on
""set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

"" Remove Trailling spaces
autocmd BufWritePre * :%s/\s\+$//e
]]
