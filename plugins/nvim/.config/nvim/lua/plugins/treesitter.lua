return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
        require("nvim-treesitter.install").update()
    end,
    config = function()
      local opts = {
        ensure_installed = { "java", "javascript", "python", "lua", "vim" },
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
