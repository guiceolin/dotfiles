#!/bin/bash

source lib/plugins.zsh
source lib/dependencies.zsh

dotfiles:dependencies:install

dotfiles:plugins:install_plugins

remote_plugins=(
  https://github.com/zsh-users/zsh-syntax-highlighting.git
  https://github.com/zsh-users/zsh-autosuggestions.git
  https://github.com/zsh-users/zsh-history-substring-search.git
  https://github.com/zsh-users/zsh-completions.git
)

dotfiles:plugins:install_remote_plugins

# Link zshrc to $HOME
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.old
  ln -s $(realpath "zshrc") $HOME/.zshrc
else
  ln -sf $(realpath "zshrc") $HOME/.zshrc
fi

# Link zprofile to $HOME
if [[ -f ~/.zprofile ]]; then
  mv ~/.zprofile ~/.zprofile.old
  ln -s $(realpath "zshrc") $HOME/.zprofile
else
  ln -sf $(realpath "zshrc") $HOME/.zprofile
fi
