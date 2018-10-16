#!/usr/bin/env bash

if [[ -f ~/.config/nvim ]]; then
  mv ~/.config/nvim ~/.config/nvim.old
  ln -s $(realpath ".config/nvim") ~/.config
else
  ln -sf $(realpath ".config/nvim") ~/.config
fi

ln -s `pyenv which python` ~/.local/bin/neovim_python3
