GITDIR=$(CURDIR)/GIT
VIMDIR=$(CURDIR)/dotvim
all: git-install vim-install
clean: git-clean vim-clean
force: clean all

git-install:
	ln -s ${GITDIR}/.gitconfig ~/.gitconfig
	ln -s ${GITDIR}/.gitignore ~/.gitignore

git-clean:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore
vim-install:
	ln -s ${VIMDIR} ~/.vim
	ln -s ${VIMDIR}/vimrc ~/.vimrc
vim-clean:
	rm -f ~/.vimrc
	rm -rf ~/.vim
