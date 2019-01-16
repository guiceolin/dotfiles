#### Source plugins
for file in $HOME/dotfiles/plugins/**/*.zprofile.zsh; do
  source $file
done

path=(
  $path
  $HOME/.local/bin
)
