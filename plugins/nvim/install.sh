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

# Install LSPs

mkdir -p $DOTFILES/plugins/nvim/lsp

pushd $DOTFILES/plugins/nvim/lsp
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
ninja -f ninja/macos.ninja
cd ../..
./3rd/luamake/luamake rebuild
cd ..
popd

