all: update install

.PHONY install: vimrc
	chmod -v +x ~/.vim/bin/*
	ln -fvs ~/.vim/vimrc ~/.vimrc
	ln -fvs ~/.vim/gvimrc ~/.gvimrc
	~/.vim/bin/buildcommandt
	vim -c 'call pathogen#helptags()' -c 'qa!'
	vim -version || exit 0 

.PHONY colors:
	ln -fvs ~/.vim/Xresources ~/.Xresources
	xrdb -merge ~/.Xresources
	~/.vim/bin/set_light.sh


.PHONY update:
	git pull


.PHONY friends:
	ln -s .vim/others/tmux.conf ~/.tmux.conf || exit 0
	ln -s .vim/others/gitconfig ~/.gitconfig || exit 0
	echo "cat >> ~/.bashrc"
	echo "source ~/.vim/others/bashrc"
