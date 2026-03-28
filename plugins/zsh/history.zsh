HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history       # save timestamp and duration of commands
setopt inc_append_history     # add commands as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups       # do not write events to history that are duplicates of previous events
setopt hist_ignore_all_dups   # delete old recorded entry if new entry is a duplicate
setopt hist_ignore_space      # remove command from history when first character is a space
setopt hist_find_no_dups      # when searching history don't display results already cycled through twice
setopt hist_reduce_blanks     # remove extra blanks from each command line being added to history
setopt hist_verify            # don't execute, just expand history
setopt hist_no_store          # remove the history (fc -l) command from the history list when invoked
setopt nosharehistory
