
vim.g.startify_lists = {
  { type = 'files',     header = {'   Files'}},
  { type = 'dir',       header = {'   Current Directory '..vim.fn.getcwd()..":"}},
  { type = 'sessions',  header = {'   Sessions'}},
  { type = 'bookmarks', header = {'   Bookmarks'}},
}

vim.g.startify_bookmarks = {
  { i = '~/.config/nvim/init.vim' },
  { z = '~/.zshrc' },
  { d = '~/dotfiles'},
  { p = '~/.config/nvim/lua/plugins.lua'}
}

vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_enable_special = 0

