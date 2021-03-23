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

export DOTFILES_HOME=$HOME/dotfiles

# Link zshrc to $HOME
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.old
fi
ln -sf $DOTFILES_HOME/zshrc $HOME/.zshrc

# Link zprofile to $HOME
if [[ -f ~/.zprofile ]]; then
  mv ~/.zprofile ~/.zprofile.old
fi
ln -sf $DOTFILES_HOME/zprofile $HOME/.zprofile

mkdir -p $HOME/.local/bin
