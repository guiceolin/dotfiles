#!/usr/bin/env bash

mkdir -p ~/.config
if [[ -f ~/.config/alacritty ]]; then
  mv ~/.config/alacritty ~/.config/alacritty.old
fi
ln -sf $(realpath ".config/alacritty") ~/.config
