import os
class PluginLister:
  def __init__(self, current_dir):
    self.current_dir = current_dir

  def list(self):
    enabled_path = self.current_dir + '/modules_enabled/'
    available_path = self.current_dir + '/modules_available/'

    # list all links on enabled_path
    installed_plugin_names = [ name for name in os.listdir(enabled_path) if os.path.islink(os.path.join(enabled_path, name)) ]
    # list all Directories on available path
    available_plugin_names = [ name for name in os.listdir(available_path) if os.path.isdir(os.path.join(available_path, name)) ]
    # get only non instaled plugin names
    available_plugin_names = list(set(available_plugin_names) - set(installed_plugin_names))

    print 'Available Plugins'
    for available in available_plugin_names:
      print available
    print '\nInstaled Plugins'
    for installed in installed_plugin_names:
      print installed
