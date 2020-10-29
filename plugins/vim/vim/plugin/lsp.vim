lua <<EOF
  require'nvim_lsp'.tsserver.setup{}
  require'nvim_lsp'.sumneko_lua.setup{}
  require'nvim_lsp'.vimls.setup{}
  require'nvim_lsp'.html.setup{}
  require'nvim_lsp'.gopls.setup{}
  require'nvim_lsp'.solargraph.setup{}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> rn    <cmd>lua vim.lsp.buf.rename()<CR>
