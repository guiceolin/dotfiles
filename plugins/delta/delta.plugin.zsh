if ! command -v delta &>/dev/null; then
  echo "[dotfiles] delta is not installed. Install it to enable git diff highlighting."
  echo "[dotfiles] Fedora: dnf install git-delta | macOS: brew install git-delta"
  return
fi

# TODO: when dotfiles gets a disable hook, remove this include on plugin disable
# instead of leaving an orphaned entry in the global git config.
# See: /home/guiceolin/dotfiles/TODO.md
local gitconfig="$DOTFILES_CONFIG/enabled/delta/gitconfig"
if ! git config --global --get-all include.path | grep -qF "$gitconfig"; then
  git config --global --add include.path "$gitconfig"
fi
