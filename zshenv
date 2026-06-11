# vim: ft=zsh

export DOTFILES=$HOME/dotfiles
export DOTFILES_CONFIG=$HOME/.config/dotfiles

path=($HOME/.local/bin $path)

setopt extendedglob
for file in $DOTFILES_CONFIG/enabled/***/*.env.zsh(N); do
  source $file
done
