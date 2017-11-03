#!/bin/bash

user () {
  printf "\r  [ \033[0;33mASK\033[0m ] $1\n"
}

user '- Some plugins require sudo, continue? (Y/n)'
read -e USE_SUDO
if [[ "$USE_SUDO" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  sudo -v
else
  exit -1
fi

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

for plugin in $(find . -type d -maxdepth 1 -not -path . -not -path '*.git*')
do
  echo -n "Installing dotfiles for $(basename "$plugin")..."
  stow $(basename "$plugin")
  echo 'Done!'
done

for install in $(find ./*/ -name install.sh -maxdepth 1 -not -path '*.git' -not -path .)
do
  echo -n "Running install script for $(dirname "$install")..."
  . $install 2&> /dev/null
  echo "Done!"
done


# Vim Stuff
nvim +PluginInstall +UpdateRemotePlugins +qall
