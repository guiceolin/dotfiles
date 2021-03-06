set completeopt=menuone,noselect

lua require('plugins')

source ~/.config/nvim/general/visual.vim
source ~/.config/nvim/general/basic.vim

lua require('plugins.startify')
lua require('plugins.lspsaga')
lua require('plugins.nvim-tree')
lua require('plugins.treesitter')

lua require('lsp.lua-ls')
lua require('lsp.java-lsp')
lua require('lsp.js-lsp')

lua require('plugins.nvim-compe')
lua require('plugins.autopairs')
lua require('plugins.auto-sessions')

source ~/.config/nvim/keymapping/navigation.vim
source ~/.config/nvim/keymapping/lsp.vim
