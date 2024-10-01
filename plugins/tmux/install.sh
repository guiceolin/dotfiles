#!/usr/bin/env bash

if [[ -f ~/.tmux.conf ]]; then
  mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -sf $DOTFILES/plugins/tmux/.tmux.conf $HOME/.tmux.conf
