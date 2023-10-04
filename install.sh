#!/usr/bin/env zsh

# Link zshrc to $HOME
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.old
fi
ln -sf $PWD/zshrc $HOME/.zshrc

# Link zprofile to $HOME
if [[ -f ~/.zprofile ]]; then
  mv ~/.zprofile ~/.zprofile.old
fi
ln -sf $PWD/zprofile $HOME/.zprofile

mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config/dotfiles/enabled/
