local M = {}

function M.set_keymaps(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }
  local function set_keymap(mode, key, cmd) vim.api.nvim_buf_set_keymap(bufnr, mode, key, "<cmd> " .. cmd .. "<CR>", opts) end

  local function n(...) set_keymap("n", ...) end
  local function v(...) set_keymap("v", ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  n("gD", "lua vim.lsp.buf.declaration()")
  n("gr", "Lspsaga lsp_finder")
  n("gd", "Lspsaga goto_definition")
  n("<leader>K", "Lspsaga hover_doc")
  n("<leader>D", "Lspsaga peek_definition")
  n("<leader>sl", "Lspsaga show_line_diagnostics")
  n("<leader>sc", "Lspsaga show_cursor_diagnostics")
  n("<leader>sb", "Lspsaga show_buf_diagnostics")

  n("<leader>ca", "Lspsaga code_action")
  v("<leader>ca", "Lspsaga code_action")
  n("<leader>rn", "Lspsaga rename")

  n("<leader>f", "lua vim.lsp.buf.format()")
  v("<leader>f", "lua vim.lsp.buf.format()")
  --
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
    hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

return M
