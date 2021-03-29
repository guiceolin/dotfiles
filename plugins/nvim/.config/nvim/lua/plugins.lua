vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  use 'mfussenegger/nvim-jdtls'
  use 'morhetz/gruvbox'
  use 'mhinz/vim-startify'
  use 'tpope/vim-obsession'
end)
