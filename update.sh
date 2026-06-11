#!/usr/bin/env zsh

DOTFILES=${0:A:h}
DOTFILES_CONFIG=$HOME/.config/dotfiles

verbose=0
[[ "$1" == "-v" || "$1" == "--verbose" ]] && verbose=1

_log()  { print -- "  $*"; }
_vlog() { (( verbose )) && print -- "  $*"; }
_warn() { print -- "  [!] $*" >&2; }

# 1. Shell symlinks
print "==> shell symlinks"
for name in zshenv zshrc zprofile; do
  target=$DOTFILES/$name
  link=$HOME/.$name

  if [[ ! -f $target ]]; then
    _vlog "[skip] .$name — source not found"
    continue
  fi

  if [[ -L $link && $(readlink $link) == $target ]]; then
    _vlog "[ok] .$name"
  else
    ln -sf $target $link
    _log "[updated] .$name"
  fi
done
