return  {
  'nvim-telescope/telescope.nvim',
  dependencies = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>t', builtin.find_files, {})
    vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '?',         builtin.keymaps, {})
  end
}

