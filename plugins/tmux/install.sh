#!/usr/bin/env bash

if [[ -f ~/.tmux.conf ]]; then
  mv ~/.tmux.conf ~/.tmux.conf.old
  ln -s $(realpath ".tmux.conf") $HOME
else
  echo "testing"
  ln -sf $(realpath ".tmux.conf") $HOME
fi
