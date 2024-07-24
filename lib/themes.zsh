local theme
zstyle -s :dotfiles:theme name theme
if [[ -f "$DOTFILES/themes/$theme.theme.zsh" ]] ; then
  source "$DOTFILES/themes/$theme.theme.zsh"
fi
unset theme
