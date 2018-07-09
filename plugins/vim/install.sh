#!/usr/bin/env bash
declare -a files=(vim vimrc)

for file in "${files[@]}"
do
  dest="~/.${file}"
  if [[ -f $dest ]]; then
    mv $dest $dest.old
    ln -s $(realpath $file) "$HOME/.${file}"
  else
    ln -sf $(realpath "${file}") "$HOME/.${file}"
  fi
done


