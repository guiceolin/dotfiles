#!/usr/bin/env bash

mkdir -p ~/.config
if [[ -f ~/.config/nvim ]]; then
  mv ~/.config/nvim ~/.config/nvim.old
  ln -s $(realpath ".config/nvim") ~/.config
else
  ln -sf $(realpath ".config/nvim") ~/.config
fi

pyenv install -s 3.6.6
pyenv global 3.6.6

pip install --upgrade pip
pip install virtualenv

mkdir -p ~/.local/.venv/
virtualenv ~/.local/.venv/

export VIRTUAL_ENV="$HOME/.local/.venv"
old_path=$PATH
export PATH="$VIRTUAL_ENV/bin:$PATH"

pip install neovim

pip install flake8
ln -s `pyenv which flake8` ~/.local/bin/flake8

export PATH=$old_path
