GITDIR=$(CURDIR)/GIT
all:
	ln -s ${GITDIR}/.gitconfig ~/.gitconfig
	ln -s ${GITDIR}/.gitignore ~/.gitignore

clean:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore

force:
	make clean
	make all