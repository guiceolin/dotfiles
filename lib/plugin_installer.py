import os
class PluginInstaller:

  def __init__(self, name, current_dir, logger):
    self.name = name
    self.current_dir = current_dir
    self.logger = logger

  def install(self):
    home = os.getenv('HOME')
    enabled_path = self.current_dir + '/modules_enabled/' + self.name

    if not os.path.exists(enabled_path):
      self.logger.log("Installing '" + self.name + "' module...\n")
      os.symlink(self.current_dir + '/modules_available/' + self.name, enabled_path )
      self.logger.log("checking files to link to user home...")
      if os.path.exists(enabled_path + '/home/'):
        self.logger.log(' done!\n')
        files = os.listdir(enabled_path + '/home/')
        for f in files:
          if not os.path.exists(home + '/' + f ):
            self.logger.log('Creating link to ' + f + ' file...')
            os.symlink(enabled_path + '/home/' + f, home + '/' + f)
            self.logger.log(' done!\n')
          else:
            self.logger.log("'" + f + "' already exists, skipping...\n")
      self.logger.log('done!\n')
    else:
      self.logger.log("'" + self.name +"' module already installed, skipping...\n")
