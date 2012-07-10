GITDIR=$(CURDIR)/GIT
VIMDIR=$(CURDIR)/dotvim
RUBYDIR=$(CURDIR)/RUBY
all: git-install vim-install ruby-install
clean: git-clean vim-clean ruby-clean
force: clean all

linux: all
	echo 'source ${CURDIR}/bash/lib.bash' >> ~/.bashrc
	echo 'source ${CURDIR}/bash/bash_profile' >> ~/.bashrc
macosx: all
	echo 'source ${CURDIR}/bash/lib.bash' >> ~/.bash_profile
	echo 'source ${CURDIR}/bash/bash_profile' >> ~/.bash_profile

git-install:
	ln -s ${GITDIR}/gitconfig ~/.gitconfig
	ln -s ${GITDIR}/gitignore ~/.gitignore

git-clean:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore

ruby-install:
	ln -s ${RUBYDIR}/gemrc ~/.gemrc
	ln -s ${RUBYDIR}/irbrc ~/.irbrc
ruby-clean:
	rm -f ~/.irbrc
	rm -f ~/.gemrc
vim-install:
	ln -s ${VIMDIR} ~/.vim
	ln -s ${VIMDIR}/vimrc ~/.vimrc
vim-clean:
	rm -f ~/.vimrc
	rm -rf ~/.vim
