#!/usr/bin/env zsh

autoload -Uz _dotfiles_link_to_config
_dotfiles_link_to_config git

local gitconfig_user="$HOME/.gitconfig.user"

if [[ -f "$gitconfig_user" ]]; then
  echo "[dotfiles] ~/.gitconfig.user already exists, skipping."
  return
fi

echo ""
echo "[dotfiles] Let's set up your personal git identity."
echo "[dotfiles] This will create ~/.gitconfig.user (not versioned)."
echo ""

local name email signingkey github_user
read "name?  Your full name (used in commits): "
read "email?  Your email address (used in commits): "
read "signingkey?  GPG signing key ID (leave blank to skip): "
read "github_user?  GitHub username (leave blank to skip): "

{
  echo "[user]"
  echo "  name = $name"
  echo "  email = $email"
  [[ -n "$signingkey" ]] && echo "  signingkey = $signingkey"
  [[ -n "$github_user" ]] && echo ""
  [[ -n "$github_user" ]] && echo "[github]"
  [[ -n "$github_user" ]] && echo "  user = $github_user"
} > "$gitconfig_user"

echo ""
echo "[dotfiles] ~/.gitconfig.user created. You can edit it anytime at $gitconfig_user"
