dotfiles:dependencies:install(){

  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo pacman -Syyu
    sudo pacman -S --needed - < pkglist.txt

  elif [[ "$OSTYPE" == "darwin"* ]]; then

    which -s brew
    if [[ $? != 0 ]] ; then
      echo -n "> Brew not found. Installing..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo " done!"
    else
      echo "> Homebrew already installed, skipping."
    fi

    echo -n "> Installing brew dependencies..."
    brew bundle install &> /dev/null
    echo " done!"

  else
          echo "> Unknown OS, aborting..."
          return 1
  fi

  # Install Homebrew + dependencies
  }
