# vim: ft=zsh

export DOTFILES_CONFIG=$HOME/.config/dotfiles
export DOTFILES=$HOME/dotfiles

path=($HOME/.local/bin $path)

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
