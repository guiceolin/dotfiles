if [ -d "$HOME/.asdf" ]; then

  . $HOME/.asdf/asdf.sh

fi

if [ -f "$HOME/.asdf/plugins/java/set-java-home.zsh" ]; then
  . ~/.asdf/plugins/java/set-java-home.zsh
fi
