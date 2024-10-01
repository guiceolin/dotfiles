#!/usr/bin/env bash

mkdir -p ~/.config
if [[ -f ~/.config/wezterm ]]; then
  mv ~/.config/wezterm ~/.config/wezterm.old
fi
ln -sf $DOTFILES/plugins/wezterm ~/.config
