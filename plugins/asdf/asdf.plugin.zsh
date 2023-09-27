asdf_dir="${asdf_dir:-$HOME/.asdf}"

if [[ -d $asdf_dir ]]; then
  source $asdf_dir/asdf.sh
fi

fpath=(${ASDF_DIR}/completions $fpath)

#if [ -f "$HOME/.asdf/plugins/java/set-java-home.zsh" ]; then
#  . ~/.asdf/plugins/java/set-java-home.zsh
#fi
