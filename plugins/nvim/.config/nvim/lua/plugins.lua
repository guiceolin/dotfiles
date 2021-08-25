vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'kevinhwang91/nvim-bqf'

  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'mfussenegger/nvim-jdtls'
  use 'sainnhe/gruvbox-material'
  use 'rmagatti/auto-session'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}}
  }

  use 'hrsh7th/nvim-compe'

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('gitsigns').setup()
    end
  }

  use "lukas-reineke/indent-blankline.nvim"
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'windwp/nvim-autopairs' }
  use { 'tpope/vim-surround' }
end)
