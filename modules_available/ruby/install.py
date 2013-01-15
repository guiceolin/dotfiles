import os
def install(module_dir, logger):
  if not os.path.exists(home+'/.gemrc'):
    os.symlink(module_dir + '/assets/gemrc', home + '/.gemrc')
  else:
      log('\ngemrc already exists, skipping...')
  if not os.path.exists(home + '/.irbrc'):
    os.symlink(module_dir + '/assets/irbrc', home + '/.irbrc')
  else:
    log('\nirbrc already exists, skipping...')

