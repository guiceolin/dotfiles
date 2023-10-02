#vim:ft=zsh

export DOTFILES_CONFIG=$HOME/.config/dotfiles
export DOTFILES=$HOME/dotfiles

fpath=(${DOTFILES}/lib $fpath)
autoload -Uz dotfiles

#### Source plugins
for file in $DOTFILES_CONFIG/enabled/**/*.zprofile.zsh(N); do
  source $file
done


