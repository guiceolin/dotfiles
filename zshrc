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

fpath=(/usr/local/share/zsh-completions $fpath)

############################################################################################

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

#### Source plugins
for file in $HOME/dotfiles/plugins/**/*.plugin.zsh; do
  source $file
done

