#!/usr/bin/env bash
declare -a files=(vim vimrc)

for file in "${files[@]}"
do
  dest="~/.${file}"
  if [[ -f $dest ]]; then
    mv $dest $dest.old
    ln -snf $(realpath $file) "$HOME/.${file}"
  else
    ln -snf $(realpath "${file}") "$HOME/.${file}"
  fi
done


