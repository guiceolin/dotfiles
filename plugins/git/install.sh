#!/usr/bin/env zsh --login

autoload -Uz _dotfiles_link_to_config

_dotfiles_link_to_config git

# set -x
#
# ln -sf $DOTFILES/plugins/git/.config/git ~/.config
# mkdir -p $DOTFILES/plugins/git/bin
# pushd $DOTFILES/plugins/git/bin
# curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > diff-so-fancy
# chmod +x diff-so-fancy
# popd
#
# ln -sf $DOTFILES/plugins/git/bin/diff-so-fancy ~/.local/bin/

# TODO: install delta
