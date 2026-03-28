# Ensure zprofile is loaded even in non-login shells (common on Linux/Fedora)
[[ -z "$DOTFILES" ]] && source "${ZDOTDIR:-$HOME}/.zprofile"

# Use zprof if ZSH_DEBUGRC=1
# This is used to test initializing time for this zshrc
# To debug, just start new shell with ZSH_DEBUGRC setted, aka:
# 
# $ time ZSH_DEBUGRC=1 zsh -i -c exit
#
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

# Enable Lazy load to the plugins.
# TODO: Put an exemple here
source $DOTFILES/lib/lazy_load.zsh

## Source enabled plugins
# To enable a plugin, just synlink it to $DOTFILES_CONFIG/enabled/
# E.g.:
#
# $ ln -s $DOTFILES/plugins/zsh/ zsh
#
# DOTFILES_LOADED_PLUGINS is exported so subshells (e.g. tmux panes) inherit
# the list and skip re-sourcing plugins that are already loaded.
typeset -gx DOTFILES_LOADED_PLUGINS
for file in $DOTFILES_CONFIG/enabled/***/*.plugin.zsh(N); do
  local plugin_name=${file:h:t}
  if [[ ":$DOTFILES_LOADED_PLUGINS:" != *":$plugin_name:"* ]]; then
    source $file
    DOTFILES_LOADED_PLUGINS="${DOTFILES_LOADED_PLUGINS:+$DOTFILES_LOADED_PLUGINS:}$plugin_name"
  fi
done

# for security reason, we unload lazy load function
# after our plugins are loaded.
unfunction lazy_load

#### Source Remote plugins
#    TODO: make a better way to install and manage external plugins
for file in $HOME/dotfiles/.remote_plugins/**/*.plugin.zsh(N); do
  source $file
done

### Local Overrides
# Use this file to put your customization i.e. themes, alias, etc
if [[ -f "$HOME/.zshrc.local" ]] ; then
  source "$HOME/.zshrc.local"
fi

# this theme is defined on $DOTFILES/themes/ folder.
source $DOTFILES/lib/themes.zsh

# end zprof 
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
