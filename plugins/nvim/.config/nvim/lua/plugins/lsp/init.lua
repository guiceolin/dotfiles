return {
  {
    'mfussenegger/nvim-jdtls',
--     config = function(_, _)
--       vim.api.nvim_exec(
--         [[
--           augroup lsp
--             au!
--             au FileType java lua require('plugins.lsp.java-ls').setup()
--           augroup end
--         ]], false)
--     end
  },
  {
    'neovim/nvim-lspconfig',
    config = function(_, _)
      require('plugins.lsp.lua-ls').setup()
      require('plugins.lsp.js-ls').setup()
    end
  }
}
