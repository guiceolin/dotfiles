local util = require'lspconfig'.util;
local on_attach = function(client, buffnr)
  require'lsp.keymap'.set_keymaps(client, buffnr)
end

require'lspconfig'.tsserver.setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach = on_attach,
}
