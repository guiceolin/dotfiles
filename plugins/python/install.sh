git clone https://github.com/pyenv/pyenv.git ~/.pyenv

pyenv install -s 3.6.6
pyenv global 3.6.6

pip install --upgrade pip

pip install neovim
pip install virtualenv

pip install flake8
ln -s `pyenv which flake8` ~/.local/bin/flake8

ln -sf $(realpath "bin/venv") ~/.local/bin
