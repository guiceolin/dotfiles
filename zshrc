export DOTFILES=$HOME/dotfiles
export DOTFILES_CONFIG=$HOME/.config/dotfiles

#### Source Remote plugins
for file in $HOME/dotfiles/.remote_plugins/**/*.plugin.zsh(N); do
  source $file
done

## Source plugins
for file in $DOTFILES_CONFIG/enabled/***/*.plugin.zsh(N); do
  source $file
done

zstyle :dotfiles:theme name guiceolin

if [[ -f "$HOME/.zshrc.local" ]] ; then
  source "$HOME/.zshrc.local"
fi

local theme
zstyle -s :dotfiles:theme name theme
if [[ -f "$DOTFILES/themes/$theme.theme.zsh" ]] ; then
  source "$DOTFILES/themes/$theme.theme.zsh"
fi
unset theme

path=(
  $HOME/.local/bin
  $path
)


### Extras
EDITOR=nvim
export GTK_IM_MODULE=cedilla
autoload -Uz compinit
compinit
