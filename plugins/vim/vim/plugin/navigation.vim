lua << EOF
EOF
nnoremap <leader>b :lua require'telescope.builtin'.buffers{}<CR>
nnoremap <leader>/ :lua require'telescope.builtin'.live_grep()<CR>
nnoremap <silent> <leader>t :lua require'telescope.builtin'.git_files()<CR>
