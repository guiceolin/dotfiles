#!/bin/bash

ask-user () {
  printf "\r  [ \033[0;33mASK\033[0m ] $1\n"
}

ask-for-sudo () {
  ask-user '- Some plugins require sudo, continue? (Y/n)'
  read -e USE_SUDO
  if [[ "$USE_SUDO" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    sudo -v
  else
    exit -1
  fi
}

define-system-architecture () {
  unameOut="$(uname -s)"
  case "${unameOut}" in
    Linux*)     os_type=Linux;;
    Darwin*)    os_type=Mac;;
    CYGWIN*)    os_type=Cygwin;;
    MINGW*)     os_type=MinGw;;
    *)          os_type="UNKNOWN:${unameOut}"
  esac
}

install-system-dependencies () {
  # Install Homebrew + dependencies
  if [ ${os_type} == "Mac" ]; then
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
    echo "> Not supported yet!"
    exit -2
  fi
}

define-system-architecture
ask-for-sudo
install-system-dependencies

for plugin in $(ls plugins)
do
  install_file=$(realpath "plugins/$plugin/install.sh")
  if [ -e $install_file ]; then
    . $install_file 2&> /dev/null
  fi
done

if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.old
  ln -s $(realpath "zshrc") $HOME/.zshrc
else
  ln -sf $(realpath "zshrc") $HOME/.zshrc
fi
