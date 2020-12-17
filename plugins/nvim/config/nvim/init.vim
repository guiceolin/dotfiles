set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:python3_host_prog = expand('~/.local/.venv/bin/python3')

lua require('init')
filetype plugin indent on    " required

source ~/.vimrc
