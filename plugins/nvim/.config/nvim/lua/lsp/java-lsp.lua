vim.api.nvim_exec(
[[
  augroup lsp
    au!
    au FileType java lua require('lsp.java-lsp').setup() 
  augroup end
]], false)

local M = {}

function M.setup()
  local config = {}

  config.on_attach = function(client, buffnr)
    require'lsp.keymap'.set_keymaps(client, buffnr)
  end

  config.cmd = { 'java-lsp' }
  require('jdtls').start_or_attach(config)
end

return M
