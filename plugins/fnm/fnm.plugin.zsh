lazy_load 'fnm' 'node' 'npm' 'npx' <<- 'EOF'
  FNM_PATH="$HOME/.local/share/fnm"
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
EOF
