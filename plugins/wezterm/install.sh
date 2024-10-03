#!/usr/bin/env zsh 
autoload -Uz _dotfiles_link_to_config

_dotfiles_link_to_config wezterm
# 
# mkdir -p ~/.config
# if [[ -f ~/.config/wezterm ]]; then
#   mv ~/.config/wezterm ~/.config/wezterm.old
# fi
# ln -sf $DOTFILES/plugins/wezterm ~/.config
