export BAT_THEME=gruvbox-dark

if [ -x "$(command -v bat)" ]
then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  alias cat="bat"
fi
