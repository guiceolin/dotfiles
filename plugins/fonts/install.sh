#!/usr/bin/env bash
# Install Mononoki font
mkdir /tmp/fonts
cd /tmp/fonts

# loop throught array
for font_name in mononoki CascadiaMono
do
	curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
	unzip "$font_name".zip
done 

# TODO Check OS before cp fonts
mkdir -p ~/Library/Fonts/
cp ./*.ttf ~/Library/Fonts/
mkdir -p ~/.local/share/fonts/
cp ./*.ttf ~/.local/share/fonts/
sudo fc-cache -vf ~/.local/share/fonts

cd - && rm -rf /tmp/fonts
