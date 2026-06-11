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

# 2. Remote plugins
remote_dir=$DOTFILES/.remote_plugins
if [[ -d $remote_dir ]]; then
  print "==> remote plugins"
  for dir in $remote_dir/*(N/); do
    name=${dir:t}
    before=$(git -C $dir rev-parse HEAD 2>/dev/null)
    if ! git -C $dir pull --quiet 2>/dev/null; then
      _warn "$name: git pull failed"
      continue
    fi
    after=$(git -C $dir rev-parse HEAD 2>/dev/null)
    if [[ $before != $after ]]; then
      _log "[updated] $name"
    else
      _vlog "[ok] $name"
    fi
  done
fi

# 3. Broken symlinks
print "==> enabled plugins"
broken=0
for link in $DOTFILES_CONFIG/enabled/*(N); do
  if [[ -L $link && ! -e $link ]]; then
    _warn "broken symlink: ${link:t}"
    (( broken++ ))
  fi
done
(( broken == 0 )) && _vlog "[ok] no broken symlinks"

print "Done."
