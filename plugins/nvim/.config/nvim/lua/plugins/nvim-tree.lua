vim.o.termguicolors = true

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  opts = {
           -- BEGIN_DEFAULT_OPTS
    on_attach = "default",
    view = {
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
        },
      },
    },
    renderer = {
      indent_markers = {
        enable = true,
        inline_arrows = true,
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
      enable = false,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 50,
      ignore_dirs = { ".git", "node_modules", ".cache", "__pycache__" },
    },
    actions = {
      open_file = {
        quit_on_open = true,
        resize_window = true,
        window_picker = {
          enable = true,
          picker = "default",
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
  } -- END_DEFAULT_OPTS
}
