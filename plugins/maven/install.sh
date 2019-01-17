mkdir -p .cache
mkdir -p maven
wget -O ./.cache/apache-maven-3.3.9-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar -C maven --strip-components=1 -zxf ./.cache/apache-maven-3.3.9-bin.tar.gz apache-maven-3.3.9
ln -sf $(realpath "./maven") $HOME/.local/maven
rm -rf .cache
