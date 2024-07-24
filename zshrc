if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

source $DOTFILES/lib/lazy_load.zsh

#### Source Remote plugins
for file in $HOME/dotfiles/.remote_plugins/**/*.plugin.zsh(N); do
  source $file
done

## Source plugins
for file in $DOTFILES_CONFIG/enabled/***/*.plugin.zsh(N); do
  source $file
done

### THEMES
zstyle :dotfiles:theme name guiceolin

### Local Overrides
if [[ -f "$HOME/.zshrc.local" ]] ; then
  source "$HOME/.zshrc.local"
fi

local theme
zstyle -s :dotfiles:theme name theme
if [[ -f "$DOTFILES/themes/$theme.theme.zsh" ]] ; then
  source "$DOTFILES/themes/$theme.theme.zsh"
fi
unset theme

### Extras
EDITOR=nvim
export GTK_IM_MODULE=cedilla
autoload -Uz compinit
compinit
alias nvim-kickstart=NVIM_APPNAME="nvim-kickstart" nvim

unfunction lazy_load

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
