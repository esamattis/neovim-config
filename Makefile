all: update install

.PHONY install: vimrc
	chmod -v +x ~/.vim/bin/*
	ln -fvs ~/.vim/vimrc ~/.vimrc
	ln -fvs ~/.vim/gvimrc ~/.gvimrc
	~/.vim/bin/buildcommandt
	vim -c 'call pathogen#helptags()' -c 'qa!'
	vim -version || exit 0 

.PHONY update:
	git pull


