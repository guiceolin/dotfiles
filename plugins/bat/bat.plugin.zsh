if [ -x "$(command -v bat)" ]; then
  export BAT_THEME=gruvbox-dark
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  alias cat="bat"
elif [ -x "$(command -v batcat)" ]; then
  export BAT_THEME=gruvbox-dark
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  alias bat="batcat"
  alias cat="batcat"
else
  echo "[dotfiles] bat is not installed. Install it to enable syntax highlighting."
fi
