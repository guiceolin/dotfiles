vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'

  use 'mfussenegger/nvim-jdtls'
  use 'morhetz/gruvbox'
  use 'mhinz/vim-startify'
  use 'tpope/vim-obsession'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}}
  }
end)
