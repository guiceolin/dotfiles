#!/usr/bin/env bash

if [[ -f ~/.config/iterm2 ]]; then
  mv ~/.config/iterm2 ~/.config/iterm2.old
  ln -s $(realpath ".config/iterm2") ~/.config
else
  ln -sf $(realpath ".config/iterm2") ~/.config
fi
