local n, i, v = 'n', 'i', 'v'
local ex_t = { n, i, v }
local n_v = { n, v }

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local allow_remap = { noremap = false, silent = true }

local M = {}

function M.telescope()
  local builtin = require('telescope.builtin')

  keymap(n, '<leader>t', builtin.find_files, default_opts)
  keymap(n, '<leader>/', builtin.live_grep, default_opts)
  keymap(n, '<leader>b', builtin.buffers, default_opts)
  keymap(n, 'gr', '<Cmd>Telescope lsp_references<CR>', default_opts)
  keymap(n, '?', builtin.keymaps, default_opts)
end

function M.nvimtree()
  local api = require('nvim-tree.api')
  keymap(n, '<leader>p', api.tree.toggle, default_opts)
end

function M.lspsaga()
  keymap(n, 'K', '<cmd>Lspsaga hover_doc<CR>', default_opts)
  keymap(n_v, 'ca', '<Cmd>Lspsaga code_action<CR>', default_opts)
  keymap(n_v, 'RR', '<Cmd>Lspsaga rename<CR>', default_opts)
  keymap(n, 'gd', '<Cmd>Lspsaga peek_definition<CR>', default_opts)
  keymap(n, 'gh', '<Cmd>Lspsaga hover_doc<CR>', default_opts)
  keymap(n, 'gf', '<Cmd>Lspsaga goto_definition<CR>zz', default_opts)
  keymap(n, 'e', '<Cmd>Lspsaga show_line_diagnostics ++unfocus<CR>', default_opts)
  keymap(n, '<leader>o', '<Cmd>Lspsaga outline<CR>', default_opts)
end

return M
