return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local opts = {
      ensure_installed = { "java", "javascript", "python", "lua", "vim" },
      sync_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
    require('nvim-treesitter.configs').setup(opts)
  end
}
