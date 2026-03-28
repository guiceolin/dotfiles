# Emacs mode
bindkey -e

# ctrl-left / ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

# home / end
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# history substring search (requires zsh-history-substring-search)
if (( $+functions[history-substring-search-up] )); then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

bindkey ' ' magic-space
