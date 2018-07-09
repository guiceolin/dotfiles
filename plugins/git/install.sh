#!/usr/bin/env bash

if [[ -f ~/.config/git ]]; then
  mv ~/.config/git ~/.config/git.old
  ln -s $(realpath ".config/git") ~/.config
else
  ln -sf $(realpath ".config/git") ~/.config
fi
