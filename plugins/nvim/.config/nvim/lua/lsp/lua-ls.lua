USER = vim.fn.expand('$USER')
DIR = os.getenv('DOTFILES') .. "/plugins/nvim/lsp/lua/lua-language-server"

local sumneko_root_path = DIR
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_binary = DIR .. "/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_binary = DIR .. "/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

local on_attach = function(client, buffnr)
  require'lsp.keymap'.set_keymaps(client, buffnr)
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}
