# vim:ft=zsh

local conf="${0:h}/remote_plugins"
local dest="$DOTFILES/.remote_plugins"

[[ -f "$conf" ]] || return 0

while IFS= read -r url || [[ -n "$url" ]]; do
  [[ "$url" =~ '^[[:space:]]*#' || -z "${url// }" ]] && continue
  local name="${url:t}"
  if [[ -d "$dest/$name" ]]; then
    echo "[dotfiles/zsh] $name already cloned, skipping"
    continue
  fi
  echo "[dotfiles/zsh] cloning $name..."
  git clone "$url" "$dest/$name"
done < "$conf"
