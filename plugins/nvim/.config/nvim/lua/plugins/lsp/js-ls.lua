local M = {}
local util = require 'lspconfig'.util;

local on_attach = function(client, buffnr)
  require 'plugins.lsp.keymap'.on_attach(client, buffnr)
end

function M.setup()
  require 'lspconfig'.tsserver.setup {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    on_attach = on_attach,
  }
end

return M
