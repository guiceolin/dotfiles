local home_dir = os.getenv('HOME')
local dotfiles_dir = os.getenv('DOTFILES')
local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml'})

local workspace_folder = home_dir .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t") .. '/'
local config = {
  cmd = {

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

   '-jar', dotfiles_dir .. "/plugins/nvim/lsp/java/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",

   '-configuration', dotfiles_dir .. "/plugins/nvim/lsp/java/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac",
   '-data', workspace_folder
 },

  -- root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
--   settings = {
--     java = {
--     }
--   },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}

require('jdtls').start_or_attach(config)
