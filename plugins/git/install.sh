#!/usr/bin/env bash

mkdir -p ~/.config
if [[ -f ~/.config/git ]]; then
  mv ~/.config/git ~/.config/git.old
fi

ln -sf $DOTFILES/plugins/git/.config/git ~/.config
