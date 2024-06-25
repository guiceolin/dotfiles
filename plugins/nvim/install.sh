#!/usr/bin/env bash

mkdir -p ~/.config
if [[ -f ~/.config/nvim ]]; then
  mv ~/.config/nvim ~/.config/nvim.old
fi
ln -sf $DOTFILES/plugins/nvim ~/.config
