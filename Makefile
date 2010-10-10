.PHONY ln: vimrc
	ln -fvs ~/.vim/vimrc ~/.vimrc
	vim -c 'helptags ~/.vim/doc' -c 'qa!'
