set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:python3_host_prog = expand('~/.local/.venv/bin/python3')

lua require('plugins')
filetype plugin indent on    " required

source ~/.vimrc
