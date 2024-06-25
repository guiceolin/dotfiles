#!/usr/bin/env bash

# Install Tmux

rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
sh autogen.sh
./configure && make
cp tmux ~/.local/bin
cd -
rm -fr /tmp/tmux
