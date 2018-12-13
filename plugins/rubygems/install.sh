#!/usr/bin/env bash

mkdir -p ~/.config
if [[ -f ~/.gemrc ]]; then
  mv ~/.gemrc ~/.gemrc.old
  ln -s $(realpath ".gemrc") $HOME
else
  ln -sf $(realpath ".gemrc") $HOME
fi
