local M = {}

function M.setup()
  local root_markers = { 'gradlew', 'pom.xml' }
  local root_dir = require('jdtls.setup').find_root(root_markers)
  local home = os.getenv('HOME')

  local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()


  local capabilities = {
    workspace = {
      configuration = true
    },
    textDocument = cmp_capabilities.textDocument
  }

  local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
  local config = {
    flags = {
      allow_incremental_sync = true,
    },
    capabilities = capabilities,
  }

  --   config.on_init = function(client, _)
  --     client.notify('workspace/didChangeConfiguration', { settings = config.settings })
  --   end
  --   config.on_attach = function(client, buffnr)
  --     require'jdtls.setup'.add_commands()
  --     require'plugins.lsp.keymap'.on_attach(client, buffnr)
  --   end
  --
  --   local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
  --   extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  --   config.init_options = {
  --     -- bundles = bundles;
  --     extendedClientCapabilities = extendedClientCapabilities;
  --   }

  config.cmd = { 'java-lsp', workspace_folder }
  require('jdtls').start_or_attach(config)
end

return M
