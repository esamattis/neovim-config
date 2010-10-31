.PHONY install: vimrc
	ln -fvs ~/.vim/vimrc ~/.vimrc
	ln -fvs ~/.vim/gvimrc ~/.gvimrc
	vim -c 'call pathogen#helptags()' -c 'qa!'
