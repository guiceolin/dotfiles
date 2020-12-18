-- luacheck: globals vim use
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'mhinz/vim-startify'

  use 'ryanoasis/vim-devicons'
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

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
end)
