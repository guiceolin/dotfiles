mkdir -p bin
curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > bin/diff-so-fancy
chmod +x bin/diff-so-fancy
ln -sf $(realpath bin/diff-so-fancy) ~/.local/bin/
