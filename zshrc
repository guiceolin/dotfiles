# zmodload zsh/zprof
## START Zplug config
#zstyle :omz:plugins:ssh-agent identities id_rsa Github_pecigonzalo
#
## Check if zplug is installed
if [[ ! -f ~/.zplug/init.zsh ]]; then
  git clone https://github.com/b4b4r07/zplug ~/.zplug
  source ~/.zplug/init.zsh
else
  # Load ZPLUG
  source ~/.zplug/init.zsh
fi

# Basic utils
# zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh, if:"which ssh-agent"
zplug "plugins/z", from:oh-my-zsh
zplug "rimraf/k", from:github, as:plugin

# Misc
# zsh-syntax-highlighting must be loaded after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-autosuggestions", defer:3

# Set Theme
# zplug "mafredri/zsh-async", from:github, defer:0  # Load this first
# zplug "pecigonzalo/pure-spaceship-zsh-theme", use:pure.zsh, from:github, as:theme
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# zplug "denysdovhan/spaceship-zsh-theme", as:theme, defer:3
zplug "guiceolin/zsh-theme", use:theme.zsh, as:theme, defer:3

# And load
# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  printf "Install plugins? [y/N] "
  if read -q; then
    echo
    zplug install
  else
    echo
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

## FINISH Zplug config


## GOLANG
export GOPATH=$HOME/projects/golang
export GOROOT=/usr/local/opt/go/libexec
path=(
  $path
  $GOPATH/bin
  $GOROOT/bin
)


fpath=(/usr/local/share/zsh-completions $fpath)

############################################################################################

setopt no_beep              # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)

# ===== Changing Directories
setopt auto_cd           # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt cdablevarS        # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack
setopt auto_pushd        # make cd push the old directory onto the directory stack
setopt pushdminus        # swapped the meaning of cd +1 and cd -1; we want them to mean the opposite of what they mean im csh

# ===== Expansion and Globbing
setopt extendedglob # treat #, ~, and ^ as part of patterns for filename generation

# ===== History
setopt append_history         # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history       # save timestamp of command and duration
setopt inc_append_history     # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups       # do not write events to history that are duplicates of previous events
setopt hist_ignore_all_dups   # delete old recorded entry if new entry is a duplicate.
setopt hist_ignore_space      # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups      # when searching history don't display results already cycled through twice
setopt hist_reduce_blanks     # remove extra blanks from each command line being added to history
setopt hist_verify            # don't execute, just expand history
setopt share_history          # imports new commands and appends typed commands to history
setopt hist_no_store          # remove the history (fc -l) command from the history list when invoked
setopt long_list_jobs         # list jobs in the long format by default

# ===== Completion
setopt always_to_end      # when completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu          # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs     # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word   # allow completion from within a word/phrase
setopt auto_list          # automatically list choices on ambiguous completion.
unsetopt complete_aliases   # an alias of a command should complete to the command completion
unsetopt menu_complete    # do not autoselect the first completion entry
unsetopt flowcontrol      # do not freezes output to the terminal until you type ^q

# ===== Correction
# setopt correct # spelling correction for commands
# setopt correct_all # spelling correction for arguments

# ===== Prompt
setopt prompt_subst      # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt # only show the rprompt on the current prompt
unsetopt auto_name_dirs  # do not set auto_name_dirs because it messes up prompts

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted

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
# zstyle ':completion::complete:*' cache-path "$HOME/.zsh/cache"

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
  clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
  gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
  ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
  operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
  usbmux uucp vcsa wwwrun xfs '_*'

# Key bindings
# Emacs mode
bindkey -e
# Bind ctrl-left / ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# Bind home / end
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

#### Theme and Appearence
# FROM: https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/theme-and-appearance.zsh
####

# ls colors
autoload -U colors && colors
# Enable ls colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls -G . &>/dev/null && alias ls='ls -G'

# only use coreutils ls if there is a dircolors customization present ($LS_COLORS or .dircolors file)
# otherwise, gls will use the default color scheme which is ugly af
[[ -n "$LS_COLORS" || -f "$HOME/.dircolors" ]] && gls --color -d . &>/dev/null && alias ls='gls --color=tty'
#### END theme and Appearence

### Colored Man Pages
# FROM: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh
####

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    PAGER="${commands[less]:-$PAGER}" \
    _NROFF_U=1 \
    PATH="$HOME/bin:$PATH" \
    man "$@"
}

#### END Colored Man Pages

#### History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

#### Source plugins
for file in $HOME/dotfiles/plugins/**/*.plugin.zsh; do
  source $file
done

