# Key bindings
# Emacs mode
bindkey -e
# Bind ctrl-left / ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# Bind home / end
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey ' ' magic-space

alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias nvim-kickstart=NVIM_APPNAME="nvim-kickstart" nvim
