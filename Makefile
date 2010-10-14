.PHONY ln: vimrc
	ln -fvs ~/.vim/vimrc ~/.vimrc
	vim -c 'helptags ~/.vim/bundle/surround/doc' -c 'qa!'
