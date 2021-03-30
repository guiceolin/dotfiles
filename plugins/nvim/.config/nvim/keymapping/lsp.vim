nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent><leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent>gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
