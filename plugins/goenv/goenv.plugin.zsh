(( $+functions[lazy_load] )) || source "$DOTFILES/lib/lazy_load.zsh"

lazy_load 'goenv' 'go' <<- 'EOF'
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$GOPATH/bin:$PATH"
EOF
