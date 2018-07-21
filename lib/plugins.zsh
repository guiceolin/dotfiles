dotfiles:plugins:install_plugins(){
  # Run install script for each plugin
  for plugin in $(ls plugins)
  do
    install_file=$(realpath "plugins/$plugin/install.sh")
    if [ -e $install_file ]; then
      echo $plugin
      pushd "plugins/$plugin" > /dev/null
      . $install_file 2&> /dev/null
      popd > /dev/null
    fi
  done
}

dotfiles:plugins:install_remote_plugins(){
  echo -n '> Fething remote plugins...'
  pushd .remote_plugins > /dev/null
  for plugin in ${remote_plugins[@]}
  do
    repo_name=$(basename -s .git $plugin)
    if [[ ! -d "$repo_name" ]] ; then
      git clone $plugin
    fi
  done
  popd > /dev/null
}
