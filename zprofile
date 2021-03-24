export DOTFILES_CONFIG=$HOME/.config/dotfiles

#### Source plugins
for file in $DOTFILES_CONFIG/enabled/**/*.zprofile.zsh(N); do
  source $file
done


