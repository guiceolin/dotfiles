# vim: ft=zsh

export DOTFILES_CONFIG=$HOME/.config/dotfiles
export DOTFILES=$HOME/dotfiles

path=($HOME/.local/bin $path)
fpath=(${DOTFILES}/lib $fpath)
autoload -Uz dotfiles
