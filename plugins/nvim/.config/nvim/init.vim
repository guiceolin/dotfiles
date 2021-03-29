lua require('plugins')

source ~/.config/nvim/general/visual.vim

lua require('plugins.startify')
lua require('plugins.lspsaga')
lua require('nvim-tree')

lua require('lsp.lua-ls')
lua require('lsp.java-lsp')

source ~/.config/nvim/keymapping/navigation.vim
source ~/.config/nvim/keymapping/lsp.vim
