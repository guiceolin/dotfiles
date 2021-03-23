#!/usr/bin/env zsh

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
