return {
  'nvim-telescope/telescope.nvim',
  dependencies = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
  config = function()

    require('configs.keymaps').telescope()

  end
}
