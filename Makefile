all: update install

.PHONY install: vimrc
	chmod +x ~/.vim/bin/*
	ln -fs ~/.vim/vimrc ~/.vimrc
	ln -fs ~/.vim/gvimrc ~/.gvimrc
	@echo
	@echo "Cool all done!"
	@echo
	@echo "Install tmux/git/bash with 'cd ~/.vim && make friends'"


.PHONY update:
	git pull


.PHONY friends:
	ln -s .vim/others/tmux.conf ~/.tmux.conf || exit 0
	ln -s .vim/others/gitconfig ~/.gitconfig || exit 0
	ln -s .vim/others/jshintrc ~/.jshintrc || exit 0
	echo "source ~/.vim/others/bashrc" >> ~/.bashrc
