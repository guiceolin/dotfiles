#### Source plugins
for file in $HOME/dotfiles/plugins/**/*.plugin.zsh; do
  source $file
done

#### Source Remote plugins
for file in $HOME/dotfiles/.remote_plugins/**/*.plugin.zsh; do
  source $file
done

zstyle :dotfiles:theme name guiceolin

local theme
zstyle -s :dotfiles:theme name theme
if [[ -f "$HOME/dotfiles/themes/$theme.theme.zsh" ]] ; then
  source "$HOME/dotfiles/themes/$theme.theme.zsh"
fi
unset theme

if [[ -f "$HOME/.zshrc.local" ]] ; then
  source "$HOME/.zshrc.local"
fi
