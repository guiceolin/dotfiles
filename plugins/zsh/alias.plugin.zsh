#### History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

alias ls="exa"
alias cat="bat"

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
