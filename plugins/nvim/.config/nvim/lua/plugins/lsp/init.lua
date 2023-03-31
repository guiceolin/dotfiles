return {
  {
    'mfussenegger/nvim-jdtls',
  },
  {
    'neovim/nvim-lspconfig',
    config = function(_, _)
      require('plugins.lsp.lua-ls').setup()
      require('plugins.lsp.js-ls').setup()
    end
  }
}
