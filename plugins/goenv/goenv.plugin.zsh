(( $+commands[goenv] )) || return
eval "$(goenv init --no-rehash -)"
[[ -n "$GOROOT" ]] && path=($GOROOT/bin $path)
[[ -n "$GOPATH" ]] && path=($GOPATH/bin $path)
