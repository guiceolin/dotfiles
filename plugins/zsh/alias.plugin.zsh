#### History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

alias ls="exa"

if [ -x "$(command -v bat)" ]
then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  alias cat="bat"
fi

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
