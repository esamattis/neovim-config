all: update install

.PHONY install: vimrc
	chmod -v +x ~/.vim/bin/*
	ln -fvs ~/.vim/vimrc ~/.vimrc
	ln -fvs ~/.vim/gvimrc ~/.gvimrc
	vim -c 'call pathogen#helptags()' -c 'qa!'
	vim -version || exit 0
	@echo
	@echo "Cool all done!"
	@echo
	@echo "Install tmux/git/bash with 'cd ~/.vim && make friends'"


.PHONY update:
	git pull


.PHONY friends:
	ln -s .vim/others/tmux.conf ~/.tmux.conf || exit 0
	ln -s .vim/others/gitconfig ~/.gitconfig || exit 0
	echo "source ~/.vim/others/bashrc" >> ~/.bashrc
