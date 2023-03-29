local M = {}
local lsp_root = os.getenv('DOTFILES') .. "/plugins/lsp-lua/lua-language-server"

local lsp_bin = lsp_root .. "/bin/lua-language-server"

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local on_attach = function(client, buffnr)
  require 'plugins.lsp.keymap'.on_attach(client, buffnr)
end
function M.setup()
  if file_exists(lsp_bin) then
    require 'lspconfig'.lua_ls.setup {
      cmd = { lsp_bin, "-E", lsp_root .. "/main.lua" },
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = vim.split(package.path, ';')
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' }
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true,[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
          }
        }
      }
    }
  end
end

return M
