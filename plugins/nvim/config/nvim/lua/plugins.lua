vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

  -- Debug tool
  -- use 'bfredl/nvim-luadev'

  use {
    'kyazdani42/nvim-tree.lua' ,
    cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeClose' },
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'mhinz/vim-startify'

  use 'datwaft/bubbly.nvim'
  use 'morhetz/gruvbox'
  use 'mhinz/vim-signify'
  use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }

  -- " Commands
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'gorkunov/smartpairs.vim'

  -- " Automatic Helpers
  use 'Raimondi/delimitMate'
  use 'tpope/vim-obsession'

  -- " Snippets
  use 'nvim-lua/completion-nvim'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'joaohkfaria/vim-jest-snippets'

  -- " Language Additions
  use 'sheerun/vim-polyglot'
  use 'hail2u/vim-css3-syntax'

  -- " LSP
  use 'neovim/nvim-lspconfig'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
end)
