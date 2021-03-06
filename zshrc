export DOTFILES=$HOME/dotfiles

#### Source Remote plugins
for file in $HOME/dotfiles/.remote_plugins/**/*.plugin.zsh; do
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

EDITOR=nvim
