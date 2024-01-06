vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    local opts = {
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "├",
            bottom = "─",
            none = " ",
          },
        },
      },
      diagnostics = {
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filesystem_watchers = {
        ignore_dirs = { ".git", "node_modules", ".cache", "__pycache__" },
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    }

    require('nvim-tree').setup(opts)

    require('configs.keymaps').nvimtree()
  end

}
