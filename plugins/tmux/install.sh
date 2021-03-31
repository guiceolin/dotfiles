#!/usr/bin/env bash

# Install Tmux

if ! type "tmux" > /dev/null; then
  printf "Installing Tmux from source...\n"
  rm -fr /tmp/tmux
  git clone https://github.com/tmux/tmux.git /tmp/tmux
  cd /tmp/tmux
  sh autogen.sh
  ./configure && make
  cp tmux ~/.local/bin
  cd -
  rm -fr /tmp/tmux
else
  printf "Tmux already installed, skiping install...\n"
fi

# Install tmux.conf

if [[ -f ~/.tmux.conf ]]; then
  mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -sf $DOTFILES/plugins/tmux/.tmux.conf $HOME/.tmux.conf
