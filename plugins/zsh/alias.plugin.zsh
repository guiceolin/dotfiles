# Key bindings
# Emacs mode
bindkey -e
# Bind ctrl-left / ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# Bind home / end
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
