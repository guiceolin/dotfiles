vim.cmd [[
nnoremap <leader>p :NvimTreeToggle<CR>

nnoremap <leader>t <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>/ <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap ? <cmd>lua require('telescope.builtin').keymaps()<cr>
]]

