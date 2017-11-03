# Install Mononoki font
mkdir -p /tmp/mononoki && pushd /tmp/mononoki
LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/ryanoasis/nerd-fonts/releases/latest|jq '.tag_name'|sed 's/"//g')
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST_VERSION/mononoki.zip"
unzip mononoki.zip
mv *.ttf ~/Library/Fonts/
rm -rf /tmp/mononoki && popd
