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

# Local overrides
if [[ ! -f $HOME/.zshrc.local ]]; then
  echo ""
  echo "Note: ~/.zshrc.local does not exist."
  echo "Copy $PWD/zshrc.local to ~/.zshrc.local to set your theme and local customizations:"
  echo ""
  echo "  cp $PWD/zshrc.local ~/.zshrc.local"
  echo ""
fi
