autoload -U compinit && compinit

# ===== Completion
setopt always_to_end      # when completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu          # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt complete_in_word   # allow completion from within a word/phrase
setopt auto_list          # automatically list choices on ambiguous completion.
unsetopt complete_aliases # an alias of a command should complete to the command completion
unsetopt menu_complete    # do not autoselect the first completion entry
unsetopt flowcontrol      # do not freeze output to the terminal until you type ^q

# ZSH Completion config
zstyle '*' single-ignored show
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Process completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache 1

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm bin daemon ftp games halt lp mail man news nobody ntp \
  operator root shutdown sshd sync uucp www-data '_*'
