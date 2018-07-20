#!/bin/bash

# Install Homebrew + dependencies
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

# Run install script for each plugin
for plugin in $(ls plugins)
do
  install_file=$(realpath "plugins/$plugin/install.sh")
  if [ -e $install_file ]; then
    pushd "plugins/$plugin" > /dev/null
    . $install_file 2&> /dev/null
    popd > /dev/null
  fi
done

# Link zshrc to $HOME
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.old
  ln -s $(realpath "zshrc") $HOME/.zshrc
else
  ln -sf $(realpath "zshrc") $HOME/.zshrc
fi
