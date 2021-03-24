#!/usr/bin/env bash

mkdir -p ~/.config
if [[ -f ~/.config/nvim ]]; then
  mv ~/.config/nvim ~/.config/nvim.old
fi
ln -sf $DOTFILES/plugins/nvim/.config/nvim ~/.config

# # Install python 3
# pyenv install -s 3.6.6
# pyenv global 3.6.6
# 
# pip install --upgrade pip
# pip install virtualenv
# 
# NVIM_VIRTUALENV=~/.local/.venv
# 
# mkdir -p $NVIM_VIRTUALENV
# virtualenv $NVIM_VIRTUALENV
# 
# $NVIM_VIRTUALENV/bin/pip install neovim flake8 black
# 
# ln -s $HOME/.local/.venv/bin/flake8 ~/.local/bin/flake8

git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
