local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

require('nvim-autopairs').setup({
    check_ts = true,
})
require('nvim-treesitter.configs').setup {
    autopairs = {enable = true}
}

_G.Autopairs= {}

vim.g.completion_confirm_key = ""
Autopairs.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.Autopairs.completion_confirm()', {expr = true , noremap = true})
