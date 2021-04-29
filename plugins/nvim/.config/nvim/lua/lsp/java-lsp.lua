vim.api.nvim_exec(
[[
  augroup lsp
    au!
    au FileType java lua require('lsp.java-lsp').setup() 
  augroup end
]], false)

local M = {}

function M.setup()
  local root_markers = {'gradlew', 'pom.xml'}
  local root_dir = require('jdtls.setup').find_root(root_markers)
  local home = os.getenv('HOME')

  local capabilities = {
    workspace = {
      configuration = true
    },
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  }

  local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
  local config = {
    flags = {
      allow_incremental_sync = true,
    };
    capabilities = capabilities,
  }

  config.on_init = function(client, _)
    client.notify('workspace/didChangeConfiguration', { settings = config.settings })
  end
  config.on_attach = function(client, buffnr)
    require'jdtls.setup'.add_commands()
    require'lsp.keymap'.set_keymaps(client, buffnr)
    require'lspsaga'.init_lsp_saga()
  end

  local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  config.init_options = {
    -- bundles = bundles;
    extendedClientCapabilities = extendedClientCapabilities;
  }

  config.cmd = { 'java-lsp', workspace_folder }
  require('jdtls').start_or_attach(config)
end

return M
