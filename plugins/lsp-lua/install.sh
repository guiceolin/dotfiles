if [ ! -d "./lua-language-server" ]; then
  git clone https://github.com/LuaLS/lua-language-server
  cd lua-language-server
  ./make.sh
  cd ..
fi

echo "exec \"$DOTFILES/plugins/lsp-lua/bin/lua-language-server\" \"$@\"" > ~/.local/bin/lua-language-server
chmod +x ~/.local/bin/lua-language-server
