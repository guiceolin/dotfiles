import os
def install(module_dir, logger):
  home = os.getenv("HOME")
  if not os.path.exists(home +'/.gitconfig'):
    os.symlink(module_dir + '/assets/gitconfig', home + '/.gitconfig')
  else:
    logger.log("\ngitconfig already exists, skipping...")
  if not os.path.exists(home+'/.gitignore'):
    os.symlink(module_dir + '/assets/gitignore', home + '/.gitignore')
  else:
    logger.log("\ngitignore already exists, skipping...")


