vim.api.nvim_exec(
[[
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp'}})
  augroup end
]], false)
