#!/bin/sh

timestamp=$(date +%s)

# Link files from an specific directory
# $1 is the directory, relative to this file, aka ~/dotfiles
# $2 is the name of the array with filenames
function _link_files {
  # name of filenames array
  arry_name=("${!2}")

  # iterate over filenames
  for f in ${arry_name[@]}
  do

    # If file exists, or is a symbolic link
    if [ -e ~/${f} ] || [ -L ~/${f} ]
    then

      # backup then
      echo "${f} exists, moving to ${f}-dotfiles-${timestamp}.backup"
      mv ~/${f}  ~/${f}-dotfiles-${timestamp}.backup
    fi

    # link the new file
    ln -s ${PWD}/$1/${f} ~/${f}
  done
}

echo "Linking git stuff..."

git_files=(".gitignore .gitconfig")
_link_files "git" git_files
echo "Done!"

echo "Linking ruby stuff..."
ruby_files=(".gemrc")
_link_files "ruby" ruby_files
echo "done!"

echo "Linking tmux stuff..."
tmux_files=(".tmux.conf")
_link_files "tmux" tmux_files
echo "done!"
