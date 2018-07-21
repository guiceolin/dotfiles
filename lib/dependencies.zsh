dotfiles:dependencies:install(){
  # Install Homebrew + dependencies
  which -s brew
  if [[ $? != 0 ]] ; then
    dotfiles:dependencies:install_manager
  else
    echo "> Homebrew already installed, skipping."
  fi

  echo -n "> Installing brew dependencies..."
  brew bundle install &> /dev/null
  echo " done!"
}

dotfiles:dependencies:install_manager(){
  echo -n "> Brew not found. Installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo " done!"
}
