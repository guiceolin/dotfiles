setopt prompt_subst      # enable parameter expansion and command substitution in the prompt
setopt transient_rprompt # only show the rprompt on the current prompt
unsetopt auto_name_dirs  # prevent env variables from replacing directory names in the prompt

local theme
zstyle -s :dotfiles:theme name theme
if [[ -f "$DOTFILES/themes/$theme.theme.zsh" ]] ; then
  source "$DOTFILES/themes/$theme.theme.zsh"
fi
unset theme
