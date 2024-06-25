
local home_dir = os.getenv('HOME')
local dotfiles_dir = os.getenv('DOTFILES')


local M = {}

function M.setup()
  local root_markers = { 'gradlew', 'pom.xml' }
  local root_dir = require('jdtls.setup').find_root(root_markers)
  local home = os.getenv('HOME')

  local workspace_folder = home_dir .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t") .. '/'

  local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  local cmd = {

   home_dir .. '/.asdf/installs/java/openjdk-17/bin/java',

   '-javaagent:' .. dotfiles_dir .. '/plugins/nvim/lsp/java/lombok.jar',
   '-Xbootclasspath/a:' .. dotfiles_dir .. '/plugins/nvim/lsp/java/lombok.jar',

   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
   '-Dosgi.bundles.defaultStartLevel=4',
   '-Declipse.product=org.eclipse.jdt.ls.core.product',
   '-Dlog.protocol=true',
   '-Dlog.level=ALL',
   '-Xms1g',
   '--add-modules=ALL-SYSTEM',
   '--add-opens', 'java.base/java.util=ALL-UNNAMED',
   '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

   '-jar', dotfiles_dir .. "/plugins/nvim/lsp/java/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar",

   '-configuration', dotfiles_dir .. "/plugins/nvim/lsp/java/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac",
   '-data', workspace_folder
 }



  local capabilities = {
    workspace = {
      configuration = true
    },
    textDocument = cmp_capabilities.textDocument
  }


  local bundles = {
     vim.fn.glob("$DOTFILES/plugins/nvim/lsp/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
   }
   vim.list_extend(bundles, vim.split(vim.fn.glob("$DOTFILES/plugins/nvim/lsp/java/vscode-java-test/server/*.jar", 1), "\n"))



  local config = {
 --   flags = {
 --     allow_incremental_sync = true,
 --   },
    capabilities = capabilities,
    init_options = {
      bundles = bundles
    }
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
  -- config.cmd = { 'java-lsp', workspace_folder }
  config.cmd = cmd
  require('jdtls').start_or_attach(config)
end

return M
