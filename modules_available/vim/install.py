import os
home = os.getenv("HOME")
def install(module_dir,logger):
  print module_dir
  if not os.path.exists(home + '/.vim'):
    os.symlink(module_dir + '/assets/dotvim/', home + '/.vim')
  else:
    logger.log('\nvim directory alread exists, skipping...')
  if not os.path.exists(home + '/.vimrc'):
    os.symlink(module_dir + "/assets/dotvim/vimrc", home + '/.vimrc')
  else:
    logger.log('\nvimrc already exists, skipping...')

