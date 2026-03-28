#!/usr/bin/env bash
set -e

fonts=(mononoki CascadiaMono)

case "$(uname -s)" in
  Darwin) font_dir="$HOME/Library/Fonts" ;;
  Linux)  font_dir="$HOME/.local/share/fonts" ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    exit 1
    ;;
esac

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

mkdir -p "$font_dir"

for font_name in "${fonts[@]}"; do
  echo "Downloading $font_name..."
  curl -fsSL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip" -o "$tmp_dir/$font_name.zip"
  unzip -o "$tmp_dir/$font_name.zip" '*.ttf' -d "$tmp_dir/$font_name"
  cp "$tmp_dir/$font_name"/*.ttf "$font_dir/"
done

if command -v fc-cache &>/dev/null; then
  fc-cache -f "$font_dir"
fi

echo "Fonts installed to $font_dir"
