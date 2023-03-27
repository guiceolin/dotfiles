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

PACKER_PATH=~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [ ! -d $PACKER_PATH ]; then
  git clone https://github.com/wbthomason/packer.nvim $PACKER_PATH
fi

# Install LSPs
if [ ! -d $DOTFILES/plugins/nvim/lsp ]; then
  mkdir -p $DOTFILES/plugins/nvim/lsp
fi

pushd $DOTFILES/plugins/nvim/lsp

# Lua LSP
# Java JDTLS
mkdir -p java
cd java
if [ ! -d './eclipse.jdt.ls' ]; then
  wget https://projectlombok.org/downloads/lombok.jar
  git clone https://github.com/eclipse/eclipse.jdt.ls.git
  cd eclipse.jdt.ls
  ./mvnw clean verify -DskipTests
  cd ..
  git clone https://github.com/microsoft/java-debug
  cd java-debug
  ./mvnw clean install -DskipTests
  cd ..
fi
cd ..
ln -s $DOTFILES/plugins/nvim/bin/java-lsp $HOME/.local/bin

popd

