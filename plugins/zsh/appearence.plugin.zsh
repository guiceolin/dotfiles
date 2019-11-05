#### Theme and Appearence
# FROM: https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/theme-and-appearance.zsh
####

## ls colors
#autoload -U colors && colors
## Enable ls colors
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
## export LSCOLORS="Gxfxcxdxbxegedabagacad"
#ls -G . &>/dev/null && alias ls='ls -G'

# only use coreutils ls if there is a dircolors customization present ($LS_COLORS or .dircolors file)
# otherwise, gls will use the default color scheme which is ugly af
#[[ -n "$LS_COLORS" || -f "$HOME/.dircolors" ]] && gls --color -d . &>/dev/null && alias ls='gls --color=tty'
#### END theme and Appearence

### Colored Man Pages
# FROM: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh
####
#
#man() {
#  env \
#    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
#    LESS_TERMCAP_md=$(printf "\e[1;31m") \
#    LESS_TERMCAP_me=$(printf "\e[0m") \
#    LESS_TERMCAP_se=$(printf "\e[0m") \
#    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#    LESS_TERMCAP_ue=$(printf "\e[0m") \
#    LESS_TERMCAP_us=$(printf "\e[1;32m") \
#    PAGER="${commands[less]:-$PAGER}" \
#    _NROFF_U=1 \
#    PATH="$HOME/bin:$PATH" \
#    man "$@"
#}
#
##### END Colored Man Pages


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
