#!/usr/bin/env bash
# Install Mononoki font
mkdir /tmp/mononoki && cd /tmp/mononoki

LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/ryanoasis/nerd-fonts/releases/latest|jq '.tag_name'|sed 's/"//g')
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST_VERSION/mononoki.zip"

unzip mononoki.zip
# TODO Check OS before cp fonts
mkdir -p ~/Library/Fonts/
cp ./*.ttf ~/Library/Fonts/
mkdir -p ~/.local/share/fonts/
cp ./*.ttf ~/.local/share/fonts/

cd - && rm -rf /tmp/mononoki
